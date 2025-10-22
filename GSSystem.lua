-- 游戏系统
--require "LogicDef"
--require "Form"
--require "GM"
--require "Trigger"
require "system/Lua_tools"
require("guild/Guild")
require("contact/Contact")

function System.OnSpeed(player, type, pct)
	sLuaApp:LuaErr("System.OnSpeed          player ============= " ..player:GetName().. "       type ================ " .. type .. "      pct ============= " .. pct)
	--最早需要检查多少秒前
	local longest_time = 60*60*1
	--多少次触发封禁交易
	local check_time = 2
	--多少次触发封账号
	local check_enable_forbid_time = 4

	if not Data["OnSpeedErr"] then
        Data["OnSpeedErr"] = {}
    end

	local user_id = player:GetUserId()
	local user_id_str = tostring(user_id)
	--记录时间
	if not Data["OnSpeedErr"][user_id_str] then
		Data["OnSpeedErr"][user_id_str] = {}
	end
	local record_tb = Data["OnSpeedErr"][user_id_str]
	
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	table.insert(Data["OnSpeedErr"][user_id_str], {now_sec, "player " ..player:GetName().. "type " .. type .. "pct " .. pct})

	local oldest_check_time =  now_sec - longest_time
    local i = 1
	while(record_tb[i]) do
		if record_tb[i][1] < oldest_check_time then
			table.remove(record_tb , i)
		else
			i = i + 1
		end
	end
	if i > check_time then
		sDBVarSystem:SetInt("SystemOnSpeedErr_"..user_id, 1, 2)
		player:SetInt("SystemOnSpeedErr", 1)
		sLuaApp:LuaErr("System.OnSpeed player "..player:GetName().." 在"..longest_time.."秒内触发了"..check_time.."次速度检测")

		if i > check_enable_forbid_time then
			local end_sec = now_sec + 60*60*24*3600
			local res = sLuaApp:EnableForbid(user_id, 5, sLuaApp:DateTime2Str(now_sec), sLuaApp:DateTime2Str(end_sec), "OnSpeedErr 账号封禁 在"..longest_time.."秒内触发了"..check_enable_forbid_time.."次速度检测")
			if not res then
				sLuaApp:LuaErr("OnSpeedErr EnableForbid 失败" )
				return
			end
			sLogServerSystem:LogToServer(0, player, "账号封禁", 0, end_sec, "OnSpeedErr 账号封禁", "在"..longest_time.."秒内触发了"..check_enable_forbid_time.."次速度检测")
		end

	end

	local now_time = sLuaApp:GetTimes()
	if player:GetInt("LastOverSpeed") then
		player:SetInt("LastOverSpeed",now_time)
		if now_time - player:GetInt("LastOverSpeed") < 20 then
			if not player:ForceKick("游戏速度异常", "疑似加速齿轮") then
				sLuaApp:LuaErr("踢出加速齿轮玩家失败，玩家："..player:GetName())
			end
		end
	end
end

