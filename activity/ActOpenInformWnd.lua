--活动开启推送窗口
ActOpenInformWnd = {}

function ActOpenInformWnd.StartInform(Act_Id)
    if Act_Id == nil then
        return
    end
    local str = [[
        if MainUI then
            MainUI.OpenActivityCheck(]]..tonumber(Act_Id)..[[)
        end
    ]]
    --GUI.OpenWnd("ActivityPreview",]]..tonumber(Act_Id)..[[)
    sLuaApp:ShowFormToAll("脚本表单", str)
end