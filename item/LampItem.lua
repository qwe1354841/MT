--副本物品 火把
LampItem = {}

-- 创建物品
function LampItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function LampItem.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function LampItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local item_name=item:GetKeyName()
	if item_name == "火把" then
		if count > 1 then
			sLuaApp:NotifyTipsMsg(player, "该物品无法多个使用")
			return false
		end
	end
	return true
end

-- 使用物品
function LampItem.on_use_item(player,item,count)
    if item == nil then
        return
    end
	local item_name=item:GetKeyName()
	if item_name == "火把" then
		local map = player:GetMap()
		local hide_x = map:GetInt("HideNPCX")
		local hide_y = map:GetInt("HideNPCY")
		
		local flag = map:GetString("DungeonFlag")
		if not flag or flag == "" then return end
		local map_config = assert(load(" return "..flag ..".MapConfig"))()
		if not map_config then return end
		local floor_num = player:GetInt("DungeonFloor")
		local step = player:GetString("DungeonStep")
		local summon_tb = map_config[floor_num][step]["AddSummon"]
		
		local tips_tb = summon_tb["DistanceTips"]
		local now_x = sMapSystem:GetPosX(player)
		local now_y = sMapSystem:GetPosY(player)
		
		local distance = ((hide_x-now_x) * (hide_x-now_x) + (hide_y-now_y) * (hide_y-now_y)) ^ 0.5
		
		local tmp_range = -1
 		local tips_msg = ""
		local is_show = false
		for _,v in pairs(tips_tb) do
			if distance > v["Range"] then
				if v["Range"] > tmp_range then
					tmp_range = v["Range"]
					tips_msg = v["Msg"]
					is_show = (v["Show"] == 1) and true or false
				end
			end
		end
		sLuaApp:NotifyTipsMsg(player, tips_msg)
		
		local npc_id = NpcConfig.GetByKeyName(summon_tb["LampNPC"]).Id
		local npc = sNpcSystem:CreateNpc(npc_id, map, now_x, now_y, 0, 4, 0)
		if npc then
			npc:SetString("DungeonNPCType", "Lamp")
			npc:SetString("DistanceTipsMsg", tips_msg)
		else
			sLuaApp:LuaErr("LampItem.on_use_item火把创建照明灯npc失败")
		end
		if is_show then
			local hide_keyname = summon_tb["HideNPC"]["KeyName"]
			local hide_npc_id = NpcConfig.GetByKeyName(hide_keyname).Id
			local hide_direction = map:GetInt("HideNPCDirection")
			local npc = sNpcSystem:CreateNpc(hide_npc_id, map, hide_x, hide_y, 1, hide_direction, 0)
			if npc then
				npc:SetString("DungeonNPCType", summon_tb["HideNPC"]["Type"])
				--删除多余的火把 不应该在使用物品的时候销毁该物品
				sLuaTimerSystem:AddTimerEx(map, 100,1,"LampItem.DestroyClueNPC", "")
			else
				sLuaApp:LuaErr("LampItem.on_use_item火把创建隐藏npc失败")
			end
		end
	end
end

--删除多余的火把 灯宝宝
function LampItem.DestroyClueNPC(map, timer, p)
	local player_tb = map:GetAllPlayers()
	for _,v in ipairs(player_tb) do
		Dungeon.DelDungeonItem(v)
	end
	Dungeon.ShowTrace(player_tb[1])
	local clue_npc_keyname = map:GetString("ClueNPCKeyName")
	if clue_npc_keyname == "" then
		sLuaApp:LuaErr(map:GetName().."GetString不存在ClueNPCKeyName")
	else
		local npc_tb = map:GetNpcByKeyName(clue_npc_keyname)
		for _,v in ipairs(npc_tb) do
			sNpcSystem:DestroyNpc(v) 
		end
	end
end