--无尽的试炼 NPC
ShiLianNPC = {}

function ShiLianNPC.option1(npc, player, content)
	if not ShiLian.CheckLevel(player) then
		return ""
	end
	if ShiLian then
		ShiLian.GetData(player)
    end
	return ""
end

function ShiLianNPC.main(npc, player)
    player:AddNpcOption(npc, 0, "无尽的试炼", "option1", "")
    return ""
end