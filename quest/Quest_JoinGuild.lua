--加入帮派引导相关（大话）
Quest_JoinGuild = {}

--接任务回调
function Quest_JoinGuild.accept(player, quest_id ,ring_num)
	--帮派任务判断
	if sQuestSystem:GetQuestState(player,8) == 3 then
		if sGuildSystem:GetGuildByPlayer(player) then
			sQuestSystem:ForceReady(player,8)
		end
    end
end
--放弃任务回调
function Quest_JoinGuild.abandon(player,quest_id , ring_num)

end
--任务失败回调
function Quest_JoinGuild.failed(player,quest_id , ring_num)

end
--完成任务回调
function Quest_JoinGuild.accomplish(player, quest_id ,ring_num)

end
--多次击杀同一个npc回调
function Quest_JoinGuild.on_kill_boss(player, quest_id, cnt)

end 

function Quest_JoinGuild.ready(player,quest_id , ring_num)

end

function Quest_JoinGuild.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_JoinGuild.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_JoinGuild.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_JoinGuild.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end