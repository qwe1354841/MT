--五星连珠活动（原BinGo大奖）
BinGoBigPrize = {}

--是否可以重复点亮
BinGoBigPrize.RepeatedLight = false

--最多可连续重复点亮次数，超过此次数必定会点亮新的星星
BinGoBigPrize.Max_RepeatedLight = 3

--[[
    任务配置
    name：任务标题（不超过五个字）
    explain：任务说明
    img：任务图标
    type:任务类型，需在 BinGoQuestCallBack 脚本里进行支持
        1 ：师门任务  param ：进行多少次师门任务可以得到点亮次数
        2 ：帮派任务  param ：进行多少次帮派任务可以得到点亮次数
        3 ：羽翼任务  param ：进行多少次羽翼升级可以得到点亮次数
        4 ：天梯任务  param ：进行多少次天梯挑战可以得到点亮次数
        5 ：答题任务  param ：进行多少次西游奇缘答题可以得到点亮次数
        6 ：消费任务  param ：消费多少元宝可以得到点亮次数
    getnum：完成任务获得的点亮次数
    intkey：记录任务次数的自定义变量Key值
]]--
BinGoBigPrize.Quest = {
    [1] = {name = "师门任务" , img = "1801109130" ,explain = "每完成10次任务即可获得1次点亮次数" , type = 1 , param = 10  , getnum = 1 , intkey = "BinGo_ShiMenQuest"},
    [2] = {name = "帮派任务" , img = "1801109410" ,explain = "每完成10次任务即可获得1次点亮次数" , type = 2 , param = 10  , getnum = 1 , intkey = "BinGo_GuildQuest"},
    [3] = {name = "羽翼升级" , img = "1801109100" ,explain = "每升级10次羽翼即可获得1次点亮次数" , type = 3 , param = 10  , getnum = 1 , intkey = "BinGo_WingQuest"},
    [4] = {name = "天梯挑战" , img = "1801109380" ,explain = "每完成10次挑战即可获得1次点亮次数" , type = 4 , param = 10  , getnum = 1 , intkey = "BinGo_TianTiQuest"},
    [5] = {name = "西游奇缘" , img = "1801109070" ,explain = "每完成10次答题即可获得1次点亮次数" , type = 5 , param = 10  , getnum = 1 , intkey = "BinGo_XiYouQiYuanQuest"},
    [6] = {name = "元宝任务" , img = "1801109190" ,explain = "每消费500元宝即可获得1次点亮次数"  , type = 6 , param = 500 , getnum = 1 , intkey = "BinGo_CostQuest"},
}

