--货币转换表单
FormMoneyChange = {}

function FormMoneyChange.GetData(player, from_type, to_type)
	if MoneyChange then
		MoneyChange.GetData(player, from_type, to_type)
	end
	return ""
end

function FormMoneyChange.ExchangeMoney(player, change_num, from_type, to_type)
	if MoneyChange then
		MoneyChange.ExchangeMoney(player, change_num, from_type, to_type)
	end
	return ""
end