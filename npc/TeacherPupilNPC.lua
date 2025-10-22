--师徒相关NPC
TeacherPupilNPC = {}

function TeacherPupilNPC.main(npc,player)
    if npc:GetKeyName() == "长安城-拜师" then
        player:AddNpcOption(npc, 0, "了解师徒系统", "option1", "")
        player:AddNpcOption(npc, 0, "我的徒弟要向我拜师", "option2", "")
        player:AddNpcOption(npc, 0, "我带着徒弟来出师了", "option3", "")
        player:AddNpcOption(npc, 0, "查询我的师徒状态", "option4", "")
        return "想要拜师学艺？那尽管来找我。"
    elseif npc:GetKeyName() == "长安城-师徒登记" then
        player:AddNpcOption(npc, 0, "师父登记", "TeacherRegister", "")
        player:AddNpcOption(npc, 0, "徒弟登记", "PupilRegister", "")
        player:AddNpcOption(npc, 0, "查看登记信息", "option7", "")
        player:AddNpcOption(npc, 0, "取消登记", "RemoveRegister", "")
        return "来来来，到我这里来查看师徒信息。"
    elseif npc:GetKeyName() == "长安城-解除师徒" then
        player:AddNpcOption(npc, 0, "解除师徒关系", "option9", "")
        player:AddNpcOption(npc, 0, "叛出师门", "option10", "")
        player:AddNpcOption(npc, 0, "逐出师门", "option11", "")
        return "师徒缘分已尽，不如散去。"
    elseif npc:GetKeyName() == "良师值商人" then
        player:AddNpcOption(npc, 0, "良师值兑换", "option12", "")
        return "桃李不言，下自成蹊。"
    end
end

--了解师徒系统
function TeacherPupilNPC.option1(npc,player)
    return [[
1.师父≥]]..TeacherPupilSystem.TeacherMinLevel..[[级，]]..TeacherPupilSystem.PupilMinLevel..[[≤徒弟≤]]..TeacherPupilSystem.PupilMaxLevel..[[，双方互为好友，可两人组队前来举行拜师礼，完成拜师礼后双方结为师徒。
2.每个师傅同时最多收2名徒弟，徒弟同时只能拜1位师父。
3.徒弟到达]]..(TeacherPupilSystem.PupilMaxLevel+1)..[[级，且师徒双方至少组队一起战斗过]]..TeacherPupilSystem.NeedFightNum..[[场后，可二人组队前来出师。
    ]]
end

