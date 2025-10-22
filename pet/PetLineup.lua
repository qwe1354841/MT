--宠物阵容
PetLineup = {}

--阵容格子解锁等级配置 
PetLineup.UnlockConfig = {
	[0] = 0,	-- 主宠格子0级解锁
	[1] = 29,	-- 侍宠1格子29级解锁
	[2] = 45,
	[3] = 65,
	[4] = 85,
}

function PetLineup.GetData(player)
	local str = [[
		if UIDefine then
			UIDefine.UnlockLevel = ]]..PetLineup.UnlockConfigStr..[[
			UIDefine.NowLineupList = ]].. Lua_tools.serialize(PetLineup.GetNowLineup(player)) ..[[
			UIDefine.RefreshPetLineUp()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end


--上阵
--侍宠 要先填满前面的格子
function PetLineup.UpLineup(player, pet_guid, pos)
	if not pet_guid or not pos then return end
	local pet = PetLineup.CheckPet(player, pet_guid)
	if not pet then return end
	if pet:IsLineup() then return end
	--判断寿命
	local pet_data = PetConfig.GetById(pet:GetId())
	local max_life = pet_data.Life
	if max_life ~= -1 then
		local now_life = pet:GetPetLife()
		if now_life == 0 then
			sLuaApp:NotifyTipsMsg(player, "您的宠物已经死亡，无法出战！")
			return
		end	
	end

	pos = tonumber(pos) 
	local pos_level = PetLineup.UnlockConfig[pos]
	if not pos_level then
		sLuaApp:LuaErr("PetLineup.UpLineup  UnlockConfig 不存在 "..pos)
		return
	end
	
	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	if player_level < pos_level then
		sLuaApp:NotifyTipsMsg(player, pos_level.."级开启")
		return
	end
	
	local global_data = GlobalConfig.GetById(1)
	local PetPlayerFightLevel = global_data.PetMaxBattleLvAbove -- 相差X级无法出战
	local fight_check_level = player_level + PetPlayerFightLevel
	local pet_level = pet:GetAttr(ROLE_ATTR_LEVEL)
	if fight_check_level < pet_level then
		sLuaApp:NotifyTipsMsg(player, "宠物高出人物等级"..PetPlayerFightLevel.."级，无法上阵")
		return
	end
	
	if sPetSystem:SetLineup(pet, pos) ~= 0 then
		sLuaApp:LuaErr("SetLineup 错误 "..pet_guid)
	end
	PetLineup.ShowFormNowLineup(player)
end


--下阵
--侍宠 前面的格子下阵会自动补上
function PetLineup.DownLineup(player, pet_guid)
	if not pet_guid then return end
	local pet = PetLineup.CheckPet(player, pet_guid)
	if not pet then return end
	if sPetSystem:ClrLineup(pet) ~= 0 then
		sLuaApp:LuaErr("ClrLineup 错误 "..pet_guid)
	end
	PetLineup.ShowFormNowLineup(player)
end


--交换位置
function PetLineup.SwapLineup(player, pos_1, pos_2)
	if not pos_1 or not pos_2 then return end
	pos_1 = tonumber(pos_1)
	pos_2 = tonumber(pos_2)
	local pos_1_level = PetLineup.UnlockConfig[pos_1]
	if not pos_1_level then
		sLuaApp:LuaErr("PetLineup.UpLineup  UnlockConfig 不存在 "..pos_1)
		return
	end
	local pos_2_level = PetLineup.UnlockConfig[pos_2]
	if not pos_2_level then
		sLuaApp:LuaErr("PetLineup.UpLineup  UnlockConfig 不存在 "..pos_2)
		return
	end
	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	if player_level < pos_1_level then
		sLuaApp:NotifyTipsMsg(player, pos_1_level.."级开启")
		return
	end
	if player_level < pos_2_level then
		sLuaApp:NotifyTipsMsg(player, pos_2_level.."级开启")
		return
	end

	if sPetSystem:SwapLineup(player, pos_1, pos_2) ~= 0 then
		sLuaApp:LuaErr("SwapLineup 错误 ")
	end
	
	PetLineup.ShowFormNowLineup(player)
end

function PetLineup.ShowFormNowLineup(player)
	local str = [[
		if UIDefine then
			UIDefine.NowLineupList = ]].. Lua_tools.serialize(PetLineup.GetNowLineup(player)) ..[[
			UIDefine.RefreshPetLineUp()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end


function PetLineup.CheckPet(player, pet_guid)
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetLineup 不存在宠物 ")
		return false
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetLineup "..pet_guid.." 不属于 "..player:GetName())
		return false
	end
	return pet
end

function PetLineup.GetNowLineup(player)
	local lineup_list = {}
	local main_pet = sPetSystem:GetMainPet(player)
	lineup_list[0] = tostring(main_pet and main_pet:GetGUID() or -1)
	for i = 1,4 do 
		local guard_pet = sPetSystem:GetGuardPet(player, i)
		lineup_list[i] = tostring(guard_pet and guard_pet:GetGUID() or -1)
	end
	return lineup_list
end

--战斗中上阵宠物前
function PetLineup.pre_pet_fighter_summon_out(fight_pet, fight_player)
	local player_guid = fight_player:GetGUID()
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	--可以上阵宠物总数
	local summon_pet_max = player:GetInt("PetLineup_SummonPetMax")
	if summon_pet_max == -1 then -- -1表示无限次
		return true
	end

	local summon_pet_num = player:GetInt("PetLineup_SummonPetNum")
	if summon_pet_num >= summon_pet_max then
		sLuaApp:NotifyTipsMsgEx(player, "宠物召唤次数已达上限")
		return false
	end
	player:SetInt("PetLineup_SummonPetNum", summon_pet_num + 1)
	return true
end

--清空记录的召唤次数
function PetLineup.ClearSummonNum(player)
	player:SetInt("PetLineup_SummonPetNum", 0)
end

--战斗中上阵宠物
function PetLineup.on_pet_fighter_summon_out(fight_pet, fight_player)
	-- sLuaApp:LuaErr("on_pet_fighter_summon_out")
	--local pet_guid = fight_pet:GetGUID()
	--sLuaApp:LuaErr("pet_guid "..pet_guid)
	local player_guid = fight_player:GetGUID()
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)

	PetLineup.ShowFormNowLineup(player)
	-- local lineup_list = PetLineup.GetNowLineup(player)
	-- sLuaApp:LuaErr("lineup_list "..Lua_tools.serialize(lineup_list))
	-- if lineup_list[1] == pet_guid then -- 已经是主宠
		-- return
	-- end
	-- for i = 1,4 do
		-- if lineup_list[i] == pet_guid then
			-- sLuaApp:LuaErr("if lineup_list[i] == pet_guid then")
			-- PetLineup.SwapLineup(player, 0, i)
			-- return
		-- end
	-- end
	-- sLuaApp:LuaErr("	PetLineup.UpLineup(player, pet_guid, 0)")
	-- PetLineup.UpLineup(player, pet_guid, 0)
	-- return
end

function PetLineup.Initialization()
	PetLineup.UnlockConfigStr = Lua_tools.serialize(PetLineup.UnlockConfig)
end
PetLineup.Initialization()


function PetLineup.smtl(player)
	local main_pet = sPetSystem:GetMainPet(player)
	sLuaApp:LuaErr("main_pet ".. (main_pet and main_pet:GetGUID() or 0))
	for i = 1,4 do 
		local guard_pet = sPetSystem:GetGuardPet(player, i)
		sLuaApp:LuaErr("guard_pet ".. (guard_pet and guard_pet:GetGUID() or 0))
	end

end