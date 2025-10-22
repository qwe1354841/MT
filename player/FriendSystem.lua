-- 好友系统
local FriendSystem = {}
_G.FriendSystem = FriendSystem



-- 推送在线玩家数量
FriendSystem.onlineRecommendCount = 8
-- 抽取在线玩家随机次数倍数
FriendSystem.onlineRecommendMultiple = 2


-- 推送离线玩家数量
FriendSystem.offlineCount = 8
-- 当推送人数少于n个时开始推送离线玩家
FriendSystem.offlineEndCount = 8

-- 赠送礼物最大次数
FriendSystem.giveAwayMaxCount = 10


-- 发送相亲的人数
FriendSystem._blind_date_count = 8
-- 随机倍数
FriendSystem._blind_date_multiple = 2
-- 使用男女混合榜单 1，使用男女分割榜单 2 ,发送相亲推荐数据
FriendSystem._SEND_BLIND_DATE_TYPE = 2
-- 达到多少级时，触发相亲登记,请配置 MainUISwitch.Config["好友"].Subtab_OpenLevel_2["相亲"]
--FriendSystem._REGISTER_BLIND_DATE_LEVEL =  30


-- 好感度物品
FriendSystem.LikeabilityItem = {
    ["好感度"] = 66,
    ["好感度2"] = 10,
}


-- 获取黑名单
function FriendSystem.GetBlacklist()

end

-- 推荐好友
function FriendSystem.GetRecommendFriend(player)

    -- 推送玩家的列表
    local recommendRole = {}
    -- 记录发送推荐玩家的总数量
    recommendRole.Count = 0
    -- 记录发送推荐离线玩家的总数量
    recommendRole.offlineCount = 0
    -- 记录发送组队玩家的总数量
    recommendRole.temp_count = 0


    local roleGuid = player:GetGUID()
    -- 组队推送好友
    FriendSystem.TeamRecommendFriend2(player,recommendRole)

    -- 在线玩家推送好友
    FriendSystem.onlineRecommendFriend2(player,recommendRole)

    -- 推荐离线玩家
    FriendSystem.offlineRecommendFriend(player,recommendRole)
    -- 在非该玩家好友的本服玩家中随机筛选8个玩家，按战斗力排序。


    -- 将推荐数据存储下，用于推荐离线玩家无法从榜单拿到数据时
    -- 存储推荐玩家20个，在存满后进行部分替换
    if not FriendSystem._storage_recommend then FriendSystem._storage_recommend = {} end
    if #FriendSystem._storage_recommend < 20 then
        for k, v in pairs(recommendRole) do
            if k ~= "Count" and k ~= "offlineCount" and k ~= 'temp_count' then
                table.insert(FriendSystem._storage_recommend,{k})
            end
        end
    else
        local rand_num = sLuaApp:RandInteger(1,FriendSystem.offlineCount)
        for k,v in pairs(recommendRole) do
            if k ~= "Count" and k ~= "offlineCount" and k ~= 'temp_count' then
                if FriendSystem._storage_recommend[rand_num] then
                    FriendSystem._storage_recommend[rand_num][1] = k
                    rand_num = rand_num - 1
                end
            end
        end
    end

    -- 如果不满足推荐数量，从存储数据中取出并插入
    if recommendRole.Count < FriendSystem.offlineCount then
        sLuaApp:LuaDbg(' 获取推送玩家时， 推送数量为'..tostring(recommendRole.Count))
        -- 还差多少个
        local difference = FriendSystem.offlineEndCount - recommendRole.Count
        for k, v in ipairs(FriendSystem._storage_recommend) do
            -- 如果达到数量就退出循环
            if recommendRole.Count >= FriendSystem.offlineCount then break end
            -- 插入数
            FriendSystem.filterRecommend(player, v[1], recommendRole, 3)

        end
    end
    
    return recommendRole
end

-- 刷新好友推送

-- 进一步筛选推送
function FriendSystem.filterRecommend(player,guid,recommendRole,kind)
    -- 判断此guid是否正确
    if sContactSystem:GetContactName(guid) then
        -- 判断不是自己
        if player:GetGUID() ~= guid then
            -- 判断是不是当前角色的好友
            if not sContactSystem:IsFriend(player,guid) then
                if not recommendRole[guid] then
                    recommendRole[guid] = kind
                    -- 记录总推送数量
                    recommendRole.Count = recommendRole.Count + 1
                    -- 记录离线玩家数量
                    if kind == 3 then
                        recommendRole.offlineCount = recommendRole.offlineCount + 1
                    end
                    -- 记录组队玩家数量
                    if kind == 1 then
                        recommendRole.temp_count = recommendRole.temp_count + 1
                    end
                end
            end
        end
    end
