--帮派摇钱树
GuildCashTree = {}

GuildCashTree.FightTag = 10063

-- 活动开始前回调
function GuildCashTree.OnDeclare(id, seconds)
end

-- 活动开始回调
function GuildCashTree.OnStart(id, is_normal)
	if not is_normal then
		sLuaApp:LuaErr("GuildCashTree.OnStart 未在活动时间前开启 已关闭活动")
		return
	end
	sVarSystem:SetInt("ACTIVITY_GuildCashTree_ID", id)
	if Data then
		Data["GuildCashTree"] = {}
	else
		sLuaApp:LuaErr("缺少Data")
		return
	end
	
	local all_guild = sGuildSystem:GetAllGuilds()
	for _,v in ipairs(all_guild) do
		local guild_guid = tostring(v:GetGUID())
		Data["GuildCashTree"][guild_guid] = {}
		Data["GuildCashTree"][guild_guid]["NextTask"] = {}
		Data["GuildCashTree"][guild_guid]["TaskStatus"] = {}
		Data["GuildCashTree"][guild_guid]["BoxReward"] = {}
		Data["GuildCashTree"][guild_guid]["TaskNPC"] = {}

		local tree_level = v:GetInt("GuildCashTreeLevel")
		if tree_level == 0 then
			tree_level = 1
			v:SetInt("GuildCashTreeLevel", 1)
		end
		
		--设置任务进度
		v:SetInt("GuildCashTreeTaskStage", 0)
		--创建摇钱树
		GuildCashTree.CreateTreeNpc(v, tree_level, 0)
		--设置摇钱树活动为生长阶段
		v:SetInt("GuildCashTreeActPhase", 1)
		--发帮派全体邮件
		GuildCashTree.GildSendMail(v, tree_level, 0)
	
	end
	--设置生长阶段时长--到点了摇钱树也要成熟
	sLuaTimerSystem:AddTimer(GuildCashTreeConfig.GrowTime*1000*60, 1, "GuildCashTree.HarvestStage", "")
end

-- 活动结束回调
function GuildCashTree.OnStop(id)
	sVarSystem:SetInt("ACTIVITY_GuildCashTree_ID", 0)
	
	local all_guild = sGuildSystem:GetAllGuilds()
	for _,v in ipairs(all_guild) do
		local npc_guid = v:GetInt("GuildCashTreeNPCGuid")
		local npc = sNpcSystem:GetNpcByGUID(npc_guid)
		if npc then
			sNpcSystem:DestroyNpc(npc)
		end
		v:SetInt("GuildCashTreeNPCGuid", 0)
		v:SetInt("GuildCashTreeTaskStage", 0)
		if Data["GuildCashTree"][tostring(v:GetGUID())]["TaskNPC"] then
			for _,b in pairs(Data["GuildCashTree"][tostring(v:GetGUID())]["TaskNPC"]) do
				local npc = sNpcSystem:GetNpcByGUID(b)
				if npc then
					if sNpcSystem:DestroyNpc(npc) ~= 0 then
						sLuaApp:LuaErr("GuildCashTree.OnStop 删除任务npc错误 npc_guid"..b)
					end
				end
			end
		end
		
	end
	Data["GuildCashTree"] = {}
end

