--装备换装继承 强化和宝石
EquipInherit = {}

function EquipInherit.on_post_swap_equip(player, new_equip, old_equip, is_pet)
	-- sLuaApp:LuaErr("player"..player:GetName())
	 --sLuaApp:LuaErr("new_equip"..new_equip:GetName())
	 --sLuaApp:LuaErr("old_equip"..old_equip:GetName())
	-- sLuaApp:LuaErr("is_pet"..tostring(is_pet))
	local msg = ""
	
	
	local CD = new_equip:GetName()  --穿戴装备
	local TX = old_equip:GetName()  --脱下装备
	
	local new_equip_level = new_equip:GetGrade() -- 穿戴装备等级
	local old_equip_level = old_equip:GetGrade() -- 脱下装备等级
	
	
	--sLuaApp:NotifyTipsMsg(player,"装备品级："..equip_level)
	
	
	
  local keyname = old_equip:GetKeyName()  -- 1. 获取装备标识名
  local itemdata = ItemConfig.GetByKeyName(keyname)  -- 2. 查询配置表
  
	
 
 
  local equipLevel = itemdata.Grade  -- 3. 从配置中提取装备等级
  sLuaApp:NotifyTipsMsg(player, "装备【" .. old_equip:GetName() .. "】的等级为：" .. equipLevel)	
	
	
	
	
	
	
	
	
	if TX == "折扇" then 
	  sLuaApp:NotifyTipsMsg(player,"可以开始扣除装备"..TX)
	  --sItemSystem:DestroyItem(old_equip,"system","ces","test")
	end
	
	
	--sLuaApp:NotifyTipsMsg(player, "装备【" .. equip:GetName() .. "】已帮你回收")
	
	
	--sLuaApp:NotifyTipsMsg(player, "穿戴装备"..CD.."脱下装备"..TX)
	
	
	
	
	
	
	
	
	local need_inherit_intensify = 0
	local old_intensify_level = old_equip:GetInt("EQUIP_IntensifyLevel")
	local new_intensify_level = new_equip:GetInt("EQUIP_IntensifyLevel")
	if old_intensify_level > new_intensify_level then
		need_inherit_intensify = 1
		msg = "是否将当前装备的强化等级转移到新装备上？"
	end
	
	local need_inherit_gem = 0
	if EquipInherit.HasGem(old_equip) and not EquipInherit.HasGem(new_equip) then
		need_inherit_gem = 1
		msg = "是否将当前装备的宝石全部转移到新装备上？"
	end
	
	if need_inherit_intensify == 1 and need_inherit_gem == 1 then
		msg = "是否将当前装备的强化等级和宝石都转移到新装备上？"
	end

	--使用装备方案中
	if player:GetInt("EquipPlan_Using") == 1 then
		player:SetInt("EquipPlan_Using", 0)
		EquipInherit.Start(player, new_equip:GetGUID(), old_equip:GetGUID(), need_inherit_intensify, need_inherit_gem, 0)
		return
	end

	if msg ~= "" then
		local str = [[
			GlobalUtils.ShowServerBoxMessageEx("]]..msg..[[")
			GlobalProcessing.EquipAutoUseState(0)
		]]
		player:SetString("SYSTEM_ConfirmBox_Function", "EquipInherit.Start(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..new_equip:GetGUID()..","..old_equip:GetGUID()..","..need_inherit_intensify..","..need_inherit_gem..","..tostring(is_pet)..")")
		player:SetString("SYSTEM_ConfirmBox_Function_Cancel", "EquipInherit.Cancel(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function EquipInherit.Start(player, new_equip_guid, old_equip_guid, need_inherit_intensify, need_inherit_gem, is_pet)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return ""
	end
	local new_equip = sItemSystem:GetItemByGUID(new_equip_guid)
	local old_equip = sItemSystem:GetItemByGUID(old_equip_guid)
	if not new_equip or not old_equip then return end
	local player_guid = player:GetGUID()
	if is_pet and is_pet == 1 then 
		-- 宠物装备
		local owner = new_equip:GetItemContainer():GetOwner()
		if not owner then return end
		local owner_type = owner:GetType()
		if owner_type ~= GUID_PET then
			sLuaApp:LuaErr("EquipInherit.Start 装备主人错误 owner_type ~= GUID_PET")
			return
		end
		if owner:GetOwner() ~= player then
			sLuaApp:LuaErr("EquipInherit.Start "..new_equip.." 装备主人的主人非"..player:GetName())
			return
		end
		if old_equip:GetOwnerGUID() ~= player_guid then
			sLuaApp:LuaErr("EquipInherit.Start is_pet 装备主人错误")
			return
		end
	else
		if new_equip:GetOwnerGUID() ~= player_guid or old_equip:GetOwnerGUID() ~= player_guid then
			sLuaApp:LuaErr("EquipInherit.Start 装备主人错误")
			return
		end
	end
	
	if need_inherit_intensify == 1 then
		local intensify_level = old_equip:GetInt("EQUIP_IntensifyLevel")
		local mark = EquipAttrClassify.EquipIntensify or 10
		old_equip:SetDynAttrsByMark(mark, 0)
		old_equip:SetInt("EQUIP_IntensifyLevel", 0)
		old_equip:SetDynAttr(EquipAttrClassify.EquipLight or 20, ROLE_ATTR_EFFECT_1, 0)
		sLogServerSystem:LogItemToServer(0, player, old_equip, "装备继承老装备强化等级", intensify_level, 0, "老装备失去强化等级", "")
		
		sLogServerSystem:LogItemToServer(0, player, new_equip, "装备继承新装备强化等级", new_equip:GetInt("EQUIP_IntensifyLevel"), intensify_level,  "新装备获得强化等级", "")
		if is_pet and is_pet == 1 then
			PetEquipIntensify.SetIntensify(player, new_equip, intensify_level)
		else
			EquipIntensify.SetEquipIntensifyLevel(player, new_equip, intensify_level, 1)
		end
	end
	
	if need_inherit_gem == 1 then
		for i = 1, EquipGem.MaxGemNum do
			local gem_id = old_equip:GetInt("ITEM_GemId_" .. i)
			if gem_id ~= 0 then 
				old_equip:SetInt("ITEM_GemId_" .. i, 0)
				sLogServerSystem:LogItemToServer(0, player, old_equip, "装备继承老装备宝石孔"..i , gem_id, 0, "老装备失去宝石", "")
				new_equip:SetInt("ITEM_GemId_" .. i, gem_id)
				sLogServerSystem:LogItemToServer(0, player, new_equip, "装备继承新装备宝石孔"..i , 0, gem_id, "新装备获得宝石", "")
				
				local mark = EquipAttrClassify["EquipGemSlot_" .. i]
				local gem_attrs = old_equip:GetDynAttrsByMark(mark)
				old_equip:SetDynAttrsByMark(mark, 0)
				new_equip:SetDynAttrsByTable(mark, gem_attrs)
			end
		end
		if AttributeEnhance then
			AttributeEnhance.Equip_Strengthen_level(player)
		end
	end
	if is_pet and is_pet == 1 then
		local pet = new_equip:GetItemContainer():GetOwner()
		pet:RecalcAttr()
	else
		player:RecalcAttr()
	end
	
	local str = [[
		GlobalProcessing.EquipAutoUseState(1)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipInherit.HasGem(equip)
	for i = 1, EquipGem.MaxGemNum do
		local gem_id = equip:GetInt("ITEM_GemId_" .. i)
		if gem_id ~= 0 then 
			return true
		end
	end
	return false
end

--点击取消 可能重启快速装备的倒计时
function EquipInherit.Cancel(player)
	local str = [[
		GlobalProcessing.EquipAutoUseState(1)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end