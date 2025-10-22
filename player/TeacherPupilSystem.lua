--师徒系统
TeacherPupilSystem = {}

--师傅最小等级
TeacherPupilSystem.TeacherMinLevel = 50

--徒弟最小等级
TeacherPupilSystem.PupilMinLevel = 25

--最多可收徒弟数量
TeacherPupilSystem.PupilMaxNum = 2

--徒弟最大等级（大于本等级即可出师）
TeacherPupilSystem.PupilMaxLevel = 49

--出师所需战斗场次
TeacherPupilSystem.NeedFightNum = 1

--出师得到的良师值
TeacherPupilSystem.GetMentor = 100

--出师奖励
TeacherPupilSystem.GraduationAward = {
    Teacher = {Exp = 0 , MoneyType = 5 , MoneyVal = 200000},
    Pupil = {Exp = 500000 , MoneyType = 5 , MoneyVal = 100000},
}

--逐出师门Item
TeacherPupilSystem.ExpelPupil_Item = {Id = 20988 , Key = "驱逐令" , Num = 1}

--判出师门Item
TeacherPupilSystem.BetrayTeacher_Item = {Id = 20989 , Key = "叛逃令", Num = 1}

--师父称号(称号系统界面的所需良师值不受此表控制，需修改客户端的title表)
TeacherPupilSystem.TeacherTitle = {
    [1] = {value = 200 , id = 412}, --初为人师
    [2] = {value = 2000 , id = 413}, --为人师表
    [3] = {value = 5000 , id = 414}, --麻辣教师
    [4] = {value = 10000 , id = 415}, --一代名师
    [5] = {value = 20000 , id = 416}, --诲人不倦
    [6] = {value = 100000 , id = 417}, --桃李满天下
}

--徒弟称号
TeacherPupilSystem.PupilTitle = {
    ["徒弟"] = 411,
    ["逆徒"] = 418,
}

--拜师
function TeacherPupilSystem.BaiShi(player,TeacherUNID,PupilUNID,IsAgree)
    if tostring(TeacherUNID) == nil or tostring(PupilUNID) == nil or IsAgree == nil then
        return
    end
    local Teacher = sPlayerSystem:GetPlayerByUNID(TeacherUNID)
    local Pupil = sPlayerSystem:GetPlayerByUNID(PupilUNID)
    if IsAgree == 1 then --同意
        for i = 1, TeacherPupilSystem.PupilMaxNum do
            if Teacher:GetString("PupilUNID_"..i) == "" then
                Teacher:SetString("PupilUNID_"..i,PupilUNID)
                Teacher:SetInt("PupilGUID_"..i,Pupil:GetGUID()) --guid仅发邮件用
                Teacher:SetString("PupilName_"..i,Pupil:GetName())
                break
            else
                if i == TeacherPupilSystem.PupilMaxNum then
                    sLuaApp:NotifyTipsMsg(Teacher,"你徒弟数量已满,无法继续收徒")
                    return ""
                end
            end
        end

        if Pupil:GetString("TeacherUNID") ~= "" then
            sLuaApp:NotifyTipsMsg(Teacher,"对方已有师傅")
            return ""
        else
            Pupil:SetString("TeacherUNID",TeacherUNID)
            Pupil:SetInt("TeacherGUID",Teacher:GetGUID())
            Pupil:SetString("TeacherName",Teacher:GetName())
        end
        
        sLuaApp:NotifyTipsMsg(Teacher,Pupil:GetName().."现在是你的徒弟")
        sLuaApp:NotifyTipsMsg(Pupil,Teacher:GetName().."现在是你的师父")
        --存入DBVar
        local Pupil_TeacherStr = sDBVarSystem:GetString("Pupil_Teacher")
        local Pupil_Teacher = {}
        if Pupil_TeacherStr ~= "" then
            Pupil_Teacher = TeacherPupilSystem.StrToTable(Pupil_TeacherStr)
        end
        Pupil_Teacher[tostring(Pupil:GetUNID())] = tostring(Teacher:GetUNID())
        sDBVarSystem:SetString("Pupil_Teacher",Lua_tools.serialize(Pupil_Teacher),0)

        --取消徒弟登记
        TeacherPupilSystem.CancelRegister(Pupil:GetGUID())

        --称号
        if not sTitleSystem:HasTitle(Pupil,TeacherPupilSystem.PupilTitle["徒弟"]) then
            sTitleSystem:AddTitle(Pupil,TeacherPupilSystem.PupilTitle["徒弟"])
        end
        --成就
        if Achievement then
            Achievement.Achievement_Master(Pupil,0)
            Achievement.Achievement_Master(Teacher,1)
        end
        --添加战斗回调
        sTriggerSystem:AddTrigger(Pupil,TRIGGER_ON_FIGHT_RESULT,"TeacherPupilSystem","FightCallBack")
    elseif IsAgree == 2 then --取消
        sLuaApp:NotifyTipsMsg(Teacher,Pupil:GetName().."拒绝拜你为师")
        sLuaApp:NotifyTipsMsg(Pupil,"你拒绝了"..Teacher:GetName().."的拜师请求")
    end
end

