--收集活动脚本
ActivityCollect = {}
--刷新出的任务最大数量
ActivityCollect.DayCountMax = 7
ActivityCollect.DayCanFinishMax = 5
--每日免费刷新任务的次数
ActivityCollect.FreeCount = 3
--付费刷新价格增长差
ActivityCollect.PayRefresh = 50000
--付费刷新价格增长频率（次）
ActivityCollect.PayGrowCount = 1
--活动开启等级
ActivityCollect.OpenLevel = 40
--活动任务获得奖券范围（与Rank的偏差）
ActivityCollect.TicketGetNum = {-2,1}
--抽奖道具id
ActivityCollect.Get_id = 30000
--刷新消耗银币的最大值
ActivityCollect.MaxUseMoney = 500000
--奖励列表以及需要的收集物
ActivityCollect.Reward = {
    [1] = {id = 1,name = "101",Icon = "谪剑仙",IconCount = 1,Icon2 = "青丘狐",Icon2Count = 1,ItemId = 20910,ItemCount = 3,type = 0 },
    [2] = {id = 2,name = "102",Icon = "雨师君",IconCount = 1,Icon2 = "花弄影",Icon2Count = 1,ItemId = 20739,ItemCount = 10,type = 0},
    [3] = {id = 3,name = "103",Icon = "冥河使",IconCount = 1,Icon2 = "傲红莲",Icon2Count = 1,ItemId = 35508,ItemCount = 5,type = 0},
    [4] = {id = 4,name = "104",Icon = "烟云客",IconCount = 1,Icon2 = "海鲛灵",Icon2Count = 1,ItemId = 31005,ItemCount = 5,type = 0},
    [5] = {id = 5,name = "105",Icon = "阎魔令",IconCount = 1,Icon2 = "飞翼姬",Icon2Count = 1,ItemId = 31001,ItemCount = 20,type = 0},
    [6] = {id = 6,name = "106",Icon = "神霄卫",IconCount = 1,Icon2 = "凤凰仙",Icon2Count = 1,ItemId = 31002,ItemCount = 10,type = 0},
    [100] = {id = 100,name = "100",Icon = "",IconCount = 0,Icon2 = "",Icon2Count = 0,ItemId = 20785,ItemCount = 5,type = 0}
}

--收集物列表
ActivityCollect.Collection = {
    ["谪剑仙"] = {Count = 0},
    ["飞翼姬"] = {Count = 0},
    ["烟云客"] = {Count = 0},
    ["冥河使"] = {Count = 0},
    ["阎魔令"] = {Count = 0},
    ["雨师君"] = {Count = 0},
    ["神霄卫"] = {Count = 0},
    ["傲红莲"] = {Count = 0},
    ["花弄影"] = {Count = 0},
    ["青丘狐"] = {Count = 0},
    ["海鲛灵"] = {Count = 0},
    ["凤凰仙"] = {Count = 0},
}

ActivityCollect.GetList = {
    [1] = {name = "谪剑仙"},
    [2] = {name = "飞翼姬"},
    [3] = {name = "烟云客"},
    [4] = {name = "冥河使"},
    [5] = {name = "阎魔令"},
    [6] = {name = "雨师君"},
    [7] = {name = "神霄卫"},
    [8] = {name = "傲红莲"},
    [9] = {name = "花弄影"},
    [10] = {name = "青丘狐"},
    [11] = {name = "海鲛灵"},
    [12] = {name = "凤凰仙"},
}

