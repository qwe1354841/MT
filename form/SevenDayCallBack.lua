--七日任务回调
SevenDayCallBack = {}

--任务按钮状态 --3-任务未开启  2-任务未完成  1-奖励可领取  4奖励已领取

--战力任务
--function SevenDayCallBack.FightValue(player)
--    
--end

--技能任务
function SevenDayCallBack.Skill(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        local SkillLevel = player:GetInt("PlayerSkill_HeartMethodLevel_1")
        local IsSend = false
        for i = 1, 7 do
            if player:GetInt("day_"..i.."_3") ~= 4 then
                local Max_Extent = SevenDay.Award.TaskAward[i][3]["Max_Extent"]
                if SkillLevel >= Max_Extent then
                    player:SetInt("day_"..i.."_3",1)
                    SevenDay.TaskStateChange(player,i,3,1)
                    if i <= player:GetInt("SevenDay_Day") then
                        IsSend = true
                    end
                end
                player:SetInt("SevenDay_Skill",SkillLevel)
                SevenDay.ExtentChange(player,i,3,SkillLevel)--更新任务进度
            end
        end
        if IsSend then
            SevenDay.RedPointRefresh_Main(player)
        end
    end
end

--装备强化任务
function SevenDayCallBack.Equip(player,newLevel)
    if player:GetInt("SevenDaySwitch") == 1 then
        if newLevel > player:GetInt("SevenDay_Equip") then
            player:SetInt("SevenDay_Equip",newLevel)
        end
        local IsSend = false
        for i = 1, 7 do
            if player:GetInt("day_"..i.."_4") ~= 4 then
                local Max_Extent = SevenDay.Award.TaskAward[i][4]["Max_Extent"]
                local MaxLevel = player:GetInt("SevenDay_Equip")
                if MaxLevel >= Max_Extent then
                    player:SetInt("day_"..i.."_4",1)
                    SevenDay.TaskStateChange(player,i,4,1)
                    if i <= player:GetInt("SevenDay_Day") then
                        IsSend = true
                    end
                end
                SevenDay.ExtentChange(player,i,4,MaxLevel)--更新任务进度
            end
        end
        if IsSend then
            SevenDay.RedPointRefresh_Main(player)
        end
    end
end

--师门任务
function SevenDayCallBack.Quest(player)
    if player == nil then
        return
    end
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Quest",player:GetInt("SevenDay_Quest")+1)
        local QuestNum = player:GetInt("SevenDay_Quest")
        local IsSend = false
        for i = 1, 7 do
            if player:GetInt("day_"..i.."_5") ~= 4 then
                local Max_Extent = SevenDay.Award.TaskAward[i][5]["Max_Extent"]
                if QuestNum >= Max_Extent then
                    player:SetInt("day_"..i.."_5",1)
                    SevenDay.TaskStateChange(player,i,5,1)
                    if i <= player:GetInt("SevenDay_Day") then
                        IsSend = true
                    end
                end
                SevenDay.ExtentChange(player,i,5,QuestNum+1)--更新任务进度
            end
        end
        if IsSend then
            SevenDay.RedPointRefresh_Main(player)
        end
    end

    --五星连珠师门任务
    if BinGoQuestCallBack and BinGoQuestCallBack.ShiMenQuest then
        BinGoQuestCallBack.ShiMenQuest(player)
    end
end

--消费任务
function SevenDayCallBack.Expenditure(player, ingot, sender, reason, detail)
    if player == nil or ingot == nil then
        return
    end
    
    --判断是否为商城消费
    if Lua_tools then
		if Lua_tools.IngotDescStati(reason) == false then
			return
		end
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return
	end
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Expenditure",player:GetInt("SevenDay_Expenditure")+ingot)
        local Expenditure = player:GetInt("SevenDay_Expenditure")
        local IsSend = false
        for i = 1, 7 do
            if player:GetInt("day_"..i.."_7") ~= 4 then
                local Max_Extent = SevenDay.Award.TaskAward[i][7]["Max_Extent"]
                if Expenditure >= Max_Extent then
                    player:SetInt("day_"..i.."_7",1)
                    SevenDay.TaskStateChange(player,i,7,1)
                    if i <= player:GetInt("SevenDay_Day") then
                        IsSend = true
                    end
                end
                SevenDay.ExtentChange(player,i,7,Expenditure+ingot)--更新任务进度
            end
        end
        if IsSend then
            SevenDay.RedPointRefresh_Main(player)
        end
    end

    --五星连珠活动消费任务回调
	if BinGoQuestCallBack and BinGoQuestCallBack.CostQuest then
		BinGoQuestCallBack.CostQuest(player,ingot)
	end
end

--宠物任务
function SevenDayCallBack.Pet(Pet)
    local player = Pet:GetOwner()
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Pet",player:GetInt("SevenDay_Pet")+1)
        local Pet = player:GetInt("SevenDay_Pet")
        if player:GetInt("day_1_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[1][6]["Max_Extent"]
            if Pet >= Max_Extent then
                player:SetInt("day_1_6",1)
                SevenDay.TaskStateChange(player,1,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,1,6,Pet+1)--更新任务进度
        end
    end
end

--师徒任务
function SevenDayCallBack.Teacher(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Teacher",player:GetInt("SevenDay_Teacher")+1)
        local Teacher = player:GetInt("SevenDay_Teacher")
        if player:GetInt("day_2_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[2][6]["Max_Extent"]
            if Teacher >= Max_Extent then
                player:SetInt("day_2_6",1)
                SevenDay.TaskStateChange(player,2,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,2,6,Teacher+1)--更新任务进度
        end
    end
end

--天赋任务
function SevenDayCallBack.Talent(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Talent",player:GetInt("SevenDay_Talent")+1)
        local Talent = player:GetInt("SevenDay_Talent")
        if player:GetInt("day_3_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[3][6]["Max_Extent"]
            if Talent >= Max_Extent then
                player:SetInt("day_3_6",1)
                SevenDay.TaskStateChange(player,3,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,3,6,Talent+1)--更新任务进度
        end
    end
end

--帮派任务
function SevenDayCallBack.Guild(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Guild",player:GetInt("SevenDay_Guild")+1)
        local Guild = player:GetInt("SevenDay_Guild")
        if player:GetInt("day_4_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[4][6]["Max_Extent"]
            if Guild >= Max_Extent then
                player:SetInt("day_4_6",1)
                SevenDay.TaskStateChange(player,4,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,4,6,Guild+1)--更新任务进度
        end
    end
end

--侍从任务
function SevenDayCallBack.Guard(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        local GuardCon = player:GetGuardContainer()
        local GuradList = GuardCon:GetGuards()
        local MaxStar = 0
        for k, v in pairs(GuradList) do
            if v:GetInt("Guard_Star") > MaxStar then
                MaxStar = v:GetInt("Guard_Star")
            end
        end
        player:SetInt("SevenDay_Guard",MaxStar)
        if player:GetInt("day_5_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[5][6]["Max_Extent"]
            if MaxStar >= Max_Extent then
                player:SetInt("day_5_6",1)
                SevenDay.TaskStateChange(player,5,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,5,6,MaxStar)--更新任务进度
        end
    end
end

--烹饪任务
function SevenDayCallBack.Cook(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        player:SetInt("SevenDay_Cook",player:GetInt("SevenDay_Cook")+1)
        local Cook = player:GetInt("SevenDay_Cook")
        if player:GetInt("day_6_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[6][6]["Max_Extent"]
            if Cook >= Max_Extent then
                player:SetInt("day_6_6",1)
                SevenDay.TaskStateChange(player,6,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,6,6,Cook+1)--更新任务进度
        end
    end
end

--羽翼任务
function SevenDayCallBack.Wing(player)
    if player:GetInt("SevenDaySwitch") == 1 then
        local Wing = player:GetInt("WingGrow_Stage")
        if player:GetInt("day_7_6") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[7][6]["Max_Extent"]
            if Wing >= Max_Extent then
                player:SetInt("day_7_6",1)
                SevenDay.TaskStateChange(player,7,6,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,7,6,Wing)--更新任务进度
        end
    end
end