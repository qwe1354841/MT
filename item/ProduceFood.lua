-- 生产系统 烹饪物品
local ProduceFood = {}
_G.ProduceFood = ProduceFood

-- 使用制作的食物或药品   "HpOrMp" 1HP  2MP 3All
ProduceFood.ItemAttrList = {
    ["烹饪1"] = {["Id"] = 32408,["Attr1"]=35,["Attr1Value"]=20,["Attr2"]=0,["Attr2Value"]=20,["AttCoef"]=0,["HpOrMp"]=1}, --土豆烧牛肉 "提升防御力3回合，并恢复血量或血量储备=物品等级*20。战斗内外皆可食用，但战斗内食用才可获得BUFF"
    ["烹饪2"] = {["Id"] = 32409,["Attr1"]=39,["Attr1Value"]=1,["Attr2"]=0, ["Attr2Value"]=0, ["AttCoef"]=20,["HpOrMp"]=0}, --糖醋排骨 恢复怒气=物品等级+20，仅限战斗内食用。
    ["烹饪3"] = {["Id"] = 32410,["Attr1"]=37,["Attr1Value"]=30,["Attr2"]=0,["Attr2Value"]=0, ["AttCoef"]=0,["HpOrMp"]=2}, --蟹黄豆腐煲 恢复魔法储备=物品等级*30。仅限战斗外食用
    ["烹饪4"] = {["Id"] = 32411,["Attr1"]=35,["Attr1Value"]=60,["Attr2"]=0,["Attr2Value"]=0, ["AttCoef"]=0,["HpOrMp"]=1}, --水煮肉片 恢复血量储备=物品等级*60。仅限战斗外食用
    ["烹饪5"] = {["Id"] = 32412,["Attr1"]=35,["Attr1Value"]=80,["Attr2"]=0,["Attr2Value"]=0, ["AttCoef"]=0,["HpOrMp"]=1}, --红烧肘子 恢复血量储备=物品等级*80。仅限战斗外食用
    ["烹饪6"] = {["Id"] = 32413,["Attr1"]=35,["Attr1Value"]=10,["Attr2"]=0,["Attr2Value"]=10,["AttCoef"]=0,["HpOrMp"]=1}, --红烧牛尾 提升攻击力和防御力3回合，并恢复血量或血量储备=物品等级*10。战斗内外皆可食用，但战斗内食用才可获得 BUFF
    ["烹饪7"] = {["Id"] = 32414,["Attr1"]=39,["Attr1Value"]=1,["Attr2"]=0, ["Attr2Value"]=0, ["AttCoef"]=50,["HpOrMp"]=0}, --烤羊排 恢复怒气=物品等级+50，仅限战斗内食用。
    ["烹饪8"] = {["Id"] = 32415,["Attr1"]=37,["Attr1Value"]=40,["Attr2"]=0,["Attr2Value"]=0, ["AttCoef"]=0,["HpOrMp"]=2}, --海椒醉蟹 恢复魔法储备=物品等级*40。仅限战斗外食用
}
-- 加成buff字段
ProduceFood.ItemBuffer = {
    ["烹饪1"] = {10,3101}, -- 土豆烧牛肉
    ["烹饪6"] = {9,10,3101} -- 红烧牛尾
}

-- 使用物品前
function ProduceFood.on_pre_use_item(player,item,count)
    local itemKeyName = item:GetKeyName()
    if not ProduceFood.isCanUseFood(player,item,false,itemKeyName) then
        return false
    end
    return true
end