--出师
function TeacherPupilSystem.Graduation(player,Pupil)
    if player == nil or Pupil == nil then
        return
    end
    local MoneyName = {
        [1] = "金元宝",
        [2] = "银元宝",
        [5] = "银币",
    }
    --清除师徒关系
    TeacherPupilSystem.ClearRelation(player:GetUNID(),Pupil:GetUNID())

    player:SetInt("FinishPupilNum" , player:GetInt("FinishPupilNum") + 1)
    player:AddMentor(TeacherPupilSystem.GetMentor,"师徒","出师奖励","出师奖励")
    TeacherPupilSystem.AddTitle(player)
    local Teacher_Exp = TeacherPupilSystem.GraduationAward.Teacher.Exp
    local Teacher_MoneyType = TeacherPupilSystem.GraduationAward.Teacher.MoneyType
    local Teacher_MoneyVal = TeacherPupilSystem.GraduationAward.Teacher.MoneyVal
    if Teacher_Exp ~= 0 then
        player:AddExp(Teacher_Exp, "师徒","出师奖励","出师奖励")
    end
    if Teacher_MoneyType ~= 0 and Teacher_MoneyVal ~= 0 then
        Lua_tools.AddMoney(player, Teacher_MoneyType, Teacher_MoneyVal, "师徒","出师奖励","出师奖励")
        sLuaApp:NotifyTipsMsg(player,"您获得了"..Teacher_MoneyVal..MoneyName[Teacher_MoneyType].."!")
    end

    local Pupil_Exp = TeacherPupilSystem.GraduationAward.Pupil.Exp
    local Pupil_MoneyType = TeacherPupilSystem.GraduationAward.Pupil.MoneyType
    local Pupil_MoneyVal = TeacherPupilSystem.GraduationAward.Pupil.MoneyVal
    if Pupil_Exp ~= 0 then
        Pupil:AddExp(Pupil_Exp, "师徒","出师奖励","出师奖励")
    end
    if Pupil_MoneyType ~= 0 and Pupil_MoneyVal ~= 0 then
        Lua_tools.AddMoney(Pupil, Pupil_MoneyType, Pupil_MoneyVal, "师徒","出师奖励","出师奖励")
        sLuaApp:NotifyTipsMsg(Pupil,"您获得了"..Teacher_MoneyVal..MoneyName[Teacher_MoneyType].."!")
    end

    sLuaApp:NotifyTipsMsg(player,"出师成功！")
    sLuaApp:NotifyTipsMsg(Pupil,"出师成功！")
end

--解除师徒关系
function TeacherPupilSystem.RelieveRelation(player,TeacherUNID,PupilUNID,IsAgree)
    if tostring(TeacherUNID) == nil or tostring(PupilUNID) == nil or IsAgree == nil then
        return
    end
    local Teacher = sPlayerSystem:GetPlayerByUNID(TeacherUNID)
    local Pupil = sPlayerSystem:GetPlayerByUNID(PupilUNID)
    if IsAgree == 1 then --同意
        TeacherPupilSystem.ClearRelation(TeacherUNID,PupilUNID)
        sLuaApp:NotifyTipsMsg(Teacher,"你同"..Pupil:GetName().."解除了师徒关系")
        sLuaApp:NotifyTipsMsg(Pupil,"你同"..Teacher:GetName().."解除了师徒关系")
    elseif IsAgree == 2 then --取消
        sLuaApp:NotifyTipsMsg(Teacher,"你的徒弟拒绝解除师徒关系")
        sLuaApp:NotifyTipsMsg(Pupil,"你拒绝了解除师徒关系")
    end
end

--登记
function TeacherPupilSystem.Register(PlayerGuid,Type)
    if tonumber(PlayerGuid) == nil or tonumber(Type) == nil then
        return false
    end
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid))
    player:SetString("SYSTEM_ConfirmBox_Function","")
    if tonumber(Type) == 1 then --师父
        if player:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.TeacherMinLevel then
            sLuaApp:NotifyTipsMsg(player,"等级不足，无法登记")
            return ""
        end
        for i = 1, TeacherPupilSystem.PupilMaxNum do
            if player:GetString("PupilUNID_"..i) == "" then
                break
            else
                if i == TeacherPupilSystem.PupilMaxNum then
                    sLuaApp:NotifyTipsMsg(player,"收徒数量已满，无法登记")
                    return ""
                end
            end
        end

        if player:GetInt("TeacherSystem_Register") == 1 then
            sLuaApp:NotifyTipsMsg(player,"您的信息已登记在册，无需重复登记")
            return ""
        end
        if player:GetInt("TeacherSystem_Register") == 2 then
            TeacherPupilSystem.CancelRegister(PlayerGuid)
        end

        local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["师父榜"])
        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["师父榜"],PlayerGuid,count+1,player:GetName(),tostring(player:GetUserId()))
        player:SetInt("TeacherSystem_Register",1)
        sLuaApp:NotifyTipsMsg(player,"师父登记成功")
        TeacherPupilSystem.OpenRegisterWnd(player,Type)
        if SevenDayCallBack then
            SevenDayCallBack.Teacher(player)
        end
    elseif tonumber(Type) == 2 then --徒弟
        if player:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.PupilMinLevel then
            sLuaApp:NotifyTipsMsg(player,"等级不足，无法登记")
            return ""
        end
        if player:GetAttr(ROLE_ATTR_LEVEL) > TeacherPupilSystem.PupilMaxLevel then
            sLuaApp:NotifyTipsMsg(player,"等级太高，无法登记")
            return ""
        end
        if player:GetString("TeacherUNID") ~= "" then
            sLuaApp:NotifyTipsMsg(player,"已有师父，无法登记")
            return ""
        end
        if player:GetInt("TeacherSystem_Register") == 2 then
            sLuaApp:NotifyTipsMsg(player,"您的信息已登记在册，无需重复登记")
            return ""
        end

        local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["徒弟榜"])
        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["徒弟榜"],PlayerGuid,count+1,player:GetName(),tostring(player:GetUserId()))
        player:SetInt("TeacherSystem_Register",2)
        sLuaApp:NotifyTipsMsg(player,"徒弟登记成功")
        TeacherPupilSystem.OpenRegisterWnd(player,Type)
        if SevenDayCallBack then
            SevenDayCallBack.Teacher(player)
        end
    end
