-- 侍从小红点
local GuardRedPoint = {}
_G.GuardRedPoint = GuardRedPoint


-- 如果未拥有侍从时，判断侍从是否可以邀请
function GuardRedPoint._can_activation(player,guard_id)

    -- 获取此侍从的表单数据
    local guardData = GuardConfig.GetById(guard_id)
    -- 激活道具物品id
    local guardItemId = guardData.CallItemIcon

    -- 获取玩家拥有的侍从激活道具的数量
    local item_amount = sItemSystem:GetItemAmount(player, guardItemId, 3)

    -- 返回侍从是否能够激活
    return item_amount >= guardData.ItemNumber

end


-- 判断侍从技能是否能够升级,index 1~4
function GuardRedPoint._can_up_skill(player,guard,index)
    if index == 4 then
        index = 'All'
    end
    if GuardSkill then
        return GuardSkill.GetSkillCanLvUp(player, guard, index)
    end
    return false
end


-- 判断侍从是否能够升星
function GuardRedPoint._can_up_star(player,guard)

    -- 获取此侍从的表单数据
    local guard_id = guard:GetId()
    local guardData = GuardConfig.GetById(guard_id)
    -- 激活道具物品id
    local guardItemId = guardData.CallItemIcon

    -- 获取玩家拥有的侍从激活道具的数量
    local item_amount = sItemSystem:GetItemAmount(player, guardItemId, 3)
    -- 侍从当前星级
    local guard_star = guard:GetInt("Guard_Star")
    if GuardUpStar then
        if guard_star < 6 and guard_star > 0 then
                                    -- 侍从升星所需要的信物数量
            return item_amount >= GuardUpStar.NeedTokenNumber[guard_star]
        end
    end
    return false

end


-- 判断侍从能否提升情缘技能等级，1~4 技能下标
function GuardRedPoint._can_up_love_skill(player,guard,index)
    if Guard_LoveSkillUp then
       return Guard_LoveSkillUp.SkillCanUp(player,guard,index)
    end
    return false
end

-- 判断能否提升加成属性
function GuardRedPoint._can_up_attr(player,guard)
    -- 当前侍从星级
    local guard_star = guard:GetInt("Guard_Star")
    -- 当前侍从所提供的属性加成等级
    local guard_attr_level = guard:GetInt("Attr_Add_Level")
    --sLuaApp:LuaDbg("guard_start: "..guard_star.. " guard_attr_level: "..guard_attr_level)
    return guard_star > guard_attr_level

end

-- 返回一个侍从，所有可能显示小红点的情况
function GuardRedPoint._get_result(player,guard,guard_id,guard_container)
    -- 是否激活
    local is_activation = false
    local can_activation = false
    local can_up_skill = false
    local can_up_star = false
    local can_up_love_skill = false
    local can_up_attr_level = false
    -- 如果未拥有此侍从
    if not guard_container:HasGuard(guard_id) then
        -- 是否激活
        is_activation = false
        -- 激活
        can_activation = GuardRedPoint._can_activation(player,guard_id)
    else
        -- 是否激活
        is_activation = true
        -- 技能
        for i=1,4 do
            if GuardRedPoint._can_up_skill(player,guard,i) then
                can_up_skill = true
                break
            end
        end

        -- 升星
        can_up_star = GuardRedPoint._can_up_star(player,guard)

        -- 情缘技能
        for i=1,4 do
            if GuardRedPoint._can_up_love_skill(player,guard,i) then
                can_up_love_skill = true
                break
            end
        end

        -- 加成属性
        can_up_attr_level = GuardRedPoint._can_up_attr(player,guard)
    end

    return is_activation, can_activation, can_up_skill, can_up_star, can_up_love_skill, can_up_attr_level
end


-- 侍从种类小红点
GuardRedPoint._GUARD_KIND = {
    [103] = 1,-- 金翅大鹏王
    [104] = 1,-- 杨戬
    [102] = 1,-- 猪八戒
    [125] = 1,-- 混世魔王
    [101] = 1,-- 孙悟空
    [129] = 4,-- 九灵元圣
    [106] = 1,-- 程咬金
    [126] = 1,-- 虎力大仙
    [128] = 1,-- 六耳猕猴
    [105] = 1,-- 牛魔王
    [127] = 1,-- 鹿力大仙
    [135] = 2,-- 太乙天尊
    [109] = 2,-- 龙王
    [110] = 2,-- 水德真君
    [134] = 2,-- 银角大王
    [132] = 2,-- 黄风怪
    [111] = 2,-- 哪吒
    [140] = 2,-- 红孩儿
    [108] = 2,-- 敖丙
    [130] = 2,-- 灵感大王
    [112] = 2,-- 罗刹女
    [131] = 2,-- 黑风怪
    [113] = 3,-- 观音菩萨
    [137] = 3,-- 灵吉菩萨
    [115] = 3,-- 如意真仙
    [116] = 3,-- 地涌夫人
    [114] = 2,-- 唐僧
    [136] = 3,-- 金池长老
    [119] = 5,-- 太上老君
    [107] = 5,-- 沙和尚
    [117] = 5,-- 李靖
    [124] = 5,-- 白骨夫人
    [122] = 5,-- 白无常
    [118] = 5,-- 春十三娘
    [123] = 4,-- 孟婆
    [133] = 1,-- 金角大王
    [121] = 4,-- 黑无常
    [120] = 4,-- 镇元子
    [138] = 4,-- 九尾狐狸
    [139] = 4,-- 羊力大仙
}