-- 判断使用道具是否合规
function ProduceFood.isCanUseFood(player,item,isFight,itemKeyName)

    if player:GetType() ~= GUID_PLAYER then -- 如果传入的player不是角色而是Fighter
        player = sPlayerSystem:GetPlayerByGUID(player:GetGUID())
    end

    -- 查看物品加成属性
    local itemObj = ProduceFood.ItemAttrList[itemKeyName]
    -- 判断当前等级是否满足
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    --sLuaApp:LuaDbg(" randomle "..randomLevel.." rolelevel "..roleLevel)
    if roleLevel < randomLevel then
        --sLuaApp:LuaDbg(" "..roleLevel.."  "..randomLevel)
        sLuaApp:NotifyTipsMsg(player, "人物等级不足，无法使用")
        return false
    end

    -- 判断物品是否可在战斗中使用
    local itemFight = ItemConfig.GetByKeyName(itemKeyName).Fight  -- 0 皆可，1 战斗中使用，2 战斗外使用

    -- 如果是战斗
    -- 如果物品是只能在战斗中使用  而此时在战斗外
    if itemFight == 1 and isFight == false then
        sLuaApp:NotifyTipsMsg(player, "此物品只能在战斗中使用")
        return false
    end

    -- 如果物品只能在战斗外使用 而此时在战斗中
    if itemFight == 2 and isFight == true then
        sLuaApp:NotifyTipsMsg(player, "此物品只能在战斗外使用")
        return false
    end
    -- 如果不是战斗
    if itemFight == 2 or itemFight == 0 and isFight == false then
        local RoleAttrHpPoolLimit = player:GetAttr(ROLE_ATTR_HP_POOL_LIMIT) -- 血池上限
        local RoleAttrHpPool = player:GetAttr(ROLE_ATTR_HP_POOL) -- 血池
        local RoleAttrMpPoolLimit = player:GetAttr(ROLE_ATTR_MP_POOL_LIMIT) -- 蓝池上限
        local RoleAttrMpPool = player:GetAttr(ROLE_ATTR_MP_POOL) -- 蓝池
        -- 判断当前血魔池是否已满
        -- 如果已满 提升已满 无法使用
        -- 如果未满 将数值添加到血魔池
        -- 判断是加血还是加蓝
        if itemObj.HpOrMp == 1 then
            if RoleAttrHpPool == RoleAttrHpPoolLimit then
                sLuaApp:NotifyTipsMsg(player, "已达血池上限，无法使用")
                return false
            end
        elseif itemObj.HpOrMp == 2 then
            if RoleAttrMpPool == RoleAttrMpPoolLimit then
                sLuaApp:NotifyTipsMsg(player, "已达蓝池上限，无法使用")
                return false
            end
        end

    end

    return true
end


-- 使用物品  -- 非战斗中
function ProduceFood.on_use_item(actor, item, count)
    --sLuaApp:LuaDbg("开始使用物品")

    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceFood.ItemAttrList[itemKeyName] -- 表数据
    local itemName = item:GetName()

    if actor:GetType() == GUID_PLAYER then -- 判断是否是玩家  玩家才能操控血池蓝池
        local addPool = randomLevel * itemObj.Attr1Value + itemObj.AttCoef
        --sLuaApp:LuaDbg("战斗外"..addPool)
        -- 如果是加血量池
        if itemObj.HpOrMp == 1 then
            if actor:AddHpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药") then
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用成功".."，血量池增加了"..addPool.."点")
            else
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用失败")
            end
            --sLuaApp:LuaDbg("增加"..addPool.."血池成功")
        elseif itemObj.HpOrMp == 2  then --如果是蓝池
            if actor:AddMpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药") then
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用成功".."，蓝量池增加了"..addPool.."点")
            else
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用失败")
            end
            --sLuaApp:LuaDbg("增加"..addPool.."蓝池成功")
        end
    end

end

