--宝图任务
Quest_BaoTu = {}

--接任务回调
function Quest_BaoTu.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_BaoTu.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_BaoTu.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_BaoTu.accomplish(player, quest_id ,ring_num)
	local active_add = Act_BaoTu.Active_Add
	local active_max = Act_BaoTu.Active_Max
	local active = player:GetDayInt("Act_BaoTu_Active_Num"..Act_BaoTu.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_BaoTu_Active_Num"..Act_BaoTu.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_BaoTu_Active_Num"..Act_BaoTu.Active_ID, active_sum)
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
function Quest_BaoTu.on_kill_boss(player, quest_id, cnt)
end 

function Quest_BaoTu.ready(player,quest_id , ring_num)
end

function Quest_BaoTu.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_BaoTu.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_BaoTu.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_BaoTu.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_BaoTu.OnResult(player, type, victory, custom)
end