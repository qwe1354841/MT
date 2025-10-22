--大话任务引导
Quest_81 = {}

--接任务回调
function Quest_81.accept(player, quest_id ,ring_num)
end
--放弃任务回调
function Quest_81.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Quest_81.failed(player,quest_id , ring_num)
end
--完成任务回调
function Quest_81.accomplish(player, quest_id ,ring_num)
	local FormStr = [[
		local func = function()
			TrackUI.SetQuestTop(10)
			GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.Guidance_Config['Guidance_TrackUI'])..[[
			GUI.OpenWnd('GuideUI')
		end
		Timer.New(func, 0.5, 1):Start()
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
--多次击杀同一个npc回调
function Quest_81.on_kill_boss(player, quest_id, cnt)
end 

function Quest_81.ready(player,quest_id , ring_num)
end

function Quest_81.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Quest_81.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Quest_81.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Quest_81.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end