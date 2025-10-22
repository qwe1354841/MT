--引导相关（大话）
Quest_3 = {}

--接任务回调
function Quest_3.accept(player, quest_id ,ring_num)
	if quest_id == 3 then
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Quest_3", "OnResult")
	end
	local pet = sPetSystem:GetLineupPet(player)
	if not pet then
		local str = [[
			GUI.OpenWnd("PetUI")
			GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.Guidance_Config['Guidance_PetUI'])..[[
			GUI.OpenWnd('GuideUI')
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end
--放弃任务回调
function Quest_3.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_3.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_3.accomplish(player, quest_id ,ring_num)
end
--多次击杀同一个npc回调
function Quest_3.on_kill_boss(player, quest_id, cnt)
end 

function Quest_3.ready(player,quest_id , ring_num)
end

function Quest_3.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_3.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_3.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_3.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Quest_3.OnResult(player, type, victory, custom)
	local pet = sPetSystem:GetLineupPet(player)
	if pet then
		if sQuestSystem:ForceReady(player,3) then
			sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Quest_3", "OnResult")
		end
	end 
end