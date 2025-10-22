FormGetAward = {}

function FormGetAward.GetData(player)
	if SwitchOnAward then
		SwitchOnAward.GetData(player)
	end
	return ""
end

function FormGetAward.HaveTake(player, id)
	if SwitchOnAward and id then
		SwitchOnAward.HaveTake(player, id)
	end
	return ""
end