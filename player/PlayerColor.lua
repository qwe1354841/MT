--人物染色
PlayerColor = {}

--染色道具配置
PlayerColor.Item = {
    ["红色坐骑染料"] = {
        Color = {r = 5 , g = -2 , b = -2}, --RGB颜色增值（负数为减小）
        --ColorAdd = {r = 0 , g = 0 , b = 0}, --附加RGB颜色增值（负数为减小）
    },
    ["绿色坐骑染料"] = {
        Color = {r = -2 , g = 5 , b = -2},
    },
    ["蓝色坐骑染料"] = {
        Color = {r = -2 , g = -2 , b = 5},
    },
    ["黑色坐骑染料"] = {
        Color = {r = -5 , g = -5 , b = -5},
    },
    ["白色坐骑染料"] = {
        Color = {r = 5 , g = 5 , b = 5},
    },
    ["坐骑复原染料"] = {},
}

--染色类型 1：叠加 2：替换 (叠加染色在渐变色模型上可能会产生不自然的色彩过度，替换染色可能会覆盖掉部分模型细节纹理)
PlayerColor.ColorType = {
    [31] = 1,
    [32] = 1,
    [33] = 1,
    [34] = 1,
    [35] = 1,
    [36] = 1,
    [37] = 1,
    [38] = 1,
    [39] = 2,
    [40] = 1,
    [41] = 1,
    [42] = 1,
}

PlayerColor.BasalColor = {
    [31] = {
        Part1 = {
            Color = {r = 217 , g = 234 , b = 246},
        },
        Part2 = {
            Color = {r = 31 , g = 138 , b = 204},
        },
        Part3 = {
            Color = {r = 159 , g = 152 , b = 177},
        },
    },
    [32] = {
        Part1 = {
            Color = {r = 16 , g = 137 , b = 177},
        },
        Part2 = {
            Color = {r = 84 , g = 201 , b = 123},
        },
        Part3 = {
            Color = {r = 170 , g = 155 , b = 155},
        },
    },
    [33] = {
        Part1 = {
            Color = {r = 84 , g = 105 , b = 217},
        },
        Part2 = {
            Color = {r = 84 , g = 156 , b = 158},
        },
        Part3 = {
            Color = {r = 186 , g = 203 , b = 211},
        },
    },
    [34] = {
        Part1 = {
            Color = {r = 206 , g = 190 , b = 218},
        },
        Part2 = {
            Color = {r = 60 , g = 66 , b = 198},
        },
        Part3 = {
            Color = {r = 41 , g = 41 , b = 70},
        },
    },
    [35] = {
        Part1 = {
            Color = {r = 193 , g = 44 , b = 52},
        },
        Part2 = {
            Color = {r = 178 , g = 119 , b = 52},
        },
        Part3 = {
            Color = {r = 164 , g = 35 , b = 55},
        },
    },
    [36] = {
        Part1 = {
            Color = {r = 22 , g = 164 , b = 245},
        },
        Part2 = {
            Color = {r = 151 , g = 99 , b = 194},
        },
        Part3 = {
            Color = {r = 146 , g = 155 , b = 179},
        },
    },
    [37] = {
        Part1 = {
            Color = {r = 96 , g = 41 , b = 53},
        },
        Part2 = {
            Color = {r = 183 , g = 175 , b = 175},
        },
        Part3 = {
            Color = {r = 235 , g = 50 , b = 50},
        },
    },
    [38] = {
        Part1 = {
            Color = {r = 62 , g = 14 , b = 38},
        },
        Part2 = {
            Color = {r = 155 , g = 36 , b = 48},
        },
        Part3 = {
            Color = {r = 128 , g = 128 , b = 140},
        },
    },
    [39] = {
        Part1 = {
            Color = {r = 217 , g = 83 , b = 71},
        },
        Part2 = {
            Color = {r = 156 , g = 88 , b = 65},
        },
        Part3 = {
            Color = {r = 200 , g = 72 , b = 10},
        },
    },
    [40] = {
        Part1 = {
            Color = {r = 98 , g = 13 , b = 136},
        },
        Part2 = {
            Color = {r = 204 , g = 134 , b = 156},
        },
        Part3 = {
            Color = {r = 143 , g = 3 , b = 44},
        },
    },
    [41] = {
        Part1 = {
            Color = {r = 150 , g = 89 , b = 238},
        },
        Part2 = {
            Color = {r = 102 , g = 132 , b = 232},
        },
        Part3 = {
            Color = {r = 80 , g = 202 , b = 204},
        },
    },
    [42] = {
        Part1 = {
            Color = {r = 250 , g = 120 , b = 177},
        },
        Part2 = {
            Color = {r = 92 , g = 90 , b = 122},
        },
        Part3 = {
            Color = {r = 223 , g = 174 , b = 83},
        },
    },
}

