-- 生产系统 烹饪/炼药 的原材料物品
local ProduceMaterialItem = {}
_G.ProduceMaterialItem = ProduceMaterialItem

ProduceMaterialItem.ItemAttrList = { -- "HpOrMp" 1HP  2MP 3All
    ["烹饪材料1"] = {["Attr1"]=35,["Attr1Value"]=75,["isRand"]=0,["HpOrMp"]=1},
    ["烹饪材料2"] = {["Attr1"]=35,["Attr1Value"]=75,["isRand"]=0,["HpOrMp"]=1},
    ["烹饪材料3"] = {["Attr1"]=37,["Attr1Value"]=30,["isRand"]=0,["HpOrMp"]=2},
    ["烹饪佐料1"] = {["Attr1"]=37,["Attr1Value"]=30,["isRand"]=1,["HpOrMp"]=2,["RandMine"]=30,["RandMax"]=100},
    ["烹饪佐料2"] = {["Attr1"]=37,["Attr1Value"]=30,["isRand"]=0,["HpOrMp"]=2},
    ["烹饪佐料3"] = {["Attr1"]=37,["Attr1Value"]=30,["isRand"]=0,["HpOrMp"]=2},


    ["制药材料1"] = {["Attr1"]=35,["Attr1Value"]=50,["isRand"]=1,["HpOrMp"]=1,["RandMine"]=50,["RandMax"]=200},
    ["制药材料2"] = {["Attr1"]=35,["Attr1Value"]=100,["isRand"]=0,["HpOrMp"]=1},
    ["制药材料3"] = {["Attr1"]=37,["Attr1Value"]=50,["isRand"]=0,["HpOrMp"]=2},
    ["制药材料4"] = {["Attr1"]=35,["Attr1Value"]=100,["isRand"]=0,["HpOrMp"]=1},
    ["制药材料5"] = {["Attr1"]=37,["Attr1Value"]=50,["isRand"]=0,["HpOrMp"]=2},
}
--["Id"] = 32421,
--["Id"] = 32422,
--["Id"] = 32423,
--["Id"] = 32424,
--["Id"] = 32425,
--["Id"] = 32426,

--Id="32416" Name="无根水"
--Id="32417" Name="星斑草"
--Id="32418" Name="百年果"
--Id="32419" Name="五色花"
--Id="32420" Name="龙角叶"


-- 判断使用道具是否合规
function ProduceMaterialItem.isCanUseFood(player, item, itemKeyName)

    -- 查看物品加成属性
    local itemObj = ProduceMaterialItem.ItemAttrList[itemKeyName]
    -- 判断当前等级是否满足
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
    local Item = ItemConfig.GetByKeyName(itemKeyName)
    local ItemLevel = Item.Level -- 物品的等级
    if roleLevel < ItemLevel then
        sLuaApp:NotifyTipsMsg(player, "人物等级不足，无法使用")
        return false
    end


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

    return true
end

-- 使用物品前
function ProduceMaterialItem.on_pre_use_item(player, item, count)
    local itemKeyName = item:GetKeyName()
    if not ProduceMaterialItem.isCanUseFood(player,item,itemKeyName) then
        return false
    end
    return true
end

-- 使用物品时
function ProduceMaterialItem.on_use_item(player, item, count)

    local itemKeyName = item:GetKeyName()
    local itemObj = ProduceMaterialItem.ItemAttrList[itemKeyName] -- 表数据
    local str=""
    local addPool = itemObj.Attr1Value
    if player:GetType() == GUID_PLAYER then -- 判断是否是玩家  玩家才能操控血池蓝池
        if itemObj.isRand == 1 then
            if itemObj.RandMine and itemObj.RandMax then
                addPool = sLuaApp:RandInteger(itemObj.RandMine,itemObj.RandMax)
            end
        end
        -- 如果是加血量池
        if itemObj.HpOrMp == 1 then
            player:AddHpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药")
            str="血量"
        elseif itemObj.HpOrMp == 2  then --如果是蓝池
            player:AddMpPool(addPool,item:GetKeyName(),"烹饪物品增益","增益药")
            str="蓝量"
        end
    end
    local itemName = item:GetName()
    sLuaApp:NotifyTipsMsg(player,itemName.."使用成功,"..str.."增加了"..addPool)
    return false
end