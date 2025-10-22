-- 排行榜表单
FormRankingListSystem = {}

function FormRankingListSystem.on_pk_value_change(player, pk_value, sender, reason, detail)
    if player and RankingListSystem then
        RankingListSystem.on_pk_value_change(player, pk_value, sender, reason, detail)
    end
    return ""
end

function FormRankingListSystem.GetData(player, type)
	if player and RankingListSystem then
        RankingListSystem.GetData(player, type)
    end
    return ""
end