--GuardRedPoint._kind_red_point = {
--    ["物攻"] = false, -- 物攻
--    ["法攻"] = false, -- 法攻
--    ["治疗"] = false, -- 治疗
--    ["控制"] = false, -- 控制
--    ["辅助"] = false, -- 辅助
--
--}

-- 获取侍从小红点
function GuardRedPoint._get_red_point(player)
    -- 获取所有侍从
    local guard_all_data = GuardConfig.GetTableData()
    -- 获取侍从容器
    local guard_container = player:GetGuardContainer()

    -- 侍从种类小红点
    local kind_red_point = {
    [1] = false, -- 物攻
    [2] = false, -- 法攻
    [3] = false, -- 治疗
    [4] = false, -- 控制
    [5] = false, -- 辅助
    }

    -- 所有侍从的小红点
    local guard_reds = {}

    -- 遍历所有侍从
    for k,v in ipairs(guard_all_data) do

        -- 侍从id
        local guard_id = v.Id
        -- 侍从种类
        local kind = GuardRedPoint._GUARD_KIND[guard_id]
        -- 此侍从种类是否显示小红点
        local is_show_red_point = kind_red_point[kind]

        local guard = guard_container:GetGuardById(guard_id)
        local is_activation, can_activation, can_up_skill, can_up_star, can_up_love_skill, can_up_attr_level
        = GuardRedPoint._get_result(player,guard,guard_id,guard_container)
        -- 如果此种类当前还不显示小红点，查看轮询到当前侍从是否显示小红点，将其值赋值给此种类
        if not is_show_red_point then
            if is_activation then
                kind_red_point[kind] = can_up_skill or can_up_star or can_up_love_skill or can_up_attr_level
            else
                kind_red_point[kind] = can_activation
            end
        end

        -- 这个侍从小红点的数据，存储下来
        if is_activation then
            -- 如果已激活，就不需要 是否可以激活数据
            guard_reds[tostring(guard_id)] = {
            is_activation = is_activation,
            can_up_skill = can_up_skill,
            can_up_star = can_up_star,
            can_up_love_skill = can_up_love_skill,
            can_up_attr_level = can_up_attr_level,
            }
        else
            -- 如果未激活，就不需要其他数据
            guard_reds[tostring(guard_id)] = {
            is_activation = is_activation,
            can_activation = can_activation,
            }
        end

    end

    return kind_red_point, guard_reds
end

-- 侍从小红点 种类+所有侍从 给form调用 未使用了
function GuardRedPoint._get_guard_red_point(player)
    local kind_red_point, guard_reds = GuardRedPoint._get_red_point(player)
    local guards_red_point = {
        kind_red_point = kind_red_point,
        guard_reds = guard_reds,
    }
    return guards_red_point
end

-- 当前使用小红点数据
function GuardRedPoint.get_guard_red_point(player)
    local data = {}
    -- 获取侍从容器
    local guard_container = player:GetGuardContainer()

    -- 获取所有侍从
    local guard_all_data = GuardConfig.GetTableData()
    -- 遍历所有侍从
    for k,v in ipairs(guard_all_data) do
        -- 侍从id
        local guard_id = v.Id

        local guard_attr_level = nil
        local love_skill = {}
        -- 如果拥有当前侍从
        if  guard_container:HasGuard(guard_id) then
            local guard = guard_container:GetGuardById(guard_id)

            -- 当前侍从所提供的属性加成等级
            guard_attr_level = guard:GetInt("Attr_Add_Level")

            -- 情缘技能等级
            local SkillContainer = guard:GetSkillContainer()
            for i = 1, 3 do
                local skill = SkillContainer:GetSkill(tonumber(v["Love"..i.."Skill"]))
                if skill == nil then
                    love_skill[i] = 0
                else
                    love_skill[i] = skill:GetPerformance()
                end
            end
            love_skill[4] = guard:GetInt("GuardLastAllLoveSkill_Star")
        end
        if guard_attr_level and next(love_skill) then
            data[tostring(guard_id)] = {
                guard_attr_level = guard_attr_level,
                love_skill = love_skill
            }
        end

    end
    return data
end


-- 等级提升事件
function GuardRedPoint.role_level_up(player)
    if not MainUISwitch then require 'MainUISwitch' end
    if MainUISwitch and MainUISwitch.Config and MainUISwitch.Config["侍从"] and MainUISwitch.Config["侍从"].Subtab_OpenLevel then
        local level = MainUISwitch.Config["侍从"].Subtab_OpenLevel
        -- 当前角色等级
        local role_level = player:GetAttr(ROLE_ATTR_LEVEL)

        for k, v in pairs(level) do
            if role_level == v then
                if FormGuard then
                    FormGuard.get_guard_red_point_data(player)
                    break
                end
            end
        end
    end
end