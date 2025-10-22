FormReserveMoney = {}

--存储仓库银币
function FormReserveMoney.AddWarehouseGold(player, val)
	if ReserveMoney then
		ReserveMoney.AddWarehouseGold(player, val)
	end
	return ""
	
end

--取出仓库银币
function FormReserveMoney.SubWarehouseGold(player, val)
	if ReserveMoney then
		ReserveMoney.SubWarehouseGold(player, val)
	end
	return ""
end



