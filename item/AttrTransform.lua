--属性转换物品
AttrTransform = {}

AttrTransform.ItemConfig = {
    ["人物洗点1"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},
    ["人物洗点2"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},	
    ["人物洗点3"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["人物洗点4"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["人物洗点5"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["人物洗点6"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},	
    ["人物洗点7"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["人物洗点8"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["人物洗点9"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["人物洗点10"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["人物洗点11"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["人物洗点12"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["人物洗点13"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["人物洗点14"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["人物洗点15"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},
    ["人物洗点16"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},	
    ["人物洗点17"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["人物洗点18"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["人物洗点19"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},
    ["人物洗点20"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},	
	
    ["宠物洗点1"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},
    ["宠物洗点2"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},	
    ["宠物洗点3"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["宠物洗点4"] = {AddPoint = "Str" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["宠物洗点5"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["宠物洗点6"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},	
    ["宠物洗点7"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["宠物洗点8"] = {AddPoint = "Int" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["宠物洗点9"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["宠物洗点10"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["宠物洗点11"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},
    ["宠物洗点12"] = {AddPoint = "Vit" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},		
    ["宠物洗点13"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["宠物洗点14"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["宠物洗点15"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},
    ["宠物洗点16"] = {AddPoint = "End" , AddPointNum = 1 , SubPoint = "Agi" , SubPointNum = 1},	
    ["宠物洗点17"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Str" , SubPointNum = 1},
    ["宠物洗点18"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Int" , SubPointNum = 1},	
    ["宠物洗点19"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "Vit" , SubPointNum = 1},
    ["宠物洗点20"] = {AddPoint = "Agi" , AddPointNum = 1 , SubPoint = "End" , SubPointNum = 1},	
}

AttrTransform.transform = {
    Vit = "体质", --体质
    Int = "法力", --法力
    Str = "力量", --力量
    Agi = "敏捷", --敏捷
    End = "耐力", --耐力
}

-- 创建物品
function AttrTransform.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function AttrTransform.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function AttrTransform.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end
    return AttrTransform.Point_Transform(player,item:GetKeyName())
end

-- 使用物品
function AttrTransform.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end


function AttrTransform.Point_Transform(role,itemkey)
    if role == nil or itemkey == nil then
        return false
    end
    local PointConfig = AttrTransform.ItemConfig[itemkey]
    local AddPointList = {}
    local SubPointList = {}
    for k, v in pairs(AttrTransform.transform) do
        if k == PointConfig.AddPoint then
            AddPointList[k] = PointConfig.AddPointNum
        else
            AddPointList[k] = 0
        end
        if k == PointConfig.SubPoint then
            SubPointList[k] = PointConfig.SubPointNum
        else
            SubPointList[k] = 0
        end
    end
    if role:GetType() == GUID_PLAYER then
        if role:SubPoint(SubPointList.Vit , SubPointList.Int , SubPointList.Str , SubPointList.Agi , SubPointList.End) then
            if role:AddPoint(AddPointList.Vit , AddPointList.Int , AddPointList.Str , AddPointList.Agi , AddPointList.End) then
                sLuaApp:NotifyTipsMsg(role,"使用成功！")
                return true
            else
                sLuaApp:NotifyTipsMsg(role,"增加点数失败")
                return false
            end
        else
            for k, v in pairs(SubPointList) do
                if v ~= 0 then
                    sLuaApp:NotifyTipsMsg(role,"您的"..AttrTransform.transform[k].."点数不足，无法使用该物品")
                    return false
                end
            end
        end
    elseif role:GetType() == GUID_PET then
        local master = role:GetOwner()
        if role:SubPoint(SubPointList.Vit , SubPointList.Int , SubPointList.Str , SubPointList.Agi , SubPointList.End) then
            if role:AddPoint(AddPointList.Vit , AddPointList.Int , AddPointList.Str , AddPointList.Agi , AddPointList.End) then
                sLuaApp:NotifyTipsMsg(master,"使用成功！")
                return true
            else
                sLuaApp:NotifyTipsMsg(master,"增加点数失败")
                return false
            end
        else
            for k, v in pairs(SubPointList) do
                if v ~= 0 then
                    sLuaApp:NotifyTipsMsg(master,"您的宠物"..AttrTransform.transform[k].."点数不足，无法使用该物品")
                    return false
                end
            end
        end
    end
end