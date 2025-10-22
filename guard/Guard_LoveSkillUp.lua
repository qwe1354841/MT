--侍从情缘
Guard_LoveSkillUp = {}

function Guard_LoveSkillUp.GetData(player, guard_guid)
    if player == nil or guard_guid == nil then
        return ""
    end
    local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
    local GuardContainer = player:GetGuardContainer()
    local guardData = GuardConfig.GetById(guard:GetId())
    local SkillContainer = guard:GetSkillContainer()
    local LoveSkillList = {}
    --情缘技能1-3
    for i = 1, 3 do
        LoveSkillList["LoveSkill_" .. i] = {}
        LoveSkillList["LoveSkill_" .. i]["LoveGuard_id"] = guardData["Love" .. i .. "Id"]
        LoveSkillList["LoveSkill_" .. i]["skill_id"] = guardData["Love" .. i .. "Skill"]
        local skill = SkillContainer:GetSkill(guardData["Love" .. i .. "Skill"])
        if skill == nil then
            LoveSkillList["LoveSkill_" .. i]["skill_level"] = 0
        else
            LoveSkillList["LoveSkill_" .. i]["skill_level"] = skill:GetPerformance()
        end
        if GuardContainer:HasGuard(LoveSkillList["LoveSkill_" .. i]["LoveGuard_id"]) then
            local guardList = GuardContainer:GetGuards()
            for k, v in pairs(guardList) do
                if v:GetId() == LoveSkillList["LoveSkill_" .. i]["LoveGuard_id"] then
                    if guard:GetInt("GuardLastLoveSkill_" .. i .. "_Star") < GuardUpStar.GetGuardStar(player, v:GetGUID()) then
                        LoveSkillList["LoveSkill_" .. i]["CanUp"] = true
                    else
                        LoveSkillList["LoveSkill_" .. i]["CanUp"] = false
                    end
                end
            end
        else
            LoveSkillList["LoveSkill_" .. i]["CanUp"] = false
        end
    end
    --终极情缘技能
    LoveSkillList["AllLoveAddSkill1"] = {}
    LoveSkillList["AllLoveAddSkill1"]["skill_id"] = guardData["AllLoveAddSkill1"]
    local skill = SkillContainer:GetSkill(tonumber(LoveSkillList["AllLoveAddSkill1"]["skill_id"]))
    if skill == nil then
        LoveSkillList["AllLoveAddSkill1"]["skill_level"] = 0
    else
        LoveSkillList["AllLoveAddSkill1"]["skill_level"] = skill:GetPerformance()
    end

    LoveSkillList["AllLoveAddSkill1"]["CanUp"] = false
    local MinLoveSkillLevel = LoveSkillList["LoveSkill_1"]["skill_level"]
    for i = 2, 3 do
        if LoveSkillList["LoveSkill_" .. i]["skill_level"] < MinLoveSkillLevel then
            MinLoveSkillLevel = LoveSkillList["LoveSkill_" .. i]["skill_level"]
        end
    end
    if MinLoveSkillLevel > 0 and MinLoveSkillLevel > guard:GetInt("GuardLastAllLoveSkill_Star") then
        LoveSkillList["AllLoveAddSkill1"]["CanUp"] = true
    end

    local str = [[
        if GuardUI then
            GuardUI.LovePageData = ]]..Lua_tools.serialize(LoveSkillList)..[[
            GuardUI.RefreshGuardLovePage()
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--技能是否可以升级
function Guard_LoveSkillUp.SkillCanUp(player,guard,index)
    if player == nil or guard == nil or index == nil then
        return false
    end
    local GuardContainer = player:GetGuardContainer()
    local guardData = GuardConfig.GetById(guard:GetId())
    local SkillContainer = guard:GetSkillContainer()
    if index == 4 then
        local SkillLevel = {}
        SkillLevel["SkillLevel_1"] = 0
        SkillLevel["SkillLevel_2"] = 0
        SkillLevel["SkillLevel_3"] = 0
        for i = 1, 3 do
            local skill = SkillContainer:GetSkill(tonumber(guardData["Love"..i.."Skill"]))
            if skill == nil then
                SkillLevel["SkillLevel_"..i] = 0
            else
                SkillLevel["SkillLevel_"..i] = skill:GetPerformance()
            end
        end
        local MinLoveSkillLevel = SkillLevel["SkillLevel_1"]
        for i = 2, 3 do
            if SkillLevel["SkillLevel_"..i] < MinLoveSkillLevel then
                MinLoveSkillLevel = SkillLevel["SkillLevel_"..i]
            end
        end
        if MinLoveSkillLevel > 0 and MinLoveSkillLevel > guard:GetInt("GuardLastAllLoveSkill_Star") then
            return true
        end
    elseif index >= 0 and index < 4 then
        -- body
        local LoveGuard_id = guardData["Love" .. index .. "Id"]
        if GuardContainer:HasGuard(LoveGuard_id) then
            local guardList = GuardContainer:GetGuards()
            for k, v in pairs(guardList) do
                if v:GetId() == LoveGuard_id then
                    if guard:GetInt("GuardLastLoveSkill_" .. index .. "_Star") < GuardUpStar.GetGuardStar(player, v:GetGUID()) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function Guard_LoveSkillUp.CommonSkillUp(player, guard_guid, index)
    if player == nil or guard_guid == nil or index == nil then
        return ""
    end

    local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
    local GuardContainer = player:GetGuardContainer()
    local guardData = GuardConfig.GetById(guard:GetId())
    local CanUp = false

    local LoveGuardId = guardData["Love" .. index .. "Id"]
    if GuardContainer:HasGuard(LoveGuardId) then
        local guardList = GuardContainer:GetGuards()
        for k, v in pairs(guardList) do
            if v:GetId() == LoveGuardId then
                if guard:GetInt("GuardLastLoveSkill_" .. index .. "_Star") < GuardUpStar.GetGuardStar(player, v:GetGUID()) then
                    CanUp = true
                else
                    CanUp = false
                end
            end
        end
    else
        CanUp = false
    end
    if CanUp then
        if GuardSkill then
            if GuardSkill.GuardLoveStarUP(player, guard_guid, index) then
                local SkillId = guardData["Love" .. index .. "Skill"]
                local skillData = SkillConfig.GetById(SkillId)
                local str = [[
                    if GuardUI then
                        GuardUI.OnLoveTabBtnClick()
                        GuardUI.ShowGuardDetailInfo()
                    end
                ]]

                -- 更新侍从小红点数据
                if FormGuard then
                    FormGuard.get_guard_red_point_data(player)
                end

                sLuaApp:ShowForm(player, "脚本表单", str)
                sLuaApp:NotifyTipsMsg(player , skillData.Name..'升级成功')
            else
                sLuaApp:NotifyTipsMsg(player , '技能升级失败')
            end
        end
    else
        sLuaApp:NotifyTipsMsg(player , '当前侍从情缘技能无法升级')
    end
end

function Guard_LoveSkillUp.SuperSkillUp(player, guard_guid)
    if player == nil or guard_guid == nil then
        return ""
    end
    local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
    local SkillContainer = guard:GetSkillContainer()
    local guardData = GuardConfig.GetById(guard:GetId())
    local Commonskill1 = SkillContainer:GetSkill(guardData["Love1Skill"])
    local CanUp = false

    local MinLoveSkillLevel = Commonskill1:GetPerformance()
    for i = 2, 3 do
        local Commonskill = SkillContainer:GetSkill(guardData["Love"..i.."Skill"])
        if Commonskill:GetPerformance() < MinLoveSkillLevel then
            MinLoveSkillLevel = Commonskill:GetPerformance()
        end
    end
    if MinLoveSkillLevel > 0 and MinLoveSkillLevel > guard:GetInt("GuardLastAllLoveSkill_Star") then
        CanUp = true
    end

    if CanUp then
        if GuardSkill then
            if GuardSkill.GuardAllLoveStarUP(player, guard_guid) then
                local SkillId = guardData["AllLoveAddSkill1"]
                local skillData = SkillConfig.GetById(SkillId)
                local str = [[
                    if GuardUI then
                        GuardUI.OnLoveTabBtnClick()
                        GuardUI.ShowGuardDetailInfo()
                    end
                ]]

                -- 更新侍从小红点数据
                if FormGuard then
                    FormGuard.get_guard_red_point_data(player)
                end

                sLuaApp:ShowForm(player, "脚本表单", str)
                sLuaApp:NotifyTipsMsg(player , skillData.Name..'升级成功')
            else
                sLuaApp:NotifyTipsMsg(player , '技能升级失败')
            end
        end
    else
        sLuaApp:NotifyTipsMsg(player , '当前侍从情缘技能无法升级')
    end
end
