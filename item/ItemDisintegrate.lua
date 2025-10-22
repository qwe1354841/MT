--技能书合成
ItemDisintegrate = {}

ItemDisintegrate.DisintegrateList = {
    ["随机终极技能书"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["化无"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["将死"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["当头棒喝"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["明察秋毫"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["作鸟兽散"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["以牙还牙"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["绝境逢生"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["子虚乌有"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["春回大地"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
    ["涅槃"] = {['itemList'] = {{['KeyName']="终极技能书残卷",['Min']=10,['Max']=15}},['MoneyVal'] = 15000},
}

--分解
function ItemDisintegrate.Disintegrate(player,item_guid_list,enter_itemnum)
    local get_item_list = {}

    if item_guid_list then
        local itemguid_list = sLuaApp:StrSplit(item_guid_list, ',')--得到物品guid和数量表
        if enter_itemnum == nil then
            sLuaApp:LuaDbg('enter_itemnum为nil')
            return
        end
        for i = 1 , enter_itemnum * 2 , 2 do
            if sItemSystem:GetItemByGUID(tonumber(itemguid_list[i])) then
                local item = sItemSystem:GetItemByGUID(tonumber(itemguid_list[i]))

                if item ~= nil then
                    local item_Name = item:GetName() --得到物品
                    local item_KeyName = item:GetKeyName() --得到KeyName

                    if item_KeyName ~= nil then
                        local itemList = ItemDisintegrate.DisintegrateList[item_KeyName]['itemList']  --根据 KeyName 得到 itemList

                        for a, d in pairs(itemList) do
	                        local get_Num_Min = itemList[a]['Min']
	                        local get_Num_Max = itemList[a]['Max']
	                        local MoneyVal = ItemDisintegrate.DisintegrateList[item_KeyName]['MoneyVal'] --得到单个分解花费
                            local money_type = 5
                            local item_isbind = item:IsBound()
                            if itemguid_list[i+1] then
                                local itemSelectNum = tonumber(itemguid_list[i+1])  --得到被分解物品的数量
                                local itemNum = sItemSystem:GetItemAmount(player, ItemConfig.GetByKeyName(item_KeyName).Id, 3)  --得到玩家背包里的被分解物品数量
                                if itemNum < itemSelectNum then
                                    sLuaApp:NotifyTipsMsg(player, "您没有足够的"..item_Name)
                                else
                                    if Lua_tools.SubMoney(player, money_type, MoneyVal * itemSelectNum, "system", "物品分解", "分解花费") == true then  --扣除金币
                                        if sItemSystem:ConsumeItem(item,itemSelectNum,"system","物品分解","分解消耗") == 0 then  --消耗被分解物品
                                            local randomNum = sLuaApp:RandInteger(get_Num_Min * itemSelectNum,get_Num_Max * itemSelectNum)
                                            table.insert(get_item_list,itemList[a]['KeyName'])
                                            table.insert(get_item_list,randomNum)
                                            if item_isbind == false then
                                                table.insert(get_item_list,0)
                                            else
                                                table.insert(get_item_list,2)
                                            end
                                        end
                                    else
                                        sLuaApp:NotifyTipsMsg(player, "您没有足够的金钱")
                                    end
                                end
                            end
                        end
                    else
                        sLuaApp:NotifyTipsMsg(player, item_Name.."不可分解")
                    end
                end
            end
        end
    end
    if get_item_list ~= {} then
        if Lua_tools.AddItem(player, get_item_list, "system", "技能书分解", "技能书分解") == true then
            sLuaApp:NotifyTipsMsg(player, "分解成功")
        end
    end
end