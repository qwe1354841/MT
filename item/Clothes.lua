--时装
Clothes = {}

-- 使用物品前
function Clothes.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end
    local Item_Key = item:GetKeyName()
    if player:GetInt(Item_Key) == 1 then
        sLuaApp:NotifyTipsMsg(player,"该时装已拥有，无法再次解锁！")
        return false
    elseif player:GetInt(Item_Key) == 0 then
        local have_item_num = sItemSystem:GetItemAmount(player,item:GetId(),3)
        if have_item_num >= 1 then
            local PlayerSex = player:GetAttr(ROLE_ATTR_GENDER)
            local ClothesData = IllusionConfig.GetByKeyName(Item_Key)
            local ClothesTime = ClothesData.Time
            if ClothesData.Type == 1 or ClothesData.Type == 0 then
                local ItemNeedSex = ClothesData.Sex
                if PlayerSex ~= ItemNeedSex then
                    sLuaApp:NotifyTipsMsg(player,"你不能激活该时装，性别不匹配。")
                    return false
                end
                local DiffTimeItemList = Clothes.GetDiffTimeClothes(player,Item_Key)
                local IsDestroy = false --是否需要删除时装
                for k, v in pairs(DiffTimeItemList) do
                    local ClothesData_1 = IllusionConfig.GetByKeyName(v)
                    if ClothesTime == 0 then
                        if player:GetInt(v) == 1 and ClothesData_1.Time ~= 0 then
                            IsDestroy = true
                            local str = [[
                                GlobalUtils.ShowServerBoxMessage("操作会使已激活的时装失效，是否还要激活时装？")
                                ]]
                            player:SetString("SYSTEM_ConfirmBox_Function", "Clothes.ActivateClothes("..player:GetGUID()..","..item:GetGUID()..")")
                            sLuaApp:ShowForm(player, "脚本表单", str)
                            break
                        end
                    else
                        if player:GetInt(v) == 1 and ClothesData_1.Time < ClothesTime and ClothesData_1.Time ~= 0 then
                            IsDestroy = true
                            local str = [[
                                GlobalUtils.ShowServerBoxMessage("操作会使已激活的时装失效，是否还要激活时装？")
                                ]]
                            player:SetString("SYSTEM_ConfirmBox_Function", "Clothes.ActivateClothes("..player:GetGUID()..","..item:GetGUID()..")")
                            sLuaApp:ShowForm(player, "脚本表单", str)
                            break
                        elseif player:GetInt(v) == 1 and (ClothesData_1.Time > ClothesTime or ClothesData_1.Time == 0) then
                            sLuaApp:NotifyTipsMsg(player,"您已激活更高等级的时装，请到期后再尝试激活。")
                            return false
                        end
                    end
                end
                if IsDestroy == false then
                    Clothes.ActivateClothes(player:GetGUID(),item:GetGUID())
                end
            end
        end
    end
    return false
end

-- 使用物品
function Clothes.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end

--得到不同时限的时装或羽翼
function Clothes.GetDiffTimeClothes(player,Item_Key)
    if Item_Key == nil then
        return false
    end
    local itemList = {}
    local ClothesData = IllusionConfig.GetByKeyName(Item_Key)
    local Name = ClothesData.Name
    if Data then
       for k, v in pairs(Data.illusion) do
           if v.Name == Name and v.Time ~= ClothesData.Time then
            table.insert(itemList,v.KeyName)
           end
       end
    end
    return itemList
end

--激活长时限时装羽翼，删除短时限时装羽翼
function Clothes.ActivateClothes(PlayerGUID,ItemGUID)
    local player = sPlayerSystem:GetPlayerByGUID(PlayerGUID)
    local item = sItemSystem:GetItemByGUID (ItemGUID)
    if player == nil then
        return false
    end

    local Item_Id = item:GetId()
    local Item_Key = item:GetKeyName()
    local Item_Name = item:GetName()
    if sItemSystem:ConsumeItemWithId(player, Item_Id, 1, 3, "system", "时装羽翼","时装或羽翼激活消耗") == 0 then
        --删除短时限时装羽翼
        local ClothesData = IllusionConfig.GetByKeyName(Item_Key)
        local ClothesTime = ClothesData.Time
        local DiffTimeItemList = Clothes.GetDiffTimeClothes(player,Item_Key)
        for k, v in pairs(DiffTimeItemList) do
            if ClothesTime == 0 then
                if player:GetInt(v) == 1 then
                    player:SetInt( v , 0)
                    player:SetInt( v.."_Time", 0)
                end
            else
                local ClothesData_1 = IllusionConfig.GetByKeyName(v)
                if player:GetInt(v) == 1 and ClothesData_1.Time < ClothesTime then
                    player:SetInt( v , 0)
                    player:SetInt( v.."_Time", 0)
                end
            end
        end
        --激活长时限时装羽翼
        local Day = ClothesData.Time
        player:SetInt( Item_Key , 1 )
        if Day ~= 0 then
            player:SetInt( Item_Key..'_Time' , sLuaApp:GetTimes() + Day*24*60*60 )
        else
            player:SetInt( Item_Key..'_Time' , -1 )
        end

        if ClothesData.Type == 2 then
            sLuaApp:NotifyTipsMsg(player,"已激活羽翼："..Item_Name)
        else
            sLuaApp:NotifyTipsMsg(player,"已激活时装："..Item_Name)
        end
        Clothes.AddAttr(player,ClothesData)
        local str = [[
            if BagUI then
                BagUI.CreateConfirmWindow(]]..ClothesData.Id..","..ClothesData.Type..[[)
            end
            ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--设置对应加成属性
function Clothes.AddAttr(player,Data)
    if player == nil or Data == nil then
        return false
    end
    for i = 1,5 do
        if Data['Att'..i] ~= 0 then
            player:SetDynAttr(PlayerAttrClassify.Wing_Clothes_Add+(Data["Id"]-1),Data['Att'..i],Data['Att'..i..'Num'])
        end
    end
    player:RecalcAttr()
end

--扣除对应加成属性
function Clothes.SubAttr(player,Data)
    if not player or not Data then
        return false
    end
    for i = 1,5 do
        if Data['Att'..i] ~= 0 then
            player:SetDynAttr(PlayerAttrClassify.Wing_Clothes_Add+(Data["Id"]-1),Data['Att'..i],0)
        end
    end
    player:RecalcAttr()
end