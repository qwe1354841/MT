--长安城PK申请人
local PkRuleNPC = {}
_G.PkRuleNPC = PkRuleNPC
--大于等于该值的为善人，小于为恶人
PkRuleNPC.PkValue = 0

function PkRuleNPC.main(npc, player)

    if player:GetPkSwitch() then
        player:AddNpcOption(npc, 0 , "关闭PK开关", "NegatePkSwitch", "")
    else
        player:AddNpcOption(npc, 0 , "开启PK开关", "NegatePkSwitch", "")
    end

    player:AddNpcOption(npc, 0 , "领取善恶值称号", "getPKTitle", "")

    player:AddNpcOption(npc,0,"查看我的善恶值","SeePkValue","")

    player:AddNpcOption(npc, 0 , "我错了，我要令牌赎罪", "openUseReducePkValueItemUI", "")
    player:AddNpcOption(npc, 0 , "PK开关说明", "PkDescription", "")

    return ""
end

-- 开启或关闭PK开关
function PkRuleNPC.NegatePkSwitch(npc, player, str)
    if player and PkRule_GoodAndEvil then
        return PkRule_GoodAndEvil.NegateIsCanPkValue(player)
    end
    return ""
end

-- 领取善恶值称号
function PkRuleNPC.getPKTitle(npc,player,str)
    if player then
        player:AddNpcOption(npc, 0 , "领取善恶值称号", "getPKTitle1", "")
        return "善恶值曾达到-100、-500、-2000时，分别可领取永久称号：恶贯满盈、穷凶极恶、罪恶滔天。\n善恶值曾达到100、500、2000时，分别可领取永久称号：除暴安良、行侠仗义、侠之大者。"
    end
end


local titleGoodValue = {{["PKValue"]=100,["titleId"]=534},{["PKValue"]=500,["titleId"]=535},{["PKValue"]=2000,["titleId"]=536}}
local titleEvilValue = {{["PKValue"]=-100,["titleId"]=531},{["PKValue"]=-500,["titleId"]=532},{["PKValue"]=-2000,["titleId"]=533}}
function PkRuleNPC.getPKTitle1(npc,player,str)
    -- 获取正向最大值
    local MaxGoodValue = player:GetInt("MaxGoodValue")
    -- 获取负向最大值
    local MaxEvilValue = player:GetInt("MaxEvilValue")

    local isGetTitle = false
    -- 判断正向是否能获取称号
    if not MaxGoodValue or MaxGoodValue == 0 then
        goto jump1
    end
    for k,v in ipairs(titleGoodValue) do
        if MaxGoodValue >= v.PKValue then
            -- 判断当前称号是否已拥有
            if not sTitleSystem:HasTitle(player,v.titleId) then
                -- 如果没有则获取此称号
                sTitleSystem:AddTitleEx(player,v.titleId,0)
                local name = TitleConfig.GetById(v.titleId).KeyName
                sLuaApp:NotifyTipsMsg(player,"已获取"..name)
                isGetTitle = true
            end
        else
            -- 减少运算量
                break
        end
    end
    ::jump1::
    if not MaxEvilValue or MaxEvilValue == 0 then
        goto jump2
    end
    -- 判断负向是否能获取称号
    for k,v in ipairs(titleEvilValue) do
        if MaxEvilValue <= v.PKValue then
            -- 判断当前称号是否已拥有
            if not sTitleSystem:HasTitle(player,v.titleId) then
                -- 如果没有则获取此称号
                sTitleSystem:AddTitleEx(player,v.titleId,0)
                local name = TitleConfig.GetById(v.titleId).KeyName
                sLuaApp:NotifyTipsMsg(player,"已获取"..name)
                isGetTitle = true
            end
        else
                break
        end
    end
    ::jump2::
    -- 如果没有可以领取的称号的时候
    if isGetTitle then
        return "您已经领取了当前所有符合条件的善恶值称号，请前往称号界面查看"
    else
        return "您没有可以领取的善恶值称号"
    end
end
-- 忏悔任务
--function PkRuleNPC.Repent(npc,player,str)
--	return ""
--end

-- 查看善恶值
function PkRuleNPC.SeePkValue(npc,player,str)
    local pk = player:GetPk()
	local str = ""
	if pk >= PkRuleNPC.PkValue then
		str = [[GlobalUtils.ShowServerBoxMessage1Btn("你的善恶值为 <color=#16e2abff>]]..tostring(pk)..[[</color>")]]
	elseif pk < PkRuleNPC.PkValue then
		str = [[GlobalUtils.ShowServerBoxMessage1Btn("你的善恶值为 <color=#FF0000ff>]]..tostring(pk)..[[</color>")]]
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

-- 我错了，要赎罪
function PkRuleNPC.openUseReducePkValueItemUI(npc,player,str)
    sLuaApp:ShowForm(player,"脚本表单","GUI.OpenWnd('ClearGoodAndEvilValuesUI','NPC')")
    return ""
end
-- PK描述
function PkRuleNPC.PkDescription(npc,player,str)
    return "1.开启PK开关后可以在PK地图任意PK玩家\n2.主动PK非红名玩家会增加善恶值\n3.任意红名玩家都可以被任意玩家攻击\n4.击杀红名玩家可以增加善恶值\n5.玩家等级达到20级才能开启PK开关"
end