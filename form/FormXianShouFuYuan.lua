--仙兽福缘表单
FormXianShouFuYuan = {}

function FormXianShouFuYuan.Roll(player, dice_name)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['XianShouFuYuan'] ~= "on" then
			return ""
		end
	end
	if XianShouFuYuan then
		XianShouFuYuan.Roll(player, 1, dice_name, 1)
	end
	return ""
end