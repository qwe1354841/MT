--引导战斗任务相关 by shodow_yong
NPC10056 = {}

function NPC10056.main(npc, player)
	if sQuestSystem:GetQuestState(player,203) == 3 then
		player:SetAutoFight(false)
	end
	return "0"
end






