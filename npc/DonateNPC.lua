--捐献NPC
DonateNPC = {}

function DonateNPC.main(npc, player)
	player:AddNpcOption(npc, 0, "功勋商店", "option1", "")
	player:AddNpcOption(npc, 0, "捐献物资", "option2", "")
	player:AddNpcOption(npc, 0, "功能简介", "option3", "")
	--local str = [[
	--	GUI.OpenWnd('ShopStoreUI')
	--	GUI.SetVisible(GUI.GetWnd('ShopStoreUI'), false)
	--]]
	--sLuaApp:ShowForm(player, "脚本表单", str)
	--if FormExchangeShop then
	--	FormExchangeShop.GetTabData(player)
	--end
	--if FormDonateEquipAndPet then
	--	FormDonateEquipAndPet.GetExploitShopData(player)
	--end
	--local str = [[
	--	ShopStoreUI.ClickBtnInfo()
	--]]
	--sLuaApp:ShowForm(player, "脚本表单", str)
	return "望天下英雄不记劳苦，踊跃筹集军备，朝廷必有重谢"
end
--sLuaApp:ShowForm(player, "脚本表单", 'GUI.OpenWnd("ShopStoreUI","10,-1,2")')
function DonateNPC.option1(npc,player)
	local index = ExchangeShopConfig.Tab[ExchangeShopConfig.SpecialShopName]["Index"]
	sLuaApp:LuaDbg("index:"..index)
	local str = [[
			GUI.OpenWnd('ShopStoreUI', ]]..index..[[)
		]]
		--ShopStoreUI.Tab = {}
		--ShopStoreUI.Tab = ]] .. Lua_tools.serialize(Data.ExchangeShopTab) .. [[
		--ShopStoreUI.RefreshTab()
		--ShopStoreUI.RefreshData()
		--DonateShopUI.SetVisible(true)
		--ShopStoreUI.ClickDonateShopBtn()
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function DonateNPC.option2(npc,player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if SwitchOnAward then
		local tb = SwitchOnAward.BeStrongInitData()
		local UnlockLevel = tonumber(tb["捐献"]["UnlockLevel"])
		if level < UnlockLevel then
			sLuaApp:NotifyTipsMsg(player, "等级不足55级，无法进行捐献")
			return "等级不足"..UnlockLevel.."级，无法进行捐献"
		end
		sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('DonateUI')")
	end
	return ""
end

function DonateNPC.option3(npc,player)
	return "本将军奉命前来收购装备宠物，望各位少侠给予支出\n捐献装备宠物可获得装备功勋和宠物功勋\n装备功勋和宠物功勋可在兑换商店中兑换奖励\n白色品质装备和普通宠物不能被捐献"
end