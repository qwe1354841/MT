--需要全服通告的道具（keyname）
ItemAdvert = {}


ItemAdvert.ItemList = {
	"橙色神兽碎片1",
	"橙色神兽碎片2",
	"橙色神兽碎片3",
	"橙色神兽碎片4",
	"9级赤焰石",
	"9级紫烟石", 
	"9级孔雀石", 
	"9级落星石", 
	"9级沐阳石", 
	"9级芙蓉石", 
	"9级琉璃石", 
	"9级寒山石", 
	"10级赤焰石",
	"10级紫烟石",
	"10级孔雀石",
	"10级落星石",
	"10级沐阳石",
	"10级芙蓉石",
	"10级琉璃石",
	"10级寒山石",
	"9级抗火石", 
	"9级抗风石", 
	"9级抗水石", 
	"9级抗雷石", 
	"9级抗物理石",
	"9级抗混乱石",
	"9级抗中毒石",
	"9级抗昏睡石",
	"9级抗封印石",
	"9级抗遗忘石",
	"9级抗鬼火石",
	"10级抗火石",
	"10级抗风石",
	"10级抗水石",
	"10级抗雷石",
	"10级抗物理石",
	"10级抗混乱石",
	"10级抗中毒石",
	"10级抗昏睡石",
	"10级抗封印石",
	"10级抗遗忘石",
	"10级抗鬼火石",
	"如虎添翼",
	"潮鸣电掣",
	"兵临城下",
	
	
	
	
	
	
}

--需要全服通告的宠物（keyname）
ItemAdvert.PetList = {
	"代理金池长老",
	"代理敖丙",
	"代理唐僧",
	"代理红孩儿",
	"代理龙王",
	"代理九尾狐狸",
	"代理沙和尚",
	"代理猪八戒",
	"代理小麒麟",
	"代理火纹麟",
	"代理天行卫",
	"代理无极熊猫",
	"代理凝月童子",
	"代理灵吉菩萨",
	"代理九灵元圣",
	"代理孟婆",
	"代理白骨夫人",
	"代理灵感大王",
	"代理银角大王",
	"代理牛魔王",
	"代理杨戬",
	"代理水德真君",
	"代理至尊宝",
	"代理白泽",
	"代理森林贤者",
	"代理哪吒",
	"代理镇元子",
	"代理太上老君",
	"代理金角大王",
	"代理观音菩萨",
	"代理金翅大鹏王",
	"代理刑天",
	"代理天玄仙",
	"代理孙悟空",
	"代理喵呜咪",
	"代理三生蝶",
	"代理碧浪公主",
	"代理丹熏鼠",
}

--不能全服通告的方式
ItemAdvert.SheildList = {
	"邮件领取",
	"宝石拆除",
	"",
	"奖励领取"
}

--品质颜色配置
ItemAdvert.ColorConfig = {
	[1] = "#FBDCB7ff",
	[2] = "#46DC5Fff",
	[3] = "#42B1F0ff",
	[4] = "#E855FFff",
	[5] = "#FF8700ff",
	[6] = "#FF0000ff",

}

function ItemAdvert.ItemGet(player, item, count, sender, reason, detail)
	if sender == "GM指令" then
		return
	end
	local keyName = item:GetKeyName()
	if not ItemAdvert.Items[keyName] then
		return
	end
	if ItemAdvert.Sheilds[reason] then
		return
	end
	local name = item:GetName()
	local grade = item:GetGrade()
	
	--local str_ac = ItemAdvert.ActivityName[reason]
	--
	--if not str_ac then
	--	str_ac = ""
	--else
	--	str_ac = "在 " .. str_ac .. " 中"
	--end
	
	local str_ac = "在 " .. reason .. " 中"
	
	sLuaApp:NotifyTopMsgToAll(1, "玩家： "..player:GetName().." "..str_ac.."获得了珍贵的 <color="..(ItemAdvert.ColorConfig[grade] or "#E855FFff")..">".. name .. "</color>！")
end

function ItemAdvert.PetGet(pet, player, sender, reason, detail)
	--if sender == "GM指令" then
	--	return
	--end
	local keyName = pet:GetKeyName()
	if not ItemAdvert.Pets[keyName] then
		return
	end
	if ItemAdvert.Sheilds[reason] then
		return
	end
	local name = pet:GetName()
	
	local grade = PetConfig.GetByKeyName(keyName).Grade
	
	--local str_ac = ItemAdvert.ActivityName[reason]
	--
	--if not str_ac then
	--	str_ac = ""
	--else
	--	str_ac = "在 " .. str_ac .. " 中"
	--end
	
	local str_ac = "在 " .. reason .. " 中"
	
	sLuaApp:NotifyTopMsgToAll(1, "玩家： "..player:GetName().." "..str_ac.."获得了珍贵的 <color="..(ItemAdvert.ColorConfig[grade] or "#E855FFff")..">".. name .. "</color>！")
end

function ItemAdvert.Initialization()
	if ItemAdvert.ItemList then
		ItemAdvert.Items = {}
		for k,v in ipairs(ItemAdvert.ItemList) do
			ItemAdvert.Items[v] = 1
		end
	end
	
	if ItemAdvert.PetList then
		ItemAdvert.Pets = {}
		for k,v in ipairs(ItemAdvert.PetList) do
			ItemAdvert.Pets[v] = 1
		end
	end
	
	if ItemAdvert.SheildList then
		ItemAdvert.Sheilds = {}
		for k,v in ipairs(ItemAdvert.SheildList) do
			ItemAdvert.Sheilds[v] = 1
		end
	end
end

--ItemAdvert.Initialization()