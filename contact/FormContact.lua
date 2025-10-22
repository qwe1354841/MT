-- 联系表单
-- 好友相关表单
FormContact = {}

--请求联系人
function FormContact.GetContact(player, contact_type)
    if player == nil then
        return ""
    end

    sContactSystem:NotifyContact(player, contact_type)
    return ""
end

--请求消息列表
--[[
function FormContact.GetContactMessage(player, target_guid)
    if player == nil then
        return ""
    end

    sContactSystem:NotifyContactMessage(player, target_guid)
    return ""
end
--]]

--请求联系信息
function FormContact.GetContactInfo(player, keyword)
    if player == nil then
        return ""
    end

    local code = sContactSystem:NotifyContactInfoByKeyword(player, keyword)
    if code ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "找不到该玩家")
    end
    return ""
end

--请求联系信息
function FormContact.GetContactInfoByGUID(player, guid)
    if player == nil then
        return ""
    end

    sContactSystem:NotifyContactInfoByGUID(player, guid)
    return ""
end

-- 发送信息
-- Data["FormContact"]["_send_player_guids"] = {}
-- Data["FormContact"]["_is_control_red"] = {}
function FormContact.SendContactMessage(player, target_guid, text)
    if player == nil then
        return ""
    end
    
    -- 判断是好友
    if not sContactSystem:IsFriend(player, tonumber(target_guid)) then
        local stranger_list =  sContactSystem:GetContactList(player,0)
        local is_stranger = false
        for _,v in ipairs(stranger_list) do
            if v == tonumber(target_guid) then
                is_stranger = true
            end
        end
        if not is_stranger then
            if sContactSystem:IsBlackList(player:GetGUID(), tonumber(target_guid)) then
                sLuaApp:NotifyTipsMsg(player, "无法发送信息，您已拉黑对方，或被对方拉黑")
                return ""
            end
            FormContact.AddStrangerList(player, target_guid)
        end
        -- FormContact.AddStrangerList(player, target_guid)
        -- sLuaApp:NotifyTipsMsg(player, "对方不是你的好友，无法发送信息")
        -- return ""
    end

    -- 敏感词过滤
    text = sLuaApp:MaskChat(text)

    if sContactSystem:SendMessage(player, target_guid, text) ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "发送失败")
        return ''
    end

    local player_guid = tostring(player:GetGUID())

    FormContact.CreateData()

    if Data["FormContact"]["_is_control_red"][target_guid] == nil then
        Data["FormContact"]["_is_control_red"][target_guid] = true
    end

    -- 记录发送信息的玩家
    if not Data["FormContact"]["_send_player_guids"][target_guid] then
        Data["FormContact"]["_send_player_guids"][target_guid] = {}
        Data["FormContact"]["_send_player_guids"][target_guid][player_guid] = true
    else
        Data["FormContact"]["_send_player_guids"][target_guid][player_guid] = true
    end

    if Data["FormContact"]["_is_control_red"][target_guid] then
        -- 在主界面显示小红点,需要是在线玩家
        local target_player = sPlayerSystem:GetPlayerByGUID(target_guid)
        if target_player then
            --GlobalProcessing.on_draw_redpoint("friendChatBtn", true)
            local str = [[
            if GlobalProcessing then
        GlobalProcessing.on_FriendUI_Red("friendChatBtn", true)
        end
    ]]
            sLuaApp:ShowForm(target_player, "脚本表单", str)
        end
    end
    return ""
end

-- 创建Data.FormContact
function FormContact.CreateData()
    if not Data["FormContact"] then
        Data["FormContact"] = {}
        Data["FormContact"]["_is_control_red"] = {}
        Data["FormContact"]["_send_player_guids"] = {}
    end
end

