FormBaoGeDaKai={}

--打断开宝箱
function FormBaoGeDaKai.StopOpenBox(player)
	if BaoGeDaKai then
		BaoGeDaKai.StopOpenBox(player)
	end
	return ""
end