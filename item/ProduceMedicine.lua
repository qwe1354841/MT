-- 生产系统 炼药物品
local ProduceMedicine = {}
_G.ProduceMedicine = ProduceMedicine

-- 计算方式 物品等级 * Value + AttCoef
--"HpOrMp" 1HP  2MP 3All
ProduceMedicine.MedicineData = {
    ["血药-1"] = {["Id"]=32401,["Attr"]={0},["Value"]={35},["AttCoef"]=150,["HpOrMp"]=1 }, -- 金创药
    ["血药-2"] = {["Id"]=32402,["Attr"]={0},["Value"]={50},["AttCoef"]=100,["HpOrMp"]=1 },-- 诸葛行军丹
    ["蓝药-1"] = {["Id"]=32403,["Attr"]={0},["Value"]={15},["AttCoef"]=50,["HpOrMp"]=2 },-- 白花膏
    ["蓝药-2"] = {["Id"]=32404,["Attr"]={0},["Value"]={25},["AttCoef"]=30,["HpOrMp"]=2 },-- 麝香断续膏
    ["复活药-1"] = {["Id"]=32405,["Attr"]={0},["Value"]={0},["AttCoef"]=0,["HpOrMp"]=1 },-- 九转回魂丹
    ["复活药-2"] = {["Id"]=32406,["Attr"]={0},["Value"]={0},["AttCoef"]=0,["HpOrMp"]=1 },-- 聚魄还神散
    ["解除异常药"] = {["Id"]=32407,["Attr"]={0},["Value"]={3},["AttCoef"]=0,["HpOrMp"]=1 },-- 神仙茶
}

ProduceMedicine.ItemBuffer = {
    ["复活药-1"] = {10037},
    ["复活药-2"] = {10037},
    ["解除异常药"] = {10410},
}

-- 判断使用道具是否合规
function ProduceMedicine.isCanUseFood(player,item,isFight,itemKeyName)

    if player:GetType() ~= GUID_PLAYER then -- 如果传入的player不是角色而是Fighter
        player = sPlayerSystem:GetPlayerByGUID(player:GetGUID())
    end

    -- 物品加成属性
    local itemObj = ProduceMedicine.MedicineData [itemKeyName]
    -- 判断当前等级是否满足
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    if roleLevel < randomLevel then
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

-- 使用物品前
function ProduceMedicine.on_pre_use_item(player,item,count)
    local itemKeyName = item:GetKeyName()
    if not ProduceMedicine.isCanUseFood(player,item,false,itemKeyName) then
        return false
    end
    return true
end

-- 使用物品  -- 非战斗中
function ProduceMedicine.on_use_item(actor, item, count)

    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级

    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceMedicine.MedicineData[itemKeyName] -- 表数据
    local itemName = item:GetName()

    if actor:GetType() == GUID_PLAYER then -- 判断是否是玩家  玩家才能操控血池蓝池
        local addPool = randomLevel * itemObj.Value[1] + itemObj.AttCoef
        -- 如果是加血量池
        if itemObj.HpOrMp == 1 then
            if actor:AddHpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药") then
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用成功".."，血量池增加了"..addPool.."点")
            else
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用失败")
            end
        elseif itemObj.HpOrMp == 2  then --如果是蓝池
            if actor:AddMpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药") then
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用成功".."，蓝量池增加了"..addPool.."点")
            else
                sLuaApp:NotifyTipsMsg(actor,"["..itemName.."]使用失败")
            end
        end
    end
    --sLuaApp:NotifyTipsMsg(actor,itemName.."使用成功")

end

