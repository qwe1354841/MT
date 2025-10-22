--pk规则及善恶值玩法
PkRule_GoodAndEvil = {}
PkRule_GoodAndEvil.FightGoodTag = 10009 -- 任意对善 战斗回调Tag
PkRule_GoodAndEvil.FightEvilTag = 10010 -- 善对恶  战斗回调Tag
PkRule_GoodAndEvil.FightTag = 10011 -- 恶对恶
local NEGATIVE_MULTIPLE = -20 -- 任意 对 善方 战斗结束后扣除善恶值的系数
local POSITIVE_MULTIPLE = 20 -- 善 对 恶方 战斗结束后增加善恶值的系数
local LIMIT_VALUE = 20 -- 善对恶 目标方善恶值小于0的目标 所加善恶值的上限
PkRule_GoodAndEvil.DayLimit = 100 -- PK距离
-- 是否开启善恶值清零规则 代理可配 开启true 关闭nil
PkRule_GoodAndEvil.isReduceToZero = true
-- 向对方发起pk时间间隔 为防止恶意pk (秒)
PkRule_GoodAndEvil.evil_pk_time_interval = 0
--Pk不满足条件的提示
--1、单人优先判断等级，其次判断是否安全区，最后判断是否开启pk开关。
--（1）玩家等级不足，系统提示：无法进入pk战斗，您的等级不足$等级数值$级。
--（2）玩家位于非pk地图，系统提示：无法进入pk战斗，您处于安全区内。
--（3）玩家没开pk开关：无法进入pk战斗，您未开启pk开关。

--2、多人优先判断等级，其次判断是否安全区，最后判断是否开启pk开关。
--（1）队伍中有人等级不足，系统提示给队长：无法进入pk战斗，队伍成员$成员名称$等级不足$等级数值$级。
--（有多个不足的提示一个就行，队长本人不足，提示为"无法进入pk战斗，您的等级不足$等级数值$级。"）
--（2）队伍位于非pk地图，系统提示队长：无法进入pk战斗，您处于安全区内。
--（3）队伍中有人没开pk开关：无法进入pk战斗，队伍成员$成员名称$未开启pk开关。
--（有多个未开启的提示一个就行，队长本人未开启，提示为"无法进入pk战斗，您未开启pk开关。"）
local limitLevel = 20 -- 限制等级
local selfIsCanPk = function (player,isLeader,isNeedJudgePkWitch,leader)
    local name = VipIngotTrace.GetPlayerName(player)
    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    -- 判断等级
    if level < limitLevel then
        if isLeader then
            sLuaApp:NotifyTipsMsg(player,"无法进入pk战斗，您的等级不足".. limitLevel .."级")
        else
            if leader then
                sLuaApp:NotifyTipsMsg(leader,"无法进入pk战斗，队伍成员".. name .."等级不足".. limitLevel .."级")
            else
                sLuaApp:LuaDbg("判断我方是否能PK时，传入我方队长为空")
                sLuaApp:NotifyTipsMsg(player, '系统错误')
            end
        end
        return false
    end
    -- 判断地图
    local x = sMapSystem:GetPosX(player)
    local y = sMapSystem:GetPosY(player)
    local map = player:GetMap()
    local isPkMap = map:TestGridType(x,y,4) -- @param type 逻辑个类型(2=跳转点 3=竞技区 4=PK区 5=NPC禁刷区 6=安全区)
    if not isPkMap then
        sLuaApp:NotifyTipsMsg(player,"当前位置无法发起PK")
        return false
    end

    -- 如果敌人是红名 无需判断开启PK开关
    if isNeedJudgePkWitch and isNeedJudgePkWitch == true then
        return true
    end
    -- 判断是否开启pk
    local canPk = player:GetPkSwitch()
    if not canPk then
        if isLeader then
            sLuaApp:NotifyTipsMsg(player,"无法进入pk战斗，您未开启pk开关")
        else
            if leader then
                sLuaApp:NotifyTipsMsg(leader,"无法进入pk战斗，队伍成员["..name.."]未开启pk开关")
            else
                sLuaApp:LuaDbg("判断我方是否能PK时，传入我方队长为空")
            end
        end
        return false
    end
    return true
