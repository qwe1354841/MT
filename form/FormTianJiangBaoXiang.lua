--天降宝箱表单
FormTianJiangBaoXiang={}

--打断开宝箱
function FormTianJiangBaoXiang.StopOpenBox(player)
	if TianJiangBaoXiang then
		TianJiangBaoXiang.StopOpenBox(player)
	end
	return ""
end