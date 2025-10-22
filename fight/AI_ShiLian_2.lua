--无尽的试炼战斗 玩家
AI_ShiLian_2 = {}

function AI_ShiLian_2.OnAI(fighter) --fighter 玩家
	local round_num = tostring(fighter:GetSceneRound()) --战斗中回合数
	--sLuaApp:LuaErr("round_num"..round_num)
	local player_guid = sFightSystem:GetTagCustom(fighter)
	-- +当前回合的buff 
	local now_round_buff_list = Data["WuJinShiLian"][player_guid]["HasBuff"][round_num]
	if now_round_buff_list and next(now_round_buff_list) then
		AI_ShiLian_2.AddFightBuff(fighter, now_round_buff_list)
	end
	-- +每一回合的buff
	local every_round_buff_list = Data["WuJinShiLian"][player_guid]["HasBuff"]["-1"]
	if every_round_buff_list and next(every_round_buff_list) then
		AI_ShiLian_2.AddFightBuff(fighter, every_round_buff_list)
	end
	
	-- 发buff_name泡泡
	local now_round_buff_name = Data["WuJinShiLian"][player_guid]["BuffPaoPao"][round_num]
	local every_round_buff_name = Data["WuJinShiLian"][player_guid]["BuffPaoPao"]["-1"]
	local msg = ""
	if now_round_buff_name and next(now_round_buff_name) then
		for _,v in ipairs(now_round_buff_name) do
			msg = msg .. v .."！"
		end
	end
	if every_round_buff_name and next(every_round_buff_name) then
		for _,v in ipairs(every_round_buff_name) do
			msg = msg .. v .."！"
		end
	end
	if msg ~= "" then
		fighter:SendPaoPao(msg)
	end
end

function AI_ShiLian_2.DelDideFight(fight_tb)
	local died_index_tb = {}
	for k,v in ipairs(fight_tb) do
		if v:IsDied() then
			table.insert(died_index_tb, k)
		end
	end
	for i = #died_index_tb, 1, -1 do
		table.remove(fight_tb, died_index_tb[i])
	end
end

function AI_ShiLian_2.AddFightBuff(fighter, buff_list)
	--sLuaApp:LuaErr("buff_list"..Lua_tools.serialize(buff_list))
	local mon_tb = sFightSystem:GetEnemies(fighter)
	AI_ShiLian_2.DelDideFight(mon_tb)
	if buff_list["MainMonster"] then -- 大部分情况不需要判空
		if mon_tb[1]:GetInt("IsMainMonster") == 1 then
			for _,v in ipairs(buff_list["MainMonster"]) do
				AI_ShiLian_2.CreateBuff(mon_tb[1], v)
			end
		end
	end
	if buff_list["AllMonster"] then
		for _,v in pairs(mon_tb) do
			for _,b in ipairs(buff_list["AllMonster"]) do
				AI_ShiLian_2.CreateBuff(v, b)
			end
		end
	end
	if buff_list["ServantMonster"] then
		--local mon_tb = sFightSystem:GetEnemies(fighter)
		if mon_tb[1]:GetInt("IsMainMonster") == 1 then
			table.remove(mon_tb, 1)
		end
		for _,v in pairs(mon_tb) do
			for _,b in ipairs(buff_list["ServantMonster"]) do
				AI_ShiLian_2.CreateBuff(v, b)
			end
		end
	end
	if buff_list["RandomMonster"] then
		for i = 1, #buff_list["RandomMonster"], 2 do
			local mon_tb = sFightSystem:GetEnemies(fighter)
			AI_ShiLian_2.DelDideFight(mon_tb)
			for j = 1,buff_list["RandomMonster"][i + 1] do
				if #mon_tb >=1 then 
					local index = sLuaApp:RandInteger(1, #mon_tb) 
					local obj = mon_tb[index]
					table.remove(mon_tb, index)
					local list_type = type(buff_list["RandomMonster"][i])
					if list_type == "table" then
						for _,v in ipairs(buff_list["RandomMonster"][i]) do
							AI_ShiLian_2.CreateBuff(obj, v)
						end
					elseif list_type == "number" then
						AI_ShiLian_2.CreateBuff(obj, buff_list["RandomMonster"][i])
					end
				else
					break
				end
			end
		end
	end
	
	if buff_list["MainPlayer"] then
		if not fighter:IsDied() then
			for _,v in ipairs(buff_list["MainPlayer"]) do
				AI_ShiLian_2.CreateBuff(fighter, v)
			end
		end
	end
	local player_tb = sFightSystem:GetFriends(fighter)
	AI_ShiLian_2.DelDideFight(player_tb)
	if buff_list["AllFriend"] then
		for _,v in pairs(player_tb) do
			for _,b in ipairs(buff_list["AllFriend"]) do
				AI_ShiLian_2.CreateBuff(v, b)
			end
		end
	end
	if buff_list["RandomFriend"] then
		for i = 1, #buff_list["RandomFriend"], 2 do
			-- local player_tb = sFightSystem:GetFriends(fighter)
			-- AI_ShiLian_2.DelDideFight(player_tb)
			for j = 1,buff_list["RandomFriend"][i + 1] do
				if #player_tb >= 1 then
					local index = sLuaApp:RandInteger(1, #player_tb) 
					local obj = player_tb[index]
					table.remove(player_tb, index)
					local list_type = type(buff_list["RandomFriend"][i])
					if list_type == "table" then
						for _,v in ipairs(buff_list["RandomFriend"][i]) do
							AI_ShiLian_2.CreateBuff(obj, v)
						end
					elseif list_type == "number" then
						AI_ShiLian_2.CreateBuff(obj, buff_list["RandomFriend"][i])
					end
				else
					break
				end
			end
		end
	end
	if buff_list["AllPlayer"] or buff_list["AllPet"] or buff_list["AllGuard"] then
		local player_tb = sFightSystem:GetFriends(fighter)
		AI_ShiLian_2.DelDideFight(player_tb)
		for _,v in pairs(player_tb) do
			if buff_list["AllPlayer"] and v:GetType() == GUID_PLAYER_FIGHTER then
				for _,b in ipairs(buff_list["AllPlayer"]) do
					AI_ShiLian_2.CreateBuff(v, b)
				end
			end
			if buff_list["AllPet"] and v:GetType() == GUID_PET_FIGHTER then
				for _,b in ipairs(buff_list["AllPet"]) do
					AI_ShiLian_2.CreateBuff(v, b)
				end
			end
			if buff_list["AllGuard"] and v:GetType() == GUID_GUARD_FIGHTER then
				for _,b in ipairs(buff_list["AllGuard"]) do
					AI_ShiLian_2.CreateBuff(v, b)
				end
			end			
		end
	end
end

function AI_ShiLian_2.CreateBuff(fighter, buff_id)
	if not sFightSystem:CreateFightBuff(fighter, buff_id) then
		--失败的原因并不一定是真的没加上
		--sLuaApp:LuaErr("AI_ShiLian_2  CreateFightBuff 失败 "..fighter:GetName().."  "..buff_id)
	end
end