-- 获取发送对象们的guid
function FormContact.get_senders_guid(player)
    if not player then
        return
    end

    local player_guid = tostring(player:GetGUID())

    if Data["FormContact"]["_send_player_guids"][player_guid] then
        local str = [[
        if FriendUI then
            FriendUI.FriendRedTable = ]] .. Lua_tools.serialize(Data["FormContact"]["_send_player_guids"][player_guid]) .. [[
            FriendUI.GetFriendRedTable()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        local str = [[
        if FriendUI then
            FriendUI.FriendRedTable = {}
            FriendUI.GetFriendRedTable()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    -- Data["FormContact"]["_send_player_guids"][player_guid]  = nil
    Data["FormContact"]["_is_control_red"][player_guid] = false
    return ''
end

-- 获取发送对象们的guid  发给mail邮件界面
function FormContact.get_mail_senders_guid(player)
    if not player then
        return
    end

    local player_guid = tostring(player:GetGUID())

    if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][player_guid] then
        local str = [[
        if MailUI then
            MailUI.FriendRedTable = ]] .. Lua_tools.serialize(Data["FormContact"]["_send_player_guids"][player_guid]) .. [[
            MailUI.AddListRedPoint()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        local str = [[
        if MailUI then
            MailUI.FriendRedTable = {}
            MailUI.AddListRedPoint()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    --Data["FormContact"]["_send_player_guids"][player_guid]  = nil
    --Data["FormContact"]["_is_control_red"][player_guid] = false
    return ''
end

-- 取消主界面小红点 已取消使用
function FormContact.hide_red_point(player)
    if not player then
        return
    end
    --GlobalProcessing.on_draw_redpoint("friendChatBtn", false)
    local str = [[
    if GlobalProcessing then
        GlobalProcessing.on_FriendUI_Red("friendChatBtn", false)
    end
    ]]
    --sLuaApp:ShowForm(player, "脚本表单", str)
    return ''
end

-- 设置服务端是否控制小红点
function FormContact.set_control_red_state(player, bool)
    if not player then
        return
    end
    if bool == 'true' then
        bool = true
    else
        bool = false
    end
    local player_guid = tostring(player:GetGUID())
    Data["FormContact"]["_is_control_red"][player_guid] = bool
    return ''
end

-- 将已发送信息false的记录清空 在关闭好友界面时会执行
function FormContact.clearSendersGuid(player)
    local player_guid = tostring(player:GetGUID())
    if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][player_guid] then
        for k, v in pairs(Data["FormContact"]["_send_player_guids"][player_guid]) do
            if v == false then
                Data["FormContact"]["_send_player_guids"][player_guid][k] = nil
            end
        end
    end
    return ''
end

-- 将指定玩家guid的是否发送消息数据设为false
function FormContact.setOneSenderFalseForGuid(player, target_guid)
    if target_guid == nil then
        return ''
    end
    local player_guid = tostring(player:GetGUID())
    if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][player_guid] then
        Data["FormContact"]["_send_player_guids"][player_guid][target_guid] = false
    end
    return ''
end


-- 登陆游戏控制好友是否显示小红点
function FormContact.Login_Data(player)
    if not player then
        return
    end
    local player_guid = tostring(player:GetGUID())

    FormContact.CreateData()

    local is_show = false
    if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][player_guid] then
        for _, v in pairs(Data["FormContact"]["_send_player_guids"][player_guid]) do
            if v then
                is_show = true
                break
            end
        end
    end

    local str = [[
    if GlobalProcessing then
        GlobalProcessing.on_FriendUI_Red("friendChatBtn", ]] .. Lua_tools.serialize(is_show) .. [[)
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ''
end

-- 设置聊天频道屏蔽黑名单
function FormContact.OnLogin(player)
	if FunctionSwitch.AllFuncitonConfig['ChatBlacklist'] and FunctionSwitch.AllFuncitonConfig['ChatBlacklist'] == "on" then
        local str = [[
			if UIDefine.IsFunctionOrVariableExist(LD, "SetShieldBlackListMsg") then
				LD.SetShieldBlackListMsg(true)
			end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--申请好友
function FormContact.ApplyFriend(player, target_guid, not_notify)
    if player == nil then
        return ""
    end

    local player_guid = player:GetGUID()
    -- 判断添加的对象是否是自己
    if tostring(player_guid) == target_guid then
        sLuaApp:NotifyTipsMsg(player, "无法添加自己为好友")
        return ''
    end

    -- 判断是否已经是好友
    if sContactSystem:IsFriend(player, tonumber(target_guid)) then
        sLuaApp:NotifyTipsMsg(player, "对方已经是你的好友了")
        return ''
    end

    local count = sContactSystem:GetContactCount(player_guid, CONTACT_FRIEND)
    if count >= 99 then
        sLuaApp:NotifyTipsMsgEx(player, "您的好友数量太多，无法申请")
        return ""
    end

    -- 判断是否拉黑对方，或被对方拉黑
    if sContactSystem:IsBlackList(player_guid, tonumber(target_guid)) then
        -- 如果在自己的黑名单中，取消自己的拉黑
        if sContactSystem:DelBlackList(player, tonumber(target_guid)) == 0 then
        else
            sLuaApp:NotifyTipsMsgEx(player, "您被对方拉黑，无法加为好友")
            return ''
        end
    end

    local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if target ~= nil then
        local set = target:GetInt("CONTACT_AutoRefuseApply")
        if set ~= 0 then
            sLuaApp:NotifyTipsMsgEx(player, "对方拒绝了您的好友申请")
            return ""
        end
    end

    sContactSystem:ApplyFriend(player, target_guid)
    -- 请求添加全部好友时,不发送这条信息
    if not not_notify then
        sLuaApp:NotifyTipsMsgEx(player, '请求信息已发送')
    end

    return ""
end

--接受好友申请
function FormContact.AcceptApply(player, target_guid)
    if player == nil then
        return ""
    end

    local player_guid = player:GetGUID()
    -- 判断添加的对象是否是自己
    if tostring(player_guid) == target_guid then
        sLuaApp:NotifyTipsMsg(player, "无法接受自己的好友好友申请")
        return ''
    end

    -- 判断是否已经是好友
    if sContactSystem:IsFriend(player, tonumber(target_guid)) then
        sLuaApp:NotifyTipsMsg(player, "对方已经是你的好友了")
        return ''
    end

    local player_guid = player:GetGUID()
    local count = sContactSystem:GetContactCount(player_guid, CONTACT_FRIEND)
    if count >= 99 then
        sLuaApp:NotifyTipsMsgEx(player, "您的好友数量太多，无法添加")
        return ""
    end

    if sContactSystem:AcceptApply(player, target_guid) == 0 then
        local target_guid_n = tonumber(target_guid)
        -- 获取对方玩家名称
        local target_name = sContactSystem:GetContactName(target_guid_n)
        sLuaApp:NotifyTipsMsg(player, '你和' .. target_name .. "成为好友")
        -- 推送好友列表
        sContactSystem:NotifyContact(player, CONTACT_FRIEND)

        local target_player = sPlayerSystem:GetPlayerByGUID(target_guid_n)
        if target_player then
            local player_name = player:GetName()
            sLuaApp:NotifyTipsMsg(target_player, '你和' .. player_name .. "成为好友")
            -- 推送一下好友列表
            sContactSystem:NotifyContact(target_player, CONTACT_FRIEND)

            -- 成就记录 type 1 添加好友 0 删除好友
            if Achievement then
                Achievement.Add_Friend_Achievement(target_player, 1)
            end
        end
        -- 成就记录 type 1 添加好友 0 删除好友
        if Achievement then
            Achievement.Add_Friend_Achievement(player, 1)
        end

    else
        local target_guid_n = tonumber(target_guid)
        -- 获取对方玩家名称
        local target_name = sContactSystem:GetContactName(target_guid_n)
        sLuaApp:NotifyTipsMsg(player, '你添加' .. target_name .. "为好友失败")

        local target_player = sPlayerSystem:GetPlayerByGUID(target_guid_n)
        if target_player then
            local player_name = player:GetName()
            sLuaApp:NotifyTipsMsg(target_player, '你添加' .. player_name .. "为好友失败")
        end
    end
    return ""
end

--拒绝好友申请
function FormContact.RefuseApply(player, target_guid)
    if player == nil then
        return ""
    end

    sContactSystem:RefuseApply(player, target_guid)
    return ""
end

--拒绝所有好友申请
function FormContact.RefuseAllApply(player)
    if player == nil then
        return ""
    end

    sContactSystem:RefuseAllApply(player)
    return ""
end

-- 上线被好友删除提醒的数据存储容器
FormContact._be_del_friend_login_remind_data = {}

-- 提示确认后真正删除好友
function FormContact._delete_friend(player, target_guid, is_open_hint)
    local player_guid = player:GetGUID()
    local target_guid_n = tonumber(target_guid)
    local target = sPlayerSystem:GetPlayerByGUID(target_guid_n)
    -- 目标unid 初始化，放这为了能执行goto
    local target_u_nid = nil
    -- 婚姻相关,同上
    local spouse = nil
    --  如果对方不在线，将直接删除好友，如果在线则是否有判断师徒和婚姻
    if target == nil then
        goto skip_if
    end
    target_u_nid = target:GetUNID()
    -- 判断如果是师徒/结婚 则不能删除好友
    -- 师傅身上存的徒弟UNID：PupilUNID_1  PupilUNID_2
    -- 徒弟身上存的师父UNID：TeacherUNID
    -- 师徒
    for i = 1, TeacherPupilSystem.PupilMaxNum do
        if player:GetString("PupilUNID_" .. i) == target_u_nid then
            sLuaApp:NotifyTipsMsg(player, '请先解除师徒关系')
            return ''
        end
    end
    if player:GetString("TeacherUNID") == target_u_nid then
        sLuaApp:NotifyTipsMsg(player, '请先解除师徒关系')
        return ''
    end
    -- 结婚
    spouse = sPlayerSystem:GetSpouse(player)
    if spouse ~= nil and spouse == target_u_nid then
        sLuaApp:NotifyTipsMsg(player, "请先解除婚姻关系")
        return ""
    end
    :: skip_if ::
    -- 解除好友，好感度清零,次数清零
    -- 需要在删除好友之前处理
    sContactSystem:SetInt(player_guid, target_guid_n, "LikeabilityValue", 0)
    sContactSystem:SetInt(target_guid_n, player_guid, "LikeabilityValue", 0)

    sContactSystem:SetInt(player_guid, target_guid_n, "giveAwayCount", 0)
    sContactSystem:SetInt(target_guid_n, player_guid, "giveAwayCount", 0)

    if sContactSystem:DeleteFriend(player, target_guid) == 0 then
        -- 通知己方
        --sContactSystem:NotifyContactMessage(player, target_guid)
        -- 联系人类型 参照LogicDef枚举值
        sContactSystem:NotifyContact(player, CONTACT_FRIEND)

        -- 通知对方
        --local target = sPlayerSystem:GetPlayerByGUID(target_guid_n)
        -- 如果对方离线就不处理
        if target then
            sContactSystem:NotifyContact(target, CONTACT_FRIEND)
            --sContactSystem:NotifyContactMessage(target,3)
        end

        -- 获取玩家名称
        local target_name = sContactSystem:GetContactName(target_guid_n)
        sLuaApp:NotifyTipsMsg(player, '你解除了和' .. target_name .. "的好友关系")

        -- 如果对方在线，提示对方
        local player_name = player:GetName()
        if target then
            sLuaApp:NotifyTipsMsg(target, player_name .. "和你解除了好友关系")
            -- 成就记录 type 1 添加好友 0 删除好友
            if Achievement then
                Achievement.Add_Friend_Achievement(target, 0)
            end
        else
            -- 等对方上线时提醒
            FormContact._be_del_friend_login_remind_data[target_guid] = player_name
        end

        -- 成就记录 type 1 添加好友 0 删除好友
        if Achievement then
            Achievement.Add_Friend_Achievement(player, 0)
        end

        -- 客户端回调
        if is_open_hint == nil or is_open_hint == true then
            local form_str = [[
            if FriendUI and FriendUI.ReturnDeleteFriendSuccess then
                FriendUI.ReturnDeleteFriendSuccess()
            end
        ]]
            sLuaApp:ShowForm(target, "脚本表单", form_str)
        end

        -- 对好友界面外界按钮上的小红点进行处理
        if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][target_guid] then
            local player_guid_s = tostring(player_guid)
            -- 对是否已发送信息数据进行处理
            if Data["FormContact"]["_send_player_guids"][target_guid] then
                Data["FormContact"]["_send_player_guids"][target_guid][player_guid_s] = false
            end

            local is_show = false
            -- 必须用循环来判断,不然如果使用next时,第一个是false而后面是有数据的时候就会导致错误
            -- 必须对方在线才能发送
            if target then
                for _, v in pairs(Data["FormContact"]["_send_player_guids"][target_guid]) do
                    if v then
                        is_show = true
                        break
                    end
                end

                local str = [[
                if GlobalProcessing then
                    GlobalProcessing.on_FriendUI_Red("friendChatBtn", ]] .. Lua_tools.serialize(is_show) .. [[)
                end
                ]]
                sLuaApp:ShowForm(target, "脚本表单", str)
            end

            -- 将是否发送信息记录数据发送给被删除者的界面
            if target then
                if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][target_guid] then
                    local str = [[
                    if FriendUI then
                        FriendUI.FriendRedTable = ]] .. Lua_tools.serialize(Data["FormContact"]["_send_player_guids"][target_guid]) .. [[
                        FriendUI.GetFriendRedTable()
                    end
                    ]]
                    sLuaApp:ShowForm(target, "脚本表单", str)
                else
                    local str = [[
                    if FriendUI then
                        FriendUI.FriendRedTable = {}
                        FriendUI.GetFriendRedTable()
                    end
                    ]]
                    sLuaApp:ShowForm(target, "脚本表单", str)
                end
            end

        end

    else
        sLuaApp:NotifyTipsMsg(player, '解除好友关系失败')
    end
    return ''
end
-- 删除好友 弹出提示
function FormContact.DeleteFriend(player, target_guid)
    if player == nil or target_guid == nil then
        sLuaApp:LuaDbg("FormContact.DeleteFriend(player, target_guid) 传入参数为空")
        return ""
    end

    local target_guid_n = tonumber(target_guid)

    if target_guid_n == nil then
        sLuaApp:LuaDbg("FormContact.DeleteFriend(player, target_guid) 将target_guid 转换为number失败。")
        sLuaApp:NotifyTipsMsg(player, '系统错误')
        return ''
    end

    local is_open_hint = false
    if is_open_hint then
        -- 弹出是否删除好友提示
        local target_name = sContactSystem:GetContactName(target_guid)
        local hint = '您是否要删除您的好友' .. '<color=#0000ff>' .. target_name .. '</color>？'
        local str = [[GlobalUtils.ShowServerBoxMessage(']] .. hint .. [[')]]
        local run_str = 'FormContact._delete_friend(' .. 'sPlayerSystem:GetPlayerByGUID(' .. player:GetGUID() .. ")," .. target_guid .. ')'
        player:SetString("SYSTEM_ConfirmBox_Function", run_str)
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        FormContact._delete_friend(player, target_guid, is_open_hint)
    end

    return ""
end

-- 上线被好友删除提醒函数
function FormContact._be_del_friend_login_remind(player)
    if player then
        -- 获取玩家guid
        local player_guid = player:GetGUID()
        if not FormContact then
            require 'FormContact'
        end
        if FormContact then
            if FormContact._be_del_friend_login_remind_data[player_guid] then
                sLuaApp:NotifyTipsMsg(player, FormContact._be_del_friend_login_remind_data[player_guid] .. "和你解除了好友关系")
                FormContact._be_del_friend_login_remind_data[player_guid] = nil
            end
        end
    end
end

--拒绝设置自动拒绝好友申请
function FormContact.SetAutoRefuseApply(player, set)
    if player == nil then
        return ""
    end

    if set ~= 0 then
        player:SetInt("CONTACT_AutoRefuseApply", 1)
    else
        player:SetInt("CONTACT_AutoRefuseApply", 0)
    end
    return ""
end

--查询离线玩家
function FormContact.QueryOfflinePlayer(player, target_guid)
    if player == nil then
        return ""
    end
    if sLuaApp:GUIDType(tonumber(target_guid)) == GUID_ROBOT then
        return "该玩家拒绝被查看"
    end

    sContactSystem:LoadOfflinePlayer(player, target_guid)
    return ""
end

--通过名字查询离线玩家
function FormContact.QueryOfflinePlayerByName(player, target_name)
    if player == nil then
        return ""
    end

    local target_guid = sContactSystem:GetContactGUID(target_name)
    if target_guid == 0 then
        sLuaApp:NotifyTipsMsg(player, '该玩家拒绝被查看')
        return ""
    end

    sContactSystem:LoadOfflinePlayer(player, target_guid)
    return ""
end

--通过帮派名查询帮主
function FormContact.QueryOfflineGuildLeaderByGuildName(player, target_name)
    if player == nil then
        return ""
    end

    local Guild = sGuildSystem:GetGuildByName(target_name)
    if Guild == nil then
        sLuaApp:NotifyTipsMsg(player, '该帮派已被解散')
        return ""
    end
    local target_guid = Guild:GetLeaderGUID()
    if target_guid == 0 then
        sLuaApp:NotifyTipsMsg(player, '该帮主拒绝被查看')
        return ""
    end

    sContactSystem:LoadOfflinePlayer(player, target_guid)
    return ""
end

-- 加入黑名单
function FormContact.AddBlackList(player, guid)

    local player_guid = player:GetGUID()

    guid = tonumber(guid)

    if player_guid == guid then
        sLuaApp:NotifyTipsMsg(player, '无法将自己加入黑名单')
        return ''
    end

    local player_guid = player:GetGUID()
    local count = sContactSystem:GetContactCount(player_guid, CONTACT_BLACKLIST)
    if count >= 999 then
        sLuaApp:NotifyTipsMsgEx(player, "您的黑名单数量太多，无法添加")
        return ""
    end

    local target_guid_n = tonumber(guid)
    -- 获取对方玩家对象，如果不在线则无法获取到
    local target = sPlayerSystem:GetPlayerByGUID(target_guid_n)
    --  如果对方不在线
    if target == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法加入黑名单")
        return ''
    end

    local target_u_nid = target:GetUNID()

    -- 判断如果是师徒/结婚 则不能删除好友
    -- 师傅身上存的徒弟GUID：PupilGuid_1  PupilGuid_2
    -- 徒弟身上存的师父GUID：TeacherGuid
    -- 师徒
    if player:GetString("PupilGuid_1") == target_u_nid or player:GetString("PupilGuid_2") == target_u_nid or player:GetString("TeacherGuid") == target_u_nid then
        sLuaApp:NotifyTipsMsg(player, '请先解除师徒关系')
        return ''
    end

    -- 结婚
    local spouse = sPlayerSystem:GetSpouse(player)
    if spouse ~= nil and spouse == target_u_nid then
        sLuaApp:NotifyTipsMsg(player, "请先解除婚姻关系")
        return ""
    end

    -- 添加黑名单，好感度清零,次数清零
    -- 需要在添加黑名单之前处理
    sContactSystem:SetInt(player_guid, guid, "LikeabilityValue", 0)
    sContactSystem:SetInt(guid, player_guid, "LikeabilityValue", 0)

    sContactSystem:SetInt(player_guid, guid, "giveAwayCount", 0)
    sContactSystem:SetInt(guid, player_guid, "giveAwayCount", 0)

    if FormFriend then
        FormFriend.addToBlacklist(player, guid)
    end

    --移除对方小红点
    if target then
        if Data["FormContact"]["_send_player_guids"][tostring(guid)] then
            if Data["FormContact"]["_send_player_guids"][tostring(guid)][tostring(player_guid)] then
                Data["FormContact"]["_send_player_guids"][tostring(guid)][tostring(player_guid)] = nil
            end
            if not next(Data["FormContact"]["_send_player_guids"][tostring(guid)]) then
                local str = [[
                    if GlobalProcessing then
                        GlobalProcessing.on_FriendUI_Red("friendChatBtn", false)
                    end
                ]]
                sLuaApp:ShowForm(target, "脚本表单", str)
            end
        

            if Data["FormContact"]["_send_player_guids"] and Data["FormContact"]["_send_player_guids"][tostring(guid)] then
                local str = [[
                if FriendUI then
                    FriendUI.FriendRedTable = ]] .. Lua_tools.serialize(Data["FormContact"]["_send_player_guids"][tostring(guid)]) .. [[
                    FriendUI.GetFriendRedTable()
                end
                ]]
                sLuaApp:ShowForm(target, "脚本表单", str)
            else
                local str = [[
                if FriendUI then
                    FriendUI.FriendRedTable = {}
                    FriendUI.GetFriendRedTable()
                end
                ]]
                sLuaApp:ShowForm(target, "脚本表单", str)
            end
        end
    end

    return ""
end

-- 移出黑名单
function FormContact.RemoveBlackList(player, guid)
    if FormFriend then
        FormFriend.removeFromBlacklist(player, guid)
    end
    return ""
end

-- 全部添加，申请为好友
function FormContact.ApplyAll(player, guids)
    if not player or not guids then
        return ""
    end
    local guids = sLuaApp:StrSplit(guids, "_")
    for i = 1, #guids do
        FormContact.ApplyFriend(player, guids[i], true)
    end
    sLuaApp:NotifyTipsMsgEx(player, '请求信息已发送')
    return ""
end

-- 消息自动回复内容
FormContact._reply = {}
-- 设置消息自动回复
function FormContact.SetAutoReply(player, reply)
    if not (player and reply) then
        return
    end
    if reply == 'true' then
        reply = true
    else
        reply = false
    end

    if sContactSystem:SetAutoReply(player, reply) then
        local str = [[
        if FriendSystemSettingUI then
            FriendSystemSettingUI.IsOnMessageCheck = ]] .. Lua_tools.serialize(reply) .. [[
            FriendSystemSettingUI.RefreshMessageCheck()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        local player_guid = tostring(player:GetGUID())
        if FormContact._reply[player_guid] ~= nil then
            if FormContact._reply[player_guid] ~= reply then
                sLuaApp:NotifyTipsMsg(player, "消息自动回复设置成功")
                FormContact._reply[player_guid] = reply
            end
        else
            FormContact._reply[player_guid] = reply
            sLuaApp:NotifyTipsMsg(player, "消息自动回复设置成功")
        end
    else
        sLuaApp:NotifyTipsMsg(player, "消息自动回复设置失败")
    end

    return ""
end

-- 是否开启了消息自动回复
function FormContact.IsAutoReply(player)
    if not player then
        return
    end
    local is_auto_reply = sContactSystem:IsAutoReply(player)
    local str = [[
    if FriendSystemSettingUI then
        FriendSystemSettingUI.IsOnMessageCheck = ]] .. Lua_tools.serialize(is_auto_reply) .. [[
        FriendSystemSettingUI.RefreshMessageCheck()
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

FormContact._content = {}
-- 设置消息自动回复内容
function FormContact.SetAutoReplyContent(player, content)
    if not (player and content) then
        return
    end
    if sContactSystem:SetAutoReplyContent(player, content) then
        local str = [[
        if FriendSystemSettingUI then
            FriendSystemSettingUI.ReplyRoleContent  = ]] .. Lua_tools.serialize(content) .. [[
            FriendSystemSettingUI.SetReplyContent()
        end
        ]]

        sLuaApp:ShowForm(player, "脚本表单", str)

        local player_guid = tostring(player:GetGUID())
        if FormContact._content[player_guid] ~= nil then
            if FormContact._content[player_guid] ~= content then
                sLuaApp:NotifyTipsMsg(player, "设置消息自动回复内容成功")
                FormContact._content[player_guid] = content
            end
        else
            FormContact._content[player_guid] = content
            sLuaApp:NotifyTipsMsg(player, "设置消息自动回复内容成功")
        end
    else
        sLuaApp:NotifyTipsMsg(player, '设置消息自动回复内容失败')
    end
    return ""
end

-- 取得消息自动回复内容
function FormContact.GetAutoReplyContent(player)
    if not player then
        return
    end

    local content = sContactSystem:GetAutoReplyContent(player)
    local str = [[
    if FriendSystemSettingUI then
        FriendSystemSettingUI.ReplyRoleContent = ]] .. Lua_tools.serialize(content) .. [[
        FriendSystemSettingUI.SetReplyContent()
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

-- 上线提醒开关
FormContact._warn = {}
-- 设置好友上线提醒开关
function FormContact.SetLoginWarn(player, warn)
    if not (player and warn) then
        return
    end
    if warn == 'true' then
        warn = true
    else
        warn = false
    end
    if sContactSystem:SetLoginWarn(player, warn) then
        local str = [[
        if FriendSystemSettingUI then
            FriendSystemSettingUI.IsOnFriendCheck = ]] .. Lua_tools.serialize(warn) .. [[
            FriendSystemSettingUI.RefreshFriendCheck()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)

        local player_guid = tostring(player:GetGUID())
        if FormContact._warn[player_guid] ~= nil then
            if FormContact._warn[player_guid] ~= warn then
                sLuaApp:NotifyTipsMsg(player, "好友上线提醒设置成功")
                FormContact._warn[player_guid] = warn
            end
        else
            FormContact._warn[player_guid] = warn
            sLuaApp:NotifyTipsMsg(player, "好友上线提醒设置成功")
        end

    else
        sLuaApp:NotifyTipsMsg(player, "好友上线提醒设置失败")
    end
    return ""
end

-- 是否开启了好友上线提醒
function FormContact.IsLoginWarn(player)
    if not player then
        return
    end
    local is_login_warn = sContactSystem:IsLoginWarn(player)
    local str = [[
    if FriendSystemSettingUI then
        FriendSystemSettingUI.IsOnFriendCheck = ]] .. Lua_tools.serialize(is_login_warn) .. [[
        FriendSystemSettingUI.RefreshFriendCheck()
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

-- 好友上限提醒触发器函数
function FormContact._friends_login_remind(player)
    if not player then
        return
    end
    -- 联系人类型, 参照LogicDef.lua文件的枚举值
    -- 取得联系人列表,返回table的格式为:{guid1, guid2..., guidN}
    local friends = sContactSystem:GetContactList(player, CONTACT_FRIEND)

    -- 遍历所有好友
    for k, v in ipairs(friends) do
        -- 获取好友对象
        local friend_player = sPlayerSystem:GetPlayerByGUID(v)
        if friend_player then
            -- 判断这个好友是否开启好友上线提醒
            local is_login_warn = sContactSystem:IsLoginWarn(friend_player)
            -- 如果这个好友开启了好友上线提醒,在这个好友界面显示上线提醒
            if is_login_warn then
                sLuaApp:NotifyTipsMsg(friend_player, "您的好友" .. player:GetName() .. "已上线")
            end
        end
    end
end

--清除联系人之间的聊天记录
--[[
function FormContact.ClearMessage(player,target_guid)
    if not (player and target_guid) then return end

    target_guid = tonumber(target_guid)
    if not target_guid then return end

    if sContactSystem:ClearMessage(player,target_guid) == 0 then
        -- 清除己方消息
        sContactSystem:NotifyContactMessage(player, target_guid)

         --清除对方消息
        local player_guid = player:GetGUID()
        local target = sPlayerSystem:GetPlayerByGUID(target_guid)
        -- 如果对方离线就不处理
        if target then
            sContactSystem:NotifyContactMessage(target,player_guid)
        end

        sLuaApp:NotifyTipsMsg(player,"清除聊天记录成功")

        local str = [[
        if FriendUI then
            FriendUI.RefreshContactMessageUpdate()
        end
        ]]
--[[
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        sLuaApp:NotifyTipsMsg(player,"清除聊天记录失败")

        local str = [[
        if FriendUI then
            FriendUI.RefreshContactMessageUpdate()
        end
        ]]
--[[
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    return ''
end
--]]

-- 添加陌生人
function FormContact.AddStrangerList(player, target_guid)
    if not (player and target_guid) then
        return
    end

    target_guid = tonumber(target_guid)
    if not target_guid then
        return
    end

    if not sContactSystem:IsBlackList(player:GetGUID(), target_guid) then
        if sContactSystem:AddStrangerList(player, target_guid) == 0 then
            sLuaApp:NotifyTipsMsg(player, "添加陌生人成功")
        else
            sLuaApp:NotifyTipsMsg(player, "添加陌生人失败")
        end
    else
        sLuaApp:NotifyTipsMsg(player, "添加陌生人失败，您已拉黑对方，或被对方拉黑")
    end
    return ''
end

-- 删除陌生人
function FormContact.DelStrangerList(player, target_guid)
    if not (player and target_guid) then
        return
    end

    target_guid = tonumber(target_guid)
    if not target_guid then
        return
    end

    if sContactSystem:DelStrangerList(player, target_guid) == 0 then
        sLuaApp:NotifyTipsMsg(player, "删除陌生人成功")
    else
        sLuaApp:NotifyTipsMsg(player, "删除陌生人失败")
    end
    return ''
end

-- 向客户端推送联系人信息 通过名称
function FormContact.NotifyContactInfoByName(player, name)
    if not (player and name) then
        return
    end

    local player_name = player:GetName()
    if player_name == name then
        sLuaApp:NotifyTipsMsg(player, '无法添加自己为好友')
        return ''
    end

    -- 判断是否已经是好友
    local target_guid = sContactSystem:GetContactGUID(name)
    if not target_guid or target_guid == 0 then
        sLuaApp:NotifyTipsMsg(player, "该玩家并不存在")
        return ''
    else
        if target_guid and sContactSystem:IsFriend(player, target_guid) then
            sLuaApp:NotifyTipsMsg(player, "对方已经是你的好友了")
            return ''
        end
    end

    if sContactSystem:NotifyContactInfoByName(player, name) ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "未找到符合的玩家")
    end

    return ''
end

-- 向客户端推送联系人信息 通过id
function FormContact.NotifyContactInfoBySN(player, id)
    if not (player and id) then
        return
    end
    id = tonumber(id)
    if not id then
        sLuaApp:NotifyTipsMsg(player, '数据错误')
        sLuaApp:LuaWrn('FormContact.NotifyContactInfoBySN 通过id获取联系人信息，传入id错误')
        return ''
    end

    id = id - 1000000
    local player_id = player:GetAttr(ROLE_ATTR_SN)
    if player_id == id then
        sLuaApp:NotifyTipsMsg(player, '无法添加自己为好友')
        return ''
    end

    -- 判断是否已经是好友
    local target_guid = sContactSystem:GetContactGUIDBySN(id)
    if not target_guid or target_guid == 0 then
        sLuaApp:NotifyTipsMsg(player, "该玩家并不存在")
        return ''
    else
        if target_guid and sContactSystem:IsFriend(player, target_guid) then
            sLuaApp:NotifyTipsMsg(player, "对方已经是你的好友了")
            return ''
        end
    end

    if sContactSystem:NotifyContactInfoBySN(player, id) ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "未找到符合的玩家")
    end

    return ""
end

-- 打开好友设置界面，所需要获取的数据 未用
function FormContact.get_friend_setting_data(player)
    if not player then
        return
    end
    -- 是否开启了好友上线提醒
    local is_login_warn = sContactSystem:IsLoginWarn(player)

    -- 是否开启了消息自动回复
    local is_auto_reply = sContactSystem:IsAutoReply(player)

    -- 取得消息自动回复内容
    local content = sContactSystem:GetAutoReplyContent(player)
end