end
-- 判断目标是否满足战斗需求
local targetIsCanPk = function (player,target)

    local level = target:GetAttr(ROLE_ATTR_LEVEL)
    if level < limitLevel then
        sLuaApp:NotifyTipsMsg(player,"目标等级不足，无法被攻击")
        return false
    end

    -- 如果有队伍判断队员
    local team = target:GetTeam()
    if team then
        local teamMembers = team:GetTeamMembers(false)
        for k,v in pairs(teamMembers) do
            local level = v:GetAttr(ROLE_ATTR_LEVEL)
            local name = v:GetName()
            if level < limitLevel then
                sLuaApp:NotifyTipsMsg(player,"目标队员"..name.."等级不足，无法被攻击")
                return false
            end
        end
    end

    return true
end

-- 判断善恶值是否大于等于0
local goodAndEvilMoreThanOrEqualsZero = function (player)
    -- 判断是否有队伍
    local team = player:GetTeam()
    if team ~= nil then

        -- 如果已组队，却是暂离状态
        if player:IsTempLeave() then
            -- 判断善恶值是否大于等于0
            if player:GetPk() < 0 then
                return false
            else
                return true
            end
        end

        -- 队伍成员
        local members = team:GetTeamMembers(false)
        -- 遍历判断善恶值是否全大于等于0
        local isMoreThanOrEqualsZero = true
        for k,v in pairs(members) do
            if v:GetPk() >= 0 then
                isMoreThanOrEqualsZero = isMoreThanOrEqualsZero and true
            else
                isMoreThanOrEqualsZero = false
                return false
            end
        end
        return isMoreThanOrEqualsZero
    else -- 如果没有组队 是单人
        local pkValue = player:GetPk()
        if pkValue < 0 then
            return false
        else
            return true
        end
    end
end

-- 进入战斗判断条件
local isJoinFight = function (player,target)
    local team = player:GetTeam() -- 获取玩家队伍

    local distance = player:GetDistance(target)
    if distance < 0 or distance > PkRule_GoodAndEvil.DayLimit then
        sLuaApp:NotifyTipsMsg(player,"对方距离太远，无法进入切磋")
        return false
    end

    if player:IsFightState() then
        sLuaApp:NotifyTipsMsg(player,"无法发起切磋，您已经在战斗中")
        return false
    end

    if target:IsFightState() then
        sLuaApp:NotifyTipsMsg(player,"无法发起切磋，对方已经在战斗中")
        return false
    end

    if player:GetAttr(ROLE_ATTR_IS_VIEW)  == 1 then
        sLuaApp:NotifyTipsMsg(player,"无法发起切磋，您在观战中")
        return false
    end

    if target:GetAttr(ROLE_ATTR_IS_VIEW)  == 1 then
        sLuaApp:NotifyTipsMsg(player,"无法发起切磋，对方在观战中")
        return false
    end

    -- 判断敌方是否是红名
    local isNeedJudgePkWitch = false
    isNeedJudgePkWitch = not goodAndEvilMoreThanOrEqualsZero(target)

    -- 判断目标等级是否足够
    if not targetIsCanPk(player,target) then
        return false
    end
    -- 判断是单人还是组队
    if team == nil then
        return selfIsCanPk(player,true,isNeedJudgePkWitch,player)
    else
        -- 如果是未离队，且不是队长，无法发起pk
        if not player:IsTempLeave() then
            if  player:IsTeamMember() then
                sLuaApp:NotifyTipsMsg(player,"您不是队长，无法发起PK")
                return false
            end
            -- 如果是离队的成员
        else
            -- 包含离队的队员
            local teamMembers = team:GetTeamMembers(true)
            for k, v in pairs(teamMembers) do
                if v:GetGUID() == target:GetGUID() then
                    sLuaApp:NotifyTipsMsg(player,"无法对同队伍成员进行攻击")
                    return false
                end
            end
            -- 队长无法离队，所以必定是队员, 但是暂离队员相当于自己是队长
            return selfIsCanPk(player,true,isNeedJudgePkWitch,player)
        end

        local teamMembers = team:GetTeamMembers(false) -- 不包含暂离的队员
        local canPk = true
        for k,v in pairs(teamMembers) do
            if k == 1 then
                canPk = canPk and  selfIsCanPk(v,true,isNeedJudgePkWitch,player)
            else
                canPk = canPk and selfIsCanPk(v,false,isNeedJudgePkWitch,teamMembers[1])
            end
            if v:GetGUID() == target:GetGUID() then
                sLuaApp:NotifyTipsMsg(player,"无法对同队伍成员进行攻击")
                return false
            end
            if not canPk then
                return false
            end
        end
        return canPk
    end

