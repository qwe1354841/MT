EquipAttrClassify = {
	['Primordial'] = 0,
	['Basic'] = 1,
	['Basic_2'] = 2,
	['Basic_3'] = 3,
	['Basic_4'] = 4,
	['Basic_5'] = 5,
	['EquipIntensify'] = 10,
	['EquipArtifice'] = 11,
	['SuperBuild'] = 12,
	['EquipLight'] = 20,
	['EquipGemSlot_1'] = 30,
	['EquipGemSlot_2'] = 31,
	['EquipGemSlot_3'] = 32,
	['EquipGemSlot_4'] = 33,
	['EquipGemSlot_5'] = 34,
	['GemAttr'] = 39,
	['EquipLianQi'] = 40,
	['PetEquipArtifice'] = 51,
	["MingHunRefining"] = 52,
	["EquipSoulReforge"] = 60, --占用60~100
	["ProduceMedicine"] = 101,
}





--设置非基础属性  使提升装备基础属性的属性不生效
function EquipAttrClassify.SetIgnoreBasic()
	if sItemSystem.SetIgnoreBasicMarks then
		local mark_tb = {}
		for i = 1, 200 do
			-- 之前 提升装备基础属性 中的基础属性包含了装备强化属性
			-- if i ~= EquipAttrClassify['EquipIntensify'] then
				table.insert(mark_tb, i)
			-- end
		end
		sItemSystem:SetIgnoreBasicMarks(mark_tb)
	else
		sLuaApp:LuaErr("not SetIgnoreBasicMarks")
	end
end