--奖励配置（每个奖励池为24个）  item ：物品列表
BinGoBigPrize.RewardConfig = {
    [1] = {
        item = {
            {key =  "3级攻击石" , num = 1},
            {key =  "必杀秘籍" , num = 1},
            {key =  "神兽碎片包" , num = 1},
            {key =  "3级魔攻石" , num = 1},
            {key =  "血池3" , num = 1},
            {key =  "魔池3" , num = 1},
            {key =  "还原丹" , num = 1},
            {key =  "3级封印石" , num = 1},
            {key =  "小修炼丹" , num = 1},
            {key =  "藏宝图" , num = 1},
            {key =  "3级魔抗石" , num = 1},
            {key =  "小银币袋" , num = 1},
            {key =  "仙兽玉牌" , num = 1},
            {key =  "宠物经验丹2" , num = 1},
            {key =  "3级暴击石" , num = 1},
            {key =  "强化保固石" , num = 1},
            {key =  "100银元" , num = 1},
            {key =  "祈福卷轴1" , num = 5},
            {key =  "增加耐力" , num = 1},
            {key =  "3级速度石" , num = 1},
            {key =  "普通洗练符" , num = 1},
            {key =  "合成幸运符" , num = 1},
            {key =  "3级生命石" , num = 1},
            {key =  "强化打造石1" , num = 1},
            {key =  "猪八戒幻身咒" , num = 1},
            {key =  "3级物抗石" , num = 1},
        }
        },
    [2] = {
        item = {
            {key =  "4级攻击石" , num = 1},
            {key =  "吸血秘籍" , num = 1},
            {key =  "神兽碎片包" , num = 1},
            {key =  "4级魔攻石" , num = 1},
            {key =  "血池3" , num = 2},
            {key =  "魔池3" , num = 2},
            {key =  "还原丹" , num = 1},
            {key =  "4级封印石" , num = 1},
            {key =  "修炼丹" , num = 1},
            {key =  "藏宝图" , num = 2},
            {key =  "4级魔抗石" , num = 1},
            {key =  "小银币袋" , num = 2},
            {key =  "仙兽玉牌" , num = 1},
            {key =  "宠物经验丹2" , num = 2},
            {key =  "4级暴击石" , num = 1},
            {key =  "强化保固石" , num = 2},
            {key =  "200银元" , num = 1},
            {key =  "祈福卷轴1" , num = 10},
            {key =  "增加敏捷" , num = 1},
            {key =  "4级速度石" , num = 1},
            {key =  "普通洗练符" , num = 2},
            {key =  "合成幸运符" , num = 2},
            {key =  "4级生命石" , num = 1},
            {key =  "强化打造石1" , num = 2},
            {key =  "牛魔王幻身咒" , num = 1},
            {key =  "4级物抗石" , num = 1},
        }
        },
    [3] = {
        item = {
            {key =  "4级攻击石" , num = 2},
            {key =  "吸血秘籍" , num = 1},
            {key =  "神兽碎片包" , num = 1},
            {key =  "4级魔攻石" , num = 2},
            {key =  "血池3" , num = 5},
            {key =  "魔池3" , num = 5},
            {key =  "还原丹" , num = 1},
            {key =  "4级封印石" , num = 2},
            {key =  "修炼丹" , num = 2},
            {key =  "藏宝图" , num = 3},
            {key =  "4级魔抗石" , num = 2},
            {key =  "小银币袋" , num = 3},
            {key =  "仙兽玉牌" , num = 1},
            {key =  "宠物经验丹2" , num = 3},
            {key =  "5级暴击石" , num = 2},
            {key =  "强化保固石" , num = 4},
            {key =  "500银元" , num = 1},
            {key =  "祈福卷轴2" , num = 5},
            {key =  "增加体质" , num = 1},
            {key =  "4级速度石" , num = 2},
            {key =  "普通洗练符" , num = 3},
            {key =  "合成大幸运符" , num = 1},
            {key =  "4级生命石" , num = 2},
            {key =  "强化打造石1" , num = 5},
            {key =  "灵感大王幻身咒" , num = 1},
            {key =  "4级物抗石" , num = 2},
        }
        },
    [4] = {
        item = {
            {key =  "5级攻击石" , num = 1},
            {key =  "高级连击秘籍" , num = 1},
            {key =  "神兽碎片包" , num = 1},
            {key =  "5级魔攻石" , num = 1},
            {key =  "血池3" , num = 10},
            {key =  "魔池3" , num = 10},
            {key =  "还原丹" , num = 3},
            {key =  "5级封印石" , num = 1},
            {key =  "修炼丹" , num = 5},
            {key =  "藏宝图" , num = 3},
            {key =  "5级魔抗石" , num = 1},
            {key =  "小银币袋" , num = 5},
            {key =  "仙兽玉牌" , num = 1},
            {key =  "宠物经验丹2" , num = 5},
            {key =  "5级暴击石" , num = 1},
            {key =  "强化保固石" , num = 7},
            {key =  "600银元" , num = 1},
            {key =  "祈福卷轴2" , num = 10},
            {key =  "增加耐力" , num = 2},
            {key =  "5级速度石" , num = 1},
            {key =  "普通洗练符" , num = 5},
            {key =  "合成大幸运符" , num = 1},
            {key =  "5级生命石" , num = 1},
            {key =  "强化打造石1" , num = 10},
            {key =  "灵吉菩萨幻身咒" , num = 1},
            {key =  "5级物抗石" , num = 1},
        }
        },
    [5] = {
        item = {
            {key =  "5级攻击石" , num = 2},
            {key =  "追击秘籍" , num = 1},
            {key =  "神兽碎片包" , num = 1},
            {key =  "5级魔攻石" , num = 2},
            {key =  "血池3" , num = 10},
            {key =  "魔池3" , num = 10},
            {key =  "还原丹" , num = 3},
            {key =  "5级封印石" , num = 2},
            {key =  "高级修炼丹" , num = 5},
            {key =  "高级藏宝图" , num = 1},
            {key =  "5级魔抗石" , num = 2},
            {key =  "小银币袋" , num = 8},
            {key =  "仙兽玉牌" , num = 1},
            {key =  "宠物经验丹2" , num = 10},
            {key =  "5级暴击石" , num = 2},
            {key =  "强化保固石" , num = 10},
            {key =  "1000银元" , num = 1},
            {key =  "祈福卷轴2" , num = 15},
            {key =  "增加耐力" , num = 2},
            {key =  "5级速度石" , num = 2},
            {key =  "洗练锁定符" , num = 2},
            {key =  "合成大幸运符" , num = 2},
            {key =  "5级生命石" , num = 2},
            {key =  "强化打造石1" , num = 15},
            {key =  "孙悟空幻身咒" , num = 1},
            {key =  "5级物抗石" , num = 2},
        }
        },
}

