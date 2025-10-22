--支线剧情动画播放
Movie_Play_Branch = {}

--接受任务回调
function Movie_Play_Branch.accept(player , quest_id , ring_num)
    local map = player:GetMap()
    if quest_id == 678 then
        if map:GetKeyName() == "江南野外" then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
        end
    elseif quest_id == 635 then
        if map:GetKeyName() == "江南野外" then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
        end
    elseif quest_id == 707 then
        if map:GetKeyName() == "水帘洞窟一层-不遇敌" then
            sLuaTimerSystem:AddTimerEx(player, 5000, 1, "Movie_Play_Branch.FinishQuest", ""..quest_id)
        end
    elseif quest_id == 709 then
        if map:GetKeyName() == "水帘洞窟一层-不遇敌" then
            sLuaTimerSystem:AddTimerEx(player, 5000, 1, "Movie_Play_Branch.FinishQuest", ""..quest_id)
        end
    end
end
--完成任务回调
function Movie_Play_Branch.accomplish(player , quest_id , ring_num)
    local map = player:GetMap()
    if quest_id == 666 then
        if map:GetKeyName() == "江南野外" then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
        end
    end
end
--多次击杀同一个npc回调
function Movie_Play_Branch.on_kill_boss(player, quest_id, cnt)
    if quest_id == 673 then
        sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
    elseif quest_id == 619 then
        sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", ""..quest_id)
    end
end
--放弃任务回调
function Movie_Play_Branch.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Movie_Play_Branch.failed(player,quest_id , ring_num)
end

function Movie_Play_Branch.ready(player,quest_id , ring_num)
end

function Movie_Play_Branch.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Movie_Play_Branch.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Movie_Play_Branch.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Movie_Play_Branch.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Movie_Play_Branch.OnResult(player, type, victory, custom)
end

--进入地图回调
function Movie_Play_Branch.on_enter_map(player,map)
    if map:GetKeyName() == "长安城" then
        if sQuestSystem:GetQuestState(player, 641) == 2 then
            if sQuestSystem:CanAccept(player, 641) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "641")
        elseif sQuestSystem:GetQuestState(player, 627) == 2 then
            if sQuestSystem:CanAccept(player, 627) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "627")
        elseif sQuestSystem:GetQuestState(player, 637) == 2 then
            if sQuestSystem:CanAccept(player, 637) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "637")
        elseif sQuestSystem:GetQuestState(player, 601) == 2 then
            if sQuestSystem:CanAccept(player, 601) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "601")
        elseif sQuestSystem:GetQuestState(player, 741) == 2 then
            if sQuestSystem:CanAccept(player, 741) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "741")
        end
    elseif map:GetKeyName() == "酆都" then
        if sQuestSystem:GetQuestState(player, 671) == 2 then
            if sQuestSystem:CanAccept(player, 671) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "671")
        end
    elseif map:GetKeyName() == "傲来村野" then
        if sQuestSystem:GetQuestState(player, 657) == 2 then
            if sQuestSystem:CanAccept(player, 657) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "657")
        elseif sQuestSystem:GetQuestState(player, 728) == 2 then
            if sQuestSystem:CanAccept(player, 728) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "728")
        elseif sQuestSystem:GetQuestState(player, 755) == 2 then
            if sQuestSystem:CanAccept(player, 755) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "755")
        end
    elseif map:GetKeyName() == "江南野外" then
        if sQuestSystem:GetQuestState(player, 738) == 2 then
            if sQuestSystem:CanAccept(player, 738) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "738")
        elseif sQuestSystem:GetQuestState(player, 725) == 2 then
            if sQuestSystem:CanAccept(player, 725) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "725")
        end
    elseif map:GetKeyName() == "东海海湾" then
        if sQuestSystem:GetQuestState(player, 698) == 2 then
            if sQuestSystem:CanAccept(player, 698) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "698")
        elseif sQuestSystem:GetQuestState(player, 716) == 2 then
            if sQuestSystem:CanAccept(player, 716) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "716")
        end
    elseif map:GetKeyName() == "水帘洞窟一层-不遇敌" then
        if sQuestSystem:GetQuestState(player, 706) == 2 then
            if sQuestSystem:CanAccept(player, 706) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "706")
        end
    elseif map:GetKeyName() == "傲来村" then
        if sQuestSystem:GetQuestState(player, 615) == 2 then
            if sQuestSystem:CanAccept(player, 615) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "615")
        elseif sQuestSystem:GetQuestState(player, 685) == 2 then
            if sQuestSystem:CanAccept(player, 685) ~= 0 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "685")
        end
    elseif map:GetKeyName() == "慈恩寺" then
        if sQuestSystem:GetQuestState(player, 741) == 3 or sQuestSystem:GetQuestState(player, 741) == 4 then
            if sQuestSystem:CanFinish(player, 741) == 0 then
                Movie_Play_Branch.FinishQuest(player,0,741)
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "742")
            end
        end
    end
end

function Movie_Play_Branch.FinishQuest(player,timer_id,quest_id)
    if player == nil or quest_id == nil then
        return
    end
    sQuestSystem:ForceFinish(player,quest_id)
end