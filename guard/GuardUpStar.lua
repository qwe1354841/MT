--侍从升星
GuardUpStar = {}

--升星需求信物数量配置
GuardUpStar.NeedTokenNumber = {
    [1] = 50,
    [2] = 100,
    [3] = 150,
    [4] = 250,
    [5] = 400,
}

--侍从升级属性展示列表
GuardUpStar.AttrList = {
    {id = 36 , name = 'HP'},
    {id = 38 , name = 'MP'},
    {id = 43 , name = "PhyAtk"},
    {id = 45 , name = 'MagAtk'},
    {id = 44 , name = 'PhyDef'},
    {id = 46 , name = 'MagDef'},
    {id = 68 , name = 'PhyBurstLv'},
    {id = 71 , name = 'MagBurstLv'},
    {id = 73 , name = 'ResistanceLv'},
    {id = 74 , name = 'Resistance'},
    {id = 50 , name = 'Miss'},
    {id = 51 , name = 'Speed'},
}

--侍从对应信物
GuardUpStar.Config = {
    [103] = {item = '金翅大鹏王信物'},
    [104] = {item = '杨戬信物'},
    [102] = {item = '猪八戒信物'},
    [125] = {item = '混世魔王信物'},
    [101] = {item = '孙悟空信物'},
    [129] = {item = '九灵元圣信物'},
    [106] = {item = '程咬金信物'},
    [126] = {item = '虎力大仙信物'},
    [128] = {item = '六耳猕猴信物'},
    [105] = {item = '牛魔王信物'},
    [127] = {item = '鹿力大仙信物'},
    [135] = {item = '太乙天尊信物'},
    [109] = {item = '龙王信物'},
    [110] = {item = '水德真君信物'},
    [134] = {item = '银角大王信物'},
    [132] = {item = '黄风怪信物'},
    [111] = {item = '哪吒信物'},
    [140] = {item = '红孩儿信物'},
    [108] = {item = '小白龙信物'},
    [130] = {item = '灵感大王信物'},
    [112] = {item = '罗刹女信物'},
    [131] = {item = '黑风怪信物'},
    [113] = {item = '观音菩萨信物'},
    [137] = {item = '灵吉菩萨信物'},
    [115] = {item = '如意真仙信物'},
    [116] = {item = '地涌夫人信物'},
    [114] = {item = '唐僧信物'},
    [136] = {item = '金池长老信物'},
    [119] = {item = '太上老君信物'},
    [107] = {item = '沙和尚信物'},
    [117] = {item = '李靖信物'},
    [124] = {item = '白骨夫人信物'},
    [122] = {item = '白无常信物'},
    [118] = {item = '春十三娘信物'},
    [123] = {item = '孟婆信物'},
    [133] = {item = '金角大王信物'},
    [121] = {item = '黑无常信物'},
    [120] = {item = '镇元子信物'},
    [138] = {item = '九尾狐狸信物'},
    [139] = {item = '羊力大仙信物'},
}