-- 战斗中对自己使用
function ProduceMedicine.on_fighter_use_item( role,  item,  amount)
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级

    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceMedicine.MedicineData[itemKeyName] -- 表数据
    local buff = ProduceMedicine.ItemBuffer[itemKeyName] -- buff数据

    --if  not ProduceMedicine.isCanUseFood(role,item,true,itemKeyName) then
    --    return false
    --end

    if itemObj["Value"][1] ~= 0 then
        local add = randomLevel * itemObj["Value"][1] + itemObj["AttCoef"]
        if itemObj["HpOrMp"] == 1  then -- 如果增加的是血量
            local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2HP_PCT)
            if role_attr_coef ~= 0 then
               add = math.floor(add * (10000 + role_attr_coef) / 10000)
            end
            role:AddHp(add,item:GetKeyName(),"道具增益","增益药")
        elseif itemObj["HpOrMp"] == 2 then -- 如果增加的是蓝量
            local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2MP_PCT)
            if role_attr_coef ~= 0 then
               add = math.floor(add * (10000 + role_attr_coef) / 10000)
            end
            role:AddMp(add,item:GetKeyName(),"道具增益","增益药")
        end
    end

    -- 添加buff
    if buff then
        for k,v in pairs(buff) do
            if sFightSystem:CreateFightBuff(role, v) then
            end
        end
    end


end

-- 战斗中对别人使用
function ProduceMedicine.on_fighter_use_item_passive( target, item, amount, role)
    local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级

    -- 如果没有此数据或等级为0，将等级设为1
    if not randomLevel or randomLevel == 0 then randomLevel = 1 end

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceMedicine.MedicineData[itemKeyName] -- 表数据
    local buff = ProduceMedicine.ItemBuffer[itemKeyName] -- buff数据

    --if not ProduceMedicine.isCanUseFood(role,item,true,itemKeyName) then
    --    return false
    --end
    if itemObj["Value"][1] ~= 0 then
        local add = randomLevel * itemObj["Value"][1] + itemObj["AttCoef"]
        if itemObj["HpOrMp"] == 1  then -- 如果增加的是血量
            local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2HP_PCT)
            if role_attr_coef ~= 0 then
               add = math.floor(add * (10000 + role_attr_coef) / 10000)
            end
            target:AddHp(add,item:GetKeyName(),"道具增益","增益药")
        elseif itemObj["HpOrMp"] == 2 then -- 如果增加的是蓝量
            local role_attr_coef = role:GetAttr(ROLE_ATTR_ITEM_2MP_PCT)
            if role_attr_coef ~= 0 then
               add = math.floor(add * (10000 + role_attr_coef) / 10000)
            end
            target:AddMp(add,item:GetKeyName(),"道具增益","增益药")
        end
    end

    -- 添加buff
    if buff then
        for k,v in pairs(buff) do
            if sFightSystem:CreateFightBuff(target, v) then
            end
        end
    end


end


-- 战斗前使用物品检测
function ProduceMedicine._pre_fight_func(fighter,item)
    local itemName = item:GetName()

    local player = sPlayerSystem:GetPlayerByGUID(fighter:GetGUID())

    if player then
        -- 判断当前等级是否满足
        local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
        local randomLevel = item:GetInt("itemRandomLevel") -- 物品的等级
        -- 如果没有此数据或等级为0，将等级设为1
        if not randomLevel or randomLevel == 0 then randomLevel = 1 end

        if roleLevel < randomLevel then
            return '人物等级不足，无法使用'..itemName
        end
    end

    return ''
end

function ProduceMedicine._pre_be_used_fight_func(fighter,item)
    local itemName = item:GetName()
    local item_key_name = item:GetKeyName()

    local player = sPlayerSystem:GetPlayerByGUID(fighter:GetGUID())

    -- if is resurgence
    if ProduceMedicine.ItemBuffer[item_key_name] ~= nil and ProduceMedicine.ItemBuffer[item_key_name] == ProduceMedicine.ItemBuffer['复活药-1'] then
        if fighter:IsDied() == false then
            return '目标无效，使用'..itemName..'失败'
        end
    end

    return ''
end



--  战斗中使用物品之前回调
function ProduceMedicine.on_pre_fighter_use_item(fighter,item,amount)
    return ProduceMedicine._pre_fight_func(fighter,item)
end

-- 战斗中被使用物品之前回调
function ProduceMedicine.on_pre_fighter_use_item_passive(fighter,item,amount)
    return ProduceMedicine._pre_be_used_fight_func(fighter,item)
end