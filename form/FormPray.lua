--祈福表单
FormPray = {}

function FormPray.GetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"祈福") then
        return ""
    end
	if Pray then
		Pray.GetData(player)
	end
	return ""
end

function FormPray.StartDraw(player, pray_index, draw_type, tab_index)
	if not MainUISwitch.CheckOpenLevel(player,"祈福") then
        return ""
    end
	if Pray then
		Pray.StartDraw(player, pray_index, draw_type, tab_index or 0)
	end
	return ""
end
