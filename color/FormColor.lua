-- 染色相关表单
FormColor = {}

--请求邮件列表
function FormColor.PlayerDyeing(player, color_plan1, color_plan2)
    if player == nil then
        return ""
    end

    local plan1 = player:GetColorPlan1()
    local plan2 = player:GetColorPlan2()
    local row1 = ColorConfig.GetById(color_plan1)
    local row2 = ColorConfig.GetById(color_plan2)

    if plan1 ~= color_plan1 then
        if row1.Item1 ~= 0 then
            if sItemSystem:GetItemAmount(player, row1.Item1, 3) < row1.Num1 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end

        if row1.Item2 ~= 0 then
            if sItemSystem:GetItemAmount(player, row1.Item2, 3) < row1.Num2 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end
    end

    if plan2 ~= color_plan2 then
        if row2.Item1 ~= 0 then
            if sItemSystem:GetItemAmount(player, row2.Item1, 3) < row2.Num1 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end

        if row2.Item2 ~= 0 then
            if sItemSystem:GetItemAmount(player, row2.Item2, 3) < row2.Num2 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end
    end

    local ret = player:DyeingColor(color_plan1, color_plan2)
    if not ret then 
        sLuaApp:NotifyTipsMsgEx(player, "染色失败")
        return ""
    end 
    sLuaApp:NotifyTipsMsgEx(player, "染色成功")

    if plan1 ~= color_plan1 then
        if row1.Item1 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row1.Item1, row1.Num1, 3, "染色系统", "角色染色方案1", "消耗物品")
        end

        if row1.Item2 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row1.Item2, row1.Num2, 3, "染色系统", "角色染色方案1", "消耗物品")
        end
    end

    if plan2 ~= color_plan2 then
        if row2.Item1 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row2.Item1, row2.Num1, 3, "染色系统", "角色染色方案2", "消耗物品")
        end

        if row2.Item2 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row2.Item2, row2.Num2, 3, "染色系统", "角色染色方案2", "消耗物品")
        end
    end

    return ""
end

function FormColor.PetDyeing(player, pet_guid, color_plan1)
    if player == nil then
        return ""
    end

    local pet_container  = player:GetPetContainer(1)
    if pet_container == nil then
        sLuaApp:LuaDbg("Invalid Pet Container")
        return ""
    end

    local pet = pet_container:GetPetByGUID(pet_guid)
    if pet == nil then
        sLuaApp:LuaDbg("Invalid Pet: " .. pet_guid)
        return ""
    end

    local plan1 = pet:GetColorPlan1()
    local plan2 = pet:GetColorPlan2()
    local row1 = ColorConfig.GetById(color_plan1)

    if plan1 ~= color_plan1 then
        if row1.Item1 ~= 0 then
            if sItemSystem:GetItemAmount(player, row1.Item1, 3) < row1.Num1 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end

        if row1.Item2 ~= 0 then
            if sItemSystem:GetItemAmount(player, row1.Item2, 3) < row1.Num2 then
                sLuaApp:NotifyTipsMsgEx(player, "道具不足，无法染色")
                return ""
            end
        end
    end

    local ret = pet:DyeingColor(color_plan1, plan2)
    if not ret then 
        sLuaApp:NotifyTipsMsgEx(player, "染色失败")
        return ""
    end 
    sLuaApp:NotifyTipsMsgEx(player, "染色成功")
    if Achievement then
        Achievement.Achievement_Pet_ChangeColor(player)
    end

    if plan1 ~= color_plan1 then
        if row1.Item1 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row1.Item1, row1.Num1, 3, "染色系统", "宠物染色方案1", "宠物染色")
        end

        if row1.Item2 ~= 0 then
            sItemSystem:ConsumeItemWithId(player, row1.Item2, row1.Num2, 3, "染色系统", "宠物染色方案1", "宠物染色")
        end
    end

    return ""
end