ActivityCollect.TaskTable = {
    [1] = {id = 1, ShowName = "谪剑仙的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "11111" , Type = 0 , State = 1 , NPC = "印章-谪剑仙" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [2] = {id = 2, ShowName = "飞翼姬的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "22222" , Type = 0 , State = 1 , NPC = "印章-飞翼姬" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [3] = {id = 3, ShowName = "烟云客的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "33333" , Type = 0 , State = 1 , NPC = "印章-烟云客" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [4] = {id = 4, ShowName = "冥河使的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "44444" , Type = 0 , State = 1 , NPC = "印章-冥河使" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [5] = {id = 5, ShowName = "阎魔令的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "55555" , Type = 0 , State = 1 , NPC = "印章-阎魔令" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [6] = {id = 6, ShowName = "雨师君的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "66666" , Type = 0 , State = 1 , NPC = "印章-雨师君" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [7] = {id = 7, ShowName = "神霄卫的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "77777" , Type = 0 , State = 1 , NPC = "印章-神霄卫" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [8] = {id = 8, ShowName = "傲红莲的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "88888" , Type = 0 , State = 1 , NPC = "印章-傲红莲" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [9] = {id = 9, ShowName = "花弄影的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "99999" , Type = 0 , State = 1 , NPC = "印章-花弄影" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [10] = {id = 10, ShowName = "青丘狐的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "10101" , Type = 0 , State = 1 , NPC = "印章-青丘狐" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [11] = {id = 11, ShowName = "海鲛灵的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "10111" , Type = 0 , State = 1 , NPC = "印章-海鲛灵" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},
    [12] = {id = 12, ShowName = "凤凰仙的任务" , Rank = 0 , ItemId = {61025,61024,30000} , ShowInfo = "12121" , Type = 0 , State = 1 , NPC = "印章-凤凰仙" ,HandItemId = 0 ,HandItemNum = 0 ,HandItemName = ""},

}

ActivityCollect.NpcCreatList = {
    [1] = {NpcName = "谪剑仙",NpcId = 62121,mapId = 238,rot = 7,X = 50,Y = 141},
    [2] = {NpcName = "飞翼姬",NpcId = 62122,mapId = 209,rot = 3,X = 20,Y = 122},
    [3] = {NpcName = "烟云客",NpcId = 62123,mapId = 210,rot = 6,X = 403,Y = 85},
    [4] = {NpcName = "冥河使",NpcId = 62124,mapId = 215,rot = 6,X = 90,Y = 60},
    [5] = {NpcName = "阎魔令",NpcId = 62125,mapId = 207,rot = 2,X = 141,Y = 38},
    [6] = {NpcName = "雨师君",NpcId = 62126,mapId = 208,rot = 3,X = 74,Y = 29},
    [7] = {NpcName = "神霄卫",NpcId = 62127,mapId = 238,rot = 6,X = 134,Y = 80},
    [8] = {NpcName = "傲红莲",NpcId = 62128,mapId = 210,rot = 3,X = 425,Y = 280},
    [9] = {NpcName = "花弄影",NpcId = 62129,mapId = 205,rot = 4,X = 163,Y = 67},
    [10] = {NpcName = "青丘狐",NpcId = 62130,mapId = 217,rot = 2,X = 186,Y = 79},
    [11] = {NpcName = "海鲛灵",NpcId = 62131,mapId = 206,rot = 3,X = 210,Y = 58},
    [12] = {NpcName = "凤凰仙",NpcId = 62132,mapId = 214,rot = 4,X = 95,Y = 22},
}
--任务完成奖励 经验倍率，银币倍率，掉落物品id
ActivityCollect.RankRewardList = {
    [1] = {Exp = 300,Money = 30,Item = 30000},
    [2] = {Exp = 350,Money = 35,Item = 30000},
    [3] = {Exp = 400,Money = 40,Item = 30000},
    [4] = {Exp = 450,Money = 45,Item = 30000},
    [5] = {Exp = 600,Money = 60,Item = 30000}

}
--任务不同品质的概率
ActivityCollect.RankRandom = {
    [1] = {Rand = 10},
    [2] = {Rand = 20},
    [3] = {Rand = 40},
    [4] = {Rand = 20},
    [5] = {Rand = 10},
}
ActivityCollect.TaskPic = {
    [1] = "1801109390",  --拜访
    [2] = "1801109480",  --提交
    [3] = "1801109290",  --战斗
}

ActivityCollect.HandItemIdList = {
    [1] = {"32408","32409"}, [2] = {"32408","32409"}, [3] = {"32410","32411"}, [4] = {"32410","32411"}, [5] = {"32412","32413","32414","32415",}
}

ActivityCollect.HandItemNameList = {
    [1] = {"土豆烧牛肉","糖醋排骨"}, [2] = {"土豆烧牛肉","糖醋排骨"}, [3] = {"蟹黄豆腐煲","水煮肉片"}, [4] = {"蟹黄豆腐煲","水煮肉片"}, [5] = {"红烧肘子","红烧牛尾","烤羊排","海椒醉蟹",}
}
--打开界面发送表单
function ActivityCollect.Get_Data(player)
    if FunctionSwitch.AllFuncitonConfig['ActivityCollect'] == "off" then
        sLuaApp:NotifyTipsMsg(player, "活动未开启")
        local str = [[
        if ActivityCollectUI then
            GUI.CloseWnd("ActivityCollectUI")
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return
    end
    if player then
        local level = tonumber(player:GetAttr(ROLE_ATTR_LEVEL))
        if level < ActivityCollect.OpenLevel then
            return
        end
        --sLuaApp:LuaDbg(ActivityCollect.testlist[1][1])
        local Collection = assert(load("return"..player:GetString("Collection")))()
        if Collection == nil then
            Collection = ActivityCollect.Collection
        end
        --(Lua_tools.serialize(Collection))
        local Reward = assert(load("return"..player:GetString("Collect_reward")))()
        if Reward == nil then
            Reward = ActivityCollect.Reward
        end
        local str = [[
    if ActivityCollectUI then
        ActivityCollectUI.Collection = ]]..Lua_tools.serialize(Collection)..[[
        ActivityCollectUI.RewardList = ]]..Lua_tools.serialize(Reward)..[[
        ActivityCollectUI.Get_id = ]]..Lua_tools.serialize(ActivityCollect.Get_id)..[[
        ActivityCollectUI.OpenRefresh()
    end
    ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return ""
    else
        sLuaApp:LuaDbg("无player数据")
    end
end

--领取奖励
function ActivityCollect.Get_Reward(player,reward_id)   -----------------------------------
    if player and reward_id then
        local reward = assert(load("return"..player:GetString("Collect_reward")))()
        local Collection = assert(load("return"..player:GetString("Collection")))()
        if Collection == nil then
            sLuaApp:NotifyTipsMsg(player, "您还没有任何印章哦，请加油收集吧")
            return
        end
        if reward == nil then
            reward = ActivityCollect.Reward
            player:SetString("Collect_reward",Lua_tools.serialize(reward))
        end
        reward = assert(load("return"..player:GetString("Collect_reward")))()
        if reward[reward_id].name ~= "100" then
            if reward[reward_id].type == 0 then
                if ActivityCollect.IsEnough_Collection(player,reward_id) then
                    local ItemContainer = player:GetItemContainer(1)
                    if Collection then
                        if ItemContainer:GetFreeSiteCount() < 1 then
                            sLuaApp:NotifyTipsMsg(player, "背包空间不足，领取失败！")
                        else
                            --ActivityCollect.Deduction_Collection(player,reward_id)
                            sItemSystem:AddItemEx(player,ActivityCollect.Reward[reward_id].ItemId,ActivityCollect.Reward[reward_id].ItemCount, false,"system","活动完成奖励","")
                            reward[reward_id].type = 1
                            player:SetString("Collect_reward",Lua_tools.serialize(reward))
                            ActivityCollect.RefreshData(player,2)
                        end
                    end
                else
                    sLuaApp:NotifyTipsMsg(player, "印章不足，请加油收集吧")
                end
            else
                sLuaApp:NotifyTipsMsg(player, "你已经领取过了该奖励")
            end
        else
            if ActivityCollect.IsEnough_Collection_final(player) then
                local ItemContainer = player:GetItemContainer(1)
                if ItemContainer:GetFreeSiteCount() < 1 then
                    sLuaApp:NotifyTipsMsg(player, "背包空间不足，领取失败！")
                else
                    ActivityCollect.Deduction_Collection_final(player)
                    sItemSystem:AddItemEx(player,ActivityCollect.Reward[reward_id].ItemId,ActivityCollect.Reward[reward_id].ItemCount, false,"system","活动完成奖励","")
                    ActivityCollect.RefreshData(player,1)
                end
            else
                sLuaApp:NotifyTipsMsg(player, "印章不足，请加油收集吧")
            end
        end
    else
        sLuaApp:LuaDbg("数据异常")
    end
end

--抽取收集物
function ActivityCollect.Get_Collection(player)
    if player then
        if sItemSystem:ConsumeItemWithId(player, ActivityCollect.Get_id, 1, 3, "System", "CollectItem", "使用抽取券") == 0 then
            local id = sLuaApp:RandInteger(1,#ActivityCollect.GetList)
            local Name = ActivityCollect.GetList[id].name
            local Collection = assert(load("return"..player:GetString("Collection")))()
            if Collection == nil then
                Collection = ActivityCollect.Collection
                player:SetString("Collection",Lua_tools.serialize(Collection))
            end
            Collection = assert(load("return"..player:GetString("Collection")))()
            Collection[Name].Count = Collection[Name].Count + 1
            player:SetString("Collection",Lua_tools.serialize(Collection))
            ActivityCollect.Get_Collection_Refresh(player,Name)
        else
            sLuaApp:NotifyTipsMsg(player,"抽奖券不足")
        end
    else
        sLuaApp:LuaDbg("无player数据")
    end
end

--判断收集物是否足够
function ActivityCollect.IsEnough_Collection(player,Reward_id)
    local Collection_List = assert(load("return"..player:GetString("Collection")))()
    local Reward_data = ActivityCollect.Reward[Reward_id]
    local Num = 0
    for k,v in pairs(Collection_List) do
        if k == Reward_data.Icon and v.Count >= Reward_data.IconCount then
            Num = Num + 1
        end
        if k == Reward_data.Icon2 and v.Count >= Reward_data.Icon2Count then
            Num = Num + 1
        end
    end
    if Num == 2 then
        return true
    else
        return false
    end
end

function ActivityCollect.IsEnough_Collection_final(player)
    local Collection_List = assert(load("return"..player:GetString("Collection")))()
    local Num = 0
    for k,v in pairs(Collection_List) do
        if v.Count >= 1 then
            Num = Num + 1
        end
    end
    if Num == #ActivityCollect.GetList then
        return true
    else
        return false
    end
end

--扣除收集物
function ActivityCollect.Deduction_Collection(player,Reward_id)
    local Collection_List = assert(load("return"..player:GetString("Collection")))()
    local Reward_data = ActivityCollect.Reward[Reward_id]
    for k,v in pairs(Collection_List) do
        if k == Reward_data.Icon then
            v.Count = v.Count - Reward_data.IconCount
        end
        if k == Reward_data.Icon2 then
            v.Count = v.Count - Reward_data.Icon2Count
        end
    end
    player:SetString("Collection",Lua_tools.serialize(Collection_List))
    return ""
end

function ActivityCollect.Deduction_Collection_final(player)
    local Collection_List = assert(load("return"..player:GetString("Collection")))()
    for k,v in pairs(Collection_List) do
        v.Count = v.Count - 1
    end
    player:SetString("Collection",Lua_tools.serialize(Collection_List))
    return ""
end

--抽取和领取礼包后发送表单
function ActivityCollect.RefreshData(player,type)
    --type = 1 --单独发送收集物信息
    --type = 2 --发送礼包和收集物信息
    if type == 1 then
        local str = [[
        if ActivityCollectUI then
            ActivityCollectUI.Collection = ]]..Lua_tools.serialize(assert(load("return"..player:GetString("Collection")))())..[[
            ActivityCollectUI.OpenRefresh()
        end ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return ""
    elseif type == 2 then
        local str = [[
        if ActivityCollectUI then
            ActivityCollectUI.Collection = ]]..Lua_tools.serialize(assert(load("return"..player:GetString("Collection")))())..[[
            ActivityCollectUI.RewardList = ]]..Lua_tools.serialize(assert(load("return"..player:GetString("Collect_reward")))())..[[
            ActivityCollectUI.OpenRefresh()
        end ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return ""
    end
end

function ActivityCollect.Give_Friend(player,friend_guid,Collection,Num)
    if player and friend_guid and Collection then
        local Collection_List = assert(load("return"..player:GetString("Collection")))()
        if Collection_List == nil then
            sLuaApp:NotifyTipsMsg(player, "您还没有任何印章哦，请加油收集吧")
            return
        end
        for k,v in pairs(Collection_List) do
            if k == Collection then
                if v.Count >= 2 * Num then
                    v.Count = v.Count - 2 * Num
                    sMailSystem:SendMail(0,"集印章赢大礼",friend_guid,1,"集印章赢大礼好友礼物","您的好友"..player:GetName().."给您赠送了一个信物凭证，快去活动界面抽取奖励吧！",{},{ActivityCollect.Get_id,Num,1})
                    player:SetString("Collection",Lua_tools.serialize(Collection_List))
                    sLuaApp:NotifyTipsMsg(player, "赠送成功")
                    ActivityCollect.RefreshData(player,1)
                else
                    sLuaApp:NotifyTipsMsg(player, "数量不足")
                end
            end
        end

    end
    return ""
end

function ActivityCollect.Get_Collection_Refresh(player,name)
    local str = [[
        if ActivityCollectUI then
            ActivityCollectUI.CollectionName = ]]..Lua_tools.serialize(name)..[[
            ActivityCollectUI.Collection = ]]..Lua_tools.serialize(assert(load("return"..player:GetString("Collection")))())..[[
            ActivityCollectUI.GetCollectRefresh()
        end ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end
--生成当日任务的表单
function ActivityCollect.Get_Task(player)
    if player then
        local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))()
        if Task_List == nil then
            Task_List = {}
            local Count = 0
            while Count < ActivityCollect.DayCountMax do
                local ID = sLuaApp:RandInteger(1,#ActivityCollect.TaskTable)
                if Count ~= 0 then
                    for k,v in pairs(Task_List) do
                        if v.id == ID then
                            goto continue
                        end
                    end
                end
                table.insert(Task_List,ActivityCollect.TaskTable[ID])
                Count = Count + 1
                ::continue::
            end
            player:SetDayString("Collect_Task",Lua_tools.serialize(Task_List))
            player:SetDayInt("DayRefreshCount",0)
            player:SetDayInt("Collect_Task_Finish",0)
            ActivityCollect.SetTask(player)
        end
        ActivityCollect.Send_on(player)
    end
    return ""
end
--每日任务初始化
function ActivityCollect.SetTask(player)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))()
    for k,v in pairs(Task_List) do
        if v.Type == 0 then
           v.Type = sLuaApp:RandInteger(1,3)
        end
        if v.Type == 3 and v.Rank == 0 then
            local Name = ActivityCollect.GetList[v.id].name
            v.ShowName = "援助"..Name
            v.Rank = sLuaApp:RandInteger(3,5)
            v.ShowInfo = ""..Name.."正在与妖怪的战斗中遇到了麻烦，快去助他一臂之力！"
        elseif v.Type < 3 and v.Rank == 0 then
            v.Rank = sLuaApp:RandInteger(1,5)
            if v.Type == 2 then
                local Name = ActivityCollect.GetList[v.id].name
                v.ShowName = Name.."的请求"
                local Count = sLuaApp:RandInteger(1,#ActivityCollect.HandItemIdList[v.Rank])
                v.HandItemId = ActivityCollect.HandItemIdList[v.Rank][Count]
                v.HandItemName = ActivityCollect.HandItemNameList[v.Rank][Count]
                if v.Rank == 2 or v.Rank == 4 then
                    v.HandItemNum = 2
                else
                    v.HandItemNum = 1
                end
                v.ShowInfo = ""..Name.."需要"..tostring(v.HandItemNum).."个"..v.HandItemName..",快去帮帮他吧！"
            elseif v.Type == 1 then
                local Name = ActivityCollect.GetList[v.id].name
                v.ShowName = "拜访"..Name
                v.ShowInfo = "好久没见到"..Name.."了，去见见他吧。"
            end
        end
    end
    player:SetDayString("Collect_Task",Lua_tools.serialize(Task_List))
    ActivityCollect.Send_on(player)
end
--发送任务表单
function ActivityCollect.Send_on(player)
    local TaskRefreshGold = (math.floor((player:GetDayInt("DayRefreshCount") - 3)/ActivityCollect.PayGrowCount) + 1) * ActivityCollect.PayRefresh
    --sLuaApp:LuaDbg(TaskRefreshGold)
    if TaskRefreshGold >= ActivityCollect.MaxUseMoney then
        TaskRefreshGold = ActivityCollect.MaxUseMoney
    end
    local str = [[
     if ActivityCollectUI then
            ActivityCollectUI.TaskList = ]]..Lua_tools.serialize(assert(load("return"..player:GetDayString("Collect_Task")))())..[[
            ActivityCollectUI.FinishTaskCount = ]]..Lua_tools.serialize(player:GetDayInt("Collect_Task_Finish"))..[[
            ActivityCollectUI.TaskPic = ]]..Lua_tools.serialize(ActivityCollect.TaskPic)..[[
            ActivityCollectUI.DayCanFinishMax = ]]..ActivityCollect.DayCanFinishMax..[[
            ActivityCollectUI.TicketGetNum = ]]..Lua_tools.serialize(ActivityCollect.TicketGetNum)..[[
            ActivityCollectUI.TaskRefreshGold = ]]..TaskRefreshGold..[[
            ActivityCollectUI.TaskRefresh()
     end ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function ActivityCollect.GoTo_Task(player,id)
    if player and id then
        local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
        for k,v in pairs(Task_List) do
            if v.id == tonumber(id) then
                if v.State == 1 then
                    local Finish = player:GetDayInt("Collect_Task_Finish")
                    if Finish >= ActivityCollect.DayCanFinishMax then
                        sLuaApp:NotifyTipsMsg(player, "今日已接取已达上限，不要贪多哦")
                        return
                    end
                    --生成npc
                    --设置为当前player可见
                    --寻路至npc
                    local NpcList = ActivityCollect.NpcCreatList[v.id]
                    local map = sMapSystem:GetMapById(NpcList.mapId)
                    local npc = sNpcSystem:CreateNpc(NpcList.NpcId,map,NpcList.X,NpcList.Y,0,NpcList.rot,1)
                    local NowTime = sLuaApp:SecondSinceEpoch(0)
                    local NowDay = sLuaApp:DaySinceEpoch(0)
                    local NowDayOverTime = (NowDay + 1) * 24 * 60 * 60
                    local DestroyTime = (NowDayOverTime - NowTime) * 1000
                    sLuaTimerSystem:AddTimerEx(npc,DestroyTime,1,"ActivityCollect.DestroyYesterdayNpc","")

                    npc:SetVisible(player)
                    v.State = 2
                    player:SetDayString("Collect_Task",Lua_tools.serialize(Task_List))
                    sLuaApp:NotifyTipsMsg(player, "接取成功")
                    Finish = Finish + 1
                    player:SetDayInt("Collect_Task_Finish",Finish)
                    local str = [[
                    if ActivityCollectUI then
                        ActivityCollectUI.FindNpc(]]..ActivityCollect.NpcCreatList[v.id].mapId..[[,]]..
                            ActivityCollect.NpcCreatList[v.id].X..[[,]]..ActivityCollect.NpcCreatList[v.id].Y..
                            [[,]]..ActivityCollect.NpcCreatList[v.id].NpcId..[[)
                    end
                    ]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                    break
                elseif v.State == 2 then
                    sLuaApp:NotifyTipsMsg(player, "前往任务")
                    local str = [[
                    if ActivityCollectUI then
                        ActivityCollectUI.FindNpc(]]..ActivityCollect.NpcCreatList[v.id].mapId..[[,]] ..
                            ActivityCollect.NpcCreatList[v.id].X..[[,]]..ActivityCollect.NpcCreatList[v.id].Y..
                            [[,]]..ActivityCollect.NpcCreatList[v.id].NpcId..[[)
                    end
                    ]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                elseif v.State == 0 then
                    sLuaApp:NotifyTipsMsg(player, "任务已完成，请不要重复接取")
                end
            end
        end
        ActivityCollect.Send_on(player)
    end
end

function ActivityCollect.FightOver(player, typ, victory, custom)
    sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "ActivityCollect", "FightOver")
    if victory == 2 then
        local Npc = sNpcSystem:GetNpcByGUID(player:GetDayInt("ActivityCollectFightNpc"))
        ActivityCollect.FinishTask(Npc,player)
    end
end

function ActivityCollect.FinishTask(npc,player)
    local NpcName = npc:GetKeyName()
    sNpcSystem:DestroyNpc(npc)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    local Rank
    for k,v in pairs(Task_List) do
        if v.NPC == NpcName then
            v.State = 0
            Rank = v.Rank
            break
        end
    end
    local level = tonumber(player:GetAttr(ROLE_ATTR_LEVEL))
    local exp = level * ActivityCollect.RankRewardList[Rank].Exp
    local money = level * ActivityCollect.RankRewardList[Rank].Money
    local MinGet
    if Rank + ActivityCollect.TicketGetNum[1] <= 0 then
        MinGet = 1
    else
        MinGet = Rank + ActivityCollect.TicketGetNum[1]
    end
    local Num = sLuaApp:RandInteger(MinGet,tonumber(Rank + ActivityCollect.TicketGetNum[2]))
    player:AddExp(exp,"ActivityCollect","ActivityCollect","nil")
    Lua_tools.AddMoney(player,5,money,"system", "集印章赢大礼", "完成任务奖励")
    local ItemContainer = player:GetItemContainer(1)
    if ItemContainer:GetFreeSiteCount() < 1 then
        local Guid = player:GetGUID()
        sMailSystem:SendMail(0,"集印章赢大礼",Guid,1,"物品遗失","因背包空间不足，物品遗失",{},{ActivityCollect.RankRewardList[Rank].Item,Num,1})
    else
        sItemSystem:AddItemEx(player,ActivityCollect.RankRewardList[Rank].Item,Num, false,"system","完成任务奖励","")
    end
    player:SetDayString("Collect_Task",Lua_tools.serialize(Task_List))
    sLuaApp:NotifyTipsMsg(player, "委托完成")
end

function ActivityCollect.HandItem(player,KeyName,Num)
    local Npc = sNpcSystem:GetNpcByGUID(player:GetDayInt("ActivityCollectHandNpc"))
    local NpcName = Npc:GetKeyName()
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    for k,v in pairs(Task_List) do
        if v.NPC == NpcName then
            if v.State ~= 2 then
                sLuaApp:NotifyTipsMsg(player, "任务未开启")
                return
            else
                if v.HandItemNum > tonumber(Num) then
                    sLuaApp:NotifyTipsMsg(player, "提交数量不足")
                    return
                else
                    break
                end
            end
        end
    end
    local ItemId = sItemSystem:GetItemIdByKeyname(KeyName)
    if sItemSystem:ConsumeItemWithId(player, ItemId, Num, 3, "System", "CollectItem", "任务提交道具") == 0 then
        sLuaApp:NotifyTipsMsg(player, "提交成功")
        local str = [[
        if ActivityCollectHandInUI then
            ActivityCollectHandInUI.OnExit()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        ActivityCollect.FinishTask(Npc,player)
    else
        sLuaApp:NotifyTipsMsg(player, "提交物不足")
        return
    end
end

function ActivityCollect.ReTaskRank(player,id)
    local Task_List = assert(load("return"..player:GetDayString("Collect_Task")))() or {}
    --判断今日刷新任务的次数，扣除相应的银币
    local DayRefreshCount = player:GetDayInt("DayRefreshCount")
    if DayRefreshCount > 3 then
        local consume = (math.floor((DayRefreshCount - 3)/ActivityCollect.PayGrowCount) + 1) * ActivityCollect.PayRefresh
        if consume >= ActivityCollect.MaxUseMoney then
            consume = ActivityCollect.MaxUseMoney
        end
        if player:SubBindGold(consume,"system","活动","消耗银币刷新活动任务") then

        else
            sLuaApp:NotifyTipsMsg(player, "银币不足")
            return
        end
    end
    --重随任务品质
    for k,v in pairs(Task_List) do
        if v.id == id then
            local OldRank = 0
            local NewRank = 0
            if v.State ~= 1 then
                sLuaApp:NotifyTipsMsg(player, "只有未开始以及未完成的任务才能重随奖励品质")
                return
            end
            if v.Type == 3 then
                OldRank = v.Rank
                v.Rank = ActivityCollect.GetRank(3,5)
                NewRank = v.Rank
            else
                OldRank = v.Rank
                v.Rank = ActivityCollect.GetRank(1,5)
                NewRank = v.Rank
                if v.Type == 2 then
                    local Name = ActivityCollect.GetList[v.id].name
                    v.ShowName = Name.."的请求"
                    local Count = sLuaApp:RandInteger(1,#ActivityCollect.HandItemIdList[v.Rank])
                    v.HandItemId = ActivityCollect.HandItemIdList[v.Rank][Count]
                    v.HandItemName = ActivityCollect.HandItemNameList[v.Rank][Count]
                    if v.Rank == 2 or v.Rank == 4 then
                        v.HandItemNum = 2
                    else
                        v.HandItemNum = 1
                    end
                    v.ShowInfo = ""..Name.."需要"..tostring(v.HandItemNum).."个"..v.HandItemName..",快去帮帮他吧！"

                end
            end
            if OldRank > NewRank then
                sLuaApp:NotifyTipsMsg(player, "刷新成功，任务品级下降。")
            elseif OldRank == NewRank then
                sLuaApp:NotifyTipsMsg(player, "刷新成功，任务品级不变。")
            elseif OldRank < NewRank then
                sLuaApp:NotifyTipsMsg(player, "刷新成功，任务品级上升。")
            end
        end
    end
    player:SetDayString("Collect_Task",Lua_tools.serialize(Task_List))
    player:SetDayInt("DayRefreshCount",DayRefreshCount + 1)
    local TaskRefreshGold = (math.floor((player:GetDayInt("DayRefreshCount") - 3)/ActivityCollect.PayGrowCount) + 1) * ActivityCollect.PayRefresh
    --sLuaApp:LuaDbg(TaskRefreshGold)
    if TaskRefreshGold >= ActivityCollect.MaxUseMoney then
        TaskRefreshGold = ActivityCollect.MaxUseMoney
    end
    local str = [[
    if ActivityCollectUI then
        ActivityCollectUI.TaskList = ]]..Lua_tools.serialize(Task_List)..[[
        ActivityCollectUI.TaskRefreshGold = ]]..TaskRefreshGold..[[
        ActivityCollectUI.TaskRefreshGold = ]]..TaskRefreshGold..[[
        ActivityCollectUI.TaskRefresh()
    end]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end
--品质随机方法
function ActivityCollect.GetRank(Min,Max)
    local List = {}
    local min = Min
    local max = Max
    local custom = 0
    while min <= max do
        custom = custom + ActivityCollect.RankRandom[min].Rand
        table.insert(List,#List + 1,{["Rank"] = min,["Rand"] = custom})
        min = min + 1
    end
    local result = sLuaApp:RandInteger(1,custom)
    local Rank = 0
    for i = 1 , #List do
        if result <= List[i]["Rand"] then
            Rank = List[i]["Rank"]
            break
        end
    end
    return Rank
end
--活动开始前回调
function ActivityCollect.OnDeclare(id, seconds) end
--活动开始回调
function ActivityCollect.OnStart(id, is_normal)
end
--活动结束回调
function ActivityCollect.OnStop(id) end
--玩家点击参与活动回调
function ActivityCollect.OnJoin(id, player)
    if FunctionSwitch.AllFuncitonConfig['ActivityCollect'] == "off" then
        sLuaApp:NotifyTipsMsg(player, "活动未开启")
        return
    end
    local str = [[
    GUI.OpenWnd("ActivityCollectUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end
-- 玩家客户端查询数据回调
function ActivityCollect.OnQuery(id, player)
    local show_item = "30000,61025,61024"

    local is_joined = 0

    local str = is_joined..":0:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("ActivityCollect") or "5")
    --分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
    --活动状态（1，可参加  2，进行中   3，已参与）
    return str
end

function ActivityCollect.DestroyYesterdayNpc(Npc)
    if Npc then
        sNpcSystem:DestroyNpc(Npc)
    end
end



