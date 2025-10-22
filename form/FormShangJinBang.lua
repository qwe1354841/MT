--赏金榜表单
FormShangJinBang = {}

function FormShangJinBang.Player_Accept_Quest(player,quest_id)
	if Act_ShangJinBang then
		Act_ShangJinBang.player_accept_quest(player, quest_id)
	end
	return ""
end

function FormShangJinBang.Player_Failed_Quest(player,quest_id)
	if Act_ShangJinBang then
		Act_ShangJinBang.player_failed_quest(player,quest_id)
	end
	return ""
end

function FormShangJinBang.Main(player)
	if Act_ShangJinBang then
		Act_ShangJinBang.main(player)
	end
	return ""
end

function FormShangJinBang.Refresh_Quest(player)
	if Act_ShangJinBang then
		 Act_ShangJinBang.refresh_quest(player)
	end
	return ""
end