-- 玩家点击参与活动回调
function GuildCashTree.OnJoin(id, player)
	if not sLuaApp:IsActivityRunning(id) then 
		sLuaApp:NotifyTipsMsg(player,"活动尚未开启！" )
		return
	end
	local guild = player:GetGuild()
	if not guild then 
		sLuaApp:NotifyTipsMsg(player,"请先加入一个帮派！" )
		return
	end
	local level_min = ActivityConfig.GetById(id).LevelMin
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player,"不到"..level_min.."级是无法侍奉摇钱树的！" )
		return
	end
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player,"摇钱树不接受组队服侍")
		return
	end
	
	if sGuildSystem:GoBack(player) ~= 0 then
		sLuaApp:LuaErr(player:GetName().."GuildCashTree.OnJoin 失败")
	end
	local str = [[
		if ActivityPanelUI then
			GUI.CloseWnd("ActivityPanelUI")
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- 玩家客户端查询数据回调
function GuildCashTree.OnQuery(id, player)
	local active = player:GetWeekInt("GuildCashTreeActiveNum")
	local show_item = GuildCashTreeConfig.ShowItem or "61024"
	local str = "0:0:"..active..":"..GuildCashTreeConfig.ActiveMax..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("GuildCashTree") or "1,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--设置到点成熟
function GuildCashTree.HarvestStage(timer, p)
	local all_guild = sGuildSystem:GetAllGuilds()
	for _,v in ipairs(all_guild) do
		local act_phase = v:GetInt("GuildCashTreeActPhase")
		if act_phase == 1 then
			
			local npc = sNpcSystem:GetNpcByGUID(v:GetInt("GuildCashTreeNPCGuid"))
			if sNpcSystem:DestroyNpc(npc) ~= 0 then
				sLuaApp:LuaErr("GuildCashTree.HarvestStage 删除摇钱树npc错误")
			end
			
			local tree_level = v:GetInt("GuildCashTreeLevel")
			local max_task_num = GuildCashTreeConfig.Task["Level_"..tree_level]["TaskNum"]
			GuildCashTree.GildSendMail(v, tree_level, max_task_num)
			GuildCashTree.CreateTreeNpc(v, tree_level, max_task_num)
			v:SetString("TreeHarvestMsg", GuildCashTreeConfig.TreeNoHarvestMsg)
			v:SetInt("GuildCashTreeActPhase", 2)
			
			--初始化帮派的最终宝箱奖励表
			GuildCashTree.CountFinalReward(v)
		end
	end
end
-- --上线
-- function GuildCashTree.LoginSendMail(player)
	-- if not sGuildSystem:HasGuild(player) then return end
	-- local id = sVarSystem:GetInt("ACTIVITY_GuildCashTree_ID")
	-- if id == 0 then return end
	-- if not sLuaApp:IsActivityRunning(id) then return end
	-- local level_min = ActivityConfig.GetById(id).LevelMin
	-- if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then return end
	-- local act_name =  ActivityConfig.GetById(id).Name
	
	-- sMailSystem:SendMail( 0, act_name, player:GetGUID(), 1, "帮派摇钱树", "帮派摇钱树正在生长，少侠何不去看看？",{}, {})
-- end

--设置下个任务
function GuildCashTree.GetNextTask(player)
	local guild = player:GetGuild()
	if not guild then return end

	local tree_level = guild:GetInt("GuildCashTreeLevel")
	local task_random_tb = GuildCashTreeConfig.Task["Level_"..tree_level]["TaskRandom"]
	local index = GuildCashTree.GetRandIndex(task_random_tb, "TaskRandom"..tree_level,1)[1]
	local task_name = task_random_tb[index]["Event"]
	sLuaApp:LuaErr(player:GetName().."next task"..task_name)
	Data["GuildCashTree"][tostring(guild:GetGUID())]["NextTask"][tostring(player:GetGUID())] = task_name
	Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskStatus"][tostring(player:GetGUID())] = 0
end

function GuildCashTree.SelectOption(player_guid, content)
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(player_guid))
	local tmp_tb = sLuaApp:StrSplit(content, "$")
	local event = GuildCashTreeConfig.Event[tmp_tb[1]]
	local option_tb = event[tmp_tb[2]]
	--扣钱 记下购买的战斗物品
	local money_type = option_tb["ConsumeType"]
	local money_val = option_tb["ConsumeVal"]
	if money_type and money_val then
		if Lua_tools.IsMoneyEnough(player, money_type, money_val) then
			Lua_tools.SubMoney(player, money_type, money_val, "system", "帮派摇钱树", content)
		else
			if MoneyChange then
				local f_name = [[GuildCashTree.SelectOption(]]..player_guid..[[,"]]..content..[[")]]
				MoneyChange.LackMoney(player, money_type, money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player,"您的"..Lua_tools.GetMoneyName(money_type).."不足！")
			end
			return
		end
	end
	player:SetString("GuildCashTreeSelectOption", content)
	
	--配置中有怪物组id -进入战斗
	if event["MonID"] and event["MonID"] ~= 0 then
		if sFightSystem:StartTagPVE(player, event["MonID"], GuildCashTree.FightTag, "GuildCashTree", "FightCallBack", ""..player:GetGUID()) then
			--npc:SetPatrol(false) --不动
			sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "GuildCashTree", "OnResult")
		else
			sLuaApp:LuaErr("GuildCashTree"..player:GetName().."进入战斗失败 content "..content)
		end
	
	else	
		--进度+1 检查进度
		if GuildCashTree.CheckStage(player) then
			--设置下个任务
			GuildCashTree.GetNextTask(player)
			sLuaApp:NotifyTipsMsg(player, "摇钱树又遇到了新的问题，快去看看吧！")
		end

		local player_task_stage = player:GetWeekInt("GuildCashTreePlayerTaskStage")
		if player_task_stage <= GuildCashTreeConfig.OwnRewardNum then
			if event["Reward"] and next(event["Reward"]) then
				--基础奖励
				GuildCashTree.GiveReward(player,event["Reward"], "system", "帮派摇钱树", content)
			end
			if option_tb["Reward"] and next(option_tb["Reward"]) then
				--额外奖励
				GuildCashTree.GiveReward(player, option_tb["Reward"], "system", "帮派摇钱树", content)
				sLuaApp:NotifyTipsMsg(player, "恭喜获得额外奖励！")
			end
		else
			sLuaApp:NotifyTipsMsg(player,"摇钱树对你的侍奉习以为常，不再感激你！")
		end
				
		if event["NPCKeyName"] then
			--删任务npc
			GuildCashTree.DestroyTaskNpc(player)
		end
	end