function GuardUpStar.GetData(player,guard_guid)
    if player == nil or guard_guid == nil then
        sLuaApp:LuaDbg('GuardStar.GetData参数错误')
        return ""
    end
    local guard = sGuardSystem:GetGuardByGUID(guard_guid)
    local guardStar = guard:GetInt("Guard_Star")
    if guardStar == 0 then
        guardStar = 1
    end
    local NeedTokenNum = GuardUpStar.NeedTokenNumber[guardStar]
    local guardID = guard:GetId()
    local HaveTokenNum = sItemSystem:GetItemAmount(player , sItemSystem:GetItemIdByKeyname(GuardUpStar.Config[guardID].item) , 3)
    local UpStarDataList = {}
    if guardStar >= 6 then
        UpStarDataList['guardStar'] = guardStar
        UpStarDataList['Attr'] = GuardUpStar.GetAttrList(player,guard)
        table.insert(UpStarDataList['Attr'] , {guard:GetInt("LastStarFightValue") , guard:GetAttr(81)-guard:GetInt("LastStarFightValue")})
    else
        UpStarDataList['guardStar'] = guardStar
        UpStarDataList['Attr'] = GuardUpStar.GetAttrList(player,guard)
        UpStarDataList['NeedTokenNum'] = NeedTokenNum
        UpStarDataList['HaveTokenNum'] = HaveTokenNum
        table.insert(UpStarDataList['Attr'] , {guard:GetInt("LastStarFightValue") , guard:GetAttr(81)-guard:GetInt("LastStarFightValue")})
        local GuardStarUPConfig = {}
        if GuardSkill then
            GuardStarUPConfig = GuardSkill.GuardStarUPConfig
        end
        --获取需要升级的技能ID和等级
        UpStarDataList['Skill1'] = {}
        table.insert(UpStarDataList['Skill1'] , guard:GetInt("GuardSkillID_"..GuardStarUPConfig[guardStar+1].UPtrench))
        table.insert(UpStarDataList['Skill1'] , guard:GetInt("GuardSkillLV_"..GuardStarUPConfig[guardStar+1].UPtrench))
        --获取升级后的技能ID和等级
        local skillData = SkillConfig.GetById(guard:GetInt("GuardSkillID_"..GuardStarUPConfig[guardStar+1].UPtrench))
        UpStarDataList['Skill2'] = {}

        --如果升阶技能id为0
        if skillData.UpSkillId == 0 then
            table.insert(UpStarDataList['Skill2'] , guard:GetInt("GuardSkillID_"..GuardStarUPConfig[guardStar+1].UPtrench))
        else
            table.insert(UpStarDataList['Skill2'] , skillData.UpSkillId)
        end
        table.insert(UpStarDataList['Skill2'] , guard:GetInt("GuardSkillLV_"..GuardStarUPConfig[guardStar+1].UPtrench) + GuardStarUPConfig[guardStar+1].trenchLevelUP)
    end
    local str = [[
        if GuardUI then
            GuardUI.UpStarDataList = ]]..Lua_tools.serialize(UpStarDataList)..[[
            GuardUI.RefreshGuardUpdateStarPage()
        end
    ]]
    --sLuaApp:LuaDbg(""..str)
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function GuardUpStar.GetAttrList(player,guard)
    if player == nil or guard == nil then
        sLuaApp:LuaDbg('GuardStar.AttrList参数错误')
        return ""
    end
    local AttrList = {}
    local guardID = guard:GetId()
    if GuardUpStar.AttrList then
        for k, v in pairs(GuardUpStar.AttrList) do
            local list = {}
            table.insert(list,guard:GetAttr(v.id))
            local GuardStar = GuardUpStar.GetGuardStar(player,guard:GetGUID())
            if GuardStar == 6 then
                table.insert(list,0)
            else
                if GuardUpStarAttr_Config then --（1级该属性值+（当前等级-1）*（200级该属性-1级该属性）/199）*成长率/10000
                    local IncreaseRate =  GuardUpStarAttr_Config.GuardAttrIncrease[guardID][GuardStar]
                    local GuardExtraData_1 = GuardExtraConfig.GetByIdLevel(guardID,1)
                    local GuardExtraData_2 = GuardExtraConfig.GetByIdLevel(guardID,200)
                    --local AttrValue = ( ( GuardExtraData_1[v.name] + (player:GetAttr(ROLE_ATTR_LEVEL) - 1)  * (GuardExtraData_2[v.name] - GuardExtraData_1[v.name])/199) * (guard:GetGrowthrate() + IncreaseRate)/10000) - guard:GetAttr(v.id)
                    local AttrValue = ( GuardExtraData_1[v.name] + (player:GetAttr(ROLE_ATTR_LEVEL) - 1)  * (GuardExtraData_2[v.name] - GuardExtraData_1[v.name])/199) * IncreaseRate/10000
                    table.insert(list,math.floor(AttrValue))
                end
            end
            table.insert(AttrList,list)
        end
    end
    --sLuaApp:LuaDbg(Lua_tools.serialize(AttrList))
    return AttrList
end