--我的徒弟要向我拜师
function TeacherPupilNPC.option2(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    local Team = player:GetTeam()
    if not Team then
        sLuaApp:NotifyTipsMsg(player, "你没有组队")
        return ""
    else
        if Team:GetTeamMemberCount() ~= 2 then
            sLuaApp:NotifyTipsMsg(player,"必须两人组队")
            return ""
        end
        if Team:GetTeamLeaderGUID() ~= player:GetGUID() then
            sLuaApp:NotifyTipsMsg(player,"你不是队长")
            return ""
        end
    end

    if player:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.TeacherMinLevel then
        sLuaApp:NotifyTipsMsg(player,"你等级太低，无法收徒")
        return ""
    end

    for i = 1, TeacherPupilSystem.PupilMaxNum do
        if player:GetString("PupilUNID_"..i) == "" then
            break
        else
            if i == TeacherPupilSystem.PupilMaxNum then
                sLuaApp:NotifyTipsMsg(player,"你徒弟数量已满")
                return ""
            end
        end
    end

    local MembersList = Team:GetTeamMembers(true)
    for k, v in pairs(MembersList) do
        if v:GetGUID() ~= player:GetGUID() then
            if v:GetAttr(ROLE_ATTR_LEVEL) < TeacherPupilSystem.PupilMinLevel then
                sLuaApp:NotifyTipsMsg(player,"徒弟等级太低")
                return ""
            elseif v:GetAttr(ROLE_ATTR_LEVEL) > TeacherPupilSystem.PupilMaxLevel then
                sLuaApp:NotifyTipsMsg(player,"徒弟等级太高")
                return ""
            end
            if v:GetString("TeacherUNID") ~= "" and v:GetString("TeacherUNID") ~= player:GetUNID() then
                sLuaApp:NotifyTipsMsg(player,"对方已有师傅")
                return ""
            elseif v:GetString("TeacherUNID") == player:GetUNID() then
                sLuaApp:NotifyTipsMsg(player,"你们已经是师徒")
                return ""
            end
            local str = [[
                GUI.OpenWnd("ShiTuSystemUI", "]]..player:GetName()..[[_1_]]..player:GetUNID()..[[_]]..v:GetUNID()..[[")
            ]]
            sLuaApp:ShowForm(v, "脚本表单", str)
            sLuaApp:NotifyTipsMsg(player,"你将收"..v:GetName().."为徒，请等待他回应")
        end
    end
    return ""
end

--我带着徒弟来出师了
function TeacherPupilNPC.option3(npc,player)
    if player == nil or npc == nil then
        return ""
    end

    local Team = player:GetTeam()
    if not Team then
        sLuaApp:NotifyTipsMsg(player, "你没有组队")
        return ""
    else
        if Team:GetTeamMemberCount() ~= 2 then
            sLuaApp:NotifyTipsMsg(player,"必须两人组队")
            return ""
        end
        if Team:GetTeamLeaderGUID() ~= player:GetGUID() then
            sLuaApp:NotifyTipsMsg(player,"你不是队长")
            return ""
        end
    end

    local MembersList = Team:GetTeamMembers(true)
    for k, v in pairs(MembersList) do
        if v:GetGUID() ~= player:GetGUID() then
            if v:GetString("TeacherUNID") ~= player:GetUNID() then
                sLuaApp:NotifyTipsMsg(player,"你们不是师徒关系")
                return ""
            end

            if v:GetAttr(ROLE_ATTR_LEVEL) <= TeacherPupilSystem.PupilMaxLevel then
                sLuaApp:NotifyTipsMsg(player,"你的徒弟等级没有达到出师条件")
                return ""
            end

            if v:GetInt("FightWithTeacher") < TeacherPupilSystem.NeedFightNum then
                sLuaApp:NotifyTipsMsg(player,"你们共同战斗次数没有达到出师条件")
                return ""
            end

            TeacherPupilSystem.Graduation(player,v)
        end
    end
    return ""
end

--查询我的师徒状态
function TeacherPupilNPC.option4(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    local Team = player:GetTeam()
    if Team then
        sLuaApp:NotifyTipsMsg(player, "组队状态下无法查看师徒状态")
        return ""
    end
    local TeacherName = "无"
    if player:GetString("TeacherUNID") ~= "" then
        local teacher = sPlayerSystem:GetPlayerByUNID(player:GetString("TeacherUNID"))
        TeacherName = player:GetString("TeacherName")
    end
    local PupilName = "无"

    for i = 1, TeacherPupilSystem.PupilMaxNum do
        if player:GetString("PupilUNID_"..i) ~= "" then
            if i == 1 then
                PupilName = player:GetString("PupilName_"..i)
            else
                PupilName = PupilName..","..player:GetString("PupilName_"..i)
            end
        end
    end

    return [[
您的师父：]]..TeacherName..[[ 
您的徒弟：]]..PupilName..[[ 
目前共有]]..player:GetInt("FinishPupilNum")..[[名徒弟出师 
您的良师值：]]..player:GetAttr(ROLE_ATTR_MENTOR)..[[
    ]]
end

--师父登记
function TeacherPupilNPC.TeacherRegister(npc,player)
    if player == nil then
        return ""
    end
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

    local str = [[
        GlobalUtils.ShowServerBoxMessage("是否登记到<color=#42B1F0>师傅</color>名册")
        ]]
    player:SetString("SYSTEM_ConfirmBox_Function", "TeacherPupilSystem.Register("..player:GetGUID()..",1)")
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--徒弟登记
function TeacherPupilNPC.PupilRegister(npc,player)
    if player == nil then
        return ""
    end
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
    local str = [[
        GlobalUtils.ShowServerBoxMessage("是否登记到<color=#42B1F0>徒弟</color>名册")
        ]]
    player:SetString("SYSTEM_ConfirmBox_Function", "TeacherPupilSystem.Register("..player:GetGUID()..",2)")
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--查看登记信息
function TeacherPupilNPC.option7(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    sLuaApp:ShowForm(player, "脚本表单",[[GUI.OpenWnd("ShiTuRegisterUI")]])
    TeacherPupilSystem.GetRegisterData_Pupil(player)
    TeacherPupilSystem.GetRegisterData_Teacher(player)
    --local str = [[
    --    ShiTuRegisterUI.CurSelectPage = 1
    --    ShiTuRegisterUI.Refresh()
    --]]
    --sLuaApp:ShowForm(player, "脚本表单",str)
    return ""
end

--取消登记
function TeacherPupilNPC.RemoveRegister(npc,player)
    if player == nil then
        return ""
    end
    local Type = player:GetInt("TeacherSystem_Register")

    if Type == 0 then
        sLuaApp:NotifyTipsMsg(player, "你的名字并没有记录在册")
        return ""
    end
    local TypeStr = {
        [1] = "师父",
        [2] = "徒弟"
    }

    local str = [[
        GlobalUtils.ShowServerBoxMessage("是否要取消<color=#00BFFF>]]..TypeStr[Type]..[[</color>登记信息？取消后其他玩家无法通过名册查看你的信息。")
        ]]
    player:SetString("SYSTEM_ConfirmBox_Function", "TeacherPupilSystem.CancelRegister("..player:GetGUID()..")")
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

--解除师徒关系
function TeacherPupilNPC.option9(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    local Team = player:GetTeam()
    if not Team then
        sLuaApp:NotifyTipsMsg(player, "你没有组队")
        return ""
    else
        if Team:GetTeamMemberCount() ~= 2 then
            sLuaApp:NotifyTipsMsg(player,"必须两人组队")
            return ""
        end
        if Team:GetTeamLeaderGUID() ~= player:GetGUID() then
            sLuaApp:NotifyTipsMsg(player,"你不是队长")
            return ""
        end
    end

    local MembersList = Team:GetTeamMembers(true)
    for k, v in pairs(MembersList) do
        if v:GetGUID() ~= player:GetGUID() then

            for i = 1, TeacherPupilSystem.PupilMaxNum do
                if player:GetString("PupilUNID_"..i) == v:GetUNID() then
                    break
                else
                    if i == TeacherPupilSystem.PupilMaxNum then
                        sLuaApp:NotifyTipsMsg(player,"你们不是师徒关系")
                        return ""
                    end
                end
            end

            local str = [[
                GUI.OpenWnd("ShiTuSystemUI", "]]..player:GetName()..[[_2_]]..player:GetUNID()..[[_]]..v:GetUNID()..[[")
            ]]
            sLuaApp:ShowForm(v, "脚本表单", str)
            sLuaApp:NotifyTipsMsg(player,"你将解除与"..v:GetName().."的师徒关系，请等待他回应")
        end
    end
    return ""
end

--叛出师门
function TeacherPupilNPC.option10(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    
    if player:GetString("TeacherUNID") == "" then
        sLuaApp:NotifyTipsMsg(player,"你没有师父来这捣什么乱")
        return ""
    end

    if player:GetTeam() then
        sLuaApp:NotifyTipsMsg(player, "组队状态不可以叛出师门")
        return ""
    end
    TeacherPupilSystem.BetrayTeacher(player)
    return ""
end

--逐出师门
function TeacherPupilNPC.option11(npc,player)
    if player == nil or npc == nil then
        return ""
    end

    for i = 1, TeacherPupilSystem.PupilMaxNum do
        if player:GetString("PupilUNID_"..i) ~= "" then
            break
        else
            if i == TeacherPupilSystem.PupilMaxNum then
                sLuaApp:NotifyTipsMsg(player,"你没有徒弟来这捣什么乱")
                return ""
            end
        end
    end

    if player:GetTeam() then
        sLuaApp:NotifyTipsMsg(player, "组队状态不可以逐出师门")
        return ""
    end

    for i = 1, TeacherPupilSystem.PupilMaxNum do
        if player:GetString("PupilUNID_"..i) ~= "" then
            player:AddNpcOption(npc, 0, ""..player:GetString("PupilName_"..i), "ExpelPupil", ""..player:GetString("PupilUNID_"..i)..","..player:GetString("PupilName_"..i)..","..i)
        end
    end

    return ""
end

function TeacherPupilNPC.ExpelPupil(npc,player,content)
    if player == nil or content == nil then
        return
    end
    local tmp = sLuaApp:StrSplit(content,",")
    local PupilUNID = tostring(tmp[1])
    local Pupil_Name = tostring(tmp[2])
    local Pupil_Index =  tonumber(tmp[3])
    player:SetInt("ExpelPupil_GUID",player:GetInt("PupilGUID_"..Pupil_Index))
    TeacherPupilSystem.ExpelPupil(player,PupilUNID,Pupil_Name)
    return ""
end

--良师值兑换
function TeacherPupilNPC.option12(npc,player)
    if player == nil or npc == nil then
        return ""
    end
    --打开师徒商店
    local str = [[
        GUI.OpenWnd("ShopStoreUI", "6")
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