end

--战斗完回调  
function GuildCashTree.FightCallBack(typ, tag, custom)
end
--人物完成战斗回调
function GuildCashTree.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "GuildCashTree", "OnResult")
	
	if victory == 2 then
		--进度+1 检查进度
		if GuildCashTree.CheckStage(player) then
			--设置下个任务
			GuildCashTree.GetNextTask(player)		
			sLuaApp:NotifyTipsMsg(player, "摇钱树又遇到了新的问题，快去看看吧！")
		end
		local player_task_stage = player:GetWeekInt("GuildCashTreePlayerTaskStage")
		if player_task_stage <= GuildCashTreeConfig.OwnRewardNum then
			--获取个人奖励数量 判断
			local content = player:GetString("GuildCashTreeSelectOption")
			local tmp_tb = sLuaApp:StrSplit(content, "$")
			local event = GuildCashTreeConfig.Event[tmp_tb[1]]
			local option_tb = event[tmp_tb[2]]
			
			if event["Reward"] and next(event["Reward"]) then
				--基础奖励
				GuildCashTree.GiveReward(player,event["Reward"], "system", "帮派摇钱树", content)
			end
			if option_tb["Reward"] and next(option_tb["Reward"]) then
				--额外奖励
				GuildCashTree.GiveReward(player, option_tb["Reward"], "system", "帮派摇钱树", content)
				sLuaApp:NotifyTipsMsg(player, "恭喜获得额外奖励！")
			end
			
			if option_tb["GetBoxRand"] and option_tb["BoxKeyName"] and option_tb["BoxReward"] and option_tb["GetBoxRand"] ~= 0 then
				--检查是否需要掉落宝箱
				if sLuaApp:RandInteger(1,10000) <= option_tb["GetBoxRand"] then
					local npc_data = NpcConfig.GetByKeyName(option_tb["BoxKeyName"])
					if not npc_data then
						sLuaApp:LuaErr("GuildCashTree.OnResult 创建宝箱 不存在"..option_tb["BoxKeyName"])
						return ""
					end
					local map = player:GetMap()
					local x = sMapSystem:GetPosX(player)
					local y = sMapSystem:GetPosY(player)
					local point_tb = sMapSystem:GetRandomPoint(map, x, y, 3)
					local box_npc = sNpcSystem:CreateNpc(npc_data.Id, map, point_tb["x"], point_tb["y"], 0, 4, 1)
					if box_npc then
						box_npc:SetVisible(player)
						Data["GuildCashTree"][tostring(player:GetGuild():GetGUID())]["BoxReward"][content] = option_tb["BoxReward"] or {}
						box_npc:SetString("GuildCashTreeBoxRewardKey", content)
						box_npc:SetString("GuildCashTreeNPCType", "宝箱")
					end
					--tips 提醒
					if option_tb["GetBoxTips"] then
						sLuaApp:NotifyTipsMsg(player, option_tb["GetBoxTips"])
					else			
						local name = NpcConfig.GetByKeyName(event["NPCKeyName"]).Name
						sLuaApp:NotifyTipsMsg(player, name.."逃跑时留下一个宝箱！")
					end
					
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player,"摇钱树对你的侍奉习以为常，不再感激你！")
		end
		--删npc
		GuildCashTree.DestroyTaskNpc(player)
	else
		--npc:SetPatrol(true)
	end
