--苦行任务
Quest_KuXing = {}

Quest_KuXing.Config = {
	['Exp'] = "return math.floor((96 + 0.5 * ring_num) * level)",
	['PetExp'] = "return math.floor((96 + 0.5 * ring_num) * level)",
	['BindGold'] = "return math.floor((96 + 0.5 * ring_num) * level + 10000)",
}

Quest_KuXing.BoxReward = {
	{ItemKey ="装备强化石",Num = 1,Bind = 0, Rand = 10000},
	{ItemKey ="装备强化石2",Num = 1,Bind = 0, Rand = 500},
	{ItemKey ="强化保固石",Num = 1,Bind = 0, Rand = 50},
	{ItemKey ="打造符",Num = 1,Bind = 0, Rand = 225},
	{ItemKey ="缝纫符",Num = 1,Bind = 0, Rand = 225},
	{ItemKey ="炼金符",Num = 1,Bind = 0, Rand = 255},
}


local global_reward_list = {"70书铁","80书铁","90书铁","100书铁","110书铁","120书铁"}
local global_need_ring = 100

--接任务回调
function Quest_KuXing.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_KuXing.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_KuXing.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_KuXing.accomplish(player, quest_id ,ring_num)
	local exp = Quest_KuXing.get_exp(player,ring_num)
	local bindgold = Quest_KuXing.get_bgold(player,ring_num)
	local petexp = Quest_KuXing.get_petexp(player,ring_num)
	
	if not player:AddBindGold(bindgold, "Quest_KuXing", "Quest_KuXing", "nil") then
		sLuaApp:LuaDbg( "Quest_KuXing.accomplish player:AddBindGold is err")
		return false
	else
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	end
	if not player:AddExp (exp, "Quest_KuXing", "Quest_KuXing", "nil") then
		sLuaApp:LuaDbg( "Quest_KuXing.accomplish player:AddExp is err")
		return false
	end
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_KuXing", "Quest_KuXing", "nil") then
			sLuaApp:LuaDbg( "Quest_KuXing.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end

	
	local reward = Lua_tools.PlayerStartRandom(Quest_KuXing.BoxReward, "Quest_KuXing", 1)
	if reward[1] ~= "Nil" then
		Lua_tools.AddItem(player, reward, "Quest_KuXing", ""..player:GetName(), "")
	else
		sLuaApp:LuaDbg("Quest_KuXing give item is fail")
	end
	
	if ring_num == global_need_ring then
		local item1 = ""
		local item2 = ""
		local item3 = ""
		item1 = Quest_KuXing.count_reward(player:GetAttr(ROLE_ATTR_LEVEL))
		item2 = Quest_KuXing.count_reward(player:GetAttr(ROLE_ATTR_LEVEL))
		item3 = Quest_KuXing.count_reward(player:GetAttr(ROLE_ATTR_LEVEL))
		Lua_tools.GiveGoods(player, {ItemList = {item1,1,1}})
		Lua_tools.GiveGoods(player, {ItemList = {item2,1,1}})
		Lua_tools.GiveGoods(player, {ItemList = {item3,1,1}})
	end
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.UpdateQuestProgress(player, 102)
	end
end

function Quest_KuXing.count_reward(lv)
	local rate = {}
	local item = ""
	if lv <= 80 then
		rate = {80-lv/8,20+lv/8,0,0,0,0}
	elseif lv>80 then
		rate = {0, 100, 100, 0, 0, 0}
		local num = math.floor((lv-81)/10)
		for i = 3+num, 3 ,-1 do
			if rate[i] then
				rate[i] = 100
			end
		end
	end
	
	local sum = 0
	for i =1 ,#rate do
		sum = sum + rate[i]
	end
	local a = math.random(1,sum)
	
	for i=1 ,#rate do
		if a <= rate[i] then
			item = global_reward_list[i]
			break
		else
			a = a - rate[i]
		end
	end
	
	if not item or item == "" then
		item = global_reward_list[2]
	end
	
	return item
end

--多次击杀同一个npc回调
function Quest_KuXing.on_kill_boss(player, quest_id, cnt)
end 

function Quest_KuXing.ready(player,quest_id , ring_num)
end

function Quest_KuXing.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_KuXing.get_reward_bgold(player, quest_id, ring_num)
    return Quest_KuXing.get_bgold(player,ring_num)
end

function Quest_KuXing.get_reward_exp(player, quest_id, ring_num)
    return Quest_KuXing.get_exp(player,ring_num)
end

function Quest_KuXing.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_KuXing.get_petexp(player,ring_num)
end

function Quest_KuXing.get_bgold(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_KuXing.Config['BindGold']))() or 0	
end

function Quest_KuXing.get_exp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_KuXing.Config['Exp']))() or 0	
end

function Quest_KuXing.get_petexp(player,ring_num)
	local GongShi = [[
			local ring_num = ]]..ring_num..[[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local reincarnation = ]]..player:GetAttr(ROLE_ATTR_REINCARNATION)..[[
		]]
	return assert(load(GongShi..Quest_KuXing.Config['PetExp']))() or 0	
end