function System.OnStart()
    --print("on start")
    local t = {4, test="测试中文", 5.5, 89, aa="imj测试一下uf8"}

    local s = json.encode(t)
    sLuaApp:LuaWrn(s)

    local tt = json.decode(s)
    sLuaApp:LuaWrn(tt["aa"])

	--开启服务器时加载所有角色染色方案表
	local RoleColorConfigTable = ColorConfig.GetTableData()
	if not System.RoleColorConfig then
		System.RoleColorConfig = {}

	end
	for k,v in pairs(RoleColorConfigTable) do
		if v.TempletId == 31 or v.TempletId == 32 or v.TempletId == 33 or
				v.TempletId == 34 or v.TempletId == 35 or v.TempletId == 36 or
				v.TempletId == 37 or v.TempletId == 38 or v.TempletId == 39 or
				v.TempletId == 40 or v.TempletId == 41 or v.TempletId == 42 then
			if not System.RoleColorConfig[k] then
				System.RoleColorConfig[k] = {}
				System.RoleColorConfig[k] = v
			end
		end
	end
	sVarSystem:SetString("RoleColorConfig",Lua_tools.serialize(System.RoleColorConfig))
	--sLuaApp:LuaDbg("System.RoleColorConfig........long"..#System.RoleColorConfig)
    --test()

    --assert(false, "aaaaa")

    --sLuaApp:LuaErr("游戏服务器开启了")
    --sLuaApp:ReloadLua(false, fasle)
    test_timer()
	

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "TianXiaHuiWu", "SyncSignState")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "Dungeon", "ShowTrace")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "DiscountSystem", "on_level_up")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "System", "on_level_up_ex")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "PlayerSkill", "OnLevelUp")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "PetSystem", "OnPlayerLevelUp")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "SwitchOnAward", "player_level_up")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "GradePresent", "on_player_levelup")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "PlayerLevelUp_CallBack", "on_player_levelup")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEVELUP, "SpiritualEquip", "RoleLevelUp")

    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_FIRST_LOGIN, "PlayerFirstLogin", "Main")
    -- 创建新角色，玩家首次登陆时，为此角色添加善恶值最大值自定义变量
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_FIRST_LOGIN, "PkRule_GoodAndEvil", "addMaxPkValueVariable")
    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_FIGHT_RESULT, "PlayerFightEnd", "Main")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PET_LEVELUP, "PetSystem", "OnPetLevelUp")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PET_CREATE, "PetSystem", "OnBorn")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_PET, "PetSystem", "on_add_pet")
	-- 战斗中上阵宠物前
	-- sTriggerSystem:AddTrigger(sSystem, TRIGGER_PRE_PET_FIGHTER_SUMMON_OUT, "PetLineup", "pre_pet_fighter_summon_out")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PET_FIGHTER_SUMMON_OUT, "PetLineup", "on_pet_fighter_summon_out")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GUARD_LEVELUP, "GuardSystem", "on_guard_levelup")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_GUARD, "GuardSystem", "on_add_guard")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_GUARD, "CultivationSkill", "on_add_guard")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_PET, "CultivationSkill", "on_add_pet")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_PET, "SevenDayCallBack", "Pet")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_ADD_EXP, "ServerLevel", "on_add_exp")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_EQUIP, "PlayerEquip", "on_pre_equip")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_UNEQUIP, "PlayerEquip", "on_pre_unequip")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_POST_EQUIP, "PlayerEquip", "on_post_equip")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_POST_UNEQUIP, "PlayerEquip", "on_post_unequip")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_POST_EQUIP, "System", "on_post_equip")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "System", "on_login")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "System", "on_login_ex")
	-- sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "EquipIntensify", "player_on_login")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "AttributeEnhance", "player_on_login")
	--sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "PetEgg", "on_player_login")
	--sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "SwitchOnAward", "player_login")
	--sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "GradePresent", "on_player_login")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "Marry", "OnLogin")
	--sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGIN, "System", "on_login")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_RELOGIN, "System", "on_relogin")
	

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ITEM_CREATE, "ItemSystem", "on_item_create")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ITEM_CREATE, "GemStone", "on_item_create")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ITEM_CREATE, "MingHunSystem", "on_item_create")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ITEM_DESTROY, "ItemSystem", "on_item_destroy")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_POST_SWAP_EQUIP, "EquipInherit", "on_post_swap_equip")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_JOIN_GUILD , "Guild", "on_join_guild")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_JOIN_GUILD , "SevenDayCallBack", "Guild")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_JOIN_GUILD, "System", "on_join_guild")
    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEAVE_GUILD, "Guild", "on_leave_guild")
    sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GUILD_JOB_CHANGED, "Guild", "on_guild_job_changed")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_SUB_INGOT, "VipExp", "on_sub_ingot")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_SUB_INGOT, "RechargeSystem", "on_player_useingot")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_SUB_INGOT, "SevenDayCallBack", "Expenditure")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PER_SET_TEAM_LEADER, "ActivityTeamSystem", "on_pre_set_team_leader")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_JOIN_TEAM, "ActivityTeamSystem", "on_join_team")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEAVE_TEAM, "ActivityTeamSystem", "on_leave_team")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_TEMP_LEAVE, "ActivityTeamSystem", "on_temp_leave")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_BILLIN, "RechargeSystem", "on_user_recharge")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_JOIN_TEAM, "SeatSystem", "on_join_team")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LEAVE_TEAM, "SeatSystem", "on_leave_team")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_GUARD, "System", "on_add_guard")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GUARD_LINEUP , "Guard", "OnLineup")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GUARD_CONTAINER , "Guard", "OnContainer")
		
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_POST_GUARD_CREATE , "GuardUpStar", "on_guard_create")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ADD_GUARD , "GuardSkill", "on_add_guard")

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PK_VALUE_MODIFY , "RankingListSystem", "on_pk_value_change")

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ENTER_MAP , "Movie_Play", "on_enter_map")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ENTER_MAP , "Movie_Play_Branch", "on_enter_map")

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_JUMP_MAP , "Guild", "on_pre_jump_map")

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_NPC_CREATE , "TianHeMuChang", "on_npc_create")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PASTURE_PET_TIMEOUT , "TianHeMuChang", "on_pasture_pet_time")

	-- 好友系统
		-- 组队时记录下队员，用于推荐好友
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_JOIN_TEAM , "FriendSystem", "OnJoinTeam2")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_JOIN_TEAM, "System", "on_join_team")
    	-- 角色退出时，删除组队记录的队员数据
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGOUT , "FriendSystem", "logoutDeleteTeamData")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_FIGHT_BEGIN , "System", "on_fight_begin")
	--成就系统
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_QUEST_FINISH,"System","on_quest_finish")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_ADD_PET, "System", "on_add_pet")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_NPC_SHOP_BUY,"System","on_npc_shop_buy")
	
	--密藏
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_QUEST_FINISH_EX,"SeasonPass","on_quest_finish_ex")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_ADD_INGOT,"SeasonPassQuestFunc","on_add_ingot")
	
	--装备战力提示和获取时装备强化
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_ADD_ITEM,"ItemSystem","on_player_additem")
	sTriggerSystem:AddTrigger(sSystem,TRIGGER_ON_PICKUP_MAIL,"ItemSystem","on_player_additem_bymail")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGOUT , "IntegralPK", "OnLogout")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGOUT , "System", "OnLogout")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_LOGOUT, "PVPActivityMatch", "Logout")
	
	--灵宝系统设置战斗buff动态属性
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_FIGHTBUFF_DYNDATA, "SpiritualEquip", "on_fightbuff_dyndata")

	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_WAREHOUSER_ADD_PET_PRE, "PetSystem", "on_warehouser_add_pet_pre")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_WAREHOUSER_DEL_PET_PRE, "PetSystem", "on_warehouser_del_pet_pre")

	-- 世界频道发言前回调
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_WORLD_CHAT, "WorldChatShieldWord", "trigger_on_pre_world_chat")

	--环任务随机物品和宠物回调
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GET_QUEST_RANDOM_ITEM, "Quest_ShiLi", "on_get_quest_random_item")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_GET_QUEST_RANDOM_PET, "Quest_ShiLi", "on_get_quest_random_pet")
	
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_PRE_DAMAGE, "FightAttr", "on_pre_damage")
	-- sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_APPLY_ITEM_TEST_ATTR_LIMIT, "ProduceMedicine", "on_apply_item_test_attr_limit")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_NPC_CREATE , "NPCChat", "on_npc_create")

	if AuctionSystem then
		AuctionSystem.on_system_start()
		AuctionSystem.StartSystemSell()
	end
	if RechargeSystem then
		RechargeSystem.SystemStart()
	end
	if Reincarnation then
		--Reincarnation.Initialization()
	end
	if Host then
		Host.on_system_start()
	end

	if TianTi then
		TianTi.on_system_start()
	end
	if ClothesSystem then
		ClothesSystem.GetIllusion()
	end
	sScheduleSystem:CreateSchedule(1, "00:00:00", "Lua_tools", "NewDayIntialization", "")
	System.CustomVarInitilization()
	if MountsSystem then
		MountsSystem.OnStart()
	end
	Act_QuestionWord.on_system_start()
	--if PlayerSkillSpell then
	--	PlayerSkillSpell.Initialization()
	--end
	--设置帮派人数
	local tb = {}
	table.insert(tb,GuildConfig.InitialPlayerNum)
	for k,v in pairs(GuildConfig.BuildingsConfig[2]['BuildingLevels']) do
		table.insert(tb,v.Param1)
	end
	for k,v in ipairs(tb) do
		sLuaApp:LuaWrn("k = "..k)
		sLuaApp:LuaWrn("v = "..v)
	end
	sGuildSystem:SetGuildLimit(1,tb)
	
	if Act_FirstDisciple then
		Act_FirstDisciple.On_Sys_Start()
	end

	if ExhibitionRoleNPC then
		ExhibitionRoleNPC.on_system_start()
	end
	
	if EquipChange then
		EquipChange.Initilization()
	end

	if Act_WorldBoss then
		sRanklistSystem:SetRanklistMaxSize(RankingListSystem.Config['世界BOSS排行榜'],Act_WorldBoss.RanklistMaxSize);
		Act_WorldBoss.refresh_npc()
	end
	
	if Data then
		Data.SystemStart = 1
		System.OnLoad()
	end
	
	if Guild then
		Guild.On_Sys_Start()
	end
	if Quest_ChuBaoAnLiang then
		sScheduleSystem:CreateSchedule(1,"00:01:00","Quest_ChuBaoAnLiang","On_Time","")
	end
	
    -- 每日八点善恶榜前十获得称号 任务
	if RankingListSystem and RankingListSystem.add_title_schedule then
		RankingListSystem.add_title_schedule()
	end

	if IntegralPK then 
		IntegralPK.OnServerStart()
	end

	--师徒数据兼容
	--if TeacherPupilSystem and TeacherPupilSystem.OldData then
	--	TeacherPupilSystem.OldData()
	--end

	--系统开启时设置是否显示侍从
	if Guard and Guard.OnStart then
		Guard.OnStart()
	end

	if Act_RankList then
		Act_RankList.Initialization()
	end
	
	--是否取物攻结算（true = 物攻   false = 物攻与法攻中更大的那个值）
	sFightSystem:SetGeneralAtkDamage(false)

	sVarSystem:SetInt("SystemStartTime", sLuaApp:SecondSinceEpoch(0))
	
	--记录首次开服的当天
	local StartStr = ConstVarConfig["StartServerTime"].Value
	local StartSec = sLuaApp:Str2DateTime(StartStr)
	local StartDay = sLuaApp:DaySinceEpoch(StartSec)
	sVarSystem:SetInt("ServerStartDay", StartDay)
	
	if EquipGem then
		EquipGem.SetMarks()
	end
	if EquipAttrClassify then
		EquipAttrClassify.SetIgnoreBasic()
	end

	if BagClassify then
		BagClassify.Initilization()
	end
	
    return false
