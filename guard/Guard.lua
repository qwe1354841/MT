Guard = {}

function Guard.OnContainer(guard, player)
	sLuaApp:LuaDbg("Guard.OnContainer")
	if sQuestSystem:GetQuestState(player,78) == 3 then
		if not sQuestSystem:ForceReady(player,78) then
			sLuaApp:LuaDbg("ForceReady 78 is err")
		end
	end
	DiscountSystem.on_get_guard(player, guard)
end

function Guard.OnLineup(guard, lineup)
	sLuaApp:LuaDbg("lineup = "..tostring(lineup))
	if lineup then
		local player = guard:GetMaster()
		if sQuestSystem:GetQuestState(player,79) == 3 then
			if not sQuestSystem:ForceReady(player,79) then
				sLuaApp:LuaDbg("ForceReady 79 is err")
			end
		end
	end
end

--系统开启时设置是否显示侍从
function Guard.OnStart()
	if FunctionSwitch.AllFuncitonConfig['GuardIsShowed'] == "off" then
		sGuardSystem:SetShowGuard(false)
	end
end

--战斗结束给上阵侍从战力重计算
function Guard.FightEndRecalcAttr(player)
	local lineupContainer = player:GetLineupContainer()
    local index = lineupContainer:GetCurrentLineup()
	local GuardList = lineupContainer:GetLineup(index)
	for i, guard in ipairs(GuardList) do
		guard:RecalcAttr()
	end
end