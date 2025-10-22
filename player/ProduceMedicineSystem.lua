-- 生产系统 炼药
ProduceMedicineSystem = {}

-- 是否开启生产药品不大于当前人物等级 true 开启
ProduceMedicineSystem.is_always_less_role_level = nil


ProduceMedicineSystem.medicineData = {
    {["Id"]=1,["Name"]="金创药",   ["KeyName"]="血药-1",["Type"]=2,["ItemId"]="32401",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=1,["Item2"]="制药材料2",["ItemNumber2"]=2,["Item3"]="制药材料4",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=2,["Name"]="诸葛行军丹",["KeyName"]="血药-2",["Type"]=2,["ItemId"]="32402",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=2,["Item2"]="制药材料2",["ItemNumber2"]=1,["Item3"]="制药材料3",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=3,["Name"]="白花膏",   ["KeyName"]="蓝药-1",["Type"]=2,["ItemId"]="32403",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=1,["Item2"]="制药材料4",["ItemNumber2"]=2,["Item3"]="制药材料5",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=4,["Name"]="麝香断续膏",["KeyName"]="蓝药-2",["Type"]=2,["ItemId"]="32404",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=2,["Item2"]="制药材料4",["ItemNumber2"]=1,["Item3"]="制药材料3",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=5,["Name"]="九转回魂丹",["KeyName"]="复活药-1",["Type"]=2,["ItemId"]="32405",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=4,["Item2"]="制药材料3",["ItemNumber2"]=3,["Item3"]="制药材料5",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=6,["Name"]="聚魄还神散",["KeyName"]="复活药-2",["Type"]=2,["ItemId"]="32406",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=3,["Item2"]="制药材料3",["ItemNumber2"]=2,["Item3"]="制药材料4",["ItemNumber3"]=1,["VP"]=0,},
    {["Id"]=7,["Name"]="神仙茶",   ["KeyName"]="解除异常药",["Type"]=2,["ItemId"]="32407",["LevelMin"]=1,["LevelMax"]=1,["Item1"]="制药材料1",["ItemNumber1"]=6,["Item2"]="制药材料5",["ItemNumber2"]=2,["Item3"]="制药材料4",["ItemNumber3"]=1,["VP"]=0,},
}

