ShangGongTangNPC = {}

function ShangGongTangNPC.main(npc, player)
	if not player:GetGuild() then
		return "您还没有加入帮派！"
	end
	player:AddNpcOption(npc, 0, "进入赏功堂", "option1", "")
	return "每天对着账本，看得我头大"
end

function ShangGongTangNPC.option1(npc,player)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('FactionPrizeUI')")
	return ""
end