end


-- 组队时，记录组队成员
function FriendSystem.OnJoinTeam2(player)
    local roleGuid = player:GetGUID()

    -- 判断当前是否组队
    if player:IsTeamMember() then
        -- 获取当前角色队伍
        local team = player:GetTeam()
        local members = team:GetTeamMembers(true)
        -- 遍历队伍成员
        for k,v in ipairs(members) do
            if v ~= player then
                local guid = v:GetGUID()
                if not FriendSystem.TempMember then FriendSystem.TempMember ={} end
                if not FriendSystem.TempMember[roleGuid] then FriendSystem.TempMember[roleGuid] = {} end
                FriendSystem.TempMember[roleGuid][guid] = 1
            end
        end
    end

end
-- 角色退出时删除组队数据
function FriendSystem.logoutDeleteTeamData(player)
    local roleGuid = player:GetGUID()
    if not FriendSystem.TempMember then return end
    FriendSystem.TempMember[roleGuid] = nil
end

-- 组队成员推送
function FriendSystem.TeamRecommendFriend2(player,recommendRole)
    local roleGuid = player:GetGUID()
    if not FriendSystem.TempMember then return end
    if FriendSystem.TempMember[roleGuid] then
        for k,v in pairs(FriendSystem.TempMember[roleGuid]) do
            FriendSystem.filterRecommend(player,k,recommendRole,v)
        end
    end
end