end

function GuildCashTree.DestroyTaskNpc(player)
	local guild = player:GetGuild()
	local npc_guid = Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskNPC"][tostring(player:GetGUID())]
	if not npc_guid then
		sLuaApp:LuaErr("TaskNPC 缺失 tb ".. Lua_tools.serialize(Data["GuildCashTree"][tostring(guild:GetGUID())]["TaskNPC"]))
	end
	local npc = sNpcSystem:GetNpcByGUID(npc_guid)
	if sNpcSystem:DestroyNpc(npc) ~= 0 then
		sLuaApp:LuaErr("GuildCashTree 删除npc错误")
	end
end

function GuildCashTree.GiveReward(player, reward, sender, reason, detail)
	--sLuaApp:LuaErr("reward_list"..Lua_tools.serialize(reward))
	if next(reward) then
		-- +exp
		local add_exp = reward["Exp"]
		if add_exp and add_exp ~= 0 then
			local res_exp = GuildCashTree.RewardConfigToNmber(player, add_exp, 1)
			player:AddExp(res_exp, sender, reason, detail)
		end
		-- +pet exp
		local add_pet_exp = reward["PetExp"]
		if add_pet_exp and add_pet_exp ~= 0 then
			local res_pet_exp = GuildCashTree.RewardConfigToNmber(player, add_pet_exp, 1)
			local pets = Lua_tools.GetFightPets(player)
			for _,pet in ipairs(pets) do
				pet:AddExp(res_pet_exp, sender, reason, detail)
			end
		end
		-- +money
		local add_money_type = reward["MoneyType"]
		local add_money_val = reward["MoneyVal"]
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = GuildCashTree.RewardConfigToNmber(player, add_money_val, 1)
			Lua_tools.AddMoney(player, add_money_type, res_money, sender, reason, detail)
		end
		-- +帮派资金
		local add_guild_gold = reward["GuildFund"]
		if add_guild_gold and add_guild_gold ~= 0 then
			local res_guild_gold = GuildCashTree.RewardConfigToNmber(player, add_guild_gold, 1)
			Lua_tools.AddGuildFund(player, res_guild_gold)
		end
		-- +帮贡
		local add_contribution = reward["GuildContribute"]
		if add_contribution and add_contribution ~= 0 then
			local res_contribution = GuildCashTree.RewardConfigToNmber(player, add_contribution, 1)
			player:AddGuildContribute(res_contribution, sender, reason, detail)
			sLuaApp:NotifyTipsMsg(player,"您获得了帮贡"..res_contribution)
		end
		-- +固定物品
		local item_list = reward["Item"]
		if item_list and next(item_list) then
			Lua_tools.AddItem(player, item_list, sender, reason, detail)
		end
		-- +随机物品
		local rand_item_list = reward["RandItemList"]
		if rand_item_list and next(rand_item_list) then
			for k,v in ipairs(rand_item_list) do
				local item_rand_time = v["RandTime"] or 1
				local item_rand_list = v["ItemRand"]
				if item_rand_time and item_rand_list then
					local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, detail..k, item_rand_time)
					if res_item_list[1] ~= "Nil" then
						Lua_tools.AddItem(player, res_item_list, sender, reason, detail)
					end
				end
			end
		end
		
	end


