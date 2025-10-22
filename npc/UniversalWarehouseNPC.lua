UniversalWarehouseNPC = {}

function UniversalWarehouseNPC.main(npc, player)
	player:AddNpcOption(npc, 0, "打开仓库", "option1", "")
	return ""
end

function UniversalWarehouseNPC.option1(npc,player)
	sLuaApp:LuaDbg("打开仓库")
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('BagUI', 2)")
	return ""
end