--染色模板配置
PlayerColor.Plan = {
    [31] = {
        {
            Name = "紫衣",
            Part1 = {"红色坐骑染料",10},
            Part2 = {"红色坐骑染料",30,"蓝色坐骑染料",10},
            Part3 = {"黑色坐骑染料",20},
        },
        {
            Name = "布衣",
            Part1 = {},
            Part2 = {"红色坐骑染料",20,"绿色坐骑染料",5},
            Part3 = {"黑色坐骑染料",10},
        },
    },
    [32] = {
        {
            Name = "雪灵",
            Part1 = {"白色坐骑染料",40},
            Part2 = {"白色坐骑染料",30},
            Part3 = {},
        },
        {
            Name = "冰灵",
            Part1 = {"蓝色坐骑染料",10,"白色坐骑染料",10},
            Part2 = {"蓝色坐骑染料",30,"黑色坐骑染料",15},
            Part3 = {},
        },
    },
    [33] = {
        {
            Name = "白宣",
            Part1 = {"白色坐骑染料",27},
            Part2 = {"红色坐骑染料",10,"白色坐骑染料",17},
            Part3 = {},
        },
        {
            Name = "墨染",
            Part1 = {"黑色坐骑染料",40},
            Part2 = {"黑色坐骑染料",30},
            Part3 = {"黑色坐骑染料",30},
        },
    },
    [34] = {
        {
            Name = "幽冥",
            Part1 = {"黑色坐骑染料",35},
            Part2 = {"黑色坐骑染料",30},
            Part3 = {},
        },
        {
            Name = "雪獒",
            Part1 = {},
            Part2 = {"红色坐骑染料",5,"白色坐骑染料",30},
            Part3 = {},
        },
    },
    [35] = {
        {
            Name = "狂化",
            Part1 = {"红色坐骑染料",10},
            Part2 = {"黑色坐骑染料",25},
            Part3 = {"红色坐骑染料",20},
        },
        {
            Name = "冷却",
            Part1 = {"黑色坐骑染料",40},
            Part2 = {"黑色坐骑染料",25},
            Part3 = {"黑色坐骑染料",30},
        },
    },
    [36] = {
        {
            Name = "白龙",
            Part1 = {"白色坐骑染料",20,"红色坐骑染料",20},
            Part2 = {"白色坐骑染料",30},
            Part3 = {"白色坐骑染料",10},
        },
        {
            Name = "深海",
            Part1 = {"黑色坐骑染料",35},
            Part2 = {"黑色坐骑染料",25},
            Part3 = {"黑色坐骑染料",30,"蓝色坐骑染料",15},
        },
    },
    [37] = {
        {
            Name = "幽冥",
            Part1 = {"黑色坐骑染料",25},
            Part2 = {"黑色坐骑染料",30},
            Part3 = {"黑色坐骑染料",40},
        },
        {
            Name = "雪獒",
            Part1 = {"白色坐骑染料",50},
            Part2 = {"白色坐骑染料",10},
            Part3 = {"白色坐骑染料",45},
        },
    },
    [38] = {
        {
            Name = "粉装",
            Part1 = {"白色坐骑染料",30},
            Part2 = {"白色坐骑染料",20},
            Part3 = {"红色坐骑染料",5},
        },
        {
            Name = "暗夜",
            Part1 = {"黑色坐骑染料",15},
            Part2 = {"黑色坐骑染料",30},
            Part3 = {"黑色坐骑染料",15},
        },
    },
    [39] = {
        {
            Name = "紫粉",
            Part1 = {"蓝色坐骑染料",25},
            Part2 = {"红色坐骑染料",20,"蓝色坐骑染料",15},
            Part3 = {"蓝色坐骑染料",15},
        },
        {
            Name = "粉白",
            Part1 = {"黑色坐骑染料",35},
            Part2 = {"白色坐骑染料",5},
            Part3 = {"蓝色坐骑染料",12,"白色坐骑染料",30},
        },
    },
    [40] = {
        {
            Name = "暗夜",
            Part1 = {"黑色坐骑染料",30},
            Part2 = {"黑色坐骑染料",40},
            Part3 = {"黑色坐骑染料",30},
        },
        {
            Name = "晨烟",
            Part1 = {"绿色坐骑染料",14,"白色坐骑染料",17},
            Part2 = {"绿色坐骑染料",5,"白色坐骑染料",9},
            Part3 = {"绿色坐骑染料",17,"蓝色坐骑染料",12,"白色坐骑染料",25},
        },
    },
    [41] = {
        {
            Name = "深海",
            Part1 = {"蓝色坐骑染料",20},
            Part2 = {"蓝色坐骑染料",25,"黑色坐骑染料",5},
            Part3 = {"蓝色坐骑染料",20,"黑色坐骑染料",15},
        },
        {
            Name = "珊瑚",
            Part1 = {"白色坐骑染料",10,"红色坐骑染料",10},
            Part2 = {"红色坐骑染料",10},
            Part3 = {"红色坐骑染料",25},
        },
    },
    [42] = {
        {
            Name = "暗凰",
            Part1 = {"黑色坐骑染料",40},
            Part2 = {"黑色坐骑染料",10},
            Part3 = {"黑色坐骑染料",40},
        },
        {
            Name = "赤凰",
            Part1 = {"红色坐骑染料",25},
            Part2 = {"红色坐骑染料",20},
            Part3 = {"红色坐骑染料",50},
        },
    },
}

