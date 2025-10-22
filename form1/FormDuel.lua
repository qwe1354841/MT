--切蹉相关表单
local DuelConfig = 
{
    Distance = 20,                      --切蹉距离要求  
    Blacks = {"傲来村野", "东海渔村", "长安城", "帮战地图"},   --切蹉地图黑名单
    Victory = 20,                       --每胜得到战绩点
    Defeat = 0,                         --每败得到战绩点
    DayLimit = 100                      --每日战绩点上限
}

FormDuel = {}
function FormDuel.OnDuel(actor, target_guid)
    local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if not target then
        return "找不到切蹉目标"
    end

    local distance = actor:GetDistance(target)
    if distance < 0 or distance > DuelConfig.Distance then
        return "对方距离太远，无法进入切磋"
    end
	
	local mapKey = actor:GetMapKeyName()
	
	if MapConfig.GetByKeyName(mapKey).Type == 2 then
		return mapKey.."无法切磋"
	end

    -- 判断地图
    local x = sMapSystem:GetPosX(actor)
    local y = sMapSystem:GetPosY(actor)
    local map = actor:GetMap()
    local isPkMap = map:TestGridType(x,y,3) -- @param type 逻辑个类型(2=跳转点 3=竞技区 4=PK区 5=NPC禁刷区 6=安全区)
    if not isPkMap then
        return mapKey.."无法切磋"
    end
    --for _, v in ipairs(DuelConfig.Blacks) do
    --    if mapKey == v then
    --        return v.."无法切磋"
    --    end
    --end
	
    if actor:IsFightState() then
        return "无法发起切磋，您已经在战斗中"
    end

    if actor:GetTeam() then
        if not actor:IsTeamLeader() and not actor:IsTempLeave() then
            return "无法发起切磋，您不是队长"
        end
    end

    if target:IsFightState() then
        return "无法发起切磋，对方已经在战斗中"
    end

    if not target:IsAcceptDuel() then
        return "无法切磋，对方未开启切磋开关"
    end

    local team = target:GetTeam()
    if team then
        local members = team:GetTeamMembers(false)
        for _, member in ipairs(members) do
            if not member:IsAcceptDuel() then
                return "无法发起切磋，对方队伍中有队员未开启切磋开关"
            end
        end
		
        if target:IsTeamMember() and not target:IsTempLeave() then
            target = sPlayerSystem:GetPlayerByGUID(team:GetTeamLeaderGUID())
            if not target then
                return "无法发起切磋，找不到对方队长"
            end
        end
    end

    sFightSystem:StartDuel(actor, target)
    return "开启与玩家"..target:GetName().."切蹉战斗"
end

function FormDuel.GuildBattle_Attack(actor, target_guid)
	return GuildBattle.PVPAttack(actor, target_guid)
end