end
--奖励配置表转数字
	-- typ == 1 人物给的奖励 role是player  -typ == 2 最终收获奖励 role是帮派
function GuildCashTree.RewardConfigToNmber(role, add_num, typ)
	local res_num = 0
	local str_factor = ""
	if typ == 1 then
		local guild = role:GetGuild()
		local tree_level = guild:GetInt("GuildCashTreeLevel")
		str_factor = [[
			local PlayerLevel = ]]..role:GetAttr(ROLE_ATTR_LEVEL)..[[
			local TreeLevel = ]]..tree_level..[[
		]]
	elseif typ == 2 then
		local tree_level = role:GetInt("GuildCashTreeLevel")
		local task_stage = role:GetInt("GuildCashTreeTaskStage")
		local task_num = GuildCashTreeConfig.Task["Level_"..tree_level]["TaskNum"]
		local task_ratio = task_stage / task_num
		str_factor = [[
			local TaskRatio = ]]..task_ratio..[[
			local TreeLevel = ]]..tree_level..[[
		]]
	end	
	
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
	if res_num < 0 then
		res_num = 0
	end
	return math.floor(res_num)
end

--任务完成数量+1 检查进度
function GuildCashTree.CheckStage(player)
	local guild = player:GetGuild()
	local tree_level = guild:GetInt("GuildCashTreeLevel")
	local task_stage = guild:GetInt("GuildCashTreeTaskStage") + 1
	guild:SetInt("GuildCashTreeTaskStage", task_stage)
	
	local player_task_stage = player:GetWeekInt("GuildCashTreePlayerTaskStage") + 1
	player:SetWeekInt("GuildCashTreePlayerTaskStage", player_task_stage)
	
	sLuaApp:LuaErr("TreeTaskStage"..task_stage)
	sLuaApp:LuaErr("playerTaskStage"..player_task_stage)

	-- +活跃值
	local active = player:GetWeekInt("GuildCashTreeActiveNum")
	if active < GuildCashTreeConfig.ActiveMax then
		local active_sum = active + GuildCashTreeConfig.ActiveAddNum
		if active_sum > GuildCashTreeConfig.ActiveMax then
			player:SetWeekInt("GuildCashTreeActiveNum", GuildCashTreeConfig.ActiveMax)
			ActivitySystem.AddActiveVal(player, GuildCashTreeConfig.ActiveMax - active)
		else
			player:SetWeekInt("GuildCashTreeActiveNum", active_sum)
			ActivitySystem.AddActiveVal(player, GuildCashTreeConfig.ActiveAddNum)
		end
	end

	if GuildCashTreeConfig.NPCChangeEx[tree_level][task_stage] then
		GuildCashTree.GildSendMail(guild, tree_level, task_stage)
	end
	if GuildCashTreeConfig.NPCChangeEx[tree_level][task_stage] then
		local npc = sNpcSystem:GetNpcByGUID(guild:GetInt("GuildCashTreeNPCGuid"))
		if sNpcSystem:DestroyNpc(npc) ~= 0 then
			sLuaApp:LuaErr("GuildCashTree 删除摇钱树npc错误")
		end
		GuildCashTree.CreateTreeNpc(guild, tree_level, task_stage)
	end
	local max_task_num = GuildCashTreeConfig.Task["Level_"..tree_level]["TaskNum"]
	if task_stage >= max_task_num then
		--设置摇钱树活动为收获阶段
		guild:SetInt("GuildCashTreeActPhase", 2)
		guild:SetString("TreeHarvestMsg", GuildCashTreeConfig.TreeHarvestMsg)
		--初始化帮派的最终宝箱奖励表
		GuildCashTree.CountFinalReward(guild)
		--树等级+1
		local tree_level = guild:GetInt("GuildCashTreeLevel") + 1
		if GuildCashTreeConfig.Task["Level_"..tree_level] then
			guild:SetInt("GuildCashTreeLevel", tree_level)
			sLuaApp:LuaErr("GuildCashTreeLevel"..tree_level)
		end
		
		return false
	end
	return true