-- 生产出物品的等级和消耗的活力值
ProduceMedicineSystem.itemLevelAndVitality = {
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


 ProduceMedicineSystem.vitality = { 1,2,1,2,1,2,2 }
-- ProduceMedicineSystem.vitality1 = {
--    10,12,14,16,18,20,24,28,32,36,40,50
--}
-- ProduceMedicineSystem.vitality2 = {
--    15,18,21,24,27,30,36,42,48,54,60,70
--}
-- local RoleMaxLevel = 120 -- 角色最大等级
function ProduceMedicineSystem.getData(player, is_return_data)
    if player == nil then
        sLuaApp:LuaDbg("生产系统-炼药 打开页面时的请求 player不存在")
        return
    end
    -- 整理需要发送的数据
    -- 获取当前角色等级
    local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
    local rangeAndVitalityData = ProduceMedicineSystem.getRangeAndVitality(roleLevel)
    -- 制作随机等级范围
    local minRandLevel = rangeAndVitalityData.minLevel -- 最小随机等级
    local maxRandLevel = rangeAndVitalityData.maxLevel -- 最大随机等级
    -- 消耗的活力值
    local vitality1 = rangeAndVitalityData.ordinaryVitality
    local vitality2 = rangeAndVitalityData.rareVitality

    ---- 根据角色获取最大等级和最小等级及下标
    --local quotient = nil
    --if roleLevel % 10 ~= 0 then
    --    quotient = roleLevel // 10   -- 商 地板除
    --else
    --    quotient = (roleLevel-1) // 10 -- 当是整级时 如 50 40，则-1 运算
    --end
    --local minLevel = quotient * 10 + 1 -- 最小等级
    --local maxLevel = quotient * 10 + 10 -- 最大等级
    --local index = quotient + 1 -- 下标
    --
    ---- 制作随机等级范围
    --local minRandLevel = nil -- 最小随机等级
    --local maxRandLevel = nil -- 最大随机等级
    --if roleLevel == 1 then
    --    minRandLevel = 1
    --    maxRandLevel = maxLevel + 5
    --elseif roleLevel == RoleMaxLevel then
    --    maxRandLevel = RoleMaxLevel
    --    minRandLevel = minLevel - 6
    --else
    --    minRandLevel = minLevel - 6
    --    if (maxLevel + 5) > RoleMaxLevel then
    --        maxRandLevel = RoleMaxLevel
    --    else
    --        maxRandLevel = maxLevel + 5
    --    end
    --end
    --
    ---- 消耗的活力值
    --local vitality1 = ProduceMedicineSystem.vitality1[index]
    --local vitality2 = ProduceMedicineSystem.vitality2[index]

    -- 描述
    local description = "您当前等级可以制作".. (minRandLevel|0) .."~".. (maxRandLevel|0) .."级的药品"

    ---- 放入数据
    --for k,v in ipairs(ProduceMedicineSystem.medicineData) do
    --    -- 等级
    --    v.LevelMin = minLevel
    --    v.LevelMax = maxLevel
    --    -- 随机等级
    --    v.ItemLevelMin = minRandLevel
    --    v.ItemLevelMax = maxRandLevel
    --    -- 消耗活力值
    --    if ProduceMedicineSystem.vitality[k] == 1 then
    --        v.VP = vitality1
    --    else
    --        v.VP = vitality2
    --    end
    --
    --    -- 描述
    --    v.Info = description
    --end

    -- 将表单发送给客户端
    --sLuaApp:LuaDbg(Lua_tools.serialize(ProduceMedicineSystem.medicineData ))
    --sLuaApp:LuaDbg("商"..quotient)
    --local guid = player:GetGUID()
    --if not ProduceMedicineSystem.medicineData_by_guid then ProduceMedicineSystem.medicineData_by_guid = {} end
    --ProduceMedicineSystem.medicineData_by_guid[guid] = ProduceMedicineSystem.medicineData
    ---- 1分钟后删除此数据
    --    -- 记录下定时器guid 防止重复执行
    --if not ProduceMedicineSystem.del_data_timer then ProduceMedicineSystem.del_data_timer = {} end
    --if ProduceMedicineSystem.del_data_timer[guid] == nil then
    --    ProduceMedicineSystem.del_data_timer[guid] =
    --    sLuaTimerSystem:AddTimerEx(player, 60000,1,"ProduceMedicineSystem.del_data", ""..guid)
    --end

    local confData = nil
    if ProduceMedicineSystem.serializeConf then
        confData = ProduceMedicineSystem.serializeConf
    else
        confData = Lua_tools.serialize(ProduceMedicineSystem.medicineData)
        ProduceMedicineSystem.serializeConf = confData
    end

    local vitalityRule = nil
    if ProduceMedicineSystem.serializeVitalityRule then
        vitalityRule = ProduceMedicineSystem.serializeVitalityRule
    else
        vitalityRule = Lua_tools.serialize(ProduceMedicineSystem.vitality)
        ProduceMedicineSystem.serializeVitalityRule = vitalityRule
    end

    if not is_return_data then
        local str = [[
        if ProduceUI then
            ProduceUI.serverMedicineData = ]]..confData..[[
            ProduceUI.vitalityRule = ]]..vitalityRule..[[
            for k,v in ipairs(ProduceUI.serverMedicineData) do
                v.ItemLevelMin = ]]..minRandLevel..[[
                v.ItemLevelMax = ]]..maxRandLevel..[[

                if ProduceUI.vitalityRule[k] == 1 then
                    v.VP = ]]..vitality1..[[
                else
                    v.VP = ]]..vitality2..[[
                end

                v.Info = ']]..description..[['
            end
            ProduceUI.vitalityRule = nil
            if ProduceUI.RefreshServerData then
                ProduceUI.RefreshServerData()
            end
        end
    ]]
        sLuaApp:ShowForm(player,"脚本表单",str)
    --    local sendString = [[
    --    ProduceUI.serverMedicineData = ]]..Lua_tools.serialize(ProduceMedicineSystem.medicineData )..[[
    --    ProduceUI.RefreshServerData()
    --]]
    --    sLuaApp:ShowForm(player,"脚本表单",sendString)
        return ""
    else
        local d = {}
        for k,v in ipairs(ProduceMedicineSystem.medicineData) do
            d[k] = {}
            for i,j in pairs(v) do
                d[k][i] = j
            end
            -- 调整生产物品的等级范围和生产消耗的活力值
            d[k].ItemLevelMin = minRandLevel
            d[k].ItemLevelMax = maxRandLevel
            if ProduceMedicineSystem.vitality[k] == 1 then
                d[k].VP = vitality1
            else
                d[k].VP = vitality2
            end
        end
        return d
    end
end


 function ProduceMedicineSystem.MakeMedicine(player,id,isFirstUseNotBind)
     if not (player and id ) then
         sLuaApp:NotifyTipsMsg(player,"系统错误")
         sLuaApp:LuaWrn('ProduceMedicineSystem 生产系统-烹饪 制作物品请求 传入参数为空')
         return ''
     end
     id = tonumber(id)
     if id == nil then
         sLuaApp:NotifyTipsMsg(player,"发送数据错误")
         sLuaApp:LuaDbg("生产系统-炼药  制作请求 物品id无法转换为数字")
         return ''
     end
     if ProduceMedicineSystem.medicineData[id] == nil then
         sLuaApp:NotifyTipsMsg(player,"系统错误")
         sLuaApp:LuaDbg("生产系统-炼药  制作请求 传入参数id(index) 查询不到对应下标的物品数据")
         return ''
     end

     -- 虽然可能会消耗材料空出位置来，但如果材料很多没有消耗完空出位置来，就会导致消耗完材料生产出来的物品没格子放
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
     --local material_Obj = ProduceMedicineSystem.medicineData[id]
     --local guid = player:GetGUID()
     --if ProduceMedicineSystem.medicineData_by_guid and ProduceMedicineSystem.medicineData_by_guid[guid] then
     --    material_Obj = ProduceMedicineSystem.medicineData_by_guid[guid][id]
     --else
     --    material_Obj = ProduceMedicineSystem.getData(player, true)
     --end
     -- 拷贝，防止并发导致问题
     local material_Obj = {}
     for k,v in pairs(ProduceMedicineSystem.medicineData[id]) do
         material_Obj[k] = v
     end

     -- 设置物品生产出来后的等级范围及生产需要消耗的活力
     local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
     local rangeAndVitalityData = ProduceMedicineSystem.getRangeAndVitality(roleLevel)
     material_Obj.ItemLevelMin = rangeAndVitalityData.minLevel
     material_Obj.ItemLevelMax = rangeAndVitalityData.maxLevel
     if ProduceMedicineSystem.vitality[id] == 1 then
         material_Obj.VP = rangeAndVitalityData.ordinaryVitality
     else
         material_Obj.VP = rangeAndVitalityData.rareVitality
     end
     -- 判断是否能获取到此对象
     if material_Obj == nil then
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
                 if player:SubVp(material_Obj.VP,"system","炼制药品","炼制药品"..material_Obj.KeyName)  then
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
                             "事务操作：生产系统-炼药系统", "生产系统-炼药-消耗非绑定材料"..item.Id) ~= 0 then
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
                                     "事务操作：生产系统-炼药系统","生产系统-炼药-消耗非绑定材料"..item.Id ) ~= 0 then
                                 sLuaApp:LuaDbg("消耗部分非绑定材料失败,物品为"..item.Id)
                                 sLuaApp:NotifyTipsMsg(player,"系统错误")
                                 return ''
                             end
                         end

                         if sItemSystem:ConsumeItemWithId(player, item.Id, Difference, isFirstUseNotBind and 2 or 1, "system",
                                 "事务操作：生产系统-炼药系统", "生产系统-炼药-消耗绑定材料"..item.Id) ~= 0 then
                             sLuaApp:LuaDbg("消耗绑定材料失败,物品为"..item.Id)
                             sLuaApp:NotifyTipsMsg(player,"系统错误")
                             return ''
                         end

                     else
                         sLuaApp:LuaDbg("生产系统-炼药系统 材料不足 无法制作")
                         sLuaApp:NotifyTipsMsg(player,"炼药材料不足")
                         return ''
                     end
                 end
             end

             -- 判断背包是否足够
             -- 需要随机等级 并设置到tips
             -- 随机出一个等级
             local itemRandomLevel = ProduceMedicineSystem.getRandomLevel(material_Obj.ItemLevelMin,material_Obj.ItemLevelMax,roleLevel,ProduceMedicineSystem.is_always_less_role_level)
             --local itemRandomLevel = sLuaApp:RandInteger(material_Obj.ItemLevelMin,material_Obj.ItemLevelMax)
             --
             ---- 对等级进行检测
             --local roleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
             --if itemRandomLevel == nil or itemRandomLevel <= 0 then
             --    if roleLevel then
             --        itemRandomLevel = roleLevel
             --    else
             --        itemRandomLevel = 1
             --    end
             --end
             --
             ---- 如果开启了不超过人物等级
             --if ProduceMedicineSystem.is_always_less_role_level then
             --   if itemRandomLevel > roleLevel then
             --       itemRandomLevel = roleLevel
             --   end
             --end

             if Lua_tools.GetBagFree(player) > 0 then
                 -- 添加制作出来的物品
                 local items = sItemSystem:AddItemEx(player, material_Obj.ItemId,1,not isConsumeNotBind , "system", "炼药成功",
                         "炼药出"..material_Obj.Name.."成功")

                 items[1]:SetInt("itemRandomLevel",itemRandomLevel) -- 将随机等级绑定到物品对象上
                 -- 将随机等级发送给客户端
                 local str = [[
                    ProduceUI.itemRandomLevel = ]] ..itemRandomLevel.. [[
                    ProduceUI.RefreshServerData()
                    ProduceUI.MakeSuccess()
                ]]
                 sLuaApp:ShowForm(player,"脚本表单",str)

             else -- 如果背包不足
                 sLuaApp:NotifyTipsMsg(player,"背包已满，请清理后再试")
             end

         end
     end

     return ""
 end


