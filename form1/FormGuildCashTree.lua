--帮派摇钱树表单
FormGuildCashTree = {}
--打断开宝箱
function FormGuildCashTree.StopOpenBox(player)
	if GuildCashTree then
		GuildCashTree.StopOpenBox(player)
	end
	return ""
end