--仙兽福缘 宝箱NPC
XianShouFuYuanNPC = {}

function XianShouFuYuanNPC.main(npc, player)	
	if XianShouFuYuan then
		XianShouFuYuan.OpenBox(npc, player)
	else
		sLuaApp:LuaDbg("XianShouFuYuanNPC 缺少XianShouFuYuan")
	end
	return ""
end