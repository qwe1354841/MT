--主线剧情动画播放
Movie_Play = {}

--完成任务回调
function Movie_Play.accomplish(player , quest_id , ring_num)
    sLuaApp:LuaDbg("玩家-"..player:GetName().."-完成了主线任务-"..quest_id)
    local map = player:GetMap()
    if quest_id == 222 or quest_id == 223 or quest_id == 224 or quest_id == 225 or quest_id == 226 or quest_id == 227 then
        if map:GetKeyName() == "傲来村野" then
            if sQuestSystem:CanAccept(player, 228) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "228")
            end
        end
    elseif quest_id == 235 then
        if map:GetKeyName() == "长安城" then
            if sQuestSystem:CanAccept(player, 236) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "236")
            end
        end
    elseif quest_id == 263 then
        if map:GetKeyName() == "大雁塔七层" then
            if sQuestSystem:CanAccept(player, 264) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "264")
            end
        end
    elseif quest_id == 451 then
        if map:GetKeyName() == "解阳山" then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "452")
        end
    elseif quest_id == 426 then
        if map:GetKeyName() == "天界" then
            if sQuestSystem:CanAccept(player, 427) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "427")
            end
        end
    elseif quest_id == 438 then
        if map:GetKeyName() == "丹炉地宫一层-不遇敌" then
            if sQuestSystem:CanAccept(player, 439) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "439")
            end
        end
    elseif quest_id == 519 then
        if map:GetKeyName() == "蟠桃园" then
            if sQuestSystem:CanAccept(player, 520) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "520")
            end
        end
    elseif quest_id == 521 then
        if map:GetKeyName() == "西梁女国" then
            if sQuestSystem:CanAccept(player, 522) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "522")
            end
        end
    end
    if Achievement then
        Achievement.Mind_line_complete(player,quest_id,ring_num)
    end
end

--接任务回调
function Movie_Play.accept(player , quest_id , ring_num)
    sLuaApp:LuaDbg("玩家-"..player:GetName().."-接取了主线任务-"..quest_id)
end

--进入地图回调
function Movie_Play.on_enter_map(player,map)
    if map:GetKeyName() == "傲来村" then
        if sQuestSystem:CanAccept(player, 200) == 0 then
            if player:GetInt("Movie_103") == 1 then
                return
            end
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "200")
            player:SetInt("Movie_103",1)
        end
    elseif map:GetKeyName() == "解阳山" then
        if sQuestSystem:IsFinished(player,420) then
            if sQuestSystem:CanAccept(player, 421) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "421")
            end
        end
    elseif map:GetKeyName() == "丹炉地宫一层-不遇敌" then
        if sQuestSystem:IsFinished(player,455) then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "456")
        end
    elseif map:GetKeyName() == "丹炉地宫一层" then
        if sQuestSystem:IsFinished(player,508) then
            sQuestSystem:Accept(player,509)
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "509")
        end
    elseif map:GetKeyName() == "丹炉地宫二层" then
        if sQuestSystem:IsFinished(player,507) then
            if sQuestSystem:CanAccept(player, 508) == 0 then
                sQuestSystem:Accept(player,508)
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "508")
            elseif sQuestSystem:GetQuestState(player, 508) == 3 or sQuestSystem:GetQuestState(player, 508) == 4 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "508")
            end
        end
    elseif map:GetKeyName() == "丹炉地宫二层-不遇敌" then
        if sQuestSystem:IsFinished(player,440) then
            if sQuestSystem:CanAccept(player, 441) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "441")
            end
        end
    elseif map:GetKeyName() == "丹炉地宫三层-不遇敌" then
        if sQuestSystem:IsFinished(player,442) then
            if sQuestSystem:CanAccept(player, 443) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "443")
            end
        end
    elseif map:GetKeyName() == "丹炉地宫五层-不遇敌" then
        if sQuestSystem:IsFinished(player,458) then
            if sQuestSystem:CanAccept(player, 459) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "459")
            end
        end
    elseif map:GetKeyName() == "两界山" then
        if sQuestSystem:IsFinished(player,492) and sQuestSystem:IsFinished(player,511) == false then
            sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "493")
        elseif sQuestSystem:IsFinished(player,511) then
            if sQuestSystem:CanFinish(player, 512) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "512")
            end
        end
    elseif map:GetKeyName() == "酆都" then
        if sQuestSystem:IsFinished(player,490) then
            if sQuestSystem:CanFinish(player, 491) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "491")
            end
        end
    elseif map:GetKeyName() == "长安城" then
        if sQuestSystem:IsFinished(player,470) then
            if sQuestSystem:CanFinish(player, 471) == 0 then
                sLuaTimerSystem:AddTimerEx(player, 500, 1, "Movie_system.QuestCallMovie", "471")
            end
        end
    end
end
--多次击杀同一个npc回调
function Movie_Play.on_kill_boss(player, quest_id, cnt)
end
--放弃任务回调
function Movie_Play.abandon(player,quest_id , ring_num)
end
--任务失败回调
function Movie_Play.failed(player,quest_id , ring_num)
end

function Movie_Play.ready(player,quest_id , ring_num)
end

function Movie_Play.get_reward_gold(player, quest_id, ring_num)
    return 0
end

function Movie_Play.get_reward_bgold(player, quest_id, ring_num)
    return 0
end

function Movie_Play.get_reward_exp(player, quest_id, ring_num)
    return 0
end

function Movie_Play.get_reward_pet_exp(player, quest_id, ring_num)
    return 0
end

function Movie_Play.OnResult(player, type, victory, custom)
end