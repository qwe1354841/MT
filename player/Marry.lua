--结婚
Marry = {}
Marry.test = nil -- 测试游街级别用
--最小等级
Marry.MinLevel = 30
-- --要求好感度
-- Marry.Favor = 500
--婚礼级别对应结婚礼包
Marry.Grade = {
	{
		["Name"] = "普通婚礼", 
		["GiftKeyName"] = "普通结婚礼包", 
		["FireworksNum"] = 4, --结婚时每次烟花数量 和 游街时每次烟花数量
	
		["WalkConfig"] = {
			--车队人员配置 和 与车队原点的相对关系
						   --原点O
			-- ———————————————————————————————— X
							-- |
							-- |
							-- |
							-- |	
							-- |
							-- |
							-- |
							-- Y	  
			["PeopleConfig"] = {
				["婚礼游街-喜娘1"] = {0, 0},
				["婚礼游街-花车低级"] = {0,17},
				["婚礼游街-童男1"] = {-7,7},
				["婚礼游街-童女1"] = {7,7},
				["婚礼游街-送亲人1"] = {7,15},
				["婚礼游街-送亲人2"] = {-7,15},
			},
			--["PlayerView"] = "婚礼游街-花车低级",
			["PlayerView"] = "婚礼游街-喜娘1",
			--车队路径关键点（x,y）（车队原点的位置） 经过每个关键点时如果方向变化会预留足够时间让车队转向 --写死了在长安城
			["WayPoint"] = {{526,135},{490,154},{447,176},{416,191},{447,176},{490,154},{526,135},{552,118}},
			["WalkFireworksTime"] = 5, --每隔x秒放一次烟花
			
			["GiftNum"] = 10, --每次刷新红包数量
			["GiftRefreshTime"] = 6, --每隔x秒刷一次红包
			["GiftReward"] = { --红包内容 仅支持货币
				{MoneyType = 5, MoneyVal = 1000, Rand = 30},
				{MoneyType = 5, MoneyVal = 1111, Rand = 30},
				{MoneyType = 5, MoneyVal = 2000, Rand = 20},
				{MoneyType = 5, MoneyVal = 2222, Rand = 20},
				{MoneyType = 5, MoneyVal = 3000, Rand = 10},
				{MoneyType = 5, MoneyVal = 3333, Rand = 10},
			},
			
			--游街喊话
			["WalkTalk"] = {
				["婚礼游街-喜娘1"] = {
					{FixedTime = 1, Msg = "两姓联姻，一堂缔约，良缘永结，匹配同称。"},
					{FixedTime = 3, Msg = "看此日桃花灼灼，宜室宜家，卜他年瓜瓞绵绵，尔昌尔炽。"},
					{FixedTime = 5, Msg = "谨以白头之约，书向鸿笺，好将红叶之盟，载明鸳谱。"},
					{FixedTime = 7, Msg = "此证。"},
					{IntervalTime = 10, Msg = "祝新郎新娘，和和美美，恩爱百年！红包遍地，大家快来抢啊！"},
				},
			},
		},
	},
	{
		["Name"] = "优质婚礼", 
		["GiftKeyName"] = "优质结婚礼包", 
		["FireworksNum"] = 5, --结婚时每次烟花数量 和 游街时每次烟花数量
	
		["WalkConfig"] = {
			--车队人员配置 和 与车队原点的相对关系
			["PeopleConfig"] = {
				["婚礼游街-喜娘1"] = {0, 0},
				["婚礼游街-花车中级"] = {0,20},
				["婚礼游街-童男1"] = {-6,7},
				["婚礼游街-童女1"] = {6,7},
				["婚礼游街-童男2"] = {-10,7},
				["婚礼游街-童女2"] = {10,7},
				["婚礼游街-送亲人1"] = {9,12},
				["婚礼游街-送亲人2"] = {-9,12},
			},
			["PlayerView"] = "婚礼游街-喜娘1",
			--车队路径关键点（x,y）（车队原点的位置） 经过每个关键点时如果方向变化会预留足够时间让车队转向 --写死了在长安城
			["WayPoint"] = {
				{524,134},{490,154},{447,176},{416,191}, 
				{364,193},{317,199},{260,197},{235,196}, {244,158},{194,132},
				{244,158},{300,155},{320,155},{373,184},{399,195}, 
				{416,191},{444,176},{490,154},{526,135},{552,118}
			},
			--["WayPoint"] = {{292,148}, {241,190}, {266,210}, {352,177},{292,148},},
			["WalkFireworksTime"] = 5, --每隔x秒放一次烟花
			
			["GiftNum"] = 10, --每次刷新红包数量
			["GiftRefreshTime"] = 6, --每隔x秒刷一次红包
			["GiftReward"] = { --红包内容
				{MoneyType = 5, MoneyVal = 2000, Rand = 30},
				{MoneyType = 5, MoneyVal = 2222, Rand = 30},
				{MoneyType = 5, MoneyVal = 4000, Rand = 20},
				{MoneyType = 5, MoneyVal = 4444, Rand = 20},
				{MoneyType = 5, MoneyVal = 6000, Rand = 10},
				{MoneyType = 5, MoneyVal = 6666, Rand = 10},
			},
			
			--游街喊话
			["WalkTalk"] = {
				["婚礼游街-喜娘1"] = {
					{FixedTime = 1, Msg = "两姓联姻，一堂缔约，良缘永结，匹配同称。"},
					{FixedTime = 3, Msg = "看此日桃花灼灼，宜室宜家，卜他年瓜瓞绵绵，尔昌尔炽。"},
					{FixedTime = 5, Msg = "谨以白头之约，书向鸿笺，好将红叶之盟，载明鸳谱。"},
					{FixedTime = 7, Msg = "此证。"},
					{IntervalTime = 10, Msg = "祝新郎新娘，和和美美，恩爱百年！红包遍地，大家快来抢啊！"},
				},
			},
		},
	},
	{
		["Name"] = "豪华婚礼", 
		["GiftKeyName"] = "豪华结婚礼包", 
		["FireworksNum"] = 9, --结婚时每次烟花数量 和 游街时每次烟花数量
	
		["WalkConfig"] = {
			--车队人员配置 和 与车队原点的相对关系
			["PeopleConfig"] = {
				["婚礼游街-喜娘1"] = {0, 0},
				["婚礼游街-花车中级"] = {0,22},
				["婚礼游街-童男1"] = {-5,7},
				["婚礼游街-童女1"] = {5,7},
				["婚礼游街-童男2"] = {-10,7},
				["婚礼游街-童女2"] = {10,7},
				["婚礼游街-送亲人1"] = {9,12},
				["婚礼游街-送亲人2"] = {-9,12},
			},
			["PlayerView"] = "婚礼游街-喜娘1",
			--车队路径关键点（x,y）（车队原点的位置） 经过每个关键点时如果方向变化会预留足够时间让车队转向 --写死了在长安城
			["WayPoint"] = {
				{524,134},{490,154},{447,176},{416,191}, 
				{364,193},{317,199},{260,197},{235,196}, {244,158},{194,132},  
				{244,158},{300,155},{320,155},{341,164},{373,184},{399,195},
				{417,206},{415,243},{454,264},{499,291},
				{454,264},{415,243},{415,210},
				{416,191},{444,176},{490,154},{526,135},{552,118}
				},
			--["WayPoint"] = {{124,117},{107,122},{129,133},{146,117},{120,104}},
			["WalkFireworksTime"] = 5, --每隔x秒放一次烟花
			
			["GiftNum"] = 10, --每次刷新红包数量
			["GiftRefreshTime"] = 6, --每隔x秒刷一次红包
			["GiftReward"] = { --红包内容
				{MoneyType = 5, MoneyVal = 3000, Rand = 30},
				{MoneyType = 5, MoneyVal = 3333, Rand = 30},
				{MoneyType = 5, MoneyVal = 6000, Rand = 20},
				{MoneyType = 5, MoneyVal = 6666, Rand = 20},
				{MoneyType = 5, MoneyVal = 9000, Rand = 10},
				{MoneyType = 5, MoneyVal = 9999, Rand = 10},
			},
			
			--游街喊话
			["WalkTalk"] = {
				["婚礼游街-喜娘1"] = {
					{FixedTime = 1, Msg = "两姓联姻，一堂缔约，良缘永结，匹配同称。"},
					{FixedTime = 3, Msg = "看此日桃花灼灼，宜室宜家，卜他年瓜瓞绵绵，尔昌尔炽。"},
					{FixedTime = 5, Msg = "谨以白头之约，书向鸿笺，好将红叶之盟，载明鸳谱。"},
					{FixedTime = 7, Msg = "此证。"},
					{IntervalTime = 10, Msg = "祝新郎新娘，和和美美，恩爱百年！红包遍地，大家快来抢啊！"},
				},
			},
		},
	},
}
--转向等待时间 毫秒
Marry.WalkTurnRoundTime = 3500
--直行额外等待时间 毫秒
Marry.WalkStraightExtraTime = 2000
--移动速度 ？毫秒 走一个逻辑格
Marry.WalkSpeed = 100