end

--好友界面登记
function TeacherPupilSystem.FriendRegister(PlayerGuid,Type)
    if tonumber(PlayerGuid) == nil or tonumber(Type) == nil then
        return false
    end
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid))
    if tonumber(Type) == 1 then --师父
        if player:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.TeacherMinLevel then
            sLuaApp:NotifyTipsMsg(player,"等级不足，无法登记")
            return ""
        end

        for i = 1, TeacherPupilSystem.PupilMaxNum do
            if player:GetString("PupilUNID_"..i) == "" then
                break
            else
                if i == TeacherPupilSystem.PupilMaxNum then
                    sLuaApp:NotifyTipsMsg(player,"收徒数量已满，无法登记")
                    return ""
                end
            end
        end

        if player:GetInt("TeacherSystem_Register") == 1 then
            sLuaApp:NotifyTipsMsg(player,"您的信息已登记在册，无需重复登记")
            return ""
        end

        if player:GetInt("TeacherSystem_Register") == 2 then
            TeacherPupilSystem.CancelRegister(player:GetGUID())
        end

        local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["师父榜"])
        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["师父榜"],PlayerGuid,count+1,player:GetName(),tostring(player:GetUserId()))
        player:SetInt("TeacherSystem_Register",1)
        sLuaApp:NotifyTipsMsg(player,"师父登记成功")
        local str = [[
            local wnd = GUI.GetWnd("FriendShipRecommend")
            if not wnd or not GUI.GetVisible(wnd) then
                GUI.OpenWnd("FriendShipRecommend",3)
            end
        ]]
        --刷新好友界面师徒
        sLuaApp:ShowForm(player, "脚本表单", str)
        FormFriend._confirm(player)
        if SevenDayCallBack then
            SevenDayCallBack.Teacher(player)
        end
    elseif tonumber(Type) == 2 then --徒弟
        if player:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.PupilMinLevel then
            sLuaApp:NotifyTipsMsg(player,"等级不足，无法登记")
            return ""
        end
        if player:GetAttr(ROLE_ATTR_LEVEL) > TeacherPupilSystem.PupilMaxLevel then
            sLuaApp:NotifyTipsMsg(player,"等级太高，无法登记")
            return ""
        end
        if player:GetString("TeacherUNID") ~= "" then
            sLuaApp:NotifyTipsMsg(player,"已有师父，无法登记")
            return ""
        end
        if player:GetInt("TeacherSystem_Register") == 2 then
            sLuaApp:NotifyTipsMsg(player,"您的信息已登记在册，无需重复登记")
            return ""
        end

        local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["徒弟榜"])
        sRanklistSystem:UpdateRanklist(RankingListSystem.Config["徒弟榜"],PlayerGuid,count+1,player:GetName(),tostring(player:GetUserId()))
        player:SetInt("TeacherSystem_Register",2)
        sLuaApp:NotifyTipsMsg(player,"徒弟登记成功")
        local str = [[
            local wnd = GUI.GetWnd("FriendShipRecommend")
            if not wnd or not GUI.GetVisible(wnd) then
                GUI.OpenWnd("FriendShipRecommend",3)
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        --刷新好友界面师徒
        FormFriend._confirm(player)
        if SevenDayCallBack then
            SevenDayCallBack.Teacher(player)
        end
    end
end

--打开登记信息界面
function TeacherPupilSystem.OpenRegisterWnd(player,Type)
    if player == nil or Type == nil then
        return ""
    end
    sLuaApp:ShowForm(player, "脚本表单",[[GUI.OpenWnd("ShiTuRegisterUI")]])
    --local str = [[
    --    ShiTuRegisterUI.CurSelectPage = ]]..Type..[[
    --    ShiTuRegisterUI.Refresh()
    --]]
    --sLuaApp:ShowForm(player, "脚本表单",str)
    if Type == 1 then
        TeacherPupilSystem.GetRegisterData_Teacher(player)
    elseif Type == 2 then
        TeacherPupilSystem.GetRegisterData_Pupil(player)
    end
    return ""
end

--得到师父登记信息
function TeacherPupilSystem.GetRegisterData_Teacher(player)
    if player == nil then
        return
    end
    TeacherPupilSystem.GetShowList(player:GetGUID(),1,1)
end

--得到徒弟登记信息
function TeacherPupilSystem.GetRegisterData_Pupil(player)
    if player == nil then
        return
    end
    TeacherPupilSystem.GetShowList(player:GetGUID(),2,1)
end

--刷新登记信息回调
function TeacherPupilSystem.RefreshRegisterData(errcode,data,params)
    if data == nil or params == nil then
        return
    end
    if not TeacherPupilSystem.TeacherDataList then
        TeacherPupilSystem.TeacherDataList = {}
    elseif not TeacherPupilSystem.PupilDataList then
        TeacherPupilSystem.PupilDataList = {}
    end
    local params = sLuaApp:StrSplit(params,"_")
    local Type = tonumber(params[1])
    local Source = tonumber(params[2])
    local index = tonumber(params[3])
    local attrs = json.decode(data.attrs)
    local school = 0
    local fight_value = 0
    local level = 0
    local vip = 0
    local role_id = 0
    for k, v in pairs(attrs) do
        if v.a == ROLE_ATTR_JOB_1 then
            school = v.v
        elseif v.a == ROLE_ATTR_LEVEL then
            level = v.v
        elseif v.a == ROLE_ATTR_FIGHT_VALUE then
            fight_value = v.v
        elseif v.a == ROLE_ATTR_VIP then
            vip = v.v
        elseif v.a == ROLE_ATTR_ROLE then
            role_id = v.v
        end
    end

    if Type == 1 then --师父
        if Lua_tools.tablecount(TeacherPupilSystem.TeacherDataList) ~= 0 then
            if TeacherPupilSystem.TeacherDataList[index] then
                TeacherPupilSystem.TeacherDataList[index]["level"] = level
                TeacherPupilSystem.TeacherDataList[index]["role_id"] = role_id
                TeacherPupilSystem.TeacherDataList[index]["school"] = school
                TeacherPupilSystem.TeacherDataList[index]["fight_value"] = fight_value
                TeacherPupilSystem.TeacherDataList[index]["vip"] = vip 
            end
            TeacherPupilSystem.TeacherListCount = TeacherPupilSystem.TeacherListCount - 1
        end
        if TeacherPupilSystem.TeacherListCount == 0 then
            local playerGuid = tonumber(params[4])
            local player = sPlayerSystem:GetPlayerByGUID(playerGuid)
            TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.TeacherDataList)
        end
    elseif Type == 2 then--徒弟
        if Lua_tools.tablecount(TeacherPupilSystem.PupilGuidList) ~= 0 then
            if TeacherPupilSystem.PupilDataList[index] then
                TeacherPupilSystem.PupilDataList[index]["level"] = level
                TeacherPupilSystem.PupilDataList[index]["role_id"] = role_id
                TeacherPupilSystem.PupilDataList[index]["school"] = school
                TeacherPupilSystem.PupilDataList[index]["fight_value"] = fight_value
                TeacherPupilSystem.PupilDataList[index]["vip"] = vip 
            end
            TeacherPupilSystem.PupilListCount = TeacherPupilSystem.PupilListCount - 1
        end
        if TeacherPupilSystem.PupilListCount == 0 then
            local playerGuid = tonumber(params[4])
            local player = sPlayerSystem:GetPlayerByGUID(playerGuid)
            TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.PupilDataList)
        end
    end
