--无尽的试炼表单
FormShiLian = {}

function FormShiLian.GetData(player)
    if ShiLian then
		ShiLian.GetData(player)
    end
    return ""
end

function FormShiLian.GetButtonClick(player, show_index, button_type)
    if ShiLian then
		ShiLian.GetButtonClick(player, show_index, button_type, 0)
    end
    return ""
end

function FormShiLian.CloseSelect(player)
	 if ShiLian then
		ShiLian.CloseSelect(player)
    end
    return ""
end
