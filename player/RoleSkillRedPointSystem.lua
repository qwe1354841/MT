-- 技能小红点系统
-- 玩家技能页面小红点数据
local RoleSkillRedPointSystem = {}
_G.RoleSkillRedPointSystem = RoleSkillRedPointSystem

-- 获取门派小红点数据
function RoleSkillRedPointSystem._get_school_red_point_data(player)
    if not player then return end
    if not (PlayerSkill.HeartMethodNum and PlayerSkill.Consume) then require 'PlayerSkill' end


    local data = {}
    for i = 1, PlayerSkill.HeartMethodNum do
        --心法等级
        local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..i)
        if heart_level == 0 then
            sLuaApp:LuaErr("PlayerSkill.GetData  player"..player:GetName().." PlayerSkill_HeartMethodLevel_"..i.."== 0")
            return
        end

        local can_up = true
        -- 当前心法等级已达上限！
        if i == 1 then
            local level = player:GetAttr(ROLE_ATTR_LEVEL)
            if heart_level >= level then
                can_up = false
            end
        else
            -- 普通心法等级不能高于主心法等级
            local major_heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_1")
            if heart_level >= major_heart_level then
                can_up = false
            end
        end

        if can_up then
            --升级消耗
            local level_consume = PlayerSkill.Consume[heart_level]

            if level_consume then
                -- 判断消耗经验是否足够
                local exp_is_have = true
                if level_consume["Exp"] and level_consume["Exp"] > 0 then
                    local role_exp = player:GetAttr(ROLE_ATTR_EXP)
                    exp_is_have = role_exp >= level_consume["Exp"]
                end

                -- 判断货币是否足够
                local money_is_have = Lua_tools.IsMoneyEnough(player, level_consume["MoneyType"], level_consume["MoneyVal"])

                table.insert(data,can_up and exp_is_have and money_is_have)
            else
                table.insert(data,false)
            end
        end


    end

    return data

end


-- 获取天赋小红点数据
function RoleSkillRedPointSystem._get_talent_red_point_data(player)
    if not player then return end
    if not next(PlayerSkillSpell.Config_By_Job) then
        PlayerSkillSpell.Initialization()
    end
    --sLuaApp:LuaDbg(Lua_tools.serialize(PlayerSkillSpell.Config_By_Job))
    --sLuaApp:LuaDbg(Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()))

    local already_lean = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
    local data = {}
    -- 获取当前角色职业id
    local job_id = player:GetAttr(3)
    for k,v in pairs(PlayerSkillSpell.Config_By_Job['Job_'..job_id]) do
        data[k] = {}
        for i,j in pairs(v) do
            data[k][i] = RoleSkillRedPointSystem._talent_is_can_lean(player,j.Id,already_lean)
        end
    end
    return data
end

