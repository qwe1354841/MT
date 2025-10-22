--五星连珠活动任务回调
BinGoQuestCallBack = {}

--师门任务
function BinGoQuestCallBack.ShiMenQuest(player)
    if player == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[1]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + 1)
    if player:GetWeekInt(QuestData.intkey) % QuestData.param == 0 then
        player:SetWeekInt("BinGo_LightNum", player:GetWeekInt("BinGo_LightNum") + QuestData.getnum)
        BinGoBigPrize.ReaPoint_LightNum(player)
    end
end

--帮派任务
function BinGoQuestCallBack.GuildQuest(player)
    if player == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[2]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + 1)
    if player:GetWeekInt(QuestData.intkey) % QuestData.param == 0 then
        player:SetWeekInt("BinGo_LightNum", player:GetWeekInt("BinGo_LightNum") + QuestData.getnum)
        BinGoBigPrize.ReaPoint_LightNum(player)
    end
end

--羽翼任务
function BinGoQuestCallBack.WingQuest(player)
    if player == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[3]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + 1)
    if player:GetWeekInt(QuestData.intkey) % QuestData.param == 0 then
        player:SetWeekInt("BinGo_LightNum", player:GetWeekInt("BinGo_LightNum") + QuestData.getnum)
        BinGoBigPrize.ReaPoint_LightNum(player)
    end
end

--天梯任务
function BinGoQuestCallBack.TianTiQuest(player)
    if player == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[4]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + 1)
    if player:GetWeekInt(QuestData.intkey) % QuestData.param == 0 then
        player:SetWeekInt("BinGo_LightNum", player:GetWeekInt("BinGo_LightNum") + QuestData.getnum)
        BinGoBigPrize.ReaPoint_LightNum(player)
    end
end

--答题任务
function BinGoQuestCallBack.XiYouQiYuanQuest(player)
    if player == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[5]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + 1)
    if player:GetWeekInt(QuestData.intkey) % QuestData.param == 0 then
        player:SetWeekInt("BinGo_LightNum", player:GetWeekInt("BinGo_LightNum") + QuestData.getnum)
        BinGoBigPrize.ReaPoint_LightNum(player)
    end
end

--消费任务
function BinGoQuestCallBack.CostQuest(player, Ingot)
    Ingot = tonumber(Ingot)
    if player == nil and Ingot == nil then
        return
    end
    if not MainUISwitch.CheckOpenLevel(player, "福利") then
        return
    end
    if FunctionSwitch.AllFuncitonConfig["BinGo"] ~= "on" then
        return
    end
    local QuestData = BinGoBigPrize.Quest[6]
    player:SetWeekInt(QuestData.intkey, player:GetWeekInt(QuestData.intkey) + Ingot)
    Ingot = Ingot + player:GetWeekInt("BinGo_SurplusIngot")
    if math.floor(Ingot / QuestData.param) >= 1 then
        player:SetWeekInt(
            "BinGo_LightNum",
            player:GetWeekInt("BinGo_LightNum") + QuestData.getnum * math.floor(Ingot / QuestData.param)
        )
        BinGoBigPrize.ReaPoint_LightNum(player)
        player:SetWeekInt("BinGo_SurplusIngot", Ingot % QuestData.param)
    else
        player:SetWeekInt("BinGo_SurplusIngot", Ingot)
    end
end
