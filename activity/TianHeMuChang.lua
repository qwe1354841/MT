--天河牧场
TianHeMuChang = {}

TianHeMuChang.MapList = {
	["天河牧场1"] = {
        npc = 62118 , NpcX = 108, NpcY = 77, Limit = 40, GrazeMaxTime = 8*60*60 ,
		award = {
            money_type = 5 , money_rate = 0.48 , item_drop_prob = 20,
			item_list = {"普通宠物秘籍包",1,1000,"还原丹",1,5000,"宠物经验丹",1,10000},
            material = {
				["等级35"] = {"35级宠物画像礼包",1000},
				["等级45"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000},
				["等级55"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000,"55级宠物画像礼包",1000}
				}
		}
    },
        
    ["天河牧场2"] = {
        npc = 62119 , NpcX = 108, NpcY = 78, Limit = 30, GrazeMaxTime = 8*60*60 ,
	    award = {
            money_type = 5 , money_rate = 0.72 , item_drop_prob = 20,
		    item_list = {"普通宠物秘籍包",1,1000,"高级宠物秘籍包",1,500,"还原丹",1,500,"宠物经验丹",1,10000,
            "宠物经验丹2",1,5000,"合成幸运符",1,1000,"忠诚度3",1,3000,"宠物染料",1,2000},
            material = {
				["等级35"] = {"35级宠物画像礼包",1000},
				["等级45"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000},
				["等级55"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000,"55级宠物画像礼包",1000}
				}
		}
    },
    
	["天河牧场3"] = {
        npc = 62120 , NpcX = 106, NpcY = 82, Limit = 20, GrazeMaxTime = 8*60*60 ,
		award = {
            money_type = 5 , money_rate = 0.96 , item_drop_prob = 20,
			item_list = {"普通宠物秘籍包",1,1000,"高级宠物秘籍包",1,500,"普通洗练符",1,1000,"还原丹",1,500,
            "高级还原丹",1,80,"宠物经验丹",1,10000,"宠物经验丹2",1,5000,"宠物经验丹3",1,2000,"合成幸运符",1,1000,
            "合成大幸运符",1,100,"忠诚度3",1,3000,"培养液1",1,200,"高级宠物染料",1,200},
            material = {
				["等级35"] = {"35级宠物画像礼包",1000},
				["等级45"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000},
				["等级55"] = {"35级宠物画像礼包",1000,"45级宠物画像礼包",1000,"55级宠物画像礼包",1000}
				}
		}
	},
}

TianHeMuChang.MapKey = {"天河牧场1","天河牧场2","天河牧场3"}

TianHeMuChang.ShowItem = "20819,30002,30909,30911,30904,30005,41003"

TianHeMuChang.PetState = {--宠物状态
    leisure = 0, --空闲
    graze = 1, --放牧
    lose = 2, --被击败替换
    finish = 3 --正常结束
}

TianHeMuChang.PetGrazeCD = 30*60 --宠物放牧后无法收回时间

TianHeMuChang.PlayerMaxPetNum = 5--玩家最大可放牧数量

-- 活动开始回调
function TianHeMuChang.OnStart(id)
    TianHeMuChang.CreateNPC()--创建NPC
end

--活动结束回调
function TianHeMuChang.OnStop(id)
	--npc销毁
    for k, v in pairs(Data.TianHeMuChang['NPCGUIDList']) do
        local npc = sNpcSystem:GetNpcByGUID(v)
        sNpcSystem:DestroyNpc(npc)
    end
end

function TianHeMuChang.OnQuery(id, player)
    local str = [[0:0:0:0:]]..TianHeMuChang.ShowItem..[[:1:]]..(ActivitySystem.Act_GetClassify("TianHeMuChang")or'2,3,5')
    --分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
    return str
end

function TianHeMuChang.OnJoin(id, player)

    if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return
    end

    local team = player:GetTeam()
    if team then
        sLuaApp:NotifyTipsMsg(player, "天河牧场是单人活动，无法组队参加")
        return
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    local activityData = ActivityConfig.GetById(id)
    if level < activityData.LevelMin then
        sLuaApp:NotifyTipsMsg(player, "只有等级达到"..activityData.LevelMin.."级才有资格参与活动！")
    else
        local FormStr = [[
            GUI.DestroyWnd('ActivityPanelUI')
        ]]
        sLuaApp:ShowForm(player, "脚本表单", FormStr)

        Lua_tools.MoveToNpc(player, 62116)
    end
end