end


-- 减少善恶值
local reducePkValue = function(player)
    local reduceValue = 5

    -- 获取正向PK最大值
    local MaxGoodValue = player:GetInt("MaxGoodValue")
    if not MaxGoodValue then
        player:SetInt("MaxGoodValue",0)
        MaxGoodValue = 0
    end
    -- 获取负向PK最大值
    local MaxEvilValue = player:GetInt("MaxEvilValue")
    if not MaxEvilValue then
        player:SetInt("MaxEvilValue",0)
        MaxEvilValue = 0
    end

    local pkValue = player:GetPk()
    if pkValue > 0 then
        if PkRule_GoodAndEvil.isReduceToZero then
            if not player:SubPk(pkValue+reduceValue,"system","减少善恶值","发起方对善方进行PK，发起方善恶值大于0，罪恶值归零后减5") then
                sLuaApp:LuaDbg("对善方发起PK时，减少发起方善恶值失败,发起方为善减少到0，再减5")
                sLuaApp:NotifyTipsMsg(player,"系统错误")
                return ""
            else
                sLuaApp:NotifyTipsMsg(player,"您主动发起了PK，善恶值减少到"..-reduceValue.."点")
                -- 判断善恶值最大值
                if MaxEvilValue > -reduceValue then
                    MaxEvilValue = -reduceValue
                    player:SetInt("MaxEvilValue",-reduceValue)
                end
            end
        else
            if not player:SubPk(reduceValue,"system","减少善恶值","发起方对善方进行PK，发起方善恶值大于零，因开启不归零配置,善恶值只减5") then
                sLuaApp:LuaDbg("对善方发起PK时，减少发起方善恶值失败,发起方为善,开启了不归零配置，减5点善恶值")
                sLuaApp:NotifyTipsMsg(player,"系统错误")
                return ""
            else
                sLuaApp:NotifyTipsMsg(player,"您主动发起了PK，善恶值减少"..reduceValue.."点")
                -- 判断善恶值最大值
                local v = pkValue - reduceValue
                if MaxEvilValue > v then
                    MaxEvilValue = v
                    player:SetInt("MaxEvilValue",v)
                end
            end
        end
    else
        if not player:SubPk(reduceValue,"system","减少善恶值","发起方对善方进行PK，发起方善恶值小于或等于零，善恶值减5") then
            sLuaApp:LuaDbg("对善方发起PK时，减少发起方善恶值失败")
            sLuaApp:NotifyTipsMsg(player,"系统错误")
            return ""
        else
            -- 判断善恶值最大值
            local value = pkValue - reduceValue
            sLuaApp:NotifyTipsMsg(player,"您主动发起了PK，善恶值减少到"..value.."点")
            if MaxEvilValue > value then
                MaxEvilValue = value
                player:SetInt("MaxEvilValue",value)
            end
        end
    end