end

--得到显示的登记列表
function TeacherPupilSystem.GetShowList(PlayerGuid,Type,Source)
    --Source 调用来源 1 师徒界面 2 推荐好友界面
    if not tonumber(PlayerGuid) or not Type or not Source then
        return
    end
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid))
    local user_id = player:GetUserId()
    if tonumber(Type) == 1 then --师父
        --榜单信息table 结构{{guid, value, name, info}, ...{}}
        local Ranklist = sRanklistSystem:GetAllRanklist(RankingListSystem.Config["师父榜"]) or {}
        TeacherPupilSystem.TeacherGuidList = {}
        if #Ranklist > 9 then
            local num = 9
            if player:GetInt("TeacherSystem_Register") == 1 then
                TeacherPupilSystem.TeacherGuidList[1] = {}
                TeacherPupilSystem.TeacherGuidList[1]["guid"] = tostring(PlayerGuid)
                TeacherPupilSystem.TeacherGuidList[1]["name"] = player:GetName()
                TeacherPupilSystem.TeacherGuidList[1]["user_id"] = tonumber(player:GetUserId())
                num = 8
            end
            local List = TeacherPupilSystem.Getrandom(num,#Ranklist)
            for k, v in pairs(List) do
                local table_1 = {}
                table_1["guid"] = tostring(Ranklist[v][1])
                table_1["name"] = Ranklist[v][3]
                table_1["user_id"] = Ranklist[v][4]
                table.insert(TeacherPupilSystem.TeacherGuidList,table_1)
            end
        else
            if player:GetInt("TeacherSystem_Register") == 1 then
                TeacherPupilSystem.TeacherGuidList[1] = {}
                TeacherPupilSystem.TeacherGuidList[1]["guid"] = tostring(PlayerGuid)
                TeacherPupilSystem.TeacherGuidList[1]["name"] = player:GetName()
                TeacherPupilSystem.TeacherGuidList[1]["user_id"] = tonumber(player:GetUserId())
            end
            for k, v in pairs(Ranklist) do
                local table_1 = {}
                table_1["guid"] =tostring( v[1])
                table_1["name"] = v[3]
                table_1["user_id"] = v[4]
                table.insert(TeacherPupilSystem.TeacherGuidList,table_1)
            end
        end

        --如果随机到了玩家自己就删掉，否则删掉最后一个
        local DeleteSelf = false
        for i = 2, #TeacherPupilSystem.TeacherGuidList do
            if tostring(TeacherPupilSystem.TeacherGuidList[i]["guid"]) == tostring(PlayerGuid) then
                TeacherPupilSystem.TeacherGuidList[i] = nil
                DeleteSelf = true
            end
        end
        if DeleteSelf == false and #TeacherPupilSystem.TeacherGuidList > 8 then
            table.remove(TeacherPupilSystem.TeacherGuidList,#TeacherPupilSystem.TeacherGuidList)
        end
        TeacherPupilSystem.TeacherListCount = Lua_tools.tablecount(TeacherPupilSystem.TeacherGuidList) or 0
        if TeacherPupilSystem.TeacherListCount ~= 0 then
            TeacherPupilSystem.TeacherDataList = {}
            for k, v in pairs(TeacherPupilSystem.TeacherGuidList) do
                if tonumber(v.guid)== PlayerGuid then
                    TeacherPupilSystem.TeacherDataList[k] = v
                    TeacherPupilSystem.TeacherDataList[k]["level"] = player:GetAttr(ROLE_ATTR_LEVEL)
                    TeacherPupilSystem.TeacherDataList[k]["role_id"] = player:GetAttr(ROLE_ATTR_ROLE)
                    TeacherPupilSystem.TeacherDataList[k]["school"] = player:GetAttr(ROLE_ATTR_JOB_1)
                    TeacherPupilSystem.TeacherDataList[k]["fight_value"] = player:GetAttr(ROLE_ATTR_FIGHT_VALUE)
                    TeacherPupilSystem.TeacherDataList[k]["vip"] = player:GetAttr(ROLE_ATTR_VIP)

                    TeacherPupilSystem.TeacherListCount = TeacherPupilSystem.TeacherListCount - 1
                    if TeacherPupilSystem.TeacherListCount == 0 then
                        TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.TeacherGuidList)
                    end
                elseif tonumber(v.guid) ~= PlayerGuid and tonumber(v.user_id) == user_id then
                    TeacherPupilSystem.TeacherListCount = TeacherPupilSystem.TeacherListCount - 1
                    if TeacherPupilSystem.TeacherListCount == 0 then
                        TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.TeacherDataList)
                    end
                else
                    TeacherPupilSystem.TeacherDataList[k] = v
                    sContactSystem:GetOfflinePlayer(tonumber(v.guid),"TeacherPupilSystem","RefreshRegisterData","1_"..Source.."_"..k.."_"..PlayerGuid)
                end
            end 
        else
            local List = {}
            TeacherPupilSystem.SendList(player,Source,Type,List)
        end
    elseif tonumber(Type) == 2 then --徒弟
        local Ranklist = sRanklistSystem:GetAllRanklist(RankingListSystem.Config["徒弟榜"]) or {}
        TeacherPupilSystem.PupilGuidList = {}
        if #Ranklist > 9 then
            local num = 9
            if player:GetInt("TeacherSystem_Register") == 2 then
                TeacherPupilSystem.PupilGuidList[1] = {}
                TeacherPupilSystem.PupilGuidList[1]["guid"] = tostring(PlayerGuid)
                TeacherPupilSystem.PupilGuidList[1]["name"] = player:GetName()
                TeacherPupilSystem.PupilGuidList[1]["user_id"] = tonumber(player:GetUserId())
                num = 8
            end
            local List = TeacherPupilSystem.Getrandom(num,#Ranklist)
            for k, v in pairs(List) do
                local table_1 = {}
                table_1["guid"] = tostring(Ranklist[v][1])
                table_1["name"] = Ranklist[v][3]
                table_1["user_id"] = Ranklist[v][4]
                table.insert(TeacherPupilSystem.PupilGuidList,table_1)
            end
        else
            if player:GetInt("TeacherSystem_Register") == 2 then
                TeacherPupilSystem.PupilGuidList[1] = {}
                TeacherPupilSystem.PupilGuidList[1]["guid"] = tostring(PlayerGuid)
                TeacherPupilSystem.PupilGuidList[1]["name"] = player:GetName()
                TeacherPupilSystem.PupilGuidList[1]["user_id"] = tonumber(player:GetUserId())
            end
            for k, v in pairs(Ranklist) do
                local table_1 = {}
                table_1["guid"] = tostring(v[1])
                table_1["name"] = v[3]
                table_1["user_id"] = v[4]
                table.insert(TeacherPupilSystem.PupilGuidList,table_1)
            end
        end

        --如果随机到了玩家自己就删掉，否则删掉最后一个
        local DeleteSelf = false
        for i = 2, #TeacherPupilSystem.PupilGuidList do
            if tonumber(TeacherPupilSystem.PupilGuidList[i]["guid"]) == tonumber(PlayerGuid) then
                TeacherPupilSystem.PupilGuidList[i] = nil
                DeleteSelf = true
            end
        end
        if DeleteSelf == false and #TeacherPupilSystem.PupilGuidList > 8 then
            table.remove(TeacherPupilSystem.PupilGuidList,#TeacherPupilSystem.PupilGuidList)
        end
        TeacherPupilSystem.PupilListCount = Lua_tools.tablecount(TeacherPupilSystem.PupilGuidList) or 0
        if TeacherPupilSystem.PupilListCount ~= 0 then
            TeacherPupilSystem.PupilDataList = {}
            for k, v in pairs(TeacherPupilSystem.PupilGuidList) do
                if  tonumber(v.guid) == PlayerGuid then
                    TeacherPupilSystem.PupilDataList[k] = v
                    TeacherPupilSystem.PupilDataList[k]["level"] = player:GetAttr(ROLE_ATTR_LEVEL)
                    TeacherPupilSystem.PupilDataList[k]["role_id"] = player:GetAttr(ROLE_ATTR_ROLE)
                    TeacherPupilSystem.PupilDataList[k]["school"] = player:GetAttr(ROLE_ATTR_JOB_1)
                    TeacherPupilSystem.PupilDataList[k]["fight_value"] = player:GetAttr(ROLE_ATTR_FIGHT_VALUE)
                    TeacherPupilSystem.PupilDataList[k]["vip"] = player:GetAttr(ROLE_ATTR_VIP)
                    TeacherPupilSystem.PupilListCount = TeacherPupilSystem.PupilListCount - 1
                    if TeacherPupilSystem.PupilListCount == 0 then
                        TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.PupilGuidList)
                    end
                elseif tonumber(v.guid) ~= PlayerGuid and tonumber(v.user_id) == user_id then
                    TeacherPupilSystem.PupilListCount = TeacherPupilSystem.PupilListCount - 1
                    if TeacherPupilSystem.PupilListCount == 0 then
                        TeacherPupilSystem.SendList(player,Source,Type,TeacherPupilSystem.PupilDataList)
                    end
                else
                    TeacherPupilSystem.PupilDataList[k] = v
                    sContactSystem:GetOfflinePlayer(tonumber(v.guid),"TeacherPupilSystem","RefreshRegisterData","2_"..Source.."_"..k.."_"..PlayerGuid)
                end
            end
        else
            local List = {}
            TeacherPupilSystem.SendList(player,Source,Type,List)
        end
    end
end

--发送玩家Table至客户端
function TeacherPupilSystem.SendList(player,Source,Type,List)
    if not player or not Source or not Type or not List then
        return
    end
    --List的index有可能是乱序的，此处处理
    local NewList = {}
    for k, v in pairs(List) do
        if v then
            if v["school"] then
                table.insert(NewList,v)
            end
        end
    end
    if tonumber(Source) == 1 then
        local str = ""
        if tonumber(Type) == 1 then
            str = [[
                if ShiTuRegisterUI and ShiTuRegisterUI.Refresh then
                    ShiTuRegisterUI.TeacherRoster = ]]..Lua_tools.serialize(NewList)..[[
                    ShiTuRegisterUI.CurSelectPage = ]]..Type..[[
                    ShiTuRegisterUI.Refresh()
                end
            ]] 
        elseif tonumber(Type) == 2 then
            str = [[
                if ShiTuRegisterUI and ShiTuRegisterUI.Refresh then
                    ShiTuRegisterUI.PupilRoster = ]]..Lua_tools.serialize(NewList)..[[
                    ShiTuRegisterUI.CurSelectPage = ]]..Type..[[
                    ShiTuRegisterUI.Refresh()
                end
            ]]
        end
        sLuaApp:ShowForm(player, "脚本表单", str)
    elseif tonumber(Source) == 2 then
        local str = [[
            if FriendShipRecommend and FriendShipRecommend.RefreshMasterRole then
               FriendShipRecommend.MasterRecommend = ]] .. Lua_tools.serialize(NewList) .. [[
               FriendShipRecommend.RefreshMasterRole()
           end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--取消登记
function TeacherPupilSystem.CancelRegister(PlayerGuid)
    if tonumber(PlayerGuid) == nil then
        return false
    end
    local player = sPlayerSystem:GetPlayerByGUID(tonumber(PlayerGuid))
    local Type = player:GetInt("TeacherSystem_Register")

    if Type == 0 then
        sLuaApp:NotifyTipsMsg(player, "你的名字并没有记录在册")
        return ""
    end

    if tonumber(Type) == 1 then --师父
        sRanklistSystem:RemoveRank(RankingListSystem.Config["师父榜"],tonumber(PlayerGuid))
        player:SetInt("TeacherSystem_Register",0)
        sLuaApp:NotifyTipsMsg(player,"取消师父登记成功！")
        --刷新好友界面师徒
        FormFriend._confirm(player)
        return true
    elseif tonumber(Type) == 2 then --徒弟
        sRanklistSystem:RemoveRank(RankingListSystem.Config["徒弟榜"],tonumber(PlayerGuid))
        player:SetInt("TeacherSystem_Register",0)
        sLuaApp:NotifyTipsMsg(player,"取消徒弟登记成功！")
        --刷新好友界面师徒
        FormFriend._confirm(player)
        return true
    end
    return false
end

--逐出师门
function TeacherPupilSystem.ExpelPupil(player,PupilUNID,Pupil_Name)
    if player == nil or tostring(PupilUNID) == nil then
        return
    end
    local Id = TeacherPupilSystem.ExpelPupil_Item.Id
    local Num = TeacherPupilSystem.ExpelPupil_Item.Num
    local Key = TeacherPupilSystem.ExpelPupil_Item.Key
    if sItemSystem:GetItemAmount(player,Id,3) < Num then
        local ItemList = {}
        table.insert(ItemList,Key)
        table.insert(ItemList,Num)
        OneKeyBuy.Main(player,ItemList)
    else
        local str = [[
            GUI.OpenWnd("ShiTuSystemUI", "]]..Pupil_Name..[[_3_]]..player:GetUNID()..[[_]]..PupilUNID..[[_]]..Id..[[_]]..Num..[[")
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--叛出师门
function TeacherPupilSystem.BetrayTeacher(player)
    if player == nil then
        return
    end
    local Id = TeacherPupilSystem.BetrayTeacher_Item.Id
    local Num = TeacherPupilSystem.BetrayTeacher_Item.Num
    local Key = TeacherPupilSystem.BetrayTeacher_Item.Key
    local TeacherUNID = player:GetString("TeacherUNID")
    if sItemSystem:GetItemAmount(player,Id,3) < Num then
        local ItemList = {}
        table.insert(ItemList,Key)
        table.insert(ItemList,Num)
        OneKeyBuy.Main(player,ItemList)
    else
        local str = [[
            GUI.OpenWnd("ShiTuSystemUI", "]]..player:GetString("TeacherName")..[[_4_]]..TeacherUNID..[[_]]..player:GetUNID()..[[_]]..Id..[[_]]..Num..[[")
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--消耗物品
function TeacherPupilSystem.ConsumeItem(player,TeacherUNID,PupilUNID,Type)
    if tostring(TeacherUNID) == nil or tostring(PupilUNID) == nil or Type == nil then
        return
    end
    if Type == 3 then --逐出师门
        local Id = TeacherPupilSystem.ExpelPupil_Item.Id
        local Num = TeacherPupilSystem.ExpelPupil_Item.Num
        if sItemSystem:ConsumeItemWithId(player,Id,Num,3,"system","逐出师门","逐出师门消耗") == 0 then
            sMailSystem:SendMail(0,"逐出师门通知",player:GetInt("ExpelPupil_GUID"),1,"逐出师门通知","你的师父"..player:GetName().."不愿意继续指导你，已与你脱离了师徒关系",{},{})
            TeacherPupilSystem.ClearRelation(player:GetUNID(),PupilUNID)
            player:SetInt("ExpelPupil_GUID",0)
            sLuaApp:NotifyTipsMsg(player,"逐出师门成功！")
        end
    elseif Type == 4 then --叛出师门
        local Id = TeacherPupilSystem.BetrayTeacher_Item.Id
        local Num = TeacherPupilSystem.BetrayTeacher_Item.Num
        if sItemSystem:ConsumeItemWithId(player,Id,Num,3,"system","叛出师门","叛出师门消耗") == 0 then
            sMailSystem:SendMail(0,"叛出师门通知",player:GetInt("TeacherGUID"),1,"叛出师门通知","你的徒弟"..player:GetName().."不愿意继续跟随你，已与你脱离了师徒关系",{},{})
            TeacherPupilSystem.ClearRelation(TeacherUNID,player:GetUNID())
            sLuaApp:NotifyTipsMsg(player,"叛出师门成功！")
            --称号
            if not sTitleSystem:HasTitle(player,TeacherPupilSystem.PupilTitle["逆徒"]) then
                sTitleSystem:AddTitle(player,TeacherPupilSystem.PupilTitle["逆徒"])
            end
        end
    end
end

--清除师徒关系
function TeacherPupilSystem.ClearRelation(TeacherUNID,PupilUNID)
    if tostring(TeacherUNID) == nil or tostring(PupilUNID) == nil then
        return
    end
    local Teacher = sPlayerSystem:GetPlayerByUNID(tostring(TeacherUNID))
    local Pupil = sPlayerSystem:GetPlayerByUNID(tostring(PupilUNID))
    if Teacher then
        for i = 1, TeacherPupilSystem.PupilMaxNum do
            if Teacher:GetString("PupilUNID_"..i) == tostring(PupilUNID) then
                Teacher:SetString("PupilUNID_"..i,"")
                Teacher:SetString("PupilName_"..i,"")
                Teacher:SetInt("PupilGUID_"..i,0)
            end
        end
    end

    if Pupil then
        if Pupil:GetString("TeacherUNID") ~= "" then
            Pupil:SetString("TeacherUNID","")
            Pupil:SetString("TeacherName","")
            Pupil:SetInt("TeacherGUID",0)
            Pupil:SetInt("FightWithTeacher",0)
        end

        if sTriggerSystem:HasTrigger(Pupil,TRIGGER_ON_FIGHT_RESULT,"TeacherPupilSystem","FightCallBack") then
            sTriggerSystem:DelTrigger(Pupil,TRIGGER_ON_FIGHT_RESULT,"TeacherPupilSystem","FightCallBack")
        end
    end
    --DBVar删除
    local Pupil_TeacherStr = sDBVarSystem:GetString("Pupil_Teacher")
    if Pupil_TeacherStr ~= "" then
        local Pupil_Teacher = TeacherPupilSystem.StrToTable(Pupil_TeacherStr)
        Pupil_Teacher[tostring(PupilUNID)] = nil
        sDBVarSystem:SetString("Pupil_Teacher",Lua_tools.serialize(Pupil_Teacher),0)
    end
end

--根据良师值给予玩家称号
function TeacherPupilSystem.AddTitle(player)
    if not player then return end
    local value = player:GetAttr(ROLE_ATTR_MENTOR)
    for k, v in pairs(TeacherPupilSystem.TeacherTitle) do
        if value >= v.value then
            if not sTitleSystem:HasTitle(player,v.id) then
                sTitleSystem:AddTitle(player,v.id)
            end
        else
            break
        end
    end
end

--玩家升级回调
function TeacherPupilSystem.on_player_levelup(player, newlevel)
    if tonumber(newlevel) == TeacherPupilSystem.PupilMinLevel then
        local str = [[GlobalUtils.ShowServerBoxMessage1Btn("你已经可以拜师了，是否一键登记？",30)]]
        player:SetString("SYSTEM_ConfirmBox_Function", "TeacherPupilSystem.FriendRegister("..player:GetGUID()..",2)")
        sLuaApp:ShowForm(player, "脚本表单", str)
    elseif tonumber(newlevel) == TeacherPupilSystem.TeacherMinLevel then
        if player:GetInt("TeacherSystem_Register") ~= 0 then
            TeacherPupilSystem.CancelRegister(player:GetGUID())
        end
        local str = [[GlobalUtils.ShowServerBoxMessage1Btn("你已经可以收徒了，是否一键登记？",30)]]
        player:SetString("SYSTEM_ConfirmBox_Function", "TeacherPupilSystem.FriendRegister("..player:GetGUID()..",1)")
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--玩家登录回调
function TeacherPupilSystem.on_login(player)
    if player == nil then
        return
    end

    if player:GetString("TeacherUNID") == "" then
        for i = 1, TeacherPupilSystem.PupilMaxNum do
            if player:GetString("PupilUNID_"..i) ~= "" then
                break
            else
                if i == TeacherPupilSystem.PupilMaxNum then
                    return
                end
            end
        end
    end

    --更新名字和guid
    for i = 1, TeacherPupilSystem.PupilMaxNum do
        local PupilUNID =  player:GetString("PupilUNID_"..i)
        if PupilUNID ~= "" then
            local pupil_player = sPlayerSystem:GetPlayerByUNID(PupilUNID)
            if pupil_player then
                local old_name = player:GetString("PupilName_"..i)
                local now_name = pupil_player:GetName()
                if old_name ~= now_name then
                    player:SetString("PupilName_"..i,now_name)
                end

                local old_guid = player:GetString("PupilGUID_"..i)
                local now_guid = tostring(pupil_player:GetGUID())
                if old_guid ~= now_guid then
                    player:SetString("PupilGUID_"..i,now_guid)
                end
            end
        end
    end
    local TeacherUNID =  player:GetString("TeacherUNID")
    local Teacher_player = sPlayerSystem:GetPlayerByUNID(TeacherUNID)
    if Teacher_player then
        local old_name = player:GetString("TeacherName")
        local now_name = Teacher_player:GetName()
        if old_name ~= now_name then
            player:SetString("TeacherName", now_name)
        end

        local old_guid = player:GetString("TeacherGUID")
        local now_guid = tostring(Teacher_player:GetGUID())
        if old_guid ~= now_guid then
            player:SetString("TeacherGUID",now_guid)
        end
    end

    if player:GetInt("FinishPupilNum") > 0 then
        TeacherPupilSystem.AddTitle(player)
    end

    local Pupil_TeacherStr = sDBVarSystem:GetString("Pupil_Teacher")
    local Pupil_Teacher = TeacherPupilSystem.StrToTable(Pupil_TeacherStr)
    if player:GetString("TeacherUNID") ~= "" then
        if Lua_tools.tablecount(Pupil_Teacher) ~= 0 then
            local playerUNID = player:GetUNID()
            if not Pupil_Teacher[tostring(playerUNID)] then
                player:SetString("TeacherUNID","")
                player:SetString("TeacherName","")
                player:SetInt("TeacherGUID",0)
                player:SetInt("FightWithTeacher",0)
            else
                if not sTriggerSystem:HasTrigger(player,TRIGGER_ON_FIGHT_RESULT,"TeacherPupilSystem","FightCallBack") and player:GetInt("FightWithTeacher") < TeacherPupilSystem.NeedFightNum then
                    sTriggerSystem:AddTrigger(player,TRIGGER_ON_FIGHT_RESULT,"TeacherPupilSystem","FightCallBack")
                end
            end
        else
            player:SetString("TeacherUNID","")
            player:SetString("TeacherName","")
            player:SetInt("TeacherGUID",0)
            player:SetInt("FightWithTeacher",0)
        end
    else
        for i = 1, 2 do
            if player:GetString("PupilUNID_"..i) ~= "" then
                if Lua_tools.tablecount(Pupil_Teacher) ~= 0 then
                    if not Pupil_Teacher[tostring(player:GetString("PupilUNID_"..i))] then
                        player:SetString("PupilUNID_"..i,"")
                        player:SetString("PupilName_"..i,"")
                        player:SetInt("PupilGUID_"..i,0)
                    end
                end
            end
        end
    end
end

--玩家战斗回调
function TeacherPupilSystem.FightCallBack(player,type,victory,arg)
    if player == nil or type == nil or victory == nil then
        return
    end
    if player:GetString("TeacherUNID") ~= "" then
        local Team = player:GetTeam()
        if Team then
            local MembersList = Team:GetTeamMembers(true)
            for k, v in pairs(MembersList) do
                if player:GetString("TeacherUNID") == v:GetUNID() then
                    player:SetInt("FightWithTeacher" , player:GetInt("FightWithTeacher") + 1)
                    return ""
                end
            end
        end
    end
end

--字符串转表格
function TeacherPupilSystem.StrToTable(add_num)
    if type(add_num) ~= "string" then
        return ""
    end
    if add_num == "" then
        return
    end
	local res_num = assert(load("return "..add_num))()
	return res_num
end

--开服判断是否有旧的登记数据，将它录入排行榜
function TeacherPupilSystem.OldData()
    if sDBVarSystem:GetString("TeacherRegister") ~= "" then
        local TeacherRegister = TeacherPupilSystem.StrToTable(sDBVarSystem:GetString("TeacherRegister"))
        if #TeacherRegister > 1 then
            for k, v in pairs(TeacherRegister) do
                local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["师父榜"])
                sRanklistSystem:UpdateRanklist(RankingListSystem.Config["师父榜"],v.guid,count+1,v.name,tostring(v.user_id))
            end
            sDBVarSystem:SetString("TeacherRegister","",0)
        end
    end
    if sDBVarSystem:GetString("PupilRegister") ~= "" then
        local PupilRegister = TeacherPupilSystem.StrToTable(sDBVarSystem:GetString("PupilRegister"))
        if #PupilRegister > 1 then
            for k, v in pairs(PupilRegister) do
                local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config["徒弟榜"])
                sRanklistSystem:UpdateRanklist(RankingListSystem.Config["徒弟榜"],v.guid,count+1,v.name,tostring(v.user_id))
            end
            sDBVarSystem:SetString("PupilRegister","",0)
        end
    end
end

--得到从1到指定数的指定数量的不同随机数
function TeacherPupilSystem.Getrandom(num,Max)
    local array = {}
    for i = 1, Max do
        table.insert(array,i)
    end
	for i = 1 , num do
		local rand = math.random(1,#array)
		local tmp = array[i]
		array[i] = array[rand]
		array[rand] = tmp
	end
	local a = {}
	for i = 1 , num do
		a[i] = array[i]
	end
	return a
end