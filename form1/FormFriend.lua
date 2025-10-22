-- 好友表单
local FormFriend = {}
_G.FormFriend = FormFriend

-- 赠送物品
function FormFriend.useLikeabilityItem(player,target_guid,item_data)
    if not (player and target_guid and item_data) then return end


    target_guid = tonumber(target_guid)
    if not target_guid then
        sLuaApp:NotifyTipsMsg(player,'数据错误')
        sLuaApp:LuaWrn('FormFriend.useLikeabilityItem 赠送礼物 对方guid无法转换为number类型')
        return ''
    end

    -- 判断赠送玩家是否在线，不在线就提示
    local target_player = sPlayerSystem:GetPlayerByGUID(target_guid)
    if not target_player then
        sLuaApp:NotifyTipsMsg(player,'无法给离线玩家赠送礼物')
        return ''
    end

    if FriendSystem then
        FriendSystem.useLikeabilityItem(player,target_guid,item_data)
        local str = [[
        if GivenPresentUI then
            GivenPresentUI.RefreshAllPresent()
        end
        ]]
        sLuaApp:ShowForm(player,'脚本表单',str)
    end
    return ""
end

-- 判断是否打开赠送界面
function FormFriend.is_can_give(player,target_guid)
    if not target_guid then return end
    target_guid = tonumber(target_guid)
    if not target_guid then
        return
    end

    -- 判断赠送玩家是否在线，不在线就提示
    local target_player = sPlayerSystem:GetPlayerByGUID(target_guid)
    if not target_player then
        sLuaApp:NotifyTipsMsg(player,'无法给离线玩家赠送礼物')
        return ''
    else
        local str = [[
            GUI.OpenWnd("GivenPresentUI", "]].. tostring(target_guid) ..[[")
        ]]
        sLuaApp:ShowForm(player,'脚本表单',str)
    end

    return ''

end

-- 发送可以赠送的物品
function FormFriend.CanGiveAwayItemData(player)
    if not player then return end
    if FriendSystem then
        if FriendSystem.LikeabilityItem then
            local str = [[
            if GivenPresentUI then
                GivenPresentUI.GiveAwayItemData = ]] .. Lua_tools.serialize(FriendSystem.LikeabilityItem) ..[[
                GivenPresentUI.RefreshAllPresent()
            end
            ]]

            sLuaApp:ShowForm(player, "脚本表单", str)
        end
    end
    return ""
end

-- 获取黑名单  走协议

-- 加入黑名单
function FormFriend.addToBlacklist(player,guid)
    if not player or not guid then return "" end

    guid = tonumber(guid)
    if not guid then return "" end

    if sContactSystem:AddBlackList(player,guid) == 0 then
        sLuaApp:NotifyTipsMsg(player,"加入黑名单成功")
    end
    return ""
end

-- 移出黑名单
function FormFriend.removeFromBlacklist(player,guid)
    if not player or not guid then return "" end

    guid = tonumber(guid)
    if not guid then return "" end

    if sContactSystem:DelBlackList(player,guid) == 0 then
        sLuaApp:NotifyTipsMsg(player,"移出黑名单成功")
    end
    return ""
end

