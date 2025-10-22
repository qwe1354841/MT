-- 活力表单
FormVitality = {}

--Name 名称
--Fuc_Id 任务开启等级 id
--UI_Index 索引
--Info 详情
--Button_Name 按钮名称
--Switch 功能开关
--Icon	 活动图标
--Price	 消耗活力数
--BindGold  换取银币
--Wnd  Param   跳转界面

FormVitality.Vitality_tb = {
    {Name = "打工赚钱", UI_Index = 1, Info = "消耗活力：", Button_Name = "打工", Switch = "on", Icon = "1900090030", Price = 50, BindGold = 20000},
    {Name = "装备打造", UI_Index = 2, Fuc_Id = 30, Info = "消耗活力可在界面查看", Button_Name = "制造", Switch = "on", Icon = "1900015890", Wnd = "EquipUI", Param = "1-2"},
    {Name = "宝石合成", UI_Index = 3, Fuc_Id = 49, Info = "消耗活力可在界面查看", Button_Name = "制造", Switch = "off", Icon = "1900001490", Wnd = "EquipUI", Param = "2-1"},
    {Name = "烹饪", UI_Index = 4, Fuc_Id = 33, Info = "消耗活力可在界面查看", Button_Name = "制造", Switch = "on", Icon = "1900001190", Wnd = "ProduceUI", Param = "1"},
    {Name = "炼药", UI_Index = 5, Fuc_Id = 33, Info = "消耗活力可在界面查看", Button_Name = "制造", Switch = "on", Icon = "1900000200", Wnd = "ProduceUI", Param = "2"},
}

FormVitality.Vitality_shopid = {"20331","20332","20333"}

-- 获取活力值途径
--FormVitality.GetVitalityData = {
--    {Name = "生龙活虎散",Info = "使用可增加活力值250",Switch = "on",ItemKeyName = "活力药1"},
--    {Name = "龙精虎猛丸",Info = "使用可增加活力值500",Switch = "on",ItemKeyName = "活力药2"},
--    {Name = "龙腾虎跃丹",Info = "使用可增加活力值1000",Switch = "on",ItemKeyName = "活力药3"},
--    {Name = "师门任务",Info = "活跃0/20",Switch = "on",NpcId = 1,Icon = "1801109130",Fuc_Id = 1},
--    {Name = "降妖任务",Info = "活跃0/20",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "宝图任务",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "闹事的妖怪",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "除暴安良",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "挑战神兽",Info = "活跃0/20",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "天梯挑战",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "讨伐任务",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "护卫银子",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "傲来秘宝",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "梦回千年",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "洞窟伏魔",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "人鬼绝恋",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "西游奇缘",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "伏魔任务",Info = "活跃0/20",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "傲来秘宝（困难）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "梦回去千年（困难）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "洞窟伏魔（困难）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "人鬼绝恋（困难）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "仙兽福源",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "天降宝箱（早）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--    {Name = "天降宝箱（晚）",Info = "活跃0/10",Switch = "on",NpcId = 1,Icon = "",Fuc_Id = 1},
--
--}

FormVitality.MedicineData = {
    {Switch = "on",ItemKeyName = "活力药1"},--Name = "生龙活虎散"
    --{Switch = "on",ItemKeyName = "活力药2"},--Name = "龙精虎猛丸"
    --{Switch = "on",ItemKeyName = "活力药3"},--Name = "龙腾虎跃丹"
}

-- 客户端获取使用活力值数据
function FormVitality.GetUseData(player)
    if not player then
        return
    end
    local str = [[
        if VitalityUI then
			VitalityUI.Vitality_tb = ]] .. Lua_tools.serialize(FormVitality.Vitality_tb) .. [[
			VitalityUI.Vitality_shopid = ]] .. Lua_tools.serialize(FormVitality.Vitality_shopid) .. [[
			VitalityUI.RefreshUseItems()
		end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

-- 各种使用活力值处理
function FormVitality.UseReceive(player,index)
    if not player or not index then
        return
    end

    index = tonumber(index)
    if not index then
        -- 转换为数字失败,数据错误
        return
    end

    local Vitality_tb = FormVitality.Vitality_tb

    if Vitality_tb[index] then

        if Vitality_tb[index]["Switch"] == "on" then

            if Vitality_tb[index]["Price"] and Vitality_tb[index]["BindGold"] then
                local roleVP = player:GetVp() -- 玩家拥有的活力值

                if roleVP >= Vitality_tb[index]["Price"] then

                    -- 减少活力值
                    if not player:SubVp(Vitality_tb[index]["Price"],"system","打工换取银币","打工减少活力值换取银币") then
                        sLuaApp:NotifyTipsMsg(player,"系统错误")
                        sLuaApp:LuaDbg("打工消耗活力值失败")
                        return ""
                    end
					
					if SeasonPassQuestFunc then
						local Num = Vitality_tb[index]["Price"] or 0
						SeasonPassQuestFunc.VitalityCost(player, Num)
					end

                    -- 增加银币
                    if not player:AddBindGold(Vitality_tb[index]["BindGold"], "system", "活力值换银币", "打工活力值换取银币") then
                        sLuaApp:NotifyTipsMsg(player,"系统错误")
                        sLuaApp:LuaDbg("打工增加银币失败")
                        return ""
                    else
                        sLuaApp:NotifyTipsMsg(player,"获得银币"..Vitality_tb[index]["BindGold"])
                    end

                else
                    sLuaApp:NotifyTipsMsg(player,"活力不足，无法" .. Vitality_tb[index]["Button_Name"])
                end

            --elseif Vitality_tb[index]["Wnd"] and Vitality_tb[index]["Param"] then
            --    local str = [[
			--		GUI.OpenWnd("]].. Vitality_tb[index]["Wnd"] ..[[","]] .. Vitality_tb[index]["Param"] .. [[")
			--	]]
            --    sLuaApp:ShowForm(player, "脚本表单", str)
            end
        end
    end
    return ""
end

-- 客户端获取药品id
function FormVitality.GetMedicineData(player)
    if not player then return end
    local str = [[
        if VitalityUI then
            VitalityUI.LeftMedicineData = ]] .. Lua_tools.serialize(FormVitality.MedicineData) .. [[
            VitalityUI.RefreshLeftList()
		end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end
