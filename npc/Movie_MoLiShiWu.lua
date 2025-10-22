--剧情魔力食物NPC
Movie_MoLiShiWu = {}
Movie_MoLiShiWu.quest_id = 529
function Movie_MoLiShiWu.main(npc,player)
    --触发剧情动画
    sLuaTimerSystem:AddTimerEx(player, 200, 1, "Movie_system.QuestCallMovie", ""..Movie_MoLiShiWu.quest_id)
    --sQuestSystem:ForceReady(player,Movie_MoLiShiWu.quest_id)
        return ""
end