-- 在线成员推送
function FriendSystem.onlineRecommendFriend2(player,recommendRole)
    -- 优先推送在线玩家，在线玩家不足则推送离线玩家
    -- 获取本服在线玩家
    local allPlayers = sPlayerSystem:GetAllPlayers()
    -- 如果在线人数 <= 推送在线人数
    if FriendSystem.onlineRecommendCount >= #allPlayers then
        for k,v in ipairs(allPlayers) do
            local guid = v:GetGUID()
            FriendSystem.filterRecommend(player,guid,recommendRole,2)
        end
        -- 如果在线人数 > 推送在线人数
    else
        for i=1,FriendSystem.onlineRecommendCount * FriendSystem.onlineRecommendMultiple do
            -- 跳出循环条件
            if recommendRole.Count >= FriendSystem.onlineRecommendCount then break end

            local role = allPlayers[sLuaApp:RandInteger(1,#allPlayers)]
            local guid = role:GetGUID()
            FriendSystem.filterRecommend(player,guid,recommendRole,2)
        end
    end

end

-- 离线玩家推送
function FriendSystem.offlineRecommendFriend(player,recommendRole)
    local leader_board_data = sRanklistSystem:GetAllRanklist(RankingListSystem.Config["角色等级榜"] or 3) -- 1=等级总榜 榜单信息table 结构{{guid, value, name, info}, ...{}}
    if #leader_board_data == 0 then
        sLuaApp:LuaErr('离线玩家推送时，获取不到角色等级排行榜数据')
        if FriendSystem._storage_recommend then
            leader_board_data = FriendSystem._storage_recommend
        end
        if #leader_board_data == 0 then
            return
        end
    end
    -- 如果已有推荐玩家 《 离线玩家推荐结束数量 开始推荐离线玩家
    if recommendRole.Count < FriendSystem.offlineEndCount then
        -- 求出离线玩家推荐多少个
        local difference = FriendSystem.offlineEndCount - recommendRole.Count
        local count = recommendRole.Count
        -- 防止死循环，现在循环次数
        for i=1,FriendSystem.offlineEndCount * FriendSystem.onlineRecommendMultiple do
            -- 再设定一个跳出条件,当离线玩家推荐数量达到要求，则退出推荐循环
            if difference <= 0 then break end

            -- 从等级排行榜中拿取数据
            local guid = leader_board_data[sLuaApp:RandInteger(1,#leader_board_data)][1]

            if guid then
                FriendSystem.filterRecommend(player,guid,recommendRole,3)
                -- 判断推荐数量是否增加
                if count + 1 == recommendRole.Count then
                    count = recommendRole.Count
                    -- 推荐增加，则减少推荐离线数量变量的次数
                    difference = difference - 1
                end
            end
        end
    end
end



-- 计时器函数
function FriendSystem._send_recommend_friends_data_timer_event(player,timerId,param)
    local player_guid = player:GetGUID()
    -- 设置强制发送推送好友数据
    if FormFriend._send_data_timing and FormFriend._send_data_timing[player_guid]  then
        FormFriend._send_data_timing[player_guid].is_send = true
    end
end
-- 获取离线玩家信息
function FriendSystem.GetOfflinePlayer(errcode,data,params)
    -- 获取当前玩家guid和目标玩家guid
    local params = sLuaApp:StrSplit(params,"_")
    local playerGuid = params[1]
    local guid = params[2]
    local count = tonumber(params[3])
    -- 是否发送数据给客户端
    local isSend = nil


    -- 如果不发送数据，则将数据放入容器中
    -- 创建数据变量
    local name = sContactSystem:GetContactName(tonumber(guid))
    local id = nil
    local school = nil
    local combatPower = nil
    local level = nil
    local kind = 3
    local vip_level = nil

    -- 将数据赋值
    local attrs = json.decode(data.attrs)
    for k,v in ipairs(attrs) do
        if v.a == ROLE_ATTR_LEVEL then level = v.v end
        if v.a == ROLE_ATTR_FIGHT_VALUE then combatPower = v.v end
        if v.a == ROLE_ATTR_JOB_1 then school = v.v end
        if v.a == ROLE_ATTR_ROLE then id = v.v end
        if v.a == ROLE_ATTR_VIP then vip_level = v.v end
    end

    -- 如果获取不到VIP数据，尝试用在线玩家的方式去获取
    if vip_level == nil then
        local target = sPlayerSystem:GetPlayerByGUID(tonumber(guid))
        if target then
            vip_level = target:GetAttr(ROLE_ATTR_VIP)
        end
        -- 如果还是获取不到数据，则设为0
        if vip_level == nil then
            vip_level = 0
        end
    end

    if not FormFriend.recommendRole[playerGuid] then FormFriend.recommendRole[playerGuid] = { count = 0} end
    -- 将数据放入table容器中
    FormFriend.recommendRole[playerGuid][guid] = {
        kind = kind,
        level = level,
        name = name,
        combatPower = combatPower,
        school = school,
        roleId = id,
        vip_level = vip_level
    }
    FormFriend.recommendRole[playerGuid].count =  FormFriend.recommendRole[playerGuid].count + 1


    -- 根据第三个参数来判断
    if not count then
        isSend = false
    elseif FormFriend.recommendRole[playerGuid] and FormFriend.recommendRole[playerGuid].count and count == FormFriend.recommendRole[playerGuid].count then
        isSend = true
    else
        isSend = false
    end

    -- 如果达到时间就直接发送数据
    if FormFriend._send_data_timing and FormFriend._send_data_timing[playerGuid] and FormFriend._send_data_timing[playerGuid].is_send then
        isSend = true

        if FormFriend.recommendRole[playerGuid] and FormFriend.recommendRole[playerGuid].count then
            sLuaApp:LuaErr("达到推送时间，当前推送好友数量为："..tostring(FormFriend.recommendRole[playerGuid].count))
        end
    end

    -- 如果需要发送数据，则发送数据
    if isSend then

        FormFriend.recommendRole[playerGuid].count = nil
        -- 发送表单
        local str = [[
        if FriendShipRecommend then
           FriendShipRecommend.recommendFriends = ]]..Lua_tools.serialize(FormFriend.recommendRole[playerGuid])..[[
           FriendShipRecommend.RefreshUseApply()
        end
        ]]

        local player = sPlayerSystem:GetPlayerByGUID(tonumber(playerGuid))
        sLuaApp:ShowForm(player, "脚本表单", str)

        -- 清除数据，防止占用内存
        FormFriend.recommendRole[playerGuid] = nil
        -- 定时器相关
        if FormFriend._send_data_timing and FormFriend._send_data_timing[playerGuid] then
            -- 关闭定时器
            if FormFriend._send_data_timing[playerGuid].timer_guid then
                -- 判断定时器是否存在
                if sLuaTimerSystem:HasTimer(FormFriend._send_data_timing[playerGuid].timer_guid) then
                    sLuaTimerSystem:DisableTimer(FormFriend._send_data_timing[playerGuid].timer_guid)
                end
            end

            -- 清空定时器数据
            FormFriend._send_data_timing[playerGuid] = nil
        end

    end

end



---------------------------好感度

-- 使用物品添加好感度
function FriendSystem.useLikeabilityItem(player,targetGuid,itemData)
    local data = sLuaApp:StrSplit(itemData,"_")

    -- 所有的物品
    local item_list = {}
    -- 单个物品
    local one_item = {}

    -- 赠送的数量
    local count = 0



    for k,v in ipairs(data) do
        local temp = sLuaApp:StrSplit(v,":")
        local item_guid = temp[1]
        local item_use_amount = temp[2]
        count = count + item_use_amount
        one_item.guid = tonumber(item_guid)
        one_item.amount = tonumber(item_use_amount)
        table.insert(item_list,one_item)
        one_item = {}
    end


    --for k,v in ipairs(data) do
    --    -- 如果是物品的名称
    --    if  v ~= 'true' and v ~= 'false' and tonumber(v) == nil then
    --        one_item.key_name = v
    --        -- 如果是物品的数量
    --    elseif tonumber(v) ~= nil then
    --        one_item.amount = tonumber(v)
    --        -- 如果是物品绑定属性，1 非绑 2 绑定 3 任意
    --    elseif (v == "true" or v == 'false') then
    --        if v == 'true' then one_item.is_bound = 2 end
    --        if v == 'false' then one_item.is_bound = 1 end
    --        -- 插入物品列表中
    --        table.insert(item_list,one_item)
    --        --one_item = {} -- 同key会被覆盖，无需清空
    --    else
    --        sLuaApp:LuaWarn("脚本FriendSystem，客户端发送赠送物品请求的数据错误")
    --    end
    --end

    one_item = nil
    data = nil

    -- 消耗的物品
    --local consume_item = {}
    --if item_list then
    --
    --    for k,v in ipairs(item_list) do
    --
    --        if consume_item[v.key_name] == nil then
    --            -- 插入这一行数据
    --            consume_item[v.key_name] = v
    --        else
    --            -- 对物品数量进行汇总,减少执行次数
    --            local item_summary = consume_item[v.key_name]
    --            -- 如果存在这行数据，则证明这个key_name就是相等
    --            --if item_summary.key_name == v.key_name and
    --            if item_summary.is_bound == v.is_bound then
    --                item_summary.amount = item_summary.amount + v.amount
    --            end
    --        end
    --
    --    end
    --
    --end
    --item_list = nil
    ------------------------------------ 对数据处理完毕，开始使用数据，消耗物品-增加好感度

    local playerGuid = player:GetGUID()
    -- 获取已赠送次数
    local giveAwayCount = sContactSystem:GetInt(playerGuid,targetGuid,"giveAwayCount")
    -- 如果未设置此值，设置为0
    if not giveAwayCount then giveAwayCount = 0 end
    if giveAwayCount >= FriendSystem.giveAwayMaxCount then
        sLuaApp:NotifyTipsMsg(player,"已达赠送最大次数，无法赠送")
        return
    end

    if (count + giveAwayCount ) >  FriendSystem.giveAwayMaxCount then
        sLuaApp:NotifyTipsMsg(player,'赠送礼物的数量超过赠送次数上限')
        return
    end

    -- 是否完成一次赠送礼物
    local is_complete = false

    for k,v in ipairs(item_list) do
        local item = sItemSystem:GetItemByGUID(v.guid)

        if not item then
            sLuaApp:LuaWrn('FriendSystem.useLikeabilityItem 传入参数'..v.guid.." 物品不存在")
            sLuaApp:NotifyTipsMsg('该物品不存在')
            return
        end

        local use_amount = v.amount

        if use_amount <= 0 then
            sLuaApp:LuaWrn('FriendSystem.useLikeabilityItem 传入的参数'..v.guid.." 物品使用数量为0")
            return
        end

        local name = item:GetKeyName()
        if not FriendSystem.LikeabilityItem[name] then
            sLuaApp:NotifyTipsMsg('该物品不在赠送物品范围内')
            sLuaApp:LuaWrn('FriendSystem.useLikeabilityItem 传入的参数'..v.guid.." name:"..name.." 该物品不在赠送范围内")
            return
        end


        local amount = item:GetAmount()
        if use_amount > amount then
            sLuaApp:NotifyTipsMsg('该物品不足')
            sLuaApp:LuaWrn('FriendSystem.useLikeabilityItem 传入的参数'..v.guid.." 物品不足")
            return
        end

        if sItemSystem:ConsumeItem(item,use_amount,"system","使用增加好感度物品","使用增加好感度物品"..name) == 0 then
            -- 获取好感度
            local LikeabilityValue = sContactSystem:GetInt(playerGuid,targetGuid,"LikeabilityValue")
            -- 如果获取的好感度为空,好感度为0
            if not LikeabilityValue then LikeabilityValue = 0 end
            -- 获取好感度 = 获取好感度 + 物品添加的好感度
            LikeabilityValue = LikeabilityValue + FriendSystem.LikeabilityItem[name] * use_amount
            -- 设置好感度
            sContactSystem:SetInt(playerGuid, targetGuid, "LikeabilityValue", LikeabilityValue)
            sContactSystem:SetInt(targetGuid, playerGuid, "LikeabilityValue", LikeabilityValue)
            -- 已赠送次数+
            sContactSystem:SetInt(playerGuid, targetGuid, "giveAwayCount", giveAwayCount + use_amount)

            is_complete = true

        else
            sLuaApp:NotifyTipsMsg(player,"系统错误")
            sLuaApp:luaErr("FriendSystem.useLikeabilityItem 赠送物品"..name.."失败.".."无法增加好感度")
        end

    end

    if is_complete then
        sLuaApp:NotifyTipsMsg(player,'赠礼成功')

        -- 记录此目标玩家的guid
        local guids = player:GetString('giveGiftGuids')
        local target_guid = tostring(targetGuid)
        if guids then
            if guids == '' then
                player:SetString('giveGiftGuids',target_guid)
            else
                -- 遍历这个guid是否存在，如果存在就不插入
                local guid_group = sLuaApp:StrSplit(guids,'_')
                local is_insert = true
                for k, v in ipairs(guid_group) do
                    if v == target_guid then
                        is_insert = false
                        break
                    end
                end
                if is_insert then
                    player:SetString('giveGiftGuids',guids.."_"..target_guid)
                end
            end
        else
            player:SetString('giveGiftGuids',target_guid)
        end

    end
    item_list = nil


    -- 对物品进行消耗
    --for k,v in pairs(consume_item) do
    --
    --    local item = ItemConfig.GetByKeyName(v.key_name)
    --    local playerGuid = player:GetGUID()
    --    -- 获取已赠送次数
    --    local giveAwayCount = sContactSystem:GetInt(playerGuid,targetGuid,"giveAwayCount")
    --    -- 如果未设置此值，设置为0
    --    if not giveAwayCount then giveAwayCount = 0 end
    --    if giveAwayCount >= FriendSystem.giveAwayMaxCount then
    --        sLuaApp:NotifyTipsMsg("已达赠送最大次数，无法赠送")
    --        return
    --    end
    --
    --    local itemId = item.Id
    --    -- 判断玩家是否拥有这么多数量物品，然后消耗物品，添加好感度
    --    if sItemSystem:GetItemAmount(player,itemId,v.is_bound) >= v.amount then
    --        if sItemSystem:ConsumeItemWithId(player, itemId, v.amount, v.is_bound, "system", "使用增加好感度物品", "使用增加好感度物品"..v.key_name) == 0 then
    --            -- 获取好感度
    --            local LikeabilityValue = sContactSystem:GetInt(playerGuid,targetGuid,"LikeabilityValue")
    --            -- 如果获取的好感度为空,好感度为0
    --            if not LikeabilityValue then LikeabilityValue = 0 end
    --            -- 获取好感度 = 获取好感度 + 物品添加的好感度
    --            LikeabilityValue = LikeabilityValue + FriendSystem.LikeabilityItem[v.key_name] * v.amount
    --            -- 设置好感度
    --            sContactSystem:SetInt(playerGuid, targetGuid, "LikeabilityValue", LikeabilityValue)
    --            sContactSystem:SetInt(targetGuid, playerGuid, "LikeabilityValue", LikeabilityValue)
    --            -- 已赠送次数+1
    --            sContactSystem:SetInt(playerGuid, targetGuid, "giveAwayCount", giveAwayCount + 1)
    --            -- 对方赠送次数无需增加
    --            --sContactSystem:SetInt(targetGuid, playerGuid, "giveAwayCount", giveAwayCount + 1)
    --
    --            sLuaApp:NotifyTipsMsg(player,item.Name.."赠送成功")
    --            local target_player = sPlayerSystem:GetPlayerByGUID(tonumber(targetGuid))
    --            if target_player then
    --                sLuaApp:NotifyTipsMsg(target_player,player:GetName().."给您赠送了礼物，你们的好感度提升了")
    --            end
    --        else
    --            sLuaApp:NotifyTipsMsg(player,"系统错误")
    --            sLuaApp:luaErr("FriendSystem.useLikeabilityItem 使用物品"..v.key_name.."失败.".."无法增加好感度")
    --        end
    --    else
    --        sLuaApp:NotifyTipsMsg(player,"物品不足，无法赠送")
    --    end
    --
    --end
    --consume_item = nil

end

-- 登陆游戏检查是否更新次数数据
function FriendSystem.refresh_give_gift_count(player)
    local temp = player:GetString('giveGiftGuids')
    -- 上一次打开天数
    local time = player:GetInt('giveGiftTime')
    -- 当前天数 距离1970-1-1
    local now_day = sLuaApp:DaySinceEpoch(0)
    
    -- #防止重新登陆后因为time为0就将所有的赠送次数设置为了0 dec 21 2021
    if not temp or temp == '' then 
        if time == 0 then
            player:SetInt('giveGiftTime',now_day)
        end
        return ''
    end
    -- 玩家的guid
    local player_guid = player:GetGUID()
    
    if time then
        -- 如果没有值 或者 不同天数 清空赠送次数
        if time == 0 or now_day > time then
            player:SetInt('giveGiftTime',now_day)
            -- 分割guid数据
            local guid_group = sLuaApp:StrSplit(temp,'_')
            for k, v in ipairs(guid_group) do
                local target_guid = tonumber(v)
                sContactSystem:SetInt(player_guid, target_guid, "giveAwayCount", 0)
            end
            player:SetString('giveGiftGuids','')
        end
    end
end
---------------------------好感度


-----------------------------------------相亲

-- 获取相亲榜单数据
function FriendSystem.get_blind_date_data(player)
    if not player then return false end

    local rankName = nil
    if FriendSystem._SEND_BLIND_DATE_TYPE == 1 then
        rankName = '相亲榜'
    elseif FriendSystem._SEND_BLIND_DATE_TYPE == 2 then
        -- 获取玩家性别 1 男 2 女
        local sex_type = player:GetAttr(ROLE_ATTR_GENDER)
        if sex_type == 1 then
            rankName = "相亲女榜"
        elseif sex_type == 2 then
            rankName = '相亲男榜'
        else
            sLuaApp:LuaWrn("脚本FormFriend，获取玩家性别错误")
            return false
        end
    end

    local data = nil
    if RankingListSystem and RankingListSystem.Config[rankName] then

        -- 获取所有相亲榜单的数据
        data = sRanklistSystem:GetAllRanklist(RankingListSystem.Config[rankName])
        -- 准备发送数据的容器
        local send_data = {}
        -- 角色的账号id
        local user_id = tostring(player:GetUserId())

        local is_register = player:GetInt('is_register_blind_date')
        -- 如果榜单中没有数据,则发送一个nil
        if data == nil  or data[1] == nil then
            -- 如果该玩家已征婚，那么会显示他自己 需要添加，否则就退出
            if is_register == 1 then
                goto to1
            else
                return nil
            end
        end

        -- 如果推送的相亲榜单数量 >= 获取到相亲榜单的数据，就全部发送
        if FriendSystem._blind_date_count >= #data then
            -- 剔除与当前玩家相同账号的角色
            for k, v in ipairs(data) do
                if sLuaApp:StrSplit(v[4], '-')[2] == user_id then
                    table.remove(data, k)
                end
            end
            send_data = data
            send_data.count = #data
            -- 否则就筛选出推送的数量,为防止一直筛选，设置循环次数
        else
            -- 记录已有数据的数量
            send_data.count = 0
            for i=1,FriendSystem._blind_date_count * FriendSystem._blind_date_multiple do
                -- 如果需要数据的数量已经达到，则跳出循环
                if send_data.count >= FriendSystem._blind_date_count then break end
                -- 随机一个在榜单范围内的数
                local rand = sLuaApp:RandInteger(1,#data)
                -- 判断是否是同一个账号下的角色，如果是就剔除
                if data[rand] then
                    -- 榜单信息table 结构{{guid, value, name, info}, ...{}}
                    local target_user_id = sLuaApp:StrSplit(data[rand][4], '-')[2]
                    -- 账号id不同，说明不在同一账号下
                    if target_user_id ~= user_id then
                        -- 如果这个数据没在发送数据中，则放入数据，让已有数据数量自增
                        if not send_data[rand] then
                            send_data.count = send_data.count + 1
                            send_data[rand] = data[rand]
                        end
                    end
                end
            end

        end


        :: to1 ::
        -- 查看自己是否登记，如果自己已登记，将自己加入推荐,如果重复也不打紧，在发送数据时会去重
        if is_register == 1 then
            local role_guid = player:GetGUID()
            -- 数据量+1
            if not send_data.count then send_data.count = 0 end
            send_data.count = send_data.count + 1
            -- 插入到最后一位
            table.insert(send_data,{role_guid})
        end

        return send_data

    else
        sLuaApp:LuaWrn("脚本FormFriend，获取榜单id不存在，请查看其文档")
        return false
    end

    return nil
end

-- 登记相亲
function FriendSystem.blind_date_register(player)
    if not player then return false end

    -- 判断是否已婚，如果已婚，则提示,并不登记
    local spouse = sPlayerSystem:GetSpouse(player)
    -- 如果返回空字符串，则表示未婚
    if spouse ~= "" then
        return spouse
    end

    local guid = player:GetGUID()
    local rankName = nil

    if FriendSystem._SEND_BLIND_DATE_TYPE == 1 then
        rankName = '相亲榜'
    elseif FriendSystem._SEND_BLIND_DATE_TYPE == 2 then
        -- 获取玩家性别 1 男 2 女
        local sex_type = player:GetAttr(ROLE_ATTR_GENDER)
        if sex_type == 1 then
            rankName = '相亲男榜'
        elseif sex_type == 2 then
            rankName = "相亲女榜"
        else
            sLuaApp:LuaWrn("脚本FormFriend，获取玩家性别错误")
            return false
        end
    end

    if RankingListSystem and RankingListSystem.Config[rankName] then
        local count = #sRanklistSystem:GetAllRanklist(RankingListSystem.Config[rankName])
        -- 账号id
        local user_id = player:GetUserId()
        -- 更新玩家排行榜, 插入玩家的账号id
        sRanklistSystem:UpdateRanklist(RankingListSystem.Config[rankName], guid, count + 1, player:GetName(), '相亲-'..tostring(user_id))

        -- 存储自定义变量,并广播给客户端
        player:SetInt('is_register_blind_date',1)
        -- 在 GSSystem中注册了
        --sCustomVarSystem:SetBroadcastScope(0, "is_register_blind_date", 1)

        return true
    end
end

-- 取消登记
function FriendSystem.blind_date_unregister(player)
    if not player then return false end

    local guid = player:GetGUID()
    local rankName = nil

    if FriendSystem._SEND_BLIND_DATE_TYPE == 1 then
        rankName = '相亲榜'
    elseif FriendSystem._SEND_BLIND_DATE_TYPE == 2 then
        -- 获取玩家性别 1 男 2 女
        local sex_type = player:GetAttr(ROLE_ATTR_GENDER)
        if sex_type == 1 then
            rankName = '相亲男榜'
        elseif sex_type == 2 then
            rankName = "相亲女榜"
        else
            sLuaApp:LuaWrn("脚本FormFriend，获取玩家性别错误")
            return false
        end
    end

    if RankingListSystem and RankingListSystem.Config[rankName] then
        -- 获取玩家在排行榜中的数据
        local rank_data = sRanklistSystem:GetRank(RankingListSystem.Config[rankName],guid)
        -- 判断有无，如果有则删除此行数据，如果没有则什么都不做
        if rank_data and rank_data[1] then
            sRanklistSystem:RemoveRank(RankingListSystem.Config[rankName],guid)

            -- 存储自定义变量,并广播给客户端
            player:SetInt('is_register_blind_date',0)
            --sCustomVarSystem:SetBroadcastScope(0, "is_register_blind_date", 1)

            return true
        else
            return 'no_register'
        end
    end
end

-- 获取玩家是否已登记相亲,通过自定义变量获取

-- 结婚时从相亲榜单删除数据
function FriendSystem.married_del(male_player,female_player)
    if not (male_player and female_player) then return end

    FriendSystem.blind_date_unregister(male_player)
    FriendSystem.blind_date_unregister(female_player)
    sLuaApp:NotifyTipsMsg(male_player,'您已取消相亲登记')
    sLuaApp:NotifyTipsMsg(female_player,'您已取消相亲登记')
end

-- 添加触发器,当玩家达到相应等级时，弹出窗口，让玩家确定是否登记相亲
function FriendSystem.level_trigger_register_blind_date(player,now_level)
    -- 相应等级
    local level = nil
    if MainUISwitch and MainUISwitch.Config["好友"] and MainUISwitch.Config["好友"].Subtab_OpenLevel_2["相亲"] then
        level = MainUISwitch.Config["好友"].Subtab_OpenLevel_2["相亲"]
    else
        level = 30
    end
    if tonumber(now_level) == level then

        local str = [[
            GlobalUtils.ShowServerBoxMessage1Btn("风雨飘摇，未尝一败。愿得佳偶，相亲相爱。",30)
        ]]
        player:SetString("SYSTEM_ConfirmBox_Function", "FriendSystem._register_married("..player:GetGUID()..")")
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function FriendSystem._register_married(player_guid)
    player_guid = tonumber(player_guid)
    local player = sPlayerSystem:GetPlayerByGUID(player_guid)
    --FriendSystem.blind_date_register(player)
    FormFriend.blind_date_register(player)
    local str = [[
        GUI.OpenWnd("FriendShipRecommend",2)
    ]]
    --if FriendShipRecommend then
    --    FriendShipRecommend.OpenMarryPage()
    --end
    sLuaApp:ShowForm(player, "脚本表单", str)
end




-- 获取相亲榜单玩家的数据
function FriendSystem._send_blind_date_data(errcode,data,params)
    -- 获取当前玩家guid和目标玩家guid
    local params = sLuaApp:StrSplit(params,"_")
    local playerGuid = params[1]
    local guid = params[2]
    -- 是否发送数据给客户端
    local isSend = nil


    -- 创建数据变量
    local name = sContactSystem:GetContactName(tonumber(guid))
    local id = nil
    local school = nil
    local combatPower = nil
    local level = nil
    local vip_level = nil

    -- 将数据赋值
    local attrs = json.decode(data.attrs)
    for k,v in ipairs(attrs) do
        if v.a == ROLE_ATTR_LEVEL then level = v.v end
        if v.a == ROLE_ATTR_FIGHT_VALUE then combatPower = v.v end
        if v.a == ROLE_ATTR_JOB_1 then school = v.v end
        if v.a == ROLE_ATTR_ROLE then id = v.v end
        if v.a == ROLE_ATTR_VIP then vip_level = v.v end
    end

    -- 如果无法通过离线方法获取其VIP等级,尝试用在线获取的方式
    if vip_level == nil then
        local target = sPlayerSystem:GetPlayerByGUID(tonumber(guid))
        if target then
            vip_level = target:GetAttr(ROLE_ATTR_VIP)
        end
        -- 如果还是拿不到数据，则设为0
        if vip_level == nil then
            vip_level = 0
        end
    end

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



    -- 计算是否发送数据
    if not FormFriend._blind_date_data[playerGuid] then
        isSend = false
    else
        -- 根据第三个参数来判断
        if not params[3] then
            isSend = false
        elseif params[3] == tostring(FormFriend._blind_date_data[playerGuid].count) then
            isSend = true
        else
            isSend = false
        end
    end

    -- 发送数据
    if isSend then
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

        local player = sPlayerSystem:GetPlayerByGUID(tonumber(playerGuid))
        sLuaApp:ShowForm(player, "脚本表单", str)
        -- 清除数据，防止占用内存
        FormFriend._blind_date_data[playerGuid] = nil
    end

end

-----------------------------------------相亲


-- 获取所有好友
function FriendSystem.get_all_friends(player)
    -- 联系人类型,参考LogicDef枚举值
    -- 取得联系人列表,返回table的格式为:{guid1, guid2..., guidN}
    local friends = sContactSystem:GetContactList(player,CONTACT_FRIEND)
    return friends
end
