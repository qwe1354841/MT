--鬼王任务（大话）
GuiWang = {}
--接任务回调
function GuiWang.accept(player, quest_id ,ring_num)
	local str1 = [[
		local func = function()
			TrackUI.OnManualClickQuest(]]..quest_id..[[)
		end
		Timer.New(func, 0.5, 1):Start()
	]]
	sLuaApp:ShowForm(player, "脚本表单", str1)
end
--放弃任务回调
function GuiWang.abandon(player,quest_id , ring_num)

end
--任务失败回调
function GuiWang.failed(player,quest_id , ring_num)

end
--完成任务回调
function GuiWang.accomplish(player, quest_id ,ring_num)
	local exp = GuiWang.getexp(player,ring_num)
    local bindgold = GuiWang.getbindgold(player,ring_num)
    local petexp = GuiWang.getexp(player,ring_num)
	player:AddExp (exp, "GuiWang", "accomplish", "nil")
	player:AddBindGold(bindgold, "任务系统", "GuiWang", "nil")
	sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	
	local pet_list = PetLineup.GetNowLineup(player)
	for k,v in pairs(pet_list) do
		local pet = sPetSystem:GetPetByGUID(v)
		if pet then
			if not pet:AddExp(petexp, "GuiWang", "GuiWang", "nil") then
				sLuaApp:LuaDbg( "GuiWang.accomplish pet:AddExp is err")
				return false
			end
		end
	end
end
--多次击杀同一个npc回调
function GuiWang.on_kill_boss(player, quest_id, cnt)

end 

function GuiWang.ready(player,quest_id , ring_num)

end

function GuiWang.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function GuiWang.get_reward_bgold(player, quest_id, ring_num)
    return GuiWang.getbindgold(player,ring_num)
end

function GuiWang.get_reward_exp(player, quest_id, ring_num)
    return GuiWang.getexp(player,ring_num)
end

function GuiWang.get_reward_pet_exp(player, quest_id, ring_num)
    return GuiWang.getexp(player,ring_num)
end

function GuiWang.getbindgold(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	--return math.floor((0.14+0.002*ring_num)*level*level*level+40000+2000*ring_num)
	return math.floor((1+(math.fmod(ring_num-1,10)+1)*0.1)*(1+level*0.01)*2500)
end

function GuiWang.getexp(player,ring_num)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	return math.floor((1+(math.fmod(ring_num-1,10)+1)*0.1)*level*100+500)
end