end

--到达收获阶段 初始化每个帮派的最终宝箱奖励表
function GuildCashTree.CountFinalReward(guild)
	local initial_reward = GuildCashTreeConfig.FinalReward
	local res_reward = {}
	local add_exp = initial_reward["Exp"]
	if add_exp and add_exp ~= 0 then
		res_reward["Exp"] = GuildCashTree.RewardConfigToNmber(guild, add_exp, 2)
	end
	-- pet exp
	local add_pet_exp = initial_reward["PetExp"]
	if add_pet_exp and add_pet_exp ~= 0 then
		res_reward["PetExp"] = GuildCashTree.RewardConfigToNmber(guild, add_pet_exp, 2)
	end
	-- money
	local add_money_type = initial_reward["MoneyType"]
	local add_money_val = initial_reward["MoneyVal"]
	if add_money_type and add_money_val and add_money_val ~= 0 then
		res_reward["MoneyType"] = initial_reward["MoneyType"]
		res_reward["MoneyVal"] = GuildCashTree.RewardConfigToNmber(guild, add_money_val, 2)
	end
	-- 帮派资金
	local add_guild_gold = initial_reward["GuildFund"]
	if add_guild_gold and add_guild_gold ~= 0 then
		res_reward["GuildFund"] = GuildCashTree.RewardConfigToNmber(guild, add_guild_gold, 2)
	end
	-- 帮贡
	local add_contribution = initial_reward["GuildContribute"]
	if add_contribution and add_contribution ~= 0 then
		res_reward["GuildContribute"] = GuildCashTree.RewardConfigToNmber(guild, add_contribution, 2)
	end
	-- 固定物品
	local item_list = initial_reward["Item"]
	if item_list and next(item_list) then
		res_reward["Item"] = initial_reward["Item"]
	end
	-- 随机物品
	local rand_item_list = initial_reward["RandItemList"]
	if rand_item_list and next(rand_item_list) then
		res_reward["RandItemList"] = {}
		for k,v in ipairs(rand_item_list) do
			res_reward["RandItemList"][k] = {}
			res_reward["RandItemList"][k]["RandTime"] = v["RandTime"]
			res_reward["RandItemList"][k]["ItemRand"] = {}
			for _,b in ipairs(v["ItemRand"])  do
				if type(b.Rand) ~= "number" then
					local res_rand = GuildCashTree.RewardConfigToNmber(guild, b.Rand, 2)
					table.insert(res_reward["RandItemList"][k]["ItemRand"], {["ItemKey"] = b.ItemKey, ["Num"] = b.Num, ["Bind"] = b.Bind, ["Rand"] = res_rand})
				else
					table.insert(res_reward["RandItemList"][k]["ItemRand"], b)
				end
			end
		end
	end
	sLuaApp:LuaErr("FinalReward"..Lua_tools.serialize(res_reward))
	Data["GuildCashTree"][tostring(guild:GetGUID())]["BoxReward"]["FinalReward"] = res_reward