-- 战斗中对自己使用
function ProduceFood.on_fighter_use_item( role,  item,  amount)
    --sLuaApp:LuaDbg("战斗中对自己使用")
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceFood.ItemAttrList[itemKeyName] -- 表数据
    local buff = ProduceFood.ItemBuffer[itemKeyName] -- buff数据

    --if  not ProduceFood.isCanUseFood(role,item,true,itemKeyName) then
    --    return false
    --end

    local i = 1
    -- 加成属性
    while(itemObj["Attr"..i] ~= nil and itemObj["Attr"..i] ~= 0) do
        local add = randomLevel * itemObj["Attr"..i.."Value"] + itemObj["AttCoef"]
        if itemObj["Attr"..i] == 39 then -- 如果是怒气
            role:AddSp(add,item:GetKeyName(),"道具增益","增益药")
            --sLuaApp:LuaDbg("增加"..add.."怒气成功")
        elseif itemObj["HpOrMp"] == 1  then -- 如果增加的是血量
            role:AddHp(add,item:GetKeyName(),"道具增益","增益药")
            --sLuaApp:LuaDbg("增加"..add.."血量成功")
        elseif itemObj["HpOrMp"] == 2 then -- 如果增加的是蓝量
            role:AddMp(add,item:GetKeyName(),"道具增益","增益药")
            --sLuaApp:LuaDbg("增加"..add.."蓝量成功")
        end
        i = i +1
    end

    -- 添加buff
    if buff then
        i = 1
        while(buff[i] ~= nil) do
            if sFightSystem:CreateFightBuff(role, buff[i]) then
                --sLuaApp:LuaDbg("添加buff成功")
            end
            i = i + 1
        end
    end

end

-- 战斗中对别人使用
function ProduceFood.on_fighter_use_item_passive( target, item, amount, role)
    --sLuaApp:LuaDbg("战斗中对别人使用")
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceFood.ItemAttrList[itemKeyName] -- 表数据
    local buff = ProduceFood.ItemBuffer[itemKeyName] -- buff数据

    --if not ProduceFood.isCanUseFood(role,item,true,itemKeyName) then
    --    return false
    --end

    local is_died = target:IsDied()
    if not is_died then
        local i = 1
        -- 加成属性
        while(itemObj["Attr"..i] ~= nil and itemObj["Attr"..i] ~= 0) do
            local add = randomLevel * itemObj["Attr"..i.."Value"] + itemObj["AttCoef"]
            if itemObj["Attr"..i] == 39 then -- 如果是怒气
                target:AddSp(add,item:GetKeyName(),"道具增益","增益药")
                --sLuaApp:LuaDbg("增加"..add.."怒气成功")

            elseif itemObj["HpOrMp"] == 1  then -- 如果增加的是血量
                local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2HP_PCT)
                if role_attr_coef ~= 0 then
                add = math.floor(add * (10000 + role_attr_coef) / 10000)
                end
                target:AddHp(add,item:GetKeyName(),"道具增益","增益药")
                --sLuaApp:LuaDbg("增加"..add.."血量成功")

            elseif itemObj["HpOrMp"] == 2 then -- 如果增加的是蓝量
                local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2MP_PCT)
                if role_attr_coef ~= 0 then
                add = math.floor(add * (10000 + role_attr_coef) / 10000)
                end
                target:AddMp(add,item:GetKeyName(),"道具增益","增益药")
                --sLuaApp:LuaDbg("增加"..add.."蓝量成功")
            end
            i = i +1
        end
    else
        -- sLuaApp:NotifyTipsMsgEx(sPlayerSystem:GetPlayerByGUID(role:GetGUID()), "目标已死亡")
    end

    -- 添加buff
    if buff then
        local i = 1
        while(buff[i] ~= nil) do
            if sFightSystem:CreateFightBuff(target, buff[i]) then
                --sLuaApp:LuaDbg("添加buff成功")
            end
            i = i + 1
        end
    end


end


function ProduceFood._pre_fight_func(fighter,item)
    local itemName = item:GetName()

    local player = sPlayerSystem:GetPlayerByGUID(fighter:GetGUID())

    if player then
        -- 判断当前等级是否满足
        local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
        local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
        -- 如果没有此数据或等级为0，将等级设为1
        if not randomLevel or randomLevel == 0 then randomLevel = 1 end

        if roleLevel < randomLevel then
            return '人物等级不足，无法使用'.. itemName
        end
    end

    return ''
end

--  战斗中使用物品之前回调
function ProduceFood.on_pre_fighter_use_item(fighter,item,amount)
    return ProduceFood._pre_fight_func(fighter,item)
end

-- 战斗中被使用物品之前回调
function ProduceFood.on_pre_fighter_use_item_passive(fighter,item,amount)
    return ProduceFood._pre_fight_func(fighter,item)
end