--红包keyname
Marry.GiftItemKeyName = "结婚红包1"
--红包存在时间 秒
Marry.GiftExistTime = 200
--进度条时间(毫秒)
Marry.ProgressBarTime = 3000
--#进度条提示
Marry.ProgressBarTip = "红包打开中..."
--每天最多捡红包数量
Marry.GetGiftMaxNum = 15
--最小捡红包等级
Marry.GiftMinLevel = 0

--全服通告的间隔时间（秒）
Marry.AllMsgTime = 30

--夫妻称号	--{夫，妻，离}
Marry.Title = {"夫君", "娘子", "双证齐全"}
--夫妻技能 
Marry.Skill = {"情比金坚", "生死与共"}

--新郎新娘npc
Marry.WeddingNPC = {"结婚-新郎", "结婚-新娘"}
--夫妻对拜点         
Marry.WeddingPoint = {{449,99}, {454,97}}
--婚礼流程  --动作开始时间（秒） 夫朝向，妻朝向，夫动作，妻动作，红娘台词
Marry.WeddingConfig = {
	{Time = 0, HusbandDirection = 1, WifeDirection = 5, HusbandAction = "WAVE", WifeAction = "WAVE", HusbandMsg = "", WifeMsg = "", MatchmakerMsg = "香烟飘渺，灯烛辉煌，新郎新娘齐登花堂",},
	{Time = 4, HusbandDirection = 3, WifeDirection = 3, HusbandAction = "WAVE", WifeAction = "WAVE", HusbandMsg = "", WifeMsg = "", MatchmakerMsg = "一拜天地",},
	{Time = 8, HusbandDirection = 7, WifeDirection = 7, HusbandAction = "WAVE", WifeAction = "WAVE", HusbandMsg = "", WifeMsg = "", MatchmakerMsg = "二拜高堂",},
	{Time = 12, HusbandDirection = 1, WifeDirection = 5, HusbandAction = "WAVE", WifeAction = "WAVE", HusbandMsg = "", WifeMsg = "", MatchmakerMsg = "夫妻对拜",},
	--{Time = 16, HusbandDirection = 1, WifeDirection = 5, HusbandAction = "", WifeAction = "", HusbandMsg = "#214", WifeMsg = "#218", MatchmakerMsg = "你们已经正式结为夫妻，祝你们幸福美满，白头到老。",},
	{Time = 16, HusbandDirection = 1, WifeDirection = 5, HusbandAction = "", WifeAction = "", HusbandMsg = ":)", WifeMsg = ":)", MatchmakerMsg = "你们已经正式结为夫妻，祝你们幸福美满，白头到老。",},
	{Time = 20, EndWedding = 1},
}
Marry.MatchmakerNPC = "长安城-红娘"
--放烟花和撒币的范围
Marry.FireworksRange = 10

--离婚消耗
Marry.Divorce = {
	{
		["Name"] = "协议离婚", --显示在npc对话选项上
		["Type"] = "协议", --协议离婚 --需夫妻组队 --消耗货币
		["Consume"] = {
			MoneyType = 5,
			MoneyVal = 88888,
		},
	},
	{
		["Name"] = "直接离婚",
		["Type"] = "直接", --强制离婚 --单人提出 --消耗物品
		["Consume"] = {
			ItemKeyName = "休书", 
		},
	},
}

function Marry.AgreementDivorce(player_1, player_2, need_money_type, need_money_val)
	local team = player_1:GetTeam()
	if not team then		
		return
	end
	local team_members = team:GetTeamMembers(true)
	if #team_members ~= 2 then
		return
	end
	local spouse_unid = sPlayerSystem:GetSpouse(team_members[1])
	if spouse_unid ~= team_members[2]:GetUNID() then
		return
	end
	--扣钱
	if not Lua_tools.IsMoneyEnough(player_1, need_money_type, need_money_val) then
		sLuaApp:NotifyTipsMsg(player_1, "离婚所需"..Lua_tools.GetMoneyName(need_money_type).."不足")
		return
	end
	if not Lua_tools.IsMoneyEnough(player_2, need_money_type, need_money_val) then
		sLuaApp:NotifyTipsMsg(player_2, "离婚所需"..Lua_tools.GetMoneyName(need_money_type).."不足")
		return
	end
	Lua_tools.SubMoney(player_1, need_money_type, need_money_val, "system", "离婚", "离婚消耗")
	Lua_tools.SubMoney(player_2, need_money_type, need_money_val, "system", "离婚", "离婚消耗")
	--设置离婚
	if not sPlayerSystem:ResetSpouse(player_1) then
		sLuaApp:LuaErr("Marry.DirectDivorce  ResetSpouse 错误")
	end
	--清buff
	Marry.DelBuff(player_1)
	Marry.DelBuff(player_2)
	
	sLuaApp:NotifyTipsMsgEx(player_1, "离婚成功")
	sLuaApp:NotifyTipsMsgEx(player_2, "离婚成功")
end

function Marry.DirectDivorce(player, item_keyname)
	--扣物品
	local need_item_list = {item_keyname,1}
	if Lua_tools.IsItemEnough(player, need_item_list) then
		local item_id = sItemSystem:GetItemIdByKeyname(item_keyname)
		if sItemSystem:ConsumeItemWithPriority(player, item_id, 1, true, "system", "离婚", "离婚消耗")["code"] ~= 0 then
			sLuaApp:LuaErr("Marry.DirectDivorce  ConsumeItemWithPriority 错误")
			return
		end
	else
		if OneKeyBuy then
			OneKeyBuy.Main(player, need_item_list)
		else
			sLuaApp:NotifyTipsMsg(player, "离婚所需物品不足")
		end
	end
	local spouse_unid = sPlayerSystem:GetSpouse(player)
	--设置离婚
	if not sPlayerSystem:ResetSpouse(player) then
		sLuaApp:LuaErr("Marry.DirectDivorce  ResetSpouse 错误")
	end
	--清buff
	Marry.DelBuff(player)
	sLuaApp:NotifyTipsMsgEx(player, "离婚成功")
	
	local spouse_player = sPlayerSystem:GetPlayerByUNID(spouse_unid)
	if spouse_player then
		local spouse_name =  spouse_player:GetString("Marry_SpouseName")
		--清buff
		Marry.DelBuff(spouse_player)
		local sex = player:GetAttr(ROLE_ATTR_GENDER)
		sLuaApp:NotifyTipsMsgEx(spouse_player, "您的"..(sex == 1 and "夫君" or "娘子")..spouse_name.."已与您离婚，人生有梦，各自精彩。")
	end
end

