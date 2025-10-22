-- 神兽碎片物品的使用
local PetFragmentItem = {}
_G.PetFragmentItem = PetFragmentItem

-- 神兽碎片的使用

PetFragmentItem.Pet_Fragment_player = {
    ["神兽鸡碎片"] = 206,
    ["神兽牛碎片"] = 208,
    ["神兽狗碎片"] = 207,
    ["神兽猪碎片"] = 205,
    ["神兽虎碎片"] = 210,
    ["神兽兔碎片"] = 211,
    ["神兽马碎片"] = 209,
    ["神兽羊碎片"] = 212,
    ["随机神兽碎片"] = 2,
}

-- 兑换数量
PetFragmentItem.ConvertCount = 99

-- 使用物品前
function PetFragmentItem.on_pre_use_item(player,item,count)

    local itemKeyName = item:GetKeyName()
    local itemId = item:GetId()
    local isBind = item:IsBound()

    -- 非绑定物品数量
    local noBindCount = sItemSystem:GetItemAmount(player, itemId,1)
    -- 绑定物品数量
    local BindCount = sItemSystem:GetItemAmount(player, itemId,2)
    -- 总物品数量
    local count = noBindCount + BindCount

    -- 宠物容器
    local pet_container = player:GetPetContainer(PET_CONTAINER_PANEL)


    if not PetFragmentItem.Pet_Fragment_player[itemKeyName] then
        sLuaApp:NotifyTipsMsg(player, "此神兽不存在")
        return false
    end

    if itemKeyName == "随机神兽碎片" then
        if Lua_tools then
            -- 移动到英国公李绩处
            Lua_tools.MoveToNpc(player,50009)
        end
        return false
        -- 判断数量是否有99个，然后减少此物品，然后获取其宠物
    elseif count < PetFragmentItem.ConvertCount then
        sLuaApp:NotifyTipsMsg(player,"该碎片不足".. PetFragmentItem.ConvertCount .."个，无法兑换神兽")
        return false
        -- 判断是否有空的宠物格子 宠物容量小于等级宠物数量则说明没有空位了
    elseif pet_container:GetCapacity() <= pet_container:GetPetCount () then
        sLuaApp:NotifyTipsMsg(player, '宠物包裹已满，无法兑换神兽')
        return false
    else

        if isBind then
            -- 如果绑定碎片足够
            if BindCount >= PetFragmentItem.ConvertCount then
                -- 扣除绑定碎片
                if sItemSystem:ConsumeItemWithId(player, itemId,PetFragmentItem.ConvertCount,2,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0 then
                    -- 获得绑定宠物
                    sPetSystem:AddPetEx(player, PetFragmentItem.Pet_Fragment_player[itemKeyName], 0, true, "system", "使用神兽碎片兑换", "使用神兽碎片"..itemKeyName.."兑换")
                else
                    sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                end
                -- 如果绑定碎片不足够
            else
                -- 求少了多少个碎片
                local different = PetFragmentItem.ConvertCount - BindCount
                -- 计算差的碎片数量是否合理，是否能用非绑定碎片满足
                if different < 0 then
                    sLuaApp:NotifyTipsMsg(player,"数据错误")
                    return false
                end
                if noBindCount < different then
                    sLuaApp:NotifyTipsMsg(player,"该碎片不足".. PetFragmentItem.ConvertCount .."个，无法兑换神兽")
                    return false
                end

                if not (sItemSystem:ConsumeItemWithId(player, itemId,BindCount,2,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0) then
                    sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                else
                    if not (sItemSystem:ConsumeItemWithId(player, item:GetId(),different,1,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0) then
                        sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                    else
                        -- 获得绑定宠物
                        sPetSystem:AddPetEx(player, PetFragmentItem.Pet_Fragment_player[itemKeyName], 0, true, "system", "使用神兽碎片兑换", "使用神兽碎片"..itemKeyName.."兑换")
                    end
                end
            end

        else

            -- 如果非绑定碎片足够
            if noBindCount >= PetFragmentItem.ConvertCount then
                if sItemSystem:ConsumeItemWithId(player, item:GetId(),PetFragmentItem.ConvertCount,1,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0 then
                    -- 获得非绑定宠物
                    sPetSystem:AddPetEx(player, PetFragmentItem.Pet_Fragment_player[itemKeyName], 0, false, "system", "使用神兽碎片兑换", "使用神兽碎片"..itemKeyName.."兑换")
                else
                    sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                end
            else

                local different = PetFragmentItem.ConvertCount - noBindCount
                if different < 0 then
                    sLuaApp:NotifyTipsMsg(player,"数据错误")
                    return false
                end
                if BindCount < different then
                    sLuaApp:NotifyTipsMsg(player,"该碎片不足".. PetFragmentItem.ConvertCount .."个，无法兑换神兽")
                    return false
                end

                if not (sItemSystem:ConsumeItemWithId(player, itemId,noBindCount,1,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0) then
                    sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                else
                    if not (sItemSystem:ConsumeItemWithId(player, item:GetId(),different,2,"system", "使用物品" , "使用物品："..item:GetKeyName()) == 0) then
                        sLuaApp:NotifyTipsMsg(player,"扣除物品失败！")
                    else
                        -- 获得绑定宠物
                        sPetSystem:AddPetEx(player, PetFragmentItem.Pet_Fragment_player[itemKeyName], 0, true, "system", "使用神兽碎片兑换", "使用神兽碎片"..itemKeyName.."兑换")
                    end
                end
            end
        end

    end

    return false

end


-- 使用物品
function PetFragmentItem.on_use_item(player, item, count)

end
