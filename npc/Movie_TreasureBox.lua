--剧情散落的宝箱NPC
Movie_TreasureBox = {}
Movie_TreasureBox.quest_id = 430
function Movie_TreasureBox.main(npc,player)
    --触发剧情动画
    sLuaTimerSystem:AddTimerEx(player, 200, 1, "Movie_system.QuestCallMovie", ""..Movie_TreasureBox.quest_id)
    return ""
end