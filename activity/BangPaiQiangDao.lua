--帮派强盗
BangPaiQiangDao = {}

--可参与次数
BangPaiQiangDao.Join_Max = 5
--单次参加获得的活跃值
BangPaiQiangDao.Active_Add = 4
--活跃值上限
BangPaiQiangDao.Active_Max = 20
--活动界面 展示奖励 物品id
BangPaiQiangDao.ShowItem = "61024,61025,20349"
--参与队伍最少人数 范围1-5
BangPaiQiangDao.JoinMinNum = 1

--npc刷新 地图keyname NPCkeyname 对应怪物组id 刷新数量
BangPaiQiangDao.Refresh = {
	[41] = {['NPCName'] = "帮派强盗", ['MonID'] = 31064, ['Num'] = 20},
	[81] = {['NPCName'] = "帮派强盗", ['MonID'] = 31064, ['Num'] = 20},
	[82] = {['NPCName'] = "帮派粮仓强盗", ['MonID'] = 31064, ['Num'] = 20},
	[83] = {['NPCName'] = "帮派粮仓强盗", ['MonID'] = 31064, ['Num'] = 20},
	}
--两个小时为一个周期{开始刷怪时间(分：秒)，本次怪物存在时间(秒)}
BangPaiQiangDao.RefreshTime = {
	{"24:00", 1440},
	{"48:00", 1440},
	{"72:00", 1440},
	{"96:00", 1440},
}

--奖励
BangPaiQiangDao.Reward = {
	["帮派强盗"] = {
		["Exp"] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		['BuildNum'] = 10,
		['AddFund'] = 500,
		['item'] = {},
	},
	["帮派粮仓强盗"] = {
		["Exp"] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = 10000,
		['BuildNum'] = 10,
		['AddFund'] = 500,
		['item'] = {"活力药1",1,500,"血池1",1,10000,"魔池1",1,10000,"还原丹",1,100,"宠物经验丹",1,10000,
            "修炼丹",1,10000,"血池2",1,10000,"魔池2",1,10000,"血池3",1,5000,"魔池3",1,5000},
	}
}
--地图边框不刷怪区域大小
BangPaiQiangDao.NPCRefreshConfig = {
	x = 160,
	y = 135,
	range = 50,
}
--战斗标识
BangPaiQiangDao.FightTag = 10010
-- 活动开始前回调
function BangPaiQiangDao.OnDeclare(id, seconds)
end

-- 活动开始回调
function BangPaiQiangDao.OnStart(id, is_normal)
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，活动"..id.."开始!")
	if ActOpenInformWnd then
		ActOpenInformWnd.StartInform(id)
	end
	local refresh_time = BangPaiQiangDao.RefreshTime
	--初始化刷新时刻表
	BangPaiQiangDao.InitTimeList(id)
	
	BangPaiQiangDao.SetCreateNPC(0,refresh_time[1][2]..","..id)--活动开始刷一波
	BangPaiQiangDao.ScheduleNPC(id)
end

-- 活动结束回调
function BangPaiQiangDao.OnStop(id)
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，活动"..id.."结束!")
end

