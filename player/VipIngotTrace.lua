--VIP 送元宝
VipIngotTrace = {}

VipIngotTrace.MinLevel = 25

VipIngotTrace.BindIngotItem = {
	{ItemKey = "50银元", BindIngotNum = 50, TopMsg = 0}, -- TopMsg 是否发顶部信息
	{ItemKey = "100银元", BindIngotNum = 100, TopMsg = 0},
	{ItemKey = "200银元", BindIngotNum = 200, TopMsg = 1},
	{ItemKey = "300银元", BindIngotNum = 300, TopMsg = 1},
	{ItemKey = "400银元", BindIngotNum = 400, TopMsg = 1},
	{ItemKey = "500银元", BindIngotNum = 500, TopMsg = 1},
	{ItemKey = "600银元", BindIngotNum = 600, TopMsg = 1},
	{ItemKey = "1000银元", BindIngotNum = 1000, TopMsg = 1},
}

VipIngotTrace.BindIngotName = "银元宝"

-- key为对应的活动名称
VipIngotTrace.IngotConfig = {
	["师门任务"] = {ShowName = "师门任务", 		ActKey = "Act_Shimen1", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["小鬼任务"] = {ShowName = "小鬼任务", 		ActKey = "Act_XiaoGui", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["挑战神兽"] = {ShowName = "挑战神兽", 		ActKey = "Act_ShenShouTiaoZhan",RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["门派历练"] = {ShowName = "门派历练", 		ActKey = "Act_ZhongZuShiLian", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["护卫银子"] = {ShowName = "护卫银子", 		ActKey = "Act_HuWeiYinZi", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["傲来秘宝"] = {ShowName = "傲来秘宝", 		ActKey = "AoLaiMiBao", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["梦回千古"] = {ShowName = "梦回千古", 		ActKey = "MengHuiQianGu", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["洞窟伏魔"] = {ShowName = "洞窟伏魔", 		ActKey = "DongKuFuMo", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["人鬼绝恋"] = {ShowName = "人鬼绝恋", 		ActKey = "RenGuiJueLian", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["闹事的妖怪"] = {ShowName = "闹事的妖怪", 	ActKey = "NaoShi_1", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["门派入侵"] = {ShowName = "门派入侵", 		ActKey = "MenPaiRuQin", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["帮派强盗（午）"] = {ShowName = "帮派强盗",ActKey = "BangPaiQiangDao", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["帮派强盗（晚）"] = {ShowName = "帮派强盗",ActKey = "BangPaiQiangDao", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["十二星官"] = {ShowName = "十二星官", 		ActKey = "NaoShi_2", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["天地大劫（早）"] = {ShowName = "天地大劫",ActKey = "TianDiDaJie", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["天地大劫（晚）"] = {ShowName = "天地大劫",ActKey = "TianDiDaJie", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["公主的嫁妆"] = {ShowName = "公主的嫁妆",	ActKey = "Act_GongZhuJiaZhuang",RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["长安保卫战"] = {ShowName = "长安保卫战", 	ActKey = "ChangAnBaoWei", 		RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["宝阁大开"] = {ShowName = "宝阁大开", 		ActKey = "BaoGeDaKai", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["守卫粮仓（午）"] = {ShowName = "守卫粮仓",ActKey = "BangPaiQiangDao", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["守卫粮仓（晚）"] = {ShowName = "守卫粮仓",ActKey = "BangPaiQiangDao", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["修罗任务"] = {ShowName = "修罗任务", 		ActKey = "Act_XiuLuo", 			RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
	["天降宝箱"] = {ShowName = "天降宝箱", 		ActKey = "TianJiangBaoXiang", 	RandomList = {{ItemKey = "", Rand = 2400},{ItemKey = "50银元", Rand = 4000},{ItemKey = "100银元", Rand = 2000},{ItemKey = "200银元", Rand = 500},{ItemKey = "300银元", Rand = 400},{ItemKey = "400银元", Rand = 300},{ItemKey = "500银元", Rand = 200},{ItemKey = "600银元", Rand = 100},{ItemKey = "1000银元", Rand = 100}},},
}

function VipIngotTrace.GetReward(player, act_key)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VipIngotTrace'] ~= "on" then
			return
		end
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < VipIngotTrace.MinLevel then return end 

	local max_ingot_num = VipLogic.GetVipEnhanced(player,"可获得银元宝数量","value",0)
    local now_ingot_num = player:GetDayInt("VipIngotTrace_GetIngot")
	if now_ingot_num >= max_ingot_num then return end
	
	local surplus_ingot_num = max_ingot_num - now_ingot_num
	if surplus_ingot_num < VipIngotTrace.BindIngotItem[1]["BindIngotNum"] then
		sLuaApp:LuaErr("VipIngotTrace " ..player:GetName().." 剩余可获得元宝数量 < 最小可获得元宝数量")
		return
	end
	
	local act_ingot_config = VipIngotTrace.IngotConfig[act_key]
	if not act_ingot_config then return end
	local random_list = act_ingot_config["RandomList"]
	if not random_list then return end
	
	local index_tb = Lua_tools.PlayerStartRandom(random_list, "VipIngotTrace_"..act_key,1, true, true)
	local item_key = random_list[index_tb[1]]["ItemKey"]
	if not item_key or item_key == "" then return end
	--不能送超上限
	local get_ingot_num = VipIngotTrace.IngotItemToNum[item_key][1]
	if surplus_ingot_num < get_ingot_num then
		for i = #VipIngotTrace.BindIngotItem, 1, -1 do
			if VipIngotTrace.BindIngotItem[i]["BindIngotNum"] <= surplus_ingot_num then
				item_key = VipIngotTrace.BindIngotItem[i]["ItemKey"]
				get_ingot_num = VipIngotTrace.IngotItemToNum[item_key][1]
				break
			end
		end
	end
	
	Lua_tools.AddItem(player, {item_key,1,1}, "system", "活动送元宝", act_key)
	now_ingot_num = now_ingot_num + get_ingot_num
	player:SetDayInt("VipIngotTrace_GetIngot", now_ingot_num)
	sLogServerSystem:LogToServer(0, player, "VIP送元宝", now_ingot_num - get_ingot_num, now_ingot_num, "今日获得VIP送元宝数", "")
	
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.GetTodayIngot(player, now_ingot_num)
	end
	
	local is_top_msg = VipIngotTrace.IngotItemToNum[item_key][2]
	if is_top_msg and is_top_msg == 1 then
		local show_name = act_ingot_config["ShowName"]
		local item_name = VipIngotTrace.IngotItemToNum[item_key][3]
		sLuaApp:NotifyTopMsgToAll( 1, "<color=#FFD700FF>恭喜玩家：</color><color=#90F545FF>"..VipIngotTrace.GetPlayerName(player).."</color>在<color=#00C8E9FF>"..show_name.."</color>中获得<color=#FFD700FF>"..item_name.."</color>")
	end
	
	if now_ingot_num >= max_ingot_num then
		local msg = "您已获得 " .. now_ingot_num .. VipIngotTrace.BindIngotName .."，已达今日活动获取数量上限"
		local vip_level = player:GetAttr(ROLE_ATTR_VIP)
		if vip_level < VipConfig.MaxVipLevel then
			msg = msg .. "，提升 VIP 等级，可以获得更多的掉落" .. VipIngotTrace.BindIngotName .. "机会"
		end
		msg = msg .."。"
		
		local str = [[GlobalUtils.ShowServerBoxMessage1Btn("]]..msg..[[")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "")
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	VipIngotTrace.GetData(player)
end

--机器人名字后面带_
function VipIngotTrace.GetPlayerName(player)
	local name = player:GetName()
	if player:GetType() == GUID_ROBOT then
		name = string.sub(name, 1, -2)
	end
	return name
end

function VipIngotTrace.GetIngotActivity(player)
	local str = [[
		if ActivityPanelUI then
			ActivityPanelUI.VipActivityList = ]]..VipIngotTrace.IngotActivityStr..[[
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function VipIngotTrace.GetData(player)
    if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VipIngotTrace'] ~= "on" then
			return ""
		end
	end
    if player == nil then
        return ""
    end
    local MaxValue = VipLogic.GetVipEnhanced(player,"可获得银元宝数量","value",0)
    local NowValue = player:GetDayInt("VipIngotTrace_GetIngot")
    local Max_Viplevel = VipConfig.MaxVipLevel
	
	if MaxValue <= 0 then return "" end
    local str = [[
        if TrackUI then
            TrackUI.VipFuncOpenLevel = ]]..VipIngotTrace.MinLevel..[[
            TrackUI.CurVipIngotNum = ]]..player:GetDayInt("VipIngotTrace_GetIngot")..[[
            TrackUI.MaxVipIngotCount  = ]]..MaxValue..[[
            TrackUI.VipLevelMax  = ]]..Max_Viplevel..[[
            TrackUI.RefreshVipPanel()
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

function VipIngotTrace.Initialization()
	VipIngotTrace.IngotItemToNum = {}
	for _,v in ipairs(VipIngotTrace.BindIngotItem) do
		local item_data = ItemConfig.GetByKeyName(v["ItemKey"])
		if not item_data then
			sLuaApp:LuaErr("VipIngotTrace.Initialization() ItemConfig不存在 "..v["ItemKey"])
		end
		VipIngotTrace.IngotItemToNum[v["ItemKey"]] = {v["BindIngotNum"], v["TopMsg"] and v["TopMsg"] or 0, item_data.Name}
	end
	
	VipIngotTrace.IngotActivity = {}
	for key in pairs(VipIngotTrace.IngotConfig) do
		VipIngotTrace.IngotActivity[key] = 1
	end
	VipIngotTrace.IngotActivityStr = Lua_tools.serialize(VipIngotTrace.IngotActivity)
	VipIngotTrace.IngotActivity = nil
end
VipIngotTrace.Initialization()