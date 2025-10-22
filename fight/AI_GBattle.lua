AI_GBattle_FightStart = {}
AI_GBattle_RoundOver = {}
AI_GBattle_HandleOver = {}

function AI_GBattle_FightStart.OnAI(fighter)
	GuildBattle.NPCBattle_FightStart(fighter)
end

function AI_GBattle_RoundOver.OnAI(fighter)
	GuildBattle.NPCBattle_RoundOver(fighter)
end

function AI_GBattle_HandleOver.OnAI(fighter)
	--local str = [[
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--AI_NPCBattle_HandleOver.OnAI
	--
	--
	--
	--]]
	--sLuaApp:LuaDbg(str)
	GuildBattle.NPCBattle_HandleOver(fighter)
end

