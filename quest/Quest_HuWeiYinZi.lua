--护卫银子任务
Quest_HuWeiYinZi = {}

--接任务回调
function Quest_HuWeiYinZi.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_HuWeiYinZi.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_HuWeiYinZi.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_HuWeiYinZi.accomplish(player, quest_id ,ring_num)
	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "护卫银子")
	end
	local active_add = Act_HuWeiYinZi.Active_Add
	local active_max = Act_HuWeiYinZi.Active_Max
	local active = player:GetDayInt("Act_HuWeiYinZi_Active_Num"..Act_HuWeiYinZi.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_HuWeiYinZi_Active_Num"..Act_HuWeiYinZi.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_HuWeiYinZi_Active_Num"..Act_HuWeiYinZi.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	if Achievement then
		Achievement.Mind_line_complete(player,quest_id,ring_num)
	end
end
--多次击杀同一个npc回调
function Quest_HuWeiYinZi.on_kill_boss(player, quest_id, cnt)
end 

function Quest_HuWeiYinZi.ready(player,quest_id , ring_num)
end

function Quest_HuWeiYinZi.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_HuWeiYinZi.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_HuWeiYinZi.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_HuWeiYinZi.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end