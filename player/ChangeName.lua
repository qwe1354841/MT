--改名脚本
ChangeName = {}

ChangeName.OidNameNum_Max = 20  --最多可保存的曾用名数量
--玩家改名
function ChangeName.PlayerChangeName(player,new_name)
    if player then
        local item_KeyName = "更名卡"
        local itemData = ItemConfig.GetByKeyName(item_KeyName)
        if new_name == "" then
            sLuaApp:NotifyTipsMsg(player, "名称不能为空")
            return false
        end
        if sLuaApp:GetUTF8Bytes(new_name) > 12 then
            sLuaApp:NotifyTipsMsg(player, "名称长度过长")
            return false
        end
        if sLuaApp:IsBanAccount(new_name) == true then
            sLuaApp:NotifyTipsMsg(player, "该名称包含非法字符，无法使用")
            return false
        end
        if sContactSystem:IsExistName(new_name) == true then
            sLuaApp:NotifyTipsMsg(player, "该名称已被其他玩家占用")
            return false
        end
        local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>改名？")]]
        player:SetString("SYSTEM_ConfirmBox_Function", "ChangeName.RoleChangeName("..player:GetGUID()..",'"..new_name.."')")
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end
--宠物改名
function ChangeName.PetChangeName(player,pet_guid,new_name)
    local pet = sPetSystem:GetPetByGUID(pet_guid)
    local owner = pet:GetOwner()
    new_name = tostring(new_name)
    if player ~= owner then
        sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
    end
    --if new_name == "" then
    --    sLuaApp:NotifyTipsMsg(player, "名称不能为空")
    --    return false
    --end
    if sLuaApp:GetUTF8Bytes(new_name) > 12 then
        sLuaApp:NotifyTipsMsg(player, "名称长度过长")
        return false
    end
    if sLuaApp:IsBanAccount(new_name) == true then
        sLuaApp:NotifyTipsMsg(player, "该名称包含非法字符，无法使用")
        return false
    end
    if pet:ChangeName(new_name) == true then
        sLuaApp:NotifyTipsMsg(player, "改名成功")
        local Str = [[
            GUI.DestroyWnd("RoleRenameUI")
        ]]
        sLuaApp:ShowForm(player, "脚本表单", Str)
    end
end

function ChangeName.RoleChangeName(player_guid,new_name)
    local item_KeyName = "更名卡"
    local player = sPlayerSystem:GetPlayerByGUID(player_guid)
    local itemData = ItemConfig.GetByKeyName(item_KeyName)
    local item = sItemSystem:GetItemList(player, itemData.Id, 3)[1]
    if new_name == "" then
        sLuaApp:NotifyTipsMsg(player, "名称不能为空")
        return false
    end
    if sLuaApp:GetUTF8Bytes(new_name) > 12 then
        sLuaApp:NotifyTipsMsg(player, "名称长度过长")
        return false
    end
    if sLuaApp:IsBanAccount(new_name) == true then
        sLuaApp:NotifyTipsMsg(player, "该名称包含非法字符，无法使用")
        return false
    end
    if sContactSystem:IsExistName(new_name) == true then
        sLuaApp:NotifyTipsMsg(player, "该名称已被其他玩家占用")
        return false
    end
    if item then
        local log = sItemSystem:ConsumeItem(item,1,"system","更名卡","更名消耗")
        if log == 0 then
            local OldName = player:GetName()
            if player:ChangeName(new_name) == true then
                sLuaApp:NotifyTipsMsg(player, "改名成功")
                local OldNameStr = sDBVarSystem:GetString(player:GetUNID().."_OldName")
                local OldNameList = sLuaApp:StrSplit(OldNameStr,"_")
                local NewNameStr = ""
                if Lua_tools.tablecount(OldNameList) < ChangeName.OidNameNum_Max then
                    NewNameStr = OldNameStr.."_"..OldName
                else
                    for i = (Lua_tools.tablecount(OldNameList)-ChangeName.OidNameNum_Max+2), Lua_tools.tablecount(OldNameList) do
                        NewNameStr = NewNameStr.."_"..OldNameList[i]
                    end
                    NewNameStr = NewNameStr.."_"..OldName
                end
                sDBVarSystem:SetString(player:GetUNID().."_OldName",NewNameStr,0)
                local Str = [[
                    GUI.DestroyWnd("RoleRenameUI")
                ]]
                sLuaApp:ShowForm(player, "脚本表单", Str)
            end
        else
            sLuaApp:LuaErr("玩家 "..player:GetName().." 改名 ConsumeItem  "..itemData.KeyName.."  错误码 ："..log)
        end
    elseif not item then
        sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemData.Id).Name)
		OneKeyBuy.Main(player,{itemData.KeyName,1})
		return ""
    end
end