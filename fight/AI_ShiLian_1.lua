--无尽的试炼战斗 主怪
AI_ShiLian_1 = {}

function AI_ShiLian_1.OnAI(fighter)
	local player_tb = sFightSystem:GetEnemies(fighter)
	local main_player = player_tb[1]
	sFightSystem:CreateFightBuff(main_player, 302) --触发 AI_ShiLian_2 的buff
	main_player:SetInt("IsMainPlayer", 1)
	--记录主怪
	local mon_tb = sFightSystem:GetFriends(fighter) 
	mon_tb[1]:SetInt("IsMainMonster", 1)
end