end

-- 封装开始PK，减少代码量
function PkRule_GoodAndEvil.goPK(player,target,targetTeam,FightTag)
    -- 判断是否组队
    if targetTeam then
        local targetTeamLeader =  targetTeam:GetTeamLeader() -- 敌对队长
        -- 如果是组队，找到队长
        if targetTeamLeader then
            -- 判断是否满足发起时间间隔
            local last_pk_time = targetTeamLeader:GetInt('PkRule_GoodAndEvil_last_pk_time')
            local cur_time = sLuaApp:SecondSinceEpoch(0)
            local sub_time = cur_time - last_pk_time
            if sub_time > PkRule_GoodAndEvil.evil_pk_time_interval then
                sFightSystem:StartTagPVP(player,targetTeamLeader,FightTag,"","","")
            else
                sLuaApp:NotifyTipsMsg(player,"无法发起PK，"..'对方正在PK保护期内')
                return false
            end
        else
            sLuaApp:NotifyTipsMsg(player,"无法发起PK，找不到对方队长")
            return false
        end
    else -- 如果没组队，向目标发起PK
        local last_pk_time = target:GetInt('PkRule_GoodAndEvil_last_pk_time')
        local cur_time = sLuaApp:SecondSinceEpoch(0)
        -- 据上次PK经过了多长时间
        local sub_time = cur_time - last_pk_time
        if sub_time > PkRule_GoodAndEvil.evil_pk_time_interval then
            sFightSystem:StartTagPVP(player,target,FightTag,"","","")
        else
            sLuaApp:NotifyTipsMsg(player,"无法发起PK，"..'对方正在PK保护期内')
            return false
        end
    end
end

-- 发起PK
function  PkRule_GoodAndEvil.joinFight(player,guid)
    if player == nil then
        sLuaApp:LuaDbg("PK时传入的player为空")
        sLuaApp:NotifyTipsMsg(player, '系统错误')
        return ""
    end

    local guid = tonumber(guid)
    if guid == nil then
        sLuaApp:LuaDbg("PK目标GUID转换为数字失败")
        sLuaApp:NotifyTipsMsg(player, '系统错误')
        return ""
    end

    if player:GetGUID() == guid then
        sLuaApp:NotifyTipsMsg(player, '无法对自己发起PK')
        return ''
    end

    local target = sPlayerSystem:GetPlayerByGUID(guid)
    if target == nil then
        sLuaApp:LuaDbg("通过PK目标GUID获取到对象失败")
        sLuaApp:NotifyTipsMsg(player,"找不到切蹉目标")
        return ""
    end

    local targetTeam = target:GetTeam()

    -- 判断是否能进行PK
    if not isJoinFight(player,target) then
        return ""
    else
        -- 需要调用其战斗惩罚函数，如果没有则引入
        if not PlayerFightEnd then require 'PlayerFightEnd' end

        -- 如果目标方的善恶值都大于等于0  任意 对 善 发起PK
        if goodAndEvilMoreThanOrEqualsZero(target) then
            -- 判断PK是否发起失败 如果失败就不扣除善恶值
            if PkRule_GoodAndEvil.goPK(player,target,targetTeam,PkRule_GoodAndEvil.FightGoodTag) == false then
                return ''
            end
            -- 获取发起方的善恶值，如果发起方本身大于0，则先置为0，再扣5点
            local team = player:GetTeam()
            if team ~= nil then
                -- 判断是否是暂离
                if player:IsTempLeave() then
                    reducePkValue(player)
                else
                    -- 获取队伍所有成员
                    local teamMembers = team:GetTeamMembers(false)
                    for k,v in pairs(teamMembers) do
                        reducePkValue(v)
                    end

                end
                -- 如果是单人
            else
                reducePkValue(player)
            end

        else -- 如果目标方的善恶值有小于0
            -- 判断发起方善恶值都大于等于0
            if goodAndEvilMoreThanOrEqualsZero(player) then -- 善方 对 恶方 发起PK
                PkRule_GoodAndEvil.goPK(player,target,targetTeam,PkRule_GoodAndEvil.FightEvilTag)

                -- 发起方队伍有善恶值小于0  恶方 对 恶方 发起PK
            else
                -- 战斗回调 只需要控制战斗惩罚，无需修改善恶值
                PkRule_GoodAndEvil.goPK(player,target,targetTeam,PkRule_GoodAndEvil.FightTag)

            end
        end
    end

