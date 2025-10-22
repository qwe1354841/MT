--武道大会宝箱
WuDaoHuiBox = {}

WuDaoHuiBox.Award = {
    item = {"修炼丹" , 5 , 0 , "装备强化石" , 10 , 0 , "高级宝石福袋" , 1 , 0 , "100奇遇值" , 3 , 0 },
    Exp = "level * 500",
    MoneyType = 5,
    MoneyVal = "level * 50",
    BuildNum = 20
}
WuDaoHuiBox.ProgressBarTime = 3000

WuDaoHuiBox.ProgressBarTip = "打开宝箱中..."

function WuDaoHuiBox.main(npc,player)
    if player == nil or npc == nil then
        return
    end
    if npc:GetKeyName() == "武道会宝箱" then
        if player:GetTeam() then
            sLuaApp:NotifyTipsMsg(player, "组队状态无法开启宝箱")
            return ""
        end

        if Lua_tools.GetBagFree(player) < 4 then
            sLuaApp:NotifyTipsMsg(player, "包裹需要4个空格才能领取奖励，请清理后再来")
            return ""
        end

        if player:GetDayInt("OpenWuDaoHuiBox_Num") == 1 then
            sLuaApp:NotifyTipsMsg(player, "今日宝箱开启已达上限")
            return ""
        end

        if npc:GetDayInt("InThenOpen") == 1 then
            sLuaApp:NotifyTipsMsg(player, "这个宝箱已经被开了")
            return ""
        end

        local Team = player:GetDayInt("WuDaoHui_Team")
        if Team ~= 0 then
            if Data then
                if Data["WuDaoHui"] == nil then
                    return ""
                end
                if Data["WuDaoHui"]["Win_Team"] ~= Team then
                    sLuaApp:NotifyTipsMsg(player, "失败阵营不能拾取武道会宝箱")
                    return ""
                end
            else
                sLuaApp:LuaErr("缺少Data文件")
                return ""
            end
        else
            sLuaApp:NotifyTipsMsg(player, "未分配阵营不能拾取武道会宝箱")
            return ""
        end

        if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
            if sVarSystem:GetInt("WuDaoHui_Stage") == Act_WuDaoHui.Act_Stage.finish then
                npc:SetDayInt("InThenOpen",1)
                local str = [[
                    local func = function()
                        CL.SendNotify(NOTIFY.SubmitForm, "FormWuDaoHui", "StopOpenBox", "")
                    end
                    GUI.OpenWnd("LoadingTipUI", "]]..WuDaoHuiBox.ProgressBarTime.."#"..WuDaoHuiBox.ProgressBarTip..[[")
                    LoadingTipUI.SetInterruptFunc(func)
                ]]
                sLuaApp:ShowForm(player, "脚本表单", str)
                
                local t_guid = sLuaTimerSystem:AddTimerEx(player, WuDaoHuiBox.ProgressBarTime,1,"WuDaoHuiBox.GiveReward", ""..npc:GetGUID())
                if t_guid then
                    npc:SetInt("WuDaoHuiNPCisOpening", 1)
                    player:SetInt("WuDaoHuiNPCOpeningNPC", npc:GetGUID())
                    player:SetInt("WuDaoHuiNPCOpenBoxTimer", t_guid)
                end
            end
            return ""
        end
    end
end

--进度条打断
function WuDaoHuiBox.StopOpenBox(player)
	local timer_guid = player:GetInt("WuDaoHuiNPCOpenBoxTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."WuDaoHuiNPC.StopOpenBox HasTimer错误")
	end
	player:SetInt("WuDaoHuiNPCOpenBoxTimer", 0)
	
	local npc_guid = player:GetInt("WuDaoHuiNPCOpeningNPC")
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		npc:SetInt("WuDaoHuiNPCisOpening", 0)
	end
end

function WuDaoHuiBox.GiveReward(player,timer,npc_guid)
    if player == nil or tonumber(npc_guid) == nil then
        return
    end
    local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
    if WuDaoHuiBox.Award then
        local reward = WuDaoHuiBox.Award
        -- +物品
        Lua_tools.AddItem(player,reward.item,"武道会","武道会宝箱","武道会宝箱开启奖励")
        -- +经验
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = BangPaiQiangDao.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "武道会","武道会宝箱","武道会宝箱开启奖励")
			local MainPet = sPetSystem:GetMainPet(player)
            if MainPet then
                MainPet:AddExp(res_exp, "武道会","武道会宝箱","武道会宝箱开启奖励")
            end
            for i = 1, 4 do
                local Pet =  sPetSystem:GetGuardPet(player,i)
                if Pet then
                    Pet:AddExp(res_exp, "武道会","武道会宝箱","武道会宝箱开启奖励")
                end
            end
			
		end
		--+money 
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = BangPaiQiangDao.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, "武道会","武道会宝箱","武道会宝箱开启奖励")
			sLuaApp:NotifyTipsMsg(player, "您获得了"..res_money.."银币")
		end
    end
    player:SetInt("WuDaoHuiNPCOpeningNPC", 0)
    player:SetInt("WuDaoHuiNPCOpenBoxTimer", 0)
    player:SetDayInt("OpenWuDaoHuiBox_Num",1)
    if sNpcSystem:DestroyNpc(npc) ~= 0 then
        sLuaApp:NotifyTipsMsg(player, "销毁NPC错误")
    end
end

--奖励配置表转数字
function WuDaoHuiBox.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
	]]
	if type(add_num) == "table" then
		local min_num = add_num[1]
		local max_num = add_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	elseif type(add_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. add_num))()
	elseif type(add_num) == "number" then
		res_num = math.floor(add_num)
	end
	return res_num
end