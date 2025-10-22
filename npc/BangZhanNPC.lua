--帮派竞技NPC
BangZhanNPC = {}

function BangZhanNPC.main(npc, player)
	if player:GetAttr(ROLE_ATTR_LEVEL) >= Act_BangZhan.Level then
		if sLuaApp:IsActivityRunning(Act_BangZhan.ID) then 
			player:AddNpcOption(npc, 0 , "帮派竞技", "option", "")
		else
			player:AddNpcOption(npc, 0 , "上期信息", "option", "")
		end
	end
	return "0"
end

function BangZhanNPC.option(npc, player, str)
	local FormStr = [[
		GUI.OpenWnd("FactionFightUI")
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
    return ""
end
