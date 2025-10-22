--丹炉活动
DanLu = {}
--sysyem danlu danluconfig npc
-- 活动每日 登录就送太清避火丹  √ 
-- 打炉怪 消耗太清避火丹得  精金小锤子 暗淡的金丹 其他奖励 √
-- 精金小锤子 -锤炉渣 得暗淡的金丹 其他奖励  √
-- 暗淡的金丹 -换奖励 太上老君的分身 √

--地图不刷怪范围
DanLu.NoMonsterBorder = 10 
-- 活动开始前回调
function DanLu.OnDeclare(id, seconds)
end

-- 活动开始回调
function DanLu.OnStart(id, is_normal)
	--判断活动是否开启，是的话不反复OnStart
	if sVarSystem:GetInt("ACTIVITY_DanLu_ID") ~= 0 then return end
	--记录id
	sVarSystem:SetInt("ACTIVITY_DanLu_ID", id)
	--设置定时刷新
	DanLu.RefreshMonster(1, ""..id)--活动开始刷一波
	local t_guid = sLuaTimerSystem:AddTimer(DanLuConfig.RefreshTime*1000, -1,"DanLu.RefreshMonster", ""..id)
	sVarSystem:SetInt("ACTIVITY_DanLu_RefreshTimer", t_guid)
end

-- 活动结束回调
function DanLu.OnStop(id)
	sLuaApp:LuaErr("DanLu.OnStopDanLu.OnStop")
	local t_guid = sVarSystem:GetInt("ACTIVITY_DanLu_RefreshTimer")
	sLuaTimerSystem:DisableTimer(t_guid)
	--清除id
	sVarSystem:SetInt("ACTIVITY_DanLu_ID", 0)
end

-- 玩家点击参与活动回调
function DanLu.OnJoin(id, player)
	DanLuLaoJun.OnJoin(id, player)
end

-- 玩家客户端查询数据回调
function DanLu.OnQuery(id, player)
	local show_item = DanLuConfig.ShowItem or "61024,20100,31006"
	local str = "0:0:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("DanLu") or "1,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--上线就送
function DanLu.LoginGetItem(player)
	local id = sVarSystem:GetInt("ACTIVITY_DanLu_ID")
	if id == 0 then return end
	if not sLuaApp:IsActivityRunning(id) then return end
	local level_min = ActivityConfig.GetById(id).LevelMin
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then return end
	if player:GetDayInt("DanLu_LoginGetItem") == 0 then
		local act_name =  ActivityConfig.GetById(id).Name
		player:SetDayInt("DanLu_LoginGetItem", 1)
		sMailSystem:SendMail( 0, act_name, player:GetGUID(), 1, act_name.."福利", "活动期间，上线就送每日福利",{}, DanLuConfig.MailItemList)
	end
end
--定时刷新
function DanLu.RefreshMonster(t_guid, p)
	-- sLuaApp:LuaErr("刷怪刷怪刷怪")
	if not DanLuConfig.Refresh then return end
	
	local map_msg = ""
	for k,_ in pairs(DanLuConfig.Refresh) do
		map_msg = map_msg .. k .."，"
	end
	map_msg = string.sub(map_msg, 1, -4)
	sLuaApp:NotifyTopMsgToAll( 1, "<color=#FFFFFFFF>太上老君清理炼丹炉，天上掉下不少怪物和丹炉残渣，少侠们若有寻宝之心，可试试在<color=#FFD700FF>"..map_msg.."</color>寻找</color>")
	
	local id = tonumber(p)
	for k,v in pairs(DanLuConfig.Refresh) do
		local map_id = MapConfig.GetByKeyName(k).Id
		local map = sMapSystem:GetMapById(map_id)
		--中心点坐标
		local x = math.floor(map:GetWidth()/2)
		local y = math.floor(map:GetHeight()/2)
		local range = math.min(x,y) - DanLu.NoMonsterBorder --刷怪范围
				
		for a,b in pairs(v) do
			local npc_id = NpcConfig.GetByKeyName(a).Id
			local npc_num = b['Num']
			if b['Move'] == 1 then
				for i=1, npc_num do
					local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
					local npc = sNpcSystem:CreateMoveNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, 0)
					if npc then
						npc:SetInt("DanLuActID", id)
						sLuaTimerSystem:AddTimerEx(npc, DanLuConfig.DestroyTime*1000,1,"DanLu.DestroyNPC", "")
					end
				end
			elseif  b['Move'] == 0 then
				for i=1, npc_num do
					local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
					local dir = sLuaApp:RandInteger(0, 7)
					local npc = sNpcSystem:CreateNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, dir , 0)
					if npc then
						npc:SetInt("DanLuActID", id)
						sLuaTimerSystem:AddTimerEx(npc, DanLuConfig.DestroyTime*1000,1,"DanLu.DestroyNPC", "")
					end
				end					
			end
		end
	end
end
	

function DanLu.DestroyNPC(npc, timer, p)
	-- sLuaApp:LuaErr("还在摧毁NPC")
	if npc then
		sNpcSystem:DestroyNpc(npc)
	end
end

--检查能否进入战斗 战斗npc对话用
function DanLu.CheckFight(player, id)
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	local join_min_num = DanLuConfig.JoinMinNum or 1
	
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