function Marry.DelBuff(player)
	--清技能
	local player_skill_con = player:GetSkillContainer()
	for _,v in ipairs(Marry.SkillId) do
		local has_skill = player_skill_con:GetSkill(v)
		if has_skill then
			player_skill_con:DestroySkill(has_skill,true)
		end
	end
	--清称号和配偶名字
	if sTitleSystem:HasTitle(player, Marry.TitleId[1]) then
		if sTitleSystem:DelTitle(player, Marry.TitleId[1]) ~= 0 then
			sLuaApp:LuaErr(" Marry.DelBuff  DelTitle 错误")
		end
	end
	if sTitleSystem:HasTitle(player, Marry.TitleId[2]) then
		if sTitleSystem:DelTitle(player, Marry.TitleId[2]) ~= 0 then
			sLuaApp:LuaErr(" Marry.DelBuff  DelTitle 错误")
		end
	end
	-- +离婚称号
	if not sTitleSystem:HasTitle(player, Marry.TitleId[3]) then
		if sTitleSystem:AddTitle(player, Marry.TitleId[3]) ~= 0 then
			sLuaApp:LuaErr(" Marry.DelBuff  DelTitle 错误")
		end
	end
	
	player:SetString("Marry_SpouseName", "")
	player:SetString("Marry_SpouseGUID", "")
end


function Marry.StartMarry(player, grade_index, item_keyname)
	local res_check_team = MarryNPC.CheckTeam(player)
	if not res_check_team[1] then
		sLuaApp:NotifyTipsMsg(player, res_check_team[2])
		return
	end
	--消耗结婚礼包
	local need_item_list = {item_keyname,1}
	if Lua_tools.IsItemEnough(player, need_item_list) then
		local item_id = sItemSystem:GetItemIdByKeyname(item_keyname)
		if sItemSystem:ConsumeItemWithPriority(player, item_id, 1, true, "system", "结婚", "结婚消耗")["code"] ~= 0 then
			sLuaApp:LuaErr("Marry.StartMarry  ConsumeItemWithPriority 错误")
			return
		end
	else
		if OneKeyBuy then
			OneKeyBuy.Main(player, need_item_list)
		else
			sLuaApp:NotifyTipsMsg(player, "结婚所需物品不足")
		end
	end

	--设置结婚
	local team = player:GetTeam()
	local team_members = team:GetTeamMembers(false)
	if sPlayerSystem:SetSpouse(player, team_members[2]) then
		-- 结婚时从相亲榜单删除数据
		if FriendSystem then
			FriendSystem.married_del(player, team_members[2])
		end
	else
		sLuaApp:LuaErr("Marry.StartMarry  SetSpouse 错误")
		return
	end
	local husband = player
	local wife = team_members[2]
	if player:GetAttr(ROLE_ATTR_GENDER) == 2 then
		husband,wife = wife,husband
	end
	--清除同意结婚标记
	husband:SetInt("Marry_AgreeMarry", 0)
	wife:SetInt("Marry_AgreeMarry", 0)

	--记录对象guid 夫妻技能用
	husband:SetString("Marry_SpouseGUID", tostring(wife:GetGUID()))
	wife:SetString("Marry_SpouseGUID", tostring(husband:GetGUID()))
	--获得技能
	local husband_skill_con = husband:GetSkillContainer()
	if not husband_skill_con:CreateSkill(Marry.SkillId[1],1,1,true) then
		sLuaApp:LuaErr("Marry.StartMarry CreateSkill 错误")
		return
	end
	
	local wife_skill_con = wife:GetSkillContainer()
	if not wife_skill_con:CreateSkill(Marry.SkillId[2],1,1,true) then
		sLuaApp:LuaErr("Marry.StartMarry CreateSkill 错误")
		return
	end
	--获得称号
	if sTitleSystem:AddTitle(husband, Marry.TitleId[1]) ~= 0 then
		sLuaApp:LuaErr("Marry.StartMarry AddTitle 错误")
		return
	end
	husband:SetString("Marry_SpouseName", wife:GetName())
	if sTitleSystem:SetCurTitle(husband, Marry.TitleId[1]) ~= 0 then
		sLuaApp:LuaErr("Marry.StartMarry SetCurTitle 错误")
		return
	end
	if sTitleSystem:AddTitle(wife, Marry.TitleId[2]) ~= 0 then
		sLuaApp:LuaErr("Marry.StartMarry AddTitle 错误")
		return
	end
	wife:SetString("Marry_SpouseName", husband:GetName())
	if sTitleSystem:SetCurTitle(wife, Marry.TitleId[2]) ~= 0 then
		sLuaApp:LuaErr("Marry.StartMarry SetCurTitle 错误")
		return
	end
	
	
	Marry.StartWedding(husband, wife, grade_index)
end

function Marry.StartWedding(husband, wife, grade_index)
	--设置婚礼品级
	sVarSystem:SetInt("Marry_NowWeddingGrade", grade_index)
	--设置有婚礼进行
	sVarSystem:SetInt("Marry_IsWedding",1)
	--设置为婚礼中状态
	sVarSystem:SetInt("Marry_IsWeddingPlayer_1", husband:GetGUID())
	sVarSystem:SetInt("Marry_IsWeddingPlayer_2", wife:GetGUID())
	--全服通告
	local husband_name = husband:GetName()
	local wife_name = wife:GetName()
	local grade_name = Marry.Grade[grade_index]["Name"]
	Marry.StartMsgToAll(husband_name, wife_name, grade_name)
	--通知所有好友
	Marry.SendFriendMsg(husband)
	Marry.SendFriendMsg(wife)
	--创建新郎新娘npc
	local map = sMapSystem:GetMapByKey("长安城")
	local husband_npc_data = NpcConfig.GetByKeyName(Marry.WeddingNPC[1])
	if not husband_npc_data then
		sLuaApp:LuaErr("Marry.StartWedding  不存在 husband_npc_data")
		return 
	end
	local husband_npc = sNpcSystem:CreateNpc(husband_npc_data.Id, map, Marry.WeddingPoint[1][1], Marry.WeddingPoint[1][2], 0, 1, 0)
	local husband_npc_guid = husband_npc:GetGUID()
	if husband_npc then
		sVarSystem:SetInt("Marry_IsWeddingNPC_1", husband_npc_guid)
	else
		sLuaApp:LuaErr("Marry.StartWedding  CreateNpc失败")
		return 
	end
	local wife_npc_data = NpcConfig.GetByKeyName(Marry.WeddingNPC[2])
	if not wife_npc_data then
		sLuaApp:LuaErr("Marry.StartWedding  不存在 wife_npc_data")
		return 
	end
	local wife_npc = sNpcSystem:CreateNpc(wife_npc_data.Id, map, Marry.WeddingPoint[2][1], Marry.WeddingPoint[2][2], 0, 5, 0)
	local wife_npc_guid = wife_npc:GetGUID()
	if wife_npc then
		sVarSystem:SetInt("Marry_IsWeddingNPC_2", wife_npc_guid)
	else
		sLuaApp:LuaErr("Marry.StartWedding  CreateNpc失败")
		return 
	end
	--设置玩家无法移动 隐身
	if not (husband:ForbidMove(true) and wife:ForbidMove(true)) then
		sLuaApp:LuaErr("Marry.StartWedding ForbidMove 错误")
		return
	end
	if not (husband:ForbidJump(true) and wife:ForbidJump(true)) then
		sLuaApp:LuaErr("Marry.StartWedding ForbidJump 错误")
		return
	end
	local team_leader = husband:IsTeamLeader() and husband or wife
	team_leader:Ghost(true)

	--设置侍从隐身
	Marry.SetGuardShow(team_leader, false)
	
	--锁定玩家视角到npc上 --设置自身隐身
	local husband_str = [[
		CL.SetCameraTarget(']]..husband_npc_guid..[[')
		CL.SetRoleVisible(false, 0)
	]]
	sLuaApp:ShowForm(husband, "脚本表单", husband_str)
	local wife_str = [[
		CL.SetCameraTarget(']]..wife_npc_guid..[[')
		CL.SetRoleVisible(false, 0)
	]]
	sLuaApp:ShowForm(wife, "脚本表单", wife_str)
	--sLuaApp:LuaErr(wife_str)
	--设置定时器 播放动作
	for k,v in ipairs(Marry.WeddingConfig) do
		if v["Time"] <= 0 then
			Marry.WeddingProcedure(0, k)
		end
		sLuaTimerSystem:AddTimer(v["Time"]*1000, 1, "Marry.WeddingProcedure", ""..k)
	end

