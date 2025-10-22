--剧情王母NPC
Movie_WangMu = {}
Movie_WangMu.quest_id = 532
function Movie_WangMu.main(npc,player)
    --触发剧情动画
    if player:GetInt("Movie_147") == 1 then
        return ""
    end

    if sQuestSystem:IsFinished(player,Movie_WangMu.quest_id) == false then
        return ""
    end

    if sQuestSystem:CanAccept(player, 533) == 0 then
        sLuaTimerSystem:AddTimerEx(player, 200, 1, "Movie_system.QuestCallMovie", ""..Movie_WangMu.quest_id)
        player:SetInt("Movie_147",1)
    end
    return ""
end