--打器灵 进入战斗
function DanLu.StartFight(player, npc)
	if npc:GetInt("DanLuQiLingNPCisFight") > 0 then
		return false
	else
		local npc_name = npc:GetKeyName()
		local mon_id = DanLuConfig.NPCToMonster[npc_name]['MonID']

		if sFightSystem:StartTagPVE(player, mon_id, DanLu.FightTag, "DanLu", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("DanLuQiLingNPCisFight", 1)--1 npc在战斗中 0 不在
			local team = player:GetTeam()
			local memberlist = {}
			if team and not player:IsTempLeave() then
				memberlist = team:GetTeamMembers(false)
			else
				memberlist[1] = player
			end
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "DanLu", "OnResult")
				v:SetInt("DanLuFightNPCGUID", npc:GetGUID())
				v:SetString("DanLuFightNPCName", npc:GetKeyName())
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("DanLuQiLingNPCisFight", npc:GetInt("DanLuQiLingNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("DanLu.StartFight开始pve失败")
		end
		return true
	end
end
--战斗完回调  -玩家掉线需要获得npc 标记为 不在战斗中
function DanLu.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= DanLu.FightTag then
		sLuaApp:LuaErr("DanLu.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("DanLuQiLingNPCisFight", 0)
	end
end
--人物完成战斗回调
function DanLu.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "DanLu", "OnResult")
	--战斗中外面的npc到点自杀了也要发奖励
	local npc_keyname = player:GetString("DanLuFightNPCName")
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("DanLuFightNPCGUID"))
	if npc and npc:GetInt("DanLuQiLingNPCisFight") > 0 then
		npc:SetInt("DanLuQiLingNPCisFight", npc:GetInt("DanLuQiLingNPCisFight")-1)
	end
	if victory == 2 then
		--判断有没有消耗物品
		local cos_item_data = ItemConfig.GetByKeyName(DanLuConfig.NPCToMonster[npc_keyname]['ConsumeItem'])
		local cos_num = DanLuConfig.NPCToMonster[npc_keyname]['ConsumeNum']
		if sItemSystem:GetItemAmount(player, cos_item_data.Id, 3) >= cos_num then
			sItemSystem:ConsumeItemWithPriority(player, cos_item_data.Id, cos_num, true, "system", "丹炉活动","打败器灵")
			if npc then
				sNpcSystem:DestroyNpc(npc)
			end
			DanLu.GiveReward(player, npc_keyname, "system", "丹炉活动", "打败器灵")
		else
			sLuaApp:NotifyTipsMsg(player, cos_item_data.Name.."不足，无法消灭妖怪！")
		end
	end
	player:SetInt("DanLuFightNPCGUID", 0)
	player:SetString("DanLuFightNPCName", "")
end

--砸炉渣
function DanLu.CanZha(npc, player, content)
	local tmp = sLuaApp:StrSplit(content,",")
	local item = tostring(tmp[1])
	local num = tonumber(tmp[2])
	local rand = tonumber(tmp[3])
	local item_data = ItemConfig.GetByKeyName(item)
	if not Lua_tools or not DanLuConfig.Reward then
		sLuaApp:LuaErr("DanLuConfig.Reward配置缺少")
		return ""
	end

	--判断消耗品够不够
	if sItemSystem:GetItemAmount(player, item_data.Id, 3) < num then
		return "少侠，你的"..item_data.Name.."不够了。"
	end
	-- if #item_reward['RandItemList'] > Lua_tools.GetBagFree(player) then
		-- return "少侠，你的包裹怕是放不下宝藏了。"
	-- end
	--扣锤子
	sItemSystem:ConsumeItemWithPriority(player, item_data.Id, num, true, "system", "丹炉活动","砸残渣")

	if sLuaApp:RandInteger(1,10000) <= rand then
		--成功	
		DanLu.GiveReward(player, npc:GetKeyName(), "system", "丹炉活动", "砸残渣")
		--与npc对话中无法删除npc
		sLuaTimerSystem:AddTimerEx(npc, 400,1,"DanLu.DestroyNPC", "")
	else
		return "就这？"..num.."个锤子也想撼动我？"
	end
	return ""
end

--给奖励
function DanLu.GiveReward(player, npc_keyname, sender, reason, detail)
	local reward = DanLuConfig.Reward[npc_keyname]
	if not reward then
		sLuaApp:LuaErr("DanLuConfig.Reward配置缺少"..npc_keyname)
	end
	
	if next(reward) then
		-- +exp
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = DanLu.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, sender, reason, detail)
		end
		-- +money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = DanLu.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, sender, reason, detail)
		end
		-- +固定物品
		local item_list = reward['Item']
		if item_list then
			Lua_tools.AddItem(player, item_list, sender, reason, detail)
		end
		-- +随机物品
		for k,v in ipairs(reward['RandItemList']) do
			local item_rand_time = v['RandTime'] or 1
			local item_rand_list = v['ItemRand']
			if item_rand_time and item_rand_list then
				local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, reason..npc_keyname..k, item_rand_time)
				if res_item_list[1] ~= "Nil" then
					Lua_tools.AddItem(player, res_item_list, sender, reason, detail)
				end
			end
		end
		
	end
end

--奖励配置表转数字
function DanLu.RewardConfigToNmber(player, add_num)
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
		res_num = add_num
	end
	return math.floor(res_num)
end