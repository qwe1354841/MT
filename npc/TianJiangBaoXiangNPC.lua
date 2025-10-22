--天降宝箱 宝箱NPC
TianJiangBaoXiangNPC = {}

function TianJiangBaoXiangNPC.main(npc, player)	
	if TianJiangBaoXiang then
		TianJiangBaoXiang.OpenBox(npc, player)
	else
		sLuaApp:LuaDbg("TianJiangBaoXiangNPC 缺少TianJiangBaoXiang")
	end
	return ""
end