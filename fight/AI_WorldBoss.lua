--世界boss ai相关脚本
AI_WorldBoss_FightStart = {}
AI_WorldBoss_RoundOver = {}
AI_WorldBoss_HandleOver = {}

function AI_WorldBoss_FightStart.OnAI(fighter)
	Act_WorldBoss.fight_start(fighter)
end

function AI_WorldBoss_RoundOver.OnAI(fighter)
	Act_WorldBoss.round_over(fighter)
end

function AI_WorldBoss_HandleOver.OnAI(fighter)
	Act_WorldBoss.handle_over(fighter)
end