end

function Marry.WeddingProcedure(t_guid, procedure_index)
	procedure_index = tonumber(procedure_index)
	local procedure_config = Marry.WeddingConfig[procedure_index]
	
	local husband_npc_guid = sVarSystem:GetInt("Marry_IsWeddingNPC_1")
	local wife_npc_guid = sVarSystem:GetInt("Marry_IsWeddingNPC_2")
	local husband_npc = sNpcSystem:GetNpcByGUID(husband_npc_guid)
	local wife_npc = sNpcSystem:GetNpcByGUID(wife_npc_guid)
	
	
	--判断结束婚礼 开始游街
	if procedure_config["EndWedding"] and procedure_config["EndWedding"] == 1 then
		Marry.EndWedding(husband_npc, wife_npc)
		Marry.StartWalk()
		return
	end
	--朝向 动作 台词
	local str = ""
	
	--{Time = 0, HusbandDirection = 1, WifeDirection = 5, HusbandAction = 0, WifeAction = 0, HusbandMsg = "", WifeMsg = "", MatchmakerMsg = "香烟飘渺，灯烛辉煌，新郎新娘齐登花堂",},
	local husband_dir = procedure_config["HusbandDirection"] or 0
	str = str..[[CL.SetRoleDir(]]..husband_dir..[[,TOOLKIT.Str2uLong("]].. husband_npc_guid..[["))]]
	local wife_dir = procedure_config["WifeDirection"] or 0
	str = str..[[CL.SetRoleDir(]]..wife_dir..[[,TOOLKIT.Str2uLong("]].. wife_npc_guid..[["))]]
	
	
	local husband_action = procedure_config["HusbandAction"]
	if husband_action and husband_action ~= "" then
		str = str ..[[CL.PlayRoleAni(eRoleMovement.]]..husband_action..[[,TOOLKIT.Str2uLong("]]..husband_npc_guid..[["), false)]]
	end
	local wife_action = procedure_config["WifeAction"]
	if wife_action and wife_action ~= "" then
		str = str ..[[CL.PlayRoleAni(eRoleMovement.]]..wife_action..[[,TOOLKIT.Str2uLong("]]..wife_npc_guid..[["), false)]]
	end
	
	
	local husband_msg = procedure_config["HusbandMsg"]
	if husband_msg and husband_msg ~= "" then
		local husband_name = husband_npc:GetName()
		--sLuaApp:LuaErr("husband_name"..husband_name)
		str = str..[[CL.SendNotify(NOTIFY.TalkBubble,1, "]]..husband_msg..[[","]]..husband_name..[[",0)]]
	end
	local wife_msg = procedure_config["WifeMsg"]
	if wife_msg and wife_msg ~= "" then
		local wife_name = wife_npc:GetName()
		str = str..[[CL.SendNotify(NOTIFY.TalkBubble,1, "]]..wife_msg..[[","]]..wife_name..[[",0)]]
	end
	if procedure_config["MatchmakerMsg"] and procedure_config["MatchmakerMsg"] ~= "" then
		local npc_data = NpcConfig.GetByKeyName(Marry.MatchmakerNPC)
		if not npc_data then
			sLuaApp:LuaErr("Marry.WeddingProcedure NPCConfig不存在"..Marry.MatchmakerNPC)
			return
		end
		local matchmaker_name = npc_data.Name
		--sLuaApp:LuaErr("matchmaker_name"..matchmaker_name)
		str = str..[[CL.SendNotify(NOTIFY.TalkBubble,1, "]]..procedure_config["MatchmakerMsg"]..[[","]]..matchmaker_name..[[",0)]]
	end
	
	local map = sMapSystem:GetMapByKey("长安城")
	local x = Marry.WeddingPoint[2][1]
	local y = Marry.WeddingPoint[2][2]
	
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
	--放烟花--撒币
	local wedding_grade = sVarSystem:GetInt("Marry_NowWeddingGrade")
	local fire_works_num = Marry.Grade[wedding_grade]["FireworksNum"]
	if fire_works_num and fire_works_num > 0 then
		for i = 1, fire_works_num do
			local point_tb = sMapSystem:GetRandomPoint(map, x, y, Marry.FireworksRange)
			Marry.SmallFireworks(map, point_tb["x"], point_tb["y"])
		end
	end
end

function Marry.EndWedding(husband_npc, wife_npc)
	--销毁新郎新娘npc
	sNpcSystem:DestroyNpc(husband_npc)
	sNpcSystem:DestroyNpc(wife_npc)
end


function Marry.GetWeddingPlayer()
	local husband_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_1")
	local husband = nil
	if husband_guid ~= 0 then
		husband = sPlayerSystem:GetPlayerByGUID(husband_guid)
	end
	local wife_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_2")
	local wife = nil
	if wife_guid ~= 0 then
		wife = sPlayerSystem:GetPlayerByGUID(wife_guid)
	end
	return husband, wife
end

