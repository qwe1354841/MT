-- 长安城官职和科举角色展示
ExhibitionRoleNPC = {}

-- 长安城官职展示NPC配置
ExhibitionRoleNPC.OfficialNpcConfig = {
    ['RankListName'] = "官职榜",
    ['Count'] = 5,
    ['Limit'] = 0,   --最少战功
    ['RankListSerialNum'] = 34, -- 官职排行榜编号
    ['1'] = {
        ['NpcId'] = 10316,
        ['MapId'] = 210,
        ['PosX'] = 83,
        ['PosY'] = 109,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['2'] = {
        ['NpcId'] = 10317,
        ['MapId'] = 210,
        ['PosX'] = 73,
        ['PosY'] = 114,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['3'] = {
        ['NpcId'] = 10318,
        ['MapId'] = 210,
        ['PosX'] = 63,
        ['PosY'] = 119,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['4'] = {
        ['NpcId'] = 10319,
        ['MapId'] = 210,
        ['PosX'] = 53,
        ['PosY'] = 124,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['5'] = {
        ['NpcId'] = 10320,
        ['MapId'] = 210,
        ['PosX'] = 43,
        ['PosY'] = 129,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
}

-- 长安城科举角色NPC配置
ExhibitionRoleNPC.ImperialNpcConfig = {
    ['RankListName'] = "殿试排行榜",
    ['Count'] = 3,
    ['Limit'] = 0,   --最少科举获得value
    ['RankListSerialNum'] = 51, -- 殿试排行榜编号
    ['1'] = {
        ['NpcId'] = 10313,
        ['MapId'] = 210,
        ['PosX'] = 159,
        ['PosY'] = 69,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['2'] = {
        ['NpcId'] = 10314,
        ['MapId'] = 210,
        ['PosX'] = 169,
        ['PosY'] = 64,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
    ['3'] = {
        ['NpcId'] = 10315,
        ['MapId'] = 210,
        ['PosX'] = 179,
        ['PosY'] = 59,
        ['Range'] = 0,
        ['Dir'] = 3,
    },
}

-- 创建角色NPC回调函数
function ExhibitionRoleNPC.on_create_npc_async(npc, params)
    if not npc then return end

    local npcGuid = npc:GetGUID()
    sDBVarSystem:SetInt("ExhibitionRoleNPC_"..params.."_Guid", npcGuid, 0)
end

function ExhibitionRoleNPC.CreateExhibitionRoleNPC()
    ExhibitionRoleNPC.CreateRoleNPC(ExhibitionRoleNPC.OfficialNpcConfig)
    ExhibitionRoleNPC.CreateRoleNPC(ExhibitionRoleNPC.ImperialNpcConfig)
end

function ExhibitionRoleNPC.RefreshExhibitionRoleNPC()

    if sDBVarSystem:GetInt("Exhibition_Role_NPC_Week") ~= sLuaApp:WeekSinceEpoch(0) then
        ExhibitionRoleNPC.CreateRoleNPC(ExhibitionRoleNPC.OfficialNpcConfig)
        ExhibitionRoleNPC.CreateRoleNPC(ExhibitionRoleNPC.ImperialNpcConfig)
        sDBVarSystem:SetInt("Exhibition_Role_NPC_Week", sLuaApp:WeekSinceEpoch(0), 0)
    end

    -- 测试用
    --ExhibitionRoleNPC.CreateExhibitionRoleNPC()
end

-- 创建长安城角色NPC
function ExhibitionRoleNPC.CreateRoleNPC(config_tb)
    local cnt = config_tb.Count
    local rank_list = sRanklistSystem:GetRanklist(RankingListSystem.Config[''..tostring(config_tb.RankListName)] or tonumber(config_tb.RankListSerialNum), 1, cnt)

    if not rank_list then
        sLuaApp:LuaWrn(config_tb.RankListName.."不存在")
        return
    end

    -- 先销毁所有主城展示的科举NPC(可优化部分)
    for i = 1, cnt do
        local cfg = config_tb[''..i]
        local npcGuid = sDBVarSystem:GetInt("ExhibitionRoleNPC_" .. tostring(cfg['NpcId']) .. "_Guid")
        if npcGuid ~= 0 then
            local npc = sNpcSystem:GetNpcByGUID(npcGuid)
            if npc then
                sNpcSystem:DestroyNpc(npc)
            end
        end
    end

    local count = cnt <= #rank_list and cnt or #rank_list
    local index = 0
    for i = 1, count do
        local playerGuid = rank_list[i][1]
        local value = rank_list[i][2]
        local cfg = config_tb[''..i]
        local map = sMapSystem:GetMapById(cfg['MapId'])
        if map then
            if value > config_tb.Limit then
                sNpcSystem:CreatePlayerNpcAsync(cfg['NpcId'], map, cfg['PosX'], cfg['PosY'], cfg['Range'], cfg['Dir'], 0, playerGuid, "ExhibitionRoleNPC:on_create_npc_async", tostring(cfg['NpcId']))
            else
                local npc = sNpcSystem:CreateNpc(cfg['NpcId'], map, cfg['PosX'], cfg['PosY'], cfg['Range'], cfg['Dir'], 0)
                if npc then
                    sDBVarSystem:SetInt("ExhibitionRoleNPC_"..tostring(cfg['NpcId']).."_Guid", npc:GetGUID(), 0)
                end
            end
        end
        index = i
    end

    -- 如果榜单名额不够配置数量则创建默认NPC
    for i = index + 1, cnt do
        local cfg = config_tb[''..i]
        local map = sMapSystem:GetMapById(cfg['MapId'])
        if map then
            local npc = sNpcSystem:CreateNpc(cfg['NpcId'], map, cfg['PosX'], cfg['PosY'], cfg['Range'], cfg['Dir'], 0)
            if npc then
                sDBVarSystem:SetInt("ExhibitionRoleNPC_"..tostring(cfg['NpcId']).."_Guid", npc:GetGUID(), 0)
            end
        end
    end

end

-- 服务器启动时调用
function ExhibitionRoleNPC.on_system_start()
    ExhibitionRoleNPC.CreateExhibitionRoleNPC()
    sScheduleSystem:CreateSchedule(1, "00:00:00", "ExhibitionRoleNPC", "RefreshExhibitionRoleNPC", "")
end

--@newinter ExhibitionRoleNPC.Test(player, "官职榜", 100) 测试用
function ExhibitionRoleNPC.Test(player, rankListName, value)
    sRanklistSystem:UpdateRanklist(RankingListSystem.Config[''..rankListName], player:GetGUID(), value, player:GetName(), ""..value)
    ExhibitionRoleNPC.RefreshExhibitionRoleNPC()
end
