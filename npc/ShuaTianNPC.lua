--刷天NPC by shodow_yong
ShuaTianNPC = {}

function ShuaTianNPC.main(npc, player)
	--player:AddNpcOption(npc, 0, "领取刷天奖励", "Option", "");
	return "0"
end

function ShuaTianNPC.Option(npc, player, str)
	local nowtime = sLuaApp:DaySinceEpoch(0)
	local ShuaTian_time = player:GetInt("ShuaTian_time")
	if nowtime ~= ShuaTian_time then
		player:SetInt("ShuaTian_cnt",0)
		player:SetInt("ShuaTian_time",nowtime)
		player:SetInt("ShuaTian_rewardcnt",0)
	end
	
	local ShuaTian_cnt = player:GetInt("ShuaTian_cnt")
	local ShuaTian_rewardcnt = player:GetInt("ShuaTian_rewardcnt")
	if ShuaTian_cnt <= 0  then
		sLuaApp:NotifyTipsMsg(player, "您还没有完成过刷天任务，没有奖励可以领取哦!")
		return ""
	end
	if ShuaTian_rewardcnt > 0 then 
		sLuaApp:NotifyTipsMsg(player, "您已经领取过今天的刷天奖励了!")
		return ""
	end
	
	if ShuaTian_cnt >= 16 then
		ShuaTian_cnt = 16
	end
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local exp = math.floor((0.3+0.005*ShuaTian_cnt)*level*level*level+60000+3000*ShuaTian_cnt)
	--local bindgold = exp
	local bindgold = ShuaTian_cnt * 50000
	
	player:AddBindGold(bindgold, "任务系统", "刷天", "nil")
	player:AddExp (exp, "任务系统", "刷天", "nil")
	local pet = sPetSystem:GetLineupPet(player)
	if pet then
		pet:AddExp(exp, "任务系统", "刷天", "nil")
	end
	player:SetInt("ShuaTian_rewardcnt",1)
	
	return ""
end