--玩家升级回调
PlayerLevelUp_CallBack = {}

function PlayerLevelUp_CallBack.on_player_levelup(player, newlevel)
    if player == nil or newlevel == nil then
        return
    end
    --VIP
    if VipIngotTrace then
        if newlevel == VipIngotTrace.MinLevel then
            VipIngotTrace.GetData(player)
        end
    end

    --羽翼
    if WingSystem then
        WingSystem.on_player_levelup(player, newlevel)
    end

    --七日
    if SevenDay then
        SevenDay.StartJudge(player,newlevel)
    end

    --师徒
    if TeacherPupilSystem then
        TeacherPupilSystem.on_player_levelup(player, newlevel)
    end

    --自动加点
    if AddPoint then
        AddPoint.Player_LevelUpJudge(player,newlevel)
    end

    -- 小红点
    if RedPointSystem then
        RedPointSystem.level_up_refresh_red(player, newlevel)
    end

    -- 当玩家达到相应等级时，提示是否登记相亲
    if FriendSystem then
        FriendSystem.level_trigger_register_blind_date(player,newlevel)
    end

    --卡等级
    if ServerLevel then
        ServerLevel.SetLockLevel(player)
    end
end