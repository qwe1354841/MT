-- 善恶值玩法 表单
local FormPkRule = {}
_G.FormPkRule = FormPkRule

-- 发送减少罪恶值物品的id
function FormPkRule.getReduceEvilItemId(player)
    if player and PkRule_GoodAndEvil then
        PkRule_GoodAndEvil.getReduceEvilItemId(player)
    end
    return ""
end

-- 取反 是否能发起PK的值
--function FormPkRule.NegateIsCanPkValue(player)
--    if player and PkRule_GoodAndEvil then
--        PkRule_GoodAndEvil.NegateIsCanPkValue(player)
--    end
--    return ""
--end

-- 发起PK
function FormPkRule.joinFight(player,guid)
    if player and guid then
        if IntegralTower and IntegralTower.CheckPlayerJoin(player) then
            IntegralTower.StartPVPFight(player,guid)
            return ""
        end
        if GuildConspire then
            if GuildConspire.CheckPK(player, guid) then
                GuildConspire.StartPVPFight(player,guid)
                return ""
            end
            if GuildConspire.CheckInTask(player) then
                return ""
            end
        end
		if Act_CrossServer and Act_CrossServer.CheckPlayerJoin(player) then
            if player:GetMap():GetKeyName() == Act_CrossSConfig.MapKeyName then
                Act_CrossServer.StartPvPFight(player, guid)
                return ""
            end
        end

        if PkRule_GoodAndEvil then
            PkRule_GoodAndEvil.joinFight(player,guid)
        end
    end
    return ""
end

-- 使用减少善恶值物品 type 1 使用一个 2 减少全部
function FormPkRule.useReduceEvilItem(player,Type,itemId)
    local itemIds = {20984}
    if player and Type and itemId then

        if player:GetPk() >= 0 then
            sLuaApp:NotifyTipsMsg(player,"无需清空善恶值")
            return ""
        end

        itemId = tonumber(itemId)
        if itemId == nil then
            -- 如果无法转换为数字
            sLuaApp:NotifyTipsMsg(player,"数据错误")
            return ""
        end

        local exist = false
        for k,v in ipairs(itemIds) do
            if itemId == v then
                exist = true
                break
            end
        end
        if not exist then
            -- 如果物品表中不存在此物品
            sLuaApp:NotifyTipsMsg(player,"数据错误")
            return ""
        end

        if Type == "1" and PkRule_GoodAndEvil then
            PkRule_GoodAndEvil.useReduceEvilItem1(player,itemId)
        elseif Type == "2" then
            PkRule_GoodAndEvil.useReduceEvilItem2(player,itemId)
        else
            sLuaApp:NotifyTipsMsg(player,"数据错误")
        end
    end
    return ""
end

-- 移动到长安城-御前统领处
function FormPkRule.gotoNegatePkSwitchNpc(player)
    -- 判断等级
    if not MainUISwitch.CheckOpenLevel(player,"PK") then
        return ""
    end
    Lua_tools.MoveToNpc(player, 20063)
    return ""
end

-- 设置快速PK值
--FormPkRule._fast_pk_tab = {}
-- 0 false 1 true
function FormPkRule.setIsFastPk(player,fastPk)
    if fastPk and (fastPk == "0" or fastPk == "1") then
        if fastPk == "0" then
            player:SetInt("FormPkRule_IsFastPk",0)
        elseif fastPk == "1" then
            player:SetInt("FormPkRule_IsFastPk",1)
        end
        if player:GetInt("FormPkRule_IsFastPk") == 1 then
            sLuaApp:NotifyTipsMsg(player,"开启快速Pk成功")
        else
            sLuaApp:NotifyTipsMsg(player,"关闭快速Pk成功")
        end
    else
        sLuaApp:LuaDbg("设置快速PK值时传入参数错误")
        sLuaApp:NotifyTipsMsg(player,"系统错误")
    end
    return ""
end

-- 获取快速PK值
function FormPkRule.getIsFastPk(player)
    local IsFastPk = false
    if player:GetInt("FormPkRule_IsFastPk") == 1 then
        IsFastPk = true
    end
    local str = [[
        GlobalProcessing.IsQuicklyPK = ]]..tostring(IsFastPk)..[[
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return ""
end

-- 发送当前位置是否能PK给客户端
function FormPkRule.getIsCanPKMap(player)
    --sLuaApp:LuaDbg("发送当前位置是否能PK")
    -- 判断地图
    local x = sMapSystem:GetPosX(player)
    local y = sMapSystem:GetPosY(player)
    local map = player:GetMap()
    local isPkMap = map:TestGridType(x,y,4) -- @param type 逻辑个类型(2=跳转点 3=竞技区 4=PK区 5=NPC禁刷区 6=安全区)

    local str = [[
       RoleClickPopMenu.IsPKOrAthleticsPlace = ]]..tostring(isPkMap)..[[
       RoleClickPopMenu.OnRevisionInfo()
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return ""
end