end

-- 战斗结束回调函数 目标为善方
function PkRule_GoodAndEvil.OnTargetGoodTag(player, is_win,targetDieCount,evilLessCount,initiate)
    -- initiate 判断是否是发起方 1为发起方友方 2为发起方敌方

    -- 如果是逃跑或平局
    if is_win == 3 or is_win == 4 then
        return
    end
    -- 如果是胜利
    -- 发起方扣除善恶值= -20 * 目标队伍死亡人数
    if initiate == 1 and is_win == 2 then -- 1:失败 2:胜利 3:逃跑 4:平局
        local value = tonumber(-NEGATIVE_MULTIPLE * targetDieCount)
        if value > 0 then
            if not player:SubPk(value,"system","战斗胜利计算善恶值","目标方为善方，扣除善恶值") then
                sLuaApp:LuaDbg("目标方为善方，战斗胜利，减少善恶值失败")
                sLuaApp:NotifyTipsMsg(player,"系统错误")
                return false
            else
                sLuaApp:NotifyTipsMsg(player,"战斗胜利，善恶值减少"..value.."点")
                -- 获取负向最大值
                local MaxEvilValue = player:GetInt("MaxEvilValue")
                if MaxEvilValue then
                    local pkValue = player:GetPk()
                    if MaxEvilValue > pkValue then
                        MaxEvilValue = pkValue
                        player:SetInt("MaxEvilValue",pkValue)
                    end
                else
                    sLuaApp:LuaDbg("PK战斗回调，计算善恶值负向最大值时，获取负向最大值为空")
                end
            end
        end
    end

    if is_win == 1  then
        if player:GetPk() < 0 then
            -- 战斗惩罚 善恶值小于0
            PlayerFightEnd.combatPunishment(player,201)
        else
            -- 善恶值大于或等于0
            PlayerFightEnd.combatPunishment(player,2)
        end
    end

end

-- 善 对 恶
function PkRule_GoodAndEvil.OnTargetEvilTag(player, is_win,targetDieCount,evilLessCount,initiate)
    -- 逃跑不会结束战斗，如果已死亡就不能逃跑
    -- 如果是逃跑或平局
    if is_win == 3 or is_win == 4 then
        return
    end

    if is_win == 2 then -- 战斗胜利
        -- 发起方加善恶点= 20 * 死亡目标善恶值小于0的个数；
        if initiate == 1 then
            local value = POSITIVE_MULTIPLE * evilLessCount
            if value > 0 then
                if not player:AddPk(value,"system","战斗胜利计算善恶值","目标方为恶方，增加善恶值") then
                    sLuaApp:LuaDbg("善对恶，战斗胜利，善方增加善恶值失败")
                    sLuaApp:NotifyTipsMsg(player,"系统错误")
                    return false
                else
                    sLuaApp:NotifyTipsMsg(player,"战斗胜利，善恶值增加"..value.."点")
                    local MaxGoodValue = player:GetInt("MaxGoodValue")
                    if MaxGoodValue then
                        local pkValue = player:GetPk()
                        if pkValue > MaxGoodValue then
                            MaxGoodValue = pkValue
                            player:SetInt("MaxGoodValue",pkValue)
                        end
                    else
                        sLuaApp:LuaDbg("战斗回调，计算善恶值正向最大值时，获取善恶值正向最大值为空")
                    end
                end
            end
        end
    end
    if is_win == 1 then -- 战斗失败
        -- 目标方善恶值小于0的目标，加min(20,该目标善恶值的绝对值)点善恶值
        if initiate == 2 then
            local pkValue = player:GetPk()
            if pkValue < 0 then
                local addValue = math.min(LIMIT_VALUE,-(pkValue))
                if not player:AddPk(addValue,"system","战斗失败计算善恶值","恶方被善方打败，增加善恶值") then
                    sLuaApp:LuaDbg("善对恶，恶方战斗失败，恶方增加善恶值失败")
                    sLuaApp:NotifyTipsMsg(player,"系统错误")
                    return false
                else
                    sLuaApp:NotifyTipsMsg(player,"战斗失败，善恶值增加"..addValue.."点")
                end
            end
        end

        if player:GetPk() < 0 then
            -- 战斗惩罚 善恶值小于0
            PlayerFightEnd.combatPunishment(player,201)
        else
            -- 善恶值大于或等于0
            PlayerFightEnd.combatPunishment(player,2)
        end

    end