--部位配置
PlayerColor.PartConfig = {"头发","衣物一","衣物二"}

--模板预览
function PlayerColor.Pre_Plan(player,plan_index)
    plan_index = tonumber(plan_index)
    for part, _ in ipairs(PlayerColor.PartConfig) do
        local color_list = PlayerColor.GetPlanColor(player,plan_index,part)
        local json_list = PlayerColor.GetJsonListPre(player,color_list,part)
        local str = [[
            RoleDyeingUI_UserDefined.ColorPreList]]..part..[[ = ]]..Lua_tools.serialize(json_list)..[[
            RoleDyeingUI_UserDefined.RefreshIsPre()
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
end

--模板染色
function PlayerColor.Dyeing_Plan(player,index)
    local role_id = player:GetAttr(ROLE_ATTR_ROLE)
    local PlanConfig = PlayerColor.Plan[role_id][index]
    local all_item_key = {}
    local all_item_list = {}
    local part_num = Lua_tools.tablecount(PlayerColor.PartConfig)

    for i = 1, part_num do
        local plan_config = PlanConfig["Part"..i]
        for k, v in ipairs(plan_config) do
            if type(v) == "string" then
                all_item_key[v] = plan_config[k+1] + (all_item_key[v] or 0 )
            end
        end
    end

    for k, v in pairs(all_item_key) do
        table.insert(all_item_list,k)
        table.insert(all_item_list,v)
    end

    local a = Lua_tools.IsItemEnough(player, all_item_list)
    if not a then
        --快速购买
		if OneKeyBuy then
			local defect_consume_tb = Lua_tools.GetDefectList(player, all_item_list)
			if OneKeyBuy.Main(player, defect_consume_tb) then
				return
			end
		end
        sLuaApp:NotifyTipsMsg(player,"染色物品数量不足！")
        return
    end

    for part, _ in ipairs(PlayerColor.PartConfig) do
        local item_list = PlayerColor.Plan[role_id][index]["Part"..part]
        if item_list then
            for i, v in ipairs(item_list) do
                local item = ""
                local num = 1
                if type(v) == "string" then
                    item = v
                    if item ~= "" then
                        if not PlayerColor.Item[item] then
                            local itemData = ItemConfig.GetByKeyName(item)
                            sLuaApp:NotifyTipsMsg(player,itemData.Name.."无法用于染色！")
                            return
                        end
                        if item_list[i+1] then
                            if type(item_list[i+1]) == "number" then
                                num = item_list[i+1]
                            end
                        end
                        local log = sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, 3, "system", "角色模板染色", "角色模板染色消耗")
                        if log ~= 0 then
                            sLuaApp:LuaErr("PlayerColor.Dyeing_Plan ConsumeItemWithId Err , Log："..log)
                            return false
                        end 
                    end
                end
            end
        end
        local color_list = PlayerColor.GetPlanColor(player,index,part)
        player:SetString("ColorJson_"..part,Lua_tools.serialize(color_list))
    end

    local json_list = PlayerColor.GetJsonList(player)
    player:SetString("Model_DynJson1",  json.encode(json_list))

    sLogServerSystem:LogToServer(0,player,"角色模板染色",0,0,player:GetName(),Lua_tools.serialize(json_list))
    sLuaApp:NotifyTipsMsg(player,"染色成功！")
    local str = [[
        RoleDyeingUI_UserDefined.ColorList = ]]..Lua_tools.serialize(json_list)..[[
        RoleDyeingUI_UserDefined.Refresh()
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function PlayerColor.GetPlanColor(player,plan_index,part)
    local item_list = PlayerColor.Plan[player:GetAttr(ROLE_ATTR_ROLE)][plan_index]["Part"..part]
    local BasalColor = PlayerColor.GetBasalColor(player)
    local color_list = BasalColor["Part"..part]
    if item_list then
        for i, v in ipairs(item_list) do
            local item = ""
            local num = 1
            if type(v) == "string" then
                item = v
                if item ~= "" then
                    if not PlayerColor.Item[item] then
                        local itemData = ItemConfig.GetByKeyName(item)
                        sLuaApp:NotifyTipsMsg(player,itemData.Name.."无法用于染色！")
                        return
                    end
                    if item_list[i+1] then
                        if type(item_list[i+1]) == "number" then
                            num = item_list[i+1]
                        end
                    end
                    for k, list in pairs(PlayerColor.Item[item]) do
                        if not color_list[k] then
                            color_list[k] = {}
                        end
                        for key, value in pairs(list) do
                            color_list[k][key] = value*num + (color_list[k][key] or 0)
                        end
                    end
                end
            end
        end
    end
    for k, v in pairs(color_list) do
        for n, m in pairs(v) do
            if m < 0 then
                color_list[k][n] = 0
            elseif m > 255 then
                color_list[k][n] = 255
            end 
        end
    end
    return color_list
end

function PlayerColor.GetData(player)
    local JsonList = PlayerColor.GetJsonList(player)
    local str = [[
        RoleDyeingUI_UserDefined.ColorList = ]]..Lua_tools.serialize(JsonList)..[[
        RoleDyeingUI_UserDefined.Refresh()
    ]]
    --sLuaApp:LuaErr(str)
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--自定义染色
function PlayerColor.Dyeing_Item(player,part,item_str,is_pre)
    --sLuaApp:LuaErr("part ------------"..part)
    --sLuaApp:LuaErr("item_str ------------"..item_str)
    --sLuaApp:LuaErr("is_pre ------------"..is_pre)
    local color_list = {}
    local BasalColor = PlayerColor.GetBasalColor(player)
    --sLuaApp:LuaErr(Lua_tools.serialize(BasalColor))
    if player:GetString("ColorJson_"..part) ~= "" then
        color_list = assert(load("return " .. player:GetString("ColorJson_"..part)))()
    else
        if BasalColor then
            color_list = Lua_tools.CopyTable(BasalColor["Part"..part])
        else
            color_list = {}
        end
    end

    --local item_con = player:GetItemContainer(ITEM_CONTAINER_BAG)
    if item_str == "" then
        local json_list = {}
        if player:GetString("ColorJson_"..part) ~= "" then
            json_list = PlayerColor.GetJsonListPre(player,color_list,part)
        else
            json_list["IsAddColorFirst"..part] = false
            json_list["IsFillPart"..part] = false
        end
        local str = [[
            RoleDyeingUI_UserDefined.ColorPreList]]..part..[[ = ]]..Lua_tools.serialize(json_list)..[[
            RoleDyeingUI_UserDefined.RefreshIsPre()
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
        return
    else
        local item_list = sLuaApp:StrSplit(item_str , "_")
        for i, v in ipairs(item_list) do
            if tonumber(v) then
                item_list[i] = tonumber(v)
            end
        end
        if item_list then
            --if not MountsColor.IsItemEnough(player, item_list) then
            --    sLuaApp:NotifyTipsMsg(player,"物品数量不足，无法染色！")
            --    return
            --end
            local have_reset = false
            for i, v in ipairs(item_list) do
                if type(v) == "string" then
                    if v == "坐骑复原染料" then
                        have_reset = true
                    end
                end
            end
            if have_reset then
                if Lua_tools.tablecount(item_list) > 2 then
                    sLuaApp:NotifyTipsMsg(player,"漂洗液只能单独使用！")
                    return
                elseif Lua_tools.tablecount(item_list) == 2 then
                    if item_list[2] >= 2 then
                        sLuaApp:NotifyTipsMsg(player,"漂洗液只能单独使用！")
                        return 
                    end
                end
            end

            for i, v in ipairs(item_list) do
	    		local item = ""
	    		local num = 1
                local bind = 3
	    		if type(v) == "string" then
	    			item = v
	    			if item ~= "" then
                        if not PlayerColor.Item[item] then
                            local itemData = ItemConfig.GetByKeyName(item)
                            sLuaApp:NotifyTipsMsg(player,itemData.Name.."无法给坐骑染色！")
                            return
                        end
	    				if item_list[i+1] then
	    					if type(item_list[i+1]) == "number" then
	    						num = item_list[i+1]
	    					end
	    				end
                        if item_list[i+2] then
	    					if type(item_list[i+2]) == "number" then
	    						bind = item_list[i+2] + 1
	    					end
	    				end
                        --if item_con:GetItemAmountById(sItemSystem:GetItemIdByKeyname(item),bind) < num then
                        --    local itemData = ItemConfig.GetByKeyName(item)
                        --    sLuaApp:NotifyTipsMsg(player,itemData.Name.."数量不足！")
                        --    return
                        --end
                        if item == "坐骑复原染料" then
                            PlayerColor.ColorReset(player,part,is_pre,item,bind)
                            return
                        end
                        if is_pre == 1 then
                            for k, list in pairs(PlayerColor.Item[item]) do
                                if not color_list[k] then
                                    color_list[k] = {}
                                end
                                for key, value in pairs(list) do
                                    color_list[k][key] = value*num + (color_list[k][key] or 0)
                                end
                            end
                        else
                            if not PlayerColor.IsItemEnough(player, item_list) then
                                sLuaApp:NotifyTipsMsg(player,"染色物品数量不足！")
                                return
                            end
	    				    local log = sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, bind, "system", "坐骑染色", "坐骑染色消耗")
                            if log ~= 0 then
                                sLuaApp:LuaErr("PlayerColor.Dyeing_Item ConsumeItemWithId Err , Log："..log)
                                return false
	    				    else
                                for k, list in pairs(PlayerColor.Item[item]) do
                                    if not color_list[k] then
                                        color_list[k] = {}
                                    end
                                    for key, value in pairs(list) do
                                        color_list[k][key] = value*num + (color_list[k][key] or 0)
                                    end
                                end
                            end
                        end
	    			end
	    		end
            end
        end
    end
    for k, v in pairs(color_list) do
        for n, m in pairs(v) do
            if m < 0 then
                color_list[k][n] = 0
            elseif m > 255 then
                color_list[k][n] = 255
            end 
        end
    end
    local json_list = {}
    if is_pre == 1 then
        json_list = PlayerColor.GetJsonListPre(player,color_list,part)
        local str = [[
            RoleDyeingUI_UserDefined.ColorPreList]]..part..[[ = ]]..Lua_tools.serialize(json_list)..[[
            RoleDyeingUI_UserDefined.RefreshIsPre()
        ]]
        --sLuaApp:LuaErr(Lua_tools.serialize(json_list))
        sLuaApp:ShowForm(player, "脚本表单", str)
        return
    end
    player:SetString("ColorJson_"..part,Lua_tools.serialize(color_list))
    sLogServerSystem:LogToServer(0,player,"角色自定义染色",0,0,player:GetName(),Lua_tools.serialize(json_list))
    --sLuaApp:LuaErr(Lua_tools.serialize(json_list))
    json_list = PlayerColor.GetJsonList(player)
    player:SetString("Model_DynJson1",  json.encode(json_list))
    sLuaApp:NotifyTipsMsg(player,"染色成功！")
    local str = [[
        RoleDyeingUI_UserDefined.ColorList = ]]..Lua_tools.serialize(json_list)..[[
        RoleDyeingUI_UserDefined.Refresh()
    ]]
    --sLuaApp:LuaErr("2------------"..str)
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--染色复原
function PlayerColor.ColorReset(player,part,is_pre,item,bind)
    if is_pre == 1 then
        local json_list = {}
        json_list["IsAddColorFirst"..part] = false
        json_list["IsFillPart"..part] = false
        local str = [[
            RoleDyeingUI_UserDefined.ColorPreList]]..part..[[ = ]]..Lua_tools.serialize(json_list)..[[
            RoleDyeingUI_UserDefined.RefreshIsPre()
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    else
        local log = sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), 1, bind, "system", "人物染色", "人物染色消耗")
        if log ~= 0 then
            sLuaApp:LuaErr("PlayerColor.ColorReset ConsumeItemWithId Err , Log："..log)
            return false
        else
            --local json_list = PlayerColor.GetJsonList(player)
            --json_list["IsAddColorFirst"..part] = false
            --json_list["IsFillPart"..part] = false
            player:SetString("ColorJson_"..part,"")
            player:SetString("Model_DynJson1",  "")
            sLuaApp:NotifyTipsMsg(player,"坐骑染色成功！")
            local str = [[
                RoleDyeingUI_UserDefined.ColorList = {}
                RoleDyeingUI_UserDefined.Refresh()
            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
    end
end

--获取角色当前基础染色
function PlayerColor.GetBasalColor(player)
    local ColorRGBList = Lua_tools.DupTable(PlayerColor.BasalColor[player:GetAttr(ROLE_ATTR_ROLE)])
    local role_data = RoleConfig.GetById(player:GetAttr(ROLE_ATTR_ROLE))
    if role_data.ColorId1 ~= player:GetColorPlan1() then
        local ColorData = ColorConfig.GetById(player:GetColorPlan1())
        if ColorValueList[ColorData.AppearId] and ColorValueList[ColorData.AppearId]["IsFillPart1"] == "True" then
            local H = tonumber(ColorValueList[ColorData.AppearId]["HOffset1"])
            local S = tonumber(ColorValueList[ColorData.AppearId]["SOffset1"])
            local V = tonumber(ColorValueList[ColorData.AppearId]["VOffset1"])
            H,S,V = PlayerColor.HSVConvert_1(H,S,V)
            ColorRGBList["Part1"]["Color"]["r"],ColorRGBList["Part1"]["Color"]["g"],ColorRGBList["Part1"]["Color"]["b"] =  Lua_tools.HSV2RGB(H,S,V)
        end
    end
    if role_data.ColorId2 ~= player:GetColorPlan2() then
        local ColorData = ColorConfig.GetById(player:GetColorPlan2())
        if ColorValueList[ColorData.AppearId] and ColorValueList[ColorData.AppearId]["IsFillPart2"] == "True" then
            local H = tonumber(ColorValueList[ColorData.AppearId]["HOffset2"])
            local S = tonumber(ColorValueList[ColorData.AppearId]["SOffset2"])
            local V = tonumber(ColorValueList[ColorData.AppearId]["VOffset2"])
            H,S,V = PlayerColor.HSVConvert_1(H,S,V)
            ColorRGBList["Part2"]["Color"]["r"],ColorRGBList["Part2"]["Color"]["g"],ColorRGBList["Part2"]["Color"]["b"] =  Lua_tools.HSV2RGB(H,S,V)
        end
    end
    return ColorRGBList
end

function PlayerColor.IsBasalColor(player,part)
    local role_data = RoleConfig.GetById(player:GetAttr(ROLE_ATTR_ROLE))
    if part == 1 then
        local ColorData_1 = ColorConfig.GetById(role_data.ColorId1)
        local ColorData_2 = ColorConfig.GetById(player:GetColorPlan1())
        if ColorData_1.AppearId ~= ColorData_2.AppearId then
            return false
        end
    elseif part == 2 then
        local ColorData_1 = ColorConfig.GetById(role_data.ColorId2)
        local ColorData_2 = ColorConfig.GetById(player:GetColorPlan2())
        if ColorData_1.AppearId ~= ColorData_2.AppearId then
            return false
        end
    end
    return true
end

function PlayerColor.GetJsonList(player)
    local new_list = {}
    local BasalColor = PlayerColor.GetBasalColor(player)
    for i, value in ipairs(PlayerColor.PartConfig) do
        if player:GetString("ColorJson_"..i) ~= "" then
            local a = BasalColor["Part"..i]
            local list = assert(load("return " .. player:GetString("ColorJson_"..i)))()
            if PlayerColor.ColorType[player:GetAttr(ROLE_ATTR_ROLE)] == 1 and PlayerColor.IsBasalColor(player,i) then
                local JsonList = PlayerColor.GetColorJsonList_1(list,a,new_list,i)
                for k, v in pairs(JsonList) do
                    new_list[k] = v
                end
            else
                local JsonList = PlayerColor.GetColorJsonList_2(list,new_list,i)
                for k, v in pairs(JsonList) do
                    new_list[k] = v
                end
            end
        else
            local colorid = 0
            if i == 1 then
                colorid = player:GetColorPlan1()
            elseif i == 2 then
                colorid = player:GetColorPlan2()
            end
            if colorid ~= 0 then
                local color_list = {}
                local ColorData = ColorConfig.GetById(colorid)
                if ColorValueList[ColorData.AppearId] and ColorValueList[ColorData.AppearId]["IsFillPart"..i] == "True" then
                    local H = tonumber(ColorValueList[ColorData.AppearId]["HOffset"..i])
                    local S = tonumber(ColorValueList[ColorData.AppearId]["SOffset"..i])
                    local V = tonumber(ColorValueList[ColorData.AppearId]["VOffset"..i])
                    new_list["IsFillPart"..i] = true
                    new_list["HOffset"..i] = H
                    new_list["SOffset"..i] = S
                    new_list["VOffset"..i] = V

                    H,S,V = PlayerColor.HSVConvert_1(H,S,V)
                    color_list["Color"] = {}
                    color_list["Color"]["r"],color_list["Color"]["g"],color_list["Color"]["b"] =  Lua_tools.HSV2RGB(H,S,V)
                    player:SetString("ColorJson_"..i,Lua_tools.serialize(color_list))
                else
                    new_list["IsAddColorFirst"..i] = false
                    new_list["IsFillPart"..i] = false
                end
            else
                new_list["IsAddColorFirst"..i] = false
                new_list["IsFillPart"..i] = false
            end
        end
    end
    return new_list
end

--染色预览
function PlayerColor.GetJsonListPre(player,list,part)
    local BasalColor = PlayerColor.GetBasalColor(player)
    local a = BasalColor["Part"..part]
    local new_list = {}
    if PlayerColor.ColorType[player:GetAttr(ROLE_ATTR_ROLE)] == 1 and PlayerColor.IsBasalColor(player,part) then
        new_list = PlayerColor.GetColorJsonList_1(list,a,new_list,part)
    else
        new_list = PlayerColor.GetColorJsonList_2(list,new_list,part)
    end
    return new_list
end

function PlayerColor.GetColorJsonList_1(list,a,new_list,part)
    for k, rgb in pairs(list) do
        if k == "Color" then
            local h1,s1,v1 = Lua_tools.RGB2HSV(a["Color"]["r"],a["Color"]["g"],a["Color"]["b"])
            local h,s,v = Lua_tools.RGB2HSV(rgb.r,rgb.g,rgb.b)
            new_list["IsFillPart"..part] = true
            new_list["HOffset"..part] = h-h1
            new_list["SOffset"..part] = s-s1
            new_list["VOffset"..part] = v-v1
            new_list["OriginalH"..part] = true
        elseif k == "ColorAdd" then
            if not new_list["IsFillPart"..part] then
                new_list["IsFillPart"..part] = true
            end
            local r,g,b = Lua_tools.FormatPercent(rgb.r/255, 4) , Lua_tools.FormatPercent(rgb.g/255, 4) , Lua_tools.FormatPercent(rgb.b/255, 4)
            new_list["IsAddColorFirst"..part] = true
            new_list["ColorAddFirst"..part] = {}
            new_list["ColorAddFirst"..part]["r"] = r
            new_list["ColorAddFirst"..part]["g"] = g
            new_list["ColorAddFirst"..part]["b"] = b
        end
    end
    return new_list
end

function PlayerColor.GetColorJsonList_2(list,new_list,part)
    for k, rgb in pairs(list) do
        if k == "Color" then
            --if rgb.r ~= 0 or rgb.g ~= 0 or rgb.b ~= 0 then
                local h,s,v = Lua_tools.RGB2HSV(rgb.r,rgb.g,rgb.b)
                new_list["IsFillPart"..part] = true
                new_list["HOffset"..part] = h
                new_list["SOffset"..part] = (s*1.5)-1
                -- new_list["VOffset"..i] = v-0.9
                new_list["VOffset"..part] = (v * 1.5) - 1
            --else
            --    iszero = true
            --end
        elseif k == "ColorAdd" then
            --if rgb.r ~= 0 or rgb.g ~= 0 or rgb.b ~= 0 then
                if not new_list["IsFillPart"..part] then
                    new_list["IsFillPart"..part] = true
                end
                local r,g,b = Lua_tools.FormatPercent(rgb.r/255, 4) , Lua_tools.FormatPercent(rgb.g/255, 4) , Lua_tools.FormatPercent(rgb.b/255, 4)
                new_list["IsAddColorFirst"..part] = true
                new_list["ColorAddFirst"..part] = {}
                new_list["ColorAddFirst"..part]["r"] = r
                new_list["ColorAddFirst"..part]["g"] = g
                new_list["ColorAddFirst"..part]["b"] = b
            --else
            --    new_list["IsAddColorFirst"..i] = false
            --end
        end
    end
    return new_list
end

---1-1 变为 0-1
function PlayerColor.HSVConvert_1(H,S,V)
    if H < 0 then
        H = 0
    end
    --H = (H+1)/2
    S = (S+1)/1.5
    V = (V+1)/1.5
    return H,S,V
end

--0-1 变为 -1-1
function PlayerColor.HSVConvert_2(H,S,V)
    H = (H*2)-1
    S = (S*2)-1
    V = (V*2)-1
    return H,S,V
end

--登录回调
function PlayerColor.Login(player)
    local coloritem = {}
    for k, v in pairs(PlayerColor.Item) do
        table.insert(coloritem,k)
    end
    local plan_config = PlayerColor.Plan[player:GetAttr(ROLE_ATTR_ROLE)]
    local str = [[
        if GlobalProcessing then
            GlobalProcessing.PlayerColorItem = ]]..Lua_tools.serialize(coloritem)..[[
            GlobalProcessing.PlayerColorPlan = ]]..Lua_tools.serialize(plan_config)..[[
            GlobalProcessing.PlayerColorPart = ]]..Lua_tools.serialize(PlayerColor.PartConfig)..[[
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function PlayerColor.IsItemEnough(player, itemList)
	if itemList then
		for i,v in ipairs(itemList) do
			local item = ""
			local num = 1
            local bind = 3
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[i+1] then
						if type(itemList[i+1]) == "number" then
							num = itemList[i+1]
						end
					end
                    if itemList[i+2] then
                        if type(itemList[i+2]) == "number" then
                            bind = itemList[i+2] + 1
                        end
                    end
					if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), bind) < num then
						--sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
						return false
					end
				end
			end
		end
	end
	return true
end