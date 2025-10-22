--物品生成属性随机
GuangZhuang = {}

GuangZhuang.Config = {
	[1] = {
		[0] = {"光装武器",2},
	},
	[2] = {
		[1] = {"光装头盔",2},
		[2] = {"光装护甲",2},
		[3] = {"光装护腰",2},
		[5] = {"光装挂坠",2},
	},
	[3] = {
		[1] = {"光装戒指",2},
		[2] = {"光装项链",2},
		[3] = {"光装护腕",2},
		[4] = {"光装靴子",2},
	},
}

function GuangZhuang.on_item_create(item)
	item:SetString("EquipCreateRule", "GuangZhuang.Config")
	EquipCreate.on_item_create(item)
end