end

function System.on_timer(timer_guid, id)
    sLuaApp:LuaWrn("on_timer: " .. timer_guid .. "---" .. id)
    local cancel = sLuaTimerSystem:DisableTimer(timer_guid)
    sLuaApp:LuaWrn("DisableTimer2: " .. (cancel and "true" or "false"))
end

function System.OnLogout(player)
	player:SetInt("LastLogoutTime", sLuaApp:SecondSinceEpoch(0))
	if PersonsActMatch then
		PersonsActMatch.Logout(player)
	end
	
	if Act_Chikings then
		Act_Chikings.PreLogout(player)
	end
	
	if Act_DiXiaMiTu then
		Act_DiXiaMiTu.Logout(player)
	end

	if Stall then
		Stall.Logout(player)
	end
	if ActivityGamble then
		ActivityGamble.Logout(player)
	end
end

function System.on_timer_ex(item, timer_guid, id)
    sLuaApp:LuaWrn("on_timer_ex: " .. timer_guid .. "---" .. id)
end

function test_timer()
    local timer_guid = sLuaTimerSystem:AddTimer(3 * 1000, 10, "System.on_timer", "timer")
    local has = sLuaTimerSystem:HasTimer(timer_guid)
    sLuaApp:LuaWrn("has_timer: " .. (has and "true" or "false"))
    -- local cancel = sLuaTimerSystem:DisableTimer(timer_guid)
    -- sLuaApp:LuaWrn("DisableTimer1: " .. (cancel and "true" or "false"))
