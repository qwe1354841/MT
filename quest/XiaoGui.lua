--降妖任务
XiaoGui = {}
--接任务回调
function XiaoGui.accept(player, quest_id ,ring_num)
	-- local str1 = [[
		-- local func = function()
			-- TrackUI.OnManualClickQuest(]]..quest_id..[[)
		-- end
		-- Timer.New(func, 0.5, 1):Start()
	-- ]]
	-- sLuaApp:ShowForm(player, "脚本表单", str1)
end
--放弃任务回调
function XiaoGui.abandon(player,quest_id , ring_num)

end
--任务失败回调
function XiaoGui.failed(player,quest_id , ring_num)

end
--完成任务回调
function XiaoGui.accomplish(player, quest_id ,ring_num)
	local exp = XiaoGui.getexp(player,ring_num)
    local bindgold = XiaoGui.getbindgold(player,ring_num)
    local pet_exp = XiaoGui.getexp(player,ring_num)
	if VipLogic then
		exp = VipLogic.GetVipEnhanced(player,"抓鬼经验","reward",exp)
		--pet_exp = VipLogic.GetVipEnhanced(player,"抓鬼经验","reward",pet_exp)
	end
	
	
	player:AddExp(exp, "XiaoGui", "accomplish", "player")
	player:AddBindGold(bindgold, "任务系统", "小鬼任务奖励", "nil")
	sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(pet_exp, "XiaoGui", "accomplish", "pet") then
			sLuaApp:LuaDbg( "XiaoGui.accomplish pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	
	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "小鬼任务")
	end
	if Assist then
		Assist.ActivityGetPoint(player, "小鬼任务")
	end
	local active_add = Act_XiaoGui.Active_Add
	local active_max = Act_XiaoGui.Active_Max
	local active = player:GetDayInt("Act_XiaoGui_Active_Num"..Act_XiaoGui.Active_ID)
	if active < active_max then
		local active_sum = active + active_add
		if active_sum > active_max then
			player:SetDayInt("Act_XiaoGui_Active_Num"..Act_XiaoGui.Active_ID, active_max)
			ActivitySystem.AddActiveVal(player, active_max - active)
		else
			player:SetDayInt("Act_XiaoGui_Active_Num"..Act_XiaoGui.Active_ID, active_sum)
			ActivitySystem.AddActiveVal(player, active_add)
		end
	end
	if Achievement then
		Achievement.Mind_line_complete(player,quest_id,ring_num)
	end
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.UpdateQuestProgress(player, 7)
	end
end
--多次击杀同一个npc回调
function XiaoGui.on_kill_boss(player, quest_id, cnt)

end 

function XiaoGui.ready(player,quest_id , ring_num)

end

function XiaoGui.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function XiaoGui.get_reward_bgold(player, quest_id, ring_num)
    return XiaoGui.getbindgold(player,ring_num)
end

function XiaoGui.get_reward_exp(player, quest_id, ring_num)
    return XiaoGui.getexp(player,ring_num)
end

function XiaoGui.get_reward_pet_exp(player, quest_id, ring_num)
    return XiaoGui.getexp(player,ring_num)
end

function XiaoGui.getbindgold(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	--return math.floor((0.14+0.002*ring_num)*level*level*level+40000+2000*ring_num)
	return math.floor((1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*2500)
end

function XiaoGui.getexp(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	return math.floor((1+(math.fmod(ring_num-1,10)+1)*0.1)*level*100+500)
end