function Marry.StartWalk()
	local map = sMapSystem:GetMapByKey("长安城")
	--local map = sMapSystem:GetMapByKey("酆都")
	--创建npc
	local wedding_grade = sVarSystem:GetInt("Marry_NowWeddingGrade")
	wedding_grade= Marry.test or wedding_grade --XXXXXXXXXXXXX
	local walk_config = Marry.RealPoint[wedding_grade]
	local walk_dir_config = Marry.RealPointDir[wedding_grade]
	local all_npc_tb = {}
	for k,v in pairs(walk_config[1]) do
		local npc_data = NpcConfig.GetByKeyName(k)
		if not npc_data then
			sLuaApp:LuaErr("Marry.StartWalk NPCConfig不存在"..k)
			return
		end
		local npc_id = npc_data.Id
		local npc = sNpcSystem:CreateNpc(npc_id, map, v[1], v[2], 1, walk_dir_config[1][1], 0)
		if npc then
			all_npc_tb[k] = npc
			--设置npc移速
			npc:SetMoveSpeed(Marry.WalkSpeed or 60)
		end
	end
	
	-- 设置放烟花和撒币
	local wedding_grade_config = Marry.Grade[wedding_grade]
	local wedding_walk_config = wedding_grade_config["WalkConfig"]
	
	local player_view_npc = all_npc_tb[wedding_walk_config["PlayerView"]]
	sVarSystem:SetInt("Marry_PlayerViewNPC", player_view_npc:GetGUID())
	
	local interval_time = wedding_walk_config["WalkFireworksTime"]
	local fire_works_num = wedding_grade_config["FireworksNum"]
	if fire_works_num and fire_works_num > 0 and player_view_npc then
		sLuaTimerSystem:AddTimerEx(player_view_npc, interval_time * 1000, 500,"Marry.WalkFireworks", ""..fire_works_num)
	end
	
	local gift_num = wedding_walk_config["GiftNum"]
	local gift_refresh_time = wedding_walk_config["GiftRefreshTime"]
	if gift_num and gift_refresh_time and Marry.GiftExistTime and player_view_npc then
		sLuaTimerSystem:AddTimerEx(player_view_npc, gift_refresh_time * 1000, 500,"Marry.WalkGift", ""..gift_num)
	end
	
	--设置喊话
	local walk_talk_config = wedding_walk_config["WalkTalk"]
	for k,v in pairs(walk_talk_config) do
		if all_npc_tb[k] then
			for _,b in ipairs(v) do
				if b["FixedTime"] and b["Msg"] then
					sLuaTimerSystem:AddTimerEx(all_npc_tb[k], b["FixedTime"] * 1000, 1,"Marry.WalkNPCTalk", b["Msg"])
				elseif b["IntervalTime"] and b["Msg"] then
					sLuaTimerSystem:AddTimerEx(all_npc_tb[k], b["IntervalTime"] * 1000, 500,"Marry.WalkNPCTalk", b["Msg"])
				end
			end
		end
	end
	
	local husband, wife = Marry.GetWeddingPlayer()
	
	--设置行动路线
	local now_time = 2000
	for i = 2, #walk_config do
		local call_dir = -1
		if walk_dir_config[i][1] ~= walk_dir_config[i-1][1] then
			call_dir = walk_dir_config[i][1]
		end
		for k,v in pairs(walk_config[i]) do
			local npc = all_npc_tb[k]
			if npc then
				sLuaTimerSystem:AddTimerEx(npc, now_time,1,"Marry.NPCMove", v[1]..","..v[2]..","..call_dir)
				-- --设置新郎新娘跟着花车移动 否则地图没有加载
				-- if k == wedding_walk_config["PlayerView"] then
					-- if husband then
						-- sLuaTimerSystem:AddTimerEx(husband, now_time -300,1,"Marry.PlayerMove", v[1]..","..v[2])
					-- end
					-- if wife then
						-- sLuaTimerSystem:AddTimerEx(wife, now_time -300,1,"Marry.PlayerMove", v[1]..","..v[2])
					-- end
				-- end
			end
		end
		
		now_time = now_time + walk_dir_config[i][2]
		--sLuaApp:LuaErr("now_time  "..now_time)
		
	end
	--设置清除npc
	for _,v in pairs(all_npc_tb) do
		sLuaTimerSystem:AddTimerEx(v, now_time + 5000,1,"Marry.DestroyNPC", "")
	end
	--设置结束游街
	sLuaTimerSystem:AddTimer(now_time + 7000,1,"Marry.EndWalk", "")

	-- 传送玩家到指定位置
	local player_x = sMapSystem:GetPosX(player_view_npc)
	local player_y = sMapSystem:GetPosY(player_view_npc)
	if husband then
		local res = sMapSystem:Jump(husband, map, player_x, player_y, 1)
		sLuaApp:LuaErr(husband:GetName() .. "jump"..tostring(res)..player_x.."  "..player_y)
		--设置侍从隐身
		Marry.SetGuardShow(husband, false)
	end
	if wife then
		local res = sMapSystem:Jump(wife, map, player_x, player_y, 1)
		sLuaApp:LuaErr(wife:GetName() .. "jump"..tostring(res)..player_x.."  "..player_y)
		Marry.SetGuardShow(wife, false)
	end
	--锁定玩家视角到花车上
	local player_view_npc_guid = player_view_npc:GetGUID()
	local str = [[
		CL.SetCameraTarget(']]..player_view_npc_guid..[[')
	]]
	if husband then
		sLuaApp:ShowForm(husband, "脚本表单", str)
	end
	if wife then
		sLuaApp:ShowForm(wife, "脚本表单", str)
	end

	
	--发红包啦 特效
	local hb_str = [[
		GUI.OpenWnd("PlayScreenEffectUI","MarriageEffect")
	]]
	sLuaApp:ShowFormToAll("脚本表单", hb_str)
end

