ShangJinBangNpc = {}

function ShangJinBangNpc.option1(npc, player, content)
	local str = [[
		GUI.OpenWnd("BountyQuestUI")
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

function ShangJinBangNpc.main(npc, player)
	local pk = player:GetPk()
	local str = ""
	if pk >= 0 then
		str = "天道"
	else
		str = "魔道"
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) >= 40 then
		player:AddNpcOption(npc, 0, str.."赏金榜", "option1", "")
	end
	return ""
end