end

-- 恶对恶
function PkRule_GoodAndEvil.OnTargetTag(player, is_win)
    if is_win == 1  then
        if player:GetPk() < 0 then
            -- 战斗惩罚 善恶值小于0
            PlayerFightEnd.combatPunishment(player,201)
        else
            -- 善恶值大于或等于0
            PlayerFightEnd.combatPunishment(player,2)
        end
    end
end

-- 取反 是否能发起PK的值
function PkRule_GoodAndEvil.NegateIsCanPkValue(player)
    -- 消耗银币
    -- 判断人物等级，如果低于20级，就不能开启
    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < limitLevel then
        sLuaApp:NotifyTipsMsg(player,"开启失败，请达到"..limitLevel.."级再来开启")
        return ""
    end
    -- 取反其值
    local IsCanPkValue = player:GetPkSwitch()
    -- 判断人物PK值 如果小于0 则无法关闭PK开关
    local pkValue = player:GetPk()
    if pkValue < 0 and IsCanPkValue then
        return "您的PK值低于0，无法关闭PK开关"
    end

    if not player:SetPkSwitch(not IsCanPkValue) then
        sLuaApp:LuaDbg("取反PK值失败")
    else
        local str = "开启"
        if IsCanPkValue then
            str = "关闭"
        else
            str = "开启"
        end
        sLuaApp:NotifyTipsMsg(player,"您"..str.."PK开关")
    end
    return ""
end

--  添加定时器，每15分钟减少1点罪恶值, 以及将善恶值小于0的玩家开启PK开关
 -- 多少分钟
PkRule_GoodAndEvil.TIME = 15
-- 减少多少罪恶值
PkRule_GoodAndEvil.SUB_EVIL_VALUE = 1
function PkRule_GoodAndEvil.ReduceEvilTimer(player,timer_Guid,param)
    if player == nil then
        return
    end
    -- 如果当前罪恶值小于0 ,则减少罪恶值
    local evilValue = player:GetPk()
    if evilValue < 0 then
        if not player:AddPk(PkRule_GoodAndEvil.SUB_EVIL_VALUE,"system","定时器减少罪恶值","定时器每"..PkRule_GoodAndEvil.TIME.."分钟".."减少"..PkRule_GoodAndEvil.SUB_EVIL_VALUE.."点罪恶值") then
            sLuaApp:LuaDbg("定时器减少罪恶值失败")
        else
            sLuaApp:NotifyTipsMsg(player,"由于您持续在线，恢复了1点善恶值")
        end
    end
end

function PkRule_GoodAndEvil.addReduceEvilTimer(player)
    if not sLuaTimerSystem:AddTimerEx(player, PkRule_GoodAndEvil.TIME * 60 * 1000,-1,"PkRule_GoodAndEvil.ReduceEvilTimer", "") then
        sLuaApp:LuaDbg("添加每15分钟增加1点善恶值定时器失败")
    end
    return ""
