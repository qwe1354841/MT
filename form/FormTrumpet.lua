-- 喇叭表单
-- 使用喇叭发送信息
local FormTrumpet = {}
_G.FormTrumpet = FormTrumpet

-- 在喇叭频道发送信息
function FormTrumpet.sendMessageInTrumpet(player, text)
    if not text or text == '' then
        sLuaApp:NotifyTipsMsg(player, '无法发送空文本')
        return ''
    end
    -- 判断是否禁言
    local enable_forbid_talk_time = player:GetInt("WorldChatShieldWord_EnableForbidTalkTime")
    local cur_time = sLuaApp:GetTimes()
    if cur_time < enable_forbid_talk_time then
        sLuaApp:NotifyTipsMsg(player, "你已被系统禁言，解禁时间为：" .. sLuaApp:DateTime2Str(enable_forbid_talk_time))
        return ''
    else
        -- 判断发出内容是否有违禁字
        local result = WorldChatShieldWord.trigger_on_pre_world_chat(player, text)
        if result ~= '' then
            sLuaApp:NotifyTipsMsg(player, "" .. result)
            return ''
        end
    end
    -- 喇叭物品id
    local TrumpetId = 30912
    -- 判断背包中是否有喇叭物品
    local TrumpetAmount = sItemSystem:GetItemAmount(player, TrumpetId, 3)
    if TrumpetAmount > 0 then
        -- 减少喇叭物品
        if not sItemSystem:ConsumeItemWithId(player, TrumpetId, 1, 3, "system", "在喇叭频道内发送信息", "在喇叭频道内发送信息消耗喇叭") then
            sLuaApp:LuaWrn("在喇叭频道内发送信息时，消耗喇叭物品失败")
            sLuaApp:NotifyTipsMsg(player, "系统错误")
        else
            sLuaApp:NotifyChannelMsg(player, 5, text)
        end
    else
        sLuaApp:NotifyTipsMsg(player, "您的<color=#FF0000ff>喇叭</color>" .. "不足1个，不能使用喇叭频道")
    end

    return ""
end
