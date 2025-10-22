--羽翼系统
WingSystem = {}

WingSystem.PlayerFreeWing = "升级用翅膀1"

--品阶每级的属性增量
WingSystem.StageAttr_Increment= { --43 = 物攻，45 = 法攻，44 = 物防，46 = 法防，68 = 物爆，71 = 法爆，50 = 闪避，49 = 命中，51 = 速度
[0]  = {Exp = 100   ,Attr = {[43] = 1 , [45] = 1 , [44] = 2 , [46] = 2 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[1]  = {Exp = 150   ,Attr = {[43] = 2 , [45] = 2 , [44] = 3 , [46] = 3 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[2]  = {Exp = 200   ,Attr = {[43] = 3 , [45] = 3 , [44] = 4 , [46] = 4 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[3]  = {Exp = 300   ,Attr = {[43] = 4 , [45] = 4 , [44] = 5 , [46] = 5 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[4]  = {Exp = 500   ,Attr = {[43] = 5 , [45] = 5 , [44] = 6 , [46] = 6 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[5]  = {Exp = 800   ,Attr = {[43] = 6 , [45] = 6 , [44] = 7 , [46] = 7 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[6]  = {Exp = 1200  ,Attr = {[43] = 7 , [45] = 7 , [44] = 8 , [46] = 8 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[7]  = {Exp = 1800  ,Attr = {[43] = 8 , [45] = 8 , [44] = 9 , [46] = 9 , [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[8]  = {Exp = 2500  ,Attr = {[43] = 9 , [45] = 9 , [44] = 10, [46] = 10, [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[9]  = {Exp = 3600  ,Attr = {[43] = 10, [45] = 10, [44] = 11, [46] = 11, [68] = 0 , [71] = 0 , [50] = 0 , [49] = 0 , [51] = 0}},
[10] = {Exp = 5000  ,Attr = {[43] = 11, [45] = 11, [44] = 12, [46] = 12, [68] = 5 , [71] = 5 , [50] = 10 , [49] = 10 , [51] = 1}},
[11] = {Exp = 8000  ,Attr = {[43] = 12, [45] = 12, [44] = 13, [46] = 13, [68] = 10 , [71] = 10 , [50] = 20 , [49] = 20 , [51] = 2}},
[12] = {Exp = 15000 ,Attr = {[43] = 13, [45] = 13, [44] = 14, [46] = 14, [68] = 15 , [71] = 15 , [50] = 30 , [49] = 30 , [51] = 3}},
[13] = {Exp = 25000 ,Attr = {[43] = 14, [45] = 14, [44] = 15, [46] = 15, [68] = 20 , [71] = 20 , [50] = 40 , [49] = 40 , [51] = 4}},
[14] = {Exp = 50000 ,Attr = {[43] = 15, [45] = 15, [44] = 16, [46] = 16, [68] = 25 , [71] = 25 , [50] = 50 , [49] = 50 , [51] = 5}},
}

--升阶配置
WingSystem.Stage_Config= { --43 = 物攻，45 = 法攻，44 = 物防，46 = 法防，68 = 物爆，71 = 法爆，50 = 闪避，49 = 命中，51 = 速度
[1]  = {ItemKey_1 = "翅膀进阶1", ItemNum_1 = 1 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001603 , Effects_2 = 3000001604 , Attr = {[43] = 0  , [45] = 0  , [44] = 15  , [46] = 15  , [68] = 0  , [71] = 0  , [50] = 0  , [49] = 0  , [51] = 0  }},
[2]  = {ItemKey_1 = "翅膀进阶1", ItemNum_1 = 2 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001603 , Effects_2 = 3000001604 , Attr = {[43] = 0  , [45] = 0  , [44] = 15  , [46] = 15  , [68] = 0  , [71] = 0  , [50] = 0  , [49] = 0  , [51] = 0  }},
[3]  = {ItemKey_1 = "翅膀进阶1", ItemNum_1 = 4 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001603 , Effects_2 = 3000001604 , Attr = {[43] = 10 , [45] = 10 , [44] = 30  , [46] = 30  , [68] = 0  , [71] = 0  , [50] = 0  , [49] = 0  , [51] = 0  }},
[4]  = {ItemKey_1 = "翅膀进阶1", ItemNum_1 = 7 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001605 , Effects_2 = 3000001606 , Attr = {[43] = 5  , [45] = 5  , [44] = 20  , [46] = 20  , [68] = 0  , [71] = 0  , [50] = 0  , [49] = 0  , [51] = 0  }},
[5]  = {ItemKey_1 = "翅膀进阶1", ItemNum_1 = 10, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001605 , Effects_2 = 3000001606 , Attr = {[43] = 5  , [45] = 5  , [44] = 45  , [46] = 45  , [68] = 0  , [71] = 0  , [50] = 0  , [49] = 0  , [51] = 0  }},
[6]  = {ItemKey_1 = "翅膀进阶2", ItemNum_1 = 2 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001605 , Effects_2 = 3000001606 , Attr = {[43] = 5  , [45] = 5  , [44] = 25  , [46] = 25  , [68] = 50 , [71] = 50 , [50] = 0  , [49] = 0  , [51] = 0  }},
[7]  = {ItemKey_1 = "翅膀进阶2", ItemNum_1 = 4 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001605 , Effects_2 = 3000001606 , Attr = {[43] = 35 , [45] = 35 , [44] = 60  , [46] = 60  , [68] = 20 , [71] = 20 , [50] = 0  , [49] = 0  , [51] = 0  }},
[8]  = {ItemKey_1 = "翅膀进阶2", ItemNum_1 = 8 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001605 , Effects_2 = 3000001606 , Attr = {[43] = 45 , [45] = 45 , [44] = 70  , [46] = 70  , [68] = 20 , [71] = 20 , [50] = 0  , [49] = 0  , [51] = 0  }},
[9]  = {ItemKey_1 = "翅膀进阶2", ItemNum_1 = 14, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 55 , [45] = 55 , [44] = 80  , [46] = 80  , [68] = 20 , [71] = 20 , [50] = 0  , [49] = 0  , [51] = 0  }},
[10] = {ItemKey_1 = "翅膀进阶2", ItemNum_1 = 20, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 65 , [45] = 65 , [44] = 90  , [46] = 90  , [68] = 20 , [71] = 20 , [50] = 150, [49] = 150, [51] = 25 }},
[11] = {ItemKey_1 = "翅膀进阶3", ItemNum_1 = 3 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 75 , [45] = 75 , [44] = 100 , [46] = 100 , [68] = 20 , [71] = 20 , [50] = 150, [49] = 150, [51] = 25 }},
[12] = {ItemKey_1 = "翅膀进阶3", ItemNum_1 = 6 , ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 85 , [45] = 85 , [44] = 110 , [46] = 110 , [68] = 70 , [71] = 70 , [50] = 140, [49] = 140, [51] = 60 }},
[13] = {ItemKey_1 = "翅膀进阶3", ItemNum_1 = 12, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 95 , [45] = 95 , [44] = 120 , [46] = 120 , [68] = 140, [71] = 140, [50] = 280, [49] = 280, [51] = 70 }},
[14] = {ItemKey_1 = "翅膀进阶3", ItemNum_1 = 21, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001607 , Effects_2 = 3000001608 , Attr = {[43] = 105, [45] = 105, [44] = 130 , [46] = 130 , [68] = 290, [71] = 290, [50] = 580, [49] = 580, [51] = 80 }},
[15] = {ItemKey_1 = "翅膀进阶3", ItemNum_1 = 30, ItemKey_2 = "", ItemNum_2 = 0 , ItemKey_3 = "", ItemNum_3 = 0 , Effects_1 = 3000001609 , Effects_2 = 3000001610 , Attr = {[43] = 115, [45] = 115, [44] = 140 , [46] = 140 , [68] = 400, [71] = 400, [50] = 800, [49] = 800, [51] = 90 }},
}

WingSystem.LevelupItem_Config = {
    ["翅膀升级1"] = 50,
    ["翅膀升级2"] = 100,
    ["翅膀升级3"] = 200,
}

function WingSystem.Get_HaveAttrList(player)
    if player == nil then
        return
    end
    local Stage = player:GetInt("WingGrow_Stage")--品阶
    local Level = player:GetInt("WingGrow_Level")--等级
    local HaveAttrList = {}
    for k, v in pairs(WingSystem.StageAttr_Increment[0].Attr) do
        HaveAttrList[k] = 0
    end
    --计算等级属性
    for i = 0, math.floor(Level/10)-1 do
        for k, v in pairs(HaveAttrList) do
            HaveAttrList[k] = v + 10*WingSystem.StageAttr_Increment[i]["Attr"][k]
        end
    end
    if Level%10 ~= 0 then
        for k, v in pairs(HaveAttrList) do
            HaveAttrList[k] = v + Level%10*WingSystem.StageAttr_Increment[math.floor(Level/10)]["Attr"][k]
        end
    end
    --计算品阶属性
    for i = 1, Stage do
        for k, v in pairs(HaveAttrList) do
            HaveAttrList[k] = v + WingSystem.Stage_Config[i]["Attr"][k]
        end
    end
    return HaveAttrList
end

function WingSystem.Get_HaveWingId(player)
    if player == nil then
        return
    end
    local HaveWingList = {}
    if Data then
        if Data.illusion == nil then
            sLuaApp:LuaErr("Data.illusion不存在")
            return
        end

        for k, v in pairs(Data.illusion) do
            if v.Type == 2 then
                if player:GetInt(v.KeyName) ~= 0 then
                    table.insert(HaveWingList,v.Id)
                end
            end
        end 
    else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
    return HaveWingList
end

function WingSystem.GetData(player)
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
            if v.Type == 2 then
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
    local UseWing = player:GetInt("Model_Wing")
    local WingData = IllusionConfig.GetByKeyName(WingSystem.PlayerFreeWing)
    local str = [[
        if WingUI then
            WingUI.CurrentUsedWingId = ]]..UseWing..[[
            WingUI.OpenWingLevel = ]]..WingData.Unlocklevel..[[
            WingUI.HaveWing_Data = ]]..Lua_tools.serialize(DataList)..[[
            WingUI.RefreshWingPage()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    WingSystem.GetGrowWndData(player) --成长界面数据
end

function WingSystem.GetOpenLevel(player)
    if player == nil then
        return
    end
    local WingData = IllusionConfig.GetByKeyName(WingSystem.PlayerFreeWing)    

        local str = [[
        if BagUI then
            BagUI.OpenWingLevel = ]]..WingData.Unlocklevel..[[
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--玩家穿脱羽翼
function WingSystem.WearWing(player,Wing_Id)
    Wing_Id = tonumber(Wing_Id)
    if player == nil or Wing_Id == nil then
        return
    end

    if type(player) == "number" then
        player = sPlayerSystem:GetPlayerByGUID(player)
    end
    if Wing_Id ~= 0 then
        local WingData = IllusionConfig.GetById(Wing_Id)
        local WingKey = WingData.KeyName
        if player:GetInt(WingKey) == 0 then
            sLuaApp:NotifyTipsMsg(player,"您未拥有该羽翼，无法穿戴！")
            return
        end
        player:SetInt("Model_Wing",tonumber(Wing_Id))
        local Wing_Name = WingData.Name
        sLuaApp:NotifyTipsMsg(player,"已穿戴羽翼:"..Wing_Name)
    else
        local Last_WingId = player:GetInt("Model_Wing")
        if Last_WingId == 0 then
            return
        end
        local WingData = IllusionConfig.GetById(Last_WingId)
        local Wing_Name =WingData.Name
        player:SetInt("Model_Wing",Wing_Id)
        sLuaApp:NotifyTipsMsg(player,"已卸下羽翼:"..Wing_Name)
    end

    local UseWing = player:GetInt("Model_Wing")
    local str = [[
        if BagUI then
            if 1 == BagUI.tabIndex then
                BagUI.RefreshModel()
            end
            WingUI.CurrentUsedWingId = ]]..UseWing..[[
            local WingPage = GUI.Get("BagUI/panelBg/WingPage")
            if WingPage ~= nil and GUI.GetVisible(WingPage) then
                if WingUI.WingSubTabIndex == 1 then WingUI.RefreshSubPage1()
                    elseif WingUI.WingSubTabIndex == 2 then WingUI.RefreshSubPage2()
                    elseif WingUI.WingSubTabIndex == 3 then WingUI.RefreshSubPage3()
                end
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--成长界面数据
function WingSystem.GetGrowWndData(player)
    if player == nil then
        return
    end
    
    local WingGrow_Stage = player:GetInt("WingGrow_Stage")--品阶
    local WingGrow_Level = player:GetInt("WingGrow_Level")--等级
    local DataList = {}  --属性列表
    DataList['WingGrow_Stage'] = WingGrow_Stage
    DataList['WingGrow_Level'] = WingGrow_Level
    DataList['CanAddStage'] = false
    DataList['Attr'] = {}
    if WingGrow_Stage == 15 then
        DataList['NeedExp'] = 0
    else
        DataList['NeedExp'] = WingSystem.StageAttr_Increment[WingGrow_Stage].Exp
    end
    local AttrList = WingSystem.Get_HaveAttrList(player)

    for k, v in pairs(AttrList) do
        local AttrData = AttrConfig.GetById(k)
        DataList['Attr'][AttrData.ChinaName] = v
    end

    if math.floor(WingGrow_Level/10) ~= WingGrow_Stage then
        DataList['CanAddStage'] = true
    end

    --已有经验
    DataList['HaveExp'] = player:GetInt("WingGrow_Score")

    local str = [[
        WingUI.WingGrow_Data = ]]..Lua_tools.serialize(DataList)..[[
        if BagUI then
            local WingPage = GUI.Get("BagUI/panelBg/WingPage")
            if WingPage ~= nil and GUI.GetVisible(WingPage) then
                if WingUI.WingSubTabIndex == 1 then WingUI.RefreshSubPage1()
                    elseif WingUI.WingSubTabIndex == 2 then WingUI.RefreshSubPage2()
                    elseif WingUI.WingSubTabIndex == 3 then WingUI.RefreshSubPage3()
                end
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--羽翼成长升级
function WingSystem.WingGrowLevelUp(player,itemStr)
    if player == nil or itemStr == nil then
        return
    end
    local itemList_1 = sLuaApp:StrSplit(itemStr , '_')
    local itemList = {}
    --将itemList_1中的数字str进行tonumber
    for k, v in pairs(itemList_1) do
        if tonumber(v) then
            table.insert(itemList,tonumber(v))
        else
            table.insert(itemList,v)
        end
    end
    local MaxLevel = Lua_tools.tablecount(WingSystem.Stage_Config)*10
    local WingLevel = player:GetInt("WingGrow_Level")
    local WingStage = player:GetInt("WingGrow_Stage")
    if WingLevel == MaxLevel then
        sLuaApp:NotifyTipsMsg(player , '羽翼已成长至最大等级，无法继续升级')
        return
    end
    if math.floor(WingLevel/10) ~= WingStage then
        sLuaApp:LuaErr("玩家--"..player:GetName().."羽翼升级：level-"..WingLevel..",stage-"..WingStage)
        sLuaApp:NotifyTipsMsg(player , '请先提升当前品阶！')
        return
    end
    --扣除物品计算对应经验
    if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 0
            local bind = 3
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
                            if type(itemList[k+2]) == "number" then
								if itemList[k+2] == 0 then
                                    bind = 1
                                elseif itemList[k+2] == 1 then
                                    bind = 2
                                end
							end
						end
					end
				end
                local HaveExp = player:GetInt("WingGrow_Score")
                local NowWingLevel = player:GetInt("WingGrow_Level")
                local Old_AttrList = WingSystem.Get_HaveAttrList(player)
                local ItemHaveExp = WingSystem.LevelupItem_Config[item]*num
                local MaxLevel_NeedExp = WingSystem.ToMaxLevel_Exp(player)
                local LevelUpExp = WingSystem.StageAttr_Increment[WingStage].Exp
                if ItemHaveExp <= MaxLevel_NeedExp then --包含经验小于等于本阶满级最大经验
                    if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, bind, 'system', '羽翼经验', '消耗物品增加羽翼经验') == 0 then
                        local AddLevel = math.floor((ItemHaveExp-(LevelUpExp-HaveExp))/LevelUpExp) + 1
                        local ExpRemain = (ItemHaveExp-(LevelUpExp-HaveExp))%LevelUpExp
                        player:SetInt("WingGrow_Level",NowWingLevel + AddLevel)
                        player:SetInt("WingGrow_Score",ExpRemain)
                        --记录日志
                        sLogServerSystem:LogToServer(0, player, "羽翼等级", NowWingLevel , AddLevel , "羽翼升级", "")

                        local AttrList = WingSystem.StageAttr_Increment[player:GetInt("WingGrow_Stage")]['Attr']
                        for k, v in pairs(AttrList) do
                            player:SetDynAttr(PlayerAttrClassify.Wing_Grow,k,Old_AttrList[k]+v*AddLevel) --增加属性
                            player:SetInt("WingGrow_Attr_"..k , player:GetInt("WingGrow_Attr_"..k) + v)
                        end
                        player:RecalcAttr()
                        if ItemHaveExp == MaxLevel_NeedExp then --包含经验等于本阶满级最大经验，触发升阶
                            WingSystem.GetGrowWndData(player)
                            local str = [[
                                if WingUI then
                                    WingUI.CloseUpWingPage()
                                end
                            ]]
                            sLuaApp:ShowForm(player, "脚本表单", str)
                            player:RecalcAttr()
                            --五星连珠活动羽翼任务回调
                            if BinGoQuestCallBack and BinGoQuestCallBack.WingQuest then
                                BinGoQuestCallBack.WingQuest(player)
                            end
                            return
                        end
                    end
                else --包含经验大于本阶满级最大经验，计算需要物品数量，触发升阶
                    local NeedItemNum = math.ceil(MaxLevel_NeedExp/WingSystem.LevelupItem_Config[item])
                    local ExpRemain = NeedItemNum*WingSystem.LevelupItem_Config[item] - MaxLevel_NeedExp
                    local MaxLevel = (math.floor(NowWingLevel/10)+1)*10
                    local AddLevel = MaxLevel - NowWingLevel
                    if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), NeedItemNum, bind, 'system', '羽翼经验', '消耗物品增加羽翼经验') == 0 then
                        player:SetInt("WingGrow_Level",MaxLevel)
                        player:SetInt("WingGrow_Score_Reserve",ExpRemain)
                        --记录日志
                        sLogServerSystem:LogToServer(0, player, "羽翼等级", NowWingLevel , AddLevel , "羽翼升级", "")


                        local AttrList = WingSystem.StageAttr_Increment[player:GetInt("WingGrow_Stage")]['Attr']
                        for k, v in pairs(AttrList) do
                            player:SetDynAttr(PlayerAttrClassify.Wing_Grow,k,Old_AttrList[k]+v*AddLevel) --增加属性
                            player:SetInt("WingGrow_Attr_"..k , player:GetInt("WingGrow_Attr_"..k) + v)
                        end
                        WingSystem.GetGrowWndData(player)
                        local str = [[
                            if WingUI and WingUI.CloseUpWingPage then
                                WingUI.CloseUpWingPage()
                            end
                        ]]
                        sLuaApp:ShowForm(player, "脚本表单", str)
                        player:RecalcAttr()
                        --五星连珠活动羽翼任务回调
                        if BinGoQuestCallBack and BinGoQuestCallBack.WingQuest then
                            BinGoQuestCallBack.WingQuest(player)
                        end
                        return 
                    end
                end
			end
		end
        WingSystem.GetGrowWndData(player)
        Achievement.Achievement_wing(player)
        local str = [[
            if WingUI then
                WingUI.RefreshWingUpPage()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
	end
end
--羽翼成长升阶
function WingSystem.WingGrowAddStage(player)
    if player == nil then
        return
    end
    local WingLevel = player:GetInt("WingGrow_Level")
    local WingStage = player:GetInt("WingGrow_Stage")
    if WingStage == Lua_tools.tablecount(WingSystem.Stage_Config) then
        sLuaApp:NotifyTipsMsg(player , '羽翼已达最大品阶！')
        return
    end
    if math.floor(WingLevel/10) == WingStage then
        sLuaApp:LuaErr("玩家--"..player:GetName().."羽翼升阶：level-"..WingLevel..",stage-"..WingStage)
        sLuaApp:NotifyTipsMsg(player , '请先继续升级！')
        return
    end
    local Stage_Config =  WingSystem.Stage_Config[WingStage+1]
    local Old_AttrList = WingSystem.Get_HaveAttrList(player)
    local is_enough = true
    local lacking_item_List = {}
    for i = 1, 3 do
        if Stage_Config['ItemKey_'..i] ~= '' then
            local itemKey = Stage_Config['ItemKey_'..i]
            local itemNum = Stage_Config['ItemNum_'..i]
            local HaveItemNum = sItemSystem:GetItemAmount(player,sItemSystem:GetItemIdByKeyname(itemKey),3) or 0
            if HaveItemNum < itemNum then
                table.insert(lacking_item_List,Stage_Config['ItemKey_'..i])
                table.insert(lacking_item_List,Stage_Config['ItemNum_'..i]-HaveItemNum)
                is_enough = false
            end
            --if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(itemKey), itemNum, 3, 'system', '羽翼品阶', '消耗物品提升羽翼品阶') ~= 0 then
            --    local itemList = {}
            --    local HaveItemNum = sItemSystem:GetItemAmount(player,sItemSystem:GetItemIdByKeyname(itemKey),3) or 0
            --    table.insert(itemList,Stage_Config['ItemKey_'..i])
            --    table.insert(itemList,Stage_Config['ItemNum_'..i]-HaveItemNum)
            --    OneKeyBuy.Main(player,itemList)
            --    sLuaApp:NotifyTipsMsg(player , '羽翼升阶物品不足！')
            --    return ""
            --end
        end
    end
    if is_enough then
        for i = 1, 3 do
            if Stage_Config['ItemKey_'..i] ~= '' then
                local itemKey = Stage_Config['ItemKey_'..i]
                local itemNum = Stage_Config['ItemNum_'..i]
                if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(itemKey), itemNum, 3, 'system', '羽翼品阶', '消耗物品提升羽翼品阶') ~= 0 then
                    sLuaApp:NotifyTipsMsg(player , '羽翼升阶物品不足！')
                    return
                end
            end
        end
        player:SetInt("WingGrow_Stage",WingStage+1)
        --记录日志
        sLogServerSystem:LogToServer(0, player, "羽翼阶数", WingStage , 1 , "羽翼升阶", "")
        local AttrList = WingSystem.Stage_Config[player:GetInt("WingGrow_Stage")]['Attr']
        for k, v in pairs(AttrList) do
            if Old_AttrList[k] then
                player:SetDynAttr(PlayerAttrClassify.Wing_Grow,k,Old_AttrList[k]+v)
            else
                player:SetDynAttr(PlayerAttrClassify.Wing_Grow,k,v) --增加属性
            end
            player:SetInt("WingGrow_Attr_"..k , player:GetInt("WingGrow_Attr_"..k) + v)
        end
        player:RecalcAttr()
        local WingGrow_Stage = player:GetInt("WingGrow_Stage")--品阶
        local WingGrow_Level = player:GetInt("WingGrow_Level")--等级
        local Is_Max_Level = false
        if WingGrow_Level == #WingSystem.Stage_Config*10 and WingGrow_Stage == #WingSystem.Stage_Config then
            Is_Max_Level = true
        end
        if Is_Max_Level == true then
            local str = [[            
                if GlobalProcessing then
                    GlobalProcessing.wing_is_max_level = ]]..tostring(Is_Max_Level)..[[
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
        WingSystem.GetGrowWndData(player)--刷新成长界面
        if SevenDayCallBack then
            SevenDayCallBack.Wing(player)
        end
    else
        OneKeyBuy.Main(player,lacking_item_List)
        sLuaApp:NotifyTipsMsg(player , '羽翼升阶物品不足！')
    end

    Achievement.Achievement_wing(player)
end


--羽翼通过积分升级
function WingSystem.WingGrowLevelUpByScore(player,Score)
    if player == nil or Score == nil then
        return
    end
    local MaxLevel = Lua_tools.tablecount(WingSystem.Stage_Config)*10
    local WingLevel = player:GetInt("WingGrow_Level")
    local WingStage = player:GetInt("WingGrow_Stage")
    if WingLevel == MaxLevel then
        sLuaApp:NotifyTipsMsg(player , '羽翼已成长至最大等级，无法继续升级')
        return
    end
    if math.floor(WingLevel/10) ~= WingStage then
        return
    end

    local LevelUpExp = WingSystem.StageAttr_Increment[WingStage].Exp
    if Score >= LevelUpExp then
        while Score >= LevelUpExp do
            player:SetInt("WingGrow_Level",WingLevel+1)
            sLogServerSystem:LogToServer(0, player, "羽翼等级", WingLevel , 1 , "羽翼升级", "")
            local Old_AttrList = WingSystem.Get_HaveAttrList(player)
            local AttrList = WingSystem.StageAttr_Increment[player:GetInt("WingGrow_Stage")]['Attr']
            for k, v in pairs(AttrList) do
                player:SetDynAttr(PlayerAttrClassify.Wing_Grow,k,Old_AttrList[k]+v) --增加属性
                player:SetInt("WingGrow_Attr_"..k , player:GetInt("WingGrow_Attr_"..k) + v)
            end
            --五星连珠活动羽翼任务回调
            if BinGoQuestCallBack and BinGoQuestCallBack.WingQuest then
                BinGoQuestCallBack.WingQuest(player)
            end
            Score = Score - LevelUpExp
        end
        player:RecalcAttr()
        player:SetInt("WingGrow_Score",Score)

        WingSystem.GetGrowWndData(player)
        Achievement.Achievement_wing(player)
        local str = [[
            if WingUI then
                WingUI.RefreshWingUpPage()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        player:SetInt("WingGrow_Score",Score)
    end
end

--计算到达本阶最大级需要的经验
function WingSystem.ToMaxLevel_Exp(player)
    if not player then
        return
    end
    local HaveExp = player:GetInt("WingGrow_Score")
    local WingLevel = player:GetInt("WingGrow_Level")
    local WingStage = player:GetInt("WingGrow_Stage")
    local MaxLevel = (WingStage + 1)*10
    local NeedExp = (MaxLevel - WingLevel - 1) * WingSystem.StageAttr_Increment[WingStage].Exp + (WingSystem.StageAttr_Increment[WingStage].Exp - HaveExp)
    return NeedExp
end

--玩家升级回调
function WingSystem.on_player_levelup(player, newlevel)
    if newlevel == MainUISwitch.Config["包裹"]["Subtab_OpenLevel"]["羽翼"] then
        player:SetInt(WingSystem.PlayerFreeWing , 1)
        player:SetInt( WingSystem.PlayerFreeWing..'_Time',-1)
        local ClothesData = IllusionConfig.GetByKeyName(WingSystem.PlayerFreeWing)
        local WingGrow_Stage = player:GetInt("WingGrow_Stage")--品阶
        local WingGrow_Level = player:GetInt("WingGrow_Level")--等级
        local Stage_LevelUp_item = {}
        if math.floor(WingGrow_Level/10) ~= WingGrow_Stage then --可以升阶
            for i = 1, 3 do
                if WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i] ~= "" then
                    table.insert(Stage_LevelUp_item,WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i].."_"..WingSystem.Stage_Config[WingGrow_Stage+1]["ItemNum_"..i])
                end
            end
        end
        local Is_Max_Level = false
        if WingGrow_Level == #WingSystem.Stage_Config*10 and WingGrow_Stage == #WingSystem.Stage_Config then
            Is_Max_Level = true
        end

        local str = [[
            if BagUI and BagUI.CreateConfirmWindow then
                BagUI.CreateConfirmWindow(]]..ClothesData.Id..","..ClothesData.Type..[[)
            end

            if GlobalProcessing then
                GlobalProcessing.wing_is_max_level = ]]..tostring(Is_Max_Level)..[[
                GlobalProcessing.wing_upgrade_material = ]]..Lua_tools.serialize(Stage_LevelUp_item)..[[
                if GlobalProcessing.wing_red_register then
                    GlobalProcessing.wing_red_register()
                end
            end
            ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function WingSystem.SetWingTable(player)
    if WingSystem then
        local WingStage_Effects = {}
        for k, v in pairs(WingSystem.Stage_Config) do
            WingStage_Effects[k] = {}
            WingStage_Effects[k]['Effects_1'] = tostring(v.Effects_1)
            WingStage_Effects[k]['Effects_2'] = tostring(v.Effects_2)
        end

        local str =[[
            if UIDefine then
                UIDefine.WingStage_Effects = ]]..Lua_tools.serialize(WingStage_Effects)..[[
                UIDefine.UpdateRoleWingStageEffects()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function WingSystem.GetNowStageItem(player)
    local WingGrow_Stage = player:GetInt("WingGrow_Stage")--品阶
    local WingGrow_Level = player:GetInt("WingGrow_Level")--等级
    local Stage_LevelUp_item = {}
    if math.floor(WingGrow_Level/10) ~= WingGrow_Stage then --可以升阶
        for i = 1, 3 do
            if WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i] ~= "" then
                table.insert(Stage_LevelUp_item,WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i].."_"..WingSystem.Stage_Config[WingGrow_Stage+1]["ItemNum_"..i])
            end
        end
    end
    local str =[[
        if GlobalProcessing then
            GlobalProcessing.wing_upgrade_material = ]]..Lua_tools.serialize(Stage_LevelUp_item)..[[
            if GlobalProcessing.set_wing_red then
                GlobalProcessing.set_wing_red()
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function WingSystem.SetWingStageData(player)
    if WingSystem then
        local WingStage_Config = {}
        local WingStage_Exp = {}
        for k, v in pairs(WingSystem.StageAttr_Increment) do
            WingStage_Exp[k] = {}
            WingStage_Exp[k]['Exp'] = v.Exp
        end

        for k, v in pairs(WingSystem.Stage_Config) do
            WingStage_Config[k] = {}
            for i = 1, 3 do
                WingStage_Config[k]['ItemKey_'..i] = v['ItemKey_'..i]
                WingStage_Config[k]['ItemNum_'..i] = v['ItemNum_'..i]
            end
        end

        local str =[[
            if UIDefine then
                UIDefine.WingStage_Exp = ]]..Lua_tools.serialize(WingStage_Exp)..[[
                UIDefine.WingStage_Config = ]]..Lua_tools.serialize(WingStage_Config)..[[
                UIDefine.WingItem_Config = ]]..Lua_tools.serialize(WingSystem.LevelupItem_Config)..[[
            end
        ]]

        if MainUISwitch.CheckOpenLevel_0(player,"包裹","羽翼") == false then
            sLuaApp:ShowForm(player, "脚本表单", str)
            return
        end
        local WingGrow_Stage = player:GetInt("WingGrow_Stage")--品阶
        local WingGrow_Level = player:GetInt("WingGrow_Level")--等级
        local Is_Max_Level = false
        if WingGrow_Level == #WingSystem.Stage_Config*10 and WingGrow_Stage == #WingSystem.Stage_Config then
            Is_Max_Level = true
        end
        local Stage_LevelUp_item = {}
        if math.floor(WingGrow_Level/10) ~= WingGrow_Stage then --可以升阶
            for i = 1, 3 do
                if WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i] ~= "" then
                    table.insert(Stage_LevelUp_item,WingSystem.Stage_Config[WingGrow_Stage+1]["ItemKey_"..i].."_"..WingSystem.Stage_Config[WingGrow_Stage+1]["ItemNum_"..i])
                end
            end
        end
        if Is_Max_Level then
            str = str..[[            
                if GlobalProcessing then
                    GlobalProcessing.wing_is_max_level = ]]..tostring(Is_Max_Level)..[[
                end
                ]]
        else
            str = str..[[            
                if GlobalProcessing then
                    GlobalProcessing.wing_is_max_level = ]]..tostring(Is_Max_Level)..[[
                    GlobalProcessing.wing_upgrade_material = ]]..Lua_tools.serialize(Stage_LevelUp_item)..[[
                    if GlobalProcessing.wing_red_register then
                        GlobalProcessing.wing_red_register()
                    end
                end
                ]]
        end
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end