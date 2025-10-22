--公主嫁妆任务
Quest_GongZhuJiaZhuang = {}

--接任务回调
function Quest_GongZhuJiaZhuang.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_GongZhuJiaZhuang.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_GongZhuJiaZhuang.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_GongZhuJiaZhuang.accomplish(player, quest_id ,ring_num)
	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "公主的嫁妆")
	end
end
--多次击杀同一个npc回调
function Quest_GongZhuJiaZhuang.on_kill_boss(player, quest_id, cnt)
end 

function Quest_GongZhuJiaZhuang.ready(player,quest_id , ring_num)
end


function Quest_GongZhuJiaZhuang.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_GongZhuJiaZhuang.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_GongZhuJiaZhuang.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_GongZhuJiaZhuang.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end