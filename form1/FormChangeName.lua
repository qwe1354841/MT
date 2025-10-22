--改名相关表单

FormChangeName = {}
--玩家改名
function FormChangeName.PlayerChangeName(player,new_name)
    if ChangeName then
        ChangeName.PlayerChangeName(player,new_name)
    end
    return ""
end
--宠物改名
function FormChangeName.PetChangeName(player,pet_guid,new_name)
    if ChangeName then
        ChangeName.PetChangeName(player,pet_guid,new_name)
    end
    return ""
end
--获取玩家曾用名字符串
function FormChangeName.GetPlayerOldNameStr(player,target_unid)
    if not player or target_unid == "" then
        return ""
    end
    local str = [[
        if RoleInformationUI then
            RoleInformationUI.historyNameClass.namesData = "]]..sDBVarSystem:GetString(target_unid.."_OldName")..[["
            if RoleInformationUI.historyNameClass.response then
                RoleInformationUI.historyNameClass.response()
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end