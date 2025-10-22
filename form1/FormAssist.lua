--辅助功能表单
FormAssist = {}

function FormAssist.GetData(player)
    if not MainUISwitch.CheckOpenLevel(player,"辅助") then
	  	return ""
	  end
    if Assist then
		Assist.GetData(player)
    end
    return ""
end

function FormAssist.GetAssistSetting(player)
  if not MainUISwitch.CheckOpenLevel(player,"辅助") then
    return ""
  end
    if Assist then
		Assist.GetAssistSetting(player)
    end
    return ""
end

function FormAssist.SetAssistSetting(player, setting_str)
  if not MainUISwitch.CheckOpenLevel(player,"辅助") then
    return ""
  end
    if Assist then
		Assist.SetAssistSetting(player, setting_str)
    end
    return ""
end

function FormAssist.Start(player, select_tb_str)
  if not MainUISwitch.CheckOpenLevel(player,"辅助") then
    return ""
  end
    if Assist then
		Assist.Start(player, select_tb_str)
    end
    return ""
end

function FormAssist.End(player)
  if not MainUISwitch.CheckOpenLevel(player,"辅助") then
    return ""
  end
    if Assist then
		Assist.End(player)
    end
    return ""
end

function FormAssist.XiYouQiYuanStop(player)
    if Assist then
		Assist.XiYouQiYuanStop(player, 0, "")
    end
    return ""
end