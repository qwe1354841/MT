--帮派任务
Quest_Guild = {}

function Quest_Guild.getbindgold(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	return level*40+4000
end

function Quest_Guild.getexp(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	return level*80+1200
end

function Quest_Guild.getBuildDegree(player,ring_num)
	return 10
end

function Quest_Guild.getFund(player,ring_num)
	return 50
end


function Quest_Guild.getContrb(player,ring_num)
	return 10
end
--接任务回调
function Quest_Guild.accept(player, quest_id ,ring_num)

end
--放弃任务回调
function Quest_Guild.abandon(player,quest_id , ring_num)

end
--任务失败回调
function Quest_Guild.failed(player,quest_id , ring_num)

end
--完成任务回调
function Quest_Guild.accomplish(player, quest_id ,ring_num)
	local exp = math.floor(Quest_Guild.getexp(player,ring_num))
	player:AddExp (exp, "任务系统", "帮派任务", "nil")
	
	local petexp = math.floor(Quest_Guild.getexp(player,ring_num))
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(petexp, "Quest_Guild", "Quest_Guild", "nil") then
			sLuaApp:LuaDbg( "Quest_Guild.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	
    local bindgold = math.floor(Quest_Guild.getbindgold(player,ring_num))
	if bindgold > 0 then
		player:AddBindGold(bindgold, "任务系统", "帮派任务", "nil")
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	end
	local build_degree =  Quest_Guild.getBuildDegree(player,ring_num)
	sGuildSystem:AddBuildDegree(player,build_degree)
	sLuaApp:NotifyTipsMsg(player, "帮派建设度增加了"..build_degree)
	
	--player:AddGuildAchievement(bindgold,"帮派任务","增加帮派成就","")
	--sLuaApp:NotifyTipsMsg(player,  "您获得了"..bindgold.."帮派成就")

	local fund = Quest_Guild.getFund(player,ring_num)
	local guild = sGuildSystem:GetGuildByPlayer(player)
	Lua_tools.AddGuildFund(player,fund)
	sLuaApp:NotifyTipsMsg(player, "获取"..fund.."点帮派资金")
	
	local Contrb = Quest_Guild.getContrb(player,ring_num)
	if player:AddGuildContribute(Contrb,"Quest_Guild","accomplish",""..Contrb) then
		sLuaApp:NotifyTipsMsg(player, "获得了"..Contrb.."点帮贡")
	end
	
	player:SetDayInt("GuildQuestNum",player:GetDayInt("GuildQuestNum")+1)
	if player:GetDayInt("GuildQuestNum") >= 10 then
		sGuildSystem:AddBuildDegree(player,50)
		sLuaApp:NotifyTipsMsg(player, "完成了当天的帮派任务，帮派建设度额外增加了50！")
	end

	--五星连珠帮派任务回调
	if BinGoQuestCallBack and BinGoQuestCallBack.GuildQuest then
		BinGoQuestCallBack.GuildQuest(player)
	end
end
--多次击杀同一个npc回调
function Quest_Guild.on_kill_boss(player, quest_id, cnt)

end 

function Quest_Guild.ready(player,quest_id , ring_num)

end

function Quest_Guild.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_Guild.get_reward_bgold(player, quest_id, ring_num)
    return Quest_Guild.getbindgold(player,ring_num)
end

function Quest_Guild.get_reward_exp(player, quest_id, ring_num)
    return Quest_Guild.getexp(player,ring_num)
end

function Quest_Guild.get_reward_pet_exp(player, quest_id, ring_num)
    return Quest_Guild.getexp(player,ring_num)
end