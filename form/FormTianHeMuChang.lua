--天河牧场相关表单
FormTianHeMuChang = {}

--打开宠物状态窗口(宠物放牧窗口)
function FormTianHeMuChang.StartGrazeData(player)
	if TianHeMuChang then
		TianHeMuChang.StartGrazeData(player)
	end
	return ""
end

--打开可出战宠物表单窗口
function FormTianHeMuChang.CanFightPet(player,petGuid)
	if TianHeMuChang then
		TianHeMuChang.CanFightPet(player,petGuid)
	end
	return ""
end

--点击宠物显示信息窗口
function FormTianHeMuChang.MapPetClick(player,petGuid)
	if TianHeMuChang then
		TianHeMuChang.MapPetClick(player,petGuid)
	end
	return ""
end

--宠物状态界面下方的确认按钮，可能为放牧或收回
function FormTianHeMuChang.GrazeOrBackWnd(player,petGuid)
	if TianHeMuChang then
		TianHeMuChang.GrazeOrBackWnd(player,petGuid)
	end
	return ""
end

--打开放牧确认窗口
function FormTianHeMuChang.OpenGrazeWnd(player,petGuid)
	if TianHeMuChang then
		TianHeMuChang.OpenGrazeWnd(player,petGuid)
	end
	return ""
end

--开始放牧
function FormTianHeMuChang.StartGraze(player,petguid)
	if TianHeMuChang then
		TianHeMuChang.StartGraze(player,petguid)
	end
	return ""
end

--发放奖励
function FormTianHeMuChang.GiveAward(player,petguid)
	if TianHeMuChang then
		TianHeMuChang.GiveAward(player,petguid)
	end
	return ""
end

--开始宠物战斗
function FormTianHeMuChang.Occupy(player,petGuid1,petGuid2)
	if TianHeMuChang then
		TianHeMuChang.Occupy(player,petGuid1,petGuid2)
	end
	return ""
end