end


-- 发送减少罪恶值物品的id
function PkRule_GoodAndEvil.getReduceEvilItemId(player)
    local str = [[
       ClearGoodAndEvilValuesUI.ReduceEvilItemId  =]].. 20984 ..[[
       ClearGoodAndEvilValuesUI.SetClearBeevilInfo(]].. 20984 .. [[)
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return ""
end


-- 使用减少罪恶值的物品
-- 使用单个物品
function PkRule_GoodAndEvil.useReduceEvilItem1(player,itemId)
    -- 每个物品减少的罪恶值
    local reduceEvilValue = 10
    -- 判断物品是否存在
    local amount = sItemSystem:GetItemAmount(player,itemId,3)
    if amount <= 0 then
        -- 弹出一键购买
        OneKeyBuy.Main(player,{"免责令牌",1})
        return ''
    end
    -- 消耗物品 先绑后非绑
    if sItemSystem:ConsumeItemWithId(player, itemId, 1, 2, "system",
            "事务操作：善恶值系统", "使用物品减少罪恶值"..itemId) ~= 0 then

        if sItemSystem:ConsumeItemWithId(player, itemId, 1, 1, "system",
                "事务操作：善恶值系统", "使用物品减少罪恶值"..itemId) ~= 0 then
            sLuaApp:LuaDbg("消耗非绑定材料失败,物品为"..itemId)
            return ''
        end

    end
    -- 减少罪恶值  最高减少到0
    local pkValue = player:GetPk()
    if pkValue <= -10 then

        if not player:AddPk(reduceEvilValue,"system","使用物品减少罪恶值","使用物品减少罪恶值") then
            sLuaApp:NotifyTipsMsg(player,"系统错误，善恶值增加失败")
            sLuaApp:LuaDbg("使用物品减少罪恶值时失败")
            if Lua_tools.GetBagFree(player) > 0 then
                sItemSystem:AddItemEx(player, itemId,1,2, "system", "添加减少善恶值物品",
                        "减少善恶值时失败，将物品返还")
            else
                -- 发送邮件
                if sMailSystem:SendMail(0,"系统邮件",player:GetGUID(),1,"物品返还","使用增加善恶值的物品失败，返还物品","",{itemId,1}) ~= 0 then
                    sLuaApp:LuaDbg("发送返还增加善恶值物品失败")
                end
            end
        else
            pkValue = player:GetPk()
            sLuaApp:NotifyTipsMsg(player,"您增加了".. reduceEvilValue .."点善恶值，当前善恶值为"..pkValue)
        end
    elseif pkValue > -10 and pkValue < 0 then
        -- 减少小于10的罪恶值
        if not player:AddPk(-pkValue,"system","使用物品减少罪恶值","使用物品减少罪恶值") then
            sLuaApp:NotifyTipsMsg(player,"系统错误，善恶值减少失败")
            sLuaApp:LuaDbg("使用物品减少善恶值时失败")
            if Lua_tools.GetBagFree(player) > 0 then
                sItemSystem:AddItemEx(player, itemId,1,2, "system", "添加减少善恶值物品",
                        "减少善恶值时失败，将物品返还")
            else
                -- 发送邮件
                if sMailSystem:SendMail(0,"系统邮件",player:GetGUID(),1,"物品返还","使用增加善恶值的物品失败，返还物品","",{itemId,1}) ~= 0 then
                    sLuaApp:LuaDbg("发送返还增加善恶值的物品失败")
                end
            end
        else
            --pkValue = player:GetPk()
            sLuaApp:NotifyTipsMsg(player,"您增加了".. -pkValue .."点善恶值，当前善恶值为"..player:GetPk())
        end
    else
        sLuaApp:NotifyTipsMsg(player,"无需清空善恶值")
    end
end
-- 使用多个物品
function PkRule_GoodAndEvil.useReduceEvilItem2(player,itemId)
    local reduceEvilValue = 10  -- 每个物品减少的罪恶值
    -- 判断物品是否存在
    local amount = sItemSystem:GetItemAmount(player,itemId,3) -- 当期物品数量
    local pkValue = player:GetPk() -- 当前的善恶值
    if pkValue >= 0 then
        sLuaApp:NotifyTipsMsg(player,"无需清空善恶值")
        return ''
    end
    -- 算出需要使用多少个
    local useAmount = math.ceil(-pkValue / reduceEvilValue)

    -- 如果物品不足，使用一键购买
    if useAmount > amount then
        local diff = useAmount - amount
        OneKeyBuy.Main(player,{"免责令牌",diff})
        return ''
    end
    local value = useAmount * reduceEvilValue
    if value > -pkValue then
        value = -pkValue
    elseif value < -pkValue then
        sLuaApp:LuaDbg("消耗物品增加善恶值，物品数量计算错误")
        sLuaApp:NotifyTipsMsg(player,"系统错误")
    end
    if useAmount > 0 and useAmount <= amount then
        -- 消耗物品
        if sItemSystem:ConsumeItemWithId(player, itemId, useAmount, 3, "system",
        "事务操作：善恶值系统", "使用物品减少罪恶值"..itemId) ~= 0 then

            sLuaApp:LuaDbg("消耗材料失败,物品为"..itemId)
            return ''
        end
        -- 减少罪恶值
        if not player:AddPk(value,"system","使用物品减少罪恶值","使用物品减少罪恶值") then
            sLuaApp:NotifyTipsMsg(player,"系统错误，善恶值减少失败")
            sLuaApp:LuaDbg("使用物品减少善恶值时失败")
            if Lua_tools.GetBagFree(player) > 0 then
                sItemSystem:AddItemEx(player, itemId,useAmount,2, "system", "添加减少善恶值物品",
                        "减少善恶值时失败，将物品返还")
            else
                -- 发送邮件
                if sMailSystem:SendMail(0,"系统邮件",player:GetGUID(),1,"物品返还","使用减少善恶值物品失败，返还物品","",{itemId,useAmount}) ~= 0 then
                    sLuaApp:LuaDbg("发送返还减少善恶值物品失败")
                end
            end
        else
            --pkValue = player:GetPk()
            sLuaApp:NotifyTipsMsg(player,"您增加了".. pkValue .."点善恶值，当前善恶值为"..player:GetPk()) -- 2021-9-1 useAmount * reduceEvilValue
        end
    end
end

-- 创建新角色，玩家首次登陆时，为此角色添加善恶值最大值自定义变量
function PkRule_GoodAndEvil.addMaxPkValueVariable(player)
    -- 获取正向PK最大值
    local MaxGoodValue = player:GetInt("MaxGoodValue")
    if not MaxGoodValue then
        player:SetInt("MaxGoodValue",0)
    end
    -- 获取负向PK最大值
    local MaxEvilValue = player:GetInt("MaxEvilValue")
    if not MaxEvilValue then
        player:SetInt("MaxEvilValue",0)
    end
end

-- 通过gm命令@sa 83 number 修改PK值后，并没有修改人物身上的PK最值，导致无法领取称号
function PkRule_GoodAndEvil.update_max_pk(player)
    -- 获取正向PK最大值
    local MaxGoodValue = player:GetInt("MaxGoodValue")
    -- 获取负向PK最大值
    local MaxEvilValue = player:GetInt("MaxEvilValue")
    -- 获取当前玩家PK值
    local pkValue = player:GetPk()
    if pkValue > MaxGoodValue and pkValue > 0 then
        player:SetInt("MaxGoodValue", pkValue)
    end
    if pkValue < MaxEvilValue and pkValue < 0 then
        player:SetInt("MaxEvilValue", pkValue)
    end
    return ''
end
