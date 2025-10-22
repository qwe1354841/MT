--长安城云游仙NPC
YunYouXianNPC = {}

--信物品质奇遇值配置
YunYouXianNPC.GradeConfig = {
    [2] = 50,  --绿色
    [3] = 100, --蓝色
    [4] = 200, --紫色
    [5] = 400, --橙色
}

--单独物品奇遇值配置
YunYouXianNPC.GradeConfig_item = {
    --["孙悟空信物"] = 600,
}

function YunYouXianNPC.main(npc,player)
    if npc:GetKeyName() == "长安城-云游仙" then
        player:AddNpcOption(npc, 0, "上交侍从信物", "option1", "")
        player:AddNpcOption(npc, 0, "奇遇值兑换信物", "option2", "")
        player:AddNpcOption(npc, 0, "奇遇值兑换变身卡", "option3", "")
        return "老朽云游四方最看重的就是人脉，你若是有什么能讨三界群雄欢心的东西，倒是可以与我交换。"
    end
end

--良师值兑换
function YunYouXianNPC.option1(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    local str = [[
        GUI.OpenWnd('HandInGuardTokenUI')
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--奇遇值兑换信物
function YunYouXianNPC.option2(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    --打开奇遇商店
    local str = [[
        GUI.OpenWnd("ShopStoreUI", "3")
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--奇遇值兑换变身卡
function YunYouXianNPC.option3(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    --打开幻身商店
    local str = [[
        GUI.OpenWnd("ShopStoreUI", "4")
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--获取信物对应奇遇值配置 
function YunYouXianNPC.GetGradeConfig(player)
    if not player then
        return
    end
    local list = {}
    list["GradeConfig"] = YunYouXianNPC.GradeConfig
    list["GradeConfig_item"] = YunYouXianNPC.GradeConfig_item
    local str = [[
        HandInGuardTokenUI._token_HE_num = ]]..Lua_tools.serialize(list)..[[
        HandInGuardTokenUI._get_token_HE_num_call_back()
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--信物兑换
function YunYouXianNPC.ExchangeAdv(player,ItemStr)
    if not player or not ItemStr then
        return ""
    end
    local ItemKeyList_1 = sLuaApp:StrSplit(ItemStr , '_')
    local ItemKeyList = {}
    --将itemList_1中的数字str进行tonumber
    for k, v in pairs(ItemKeyList_1) do
        if tonumber(v) then
            table.insert(ItemKeyList,tonumber(v))
        else
            table.insert(ItemKeyList,v)
        end
    end
    local IsSuccess = false
    for k, v in pairs(ItemKeyList) do
        local item = ""
        local num = 0
        local isband = 3
        if type(v) == "string" then
			item = v
			if item ~= "" then
				if ItemKeyList[k+1] then
					if type(ItemKeyList[k+1]) == "number" then
						num = ItemKeyList[k+1]
                        if type(ItemKeyList[k+2]) == "number" then
                            isband = ItemKeyList[k+2]
                        end
					end
				end
			end
		end
        local item_id = sItemSystem:GetItemIdByKeyname(item)
        local ItemContainer
        if BagClassify.Mode and BagClassify.Mode == 1 then
            ItemContainer = player:GetItemContainer(ITEM_CONTAINER_BAG)
        else
            ItemContainer = player:GetItemContainer(ITEM_CONTAINER_GUARD_BAG)
        end
        local itemnum = ItemContainer:GetItemAmountById(item_id,3)
        if itemnum < num then
            sLuaApp:NotifyTipsMsg(player , '信物数量不足')
            return
        else
            if sItemSystem:ConsumeItemWithId(player,item_id,num,isband,"system","上交信物","上交信物加奇遇值消耗") == 0 then
                if YunYouXianNPC.GradeConfig_item[item] ~= nil then
                    if player:AddAdv(num*YunYouXianNPC.GradeConfig_item[item],"system","上交信物","上交信物加奇遇值") then
                        IsSuccess = true
                    end
                else
                    local itemData = ItemConfig.GetByKeyName(item)
                    if player:AddAdv(num*YunYouXianNPC.GradeConfig[itemData.Grade],"system","上交信物","上交信物加奇遇值") then
                        IsSuccess = true
                    end
                end 
            end
        end
    end
    if IsSuccess then
        sLuaApp:NotifyTipsMsg(player , "兑换奇遇值成功")
    else
        sLuaApp:NotifyTipsMsg(player , "兑换奇遇值失败")
    end
end