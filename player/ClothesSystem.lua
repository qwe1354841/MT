--时装系统
ClothesSystem = {}

function ClothesSystem.GetData(player)
    if player == nil then
        return
    end

    local DataList = {}
    if Data then
        if Data.illusion == nil then
            sLuaApp:LuaErr("Data.illusion不存在")
            return
        end

        for k, v in pairs(Data.illusion) do
            if v.Type ~= 2 then
                if player:GetInt(v.KeyName) ~= 0 then
                    local list = {}
                    list.Id = v.Id
                    list.Time = player:GetInt( v.KeyName..'_Time')
                    table.insert(DataList,list)
                end
            end
        end 
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end

    local UseClothes = player:GetInt("Model_Clothes")
    local str = [[
        if BagUI then
            BagUI.Fashion_CurrentDress_Id = ]]..UseClothes..[[
            BagUI.FashionClothesItems = ]]..Lua_tools.serialize(DataList)..[[
            BagUI.RefreshFashionPage()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function ClothesSystem.WearClothes(player,Clothes_Id)
    Clothes_Id = tonumber(Clothes_Id)
    if player == nil or Clothes_Id == nil then
        return
    end

    if type(player) == "number" then
        player = sPlayerSystem:GetPlayerByGUID(player)
    end
    if Clothes_Id ~= 0 then
        local ClothesData = IllusionConfig.GetById(Clothes_Id)
        local ClothesKey = ClothesData.KeyName
        if player:GetInt(ClothesKey) == 0 then
            sLuaApp:NotifyTipsMsg(player,"您未拥有该时装，无法穿戴！")
            return
        end
        player:SetInt("Model_Clothes",tonumber(Clothes_Id))
        local Clothes_Name = ClothesData.Name
        sLuaApp:NotifyTipsMsg(player,"已穿戴时装:"..Clothes_Name)
    else
        local Last_ClothesId = player:GetInt("Model_Clothes")
        if Last_ClothesId == 0 then
            return
        end
        local ClothesData = IllusionConfig.GetById(Last_ClothesId)
        local Clothes_Name =ClothesData.Name
        player:SetInt("Model_Clothes",Clothes_Id)
        sLuaApp:NotifyTipsMsg(player,"已卸下时装:"..Clothes_Name)
    end

    local UseClothes = player:GetInt("Model_Clothes")
    local str = [[
        if BagUI then
            if 1 == BagUI.tabIndex then
                BagUI.RefreshModel()
            end
            BagUI.Fashion_CurrentDress_Id = ]]..UseClothes..[[
            local FashionPage = GUI.Get("BagUI/panelBg/FashionPage")
            if FashionPage ~= nil and GUI.GetVisible(FashionPage) then
                BagUI.RefreshFashionPage()
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function ClothesSystem.UseClothesItem(player,Item_Id)
    Item_Id = tonumber(Item_Id)
    if player == nil or Item_Id == nil then
        return
    end
    local item = sItemSystem:GetItemList(player, Item_Id, 3)[1]
    if item == nil then
        sLuaApp:NotifyTipsMsg(player,"物品错误")
        return
    end
    sItemSystem:UseItem(player,item)
end

function ClothesSystem.on_player_login(player)
    --判断 时限时装 或 时限羽翼 剩余时长
    local NowTime = sLuaApp:GetTimes()
    if Data then
        for k, v in pairs(Data.illusion) do
            if player:GetInt(v.KeyName.."_Time") ~= 0 and player:GetInt(v.KeyName.."_Time") ~= -1 then
                local SurplusTime = player:GetInt(v.KeyName.."_Time") - NowTime
                if SurplusTime > 0 then
                    sLuaTimerSystem:AddTimerEx(player,SurplusTime*1000,1,"ClothesSystem.DeleteClothes",""..v.KeyName..","..v.Type)
                elseif SurplusTime < 0 then
                    ClothesSystem.DeleteClothes(player,0,v.KeyName..","..v.Type)
                end
            end
        end
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end

function ClothesSystem.DeleteClothes(player,t_timer,param)
    if player == nil or param == nil then
        return
    end
	local data = sLuaApp:StrSplit (param, ",")
    local KeyName = data[1]
    local Type = tonumber(data[2])
    if Type ~= 2 then
        local ClothesData = IllusionConfig.GetByKeyName(KeyName)
        if player:GetInt("Model_Clothes") == ClothesData.Id then
            ClothesSystem.WearClothes(player,0)
        end
        Clothes.SubAttr(player,ClothesData)
    elseif Type == 2 then
        local WingData = IllusionConfig.GetByKeyName(KeyName)
        if player:GetInt("Model_Wing") == WingData.Id then
            WingSystem.WearWing(player,0)
        end
        Clothes.SubAttr(player,WingData)
    end
    player:SetInt(KeyName,0)
    player:SetInt(KeyName.."_Time",0)
end

function ClothesSystem.GetIllusion()
    if Data then
        Data.illusion = IllusionConfig.GetTableData()
        sLuaApp:LuaDbg("Data.illusion加载成功")
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
end