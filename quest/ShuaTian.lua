--刷天脚本（大话)
ShuaTian={}
function ShuaTian.accept(player, quest_id ,ring_num)
end

function ShuaTian.abandon(player,quest_id , ring_num)
end

function ShuaTian.failed(player,quest_id , ring_num)
end

function ShuaTian.accomplish(player, quest_id ,ring_num)
end

function ShuaTian.on_kill_boss(player, quest_id, cnt)
	local nowtime = sLuaApp:DaySinceEpoch(0)
	local ShuaTian_time = player:GetInt("ShuaTian_time")
	if nowtime ~= ShuaTian_time then
		player:SetInt("ShuaTian_cnt",0)
		player:SetInt("ShuaTian_time",nowtime)
		player:SetInt("ShuaTian_rewardcnt",0)
	end
	
	local ShuaTian_cnt = player:GetInt("ShuaTian_cnt")
	if ShuaTian_cnt < 16 then
		ShuaTian_cnt = ShuaTian_cnt + 1
		player:SetInt("ShuaTian_cnt",ShuaTian_cnt)
	end
	if ShuaTian_cnt >= 16 then
		local ShuaTian_rewardcnt = player:GetInt("ShuaTian_rewardcnt")
		if ShuaTian_rewardcnt > 0 then 
			return
		end
		sLuaApp:NotifyTipsMsg(player, "你已经完成16环刷天任务了，快去领取奖励吧!")
	end
end 

function ShuaTian.ready(player,quest_id , ring_num)
end

function ShuaTian.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function ShuaTian.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function ShuaTian.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function ShuaTian.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end