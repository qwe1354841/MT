--好友邀请
FriendInvitation = {}

--邀请人奖励表
FriendInvitation.Config = {
    --{奖励档位 = {奖励List}}
    {"1",itemList = {"猪八戒信物",1,"装备强化石",1},},
    {"5",itemList = {"猪八戒信物",5,"还原丹",2},},
    {"10",itemList = {"猪八戒信物",10,"宝石福袋",3},},
    {"20",itemList = {"猪八戒信物",10,"高级宝石福袋",2,"还原丹",2},},
    {"50",itemList = {"猪八戒信物",24,"强化保固石",5,"阵法礼包",1},},
}
--被邀请奖励表
FriendInvitation.FriendInvited ={
    {"1",itemList = {"200银元",1,"N礼包",1,"还原丹",1,"装备强化石",1}},
}
function FriendInvitation.Get_UKey(player)
    local UserId = player:GetUserId()
    --获得邀请码
    local Key = tostring(sLuaApp:GetUKey(UserId))
    local str = [[
        if GlobalProcessing then
            GlobalProcessing.FriendInviteCode = ']]..Key..[['
        end
    ]]
    --sLuaApp:LuaDbg("key........."..Key)
    sLuaApp:ShowForm(player, "脚本表单", str)
    return""
end

function FriendInvitation.GetData(player)
    if FunctionSwitch.AllFuncitonConfig.FriendInvitation ~= "on" then
        return
    end
    local UserId = player:GetUserId()
    --获得邀请码
    local Key = tostring(sLuaApp:GetUKey(UserId))
    local InvitationNum = player:GetInt("FriendInvitation_Num")
    local str = [[
        if WelFriendInvitationUI then
            WelFriendInvitationUI.Config = ]]..Lua_tools.serialize(FriendInvitation.Config)..[[
    ]]
    for i = 1, #FriendInvitation.Config do
        str = str..[[WelFriendInvitationUI.State_]]..i..[[ = ]]..player:GetInt("WELFARE_FriendInvitation_State_"..i)..[[
		]]
    end
    str = str ..[[WelFriendInvitationUI.InvitationNum = ]]..InvitationNum..[[
    WelFriendInvitationUI.FriendInviteCode = ']]..Key..[['
    WelFriendInvitationUI.RefreshUI()
		end]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end
--领取邀请奖励
function FriendInvitation.GetReward(player,index)
    if FunctionSwitch.AllFuncitonConfig.FriendInvitation ~= "on" then
        return
    end
    local Rw_state = player:GetInt("WELFARE_FriendInvitation_State_"..index)
    if Rw_state == 1 then
        sLuaApp:NotifyTipsMsg(player, "您已经领取过该奖励了")
        return
    end
    local config = FriendInvitation.Config[tonumber(index)]
    if not Lua_tools.IsBagEnough(player, config.itemList) then
        sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足")
        return
    end
    player:SetInt("WELFARE_FriendInvitation_State_"..index, 1)
    Lua_tools.AddItem(player, config.itemList, "system", "好友邀请", "index = " .. index)
    FriendInvitation.GetData(player)
end
--输入邀请码领取奖励
function FriendInvitation.BeInvited_code(player,code)
    if code == "" then
        return "邀请码不能为空哦"
    end
    local UserID = player:GetUserId()
    sLuaApp:LuaDbg(UserID)
    local FriendID = sLuaApp:GetIDByUKey(code)
    sLuaApp:LuaDbg(FriendID)
    local Friend_Player = sPlayerSystem:GetPlayerByUserId(FriendID,0)
    local Config = FriendInvitation.FriendInvited[1]
    if Friend_Player == nil then
        sLuaApp:NotifyTipsMsg(player,"需要邀请码有效且好友在线才能绑定" )
        return
    elseif FriendID == UserID then
        sLuaApp:NotifyTipsMsg(player, "不能填写自己的邀请码")
        return
    elseif player:GetInt("FriendInvitation_TranslateAccount") ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "已经有绑定的好友了")
        return
    else
        local Num = Friend_Player:GetInt("FriendInvitation_Num")
        Friend_Player:SetInt("FriendInvitation_Num",Num+1)
        player:SetInt("FriendInvitation_TranslateAccount",1)
        sLuaApp:NotifyTipsMsg(player, "好友绑定成功")
        Lua_tools.AddItem(player, Config.itemList, "system", "好友邀请","")
        FriendInvitation.GetData(Friend_Player)
        local str = [[if WelfareUI then
        WelfareUI.IsWelInputInvitationCodeUIClose()
        end]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function FriendInvitation.On_log(player)
    if FunctionSwitch.AllFuncitonConfig.FriendInvited ~= "on" then
        return
    end
    local Bind = player:GetInt("FriendInvitation_TranslateAccount")
    sLuaApp:LuaDbg(Bind)
    if Bind ~= 0 then
        local str = [[if WelfareUI then
        WelfareUI.IsWelInputInvitationCodeUIClose()
        end]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        local str = [[if WelfareUI then
        WelfareUI.IsWelInputInvitationCodeUIShow()
        end]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function FriendInvitation.invitation_code(player)
    if FunctionSwitch.AllFuncitonConfig.FriendInvited ~= "on" then
        return
    end
    local Config = FriendInvitation.FriendInvited[1]
    local str = [[if WelInputInvitationCodeUI then
            WelInputInvitationCodeUI.Config = ]]..Lua_tools.serialize(Config.itemList)..[[
    ]]
    str = str..[[WelInputInvitationCodeUI.RefreshUI()
    end]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end