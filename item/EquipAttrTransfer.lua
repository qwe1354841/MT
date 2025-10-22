EquipAttrTransfer = {}

local TransferInt = {"EQUIP_IntensifyLevel","OpenLightLevel","ITEM_GemNum", "ITEM_GemId_1", "ITEM_GemId_2","ITEM_GemId_3", "ITEM_GemValue_1", "ITEM_GemValue_2", "ITEM_GemValue_3"}
local TransferString = {"LianQiAttr_Id"}

function EquipAttrTransfer.ItemTransfer(player,equip_1,equip_2)
	if equip_1:GetOwnerGUID() ~= player:GetGUID() then
		local guard = sGuardSystem:GetGuard(equip_1:GetOwnerGUID())
		local Master = guard:GetMaster()
		if Master:GetGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "道具拥有者数据异常1")
			return false
		end
	end
	
	if equip_2:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "道具拥有者数据异常")
		return false
	end
	
	for k,v in ipairs(TransferInt) do
		equip_2:SetInt(v,equip_1:GetInt(v))
	end
	for k, v in pairs(TransferString) do
		equip_2:SetString(v,equip_1:GetString(v))
	end
	if EquipAttrClassify then
		for k,v in pairs(EquipAttrClassify) do
			if k ~= "EquipIntensify" then	
				local attrList = equip_1:GetDynAttrsByMark(v)
				equip_2:SetDynAttrsByMark(v,0)
				for a,b in ipairs(attrList) do
					equip_2:SetDynAttr(v,b.attr,b.value)
				end
			end
		end
	end
	
	if EquipLight then
		EquipLight.LightCopy(equip_1, equip_2)
	end
	EquipIntensify.RefreshAttr(equip_2)
	return true
end