-- 玩家点击参与活动回调
function BangPaiQiangDao.OnJoin(id, player)
	--跳到有怪的地图
	if sLuaApp:IsActivityRunning(id) then
		if player:GetTeam() and not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才能决定参加帮派强盗活动！")
			return
		end
		local check_tb = BangPaiQiangDao.CheckFight(player, id)
		if check_tb and next(check_tb) then
			if check_tb[1] == 0 and check_tb[2] == 1 then
				sLuaApp:NotifyTipsMsg(player, "只有等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			elseif check_tb[1] == 0 and check_tb[2] > 1 then
				sLuaApp:NotifyTipsMsg(player, "只有至少"..check_tb[2].."人组队并且全员等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			end
		else
			sLuaApp:LuaDbg("BangPaiQiangDao.CheckFight返回错误")
			return
		end
		
		--local refresh_list = BangPaiQiangDao.Refresh
		--if next(refresh_list) then
		local tmp_num = 0
		local goto_map_id = 0
		local PlayerGuild = player:GetGuild()
		if PlayerGuild == nil then
			sLuaApp:NotifyTipsMsg(player, "您还没有加入帮派")
			return
		end
		local PlayerGuildMap = PlayerGuild:GetMap()
		local map_id = PlayerGuildMap:GetId()
		--map_id = MapConfig.GetByKeyName(refresh_list['MapKeyName']).Id
		local map_npc_num = sVarSystem:GetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum")
		if map_npc_num > tmp_num then
			tmp_num = map_npc_num
			goto_map_id = map_id
		end
		if goto_map_id ~=0 then
			--中心点坐标
			local x = BangPaiQiangDao.NPCRefreshConfig.x
			local y = BangPaiQiangDao.NPCRefreshConfig.y
			local range = BangPaiQiangDao.NPCRefreshConfig.range
			if Lua_tools.Jump(player, PlayerGuildMap, x, y, range) then
				local str = [[
					GUI.CloseWnd("ActivityPanelUI")
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			else
				sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
			end
		else
			sLuaApp:NotifyTipsMsg(player, "来晚啦，所有强盗都已被帮派成员消灭。")
			return
		end
		--end
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
		return
	end
	return
end

function BangPaiQiangDao.OnQuery(id, player)
	local join_num = player:GetDayInt("BangPaiQiangDao_Join_Num"..id)
	local active_num = player:GetDayInt("BangPaiQiangDao_Active_Num"..id)
	
	local str = join_num..":"..BangPaiQiangDao.Join_Max..":"..active_num..":"..BangPaiQiangDao.Active_Max..":"..BangPaiQiangDao.ShowItem..":2:"..(ActivitySystem.Act_GetClassify("BangPaiQiangDao")or'2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--初始化刷新时刻表
function BangPaiQiangDao.InitTimeList(id)
	BangPaiQiangDao.RefreshTimelist = {}
	assert(load("BangPaiQiangDao.RefreshTimelist["..id.."] = {} return "))()
	local refresh_time = BangPaiQiangDao.RefreshTime
	local activityData = ActivityConfig.GetById(id)
	local hour = tonumber(string.sub(activityData.TimeEnd,1,2))--21
	local now_hour = sLuaApp:Hour(0)
	local index = 1
	for i = now_hour,hour,1 do
		for _,v in ipairs(refresh_time) do
			BangPaiQiangDao.RefreshTimelist[id][index] = {}
			local fresh_time = i..":"..v[1]
			table.insert(BangPaiQiangDao.RefreshTimelist[id][index],fresh_time)
			table.insert(BangPaiQiangDao.RefreshTimelist[id][index],v[2])
			index = index+1
		end
	end
end
--设置所有刷新npc计划任务
function BangPaiQiangDao.ScheduleNPC(id)
	for k,v in pairs(BangPaiQiangDao.RefreshTimelist[id]) do
		sScheduleSystem:CreateSchedule(0, v[1], "BangPaiQiangDao","SetCreateNPC", v[2]..","..id)
	end
end

--设置刷新NPC 
function BangPaiQiangDao.SetCreateNPC(timer, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",") --params = {900,} 
	local destroy_time = tonumber(tmp_tb[1])
	local id = tonumber(tmp_tb[2])
	destroy_time = tonumber(destroy_time)
	local AllGuild = sGuildSystem:GetAllGuilds()
	if sLuaApp:IsActivityRunning(id) then
		destroy_time = tonumber(destroy_time)
		for k,v in pairs(AllGuild) do
			local refresh_list = BangPaiQiangDao.Refresh[id]
			if next(refresh_list) then
				local Guild = v
				local GuildMap = Guild:GetMap()
				local map_id = GuildMap:GetId()

				--中心点坐标
				local x = BangPaiQiangDao.NPCRefreshConfig.x
				local y = BangPaiQiangDao.NPCRefreshConfig.y
				local range = BangPaiQiangDao.NPCRefreshConfig.range --刷怪范围
				local npc_id = NpcConfig.GetByKeyName(refresh_list['NPCName']).Id
				local npc_num = refresh_list['Num']
				local map_npc_num = sVarSystem:GetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum") + npc_num
				sVarSystem:SetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum", map_npc_num)
				for i=1, npc_num do
					local dir = sLuaApp:RandInteger(0,7)
					local npc = sNpcSystem:CreateNpc(npc_id, GuildMap, x, y, range, dir ,0)--dir是方向
					if npc then
						npc:SetInt("BangPaiQiangDaoFightMonID", refresh_list['MonID'])
						npc:SetInt("BangPaiQiangDaoActID", id)
						npc:SetInt("BangPaiQiangDaoMapID", map_id)
						sLuaTimerSystem:AddTimerEx(npc, destroy_time*1000,1,"BangPaiQiangDao.DestroyNPC", "")
					end
				end
			end
		end
	end
end

--检查能否进入战斗 npc对话和活动跳转用
function BangPaiQiangDao.CheckFight(player, id)
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	local join_min_num = BangPaiQiangDao.JoinMinNum
	
	local return_msg_tb ={}
	local can_fight =0
	
	if Lua_tools.GetTeamMember(player,false) >= join_min_num then
		if Lua_tools.GetTeamLowestlevel(player) >= level_min then
			can_fight = 1
		end
	end
	if player:IsTempLeave() then
		can_fight = 0
	end
	table.insert(return_msg_tb, can_fight)
	table.insert(return_msg_tb, join_min_num)
	table.insert(return_msg_tb, level_min)
	--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
	return return_msg_tb
end

--进入战斗
function BangPaiQiangDao.StartFight(player, npc)
	if npc:GetInt("BangPaiQiangDaoNPCisFight") > 0 then
		return false
	else
		--npc==>monster
		local npc_id = npc:GetId()
		local mon_id = npc:GetInt("BangPaiQiangDaoFightMonID") or 20001
		
		if sFightSystem:StartTagPVE(player, mon_id, BangPaiQiangDao.FightTag, "BangPaiQiangDao", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("BangPaiQiangDaoNPCisFight", 1)--1 npc在战斗中 0 不在
			local team = player:GetTeam()
			local memberlist = {}
			if team and not player:IsTempLeave() then
				memberlist = team:GetTeamMembers(false)
			else
				memberlist[1] = player
			end
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "BangPaiQiangDao", "OnResult")
				
				v:SetInt("BangPaiQiangDaoFightNPCGUID", npc:GetGUID())
				v:SetString("BangPaiQiangDaoFightNPCName", npc:GetKeyName())
				v:SetInt("BangPaiQiangDaoFightNPCActID", npc:GetInt("BangPaiQiangDaoActID"))
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("BangPaiQiangDaoNPCisFight", npc:GetInt("BangPaiQiangDaoNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("BangPaiQiangDao.StartFight开始pve失败")
		end
		return true
	end
end
--战斗完回调
function BangPaiQiangDao.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= BangPaiQiangDao.FightTag then
		sLuaApp:LuaErr("BangPaiQiangDao.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("BangPaiQiangDaoNPCisFight", 0)
	end
end


--人物完成战斗回调
function BangPaiQiangDao.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "BangPaiQiangDao", "OnResult")
	
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("BangPaiQiangDaoFightNPCGUID"))
	local id = player:GetInt("BangPaiQiangDaoFightNPCActID")
	sLuaApp:LuaErr(player:GetName().."victory"..tostring(victory))

	if npc and npc:GetInt("BangPaiQiangDaoNPCisFight") > 0 then
		npc:SetInt("BangPaiQiangDaoNPCisFight", npc:GetInt("BangPaiQiangDaoNPCisFight")-1)
	end
	if victory == 2 then
		--记下活跃度 参与次数
		local active_add = BangPaiQiangDao.Active_Add
		local active_max = BangPaiQiangDao.Active_Max
		local active = player:GetDayInt("BangPaiQiangDao_Active_Num"..id)
		if active < active_max then
			local active_sum = active + active_add
			if active_sum > active_max then
				player:SetDayInt("BangPaiQiangDao_Active_Num"..id, active_max)
				ActivitySystem.AddActiveVal(player, active_max - active)
			else
				player:SetDayInt("BangPaiQiangDao_Active_Num"..id, active_sum)
				ActivitySystem.AddActiveVal(player, active_add)
			end
		else
			sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
		end
		
		--参与次数没到上限才发奖励
		local join_max = BangPaiQiangDao.Join_Max
		local join_num = player:GetDayInt("BangPaiQiangDao_Join_Num"..id) +1
		if join_num <= join_max then
			player:SetDayInt("BangPaiQiangDao_Join_Num"..id, join_num)
			--发奖励
			BangPaiQiangDao.GiveReward(player, player:GetString("BangPaiQiangDaoFightNPCName"))
		else
			sLuaApp:NotifyTipsMsg(player, "参与次数已达上限，无法获得奖励")
		end
		
		if npc then
			local map_id = npc:GetInt("BangPaiQiangDaoMapID")
			local map_npc_num = sVarSystem:GetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum")-1
			sVarSystem:SetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum", map_npc_num)
			sNpcSystem:DestroyNpc(npc)
		end
		
		local activity_data = ActivityConfig.GetById(id)
		if activity_data and VipIngotTrace then
			VipIngotTrace.GetReward(player, activity_data.Name)
		end
		if activity_data and Assist then
			Assist.ActivityGetPoint(player, activity_data.Name)
		end
	end
	player:SetInt("BangPaiQiangDaoFightNPCGUID", 0)
	player:SetString("BangPaiQiangDaoFightNPCName", "")
	player:SetInt("BangPaiQiangDaoFightNPCActID", 0)
end

--发奖励
function BangPaiQiangDao.GiveReward(player, npc_keyname)
	local reward = {}
	reward = BangPaiQiangDao.Reward[npc_keyname]
	if next(reward) then
		-- +经验
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = BangPaiQiangDao.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "system", "帮派强盗活动","帮派强盗掉落")
			local PetList = Lua_tools.GetFightPets(player)
			for k, v in pairs(PetList) do
				v:AddExp(res_exp, "system", "帮派强盗活动","帮派强盗掉落")
			end
		end
		--+money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = 0
			if type(add_money_val) == "string" then
				res_money = BangPaiQiangDao.RewardConfigToNmber(player, add_money_val)
			elseif type(add_money_val) == "number" then
				res_money = add_money_val
			end
			Lua_tools.AddMoney(player, add_money_type, res_money, "system", "帮派强盗", npc_keyname.."怪物掉落")
			sLuaApp:NotifyTipsMsg(player, "您获得了"..res_money.."银币！")
		end
		--+帮贡
		local buildNum = reward['BuildNum']
		if buildNum and buildNum ~= 0 then
			if player:AddGuildContribute(buildNum,"system","帮派强盗","帮派强盗奖励") then
				sLuaApp:NotifyTipsMsg(player, "您获得了"..buildNum.."帮贡！")
			end
		end
		--+帮派资金
		local addfund = reward['AddFund']
		if addfund and addfund ~= 0 then
			local Guild = player:GetGuild()
			if Guild then
				local GuildLevel = Guild:GetLevel()
				addfund = GuildLevel*addfund
				Lua_tools.AddGuildFund(player,addfund)
				sLuaApp:NotifyTipsMsg(player, "您为帮派增加了"..addfund.."帮派资金！")
			end
		end
		--+item
		local item_list = reward['item']
		if Lua_tools.tablecount(item_list) ~= 0 then
			local weight_list = {}
			for i=1,#item_list/3 do
				weight_list[#weight_list+1] = item_list[3*i]
			end
			local item = {}
			local m = BangPaiQiangDao.weight_count(weight_list)
            local flag = 0
            for n = 1, #item do
                if type(item[n]) == "string" then
                    if item[n] == item_list[3*m-2] then
                        item[n+1] = item[n+1] + 1
                        flag = 1
                        break
                    end
                end
            end
            
            if flag == 0 then
                item[#item + 1] = item_list[3*m-2]
                item[#item + 1] = 1
                item[#item + 1] = 1
            end
			Lua_tools.AddItem(player,item,"system","帮派强盗","帮派强盗奖励")
		end

	end
end

--计算权重
function BangPaiQiangDao.weight_count(list)
	local sum = 0
	local weight = 1
	for i=1 ,#list do
		sum = sum + list[i]
	end
	local num = sLuaApp:RandInteger(1,sum)
	
	for i=1 ,#list do
		if num <= list[i] then
			weight = i
			break
		else
			num = num -list[i]
		end
	end
	return weight
end

--奖励配置表转数字
function BangPaiQiangDao.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
	]]
	if type(add_num) == "table" then
		local min_num = add_num[1]
		local max_num = add_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	elseif type(add_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. add_num))()
	elseif type(add_num) == "number" then
		res_num = math.floor(add_num)
	end
	return res_num
end

--npc销毁
function BangPaiQiangDao.DestroyNPC(npc, timer, p)
	local id = npc:GetInt("BangPaiQiangDaoActID")
	local map_id = npc:GetInt("BangPaiQiangDaoMapID")
	local map_npc_num = sVarSystem:GetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum")-1
	sVarSystem:SetInt("BangPaiQiangDao_"..id.."_"..map_id.."_NPCNum", map_npc_num)
	sNpcSystem:DestroyNpc(npc)
end