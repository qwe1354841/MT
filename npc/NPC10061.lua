--引导战斗任务相关 by shodow_yong
NPC10061 = {}

function NPC10061.main(npc, player)
	if sQuestSystem:GetQuestState(player,207) == 3 then
		player:SetAutoFight(false)
	end
	return "0"
end