end

function test()
    local a = bb / 100
end

local cc = 100 / 100

function System.test(arg1, arg2, arg3, arg4, arg5)
    Data.test = "abcedfg"
    sLuaApp:LuaInf(arg1)
    sLuaApp:LuaInf(arg2)
    sLuaApp:LuaInf(arg3)
    sLuaApp:LuaInf(arg4)
    sLuaApp:LuaInf(arg5)
    return true
end

--重连触发
function System.on_relogin(player)
	--sLuaApp:LuaErr("-------On Relogin")
	local player_type = player:GetType()
	if player_type ~= GUID_PLAYER then
		return
	end

	--时装
	if ClothesSystem then
		ClothesSystem.on_player_login(player)
	end

	--师徒
	if TeacherPupilSystem then
		TeacherPupilSystem.on_login(player)
	end

	if Movie_system and Movie_system.QuestRepair then
		Movie_system.QuestRepair(player)
	end
	--邀请码
	if FriendInvitation then
		FriendInvitation.Get_UKey(player)
	end

	if RechargeSystem then
		RechargeSystem.GetData(player, 0, "Recharge")
	end
end

--登录触发
function System.on_login(player)
	--sLuaApp:SetRoleOfflineTime(player, 60*60)
	--帮派任务判断
	sLuaApp:LuaDbg("On Login    aaa")
	local player_type = player:GetType()
	if player_type ~= GUID_PLAYER then
		return
	end
	if sQuestSystem:GetQuestState(player,8) == 3 then
		if sGuildSystem:GetGuildByPlayer(player) then
			sQuestSystem:ForceReady(player,8)
		end
	end
	Guild.on_login(player)
	Contact.on_login(player)
	RechargeSystem.on_login(player)
	DanLu.LoginGetItem(player)
	Dungeon.OnLogin(player)
	Lua_tools.ResetOnlineTimes(player)

	if SuitSys then
		SuitSys.set_dyn_attr(player)
	end
	sLuaApp:LuaDbg("On Login0")
	if Lua_tools then
		Lua_tools.Player_TimerPlusCheck(player)
	end
	-- 添加增加善恶值计时器，当善恶值小于0时，每15分钟增加一点善恶值，直到0为止
	if PkRule_GoodAndEvil then
		PkRule_GoodAndEvil.addReduceEvilTimer(player)
	end
	
	--引导
	if Guidance then
		Guidance.Login(player)
	end

	--时装
	if ClothesSystem then
		ClothesSystem.on_player_login(player)
	end

	--师徒
	if TeacherPupilSystem then
		TeacherPupilSystem.on_login(player)
	end

	if FormContact then
		-- 被好友删除 上线提醒
		FormContact._be_del_friend_login_remind(player)
		-- 好友上限提醒
		FormContact._friends_login_remind(player)
		-- 登陆游戏控制好友是否显示小红点
		FormContact.Login_Data(player)
	end

    -- 转移到 FormLogin 防止产生顺序问题导致数据为空报错 2021-8-16
	---- 发送侍从升星数据
	--if FormGuard then
	--	FormGuard.get_guard_up_star_data(player)
	--end
	--
    ---- 发送修炼技能等级
	--if FormCultivationSkill then
	--	FormCultivationSkill.get_skill_Level_limit(player)
	--end

	--发送邀请码
	if FriendInvitation then
		FriendInvitation.Get_UKey(player)
	end
    -- 每天删除赠送礼物次数
	if FriendSystem then
		FriendSystem.refresh_give_gift_count(player)
	end
	
	if Guild then
		Guild.player_on_login(player)
	end

	if Achievement then
		Achievement.CreateRemainPoint(player)
	end
	if Quest_ChuBaoAnLiang then
		Quest_ChuBaoAnLiang.On_Login(player)
	end
	if Movie_system and Movie_system.QuestRepair then
		Movie_system.QuestRepair(player)
	end
	--设置宠物的可见状态
	if FormPet then
		FormPet.GetPetCanSeeOnLogin(player)
	end
	--设置侍从的可见状态
	if FormGuard then
		FormGuard.GetGuardCanSeeOnLogin(player)
	end
	--设置他人队伍的可见状态
	if FormTeam then
		FormTeam.GetTeamCanSeeOnLogin(player)
	end
	
	if PlayerSetting then
		PlayerSetting.ResetChatLimit(player)
	end
	if EquipSpecialEffect then
		EquipSpecialEffect.on_login(player)
	end
	if WorldChatShieldWord then
		WorldChatShieldWord.on_login(player)
	end
	sLuaApp:LuaDbg("On Login")
