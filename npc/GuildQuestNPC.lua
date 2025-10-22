--帮派任务NPC
GuildQuestNPC = {}

function GuildQuestNPC.main(npc, player)
	if player:GetDayInt("GuildQuestNum") == 10 then
		return "你已经完成了今天的帮派任务，明天再来吧！"
	end
	
	return "0"
end