--羽翼
Wing = {}

-- 使用物品前
function Wing.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end
    local Item_Key = item:GetKeyName()
    if player:GetInt(Item_Key) == 1 then
        sLuaApp:NotifyTipsMsg(player,"该羽翼已拥有，无法再次解锁！")
        return false
    elseif player:GetInt(Item_Key) == 0 then
        local have_item_num = sItemSystem:GetItemAmount(player,item:GetId(),3)
        if have_item_num >= 1 then
            local WingData = IllusionConfig.GetByKeyName(Item_Key)
            local WingTime = WingData.Time
            if WingData.Type == 2 then
                local DiffTimeItemList = Clothes.GetDiffTimeClothes(player,Item_Key)
                local IsDestroy = false --是否需要删除羽翼
                for k, v in pairs(DiffTimeItemList) do
                    local WingData_1 = IllusionConfig.GetByKeyName(v)
                    if WingTime == 0 then
                        if player:GetInt(v) == 1 and WingData_1.Time ~= 0 then
                            IsDestroy = true
                            local str = [[
                                GlobalUtils.ShowServerBoxMessage("操作会使已激活的羽翼失效，是否还要激活羽翼？")
                                ]]
                            player:SetString("SYSTEM_ConfirmBox_Function", "Clothes.ActivateClothes("..player:GetGUID()..","..item:GetGUID()..")")
                            sLuaApp:ShowForm(player, "脚本表单", str)
                            break
                        end
                    else
                        if player:GetInt(v) == 1 and WingData_1.Time < WingTime and WingData_1.Time ~= 0 then
                            IsDestroy = true
                            local str = [[
                                GlobalUtils.ShowServerBoxMessage("操作会使已激活的羽翼失效，是否还要激活羽翼？")
                                ]]
                            player:SetString("SYSTEM_ConfirmBox_Function", "Clothes.ActivateClothes("..player:GetGUID()..","..item:GetGUID()..")")
                            sLuaApp:ShowForm(player, "脚本表单", str)
                            break
                        elseif player:GetInt(v) == 1 and (WingData_1.Time > WingTime or WingData_1.Time == 0) then
                            sLuaApp:NotifyTipsMsg(player,"您已激活更高等级的羽翼，请到期后再尝试激活。")
                            return false
                        end
                    end
                end
                if IsDestroy == false then
                    Clothes.ActivateClothes(player:GetGUID(),item:GetGUID())
                end
            end
        end
    end
    return false
end

-- 使用物品
function Wing.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end