end

function System.CustomVarInitilization()
	
	--系统内部使用
	sCustomVarSystem:SetBroadcastScope(0, "__title_guild_name", 3)
	sCustomVarSystem:SetBroadcastScope(0, "__title_spouse_name", 3)
	sCustomVarSystem:SetBroadcastScope(0, "__total_fight_value", 3)
	
	--玩家
	sCustomVarSystem:SetBroadcastScope(0, "ACTIVITY_GuildBattle_Camp", 2)
	sCustomVarSystem:SetBroadcastScope(0, "ACTIVITY_TITLE", 2)
	sCustomVarSystem:SetBroadcastScope(0, "GotFirstRecharge", 1)
	sCustomVarSystem:SetBroadcastScope(0, "TEAM_AutoRefuseApply", 1)
	sCustomVarSystem:SetBroadcastScope(0, "CONTACT_AutoRefuseApply", 1)
	sCustomVarSystem:SetBroadcastScope(0, "Act_Chikings_Hp", 1)
	sCustomVarSystem:SetBroadcastScope(0, "Act_Chickings_Bless", 1)
	sCustomVarSystem:SetBroadcastScope(0, "StrengStonLuck", 1)
	sCustomVarSystem:SetBroadcastScope(0, "ServerLevel_SaveExp", 1)
	sCustomVarSystem:SetBroadcastScope(0, "Mount_Model_DynJson1", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Model_DynJson1", 3)
	sCustomVarSystem:SetBroadcastScope(0, "PetLineup_SummonPetNum", 1)
	sCustomVarSystem:SetBroadcastScope(0, "PetLineup_SummonPetMax", 1)
	
	--活动特效显示
	sCustomVarSystem:SetBroadcastScope(0, "Activity_Effect_1", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Activity_Effect_2", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Activity_Effect_3", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Activity_Effect_4", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Activity_Effect_5", 2)
	
	sCustomVarSystem:SetBroadcastScope(0, "ADDPOINT_Auto", 1)
	sCustomVarSystem:SetBroadcastScope(0, "ADDPOINT_Method", 1)
	sCustomVarSystem:SetBroadcastScope(0, "AuctionSystem_AdderItemSelling", 1)
	sCustomVarSystem:SetBroadcastScope(0, "AuctionSystem_AdderPetSelling", 1)
	sCustomVarSystem:SetBroadcastScope(0, "GotFirstRecharge", 1)
	sCustomVarSystem:SetBroadcastScope(0, "FreeChangeOccu", 1)
	sCustomVarSystem:SetBroadcastScope(0, "CONTACT_AutoRefuseApply", 1)
	sCustomVarSystem:SetBroadcastScope(0, "ACTIVITY_ShuiLuDaHui_Pionts", 1)
	sCustomVarSystem:SetBroadcastScope(0, "ACTIVITY_FAILESHEILD", 1)
	sCustomVarSystem:SetBroadcastScope(0, "OpenLightLevel", 1)
	sCustomVarSystem:SetBroadcastScope(0, "LianQiAttr_Id", 1)
	sCustomVarSystem:SetBroadcastScope(0, "SevenDayScore", 1)
	sCustomVarSystem:SetBroadcastScope(0, "SevenDay_Over_time", 1)
	sCustomVarSystem:SetBroadcastScope(0, "ChanYiLunPanNowPos", 1)
	sCustomVarSystem:SetBroadcastScope(0, "SevenDaySwitch", 1) 
	sCustomVarSystem:SetBroadcastScope(0, "GemRewardLevel", 2) 
	sCustomVarSystem:SetBroadcastScope(0, "EquipRewardLevel", 2) 
	sCustomVarSystem:SetBroadcastScope(0, "Model_Clothes", 3) 
	sCustomVarSystem:SetBroadcastScope(0, "Model_Wing", 3)
	sCustomVarSystem:SetBroadcastScope(0, "WingGrow_Stage", 3)
	sCustomVarSystem:SetBroadcastScope(0, "Marry_SpouseName", 2)
	sCustomVarSystem:SetBroadcastScope(0, "Marry_SpouseGUID", 1)
	sCustomVarSystem:SetBroadcastScope(0, "Assist_AssistPoint", 1)
	sCustomVarSystem:SetBroadcastScope(0, "Assist_GoOn", 1)
	sCustomVarSystem:SetBroadcastScope(0, "DoubleExpPoint", 1)
	sCustomVarSystem:SetBroadcastScope(0, "FreezeDoubleExpPoint", 1)
	sCustomVarSystem:SetBroadcastScope(0, "attribute_gem_index", 1)
	sCustomVarSystem:SetBroadcastScope(0, "attribute_equip_index", 1)
		-- 玩家是否登记师徒 0 未登记 1 登记了师傅 2 登记了徒弟
	sCustomVarSystem:SetBroadcastScope(0,'TeacherSystem_Register',1)
	sCustomVarSystem:SetBroadcastScope(0, "TeacherName", 1)
	sCustomVarSystem:SetBroadcastScope(0, "PupilName_1", 1)
	sCustomVarSystem:SetBroadcastScope(0, "PupilName_2", 1)
		-- 玩家是否登记了相亲 0 未登记 1 已登记
	sCustomVarSystem:SetBroadcastScope(0,'is_register_blind_date',1)
	sCustomVarSystem:SetBroadcastScope(0,"EquipChange_FreeChangeNum_Weapon", 1)
	
	sCustomVarSystem:SetBroadcastScope(0,"EquipExploit", 1)
	sCustomVarSystem:SetBroadcastScope(0,"PetExploit", 1)
	sCustomVarSystem:SetBroadcastScope(0,"IntegralPK_RecordFightValue", 1)

	sCustomVarSystem:SetBroadcastScope(0,"PlayerStallSigns", 2)
	sCustomVarSystem:SetBroadcastScope(0,"Stall_Status", 2)
	sCustomVarSystem:SetBroadcastScope(0,"Stall_ShopIntroduce", 2)
	sCustomVarSystem:SetBroadcastScope(0,"Stall_OfflineTimeFree", 1)
	sCustomVarSystem:SetBroadcastScope(0,"Stall_OfflineTimeExtra", 1)
	sCustomVarSystem:SetBroadcastScope(0,"Stall_OfflineTimeSetUse", 1)
	sCustomVarSystem:SetBroadcastScope(0,"PlayerSkill_ChangeAllLevel", 1)
	sCustomVarSystem:SetBroadcastScope(0,"RegionTask_EscortEndTime", 2)
	sCustomVarSystem:SetBroadcastScope(0,"EquipPlan_WarehouseIndex", 1)
	
	--宠物
	sCustomVarSystem:SetBroadcastScope(1, "ADDPOINT_Method", 1)
	sCustomVarSystem:SetBroadcastScope(1, "ADDPOINT_Auto", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanUnlock", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_1", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_1", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_1", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_2", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_2", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_2", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_3", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_3", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_3", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_4", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_4", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_4", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_5", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_5", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_5", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_6", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_6", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_6", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_7", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_7", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_7", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_8", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_8", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_8", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_9", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_9", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_9", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_10", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_10", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_10", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillID_11", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_NeidanSkillRE_11", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearned_11", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_ArtificeTimes", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_ActSkillFields", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PET_SkillLearnMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "God_beast_skill", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetFlyUpLevel", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetStarLevel", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentHPMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentPhyAtkMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentMagAtkMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentPhyDefMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentMagDefMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "TalentSpeedMax", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_1", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_2", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_3", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_4", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_5", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetUpStar_Skill_6", 1)
	sCustomVarSystem:SetBroadcastScope(1, "PetEquip_HasTrinket", 2)
	sCustomVarSystem:SetBroadcastScope(1, "AutomaticCasting_PetSkillOrder", 1)
	sCustomVarSystem:SetBroadcastScope(1, "Model_DynJson1", 2)
	
	--侍从
	sCustomVarSystem:SetBroadcastScope(2, "Guard_Star", 3)
	sCustomVarSystem:SetBroadcastScope(2, "Attr_Add_Level", 1)
	sCustomVarSystem:SetBroadcastScope(2, "Attr_Add_AttrId", 1)
	sCustomVarSystem:SetBroadcastScope(2, "Attr_Add_AttrNum", 1)

end

function DumpData(data)
	print("Dump DATA:")
	for k, v in pairs(data) do
		if type(v) == "table" then
		    DumpData(v)
		else
			print("k:"..k..", v:"..tostring(v))
		end
	end
end

--sLuaApp:LuaSys(Data.test)
function System.OnLoad()
	if not Data then
		return
	end

	--DumpData(Data)

	if Data.SystemStart ~= 1 then
		return
	end
	if ActivitySystem then
		ActivitySystem.Initilization()
	end
	if DiscountSystem then
		DiscountSystem.Initialization()
	end
	if WordlessBook then
		WordlessBook.Initialization()
	end
	if IntegralPK then
		IntegralPK.Initialization()
	end
	if RechargeSystem then
		RechargeSystem.GetConstVarTime()
	end
	
	--脚本内的充值比例跟着后台设置，何姥爷说的 2022-08-24 14:47:08
	Lua_tools.RMBtoIngot = sLuaApp:GetBillInRate()
	sLuaApp:LuaErr("设置充值比例 Lua_tools.RMBtoIngot = "..sLuaApp:GetBillInRate())
end

function System.on_login_ex(player)
	System.active_player(player, 2, 0)
end

function System.on_level_up_ex(player, level)
	if Guidance then
		Guidance.OnLevelUp(player, level)
	end
	if Achievement then
		Achievement.Level_Up(player,level)
	end
	System.active_player(player, 3, 0)
	if LevelPackage then
		LevelPackage.Level_Up(player,level)
	end
	if Quest_ChuBaoAnLiang then
		Quest_ChuBaoAnLiang.On_Level_Up(player,level)
	end
	if SeasonPass then
		SeasonPass.RoleLevelUp(player)
	end
	if PlayerSetting.ResetChatLimit then
		PlayerSetting.ResetChatLimit(player)
	end
	if MountsSystem then
		MountsSystem.Level_Up(player,level)
	end
end

function System.active_player(player, request_type, times)
    local player_guid = sLuaApp:GUID32Str(player:GetGUID())
    local role_up_webDB = player:GetTempInt("role_up_webDB") + 600
    local cur_times = sLuaApp:Local2UTC(sLuaApp:GetTimes())
    if role_up_webDB > cur_times then
      return
    end

    local serverid = sLuaApp:GetZoneId()
    local accountid = player:GetUserId()
    local account_name = player:GetUserName()    
    local role_name = player:GetName()
    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    local job = player:GetAttr(ROLE_ATTR_JOB_1)
  
    local url = string.format("http://api.hzyotoy.com:8800/api/putroleinfo.do?type=%d&zoneid=%d&userid=%d&role_guid=%s&level=%d&role_name=%s&job=%d",
        request_type, serverid, accountid, player_guid, level, sLuaApp:URLEncode(role_name), job)  
    sLuaApp:GetURL(url, "System:do_nothing", player_guid, 30)  
  
    player:SetTempInt("role_up_webDB", cur_times)
    if times == 0 then
        sLuaApp:GetURL(url, "System:do_nothing_retry" .. request_type, player_guid, 30)
    else
        sLuaApp:GetURL(url, "System:do_nothing", player_guid, 30)
    end
end
  
function System.do_nothing_retry2(player_guid, errorcode, result)
    --sLuaApp:LuaWrn("do_nothing_retry2, param1="..player_guid..", param2="..tostring(errorcode)..", param3="..tostring(result)..".")
	local player = sPlayerSystem:GetPlayerByGUID(sLuaApp:Str32GUID(player_guid))
	if not player then
		return
	end

	if errorcode ~= 0 then
		System.active_player(player, 2, 1);  --重试登陆请求
	end
end

function System.do_nothing_retry3(player_guid, errorcode, result)
    --sLuaApp:LuaWrn("do_nothing_retry3, param1="..player_guid..", param2="..tostring(errorcode)..", param3="..tostring(result)..".")
	local player = sPlayerSystem:GetPlayerByGUID(sLuaApp:Str32GUID(player_guid))
	if not player then
		return
	end

	if errorcode ~= 0 then
		System.active_player(player, 3, 1);--重试升级请求
	end
end

function System.do_nothing(player_guid, errcode, result)
    --sLuaApp:LuaWrn("do_nothing, param1="..player_guid..", param2="..tostring(errorcode)..", param3="..tostring(result)..".")
	local player = sPlayerSystem:GetPlayerByGUID(sLuaApp:Str32GUID(player_guid))
	if not player then
		return
	end
end

function System.on_fight_begin(fighters,quest_id)
	if Act_Chikings then
		Act_Chikings.on_startfight(fighters)
	end
	--sLuaApp:LuaWrn("======================quest_id = "..tostring(quest_id))
	if Guidance then
		Guidance.OnFightBegin(fighters,quest_id)
	end
	if Act_DiXiaMiTu then
		Act_DiXiaMiTu.on_startfight(fighters)
	end
end

function System.on_join_guild(player,guid)
	if Achievement then
		Achievement.Achievement_Faction(player)
	end
end

function System.on_join_team(player)
	if Achievement then
		Achievement.Achievement_Team(player)
	end
	if FormTeam then
		FormTeam.OnSwitchTrackTeam(player)
	end
end

function System.on_add_pet(pet,player)
	if Achievement then
		Achievement.Achievement_GetPet(player)
	end
end

function System.on_npc_shop_buy(player,shop_id,item_id,item_amount)
	if Achievement then
		Achievement.Achievement_shop_buy(player,item_id)
	end
end

function System.on_quest_finish(player,quest_id,ring_num)
	if Achievement then
		Achievement.Mind_line_complete(player,quest_id,ring_num)
	end
end
function System.on_post_equip(player,item)
	if Achievement then
		Achievement.Equip_Achievement(player)
	end
end
function System.on_add_guard(Guard)
	if Achievement then
		local player = Guard:GetMaster()
		local GuardName = Guard:GetKeyName()
		Achievement.Achievement_Guard(player,GuardName,1)
	end
end