RandomPetGifts={}
-- 随机宠物礼包

RandomPetGifts.times = 1 --单个礼包给的物品种类数量
-- 创建物品 
function RandomPetGifts.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function RandomPetGifts.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function RandomPetGifts.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end	

    -- 更新配置文件
    RandomPetGifts.updateRandomPetGiftsConfig()
    local Item_Name=item:GetKeyName()
    -- sLuaApp:LuaDbg("Item_Name================================"..Item_Name)

	if RandomPetGiftsConfig.Main[Item_Name] and Lua_tools then
        -- 判断宠物栏位是否已满
        local petWareCon = player:GetPetContainer(1)
        local petWareHouseNow =petWareCon:GetCapacity()
        local petCount = petWareCon:GetPetCount()
        local subRes = petWareHouseNow - petCount
        if subRes < count then
            sLuaApp:NotifyTipsMsg(player,"宠物格子不足")
            return false
        end
        
    end
	
	return true
end

-- 使用物品
function RandomPetGifts.on_use_item(player, item, count)
    if item == nil then
        return
    end
	local Item_Name=item:GetKeyName()
    
	-- 随机送宠物
	for i = 1, count do
        local reward = Lua_tools.PlayerStartRandom(RandomPetGiftsConfig.Main[Item_Name], "Gifts"..item:GetId(), RandomPetGifts.times)
        if reward[1] ~= "Nil" then
            -- sLuaApp:LuaDbg(Lua_tools.serialize(reward))
            local petID = PetConfig.GetByKeyName(reward[1]).Id
            local isBind = true
            if reward[3] == 0 then
                isBind = false
            elseif reward[3] == 2 then
                isBind = item:IsBound()
            end
            sPetSystem:AddPetEx(player, petID, reward[2], isBind, "", "", "")
        else
            sLuaApp:NotifyTipsMsg(player,"礼包空空如也")
        end
    end
	
end

-- 更新配置文件
function RandomPetGifts.updateRandomPetGiftsConfig()

    if not RandomPetGiftsConfig.Main then
        sLuaApp:LuaDbg("RandomPetGiftsConfig.Main不存在")
    end

    local isUpdateConfig = false
    for k, v in pairs(RandomPetGiftsConfig.Main) do
        for key, value in pairs(v) do
            if value.PetKey then
                isUpdateConfig = true
            end
            goto RandomPetGiftsContinue1
        end
    end
    ::RandomPetGiftsContinue1::

    if isUpdateConfig then
        local temp = {}
        for k, v in pairs(RandomPetGiftsConfig.Main) do
            temp[k] = {}
            for key, value in pairs(v) do
                temp[k][key] = {}
                local item = {
                    ItemKey = value.PetKey,
                    Num = value.Level,
                    Bind = value.Bind,
                    Rand = value.Rand
                }
                temp[k][key] = item
                
            end
        end

        RandomPetGiftsConfig.Main = temp
    end

end