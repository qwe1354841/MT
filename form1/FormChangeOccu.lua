--转职表单
FormChangeOccu={}

function FormChangeOccu.GetData(player)
	--打开转职界面
	if ChangeOccu then
		ChangeOccu.GetData(player)
	end
	return ""
end
function FormChangeOccu.StartChange(player, change_school_id, change_role_id, is_checked)
	if ChangeOccu then
		ChangeOccu.StartChange(player, change_school_id, change_role_id, is_checked)
	end
	return ""
end