--打开宠物状态窗口
function TianHeMuChang.StartGrazeData(player)
    if player == nil then
        return ""
    end
    local petCon = player:GetPetContainer(1)
    local petList = petCon:GetPetList()
    local GrazePetNum = 0
    local GrazePetList = TianHeMuChang.GetPetStateList(player)
    for k, v in pairs(petList) do
        if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
            GrazePetNum = GrazePetNum + 1
        end
    end
    local str = [[
        GUI.OpenWnd("PetGrazeListUI")
        PetGrazeListUI.State = 0
        PetGrazeListUI.PetList = ]]..Lua_tools.serialize(GrazePetList)..[[
        PetGrazeListUI.CurNum = ]]..GrazePetNum..[[
        PetGrazeListUI.MaxNum = ]]..TianHeMuChang.PlayerMaxPetNum..[[
        PetGrazeListUI.OnRefreshData()

    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function TianHeMuChang.GetPetStateList(player) --得到宠物状态列表
    local petCon = player:GetPetContainer(1)
    local petList = petCon:GetPetList()
    local GrazePetList = {}
    if #petList == 0 then
        sLuaApp:NotifyTipsMsgEx(player ,"您当前还没有宠物，请先去获得一只宠物哦")
        return ""
    else
        for k, v in pairs(petList) do
            local petGuid = v:GetGUID()

            GrazePetList[k] = {}
            if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 0 then--宠物是否在牧场中
                GrazePetList[k]['guid'] = tostring(petGuid)
                GrazePetList[k]['type'] = TianHeMuChang.PetState.leisure
            elseif v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
                if TianHeMuChang.PetState then
                    local PasturePet = sPastureSystem:GetPasturePetByPet(v:GetGUID())
                    local Pasture = PasturePet:GetPasture()
                    local PastureMap = Pasture:GetMap()
                    local PastureMapKey = PastureMap:GetKeyName()
                    GrazePetList[k]['guid'] = tostring(petGuid)
                    GrazePetList[k]['type'] = PasturePet:GetPlacedStatus()
                    if PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.graze then --状态为放牧
                        GrazePetList[k]['time'] = PasturePet:GetPlacedTime() + TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime
                        GrazePetList[k]['mapid'] = PastureMap:GetId()
                    elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.lose then --状态为被击败
                        GrazePetList[k]['time'] = (TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime + PasturePet:GetPlacedTime()) - PasturePet:GetReplacedTime()
                        GrazePetList[k]['mapid'] = PastureMap:GetId()
                    elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.finish then --状态为正常结束
                        GrazePetList[k]['mapid'] = PastureMap:GetId()
                    end
                end
            end
        end
    end
    --sLuaApp:LuaDbg("GrazePetList"..Lua_tools.serialize(GrazePetList))
    return GrazePetList
end

--打开可出战宠物表单窗口
function TianHeMuChang.CanFightPet(player,petGuid)--此处的petguid为被点击的宠物模型guid，即敌人petguid
    if player == nil then
        return ""
    end
    local petCon = player:GetPetContainer(1)
    local petList = petCon:GetPetList()
    local FightPetList = {}
    local GrazePetNum = 0
    for k, v in pairs(petList) do
        if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 0 then
            local a = {}
            a['guid'] = tostring(v:GetGUID())
            a['type'] = TianHeMuChang.PetState.leisure
            table.insert(FightPetList,a)
        elseif v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
            GrazePetNum = GrazePetNum + 1
        end
    end
    if #FightPetList == 0 then
        sLuaApp:NotifyTipsMsgEx(player ,"您当前没有可出战宠物")
        return ""
    end
    if GrazePetNum < TianHeMuChang.PlayerMaxPetNum then
        local str = [[
            if PetGrazeUI then
                GUI.DestroyWnd("PetGrazeUI")
            end
            GUI.OpenWnd("PetGrazeListUI")
            PetGrazeListUI.State = 1
            PetGrazeListUI.EnemyGUID = "]]..tostring(petGuid)..[["
            PetGrazeListUI.PetList = ]]..Lua_tools.serialize(FightPetList)..[[
            PetGrazeListUI.CurNum = ]]..GrazePetNum..[[
            PetGrazeListUI.MaxNum = ]]..TianHeMuChang.PlayerMaxPetNum..[[
            PetGrazeListUI.OnRefreshData()
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        sLuaApp:NotifyTipsMsgEx(player ,"每人最多只能放牧5只宠物哦")
    end
end

--对应地图可获得奖励
function TianHeMuChang.MapAwardData(player,MapKey)
    if TianHeMuChang.MapList then
        --local map = player:GetMap()
        local award = TianHeMuChang.MapList[MapKey].award.item_list
        local New_award = {61024}
        for i = 1, #award , 3 do--将keyname转换为id
            local itemId = sItemSystem:GetItemIdByKeyname(award[i])
            table.insert(New_award,itemId)
        end
        return New_award
    end
end

--可领取奖励
function TianHeMuChang.AwardData(player,petGuid)
    if TianHeMuChang.CountAward then
        petGuid = tonumber(petGuid)
        if petGuid ~= 0 then
            local pet = sPetSystem:GetPetByGUID(petGuid)
            local itemList = TianHeMuChang.CountAward(pet)
            local New_award = {61024,itemList.moneyNum,5}
            for k, v in pairs(itemList.item_list) do
                if type(v) == "string" then--将keyname转换为id
                    v = sItemSystem:GetItemIdByKeyname(v)
                end
                table.insert(New_award,v)
            end
            return New_award
        end
    end
end

--点击放牧打开确认窗口
function TianHeMuChang.OpenGrazeWnd(player,petGuid)

    petGuid = tonumber(petGuid)
    if petGuid == 0 then
        return ""
    end
    if TianHeMuChang.MapList then
        local map = player:GetMap()
        local MapID = map:GetId()
        local MapKey = map:GetKeyName()
        local times = (TianHeMuChang.MapList[MapKey].GrazeMaxTime)/60
        local award = TianHeMuChang.MapAwardData(player,MapKey)
        local New_award = {}
        for k, v in pairs(award) do
            New_award[k] = {}
            New_award[k]['id'] = v
            New_award[k]['num'] = 1
        end

        local str = [[
            GUI.OpenWnd("PetGrazeMsgBoxUI")
            PetGrazeMsgBoxUI.IsBeginOrResult = true
            PetGrazeMsgBoxUI.PetGUID = "]]..petGuid..[["
            PetGrazeMsgBoxUI.MapID = ]]..MapID..[[
            PetGrazeMsgBoxUI.Time = ]]..times..[[
            PetGrazeMsgBoxUI.ItemList = ]]..Lua_tools.serialize(New_award)..[[
            PetGrazeMsgBoxUI.OnRefreshData()
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

function TianHeMuChang.MapPetNumRefresh(player,mapid) --地图宠物数量UI打开刷新
    if mapid == 0 then
        return ""
    end
    local map = sMapSystem:GetMapById(mapid)
    if map:GetKeyName() == TianHeMuChang.MapKey[1] or map:GetKeyName() == TianHeMuChang.MapKey[2] or map:GetKeyName() == TianHeMuChang.MapKey[3] then
        local Pasture = sPastureSystem:GetPastureById(map:GetId())
        local PasturePetList = Pasture:GetAllPasturePets(TianHeMuChang.PetState.graze)
        local str = [[
            MainUI.OnShowPetGrazeInfoUI(]]..#PasturePetList..[[,]]..Pasture:GetMaxPlaceCount()..[[)
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)
    end
end

--开始放牧（在放牧的宠物npc存宠物正常放牧结束时间和宠物主人guid）
function TianHeMuChang.StartGraze(player,petGuid)
    petGuid = tonumber(petGuid)
    if petGuid == 0 then
        return ""
    end

    if player == nil then
        return ""
    end

    local petCon = player:GetPetContainer(1)
    local GrazePetNum = 0
    for k, v in pairs(petCon:GetPetList()) do
        if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
            GrazePetNum = GrazePetNum + 1
        end
    end
    
    if GrazePetNum < TianHeMuChang.PlayerMaxPetNum then--玩家可放牧宠物数量判断
        local map = player:GetMap()
        local Pasture = sPastureSystem:GetPastureById(map:GetId())
        local PasturePetList = Pasture:GetAllPasturePets(TianHeMuChang.PetState.graze)
        if map then
            if #PasturePetList < Pasture:GetMaxPlaceCount() then--地图宠物数量判断
                if sPastureSystem:PlacePet(player,petGuid) ~= 0 then --宠物放牧
                    sLuaApp:NotifyTipsMsg(player, "宠物放牧错误！")
                    return
                end

                if TianHeMuChang.MapPetNumRefresh then
                    sMapSystem:ForeachCall(map,"TianHeMuChang","MapPetNumRefresh",map:GetId())
                end

                if TianHeMuChang.MapPetClick then   --打开宠物显示信息窗口
                    TianHeMuChang.MapPetClick(player,petGuid)
                end

                local GrazePetList
                if TianHeMuChang.GetPetStateList then
                    GrazePetList = TianHeMuChang.GetPetStateList(player)
                end

                local NewGrazePetNum = 0--获得新的玩家放牧宠物数量
                for k, v in pairs(petCon:GetPetList()) do
                    if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
                        NewGrazePetNum = NewGrazePetNum + 1
                    end
                end

                local str = [[
                    PetGrazeMsgBoxUI.OnExit()
                    if PetGrazeListUI == nil then
                        GUI.OpenWnd("PetGrazeListUI")
                    end
                    PetGrazeListUI.State = 0
                    PetGrazeListUI.PetList = ]]..Lua_tools.serialize(GrazePetList)..[[
                    PetGrazeListUI.CurNum = ]]..NewGrazePetNum..[[
                    PetGrazeListUI.MaxNum = ]]..TianHeMuChang.PlayerMaxPetNum..[[
                    PetGrazeListUI.OnRefreshData()
                ]]
                sLuaApp:ShowForm(player, "脚本表单", str) --关闭确认放牧窗口以及刷新宠物状态列表
            else
                sLuaApp:NotifyTipsMsgEx(player ,"该牧场宠物数量已到上限，击败他人宠物即可放牧")
                return ""
            end
        end
    else
        sLuaApp:NotifyTipsMsgEx(player ,"每人最多只能放牧5只宠物哦")
        return ""
    end
end


--点击宠物显示信息窗口
function TianHeMuChang.MapPetClick(player,petGuid)
    petGuid = tonumber(petGuid)
    if petGuid ~= 0 then
        local PasturePet = sPastureSystem:GetPasturePetByPet(petGuid)
        local Pasture = PasturePet:GetPasture()--获取牧场
        local PastureMap = Pasture:GetMap() --获取牧场地图
        local PastureMapKey = PastureMap:GetKeyName()

        local petName = PasturePet:GetPetName()

        local petOwnerGUID = PasturePet:GetOwnerGUID()
        local petOwnerName = sContactSystem:GetContactName(petOwnerGUID)
        --local petOwnerLevelRein = sContactSystem:GetContactReincarnation(petOwnerGUID)
        local petOwnerLevel = sContactSystem:GetContactLevel(petOwnerGUID)

        local FinishTime = PasturePet:GetPlacedTime() + TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime

        if petOwnerGUID == player:GetGUID() then  --如果是玩家的宠物

            local New_award = {61024} --面板展示-银币的Id
            if TianHeMuChang.MapList then
                local award = TianHeMuChang.MapList[PastureMapKey].award.item_list
                for i = 1, #award , 3 do
                    table.insert(New_award,sItemSystem:GetItemIdByKeyname(award[i]))
                end
            end


            local str = [[
                GUI.OpenWnd("PetGrazeUI", 1)
                PetGrazeUI.PetGUID = "]]..tostring(petGuid)..[["
                PetGrazeUI.PetID = ]]..PasturePet:GetPetAttr(1)..[[
                PetGrazeUI.PetDyn1 = ]]..PasturePet:GetPetAttr(384)..[[
                PetGrazeUI.PetDyn2 = ]]..PasturePet:GetPetAttr(385)..[[
                PetGrazeUI.ItemList = ]]..Lua_tools.serialize(New_award)..[[
                PetGrazeUI.PetName = "]]..petName..[["
                PetGrazeUI.PetLevelRein = ]]..PasturePet:GetPetAttr(9)..[[
                PetGrazeUI.PetLevel = ]]..PasturePet:GetPetAttr(2)..[[
                PetGrazeUI.OwnerName = "]]..petOwnerName..[["
                PetGrazeUI.OwnerLevel = ]]..petOwnerLevel..[[
                PetGrazeUI.EndTime = ]]..FinishTime..[[
                PetGrazeUI.OnRefreshData()
                ]]
                --PetGrazeUI.PetLevelRein = ]]..PasturePet:GetPetAttr(9)..[[
                --PetGrazeUI.OwnerLevelRein = ]]..petOwnerLevelRein..[[
            sLuaApp:ShowForm(player, "脚本表单", str)
        else    --如果不是玩家的宠物
            local str = [[
                GUI.OpenWnd("PetGrazeUI", 0)
                PetGrazeUI.PetGUID = "]]..tostring(petGuid)..[["
                PetGrazeUI.PetID = ]]..PasturePet:GetPetAttr(1)..[[
                PetGrazeUI.PetDyn1 = ]]..PasturePet:GetPetAttr(384)..[[
                PetGrazeUI.PetDyn2 = ]]..PasturePet:GetPetAttr(385)..[[
                PetGrazeUI.PetName = "]]..petName..[["
                PetGrazeUI.PetLevel = ]]..PasturePet:GetPetAttr(2)..[[
                PetGrazeUI.OwnerName = "]]..petOwnerName..[["
                PetGrazeUI.OwnerLevel = ]]..petOwnerLevel..[[
                PetGrazeUI.EndTime = ]]..FinishTime..[[
                PetGrazeUI.OnRefreshData()
                ]]
                --PetGrazeUI.PetLevelRein = ]]..PasturePet:GetPetAttr(9)..[[
                --PetGrazeUI.OwnerLevelRein = ]]..petOwnerLevelRein..[[
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
    end
end


--宠物状态界面下方的确认按钮，可能为放牧或收回
function TianHeMuChang.GrazeOrBackWnd(player,petGuid)
    petGuid = tonumber(petGuid)
    if petGuid ~= 0 then
        local pet = sPetSystem:GetPetByGUID(petGuid)
        local petCon = player:GetPetContainer(1)
        local petList = petCon:GetPetList()
        local GrazePetNum = 0
        for k, v in pairs(petList) do
            if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
                GrazePetNum = GrazePetNum + 1
            end
        end

        if pet:GetAttr(ROLE_ATTR_IS_PASTURE) == 0 then--宠物空闲时打开放牧窗口
            local map = player:GetMap()
            local Pasture = sPastureSystem:GetPastureById(map:GetId())
            local PasturePetList = Pasture:GetAllPasturePets(TianHeMuChang.PetState.graze)
            if GrazePetNum < TianHeMuChang.PlayerMaxPetNum then--玩家可放牧宠物数量判断
                local map = player:GetMap()
                if map then
                    if #PasturePetList < Pasture:GetMaxPlaceCount() then--地图宠物数量判断
                        TianHeMuChang.OpenGrazeWnd(player,petGuid)
                    else
                        sLuaApp:NotifyTipsMsgEx(player ,"该牧场宠物数量已到上限，击败他人宠物即可放牧")
                    end
                end
            else
                sLuaApp:NotifyTipsMsgEx(player ,"每人最多只能放牧5只宠物哦")
            end

        elseif pet:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then

            local PasturePet = sPastureSystem:GetPasturePetByPet(petGuid)
            local Pasture = PasturePet:GetPasture()--获取牧场
            local PastureMap = Pasture:GetMap() --获取牧场地图
            local PastureMapKey = PastureMap:GetKeyName() --获取地图key
            if PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.graze then--宠物放牧时收回
                if (sLuaApp:GetTimes() - PasturePet:GetPlacedTime()) <= TianHeMuChang.PetGrazeCD then --判断放牧时间是否少于规定时间
                    sLuaApp:NotifyTipsMsgEx(player ,"宠物在外面太开心了，不愿回来，起码放牧"..math.floor(TianHeMuChang.PetGrazeCD/60).."分钟才可以收回")
                else--点击收回打开确认窗口
                    local MapID = PastureMap:GetId()
                    local times = math.floor(( sLuaApp:GetTimes() - PasturePet:GetPlacedTime() ) /60)
                    local award = TianHeMuChang.AwardData(player,petGuid)
                    local New_award = {}

                    for i = 1 , #award , 3 do
                        local a = {}
                        a['id'] = award[i]
                        a['num'] = award[i+1]
                        a['bind'] = award[i+2]
                        table.insert(New_award,a)
                    end

                    local str = [[
                        if PetGrazeUI then
                            GUI.DestroyWnd("PetGrazeUI")
                        end
                        GUI.OpenWnd("PetGrazeMsgBoxUI")
                        PetGrazeMsgBoxUI.IsBeginOrResult = false
                        PetGrazeMsgBoxUI.PetGUID = "]]..tostring(petGuid)..[["
                        PetGrazeMsgBoxUI.MapID = ]]..MapID..[[
                        PetGrazeMsgBoxUI.Time = ]]..times..[[
                        PetGrazeMsgBoxUI.ItemList = ]]..Lua_tools.serialize(New_award)..[[
                        PetGrazeMsgBoxUI.OnRefreshData()
                    ]]
                    sLuaApp:ShowForm(player, "脚本表单", str)
                end

            elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.lose then--宠物失败后收回
                local MapID = PastureMap:GetId()
                local times = math.floor((PasturePet:GetReplacedTime() - PasturePet:GetPlacedTime() )/60)
                local award = TianHeMuChang.AwardData(player,petGuid)
                local New_award = {}
                for i = 1 , #award , 3 do
                    local a = {}
                    a['id'] = award[i]
                    a['num'] = award[i+1]
                    a['bind'] = award[i+2]
                    table.insert(New_award,a)
                end
                local str = [[
                    GUI.OpenWnd("PetGrazeMsgBoxUI")
                    PetGrazeMsgBoxUI.IsBeginOrResult = false
                    PetGrazeMsgBoxUI.PetGUID = "]]..tostring(petGuid)..[["
                    PetGrazeMsgBoxUI.MapID = ]]..MapID..[[
                    PetGrazeMsgBoxUI.Time = ]]..times..[[
                    PetGrazeMsgBoxUI.ItemList = ]]..Lua_tools.serialize(New_award)..[[
                    PetGrazeMsgBoxUI.OnRefreshData()
                ]]
                sLuaApp:ShowForm(player, "脚本表单", str)

            elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.finish then--宠物正常结束时收回
                local MapID = PastureMap:GetId()
                local times = (TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime)/60
                local award = TianHeMuChang.AwardData(player,petGuid)
                local New_award = {}
                for i = 1 , #award , 3 do
                    local a = {}
                    a['id'] = award[i]
                    a['num'] = award[i+1]
                    a['bind'] = award[i+2]
                    table.insert(New_award,a)
                end
                local str = [[
                    GUI.OpenWnd("PetGrazeMsgBoxUI")
                    PetGrazeMsgBoxUI.IsBeginOrResult = false
                    PetGrazeMsgBoxUI.PetGUID = "]]..petGuid..[["
                    PetGrazeMsgBoxUI.MapID = ]]..MapID..[[
                    PetGrazeMsgBoxUI.Time = ]]..times..[[
                    PetGrazeMsgBoxUI.ItemList = ]]..Lua_tools.serialize(New_award)..[[
                    PetGrazeMsgBoxUI.OnRefreshData()
                ]]
                sLuaApp:ShowForm(player, "脚本表单", str)
            end
        end
    end
end


--占领宠物位置（触发宠物战斗，获胜后调用开始放牧，给对方主人发邮件。失败后给对方主人发邮件）
function TianHeMuChang.Occupy(player,petGuid1,petGuid2) --petguid1 = 玩家参战宠物guid，petGuid2 = 被挑战宠物guid
    local str = [[        
        if PetGrazeListUI then
        GUI.DestroyWnd("PetGrazeListUI")
        end
        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)--关闭可出战宠物窗口

    petGuid1 = tonumber(petGuid1)
    petGuid2 = tonumber(petGuid2)

    local petCon = player:GetPetContainer(1)
    local petList = petCon:GetPetList()
    local GrazePetNum = 0
    for k, v in pairs(petList) do
        if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
            GrazePetNum = GrazePetNum + 1
        end
    end
    if GrazePetNum < TianHeMuChang.PlayerMaxPetNum then
        if petGuid1 ~= 0 and petGuid2 ~= 0 then
            --sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianHeMuChang", "FightCallBack")
            --player:SetString("TianHe_PetFightGUID1",tostring(petGuid1))
            --player:SetString("TianHe_PetFightGUID2",tostring(petGuid2))
            if sPastureSystem:FightPet(player,petGuid1,petGuid2) ~= 0 then
                sLuaApp:LuaDbg("进入宠物战斗失败")
            else
                sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianHeMuChang", "FightCallBack")
                player:SetString("TianHe_PetFightGUID1",tostring(petGuid1))
                player:SetString("TianHe_PetFightGUID2",tostring(petGuid2))
            end
        else
            sLuaApp:NotifyTipsMsgEx(player , "对方宠物已经不再这里了")
        end
    else
        sLuaApp:NotifyTipsMsgEx(player , "每人最多只能放牧5只宠物哦")
    end
    
end

function TianHeMuChang.FightCallBack(player, typ, is_win, custom)--宠物战斗回调
    sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "TianHeMuChang", "FightCallBack")
    local petGuid1 = tonumber(player:GetString("TianHe_PetFightGUID1"))
    local petGuid2 = tonumber(player:GetString("TianHe_PetFightGUID2"))
    if petGuid1 == nil then
        sLuaApp:LuaDbg("宠物战斗petGuid1异常")
        return ""
    end
    local pet1 = sPetSystem:GetPetByGUID(petGuid1)
    local PasturePet2 = sPastureSystem:GetPasturePetByPet(petGuid2)
    local Pasture = PasturePet2:GetPasture()
    local PastureMap = Pasture:GetMap()
    local pet2OwnerGUID = PasturePet2:GetOwnerGUID()
    local pet2OwnerName = sContactSystem:GetContactName(pet2OwnerGUID)
    if pet1:GetOwner() ~= player then
        return ""
    end
    local mapName = PastureMap:GetName()
    if is_win == 2 then-- 胜利
        sLuaApp:NotifyTipsMsgEx(player ,"您的宠物"..pet1:GetName().."成功击败了"..pet2OwnerName.."的"..PasturePet2:GetPetName())
        sPastureSystem:ReplacePet(player , petGuid1 , petGuid2)--替换宠物
        sLuaApp:NotifyTipsMsgEx(player ,"您的宠物"..pet1:GetName().."开始放牧")
        local PasturePet1 = sPastureSystem:GetPasturePetByPet(pet1:GetGUID())--将新的宠物结束时间、主人Guid存入npc
        local PasturePetNpc = PasturePet1:GetNpc()
        local PastureMapKey = PastureMap:GetKeyName() --获取地图key
        local Finish_time = PasturePet1:GetPlacedTime() + TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime
        PasturePetNpc:SetString("TianHe_ResidueTime",tostring(Finish_time))
        PasturePetNpc:SetString("TianHe_OwnerGUID",tostring(player:GetGUID()))

        if PasturePet2:GetPlacedStatus() == TianHeMuChang.PetState.lose then
            sMailSystem:SendMail( 0 , "御马监管事" , pet2OwnerGUID , 1 , "天河牧场" , "您在"..mapName.."的宠物"..PasturePet2:GetPetName().."被"..player:GetName().."的"..pet1:GetName().."击败了，宠物放牧已结束" , {} , {} )
        end
	elseif is_win == 1 then--失败
        sLuaApp:NotifyTipsMsgEx(player ,"您的宠物"..pet1:GetName().."被"..pet2OwnerName.."的"..PasturePet2:GetPetName().."击败了")
        if PasturePet2:GetPlacedStatus() == TianHeMuChang.PetState.graze then
            sMailSystem:SendMail( 0 , "御马监管事" , pet2OwnerGUID , 1 , "天河牧场" , "您在"..mapName.."的宠物"..PasturePet2:GetPetName().."被"..player:GetName().."的"..pet1:GetName().."挑战，成功的击退了敌人" , {} , {} )
        end
    end
    player:SetString("TianHe_PetFightGUID1","")
    player:SetString("TianHe_PetFightGUID2","")
end

function TianHeMuChang.GiveAward(player,petGuid)--发放奖励
    petGuid = tonumber(petGuid)
    local PasturePet = sPastureSystem:GetPasturePetByPet(petGuid)
    local Pasture = PasturePet:GetPasture()--获取牧场
    local PastureMap = Pasture:GetMap() --获取牧场地图
    local PastureMapKey = PastureMap:GetKeyName() --获取地图key
    local pet = sPetSystem:GetPetByGUID(petGuid)
    local GrazePetList = {}

    
    if PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.graze then--如果宠物是放牧状态，刷新地图宠物数量、发放奖励

        TianHeMuChang.GiveAwardFunction(player,pet,PastureMapKey)--发放奖励
    elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.lose then--如果宠物是失败状态，发放奖励
        TianHeMuChang.GiveAwardFunction(player,pet,PastureMapKey)--发放奖励
    elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.finish then--如果宠物是正常结束状态，发放奖励
        TianHeMuChang.GiveAwardFunction(player,pet,PastureMapKey)--发放奖励
    end
    pet:SetString("TianHe_Award" , "") --清空宠物的奖励预览
    sPastureSystem:DelPet(petGuid)--删除宠物
    
    --地图宠物数量UI打开刷新
    if TianHeMuChang.MapPetNumRefresh then
        sMapSystem:ForeachCall(PastureMap,"TianHeMuChang","MapPetNumRefresh",PastureMap:GetId())
    end

    --关闭确认窗口以及刷新宠物状态列表
    if TianHeMuChang.GetPetStateList then
        GrazePetList = TianHeMuChang.GetPetStateList(player)
    end

    local petCon = player:GetPetContainer(1)
    local petList = petCon:GetPetList()
    local GrazePetNum = 0
    for k, v in pairs(petList) do
        if v:GetAttr(ROLE_ATTR_IS_PASTURE) == 1 then
            GrazePetNum = GrazePetNum + 1
        end
    end

    local str = [[
        PetGrazeMsgBoxUI.OnExit()
        if PetGrazeListUI == nil then
            GUI.OpenWnd("PetGrazeListUI")
        end
        if PetGrazeListUI.OnRefreshData then
            PetGrazeListUI.State = 0
            PetGrazeListUI.PetList = ]]..Lua_tools.serialize(GrazePetList)..[[
            PetGrazeListUI.CurNum = ]]..GrazePetNum..[[
            PetGrazeListUI.MaxNum = ]]..TianHeMuChang.PlayerMaxPetNum..[[
            PetGrazeListUI.OnRefreshData()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end


function TianHeMuChang.GiveAwardFunction(player,pet,PastureMapKey)
    if player then
        if pet then
            if Lua_tools then
                local awardList = TianHeMuChang.CountAward(pet)
                --玩家放牧宠物数量减一

                Lua_tools.AddMoney(player,TianHeMuChang.MapList[PastureMapKey].award.money_type , awardList.moneyNum , "system", "天河牧场" , "天河牧场奖励发放")
                sLuaApp:NotifyTipsMsgEx(player , "您获得了"..math.floor(awardList.moneyNum).."银币")
                
                Lua_tools.AddItem(player, awardList.item_list,"system", "天河牧场" , "天河牧场奖励发放")
            end
        end
    end
end

function TianHeMuChang.player_on_login(player)--玩家登录回调
    local map = player:GetMap()
    if map:GetKeyName() == TianHeMuChang.MapKey[1] or map:GetKeyName() == TianHeMuChang.MapKey[2] or map:GetKeyName() == TianHeMuChang.MapKey[3] then
        if TianHeMuChang.MapPetNumRefresh then
            TianHeMuChang.MapPetNumRefresh(player,map:GetId()) --地图宠物数量UI打开刷新
        end
    end
end

function TianHeMuChang.on_npc_create(npc)--创建npc回调
    if npc:GetKeyName() == "天河牧场宠物" then
        local PasturePet = sPastureSystem:GetPasturePetByNpc(npc)
        local Pasture = PasturePet:GetPasture()
        local petOwnerGUID = PasturePet:GetOwnerGUID()

        local PastureMap = Pasture:GetMap()
        local PastureMapKey = PastureMap:GetKeyName() --获取地图key
        local Finish_time = PasturePet:GetPlacedTime() + TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime
        npc:SetString("TianHe_FinishTime",tostring(Finish_time))
        npc:SetString("TianHe_OwnerGUID",tostring(petOwnerGUID))
    end
end

--放牧宠物超时回调
function TianHeMuChang.on_pasture_pet_time(PasturePet)
    local Pasture = PasturePet:GetPasture()
    local PastureMap = Pasture:GetMap()
    --刷新地图上的放牧宠物数量
    if TianHeMuChang.MapPetNumRefresh then
        sMapSystem:ForeachCall(PastureMap,"TianHeMuChang","MapPetNumRefresh",PastureMap:GetId())
    end
    local playerGuid = PasturePet:GetOwnerGUID()
    --给宠物主人发邮件
    sMailSystem:SendMail( 0 , "御马监管事" , playerGuid , 1 , "天河牧场" , "您在"..PastureMap:GetName().."的宠物"..PasturePet:GetPetName().."已经结束放牧，请及时收回宠物获取奖励。" , {} , {} )
end

--计算奖励
function TianHeMuChang.CountAward(pet)
    local petGuid = pet:GetGUID()
    local PasturePet = sPastureSystem:GetPasturePetByPet(petGuid)
    local Pasture = PasturePet:GetPasture()
    local PastureMap = Pasture:GetMap()
    local PastureMapKey = PastureMap:GetKeyName() --获取地图key
    local mapAwardList = TianHeMuChang.MapList[PastureMapKey].award
    local GrazeSecond = 0
    local awardList = pet:GetString("TianHe_Award")

    if awardList == "" then
		awardList = { times = 0 , exps = 0 , item_list = {} }
	else
		awardList = TianHeMuChang.StrToTable(awardList)
    end
    
    if PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.lose then
		GrazeSecond = math.min(PasturePet:GetReplacedTime() - PasturePet:GetPlacedTime() , TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime)
	elseif PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.finish or PasturePet:GetPlacedStatus() == TianHeMuChang.PetState.graze then
		GrazeSecond = math.min(sLuaApp:GetTimes() - PasturePet:GetPlacedTime(), TianHeMuChang.MapList[PastureMapKey].GrazeMaxTime)
    end
    
    local hookmin = math.floor(GrazeSecond/60) --分钟数
    local times = math.floor(hookmin/30) --半小时数
    
    --计算银币数量
    local moneyNum = math.floor( times * 30 * mapAwardList.money_rate * math.max(pet:GetAttr(ROLE_ATTR_LEVEL) , 1) )

    --随机物品
    local weight_list = {}
    local item_list =  mapAwardList.item_list
    for i=1,#item_list/3 do
        weight_list[#weight_list+1] = item_list[3*i]
    end

    local item = awardList.item_list or {}

    for i = 1, (times - awardList.times) do
        local a = sLuaApp:RandInteger(1,100)
        if a < mapAwardList.item_drop_prob then
            local m = TianHeMuChang.weight_count(weight_list)
            local flag = 0
            for n = 1, #item do
                if type(item[n]) == "string" then
                    if item[n] == item_list[3*m-2] then
                        item[n+1] = item[n+1] + 1
                        flag = 1
                        break
                    end
                end
            end
            
            if flag == 0 then
                item[#item + 1] = item_list[3*m-2]
                item[#item + 1] = 1
                item[#item + 1] = 1
            end
        end
    end

    local material = TianHeMuChang.ReturnMaterialList(pet:GetAttr(ROLE_ATTR_LEVEL), PastureMapKey)
    weight_list = {}
    for i=1,#material/2 do
        weight_list[#weight_list+1] = material[2*i]
    end
    if Lua_tools.tablecount(material) > 0 then
        for i = 1, (times - awardList.times) do
            local a = sLuaApp:RandInteger(1,100)
            if a < mapAwardList.item_drop_prob then
                local m = TianHeMuChang.weight_count(weight_list)
                local flag = 0
                for n = 1, #item do
                    if type(item[n]) == "string" then
                        if item[n] == material[2*m-1] then
                            item[n+1] = item[n+1] + 1
                            flag = 1
                            break
                        end
                    end
                end
                
                if flag == 0 then
                    item[#item + 1] = material[2*m-1]
                    item[#item + 1] = 1
                    item[#item + 1] = 1
                end
            end
        end
    end

    awardList = {times = times , moneyNum = moneyNum, item_list = item}
    pet:SetString("TianHe_Award" , Lua_tools.serialize(awardList))
    return awardList
end

function TianHeMuChang.ReturnMaterialList(level, map_keyname)
	--local lv = math.floor(level/10) * 10
	local list = TianHeMuChang.MapList[map_keyname].award.material
	
	local flag = 0
	for k ,v in pairs(list) do
		local temp_lv = tonumber(string.sub(k,7,-1))
        sLuaApp:LuaDbg("temp_lv ------------ "..temp_lv)
		if not temp_lv then
			return {}
		end
		
		if level > temp_lv and temp_lv > flag then
			flag = temp_lv
		elseif level == temp_lv then
			flag = temp_lv
			break
		end
	end
	
	local MaterialList = list["等级"..flag] or {}
	
	return MaterialList
end

--npc刷新
function TianHeMuChang.CreateNPC()

    if Data then
		Data.TianHeMuChang = {}
        Data.TianHeMuChang['NPCGUIDList'] = {}
	else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
    local mapList = TianHeMuChang.MapList
    for k, v in pairs(mapList) do
        local map = sMapSystem:GetMapByKey(k)
        local npc = sNpcSystem:CreateNpc( v.npc , map , v.NpcX , v.NpcY , 1 , 3 , 0 )--创建Npc
        sPastureSystem:AddPasture(map:GetId() , v.Limit , v.GrazeMaxTime , 62117) --创建牧场
        table.insert(Data.TianHeMuChang['NPCGUIDList'], npc:GetGUID())
    end
end

--计算权重
function TianHeMuChang.weight_count(list)
	local sum = 0
	local weight = 1
	for i=1 ,#list do
		sum = sum + list[i]
	end
	local num = sLuaApp:RandInteger(1,sum)
	
	for i=1 ,#list do
		if num <= list[i] then
			weight = i
			break
		else
			num = num -list[i]
		end
	end
	return weight
end

--字符串转表格
function TianHeMuChang.StrToTable(add_num)
    if type(add_num) ~= "string" then
        return ""
    end
	local res_num = assert(load(" return " .. add_num))()
	return res_num
end

