AI_DaYanTa_2 = {}

function AI_DaYanTa_2.OnAI(fighter)
	local judge_list = {
		{NPCKeyname = "大雁塔副本_怪物_7_1", BuffID = 1603},
		{NPCKeyname = "大雁塔副本_怪物_7_2", BuffID = 1604},
		{NPCKeyname = "大雁塔副本_怪物_7_3", BuffID = 1605},
	}
	local custom = sFightSystem:GetTagCustom(fighter)
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if not npc then
		sLuaApp:LuaErr("AI_DaYanTa_2.OnAI npc不存在")
		return
	end
	local map = npc:GetMap()
	for _,v in ipairs(judge_list) do
		local npc_tb = map:GetNpcByKeyName(v.NPCKeyname)
		for i = 1, #npc_tb, 1 do
			sFightSystem:CreateFightBuff(fighter, v.BuffID)
		end
	end
end