end

function GuildCashTree.GildSendMail(guild, tree_level, task_stage)
	local all_player = sGuildSystem:GetGuildMembers(guild)
	for _,b in ipairs(all_player) do
		sMailSystem:SendMail( 0, "帮派摇钱树", b, 2, "帮派摇钱树", GuildCashTreeConfig.MailMsgEx[tree_level][task_stage], {}, {})
	end
end

function GuildCashTree.CreateTreeNpc(guild, tree_level, task_stage)
	local map = guild:GetMap()
	local npc_data = NpcConfig.GetByKeyName(GuildCashTreeConfig.NPCChangeEx[tree_level][task_stage])
	if not npc_data then
		sLuaApp:LuaErr("GuildCashTree.OnStart 不存在"..GuildCashTreeConfig.NPCChangeEx[tree_level][task_stage])
		return
	end
	local npc = sNpcSystem:CreateNpc(npc_data.Id, map, GuildCashTreeConfig.Site[1], GuildCashTreeConfig.Site[2], 0, 4, 0)
	if npc then
		guild:SetInt("GuildCashTreeNPCGuid", npc:GetGUID())
		npc:SetString("GuildCashTreeNPCType", "摇钱树")
		
	else
		sLuaApp:LuaErr("GuildCashTree.CreateTreeNpc 创建摇钱树失败")
	end
end

--开箱子
function GuildCashTree.OpenBox(npc, player)	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormGuildCashTree", "StopOpenBox", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..GuildCashTreeConfig.ProgressBarTime.."#"..GuildCashTreeConfig.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, GuildCashTreeConfig.ProgressBarTime,1,"GuildCashTree.GetBoxReward",""..npc:GetGUID())
	if t_guid then
		player:SetInt("GuildCashTreeOpenBoxTimer", t_guid)
	end
end

--进度条打断
function GuildCashTree.StopOpenBox(player)
	local timer_guid = player:GetInt("GuildCashTreeOpenBoxTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."GuildCashTree.StopOpenBox HasTimer错误")
	end
	player:SetInt("GuildCashTreeOpenBoxTimer", 0)
end

function GuildCashTree.GetBoxReward(player, timer, npc_guid)
	local npc = sNpcSystem:GetNpcByGUID(npc_guid)
	if not npc then
		sLuaApp:LuaErr(player:GetName().." GuildCashTree.GetBoxReward 不存在npc")
		return
	end
	local reward_key = npc:GetString("GuildCashTreeBoxRewardKey")
	local guild = player:GetGuild()
	local reward = Data["GuildCashTree"][tostring(guild:GetGUID())]["BoxReward"][reward_key]
	GuildCashTree.GiveReward(player, reward, "system", "帮派摇钱树", "宝箱"..reward_key)
	if sNpcSystem:DestroyNpc(npc) ~= 0 then
		sLuaApp:LuaErr("GuildCashTree.GetBoxReward 删除npc错误")
	end
end

GuildCashTree.RandomTable = {}
function GuildCashTree.GetRandIndex(tb_rand,tbname,times)
	if type(tb_rand) ~= "table" then
		return
	end
	if not times or times < 1 then
		times = 1
	end
	--表格存储
	if not GuildCashTree.RandomTable[tbname] then
		GuildCashTree.RandomTable[tbname] = {0}
		for k,v in ipairs(tb_rand) do
			GuildCashTree.RandomTable[tbname][k+1] = GuildCashTree.RandomTable[tbname][k] + (v.Rand or 100)
		end
	end
	--进行随机
	local rander = GuildCashTree.RandomTable[tbname]

	local index_tb = {}
	for s = 1,times do
		local rand = sLuaApp:RandInteger(1,rander[#rander])
		for i = 1,#tb_rand do
			if rand <= rander[i+1] and rand > rander[i] then
				table.insert(index_tb,i)
				break
			end
		end
	end
	return index_tb
end