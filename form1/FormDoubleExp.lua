--双倍经验表单
FormDoubleExp = {}

function FormDoubleExp.GetData(player)
	if DoubleExp then
		DoubleExp.GetData(player)
	end
	return ""
end

function FormDoubleExp.Freeze(player)
	if DoubleExp then
		DoubleExp.Freeze(player)
	end
	return ""
end

function FormDoubleExp.Draw(player)
	if DoubleExp then
		DoubleExp.Draw(player)
	end
	return ""
end

function FormDoubleExp.Buy(player)
	if DoubleExp then
		DoubleExp.Buy(player)
	end
	return ""
end

function FormDoubleExp.GetPoint(player)
	if DoubleExp then
		DoubleExp.GetPoint(player, 1)
	end
	return ""
end