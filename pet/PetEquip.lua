--宠物穿脱装备
PetEquip = {}
-- PetEquip.GradeColor = {
	-- [1] = "#FBDCB7ff",
	-- [2] = "#46DC5Fff",
	-- [3] = "#42B1F0ff",
	-- [4] = "#E855FFff",
	-- [5] = "#FF8700ff",
	-- [6] = "#FF0000ff",

-- }
-- function PetEquip.GetGradeColor(grade)
	-- return PetEquip.GradeColor[grade] or "#FFFFFFff"
-- end
--宠物穿装备
function PetEquip.PutOnEquip(player, pet_guid, equip_guid)
	if not pet_guid or not equip_guid then return end
    local equip = sItemSystem:GetItemByGUID(equip_guid)
    local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not equip or not pet then return end
	
    if player ~= pet:GetOwner() then
        sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作！")
		return
    end
	if equip:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非物品拥有者，无法操作！")
		return
	end
	--判断战斗中
	if not PetEquip.CheckFight(pet) then return end
	
	local equipData = ItemConfig.GetByKeyName(equip:GetKeyName())
	if not equipData then
		sLuaApp:LuaErr("ItemConfig 不存在"..equip:GetKeyName())
		return
	end
	if equipData.Level > pet:GetAttr(ROLE_ATTR_LEVEL) then
		sLuaApp:NotifyTipsMsg(player, "宠物等级不足，无法装备！")
		return
	end
	if equipData.Type == 1 and equipData.Subtype == 7 then
		local sub_type_2 = equipData.Subtype2
		if sub_type_2 == 4 then
			local pet_data = PetConfig.GetByKeyName(pet:GetKeyName())
			if not pet_data then
				sLuaApp:LuaErr("PetEquip PetConfig不存在"..pet:GetKeyName())
				return
			end
			if equipData.KeyName ~= pet_data.TrinketKey then
				--sLuaApp:LuaErr(equipData.KeyName.."-"..pet_data.TrinketKey)
				sLuaApp:NotifyTipsMsg(player, "宠物仅可装备专属饰品！")
				return
			end
		end
		if not equip:IsBound() then
			--local str = [[GlobalUtils.ShowServerBoxMessage("<color=]]..PetEquip.GetGradeColor(equipData.Grade)..[[>]]..equip:GetName()..[[</color>装备后将绑定，是否继续？")]]
			local str = [[GlobalUtils.ShowServerBoxMessage("<color=#" ..UIDefine.GradeColorLabel[]]..equipData.Grade..[[] .. ">]]..equip:GetName()..[[</color>装备后将绑定，是否继续？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetEquip.SetEquipBound(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..equip_guid..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
		
		local equip_con = pet:GetEquipContainer()
		local old_equip = equip_con:GetItemBySite(sub_type_2 - 1)
		
		local ret = sItemSystem:PutOnEquip(pet,equip)
		if ret ~= 0 then
			sLuaApp:LuaErr("PetEquip  PutOnEquip 错误")
			return
		end
		if sub_type_2 == 4 then
			pet:SetInt("PetEquip_HasTrinket", 1)
		end
		-- 装备继承
		if old_equip then
			EquipInherit.on_post_swap_equip(player, equip, old_equip, 1)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "该物品不是宠物装备")
	end

end

function PetEquip.SetEquipBound(player, pet_guid, equip_guid)
	local equip = sItemSystem:GetItemByGUID(equip_guid)
	equip:SetBound()
	PetEquip.PutOnEquip(player, pet_guid, equip_guid)
end


-- function PetEquip.PutOn(pet,equip)
	-- if not equip:IsBound() then
		-- equip:SetBound()
	-- end
	-- local ret = sItemSystem:PutOnEquip(pet,equip)
	-- if ret ~= 0 then
		-- sLuaApp:LuaErr("PetEquip  PutOn 错误")
		-- return
	-- end
-- end


--宠物脱装备
function PetEquip.TakeOffEquip(player,pet_guid,equip_site)
	if not pet_guid or not equip_site then return false end
    local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then return false end
	if player ~= pet:GetOwner() then
        sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作！")
		return false
    end
	--判断战斗中
	if not PetEquip.CheckFight(pet) then return false end
	
	if Lua_tools.GetBagFree(player) < 1 then
		sLuaApp:NotifyTipsMsg(player, "包裹已满")
		return false
	end
	
	equip_site = tonumber(equip_site)
	local equipContainer = pet:GetEquipContainer()
    local equip = equipContainer:GetItemBySite(equip_site)
	if not equip then
		sLuaApp:LuaErr("PetEquip 不存在装备 equip_site"..equip_site)
		return false
	end
	local equipData = ItemConfig.GetByKeyName(equip:GetKeyName())
	if not equipData then
		sLuaApp:LuaErr("ItemConfig 不存在"..equip:GetKeyName())
		return false
	end
	if equipData.Type == 1 and equipData.Subtype == 7 then
		local ret = sItemSystem:TakeOffEquip(pet, equip)
		if ret ~= 0 then
			sLuaApp:LuaErr("PetEquip  TakeOffEquip 错误")
			return false
		end
		if equipData.Subtype2 == 4 then
			pet:SetInt("PetEquip_HasTrinket", 0)
		end
		return true
	else
		sLuaApp:NotifyTipsMsg(player, "该物品不是宠物装备")
		return false
	end
	return false
end

function PetEquip.CheckFight(pet)
	if pet:GetAttr(ROLE_ATTR_IS_FIGHT) == 1 then
		local player = pet:GetOwner()
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	return true
end