function Marry.NPCMove(npc, timer, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	--sLuaApp:LuaErr("Move "..tmp_tb[1].." "..tmp_tb[2])
	sMapSystem:Move(npc, tmp_tb[1], tmp_tb[2])
	
	if npc:GetGUID() == sVarSystem:GetInt("Marry_PlayerViewNPC") then
		local player_1 = sPlayerSystem:GetPlayerByGUID(sVarSystem:GetInt("Marry_IsWeddingPlayer_1"))
		if player_1 then
			Marry.PlayerMove(player_1, timer, params)
		end
		local player_2 = sPlayerSystem:GetPlayerByGUID(sVarSystem:GetInt("Marry_IsWeddingPlayer_2"))
		if player_2 then
			Marry.PlayerMove(player_2, timer, params)
		end
	end
		
	-- local res = npc:SetTracePoint(tmp_tb[1], tmp_tb[2],"","","")
	-- sLuaApp:LuaErr("res ".. tostring(res))
	tmp_tb[3] = tonumber(tmp_tb[3])
	if tmp_tb[3] ~= -1 then
		sLuaTimerSystem:AddTimerEx(npc, 2500,1,"Marry.ShowNPCDir", ""..tmp_tb[3])
	end
end

function Marry.PlayerMove(player, timer, params)
	if player:IsTeamLeader() or not player:GetTeam() then
		local tmp_tb = sLuaApp:StrSplit(params, ",")
		local map = sMapSystem:GetMapByKey("长安城")
		sMapSystem:Jump(player, map, tmp_tb[1], tmp_tb[2], 0)
		-- local res = sMapSystem:Move(player, tmp_tb[1], tmp_tb[2])
		-- sLuaApp:LuaErr("res "..tostring(res).. tmp_tb[1]..tmp_tb[2])
	end
end
function Marry.ShowNPCDir(npc, timer, dir)
	local map = sMapSystem:GetMapByKey("长安城")
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	local str = [[CL.SetRoleDir(]]..tonumber(dir)..[[,TOOLKIT.Str2uLong("]].. npc:GetGUID()..[["))]]
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
end
function Marry.WalkFireworks(npc, timer, fire_works_num)
	local map = sMapSystem:GetMapByKey("长安城")
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	for i = 1, tonumber(fire_works_num) do 
		local point_tb = sMapSystem:GetRandomPoint(map, x, y, Marry.FireworksRange)
		Marry.BigFireworks(map, point_tb["x"], point_tb["y"])
	end
end

function Marry.WalkGift(npc, timer, gift_num)
	local map = sMapSystem:GetMapByKey("长安城")
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	local gift_id = sItemSystem:GetItemIdByKeyname(Marry.GiftItemKeyName)
	local wedding_grade = sVarSystem:GetInt("Marry_NowWeddingGrade")
	local min_level = Marry.GiftMinLevel or 0
	local is_fake_wedding = sVarSystem:GetInt("Marry_IsFakeWedding")
	if is_fake_wedding == 1 then
		local act_id = sVarSystem:GetInt("FakeWeddingWalk_ID")
		local act_data = ActivityConfig.GetById(act_id)
		if not act_data then
			sLuaApp:LuaErr("Marry.WalkGift Activity缺少 "..act_id)
			return
		end
		min_level = act_data.MinLevel or 10
	end
	for i = 1, tonumber(gift_num) do 
		local point_tb = sMapSystem:GetRandomPoint(map, x, y, Marry.FireworksRange + 10)
		local gift_item = sItemSystem:CreateItem(gift_id, 1, true)
		
		gift_item:SetInt("Marry_WeddingGrade", wedding_grade)
		gift_item:SetInt("Marry_IsWeddingPlayer_1", sVarSystem:GetInt("Marry_IsWeddingPlayer_1"))
		gift_item:SetInt("Marry_IsWeddingPlayer_2", sVarSystem:GetInt("Marry_IsWeddingPlayer_2"))
		gift_item:SetInt("Marry_MinLevel", min_level)
		gift_item:SetInt("Marry_IsFakeWedding", is_fake_wedding)
		
		local res = sMapSystem:ItemAppear(gift_item, map, point_tb["x"], point_tb["y"], 0)
		if res ~= 0 then
			sLuaApp:LuaErr("Marry.WalkGift ItemAppear错误 ".. res)
		end
		sLuaTimerSystem:AddTimerEx(gift_item, Marry.GiftExistTime * 1000,1,"Marry.DestroyGift", "")
	end	
end
function Marry.WalkNPCTalk(npc, timer, msg)
	local npc_name = npc:GetName()
	local str = [[CL.SendNotify(NOTIFY.TalkBubble,1, "]]..msg..[[","]]..npc_name..[[",0)]]
	local map = sMapSystem:GetMapByKey("长安城")
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
end

function Marry.DestroyNPC(npc, timer, params)
	sNpcSystem:DestroyNpc(npc)
end
function Marry.DestroyGift(gift_item, timer, params)
	local res = sItemSystem:DestroyItem(gift_item, "system", "结婚", "清除结婚红包")
	--sLuaApp:LuaErr("resresres "..res)
end

function Marry.BanTeam(player)
	local player_guid = player:GetGUID()
	if player_guid == sVarSystem:GetInt("Marry_IsWeddingPlayer_1") or player_guid == sVarSystem:GetInt("Marry_IsWeddingPlayer_2") then
		sLuaApp:NotifyTipsMsgEx(player, "婚礼中无法操作队伍！")
		return false
	end
	return true
end

function Marry.BanGuard(player)
	local player_guid = player:GetGUID()
	if player_guid == sVarSystem:GetInt("Marry_IsWeddingPlayer_1") or player_guid == sVarSystem:GetInt("Marry_IsWeddingPlayer_2") then
		sLuaApp:NotifyTipsMsgEx(player, "婚礼中无法操作侍从！")
		return false
	end
	return true
end

function Marry.SetGuardShow(player, IsShow)
	local show_guard_guid_tb = Guard_BattleArray.GetUseGuardList(player) or {}
	local hide_guard_str = [[]]
	for _,v in ipairs(show_guard_guid_tb) do
		if tonumber(v) ~= 0 then
			hide_guard_str = hide_guard_str .. [[CL.SetRoleVisible(]]..tostring(IsShow)..[[, TOOLKIT.Str2uLong("]].. v ..[["))
			]]
		end
	end
	sLuaApp:LuaErr(player:GetName().." "..hide_guard_str)
	sLuaApp:ShowForm(player, "脚本表单", hide_guard_str)
end

function Marry.SendFriendMsg(player)
	local husband_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_1")
	local wife_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_2")
	
	local spouse_name = "对象"
	if player:GetGUID() == husband_guid then
		spouse_name = sPlayerSystem:GetPlayerByGUID(wife_guid):GetName()
	else
		spouse_name = sPlayerSystem:GetPlayerByGUID(husband_guid):GetName()
	end
	
	local msg = "我和"..spouse_name.."正在长安红娘处举行婚礼，快来为我们祝福吧！来参加婚礼，可是有机会得到喜糖的哦~"
	local friend_list = FriendSystem.get_all_friends(player)
	for _,v in ipairs(friend_list) do
		if v ~= husband_guid and v ~= wife_guid then
			FormContact.SendContactMessage(player, v, msg)
		end
	end
end

function Marry.GetMsg(husband_name, wife_name, grade_name) -- 直接传参有 # 会被自动分割
	return "<color=#FFD700FF>新郎:<color=#7CFC00FF>["..husband_name.."]</color>与新娘:<color=#7CFC00FF>["..wife_name.."]</color>正在长安举办<color=#FF69B4FF>"..grade_name.."</color>，欢迎各位玩家前来见证！</color>"
end

function Marry.StartMsgToAll(husband_name, wife_name, grade_name)
	sLuaApp:NotifyTopMsgToAll(1, Marry.GetMsg(husband_name, wife_name, grade_name))
	Marry.StopMsgToAll()
	local timer = sLuaTimerSystem:AddTimer(Marry.AllMsgTime * 1000, 500, "Marry.MsgToAll", husband_name..","..wife_name..","..grade_name)
	sVarSystem:SetInt("Marry_MsgToAllTimer", timer)
end

function Marry.MsgToAll(t, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	sLuaApp:NotifyTopMsgToAll(1, Marry.GetMsg(tmp_tb[1], tmp_tb[2], tmp_tb[3]))
end

function Marry.EndWalk(t_guid, p)
	--sLuaApp:LuaErr("Marry.EndWalk")
	--清除
	sVarSystem:SetInt("Marry_NowWeddingGrade", 0)
	sVarSystem:SetInt("Marry_IsWedding", 0)
	sVarSystem:SetInt("Marry_IsFakeWedding",0)
	sVarSystem:SetInt("Marry_PlayerViewNPC", 0)
	
	local husband, wife = Marry.GetWeddingPlayer()
	--锁定玩家视角回玩家 --清除自己隐身
	if husband then
		--local husband_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_1")
		local husband_str = [[
			CL.SetCameraTarget(0)
			CL.SetRoleVisible(true, 0)
		]]
		sLuaApp:ShowForm(husband, "脚本表单", husband_str)
	end
	if wife then
		--local wife_guid = sVarSystem:GetInt("Marry_IsWeddingPlayer_2")
		local wife_str = [[
			CL.SetCameraTarget(0)
			CL.SetRoleVisible(true, 0)
		]]
		sLuaApp:ShowForm(wife, "脚本表单", wife_str)
		--sLuaApp:LuaErr(wife_str.." "..wife:GetName()) sLuaApp:ShowForm(player, "脚本表单", [[CL.SetRoleVisible(true, 0)]])
	end

	if husband and wife then
		if not (husband:ForbidMove(false) and wife:ForbidMove(false)) then
			sLuaApp:LuaErr("Marry.EndWalk ForbidMove 错误")
			return
		end
		if not (husband:ForbidJump(false) and wife:ForbidJump(false)) then
			sLuaApp:LuaErr("Marry.EndWalk ForbidJump 错误")
			return
		end
		--local team_leader = husband:IsTeamLeader() and husband or wife
		--team_leader:Ghost(false)
		--断线重连 队伍状态会改变
		husband:Ghost(false)
		wife:Ghost(false)
		--设置侍从显示
		Marry.SetGuardShow(husband, true)
		--设置侍从显示
		Marry.SetGuardShow(wife, true)
	end
	
	sVarSystem:SetInt("Marry_IsWeddingPlayer_1", 0)
	sVarSystem:SetInt("Marry_IsWeddingPlayer_2", 0)
	--停止全服通告
	Marry.StopMsgToAll()
end

function Marry.StopMsgToAll()
	local timer_guid = sVarSystem:GetInt("Marry_MsgToAllTimer")
	if timer_guid == 0 then return end 
	if not sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaApp:LuaErr("Marry.StopMsgToAll() 不存在timer "..timer_guid)
		return 
	end
	if not sLuaTimerSystem:DisableTimer(timer_guid) then
		sLuaApp:LuaErr("Marry.StopMsgToAll() DisableTimer失败 "..timer_guid)
		return 
	end
	sVarSystem:SetInt("Marry_MsgToAllTimer", 0)
end

--捡红包
function Marry.PickupItem(player, item_guid)
	local last_gift_guid = player:GetInt("Marry_OpeningGiftGUID")
	if last_gift_guid ~= 0 then
		local last_gift = sItemSystem:GetItemByGUID(last_gift_guid)
		if last_gift then
			sLuaApp:LuaErr("Marry.PickupItem".. player:GetName().. "存在last_gift "..last_gift_guid)
			sLuaApp:NotifyTipsMsgEx(player, "上一个红包正在拾取中！")
			return
		end
	end
	
	local gift = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if not gift then return end
	
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local min_level = gift:GetInt("Marry_MinLevel")
	if level < min_level then
		sLuaApp:NotifyTipsMsg(player, "拾取红包需要"..min_level.."级！")
		return
	end
	
	local player_guid = player:GetGUID()
	if player_guid == gift:GetInt("Marry_IsWeddingPlayer_1") or player_guid == gift:GetInt("Marry_IsWeddingPlayer_2") then
		sLuaApp:NotifyTipsMsgEx(player, "无法拾取自己婚礼的红包！")
		return false
	end

	local get_num = 0
	local max_get_num = 0
	local is_fake_wedding = gift:GetInt("Marry_IsFakeWedding")
	if is_fake_wedding == 1 then
		get_num = player:GetDayInt("FakeWeddingWalk_GetGiftNum") + 1
		max_get_num = FakeWeddingWalk.GetGiftMaxNum
	else
		get_num = player:GetDayInt("Marry_GetGiftNum") + 1
		max_get_num = Marry.GetGiftMaxNum
	end
	
	if get_num > max_get_num then
		sLuaApp:NotifyTipsMsg(player, "今天已经捡了够多红包了，无法再捡了。")
		return false
	end
	if gift:GetInt("Marry_IsOpeningGift") == 1 then
		sLuaApp:NotifyTipsMsg(player, "红包从来都是先到先得，少侠，这个红包已经有主了！")
		return false
	end
	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormMarry", "StopPickupItem", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..Marry.ProgressBarTime.."#"..Marry.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, Marry.ProgressBarTime,1,"Marry.GiveReward", get_num..","..item_guid..","..is_fake_wedding)
	if t_guid then
		gift:SetInt("Marry_IsOpeningGift", 1)
		player:SetInt("Marry_OpeningGiftGUID", gift:GetGUID())
		player:SetInt("Marry_OpenGiftTimer", t_guid)
		player:SetInt("Marry_OpenGiftWeddingGrade", gift:GetInt("Marry_WeddingGrade"))
	end
end
--进度条打断
function Marry.StopPickupItem(player)
	local timer_guid = player:GetInt("Marry_OpenGiftTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."Marry.StopPickupItem HasTimer错误")
	end
	player:SetInt("Marry_OpenGiftTimer", 0)
	player:SetInt("Marry_OpenGiftWeddingGrade", 0)
	
	local gift_guid = player:GetInt("Marry_OpeningGiftGUID")
	player:SetInt("Marry_OpeningGiftGUID", 0)
	local gift = sItemSystem:GetItemByGUID(gift_guid)
	if gift then
		gift:SetInt("Marry_IsOpeningGift", 0)
	end
end

--发奖励
function Marry.GiveReward(player, timer, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local get_num = tmp_tb[1]
	local item_guid = tmp_tb[2]
	local is_fake_wedding = tmp_tb[3]
	
	local wedding_grade = player:GetInt("Marry_OpenGiftWeddingGrade")
	if wedding_grade == 0 then
		wedding_grade = 1
	end
	
	local reward_rand_name = "Marry_RewardRand"..wedding_grade
	local reward_config = {}
	if tonumber(is_fake_wedding) == 1 then
		reward_config = FakeWeddingWalk.Reward
		player:SetDayInt("FakeWeddingWalk_GetGiftNum", tonumber(get_num))
		reward_rand_name = reward_rand_name .. "Fake"
	else
		reward_config = Marry.Grade[wedding_grade]["WalkConfig"]["GiftReward"]
		player:SetDayInt("Marry_GetGiftNum", tonumber(get_num))
	end
	if reward_config and next(reward_config) then
		-- +money
		local reward_money = reward_config[Lua_tools.PlayerStartRandom(reward_config,reward_rand_name,1, false, true)[1]]
		local add_money_type = reward_money["MoneyType"]
		local add_money_val = reward_money["MoneyVal"]
		if add_money_type and add_money_val and add_money_val > 0 then
			Lua_tools.AddMoney(player, add_money_type, add_money_val, "system", "结婚", "红包被捡起")
			sLuaApp:NotifyTipsMsgEx(player, "获得"..add_money_val..Lua_tools.GetMoneyName(add_money_type))
		end
	end

	local gift = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if gift then
		local res = sItemSystem:DestroyItem(gift, "system", "结婚", "红包被捡起")
		--sLuaApp:LuaErr("红包被捡起 res ".. res)
	end
	player:SetInt("Marry_OpenGiftTimer", 0)
	player:SetInt("Marry_OpeningGiftGUID", 0)
	player:SetInt("Marry_OpenGiftWeddingGrade", 0)
end

function Marry.OnLogin(player)
	Marry.OnWeddingLogin(player)
	local spouse_unid = sPlayerSystem:GetSpouse(player)
	if spouse_unid == "" then
		--上线判断老婆还是不是老婆
		local spouse_name =  player:GetString("Marry_SpouseName")
		if spouse_name ~= "" then
			Marry.DelBuff(player)
			local sex = player:GetAttr(ROLE_ATTR_GENDER)
			sLuaApp:NotifyTipsMsgEx(player, "您的"..(sex == 2 and "夫君" or "娘子")..spouse_name.."已与您离婚，人生有梦，各自精彩。")
		end
		return
	end
	local spouse_player = sPlayerSystem:GetPlayerByUNID(spouse_unid)
	if not spouse_player then
		return
	end
	local sex = player:GetAttr(ROLE_ATTR_GENDER)
	sLuaApp:NotifyTipsMsgEx(spouse_player, "您的".. (sex == 1 and "夫君" or "娘子") ..player:GetName() .."上线了")
	--更新名称
	local spouse_name = player:GetString("Marry_SpouseName")
	local now_spouse_name = spouse_player:GetName()
	if spouse_name ~= now_spouse_name then
		player:SetString("Marry_SpouseName", now_spouse_name)
	end
	--更新配偶GUID 合服后可能会变
	local spouse_guid = player:GetString("Marry_SpouseGUID")
	local now_spouse_guid = tostring(spouse_player:GetGUID())
	if spouse_guid ~= now_spouse_guid then
		player:SetString("Marry_SpouseGUID", now_spouse_guid)
	end
end

function Marry.OnWeddingLogin(player)
	if sVarSystem:GetInt("Marry_IsWedding") == 1 and sVarSystem:GetInt("Marry_IsFakeWedding") == 0 then
		--sLuaApp:LuaErr("Marry.OnWeddingLogin  "..player:GetName())
		local player_guid = player:GetGUID()
		if sVarSystem:GetInt("Marry_IsWeddingPlayer_1") == player_guid or sVarSystem:GetInt("Marry_IsWeddingPlayer_2") == player_guid then
			--sLuaApp:LuaErr("x "..sMapSystem:GetPosX(player) .. "  y "..sMapSystem:GetPosY(player))
			
			--锁定玩家视角到花车上
			local player_view_npc_guid = sVarSystem:GetInt("Marry_PlayerViewNPC")
			if player_view_npc_guid == 0 then
				return
			end
			local player_view_npc = sNpcSystem:GetNpcByGUID(player_view_npc_guid)
			local pos_x = sMapSystem:GetPosX(player_view_npc)
			local pos_y = sMapSystem:GetPosY(player_view_npc)
			local map = sMapSystem:GetMapByKey("长安城")
			sMapSystem:Jump(player, map, pos_x, pos_y, 1)
			
			player:ForbidMove(true)
			player:ForbidJump(true)
			
			local str = [[
				CL.SetCameraTarget(']]..player_view_npc_guid..[[')
				CL.SetRoleVisible(false, 0)
			]]
			sLuaTimerSystem:AddTimerEx(player, 5000,1,"Marry.DelayShowForm", ""..str)
		end
	end
end

function Marry.DelayShowForm(player, timer, params)
	player:Ghost(true)
	sLuaApp:ShowForm(player, "脚本表单", params)
	
	local husband, wife = Marry.GetWeddingPlayer()
	--设置侍从隐身
	if husband then
		Marry.SetGuardShow(husband, false)
	end
	if wife then
		Marry.SetGuardShow(wife, false)
	end
end

--小烟花 结婚烟花
function Marry.SmallFireworks(map, x, y)
	local str = [[
		-- 结婚烟花
		CL.ShowMapEffect('3000001769', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001648', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001582', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
	]]
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
end
--大烟花 花车烟花
function Marry.BigFireworks(map, x, y)
	local str = [[
		--花车烟花
		CL.ShowMapEffect('3000001582', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001555', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001600', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001661', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001671', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
		CL.ShowMapEffect('3000001446', ']]..x..[[, ]]..y..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', '5.5')
	]]
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
end

-- 根据原点坐标和方向偏移坐标表 返回各个人员的真实坐标表
function Marry.GetRealPointTb(pos_O, dir, relative_point_tb)
	local real_point_tb = {}
	-- sLuaApp:LuaErr("pos_O "..Lua_tools.serialize(pos_O))
	-- sLuaApp:LuaErr("dir "..Lua_tools.serialize(dir))
	-- sLuaApp:LuaErr("relative_point_tb "..Lua_tools.serialize(relative_point_tb))
	for k,v in pairs(relative_point_tb) do
		real_point_tb[k] = {pos_O[1] + v[dir][1], pos_O[2] + v[dir][2]}
	end
	return real_point_tb
end

function Marry.Initialization()
	Marry.TitleId = {}
	for _,v in ipairs(Marry.Title) do
		local title_data = TitleConfig.GetByKeyName(v)
		if not title_data then
			sLuaApp:LuaErr("Marry.Initialization   TitleConfig不存在"..v)
			return 
		end
		table.insert(Marry.TitleId, title_data.Id)
	end
	Marry.SkillId = {}
	for _,v in ipairs(Marry.Skill) do
		local skill_data = SkillConfig.GetByKeyName(v)
		if not skill_data then
			sLuaApp:LuaErr("Marry.Initialization   SkillConfig不存在"..v)
			return 
		end
		table.insert(Marry.SkillId, skill_data.Id)
	end

	
	Marry.PeopleRelativePoint = {}
	Marry.RealPoint  = {} --真正车队人员的点
	Marry.RealPointDir = {} -- 真正车队人员的方向
	for k,v in ipairs(Marry.Grade) do
		Marry.PeopleRelativePoint[k] = {}
		local people_config = v["WalkConfig"]["PeopleConfig"]
		for a,b in pairs(people_config) do
			Marry.PeopleRelativePoint[k][a] = {}
			local dir_point = Marry.PeopleRelativePoint[k][a] -- 一个人 在车队朝向不同时 相对于原点的位置
			dir_point[0] = b
			
			local x = b[1]
			local y = b[2]
			--local test = {2,1/2,1/2,2,2,1/2,1/2,2}
			local revolve_atan = {0.9,1/0.9, 1/0.9,1, 0.9,1/0.9, 1/0.9,0.9}
			--local revolve_atan = {1/2,2,2,1/2,1/2,2,2,1/2}
			--local radian = 0
			local angle = 0
			for i = 1, 7 do
				--angle = angle + math.deg(math.atan(revolve_atan[i]))--顺时针旋转角度
				angle = angle + math.deg(math.atan(1))--顺时针旋转角度
				
				--radian = radian - math.atan(test[i])--顺时针旋转角度

				local radian = math.rad(angle) --转弧度
				--dir_point[i] = {math.floor(x * math.cos(angle) + y * math.sin(angle) + 0.5), math.floor(-1 * x * math.sin(angle) + y * math.cos(angle) + 0.5)}
				local new_x = math.floor(x * math.cos(radian) - y * math.sin(radian) + 0.5)
				local new_y = math.floor(x * math.sin(radian) + y * math.cos(radian) + 0.5)
				
				local l = math.floor((new_x * new_x + new_y * new_y)^0.5  * 0.22)
				--sLuaApp:LuaErr("l === "..l)
				if i == 1 then
					new_x = new_x - l
					new_y = new_y - l
				elseif i == 3 then
					new_x = new_x - l
					new_y = new_y + l
				elseif i == 5 then
					new_x = new_x + l
					new_y = new_y + l
				elseif i == 7 then
					new_x = new_x + l
					new_y = new_y - l
				end
				-- if new_x >= 0 then
					-- new_x = math.floor(new_x)
				-- else	
					-- new_x = math.ceil(new_x)
				-- end
				-- if new_y >= 0 then
					-- new_y = math.floor(new_y)
				-- else	
					-- new_y = math.ceil(new_y)
				-- end
				dir_point[i] = {new_x, new_y}
				--dir_point[i] = {math.floor(x * math.cos(radian) - y * math.sin(radian) + 0.5), math.floor(x * math.sin(radian) + y * math.cos(radian) + 0.5)}
				--sLuaApp:LuaErr("angle "..angle)
				--sLuaApp:LuaErr("radian "..radian)

			end
		end
		
		
		local check_dir_tb = {}
		check_dir_tb[0] = {-90-22.5 , -90+22.5}
		for i = 1, 7 do
			local min_dir = check_dir_tb[i-1][2]
			local max_dir = check_dir_tb[i-1][2] + 45
			if max_dir > 180 then
				max_dir = max_dir - 360
			end
			check_dir_tb[i] = {min_dir, max_dir}
			--check_dir_tb[i] = {check_dir_tb[i-1][2], check_dir_tb[i-1][2] + 45}
		end
		--sLuaApp:LuaErr("check_dir_tb "..Lua_tools.serialize(check_dir_tb))
		local way_point = v["WalkConfig"]["WayPoint"]
		for a,b in ipairs(way_point) do
			if way_point[a+1] then
				local diff_x = way_point[a+1][1] - b[1]
				local diff_y = way_point[a+1][2] - b[2]
				local diversion_radian = math.atan(diff_y,diff_x)
				local diversion_angle = math.floor(math.deg(diversion_radian) + 0.5)
				for n,m in pairs(check_dir_tb) do
					if diversion_angle >= m[1] and diversion_angle < m[2] then
						b[3] = n -- 写入下一段路的方向
					end
				end
				if not b[3] then
					b[3] = 6 -- {157.5, -157.5}
				end
				local need_time = math.max(math.abs(diff_x), math.abs(diff_y)) * Marry.WalkSpeed
				b[4] = need_time
			else
				b[3] = way_point[a-1][3]
				b[4] = 0
			end
		end	
		
		--sLuaApp:LuaErr("WayPoint "..Lua_tools.serialize(Marry.Grade[1]["WalkConfig"]["WayPoint"]))
		
		Marry.RealPoint[k] = {}
		Marry.RealPointDir[k] = {}
		for a,b in ipairs(way_point) do
			local dir = b[3]
	
			local real_point_tb = Marry.GetRealPointTb({b[1],b[2]}, dir, Marry.PeopleRelativePoint[k])
			--real_point_tb["Dir"] = dir
			
			table.insert(Marry.RealPointDir[k], {dir, b[4] + Marry.WalkStraightExtraTime})
			table.insert(Marry.RealPoint[k], real_point_tb)
			
			if way_point[a+1] and way_point[a+1][3] ~= dir then
				local real_point_tb = Marry.GetRealPointTb({way_point[a+1][1],way_point[a+1][2]}, dir, Marry.PeopleRelativePoint[k])
				--real_point_tb["Dir"] = way_point[a-1][3]
				table.insert(Marry.RealPointDir[k], {dir, Marry.WalkTurnRoundTime})
				table.insert(Marry.RealPoint[k], real_point_tb)
			end
		end
		
	end
	--sLuaApp:LuaErr("Marry.PeopleRelativePoint "..Lua_tools.serialize(Marry.PeopleRelativePoint))
	 --sLuaApp:LuaErr("WayPoint "..Lua_tools.serialize(Marry.Grade[1]["WalkConfig"]["WayPoint"]))
	-- sLuaApp:LuaErr("RealPoint "..Lua_tools.serialize(Marry.RealPoint))
	-- sLuaApp:LuaErr("RealPointDir "..Lua_tools.serialize(Marry.RealPointDir))
end
Marry.Initialization()