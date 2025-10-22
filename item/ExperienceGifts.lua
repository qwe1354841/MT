-- 经验丹
ExperienceGifts={}

--直升等级物品 --直升太多会卡
ExperienceGifts.LevelItem = {
    -- ["人物经验丹"] = {
    --     --可用等级 --低于下限不可用，高于上限给经验
    --     ["UseLevel"] = {40, 59},
    --     --升至等级
    --     ["SetLevel"] = 60,
    --     --超过 可用等级上限 时使用给的经验
    --     ["ExceedExp"] = 500000,
    --     --使用后距离踢下线时间 （秒）--填0表示不踢
    --     ["Kick"] = 2,
    -- }
}

-- 创建物品
function ExperienceGifts.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function ExperienceGifts.on_item_destroy(item)
    if item == nil then
        return
    end
end

function ExperienceGifts.ToLevel(player, to_level, Item_Name)
    local exp_limit = player:GetAttr(ROLE_ATTR_EXP_LIMIT)
    local now_exp =  player:GetAttr(ROLE_ATTR_EXP)
    local add_exp = exp_limit - now_exp
    if add_exp < 20 then
        add_exp = 20
    end
    if player:AddExp(add_exp,'system','使用经验丹',""..Item_Name) then
        local now_level = player:GetAttr(ROLE_ATTR_LEVEL)
        if now_level < to_level then
            return ExperienceGifts.ToLevel(player, to_level, Item_Name)    
        else
            return true
        end
    end
    return false
end
function ExperienceGifts.ForceKick(player)
    player:ForceKick("使用直升道具", "使用直升道具强制下线")
end

-- 使用物品前
function ExperienceGifts.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end

    local Item_Name=item:GetKeyName()

    --直升等级物品
    if ExperienceGifts.LevelItem and ExperienceGifts.LevelItem[Item_Name] then
        if count > 1 then
            sLuaApp:NotifyTipsMsg(player, "该物品只可单个使用")
            return false
        end
        local level_item_config = ExperienceGifts.LevelItem[Item_Name]
        local min_use_level = level_item_config["UseLevel"][1]
        local max_use_level = level_item_config["UseLevel"][2]

        local now_level = player:GetAttr(ROLE_ATTR_LEVEL)
        if now_level < min_use_level then
            sLuaApp:NotifyTipsMsg(player, "等级低于"..min_use_level.."无法享用！")
            return false
        elseif now_level >= min_use_level and now_level <= max_use_level then
            if ExperienceGifts.ToLevel(player, level_item_config["SetLevel"], Item_Name) then
                local kick_time = level_item_config["Kick"]
                if kick_time and kick_time > 0 then
                    sLuaTimerSystem:AddTimerEx(player, kick_time * 1000, 1, "ExperienceGifts.ForceKick", "")
                end
                return true
            end
        else
            player:AddExp(level_item_config["ExceedExp"],'system','使用经验丹',""..Item_Name)
            return true
        end
        sLuaApp:NotifyTipsMsg(player, "使用失败")
        return false
    end

    if CurrencyGiftsConfig.Main[Item_Name] then
        
        local tb_now
        tb_now = CurrencyGiftsConfig.Main[Item_Name]['AddExperienceList']
        if tb_now then
            for i = 1, #tb_now, 2 do
                if tb_now[i] == 1 then
                    --for a = 1, count do
                        -- 加固定经验
                        player:AddExp(tb_now[i+1]*count,'system','使用经验丹','')
                    --end

                else
                    if count > 1 then
                        sLuaApp:NotifyTipsMsg(player,"此物品不能批量使用")
                        return false
                    end
                    -- 加等级
                    -- TODO 满足条件才能使用
                    local RoleAttrReincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
                    local RoleAttrLevel = player:GetAttr(ROLE_ATTR_LEVEL)

                    if not(RoleAttrLevel <= tb_now[i+1]) then
                        sLuaApp:NotifyTipsMsg(player,"" .. tb_now[i+1] .. "及以下才能使用")
                        return false
                    end

                    -- sLuaApp:LuaDbg("转生===="..RoleAttrReincarnation)
                    -- sLuaApp:LuaDbg("级别===="..RoleAttrLevel)

                    local reincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
                    local race = player:GetAttr(ROLE_ATTR_RACE)
                    
                    if not reincarnation then
                        return false
                    end
                    if not	race then
                        return false
                    end
                    if not Reincarnation then
                        return false
                    end
                    if not Reincarnation.Config then
                        return false
                    end
                    local reincarnation_level = sVarSystem:GetInt("ReincarnationLevel_"..reincarnation.."_"..race)

                    if RoleAttrLevel >= reincarnation_level then
                        sLuaApp:NotifyTipsMsg(player,"使用失败，请先转生后再使用")
                        return false
                    end

                    -- 满足条件了 可以使用
                    local RoleAttrExpLimit = player:GetAttr(ROLE_ATTR_EXP_LIMIT)
                    local RoleAttrExp =  player:GetAttr(ROLE_ATTR_EXP)
                    local NextLevelNeedExp = RoleAttrExpLimit - RoleAttrExp
                    player:AddExp(NextLevelNeedExp,'system','使用经验丹','')
                    local NowRoleAttrLevel = player:GetAttr(ROLE_ATTR_LEVEL)
                    if NowRoleAttrLevel > RoleAttrLevel then
                        sLuaApp:NotifyTipsMsg(player,"升级成功")
                    else
                        sLuaApp:NotifyTipsMsg(player,"升级失败，请联系管理员")
                    end
                    return true
                    
                end
            end
        end

        -- TODO 非法输入验证
        return true

	else
		sLuaApp:LuaErr("礼包配置错误")
		return false
	end
	return false
end

-- 使用物品
function ExperienceGifts.on_use_item(player, item, count)
    if item == nil then
        return
    end
end