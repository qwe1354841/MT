--天降灵猴 灵猴 每个回合开始
AI_TianJiangLingHou_1 = {}

function AI_TianJiangLingHou_1.OnAI(fighter)
	if not TianJiangLingHouConfig and TianJiangLingHouConfig.RunAway then
		sLuaApp:LuaErr("缺少TianJiangLingHouConfig.RunAway")
		return
	end

	local custom = sFightSystem:GetTagCustom(fighter)
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(custom))
	if not player then
		sLuaApp:LuaErr("AI_TianJiangLingHou_1.OnAI 不存在player")
		return
	end

	local round_num = player:GetInt("TianJiangLingHouRoundNum") + 1
	for i = round_num, 1, -1 do
		if TianJiangLingHouConfig.RunAway["Round_"..i] then
			if sLuaApp:RandInteger(1,10000) <= TianJiangLingHouConfig.RunAway["Round_"..i] then
				fighter:SendPaoPao("我不想陪你玩了，溜了溜了~")
				sFightSystem:CreateFightBuff(fighter, 108)
				sLuaTimerSystem:AddTimerEx(player, 3000 ,1,"AI_TianJiangLingHou_1.SendMsg", "")
			end
			break
		end
	end
	player:SetInt("TianJiangLingHouRoundNum", round_num)
end
function AI_TianJiangLingHou_1.SendMsg(player,timer,p)
	sLuaApp:NotifyTipsMsg(player, "灵猴已逃之夭夭")
end