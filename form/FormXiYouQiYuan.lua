--西游奇缘表单
FormXiYouQiYuan = {}

function FormXiYouQiYuan.main(player,act_type,question_id,answer)
	if Act_XiYouQiYuan then
		Act_XiYouQiYuan.main(player,act_type,question_id,answer)
	end
	return ""
end

function FormXiYouQiYuan.getReward(player)
	if Act_XiYouQiYuan then
		Act_XiYouQiYuan.getReward(player)
	end
	return ""
end