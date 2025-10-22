AI_RegionTask_FightStart = {}
AI_RegionTask_RoundOver = {}
AI_RegionTask_HandleOver = {}
AI_RegionTask_DieOver = {}

function AI_RegionTask_FightStart.OnAI(fighter)
	RegionTask.fight_start(fighter)
end

function AI_RegionTask_RoundOver.OnAI(fighter)
	RegionTask.round_over(fighter)
end

function AI_RegionTask_HandleOver.OnAI(fighter)
	RegionTask.handle_over(fighter)
end

function AI_RegionTask_DieOver.OnAI(fighter)
	RegionTask.die_over(fighter)
end