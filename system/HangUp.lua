--挂机界面领双相关
HangUp = {}

function HangUp.FreezeDoubleExp(player)
	DoubleExp.FreezeDoubleExp(player)
end

function HangUp.DrawDoubleExp(player)
	DoubleExp.DrawDoubleExp(player)
end

function HangUp.get_data(player)
	local double_point = HangUp.get_double_point(player)
	local freeze_point = HangUp.get_freeze_point(player)
	local str = [[
			HangUpUI.GotPoint = ]]..double_point..[[
			HangUpUI.DoublePoint = ]]..freeze_point..[[
			HangUpUI.Point_refresh()
		]]
	sLuaApp:ShowForm(player,"脚本表单", str)	
end

function HangUp.get_double_point(player)
	return player:GetInt("DoubleExpPoint")
end

function HangUp.get_freeze_point(player)
	return player:GetInt("FreezeDoubleExpPoint")
end