--侍从升星
function GuardUpStar.StartUpStar(player,guard_guid)
    if player == nil or guard_guid == nil then
        return ""
    end
    local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
    local master = guard:GetMaster()
    if player:GetGUID() ~= master:GetGUID() then
        sLuaApp:NotifyTipsMsg(player, "该侍从不是您的侍从，无法进行升星操作")
        return ""
    end
    local guardStar = guard:GetInt("Guard_Star")
    if guardStar == 0 then
        guardStar = 1
    elseif guardStar >= 6 then
        sLuaApp:NotifyTipsMsg(player, "侍从星际已达到满级")
        return
    end
    local guardID = guard:GetId()
    local NeedTokenNum = GuardUpStar.NeedTokenNumber[guardStar]
    local HaveTokenNum = sItemSystem:GetItemAmount(player , sItemSystem:GetItemIdByKeyname(GuardUpStar.Config[guardID].item) , 3)
    if HaveTokenNum < NeedTokenNum then
        sLuaApp:NotifyTipsMsg(player,"您的侍从信物不足")
        return
    end
    if not sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(GuardUpStar.Config[guardID].item), NeedTokenNum , 3 , "system", "侍从升星", "升星材料消耗") then
        sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行升星")
        return false
    end
    --保存侍从升星前的战力
    guard:SetInt("LastStarFightValue",guard:GetAttr(81))
    --材料扣成功，增加成长率
    local IncreaseRate =  GuardUpStarAttr_Config.GuardAttrIncrease[guardID][guardStar]
    if guard:AddGrowthrate(IncreaseRate,'system','侍从升星','升星增长成长率') == false then
        sLuaApp:NotifyTipsMsg(player, "侍从成长率增加失败")
    end
    --技能升级
    if GuardSkill then
        GuardSkill.GuardStarUP(player, guard_guid, guardStar + 1)
    end
    --增加星级
    guard:SetInt("Guard_Star" , guardStar + 1)
    
    --记录日志
    sLogServerSystem:LogToServer(0, player, "侍从升星", guardStar , 1 , "侍从key:"..guard:GetKeyName(), "侍从星级提升")

    --侍从战力增量
    local GuardData = GuardConfig.GetById(guardID)
    local value = GuardData["StarCoefficient"..guardStar + 1]
    local fight_val_pct = value*100
    local now_fight_val_pct = guard:GetFightValuePct()
	fight_val_pct = fight_val_pct - now_fight_val_pct
	if fight_val_pct > 0 then
        if not guard:AddFightValuePct(fight_val_pct, "system", "侍从升星", "升星增加") then
            sLuaApp:LuaErr("GuardUpStar AddFightValuePct 失败")
        end
    end
    --战力重计算
    guard:RecalcAttr()
    local str = [[
        if GuardUI then
            GuardUI.UpStarDataList.Attr[13][1] = ]]..guard:GetInt("LastStarFightValue")..[[
            GuardUI.UpStarDataList.Attr[13][2] = ]]..guard:GetAttr(81)-guard:GetInt("LastStarFightValue")..[[
            GuardUI.OnUpStarSuccess()
            GuardUI.RefreshUpStarSuccessPage()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    -- 更新侍从小红点数据
    if FormGuard then
        FormGuard.get_guard_red_point_data(player)
    end

    if SevenDayCallBack then
        SevenDayCallBack.Guard(player)
    end
    if Achievement then
        Achievement.Achievement_Guard(player,guard:GetKeyName(),guard:GetInt("Guard_Star"))
    end
end

--得到侍从星级
function GuardUpStar.GetGuardStar(player,guard_guid)
    if player == nil or guard_guid == nil then
        return ""
    end
    local guard = sGuardSystem:GetGuardByGUID(tonumber(guard_guid))
    local master = guard:GetMaster()
    if player:GetGUID() ~= master:GetGUID() then
        sLuaApp:NotifyTipsMsg(player, "侍从主人与玩家不符")
        return ""
    end
    local guardStar = guard:GetInt("Guard_Star")
    if guardStar == 0 then
        guardStar = 1
    elseif guardStar > 6 then
        guardStar = 6
        guard:SetInt("Guard_Star",6)
    end
    return guardStar
end

function GuardUpStar.on_guard_create(guard)
    if guard == nil then
        return
    end
    guard:SetInt("Guard_Star" , 1)
end

