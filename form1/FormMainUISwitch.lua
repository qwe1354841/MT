--系统开启等级表单
FormMainUISwitch = {}
function FormMainUISwitch.GetMainUISwitchData(player)
    if not player then
        return ""
    end

    if MainUISwitch then
        MainUISwitch.GetMainUISwitchData(player)
    end
    return ""
end