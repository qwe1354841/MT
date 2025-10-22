--阵法相关表单
FormSeat = {}

--获取阵法界面信息
function FormSeat.GetSeatData(player,index)
	if SeatSystem then
		SeatSystem.GetSeatData(player,index)
	end
	return ""
end

--发送经验物品Config给客户端
function FormSeat.ScoreItem_Config(player,SeatId)
	if SeatSystem then
		SeatSystem.SendScoreItem_Config(player,SeatId)
	end
	return ""
end

--获取阵容阵法
function FormSeat.GetLineUpSeat(player,index)
	if SeatSystem then
		SeatSystem.GetLineUpSeat(player,index)
	end
	return ""
end

--设置阵容阵法
function FormSeat.SetLineUpSeat(player,index,seatid)
	if SeatSystem then
		SeatSystem.SetLineUpSeat(player,index,seatid)
	end
	return ""
end

--启用阵容
function FormSeat.SetUsingLineUp(player,index)
	if SeatSystem then
		SeatSystem.SetUsingLineUp(player,index)
	end
	return ""
end

--交换阵容侍从
function FormSeat.LineupExchange(player,index,site1,site2)
	if SeatSystem then
		SeatSystem.LineupExchange(player,index,site1,site2)
	end
	return ""
end

--学习阵法
function FormSeat.LearnSeat(player,SeatId)
	if SeatSystem then
		SeatSystem.LearnSeat(player,SeatId)
	end
	return ""
end

--获取阵容侍从信息
function FormSeat.GetGuardList(player,index)
	if SeatSystem then
		SeatSystem.GetGuardList(player,index)
	end
	return ""
end

--消耗物品增加阵法经验
function FormSeat.AddSeatScore(player,SeatId,itemStr)
	if SeatSystem then
		SeatSystem.AddSeatScore(player,SeatId,itemStr)
	end
	return ""
end

--判断阵法是否全部满级
function FormSeat.IsAllSeatMaxLevel(player)
	if MainUISwitch.CheckOpenLevel_0(player,"队伍") == false then
		return ""
	end
	if SeatSystem then
		SeatSystem.IsAllSeatMaxLevel(player)
	end
	return ""
end