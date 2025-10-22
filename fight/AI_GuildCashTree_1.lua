--帮派摇钱树 除草怪物
AI_GuildCashTree_1 = {}

function AI_GuildCashTree_1.OnAI(fighter)
	local custom = sFightSystem:GetTagCustom(fighter)
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(custom))
	local content = player:GetString("GuildCashTreeSelectOption")
	local tmp_tb = sLuaApp:StrSplit(content, "$")
	local option_tb = GuildCashTreeConfig.Event[tmp_tb[1]][tmp_tb[2]]
	local buff_id = option_tb["BuffID"]
	local mon_tb = sFightSystem:GetFriends(fighter)
	if buff_id then
		for _,v in pairs(mon_tb) do
			sFightSystem:CreateFightBuff(v, buff_id)
			v:SendPaoPao("不！可恶的除草剂！")
		end
	else
		fighter:SendPaoPao("这么好的阳光！凭什么让一颗破树独享！")
	end
end