-- 侍从信息Form
local FormGuardInfo = {}
_G.FormGuardInfo = FormGuardInfo

-- 获取侍从加成信息
function FormGuardInfo.GetAddAttrInfo(player,guardGuid)
    if not player then
        return ''
    end

    if not guardGuid then
        sLuaApp:LuaWrn('FormGuardInfo.GetAddAttrInfo 传入的参数侍从guid为空 ')
        return ''
    else
        guardGuid = tonumber(guardGuid)
        if not guardGuid then
            sLuaApp:LuaWrn('FormGuardInfo.GetAddAttrInfo 传入的参数侍从guid无法转换为数字 ')
            return ''
        end
    end


    local info = nil
    if Guard_Add then
        info = Guard_Add.GetGuardAddData(guardGuid)
    else
        sLuaApp:LuaWrn("FormGuardInfo,发送侍从加成信息时，Guard_Add为空")
        return ''
    end

    if info then
        if Lua_tools then
            local str = [[
        GuardInfoUI.GuardAddAttrInfo = ]].. Lua_tools.serialize(info)..[[
        GuardInfoUI.RefreshGuardAddAttr()
    ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
        info = nil
    else
        sLuaApp:LuaWrn('FormGuardInfo.GetAddAttrInfo 发送给客户端的数据为空 ')
        return ''
    end

    return ""
end

-- 获取一级是侍从加成信息,通过侍从id
function  FormGuardInfo.get_add_attr_info(player, guard_id)
    if not guard_id then
        sLuaApp:NotifyTipsMsg(player,'数据错误')
        return ''
    end

    guard_id = tonumber(guard_id)
    if not guard_id then
        sLuaApp:NotifyTipsMsg(player,'数据错误')
        return ''
    end

    local info = nil
    if Guard_Add  then
        info = Guard_Add.GetGuardAddById(guard_id,1)
    end
    if Lua_tools and info then
        local str = [[
        GuardInfoUI.GuardAddAttrInfo = ]].. Lua_tools.serialize(info)..[[
        GuardInfoUI.RefreshGuardAddAttr()
    ]]

        sLuaApp:ShowForm(player,'脚本表单',str)
    else
        sLuaApp:NotifyTipsMsg(player,'系统错误')
    end
    return ''
end

-- 获取侍从主动技能等级
function FormGuardInfo.GetSkillInfo(player,guardGuid)
    if not player then
        return
    end

    if not guardGuid then
        return
    else
        guardGuid = tonumber(guardGuid)
        if not guardGuid then
            return
        end
    end
    sLuaApp:LuaDbg(" "..tostring(guardGuid))

    local info = nil
    if GuardSkill then
        local guard = sGuardSystem:GetGuardByGUID(guardGuid) -- 获取侍从对象
        info = GuardSkill.GetAllSkillData(player, guard ) -- 获取侍从主动技能信息
    else
        sLuaApp:LuaDbg("FormGuardInfo,获取侍从主动技能信息时,GuardSkill为空")
        return
    end

    if info then
        -- 筛选出主动技能数据
        local i = 1
        local skillINfo = {}
        while info["skill"..i] do
            skillINfo["skill"..i] = info["skill"..i]
            i = i + 1
        end
        info = nil

        if Lua_tools then
            local str = [[
        GuardInfoUI.GuardSkillInfo = ]].. Lua_tools.serialize(skillINfo) ..[[
        GuardInfoUI.RefreshActiveSkill()
    ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
        skillINfo = nil
    else
        return
    end

    return ""
end

-- 获取离线侍从信息
function FormGuardInfo.get_offline_guard_data(player, player_name,guard_guid)
    if not (player and player_name and guard_guid) then
        sLuaApp:NotifyTipsMsg(player,'无法获取此侍从信息')
        sLuaApp:LuaErr("FormPet.query_offline_pet 传入参数为空")
        return ''
    end


    guard_guid = tonumber(guard_guid)
    if not guard_guid then
        sLuaApp:NotifyTipsMsg(player,'无法获取此侍从信息')
        sLuaApp:LuaErr("FormGuardInfo.get_offline_guard_data guard_guid参数异常")
        return ''
    end

    local target_guid = sContactSystem:GetContactGUID(player_name)
    if not target_guid or target_guid == 0 then
        sLuaApp:NotifyTipsMsg(player,'无法获取此侍从信息')
        sLuaApp:LuaErr("FormGuardInfo.get_offline_guard_data 无法通过名称"..tostring(player_name).."获取离线玩家的guid")
        return''
    end

    if sContactSystem:LoadOfflineGuard(player,target_guid,guard_guid) ~= 0 then
        sLuaApp:NotifyTipsMsg(player,'无法获取此侍从信息')
        sLuaApp:LuaErr("FormPet.query_offline_pet  查询离线侍从失败")
    end

    return ''
end