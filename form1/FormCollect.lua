--收集活动表单
FormCollect = {}
--打开时获取印章数量以及礼包奖励数据
function FormCollect.GetData(player)
    if ActivityCollect then
        ActivityCollect.Get_Data(player)
    end
    return ""
end
--领取礼包
function FormCollect.Get_Reward(player,reward_name)
    if ActivityCollect then
        ActivityCollect.Get_Reward(player,reward_name)
    end
    return ""
end
--抽取印章
function FormCollect.Get_Collection(player)
    if ActivityCollect then
        ActivityCollect.Get_Collection(player)
    end
    return ""
end

--赠送好友印章
function FormCollect.Give_Friend(player,friend_guid,Collection,Num)
    if ActivityCollect then
        ActivityCollect.Give_Friend(player,friend_guid,Collection,Num)
    end
    return ""
end

--获取活动任务内容
function FormCollect.Get_Task(player)
    if ActivityCollect then
        ActivityCollect.Get_Task(player)
    end
    return ""
end

--接取任务（点击前往）
function FormCollect.GoTo_Task(player,id)
    if ActivityCollect then
        ActivityCollect.GoTo_Task(player,id)
    end
    return ""
end

--提交物品
function FormCollect.HandItem(player,Data)
    if Data then
        local Item = sLuaApp:StrSplit(Data,"_")
        if ActivityCollect then
            ActivityCollect.HandItem(player,Item[1],Item[2])
        end
    end
    return ""
end

function FormCollect.ReTaskRank(player,id)
    if ActivityCollect then
        ActivityCollect.ReTaskRank(player,id)
    end
    return ""
end