--引导战斗任务相关 by shodow_yong
NPC10060 = {}

function NPC10060.main(npc, player)
	if sQuestSystem:GetQuestState(player,205) == 3 then
		player:SetAutoFight(false)
	end
	return "0"
end






