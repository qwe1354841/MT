--贸易表单
FormTrade = {}

function FormTrade.GetData(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Trade'] ~= "on" then
			return ""
		end
	end
	if Trade then
		Trade.GetData(player)
	end
	return ""
end

function FormTrade.SelectGoods(player, version, tab_index, place_index, order_index, select_str)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Trade'] ~= "on" then
			return ""
		end
	end
	if Trade then
		Trade.SelectGoods(player, version, tab_index, place_index, order_index, select_str)
	end
	return ""
end

function FormTrade.SelectGuard(player, version, tab_index, place_index, order_index, select_str)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Trade'] ~= "on" then
			return ""
		end
	end
	if Trade then
		Trade.SelectGuard(player, version, tab_index, place_index, order_index, select_str)
	end
	return ""
end
function FormTrade.Start(player, version, tab_index, place_index)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Trade'] ~= "on" then
			return ""
		end
	end
	if Trade then
		Trade.Start(player, version, tab_index, place_index, 0)
	end
	return ""
end