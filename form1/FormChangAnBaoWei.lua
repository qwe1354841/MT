--长安保卫战表单
FormChangAnBaoWei = {}
--打断开宝箱
function FormChangAnBaoWei.StopOpenBox(player)
	if ChangAnBaoWei then
		ChangAnBaoWei.StopOpenBox(player)
	end
	return ""
end