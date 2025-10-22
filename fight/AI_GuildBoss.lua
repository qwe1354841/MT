--帮派boss AI相关脚本
AI_GuildBoss_FightStart = {}
AI_GuildBoss_RoundOver = {}
AI_GuildBoss_HandleOver = {}

function AI_GuildBoss_FightStart.OnAI(fighter)
	Act_GuildBoss.fight_start(fighter)
end

function AI_GuildBoss_RoundOver.OnAI(fighter)
	Act_GuildBoss.round_over(fighter)
end

function AI_GuildBoss_HandleOver.OnAI(fighter)
	Act_GuildBoss.handle_over(fighter)
end

