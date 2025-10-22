--物品生成属性随机
FaBao = {}

function FaBao.on_item_create(item)
	if EquipSpecialEffect then
		EquipSpecialEffect.OnCreate(item,4,0)
	end
	if RepairSystem then
		RepairSystem.createEquip(item)
	end
end