-- 定时器函数，过一段时间后删除数据变量
--function ProduceMedicineSystem.del_data(player, timer, parameter)
--    local guid = player:GetGUID()
--    if not guid then
--        guid = tonumber(parameter)
--        if not guid then
--            sLuaApp:LuaDbg("ProduceMedicineSystem 删除数据失败 传入的player_guid 为空")
--            return ''
--        end
--    end
--    if ProduceMedicineSystem.medicineData_by_guid and ProduceMedicineSystem.medicineData_by_guid[guid] then
--        -- 清除数据
--        ProduceMedicineSystem.medicineData_by_guid[guid] = nil
--        -- 清除定时器guid
--        if ProduceMedicineSystem.del_data_timer and ProduceMedicineSystem.del_data_timer[guid] then
--            ProduceMedicineSystem.del_data_timer[guid] = nil
--        end
--    end
--    return ''
--end

ProduceMedicineSystem.getRangeAndVitality = function(roleLevel)
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
        sLuaApp:LuaErr("ProduceMedicineSystem.getRangeAndVitality d variable is nil")
        return false
    end
end

ProduceMedicineSystem.getRandomLevel = function(minLevel,maxLevel,roleLevel,isAlwaysLessRoleLevel)
    local itemRandomLevel = sLuaApp:RandInteger(minLevel,maxLevel)
    -- 如果开启了不超过人物等级
    if isAlwaysLessRoleLevel then
        if itemRandomLevel > roleLevel then
            itemRandomLevel = roleLevel
        end
    end
    return itemRandomLevel
end