-- 生产系统 烹饪
ProduceFoodSystem = {}

-- 是否开启生产食物不大于当前人物等级 true 开启
ProduceFoodSystem.is_always_less_role_level = nil

-- 最大最小等级 制作随机等级范围 消耗活力 描述 ；根据等级变化
ProduceFoodSystem.FoodConfig = {
    {["Id"]=1,["Name"]="土豆烧牛肉",["KeyName"]="烹饪1",["Type"]=1,["ItemId"]="32408",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=4,["Item2"]="烹饪材料2",["ItemNumber2"]=2,["Item3"]="烹饪佐料1",["ItemNumber3"]=2,["VP"]=0,},
    {["Id"]=2,["Name"]="糖醋排骨",["KeyName"]="烹饪2",["Type"]=1,["ItemId"]="32409",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=2,["Item2"]="烹饪佐料2",["ItemNumber2"]=1,["Item3"]="",["ItemNumber3"]=0,["VP"]=0,},
    {["Id"]=3,["Name"]="蟹黄豆腐煲",["KeyName"]="烹饪3",["Type"]=1,["ItemId"]="32410",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料3",["ItemNumber1"]=3,["Item2"]="烹饪佐料3",["ItemNumber2"]=2,["Item3"]="",["ItemNumber3"]=0,["VP"]=0,},
    {["Id"]=4,["Name"]="水煮肉片",["KeyName"]="烹饪4",["Type"]=1,["ItemId"]="32411",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=3,["Item2"]="烹饪佐料1",["ItemNumber2"]=3,["Item3"]="",["ItemNumber3"]=0,["VP"]=0,},
    {["Id"]=5,["Name"]="红烧肘子",["KeyName"]="烹饪5",["Type"]=1,["ItemId"]="32412",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=5,["Item2"]="烹饪佐料2",["ItemNumber2"]=2,["Item3"]="",["ItemNumber3"]=0,["VP"]=0,},
    {["Id"]=6,["Name"]="红烧牛尾",["KeyName"]="烹饪6",["Type"]=1,["ItemId"]="32413",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=3,["Item2"]="烹饪材料2",["ItemNumber2"]=1,["Item3"]="烹饪佐料3",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=7,["Name"]="烤羊排",["KeyName"]="烹饪7",["Type"]=1,["ItemId"]="32414",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料1",["ItemNumber1"]=4,["Item2"]="烹饪材料2",["ItemNumber2"]=2,["Item3"]="烹饪佐料3",["ItemNumber3"]=2,["VP"]=0,},
    {["Id"]=8,["Name"]="海椒醉蟹",["KeyName"]="烹饪8",["Type"]=1,["ItemId"]="32415",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="烹饪材料3",["ItemNumber1"]=2,["Item2"]="烹饪佐料2",["ItemNumber2"]=2,["Item3"]="烹饪佐料1",["ItemNumber3"]=1,["VP"]=0,},
}

-- 生产出物品的等级和消耗的活力值
ProduceFoodSystem.itemLevelAndVitality = {
    [1] = {
        -- 角色等级在10级(包括10级)内时
        roleLevel = 10,
        -- 生产物品的最低等级
        minLevel = 1,
        -- 生产物品的最高等级
        maxLevel = 15,
        -- 普通品质的物品消耗的活力
        ordinaryVitality = 10,
        -- 稀有品质消耗的物品
        rareVitality = 15,
    },
    [2] = {
        roleLevel = 20,
        minLevel = 5,
        maxLevel = 25,
        ordinaryVitality = 12,
        rareVitality = 18,
    },
    [3] = {
        roleLevel = 30,
        minLevel = 15,
        maxLevel = 35,
        ordinaryVitality = 14,
        rareVitality = 21,
    },
    [4] = {
        roleLevel = 40,
        minLevel = 25,
        maxLevel = 45,
        ordinaryVitality = 16,
        rareVitality = 24,
    },
    [5] = {
        roleLevel = 50,
        minLevel = 35,
        maxLevel = 55,
        ordinaryVitality = 18,
        rareVitality = 27,
    },
    [6] = {
        roleLevel = 60,
        minLevel = 45,
        maxLevel = 65,
        ordinaryVitality = 20,
        rareVitality = 30,
    },
    [7] = {
        roleLevel = 70,
        minLevel = 55,
        maxLevel = 75,
        ordinaryVitality = 24,
        rareVitality = 36,
    },
    [8] = {
        roleLevel = 80,
        minLevel = 65,
        maxLevel = 85,
        ordinaryVitality = 28,
        rareVitality = 42,
    },
    [9] = {
        roleLevel = 90,
        minLevel = 75,
        maxLevel = 95,
        ordinaryVitality = 32,
        rareVitality = 48,
    },
    [10] = {
        roleLevel = 100,
        minLevel = 85,
        maxLevel = 105,
        ordinaryVitality = 36,
        rareVitality = 54,
    },
    [11] = {
        roleLevel = 110,
        minLevel = 95,
        maxLevel = 115,
        ordinaryVitality = 40,
        rareVitality = 60,
    },
    [12] = {
        roleLevel = 120,
        minLevel = 105,
        maxLevel = 120,
        ordinaryVitality = 50,
        rareVitality = 70,
    },
}

------------------------------------------- start  生产系统-烹饪 start ----------------------------------------------
-- 打开页面时的请求
function ProduceFoodSystem.GetProduceFoodData(player, is_return_data)
    if player == nil then
        sLuaApp:LuaDbg("生产系统-烹饪 打开页面时的请求 player不存在")
        return
    end
    sCustomVarSystem:SetBroadcastScope(0, "itemRandomLevel", 1) -- 将值注册 让客户端也能获取
    -- 整理需要发送的数据
    -- 获取当前角色等级
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)

    local data = ProduceFoodSystem.getRangeAndVitality(roleLevel)
    -- 制作随机等级范围
    local minRandLevel = data.minLevel -- 最小随机等级
    local maxRandLevel = data.maxLevel -- 最大随机等级
    -- 消耗的活力值
    local vitality1 = data.ordinaryVitality
    local vitality2 = data.rareVitality

    -- 描述
    local description = "您当前等级可以制作".. (minRandLevel|0) .."~".. (maxRandLevel|0) .."级的食物"

    local confData = nil
    if ProduceFoodSystem.serializeConf then
        confData = ProduceFoodSystem.serializeConf
    else
        confData = Lua_tools.serialize(ProduceFoodSystem.FoodConfig)
        ProduceFoodSystem.serializeConf = confData
    end


    if not is_return_data then
        local str = [[
        if ProduceUI then
            ProduceUI.serverFoodData = ]]..confData..[[
            for k,v in ipairs(ProduceUI.serverFoodData) do
                v.ItemLevelMin = ]]..minRandLevel..[[
                v.ItemLevelMax = ]]..maxRandLevel..[[

                if k <= 4 then
                    v.VP = ]]..vitality1..[[
                else
                    v.VP = ]]..vitality2..[[
                end

                v.Info = ']]..description..[['
            end
            if ProduceUI.RefreshServerData then
                ProduceUI.RefreshServerData()
            end
        end
    ]]
        sLuaApp:ShowForm(player,"脚本表单",str)
        return ''
    else
        -- 深拷贝
        local d = {}
        for k,v in ipairs(ProduceFoodSystem.FoodConfig) do
            d[k] = {}
            for i,j in pairs(v) do
                d[k][i] = j
            end
            -- 调整生产物品的等级范围和生产消耗的活力值
            d[k].ItemLevelMin = minRandLevel
            d[k].ItemLevelMax = maxRandLevel
            if k <= 4 then
                d[k].VP = vitality1
            else
                d[k].VP = vitality2
            end
        end

        return d
    end
end

-- 一键购买

-- 消耗活力及拥有多少活力
-- 制作请求 -- 是否优先使用非绑定材料
function ProduceFoodSystem.MakeFood(player,id,isFirstUseNotBind)
    if not (player and id ) then
        sLuaApp:NotifyTipsMsg(player,"系统错误")
        sLuaApp:LuaWrn('ProduceFoodSystem 生产系统-烹饪 制作物品请求 传入参数为空')
        return ''
    end
    id = tonumber(id)
    if id == nil then
        sLuaApp:NotifyTipsMsg(player,"系统错误")
        sLuaApp:LuaDbg("生产系统-烹饪  制作请求 物品id无法转换为数字")
        return ''
    end
    if ProduceFoodSystem.FoodConfig[id] == nil then
        sLuaApp:NotifyTipsMsg(player,"系统错误")
        sLuaApp:LuaDbg('ProduceFoodSystem 生产系统-烹饪 制作物品请求 传入参数id(index) 查询不到对应下标的物品数据')
        return ''
    end

    if Lua_tools.GetBagFree(player) <= 0 then
        sLuaApp:NotifyTipsMsg(player,"背包已满，请清理后再试")
        return ''
    end

    -- 为 "1" 时才优先使用非绑定材料
    if isFirstUseNotBind == nil then
        isFirstUseNotBind = false
    elseif isFirstUseNotBind == "1" then
        isFirstUseNotBind = true
    else
        isFirstUseNotBind = false
    end

    --判断物品是否足够
    local material_Obj = {}
    -- 拷贝，防止并发导致问题
    for k,v in pairs(ProduceFoodSystem.FoodConfig[id]) do
        material_Obj[k] = v
    end

    -- 设置物品生产出来后的等级范围及生产需要消耗的活力
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
    local rangeAndVitalityData = ProduceFoodSystem.getRangeAndVitality(roleLevel)
    material_Obj.ItemLevelMin = rangeAndVitalityData.minLevel
    material_Obj.ItemLevelMax = rangeAndVitalityData.maxLevel
    if id <= 4 then
        material_Obj.VP = rangeAndVitalityData.ordinaryVitality
    else
        material_Obj.VP = rangeAndVitalityData.rareVitality
    end
    -- 判断是否能获取到此对象
    if material_Obj == nil then
        sLuaApp:NotifyTipsMsg(player,"系统错误")
        sLuaApp:LuaDbg("生产系统-烹饪 制作请求时 传入id错误")
        return ''
    end

    local is_Enough = true -- 材料是否足够
    local materialKind = 3 -- 材料的种类
    local itemList = {} -- 需要购买的列表
    local consumeItemList = {} -- 消耗的材料列表

    for i=1,materialKind do
        if material_Obj["Item"..i] ~= nil and material_Obj["Item"..i] ~= "" and material_Obj["ItemNumber"..i] > 0 then
            local item = ItemConfig.GetByKeyName(material_Obj["Item"..i]) -- 材料对象

            local bindMaterialCount = sItemSystem:GetItemAmount(player,item.Id,2)-- 绑定材料数量
            local materialCount =  sItemSystem:GetItemAmount(player,item.Id,1)-- 非绑定材料数量
            local count = bindMaterialCount + materialCount -- 材料数量

            local consumeCount = material_Obj["ItemNumber"..i] -- 需要消耗的材料数量

            table.insert(consumeItemList,{["itemId"]=item.Id,["consumeCount"]=consumeCount,["bindMaterialCount"]=bindMaterialCount,["materialCount"]=materialCount})

            if count >= material_Obj["ItemNumber"..i] then
                is_Enough = is_Enough and true
            else
                table.insert(itemList,material_Obj["Item"..i])
                table.insert(itemList,material_Obj["ItemNumber"..i] - count)
                is_Enough = false
            end
        end
    end

    -- 如果材料不足
    if not is_Enough then
        -- 显示一键购买
         OneKeyBuy.Main(player,itemList)
        return ""
    else -- 如果材料足够

        --消耗活力值
        local roleVP = player:GetVp()
        --sLuaApp:LuaDbg("角色活力值"..roleVP.."  消耗活力值"..material_Obj.VP)

        if material_Obj.VP and material_Obj.VP ~= 0 then
            if roleVP >= material_Obj.VP then
                if player:SubVp(material_Obj.VP,"system","烹饪食物","烹饪食物"..material_Obj.KeyName) then
                    --sLuaApp:LuaDbg("烹饪食物"..material_Obj.Name.."消耗活力值"..material_Obj.VP)
					if SeasonPassQuestFunc then
						SeasonPassQuestFunc.VitalityCost(player, material_Obj.VP)
					end
                else
                    sLuaApp:NotifyTipsMsg(player,"系统错误")
                    sLuaApp:LuaDbg("消耗活力值失败")
                    return ""
                end
            else
                sLuaApp:NotifyTipsMsg(player,"活力不足，无法制造")
                --sLuaApp:LuaDbg("活力值不足")
                return ""
            end
        else
            sLuaApp:NotifyTipsMsg(player,"系统错误")
            sLuaApp:LuaDbg("消耗活力值数据为空，或为0")
            return ""
        end

        if consumeItemList and next(consumeItemList) then

            -- 消耗材料
            local isConsumeNotBind = true  -- 判断消耗的物品是否都是非绑定的
            for i=1,#consumeItemList do
                local item = {["Id"]=consumeItemList[i].itemId}
                local bindMaterialCount = consumeItemList[i].bindMaterialCount -- 绑定材料数量
                local materialCount =  consumeItemList[i].materialCount -- 非绑定材料数量
                local consumeCount = consumeItemList[i].consumeCount -- 需要消耗的材料数量
                -- 根据isFirstUseNotBind判断是否优先使用非绑定材料
                local count = isFirstUseNotBind and materialCount or bindMaterialCount

                if count >= consumeCount then
                    if sItemSystem:ConsumeItemWithId(player, item.Id, consumeCount, isFirstUseNotBind and 1 or 2, "system",
                            "事务操作：生产系统-烹饪系统", "生产系统-烹饪-消耗非绑定材料"..item.Id) ~= 0 then
                        sLuaApp:LuaDbg("消耗非绑定材料失败,物品为"..item.Id)
                        sLuaApp:NotifyTipsMsg(player,"系统错误")
                        return ''
                    end
                    isConsumeNotBind = isConsumeNotBind and isFirstUseNotBind
                else -- 如果非绑定/绑定材料不够，消耗完非绑定/绑定材料，再消耗其差值的绑定材料

                    local Difference = consumeCount - count
                    local anotherCount = isFirstUseNotBind and bindMaterialCount or materialCount

                    if isFirstUseNotBind then -- 当优先使用非绑定材料，而非绑定材料不足(到这个else内就是不足了)
                        isConsumeNotBind = false
                    else -- 当优先使用绑定材料
                        if bindMaterialCount == 0 then -- 而绑定材料为0，只能使用非绑定材料
                            isConsumeNotBind = isConsumeNotBind and true
                        else
                            isConsumeNotBind = false
                        end
                    end

                    if anotherCount >= Difference then

                        if count > 0 then
                            if sItemSystem:ConsumeItemWithId(player, item.Id, count, isFirstUseNotBind and 1 or 2, "system",
                                    "事务操作：生产系统-烹饪系统","生产系统-烹饪-消耗非绑定材料"..item.Id ) ~= 0 then
                                sLuaApp:LuaDbg("消耗部分非绑定材料失败,物品为"..item.Id)
                                sLuaApp:NotifyTipsMsg(player,"系统错误")
                                return ''
                            end
                        end

                        if sItemSystem:ConsumeItemWithId(player, item.Id, Difference, isFirstUseNotBind and 2 or 1, "system",
                                "事务操作：生产系统-烹饪系统", "生产系统-烹饪-消耗绑定材料"..item.Id) ~= 0 then
                            sLuaApp:LuaDbg("消耗绑定材料失败,物品为"..item.Id)
                            sLuaApp:NotifyTipsMsg(player,"系统错误")
                            return ''
                        end

                    else
                        sLuaApp:LuaDbg("生产系统-烹饪系统 材料不足 无法制作")
                        sLuaApp:NotifyTipsMsg(player,"烹饪材料不足")
                        return ''
                    end
                end
            end

            -- 判断背包是否足够
            -- 需要随机等级 并设置到tips
            -- 随机出一个等级
            local itemRandomLevel = ProduceFoodSystem.getRandomLevel(material_Obj.ItemLevelMin,material_Obj.ItemLevelMax,roleLevel,ProduceFoodSystem.is_always_less_role_level)

            if Lua_tools.GetBagFree(player) > 0 then
                -- 添加制作出来的物品
                local items = sItemSystem:AddItemEx(player, material_Obj.ItemId,1,not isConsumeNotBind , "system", "烹饪成功",
                        "烹饪出"..material_Obj.Name.."成功")

                --sLuaApp:LuaDbg("烹饪出"..material_Obj.Name.."成功")
                items[1]:SetInt("itemRandomLevel",itemRandomLevel) -- 将随机等级绑定到物品对象上
                -- 将随机等级发送给客户端
                local str = [[
                    ProduceUI.itemRandomLevel = ]] ..itemRandomLevel.. [[
                    ProduceUI.RefreshServerData()
                    ProduceUI.MakeSuccess()
                ]]
                sLuaApp:ShowForm(player,"脚本表单",str)
                if SevenDayCallBack then
                    SevenDayCallBack.Cook(player)
                end
				if SeasonPassQuestFunc then
					SeasonPassQuestFunc.UpdateQuestProgress(player, 55)
				end
            else -- 如果背包不足
                sLuaApp:NotifyTipsMsg(player,"背包已满，请清理后再试")
            end

        end
    end

    return ""
end

------------------------------------------- end 生产系统-烹饪 end ---------------------------------------------------

-- 获取烹饪/炼药数据 用于小红点
function ProduceFoodSystem.get_all_data(player, type)
    local food_data = nil
    if ProduceFoodSystem then
        food_data = ProduceFoodSystem.GetProduceFoodData(player, true)
    end
    local medicine_data = nil
    if ProduceMedicineSystem then
        medicine_data = ProduceMedicineSystem.getData(player, true)
    end
    local data = {
        food_data = food_data,
        medicine_data = medicine_data
    }
    local str = [[
        GlobalProcessing.produce_data = ]].. Lua_tools.serialize(data) ..[[
        GlobalProcessing.ResetProduceRedPoint()
        GlobalProcessing.ProduceRedPoint()
    ]]

    if type == 2 then
        str = [[
           GlobalProcessing.produce_data = ]].. Lua_tools.serialize(data) ..[[
        GlobalProcessing.ResetProduceRedPoint()
        ]]
    end
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ''
end

-- 当角色升级时，活力值变化，需要更新小红点数
function ProduceFoodSystem.when_level_up_update(player, level)

    -- 查看了活力值变化的等级 大概是 11，21，31，41，51...
    if level % 10 ~= 1 then
        ProduceFoodSystem.get_all_data(player, 2)
    end
    return ''
end

ProduceFoodSystem.getRangeAndVitality = function(roleLevel)
    local d = nil
    for _,v in ipairs(ProduceFoodSystem.itemLevelAndVitality) do
        if roleLevel <= v.roleLevel then
            d = v
            break
        end
    end
    if d then
        return d
    else
        sLuaApp:LuaErr("ProduceFoodSystem.getRangeAndVitality d variable is nil")
        return false
    end
end

ProduceFoodSystem.getRandomLevel = function(minLevel,maxLevel,roleLevel,isAlwaysLessRoleLevel)
    local itemRandomLevel = sLuaApp:RandInteger(minLevel,maxLevel)
    -- 如果开启了不超过人物等级
    if isAlwaysLessRoleLevel then
        if itemRandomLevel > roleLevel then
            itemRandomLevel = roleLevel
        end
    end
    return itemRandomLevel
end