function BinGoBigPrize.GetData(player)
    if not player then
        return
    end
      local LightNum = player:GetWeekInt("BinGo_LightNum")

    --格子数据
    local itemlist = {}
    local NowBinGoList = player:GetWeekInt("NowBinGoList")
    if NowBinGoList == 0 then
        NowBinGoList = 1
        player:SetWeekInt("NowBinGoList",NowBinGoList)
    end
      if player:GetWeekString("BinGoAwardList") == "" then
        itemlist = BinGoBigPrize.GetAwardList(player,NowBinGoList,true)
    else
        itemlist = BinGoBigPrize.StrToTable(player:GetWeekString("BinGoAwardList"))
    end
    --任务数据
    local task_data = {}
    for k, v in pairs(BinGoBigPrize.Quest) do
        task_data[k] = {}
        task_data[k]["img"] = v.img
        task_data[k]["name"] = v.name
        task_data[k]["explain"] = v.explain
        task_data[k]["finished_num"] = player:GetWeekInt(v.intkey)
        task_data[k]["num"] = v.param
        task_data[k]["get_num"] = v.getnum
    end
    local str = [[
        if WelBingoUI then
            WelBingoUI.activate_count = ]]..LightNum..[[
            WelBingoUI.current_award_subscript = ]]..player:GetWeekInt("NowBinGoList")..[[
            WelBingoUI.award_count = ]]..#BinGoBigPrize.RewardConfig..[[
            WelBingoUI.box_data = ]]..Lua_tools.serialize(itemlist)..[[
            WelBingoUI.show_task_data = ]]..Lua_tools.serialize(task_data)..[[ 
            if WelBingoUI.require_all_data_callback then
                WelBingoUI.require_all_data_callback()
            end
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单",str)
end

--刷新点亮次数
function BinGoBigPrize.RefreshLightNum(player)
    if not player then
        return
    end
    local str = [[
        if WelBingoUI then
            WelBingoUI.activate_count = ]]..player:GetWeekInt("BinGo_LightNum")..[[
            if WelBingoUI.require_lighten_count_callback then
                WelBingoUI.require_lighten_count_callback()
            end
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单",str)
end

--刷新任务数据
function BinGoBigPrize.RefreshQuestData(player)
    if not player then
        return
    end
    local task_data = {}
    for k, v in pairs(BinGoBigPrize.Quest) do
        task_data[k] = {}
        task_data[k]["img"] = v.img
        task_data[k]["name"] = v.name
        task_data[k]["explain"] = v.explain
        task_data[k]["finished_num"] = player:GetWeekInt(v.intkey)
        task_data[k]["num"] = v.param
        task_data[k]["get_num"] = v.getnum
    end
    local str = [[
        if WelBingoUI then
            WelBingoUI.show_task_data = ]]..Lua_tools.serialize(task_data)..[[
            if WelBingoUI.request_task_data_callback then
                WelBingoUI.request_task_data_callback()
            end
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单",str)
end

--刷新指定索引的格子
function BinGoBigPrize.RefreshAwardList(player,index)
    index = tonumber(index)
    if not player or not index then
        return
    end
    if index > #BinGoBigPrize.RewardConfig then
        return
    end
    local str = [[]]
    local itemlist = {}
    if index == player:GetWeekInt("NowBinGoList") then
        itemlist = player:GetWeekString("BinGoAwardList")
        str = [[
            if WelBingoUI then
                WelBingoUI.box_data = ]]..itemlist..[[
                if WelBingoUI.other_stage_award_data_callback then
                    WelBingoUI.other_stage_award_data_callback()
                end
            end
        ]]
    else
        itemlist = BinGoBigPrize.GetAwardList(player,index)
        str = [[
            if WelBingoUI then
                WelBingoUI.box_data = ]]..Lua_tools.serialize(itemlist)..[[
                if WelBingoUI.other_stage_award_data_callback then
                    WelBingoUI.other_stage_award_data_callback()
                end
            end
        ]]
    end

    sLuaApp:ShowForm(player, "脚本表单",str)
end

--得到指定奖励列表
function BinGoBigPrize.GetAwardList(player,list_index,IsFirst)
    if not player or not list_index then
        return
    end
    local NowBinGoList = player:GetWeekInt("NowBinGoList")
    local itemlist = {}
    local List = BinGoBigPrize.RewardConfig[list_index].item
    local index = 1
    for i = 1, 7 do
        itemlist[i] = {}
        for j = 1, 7 do
            itemlist[i][j] = {}
            if i == 1 or i == 7 then
                itemlist[i][j]["key_name"] = List[index].key
                itemlist[i][j]["num"] = List[index].num
                if list_index < NowBinGoList then
                    itemlist[i][j]["is_activation"] = true
                else
                    itemlist[i][j]["is_activation"] = false
                end
                index = index+1
            elseif j == 1 and i >= 2 and i <= 7 then
                itemlist[i][j]["key_name"] = List[index].key
                itemlist[i][j]["num"] = List[index].num
                if list_index < NowBinGoList then
                    itemlist[i][j]["is_activation"] = true
                else
                    itemlist[i][j]["is_activation"] = false
                end
                index = index+1
            elseif j == 7 and i >= 2 and i <= 7 then
                itemlist[i][j]["key_name"] = List[index].key
                itemlist[i][j]["num"] = List[index].num
                if list_index < NowBinGoList then
                    itemlist[i][j]["is_activation"] = true
                else
                    itemlist[i][j]["is_activation"] = false
                end
                index = index+1
            else
                if list_index < NowBinGoList then
                    itemlist[i][j]["is_activation"] = true
                else
                    itemlist[i][j]["is_activation"] = false
                end
            end
        end
    end
    if IsFirst then
        player:SetWeekString("BinGoAwardList",Lua_tools.serialize(itemlist))
    end
    return itemlist
end

--点亮格子
function BinGoBigPrize.Lighten(player)
    if not player then
        return
    end
    if player:GetWeekInt("BinGo_LightNum") < 1 then
        sLuaApp:NotifyTipsMsg(player, "您的点亮次数不足，去做任务获取吧！")
        return
    end
    --判断是否可以重复点亮
    if BinGoBigPrize.RepeatedLight and player:GetWeekInt("BinGo_Repeated_Num") < BinGoBigPrize.Max_RepeatedLight then
        BinGoBigPrize.Repeated_Lighten(player)
    elseif BinGoBigPrize.RepeatedLight and player:GetWeekInt("BinGo_Repeated_Num") >= BinGoBigPrize.Max_RepeatedLight then
        BinGoBigPrize.Normal_Lighten(player)
    else
        BinGoBigPrize.Normal_Lighten(player)
    end
end

--普通点亮
function BinGoBigPrize.Normal_Lighten(player)
    if not player then return end

    local NowBinGoList = player:GetWeekInt("NowBinGoList")
    if NowBinGoList == 0 then
        NowBinGoList = 1
        player:SetWeekInt("NowBinGoList",NowBinGoList)
    end

    if player:GetWeekString("BinGoAwardList") == "" then
        BinGoBigPrize.GetAwardList(player,NowBinGoList,true)
    end


    local randnum = 0
    local LightStr = player:GetWeekString("LightArray")
    local LightArray = sLuaApp:StrSplit(LightStr,"_")
    if LightStr == "" then
        randnum = BinGoBigPrize.GetRand_Lighten({},25)
        player:SetWeekString("LightArray",tostring(randnum))
        player:SetWeekInt("BinGo_LightNum",player:GetWeekInt("BinGo_LightNum")-1)
        if player:GetWeekInt("BinGo_LightNum") <= 0 then
            BinGoBigPrize.ReaPoint_LightNum(player)
        end
    else
        if #LightArray >= 25 then
            sLuaApp:NotifyTipsMsg(player, "您已经点亮了所有的格子，无法继续点亮")
            return
        else
            randnum = BinGoBigPrize.GetRand_Lighten(LightArray,25)
            player:SetWeekString("LightArray",LightStr.."_"..randnum)
            player:SetWeekInt("BinGo_LightNum",player:GetWeekInt("BinGo_LightNum")-1)
            if player:GetWeekInt("BinGo_LightNum") <= 0 then
                BinGoBigPrize.ReaPoint_LightNum(player)
            end
        end
    end
    local hang,lie =  BinGoBigPrize.NumToXY(randnum)
    local AwardList = BinGoBigPrize.StrToTable(player:GetWeekString("BinGoAwardList"))
    AwardList[hang][lie].is_activation = true
    if player:GetWeekInt("BinGo_Repeated_Num") >= BinGoBigPrize.Max_RepeatedLight then
        player:SetWeekInt("BinGo_Repeated_Num",0)
    end
    BinGoBigPrize.AwardJudge(player,AwardList,hang,lie)
end

--可重复点亮
function BinGoBigPrize.Repeated_Lighten(player)

    local NowBinGoList = player:GetWeekInt("NowBinGoList")
    if NowBinGoList == 0 then
        NowBinGoList = 1
        player:SetWeekInt("NowBinGoList",NowBinGoList)
    end

    if player:GetWeekString("BinGoAwardList") == "" then
        BinGoBigPrize.GetAwardList(player,NowBinGoList,true)
    end

    if not player then return end
    local AwardList = BinGoBigPrize.StrToTable(player:GetWeekString("BinGoAwardList"))
    local randnum =  sLuaApp:RandInteger(1,25)

    local LightStr = player:GetWeekString("LightArray")
    local LightArray = sLuaApp:StrSplit(LightStr,"_")
    if LightStr ~= "" then
        if #LightArray >= 25 then
            sLuaApp:NotifyTipsMsg(player, "您已经点亮了所有的格子，无法继续点亮")
            return
        end
    end

    player:SetWeekInt("BinGo_LightNum",player:GetWeekInt("BinGo_LightNum")-1)
    if player:GetWeekInt("BinGo_LightNum") <= 0 then
        BinGoBigPrize.ReaPoint_LightNum(player)
    end

    local hang,lie =  BinGoBigPrize.NumToXY(randnum)
    if AwardList[hang][lie].is_activation == true then
        local xy_list = {}
        xy_list["row"] = hang
        xy_list["column"] = lie
        player:SetWeekInt("BinGo_Repeated_Num",player:GetWeekInt("BinGo_Repeated_Num")+1)
        local str = [[
            if WelBingoUI then
                WelBingoUI.activate_count = ]]..player:GetWeekInt("BinGo_LightNum")..[[
                WelBingoUI.lighten_result = ]]..Lua_tools.serialize(xy_list)..[[
                if WelBingoUI.lighten_require_call_back then
                    WelBingoUI.lighten_require_call_back()
                end
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单",str)
        player:SetWeekInt("BinGo_Repeated_Light",1)
    else
        player:SetWeekString("LightArray",LightStr.."_"..randnum)
        AwardList[hang][lie].is_activation = true
        BinGoBigPrize.AwardJudge(player,AwardList,hang,lie)
        player:SetWeekInt("BinGo_Repeated_Num",0)
    end
end

--可领取奖励判断
function BinGoBigPrize.AwardJudge(player,AwardList,hang,lie)
    if not player or not hang or not lie then
        return
    end
    hang = tonumber(hang)
    lie = tonumber(lie)
    --判断是否是星星格子
    if hang == 1 or hang == 7 or lie == 1 or lie == 7 then
        return
    end

    local UnreceivedList = {}

    if hang + lie == 8 or hang == lie then
        BinGoBigPrize.HangAwardJudge(player,AwardList,hang,UnreceivedList)
        BinGoBigPrize.LieAwardJudge(player,AwardList,lie,UnreceivedList)
        BinGoBigPrize.DiagonalAwardJudge(player,AwardList,hang,lie,UnreceivedList)
    else
        BinGoBigPrize.HangAwardJudge(player,AwardList,hang,UnreceivedList)
        BinGoBigPrize.LieAwardJudge(player,AwardList,lie,UnreceivedList)
    end
    player:SetWeekString("BinGoAwardList",Lua_tools.serialize(AwardList))
    player:SetWeekString("BinGo_Unreceived",Lua_tools.serialize(UnreceivedList))

    local xy_list = {}
    xy_list["row"] = hang
    xy_list["column"] = lie
    local str = [[
        if WelBingoUI then
            WelBingoUI.activate_count = ]]..player:GetWeekInt("BinGo_LightNum")..[[
            WelBingoUI.lighten_result = ]]..Lua_tools.serialize(xy_list)..[[
            WelBingoUI.box_data = ]]..Lua_tools.serialize(AwardList)..[[
                
            if WelBingoUI.lighten_require_call_back then
                WelBingoUI.lighten_require_call_back()
            end
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单",str)
end

--领取奖励
function BinGoBigPrize.GetAward(player,hang,lie)
    hang = tonumber(hang)
    lie = tonumber(lie)
    if not player or not hang or not lie then return end
    if player:GetWeekString("BinGo_Unreceived") == "" then
        if player:GetWeekInt("BinGo_Repeated_Light") == 1 then
            sLuaApp:NotifyTipsMsg(player, "第"..(hang-1).."行第"..(lie-1).."列的星星已是点亮状态，本次没有点亮新的星星")
            player:SetWeekInt("BinGo_Repeated_Light",0)
            local str = [[
                if WelBingoUI then
                    WelBingoUI.get_gift_behind_lighted_callback()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单",str)
        end
        return
    else
        sLuaApp:NotifyTipsMsg(player, "第"..(hang-1).."行第"..(lie-1).."列的星星被点亮")
        local itemdata = BinGoBigPrize.StrToTable(player:GetWeekString("BinGo_Unreceived"))
        for k, v in pairs(itemdata) do
            Lua_tools.AddItem(player, v.itemlist, "system", "五星连珠活动奖励", "第"..v.hang.."行第"..v.lie.."排奖励")
        end
        player:SetWeekString("BinGo_Unreceived","")
        --下张图判断
        local LightStr = player:GetWeekString("LightArray")
        local LightArray = sLuaApp:StrSplit(LightStr,"_")
        if player:GetWeekInt("NowBinGoList") >= #BinGoBigPrize.RewardConfig then
            if #LightArray >= 25 then
                BinGoBigPrize.ReaPoint_LightNum(player)
                sLuaApp:NotifyTipsMsg(player, "本周的五星连珠奖励已全部领取，下周再继续加油吧！")
            end
        else
            if #LightArray >= 25 then
                sLuaApp:NotifyTipsMsg(player, "当前奖图的奖励星星已经全部点亮，您可以开始点亮下一张图！")
                player:SetWeekInt("NowBinGoList",player:GetWeekInt("NowBinGoList")+1)
                local NewList = BinGoBigPrize.GetAwardList(player,player:GetWeekInt("NowBinGoList"))
                player:SetWeekString("BinGoAwardList",Lua_tools.serialize(NewList))
                player:SetWeekString("LightArray","")
            end
        end
        local str = [[
            if WelBingoUI then
                WelBingoUI.get_gift_behind_lighted_callback()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单",str)
    end
end

--如果玩家在点亮途中关闭客户端，导致奖励没有发放，上线进行判断
function BinGoBigPrize.OnLogin(player)
    local item_list = {}
    if FunctionSwitch.AllFuncitonConfig['BinGo'] == "on" then
        if player:GetWeekString("BinGo_Unreceived") ~= "" then
            local itemdata = BinGoBigPrize.StrToTable(player:GetWeekString("BinGo_Unreceived"))
            for k, v in pairs(itemdata) do
                table.insert(item_list,sItemSystem:GetItemIdByKeyname(v.itemlist[1]))
                table.insert(item_list,v.itemlist[2])
                table.insert(item_list,1)
            end
            sMailSystem:SendMailEx(0, "游方道士" , player:GetGUID(), 3, "五星连珠" , "您有五星连珠活动的奖励遗留在我这，现寄送给少侠，请少侠查收。", {},item_list,{})
            player:SetWeekString("BinGo_Unreceived","")
        end
        --下张图判断
        local LightStr = player:GetWeekString("LightArray")
        local LightArray = sLuaApp:StrSplit(LightStr,"_")
        if player:GetWeekInt("NowBinGoList") >= #BinGoBigPrize.RewardConfig then
            if #LightArray >= 25 then
                BinGoBigPrize.ReaPoint_LightNum(player)
            end
        else
            if #LightArray >= 25 then
                player:SetWeekInt("NowBinGoList",player:GetWeekInt("NowBinGoList")+1)
                local NewList = BinGoBigPrize.GetAwardList(player,player:GetWeekInt("NowBinGoList"))
                player:SetWeekString("BinGoAwardList",Lua_tools.serialize(NewList))
                player:SetWeekString("LightArray","")
            end
        end
        if player:GetWeekInt("BinGo_LightNum") > 0 then
            local redpoint = true
            local LightStr = player:GetWeekString("LightArray")
            local LightArray = sLuaApp:StrSplit(LightStr,"_")
            if player:GetWeekInt("NowBinGoList") >= #BinGoBigPrize.RewardConfig then
                if #LightArray >= 25 then
                    redpoint = false
                end
            end

            local str = [[
                if GlobalProcessing and GlobalProcessing.BinGo_DataLoading then
                    GlobalProcessing.is_show_WelBingoUI_red = ]]..tostring(redpoint)..[[
                    GlobalProcessing.BinGo_DataLoading()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单",str)
        else
            local str = [[
                if GlobalProcessing and GlobalProcessing.BinGo_DataLoading then
                    GlobalProcessing.is_show_WelBingoUI_red = fasle
                    GlobalProcessing.BinGo_DataLoading()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单",str)
        end
    end
end

--同行领取奖励判断
function BinGoBigPrize.HangAwardJudge(player,AwardList,hang,UnreceivedList)
    local IsLight = true
    for i = 2 , 6 do
        if AwardList[hang][i].is_activation == false then
            IsLight = false
            break
        end
    end
    if IsLight then
        for i = 1, 7, 6 do
            local list = {}
            list["itemlist"] = {AwardList[hang][i].key_name,AwardList[hang][i].num}
            list["hang"] = hang
            list["lie"] = i
            AwardList[hang][i].is_activation = true
            table.insert(UnreceivedList,list)
        end
    end
end

--同列领取奖励判断
function BinGoBigPrize.LieAwardJudge(player,AwardList,lie,UnreceivedList)
    local IsLight = true
    for i = 2 , 6 do
        if AwardList[i][lie].is_activation == false then
            IsLight = false
            break
        end
    end
    if IsLight then
        for i = 1, 7, 6 do
            local list = {}
            list["itemlist"] = {AwardList[i][lie].key_name,AwardList[i][lie].num}
            list["hang"] = i
            list["lie"] = lie
            AwardList[i][lie].is_activation = true
            table.insert(UnreceivedList,list)
        end
    end
end

--斜线领取奖励判断
function BinGoBigPrize.DiagonalAwardJudge(player,AwardList,hang,lie,UnreceivedList)
    if hang == lie and hang + lie ~= 8 then
        local IsLight = true
        for i = 2 , 6 do
            if AwardList[i][i].is_activation == false then
                IsLight = false
                break
            end
        end
        if IsLight then
            for i = 1, 7, 6 do
                local list = {}
                list["itemlist"] = {AwardList[i][i].key_name,AwardList[i][i].num} 
                list["hang"] = i
                list["lie"] = i
                AwardList[i][i].is_activation = true
                table.insert(UnreceivedList,list)
            end
        end
    elseif hang + lie == 8 and hang ~= lie then
        local IsLight = true
        for i = 2 , 6 do
            if AwardList[i][8-i].is_activation == false then
                IsLight = false
                break
            end
        end
        if IsLight then
            for i = 1, 7, 6 do
                local list = {}
                list["itemlist"] = {AwardList[i][8-i].key_name,AwardList[i][8-i].num}
                list["hang"] = i
                list["lie"] = 8-i
                AwardList[i][8-i].is_activation = true
                table.insert(UnreceivedList,list)
            end
        end
    else
        local IsLight_1 = true
        for i = 2 , 6 do
            if AwardList[i][i].is_activation == false then
                IsLight_1 = false
                break
            end
        end
        if IsLight_1 then
            for i = 1, 7, 6 do
                local list = {}
                list["itemlist"] = {AwardList[i][i].key_name,AwardList[i][i].num}
                list["hang"] = i
                list["lie"] = i
                AwardList[i][i].is_activation = true
                table.insert(UnreceivedList,list)
            end
        end
        local IsLight = true
        for i = 2 , 6 do
            if AwardList[i][8-i].is_activation == false then
                IsLight = false
                break
            end
        end
        if IsLight then
            for i = 1, 7, 6 do
                local list = {}
                list["itemlist"] = {AwardList[i][8-i].key_name,AwardList[i][8-i].num}
                list["hang"] = i
                list["lie"] = 8-i
                AwardList[i][8-i].is_activation = true
                table.insert(UnreceivedList,list)
            end
        end
    end
end

--任务判断
function BinGoBigPrize.QuestJudge(player)
    if not player then
        return
    end

    local QuestList = {}
    for k, v in pairs(BinGoBigPrize.Quest) do
        QuestList[k] = {}
        QuestList[k]["task_name"] = v.name
        QuestList[k]["task_status"] = player:GetInt("")
        QuestList[k]["task_award"] = v.getnum
        QuestList[k]["task_content"] = v.synopsis
    end
    return QuestList
end

--小红点判断和点亮次数实时刷新
function BinGoBigPrize.ReaPoint_LightNum(player)
    if not player then
        return
    end
    local num = player:GetWeekInt("BinGo_LightNum")
    local str = ""
    if num >= 1 then
        local redpoint = true
        local LightStr = player:GetWeekString("LightArray")
        local LightArray = sLuaApp:StrSplit(LightStr,"_")
        if player:GetWeekInt("NowBinGoList") >= #BinGoBigPrize.RewardConfig then
            if #LightArray >= 25 then
                redpoint = false
            end
        end
        str = [[
            if GlobalProcessing then
                GlobalProcessing.is_show_WelBingoUI_red = ]]..tostring(redpoint)..[[
                if GlobalProcessing.BinGo_DataLoading then
                    GlobalProcessing.BinGo_DataLoading()
                end
            end
        ]]
    elseif num == 0 then
        str = [[
            if GlobalProcessing then
                GlobalProcessing.is_show_WelBingoUI_red = false
                if GlobalProcessing.BinGo_DataLoading then
                    GlobalProcessing.BinGo_DataLoading()
                end
            end
        ]]
    end

    str = str..[[
        if WelBingoUI and WelBingoUI.require_lighten_count_callback then
            WelBingoUI.activate_count = ]]..num..[[
            WelBingoUI.require_lighten_count_callback()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单",str)
end

function BinGoBigPrize.NumToXY(Num)
    Num = tonumber(Num)
    if not Num then return end
    local hang = 0
    local lie = 0
    if Num%5 == 0 then
        hang = math.floor(Num/5) + 1
        lie = 5 + 1
    else
        hang = math.floor(Num/5) + 2
        lie = Num%5 + 1
    end
    return hang,lie
end

--字符串转表格
function BinGoBigPrize.StrToTable(add_num)
    if type(add_num) ~= "string" then
        return ""
    end
    local res_num = {}
    if add_num ~= "" then
        res_num = assert(load(" return " .. add_num))()
    end
	return res_num
end

--得到不同于指定数字的随机数
function BinGoBigPrize.GetRand_Lighten(array,maxnum)
    if not array or not maxnum then
        return
    end

    local randnum = 0
    local t = {}
    for i = 1, maxnum do
        local a = false
        for k, v in pairs(array) do
            if tonumber(v) == i then
                a =  true
            end
        end
        if not a then
            table.insert(t,i)
        end
    end
    if Lua_tools.tablecount(t) == 1 then
        randnum = t[1]
    else
        randnum = t[sLuaApp:RandInteger(1,Lua_tools.tablecount(t))] or 0
    end
    return randnum
end