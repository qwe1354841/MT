--丹炉活动兑换NPC
DanLuLaoJunNPC = {}

function DanLuLaoJunNPC.main(npc, player)
	local id = npc:GetInt("DanLuLaoJunActID")
	local act_data = ActivityConfig.GetById(id)
	if not act_data then
		sLuaApp:LuaErr("ActivityConfig 不存在"..id)
		return
	end
	local level_min = tonumber(act_data.LevelMin)
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		return "连"..level_min.."级都达不到，有什么资格来见老道！"
	end
	local msg = "请少侠们帮助老道消灭丹炉器灵及丹炉残渣，老道将回报丰厚奖励。\n"..
		"10月10日老道将收走丹炉器灵及丹炉残渣，请少侠抓紧时间。\n"..
		"10月12日老道将回归天庭，不再接受兑换。"
	player:AddNpcOption(npc, 0, "兑换商店", "option1", "")
	player:AddNpcOption(npc, 0, "活动简介", "option2", "")
	return msg
end

function DanLuLaoJunNPC.option1(npc, player, content)
	local err_msg = "老道法力失效，请少侠自行打开商店"
	if ExchangeShop then
		if not ExchangeShop.OpenExchangeShop(player, DanLuLaoJun.ShopName) then
			return err_msg
		end
    else
		sLuaApp:LuaErr("缺少ExchangeShop")
		return err_msg
	end
	return ""
end
function DanLuLaoJunNPC.option2(npc, player, content)
	local msg = "1.击杀老君的丹炉器灵可掉落暗淡的金丹、精金锤等丰厚奖励。\n"..
		"2.每次击杀丹炉器灵均需要消耗一枚太清丹，太清丹等道具每天将免费发送至邮箱。\n"..
		"3.对老君的丹炉炉渣使用精金锤可以获得暗淡的金丹等丰厚奖励。\n"..
		"4.丹炉残渣分为普通、坚固、金色三种品质，掉落奖励也根据品质变得更加丰厚。"
    return msg
end

