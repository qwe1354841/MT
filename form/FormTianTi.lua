--天梯表单
FormTianTi = {}

--打开荣誉商店
function FormTianTi.OpenHonorShop(player)
	if TianTi then
		TianTi.OpenHonorShop(player)
	end
	return ""
end

--打开天梯榜
function FormTianTi.OpenTianTiRank(player)
	if TianTi then
		TianTi.OpenTianTiRank(player)
	end
	return ""
end

--打开战报窗口
function FormTianTi.OpenBattleRecord(player)
	if TianTi then
		TianTi.OpenBattleRecord(player)
	end
	return ""
end

--挑战玩家刷新
function FormTianTi.RefreshMainWnd(player)
	if TianTi then
		TianTi.RefreshMainWnd(player)
	end
	return ""
end

--点击确认战斗按钮进行开始战斗判断
function FormTianTi.StartBattleJudge(player,EnemyGUID)
	if TianTi then
		TianTi.StartBattleJudge(player,EnemyGUID)
	end
	return ""
end