-- 推荐好友
function FormFriend.GetRecommendFriend(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","好友") then
		return ""
	end
    local guid = tostring(player:GetGUID())
    -- 需要发送的推荐玩家数据表
    if not FormFriend.recommendRole then FormFriend.recommendRole = {} end

    FormFriend.recommendRole[guid] = {
        count = 0
    }

    -- 存储所有推荐好友的guid的变量
    local recommendFriendsData = nil
    if FriendSystem then
        recommendFriendsData = FriendSystem.GetRecommendFriend(player)
    end


    -- 是否拥有推荐的离线玩家  组队推荐的玩家，可能也会下线
    local isHaveOfflineRole = recommendFriendsData.offlineCount ~= 0

    -- 计时器开关
    local timer_is_open = nil

    for k,v in pairs(recommendFriendsData) do
        if k ~= "Count" and k ~= "offlineCount" and k ~= 'temp_count' then

            -- 类别 1 组队推荐 2在线玩家推荐 3 离线玩家推荐
            local kind = v
            if kind ~= 3 then
                local role = sPlayerSystem:GetPlayerByGUID(k)
                if role then
                    -- 等级
                    local level = role:GetAttr(ROLE_ATTR_LEVEL)
                    -- 名称
                    local name = role:GetName()
                    -- 战斗力
                    local combatPower = role:GetAttr(ROLE_ATTR_FIGHT_VALUE)
                    -- 门派
                    local school = role:GetAttr(ROLE_ATTR_JOB_1)
                    -- 角色id
                    local id = role:GetAttr(ROLE_ATTR_ROLE)
                    -- vip等级
                    local vip_level = role:GetAttr(ROLE_ATTR_VIP)

                    local recommendRoleGuid = tostring(k)
                    FormFriend.recommendRole[guid][recommendRoleGuid] = {
                        kind = kind,
                        level = level,
                        name = name,
                        combatPower = combatPower,
                        school = school,
                        roleId = id,
                        vip_level = vip_level,
                    }
                    FormFriend.recommendRole[guid].count = FormFriend.recommendRole[guid].count + 1
                end
            else
                -- 如果推荐在线玩家时，在线玩家下线了，导致读取离线玩家数据出错，需要加个计时器，当达到时间时还是发送数据
                -- 添加计时器
                if not timer_is_open then
                    if not FormFriend._send_data_timing then FormFriend._send_data_timing = {} end
                    FormFriend._send_data_timing[guid] = {}
                    -- 将定时器guid存储下来，用于关闭定时器
                    FormFriend._send_data_timing[guid].timer_guid = sLuaTimerSystem:AddTimerEx(player, 6000, 1, "FriendSystem._send_recommend_friends_data_timer_event", guid)

                    timer_is_open = true
                end
                sContactSystem:GetOfflinePlayer(k,"FriendSystem","GetOfflinePlayer",guid.."_"..k.."_"..recommendFriendsData.Count)
            end
        end
    end


    -- 如果没有推荐的离线玩家，有在线玩家，也发送表单
    if not isHaveOfflineRole and recommendFriendsData.Count > 0 then
        FormFriend.recommendRole[guid].count = nil
        --发送表单
        local str = [[
        if FriendShipRecommend then
            FriendShipRecommend.recommendFriends = ]]..Lua_tools.serialize(FormFriend.recommendRole[guid])..[[
            FriendShipRecommend.RefreshUseApply()
        end
        ]]

        sLuaApp:ShowForm(player, "脚本表单", str)

        -- 清除数据，防止占用内存
        FormFriend.recommendRole[guid] = nil

    elseif recommendFriendsData.Count == 0 then
        sLuaApp:NotifyTipsMsg(player,'暂时没有推荐玩家')
        --发送表单
        local str = [[
        if FriendShipRecommend then
            FriendShipRecommend.recommendFriends = {}
            FriendShipRecommend.RefreshUseApply()
        end
        ]]

        sLuaApp:ShowForm(player, "脚本表单", str)

        -- 清除数据，防止占用内存
        FormFriend.recommendRole[guid] = nil
    end

    return ""
end


-- 获取师徒数据 1 师傅 2 徒弟
function FormFriend.get_mentoring_data(player,type)
    if not (player and type) then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","师徒") then
		return ""
	end
    type = tonumber(type)
    if not type then
        sLuaApp:LuaWrn('FormFriend.get_mentoring_data 获取师徒数据 type参数为空')
        return ''
    end
    if not (type == 1 or type == 2) then
        sLuaApp:LuaWrn('FormFriend.get_mentoring_data 获取师徒数据 type错误')
        return ''
    end

    if TeacherPupilSystem then
        -- 更新师徒数
        --TeacherPupilSystem.RefreshRegister(player)
        -- 获取师徒数据
        TeacherPupilSystem.GetShowList(player:GetGUID(),type,2)
        --local user_id = player:GetUserId()
        --local guid = tostring(player:GetGUID())
        ---- 剔除同一账号下,但同时不是当前玩家的角色
        --for k, v in ipairs(mentoring_data) do
        --    if v.user_id and v.user_id == user_id and v.guid ~= guid then
        --        table.remove(mentoring_data, k)
        --    end
        --end

        --if mentoring_data then
        --    local str = [[
        --    if FriendShipRecommend then
        --       FriendShipRecommend.MasterRecommend = ]] .. Lua_tools.serialize(mentoring_data) .. [[
        --       FriendShipRecommend.RefreshMasterRole()
        --   end
        --]]
        --    sLuaApp:ShowForm(player, "脚本表单", str)
        --    -- 如果为空发送空表
        --else
        --    local str = [[
        --    if FriendShipRecommend then
        --       FriendShipRecommend.MasterRecommend = {} ]]  .. [[
        --       FriendShipRecommend.RefreshMasterRole()
        --   end
        --    ]]
        --    sLuaApp:ShowForm(player, "脚本表单", str)
        --end
    end

    return ""
end


-- 师傅登记
function FormFriend.teacher_register(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","师徒") then
		return ""
	end
    if TeacherPupilSystem then
        TeacherPupilSystem.FriendRegister(player:GetGUID(),1)
    end
    return ""
end

-- 徒弟登记
function FormFriend.pupil_register(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","师徒") then
		return ""
	end
    if TeacherPupilSystem then
        TeacherPupilSystem.FriendRegister(player:GetGUID(),2)
    end
    return ""
end

-- 取消师傅/徒弟登记
function FormFriend.remove_register(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","师徒") then
		return ""
	end
    local PlayerGuid = player:GetGUID()
    if TeacherPupilSystem then
        TeacherPupilSystem.CancelRegister(PlayerGuid)
    end
    return ""
end

-- 登记或取消登记师徒，确认后的回调
function FormFriend._confirm(player)
if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","师徒") then
    return ""
end
    local str = [[
        local ui = GUI.GetWnd("FriendShipRecommend")
        if GUI.GetVisible(ui) then
            if FriendShipRecommend and FriendShipRecommend.RefreshMasterButton then
                FriendShipRecommend.RefreshMasterButton()
            end
        end
    ]]
    sLuaApp:ShowForm(player,'脚本表单',str)
end

-- 获取当前玩家是否登记师傅/徒弟,通过自定义变量获取 TeacherSystem_Register

-- 获取相亲数据
function FormFriend.get_blind_date_data(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","相亲") then
		return ""
	end
    -- 玩家guid
    local guid = player:GetGUID()

    if FriendSystem then
        local send_data = FriendSystem.get_blind_date_data(player)
        -- 如果函数返回false则是数据错误，如果为nil则是没有数据
        if  send_data == false then
            sLuaApp:NotifyTipsMsg(player,"系统错误")
            local str = [[
            if FriendShipRecommend then
                FriendShipRecommend.MarryRecommend = {}
                FriendShipRecommend.RefreshMarryRole()
            end
        ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        elseif send_data == nil then
            sLuaApp:NotifyTipsMsg(player,"无登记相亲玩家")
            local str = [[
                                if FriendShipRecommend then
                                    FriendShipRecommend.MarryRecommend = {}
                                    FriendShipRecommend.RefreshMarryRole()
                                end
                            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        else

            -- 判断玩家是否已登记,如果未登记，从发送数据中删除玩家的数据,如果已登记则去重玩家数据
            -- 第一发现玩家数据时，no_repeat为false,未删除，将其设为true，再次发现玩家数据时则删除这条数据

            -- 当前玩家是否已登记
            local is_register = player:GetInt('is_register_blind_date')

            local no_repeat = false
            if is_register ~= 1 then
                for k,v in pairs(send_data) do
                    if k ~= "count" and v[1] == guid then
                        send_data[k] = nil
                        send_data.count = send_data.count - 1
                    end
                end
            else
                for k,v in pairs(send_data) do
                    if k ~= "count" and v[1] == guid then
                        if no_repeat then
                            send_data[k] = nil
                            send_data.count = send_data.count - 1
                        else
                            no_repeat = true
                        end
                    end
                end
            end


            -- 计算循环次数
            local count = send_data.count
            -- 删除count数据
            send_data.count = nil


            for k,v in pairs(send_data) do
                -- 如果是自己
                if guid == v[1] then
                    -- 玩家guid
                    local playerGuid = tostring(guid)
                    -- 目标guid
                    local guid = tostring(v[1])

                    local role = player
                    -- 等级
                    local level = role:GetAttr(ROLE_ATTR_LEVEL)
                    -- 名称
                    local name = role:GetName()
                    -- 战斗力
                    local combatPower = role:GetAttr(ROLE_ATTR_FIGHT_VALUE)
                    -- 门派
                    local school = role:GetAttr(ROLE_ATTR_JOB_1)
                    -- 角色id
                    local id = role:GetAttr(ROLE_ATTR_ROLE)
                    -- vip等级
                    local vip_level = role:GetAttr(ROLE_ATTR_VIP)

                    -- 相亲数据,定为全局变量，用于获取离线玩家数据的回调
                    if not FormFriend._blind_date_data then FormFriend._blind_date_data = {} end

                    if not FormFriend._blind_date_data[playerGuid] then
                        FormFriend._blind_date_data[playerGuid] = {}
                        FormFriend._blind_date_data[playerGuid].count = 0
                    end

                    -- 如果这个值在容器中不存在，让计数+1
                    if FormFriend._blind_date_data[playerGuid][guid] == nil then
                        FormFriend._blind_date_data[playerGuid].count = FormFriend._blind_date_data[playerGuid].count + 1
                    end

                    -- 将数据放入table容器中
                    FormFriend._blind_date_data[playerGuid][guid] = {
                        level = level,
                        name = name,
                        combatPower = combatPower,
                        school = school,
                        roleId = id,
                        guid = guid,
                        vip_level = vip_level
                    }

                    -- 如果达到数量发送数据
                    if FormFriend._blind_date_data[playerGuid].count == count then

                        local send_data = {}
                        for k,v in pairs(FormFriend._blind_date_data[playerGuid]) do
                            if k ~= 'count' then
                                table.insert(send_data,v)
                            end
                        end
                        -- 发送表单
                        local str = [[
                            if FriendShipRecommend then
                                FriendShipRecommend.MarryRecommend = ]]..Lua_tools.serialize(send_data)..[[
                                FriendShipRecommend.RefreshMarryRole()
                            end
                            ]]

                        sLuaApp:ShowForm(player, "脚本表单", str)
                        -- 清除数据，防止占用内存
                        FormFriend._blind_date_data[playerGuid] = nil

                    end

                else
                    sContactSystem:GetOfflinePlayer(v[1],"FriendSystem","_send_blind_date_data",guid.."_"..v[1].."_"..count)
                end
            end
        end
    end

    return ""
end


-- 登记相亲
function FormFriend.blind_date_register(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","相亲") then
		return ""
	end
    if FriendSystem then
        local is_success = FriendSystem.blind_date_register(player)
        if is_success == true then
            sLuaApp:NotifyTipsMsg(player,'登记成功')
        elseif type(is_success) == 'number' then
            sLuaApp:NotifyTipsMsg(player,'您已结婚，无法登记')
        else
            sLuaApp:NotifyTipsMsg(player,"登记失败")
        end
    end
    return ""
end

-- 取消登记相亲
function FormFriend.blind_date_unregister(player)
    if not player then return end
	if not MainUISwitch.CheckOpenLevel(player,"好友","推荐好友","相亲") then
		return ""
	end
    if FriendSystem then
        local is_success = FriendSystem.blind_date_unregister(player)
        if is_success == true then
            sLuaApp:NotifyTipsMsg(player,"取消登记成功")
        elseif is_success == 'no_register'  then
            sLuaApp:NotifyTipsMsg(player,"您并未登记")
        else
            sLuaApp:NotifyTipsMsg(player,'取消登记失败')
        end
    end
    return ""
end