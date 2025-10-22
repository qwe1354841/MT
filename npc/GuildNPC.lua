--帮派NPC
GuildNPC = {}

function GuildNPC.main(npc, player)
	if player:GetAttr(ROLE_ATTR_LEVEL) >= 36 then
		player:AddNpcOption(npc, 0 , "查看帮派", "Option1", "");
		player:AddNpcOption(npc, 0 , "回到帮派", "Option2", "");
	end
	return "0"
end

function GuildNPC.Option1(npc, player, str)
	local form_str = [[
		GUI.OpenWnd("FactionCreateUI")
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
    return ""
end

function GuildNPC.Option2(npc, player, str)
	if sGuildSystem:GetGuildByPlayer(player) then
		GoBack(player)
	else
		sLuaApp:NotifyTipsMsg(player, "您还没加入帮派！请先加入帮派！")
	end
    return ""
end