function RoleSkillRedPointSystem._talent_is_can_lean(player,id,already_lean)
    if not player then return end

    if player:GetAttr(2) < PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentLevel'] then
        -- 等级不足
        return false
    end

    if already_lean[id] ~= nil then
        -- 已学习
        return false
    end

    local item_key_name = ItemConfig.GetById(PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentItem']).KeyName
    local num = 1

    if not Lua_tools.IsItemEnough(player, { item_key_name, num}) then
        -- 物品不足
        return false
    end

    return true

end


-- 获取技能-修炼小红点数据
function RoleSkillRedPointSystem._get_practice_red_point_data(player)
    if not player then return end
    if not CultivationSkill then require 'CultivationSkill' end

    local data = {}

    for k,v in ipairs(CultivationSkill.SkillData) do
        local skill_id = v.SkillID
        -- 是否能够学习一次
        local count = 1
        local is_can_lean_one = RoleSkillRedPointSystem._practice_is_can_lean(player,skill_id,count)

        -- 是否能够学习十次
        count = 10
        local is_can_lean_ten = RoleSkillRedPointSystem._practice_is_can_lean(player,skill_id,count)

        table.insert(data,{is_can_lean_one,is_can_lean_ten})

    end

    -- 判断是否拥有修炼丹
    if CultivationSkill.ItemData then
        local is_have_item = false
        for k,v in ipairs(CultivationSkill.ItemData) do
            local item_key_name = v.KeyName
            is_have_item = is_have_item or Lua_tools.IsItemEnough(player, { item_key_name, 1})
        end
        data.is_have_item = is_have_item
    end

    return data
end

function RoleSkillRedPointSystem._practice_is_can_lean(player,skill_id,count)
    if not (player and skill_id and count) then return end
    local skill_id = tonumber(skill_id)
    local count = tonumber(count)
    if count <= 0 then
        return false
    end

    if not CultivationSkill.CultivationSkillMapping then CultivationSkill.init() end
    local mapping = CultivationSkill.CultivationSkillMapping
    local now_level = player:GetInt("CultivationSkill_NowLevel_"..mapping[skill_id])
    if now_level >= player:GetInt("CulSkillMaxLevel") then
        -- 已到达当前可修炼的最高等级
        return false
    end

    local MoneyVal = count * CultivationSkill.OnceCulConsume["MoneyVal"]
    if Lua_tools.IsMoneyEnough(player, 5, MoneyVal) == false then
        return false
    end

    return true

end


-- 获取技能-帮派小红点数据
function RoleSkillRedPointSystem._get_guild_red_point_data(player)
    if not player then return end
    if not GuildSkill then require 'GuildSkill' end

    -- 最大等级
    local maxLevel = player:GetInt("GuildSkillMaxLevel")
    -- 升到最大等级所需要的经验值
    local maxLevelExp = 0
    for i = 1, maxLevel do
        maxLevelExp = maxLevelExp + GuildSkill.SkillLevelExtra[i]["Exp"]
    end

    local data = {}
    -- 遍历所有技能
    if GuildSkill.SkillData then
        for k,v in ipairs(GuildSkill.SkillData) do
            local skill_id = v.SkillID
            -- 是否能够学习一次
            local count = 1
            local is_can_lean_one = RoleSkillRedPointSystem._guild_is_can_lean(player,skill_id,count,maxLevelExp)

            -- 是否能够学习十次
            local count = 10
            local is_can_lean_ten = RoleSkillRedPointSystem._guild_is_can_lean(player,skill_id,count,maxLevelExp)
            table.insert(data,{is_can_lean_one,is_can_lean_ten})
        end
    end

    return data

end

function RoleSkillRedPointSystem._guild_is_can_lean(player,skill_id,count,maxLevelExp)

    if not (player and skill_id and count) then return end
    local skill_id = tonumber(skill_id)
    local count = tonumber(count)
    if count <= 0 then
        return false
    end

    local exp = count * GuildSkill.OnceGuildConsume["Exp"]
    if not GuildSkill.GuildSkillMapping then GuildSkill.init() end
    local mapping = GuildSkill.GuildSkillMapping
    local now_level = player:GetInt("GuildSkill_NowLevel_"..mapping[skill_id])
    if now_level >= player:GetInt("GuildSkillMaxLevel") then
        -- 已到达当前帮派技能可学习的最高等级
        return false
    end

    local now_exp = player:GetInt("GuildSkill_NowExp_"..mapping[skill_id])

    if exp > maxLevelExp - now_exp then
        count = math.floor((maxLevelExp - now_exp)/GuildSkill.OnceGuildConsume.Exp)
    end
    local MoneyVal = count * GuildSkill.OnceGuildConsume["MoneyVal"]
    local GuildContribute = count * GuildSkill.OnceGuildConsume["GuildContribute"]
    -- 当前人物所拥有的帮派贡献度
    local now_contribute = player:GetGuildContribute()

    if now_contribute < GuildContribute then
        -- 帮贡不足，无法学习
        return false
    end

    if Lua_tools.IsMoneyEnough(player, 5, MoneyVal) == false then
        -- money 不足
        return false
    end

    return true
end


-- 获取技能-全部小红点数据 未使用
function RoleSkillRedPointSystem.__get_role_skill_all_red_point_data(player)
    if not player then return end
    local school_data = RoleSkillRedPointSystem._get_school_red_point_data(player)
    local talent_data = RoleSkillRedPointSystem._get_talent_red_point_data(player)
    local practice_data = RoleSkillRedPointSystem._get_practice_red_point_data(player)
    local guild_data = RoleSkillRedPointSystem._get_guild_red_point_data(player)
    local data = {
        school_data = school_data,
        talent_data = talent_data,
        practice_data = practice_data,
        guild_data = guild_data
    }
    return data
end

-- 获取技能-判断数据
function RoleSkillRedPointSystem.get_role_skill_all_jude(player)
    local school_data = RoleSkillRedPointSystem._school_jude(player)
    local practice_data = RoleSkillRedPointSystem._practice_judge(player)
    local guild_data = RoleSkillRedPointSystem._guild_judge(player)
    local data = {
        school_data = school_data,
        practice_data = practice_data,
        guild_data = guild_data
    }
    return data
end


-- 修炼
function RoleSkillRedPointSystem._practice_judge(player)
    if not CultivationSkill then require 'CultivationSkill' end

    -- 最大等级
    --local max_level = player:GetInt("CulSkillMaxLevel")

    -- 升级所需要金额
    local money_value = CultivationSkill.OnceCulConsume["MoneyVal"]

    local data = {
        --max_level = max_level,
        money_value = money_value
    }

    if not CultivationSkill.CultivationSkillMapping then CultivationSkill.init() end
    local mapping = CultivationSkill.CultivationSkillMapping

    -- 当前技能等级
    local now_level_t = {}
    for k,v in ipairs(CultivationSkill.SkillData) do
        local now_level = player:GetInt("CultivationSkill_NowLevel_"..mapping[v.SkillID])
        local id = tostring(v.skill_id)
        table.insert(now_level_t,now_level)
    end
    data.now_level = now_level_t
    return data
end

-- 帮派
function RoleSkillRedPointSystem._guild_judge(player)
	sLuaApp:LuaDbg(" RoleSkillRedPointSystem._guild_judge(player)")
    if not GuildSkill then require 'GuildSkill' end
    -- 帮派最大等级
    local max_level = 0
    local guild = player:GetGuild()
    if guild then
        local Academy_Level = guild:GetValutLevel()
        if not GuildConfig then require 'GuildConfig' end
        if Academy_Level >= 0 and Academy_Level < 6 then
            --max_level = GuildConfig.BuildingsConfig[4]['BuildingLevels'][Academy_Level].Param1
            max_level = GuildSkill.GetPlayerNowGuildSkillLevel(player)
        end
    end

    -- 升级所需金钱
    local money_value = GuildSkill.OnceGuildConsume["MoneyVal"]
    -- 升级所需帮贡
    local guild_contribute = GuildSkill.OnceGuildConsume["GuildContribute"]
    local data = {
        max_level = max_level,
        money_value = money_value,
        guild_contribute = guild_contribute
    }

    if not GuildSkill.GuildSkillMapping then GuildSkill.init() end
    local mapping = GuildSkill.GuildSkillMapping
    -- 当前技能等级
    local now_level_t = {}
    if GuildSkill.SkillData then
        for k,v in ipairs(GuildSkill.SkillData) do
            local now_level = player:GetInt("GuildSkill_NowLevel_"..mapping[v.SkillID])
            local id = tostring(v.SkillID)
            table.insert(now_level_t,now_level)
        end
    end
    data.now_level = now_level_t
    return data
end

-- 门派
function RoleSkillRedPointSystem._school_jude(player)
    if not (PlayerSkill.HeartMethodNum and PlayerSkill.Consume) then require 'PlayerSkill' end

    -- 主心法最大等级为当前人物等级
    -- 其他最大等级不能超过主心法等级
    -- 当前主心法等级
    local major_heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_1")
    local money_type = PlayerSkill.Consume[1].MoneyType
    local data = {
        major_heart_level = major_heart_level,
        money_type = money_type,
    }

    for i = 1, PlayerSkill.HeartMethodNum do

        -- 当前技能等级
        local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..i)

        if heart_level == 0 then
            sLuaApp:LuaErr("PlayerSkill.GetData  player"..player:GetName().." PlayerSkill_HeartMethodLevel_"..i.."== 0")
            return
        end

        local money_value = nil
        if PlayerSkill.Consume[heart_level] and PlayerSkill.Consume[heart_level].MoneyVal then
            -- 当前等级升级消耗
            money_value = PlayerSkill.Consume[heart_level].MoneyVal
        else
            money_value = false
        end

        table.insert(data,{heart_level = heart_level,money_value = money_value})

    end
    return data
end