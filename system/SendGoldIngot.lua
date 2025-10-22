--充值游街
SendGoldIngot = {}
SendGoldIngot.Config = {
	['GiftNum'] = 10, --每次刷新红包数量
	['GiftRefreshTime'] = 6, --每隔x秒刷一次红包
	['GiftReward'] = { --红包内容 仅支持货币
		[0] = {
			{MoneyType = 5,MoneyVal = 2720,Rand = 100},
		},
		[68] = {
			{MoneyType = 5,MoneyVal = 2750,Rand = 9900},
			{MoneyType = 2,MoneyVal = 4,Rand = 100},
		},
		[98] = {
			{MoneyType = 5,MoneyVal = 4000,Rand = 9867},
			{MoneyType = 2,MoneyVal = 6,Rand = 133},
		},
		[128] = {
			{MoneyType = 5,MoneyVal = 5200,Rand = 9850},
			{MoneyType = 2,MoneyVal = 8,Rand = 150},
		},
		[198] = {
			{MoneyType = 5,MoneyVal = 8100,Rand = 9733},
			{MoneyType = 2,MoneyVal = 12,Rand = 267},
		},
		[328] = {
			{MoneyType = 5,MoneyVal = 13500,Rand = 9617},
			{MoneyType = 2,MoneyVal = 24,Rand = 282},
		},
		[648] = {
			{MoneyType = 5,MoneyVal = 27500,Rand = 946},
			{MoneyType = 2,MoneyVal = 48,Rand = 54},
		},
	},
	['GiftCount'] = 20,
	['Step'] = {
		{Type = "CreateNpc",NpcID = 10494,MapKeyName = "长安城",PosX = 176,PosY = 121,Rang = 0,Dir = 3,IsSendGift = 1},
		{Type = "SetTracePoint",PosX = 263,PosY = 164},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 274,PosY = 188},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 298,PosY = 200},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 322,PosY = 199},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 376,PosY = 221},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 399,PosY = 240},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 593,PosY = 343},
		{Type = "Standby",Time = 3},
		{Type = "SetTracePoint",PosX = 399,PosY = 240},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 376,PosY = 221},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 322,PosY = 199},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 298,PosY = 200},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 274,PosY = 188},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 263,PosY = 164},
		{Type = "Standby",Time = 0.5},
		{Type = "SetTracePoint",PosX = 176,PosY = 121},
		{Type = "Standby",Time = 3},
		{Type = "End"},
	},
	['NpcSpeed'] = 150,
	['Broadcast'] = {
		[0] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#不少资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[68] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#不少资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[98] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#不少资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[128] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#不少资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[198] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#大量资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[328] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#大量资金#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
		[648] = {
			"#COLORCOLOR_WHITE#玩家#COLOREND# #COLORCOLOR_GREENG#name#COLOREND# #COLORCOLOR_WHITE#近日斥#COLOREND# #COLORCOLOR_YELLOW#巨资#COLOREND# #COLORCOLOR_WHITE#援助我大唐国库，皇上念及百姓辛苦，特命艾百万在#COLOREND# #COLORCOLOR_BLUE#长安城#COLOREND# #COLORCOLOR_WHITE#大街发放元宝钱财，长安老小速速前来领取！#COLOREND#",
		},
	},
	['FireworksRange'] = 10,
	['GiftItemKeyName'] = "充值游街红包",
	['GiftExistTime'] = 200,
	['MinLevel'] = 20,
	['NPCShout'] = {
		"本次游行由 #COLORCOLOR_YELLOW#name#COLOREND# 倾情赞助",
		"获得红包的米娜桑，快去感谢一下 #COLORCOLOR_YELLOW#name#COLOREND# 吧",
		" #COLORCOLOR_YELLOW#name#COLOREND# 叫我来巡街哟，巡完南街巡北街呦！",
		"大江东去浪淘尽，不及 #COLORCOLOR_YELLOW#name#COLOREND# 帅多金。",
		"听说 #COLORCOLOR_YELLOW#name#COLOREND# 偷偷在红包中放了银元宝呦。",
		"为何我的眼中饱含泪水，因为我对 #COLORCOLOR_YELLOW#name#COLOREND# 爱得深沉。",
		"你们不要总盯着我，我只是一个打工滴。 #COLORCOLOR_YELLOW#name#COLOREND# 是老板，你们去抢他吧！",
		"我撒钱的姿势是最帅得！谁赞成？谁反对？",
		"没有了，散了吧！剩下是我留着回家娶媳妇的！",
		"捡了我的红包，以后就是我的人了！",
		" #COLORCOLOR_YELLOW#name#COLOREND# 大仙法力无边，飞天入地，助我成仙。",
	},
	['GiftShout'] = "玩家 #COLORCOLOR_GREENG#name#COLOREND# 洪福齐天，于艾百万在#COLORCOLOR_BLUE#长安城大街#COLOREND#所赠大礼中获得了#COLORCOLOR_YELLOW#num银元宝#COLOREND#！",
}



function SendGoldIngot.main(player,type)
	local player_name = player:GetName()
	if not SendGoldIngot.Pool then
		SendGoldIngot.Pool = {}
	end
	if not SendGoldIngot.Is_Runing then
		SendGoldIngot.Is_Runing = 0
	end
	if SendGoldIngot.Is_Runing == 1 then
		table.insert(SendGoldIngot.Pool,{""..player_name,type})
	else
		SendGoldIngot.Is_Runing = 1
		if player_name == "" then
			player_name = "一个大宝贝"
		end
		SendGoldIngot.Broadcast(player_name,type)
		sVarSystem:SetString("SendGoldIngot_PlayerName",player_name)
		SendGoldIngot.Step(1)
	end
end

function SendGoldIngot.Step(num)
	if SendGoldIngot.Config['Step'][num] then
		if SendGoldIngot.Config['Step'][num]['Type'] == "CreateNpc" then
			SendGoldIngot.CreateNpc(num)
		end
		if SendGoldIngot.Config['Step'][num]['Type'] == "SetTracePoint" then
			SendGoldIngot.SetTracePoint(num)
		end
		if SendGoldIngot.Config['Step'][num]['Type'] == "Standby" then
			SendGoldIngot.Standby(num)
		end
		if SendGoldIngot.Config['Step'][num]['Type'] == "End" then
			SendGoldIngot.End()
		end
	else
		SendGoldIngot.End()
	end
end

function SendGoldIngot.CreateNpc(num)
	local map = sMapSystem:GetMapByKey(SendGoldIngot.Config['Step'][num]['MapKeyName'])
	if not map then
		 SendGoldIngot.End()
	end
	local tb = SendGoldIngot.Config['Step'][num]
	local npc = sNpcSystem:CreateNpc(tb['NpcID'],map,tb['PosX'],tb['PosY'],tb['Rang'],tb['Dir'],0)
	if not npc then
		 SendGoldIngot.End()
	end
	npc:SetMoveSpeed(SendGoldIngot.Config['NpcSpeed'])
	sVarSystem:SetInt("SendGoldIngot_NPCGUID",npc:GetGUID())
	if tb['IsSendGift'] == 1 then
		SendGoldIngot.AddSendGiftTimer()
	end
	num = num + 1
	SendGoldIngot.Step(num)
end

function SendGoldIngot.SetTracePoint(num)
	--sLuaApp:LuaDbg("SendGoldIngot.SetTracePoint  num = "..num)
	local npc = sNpcSystem:GetNpcByGUID(sVarSystem:GetInt("SendGoldIngot_NPCGUID")) 
	local tb = SendGoldIngot.Config['Step'][num]
	if not npc then
		SendGoldIngot.End()
		return
	end
	npc:SetTracePoint(tb['PosX'],tb['PosY'], "SendGoldIngot", "NpcMoveEnd", ""..num);
end

function SendGoldIngot.NpcMoveEnd(npc,p)
	local num = tonumber(p)
	num = num + 1
	SendGoldIngot.Step(num)
end

function SendGoldIngot.Standby(num)
	local npc = sNpcSystem:GetNpcByGUID(sVarSystem:GetInt("SendGoldIngot_NPCGUID")) 
	local tb = SendGoldIngot.Config['Step'][num]
	if not npc then
		SendGoldIngot.End()
		return
	end
	
	sLuaTimerSystem:AddTimerEx(npc, tb['Time'] * 1000, 1, "SendGoldIngot.StandbyEnd", ""..num)
end

function SendGoldIngot.StandbyEnd(npc,timer,p)
	local num = tonumber(p)
	num = num + 1
	SendGoldIngot.Step(num)
end

function SendGoldIngot.End()
	local npc = sNpcSystem:GetNpcByGUID(sVarSystem:GetInt("SendGoldIngot_NPCGUID")) 
	if npc then
		sNpcSystem:DestroyNpc(npc)
	end
	SendGoldIngot.Is_Runing = 0
	sVarSystem:SetInt("SendGoldIngot_Type",0)
	sVarSystem:SetInt("SendGoldIngot_NPCGUID",0)
	sVarSystem:SetString("SendGoldIngot_PlayerName","一个大宝贝")
	if not SendGoldIngot.Pool or not SendGoldIngot.Pool[1] then
		return
	end
	local name = SendGoldIngot.Pool[1][1]
	local type = SendGoldIngot.Pool[1][2]
	SendGoldIngot.Broadcast(name,type)
	if name ~= "" then
		sVarSystem:SetString("SendGoldIngot_PlayerName",""..name)
	end
	table.remove(SendGoldIngot.Pool,1)
	SendGoldIngot.Is_Runing = 1
	SendGoldIngot.Step(1)
end

function SendGoldIngot.Broadcast(name,type)
	if not SendGoldIngot.Config['Broadcast'][type] then
		type = 0
	end
	local str =  string.gsub(SendGoldIngot.Config['Broadcast'][type][1],"name",""..name,1)
	--str =  string.gsub(str,"#type#",""..type,1)
	--sLuaApp:LuaDbg("SendGoldIngot.Broadcast  str = "..str)
    sLuaApp:NotifyTopMsgToAll(1, str)
	sVarSystem:SetInt("SendGoldIngot_Type",type)
end

function SendGoldIngot.AddSendGiftTimer()
	local npc = sNpcSystem:GetNpcByGUID(sVarSystem:GetInt("SendGoldIngot_NPCGUID")) 
	if not npc then
		return
	end
	SendGoldIngot.SendGift(npc,0,0)
	sLuaTimerSystem:AddTimerEx(npc, SendGoldIngot.Config['GiftRefreshTime']* 1000, -1, "SendGoldIngot.SendGift", "")
end

function SendGoldIngot.SendGift(npc,timer,p)
	local map = npc:GetMap()
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	local gift_id = sItemSystem:GetItemIdByKeyname(SendGoldIngot.Config['GiftItemKeyName'])
	for i = 1, tonumber(SendGoldIngot.Config['GiftNum']) do 
		local point_tb = sMapSystem:GetRandomPoint(map, x, y, SendGoldIngot.Config['FireworksRange'])
		local gift_item = sItemSystem:CreateItem(gift_id, 1, true)
		gift_item:SetInt("SendGoldIngot_Type",sVarSystem:GetInt("SendGoldIngot_Type"))
		local res = sMapSystem:ItemAppear(gift_item, map, point_tb["x"], point_tb["y"], 0)
		if res ~= 0 then
			sLuaApp:LuaErr("SendGoldIngot.SendGift err res = ".. res)
		end
		sLuaTimerSystem:AddTimerEx(gift_item, SendGoldIngot.Config['GiftExistTime'] * 1000,1,"SendGoldIngot.DestroyGift", "")
	end	
	
	local npc_name = npc:GetName()
	local msg = SendGoldIngot.Config['NPCShout'][math.random(1,#SendGoldIngot.Config['NPCShout'])]
	local player_name = sVarSystem:GetString("SendGoldIngot_PlayerName")
	msg = string.gsub(msg,"name",""..player_name,1)
	local str = [[CL.SendNotify(NOTIFY.TalkBubble,1, "]]..msg..[[","]]..npc_name..[[",0)]]
	local map = sMapSystem:GetMapByKey("长安城")
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", str)
end

function SendGoldIngot.SendGiftEX(player,num,range)
	local map = player:GetMap()
	local x = sMapSystem:GetPosX(player)
	local y = sMapSystem:GetPosY(player)
	local gift_id = sItemSystem:GetItemIdByKeyname(SendGoldIngot.Config['GiftItemKeyName'])
	for i = 1, tonumber(num) do 
		local point_tb = sMapSystem:GetRandomPoint(map, x, y, range)
		local gift_item = sItemSystem:CreateItem(gift_id, 1, true)
		gift_item:SetInt("SendGoldIngot_Type",sVarSystem:GetInt("SendGoldIngot_Type"))
		local res = sMapSystem:ItemAppear(gift_item, map, point_tb["x"], point_tb["y"], 0)
		if res ~= 0 then
			sLuaApp:LuaErr("SendGoldIngot.SendGift err res = ".. res)
		end
	end	
end
function SendGoldIngot.DestroyGift(gift_item, timer, params)
	sItemSystem:DestroyItem(gift_item, "system", "SendGoldIngot", "DestroyGift")
end

function SendGoldIngot.PickupItem(player, gift)
	local last_gift_guid = player:GetInt("SendGoldIngot_OpeningGiftGUID")
	if last_gift_guid ~= 0 then
		local last_gift = sItemSystem:GetItemByGUID(last_gift_guid)
		if last_gift then
			sLuaApp:NotifyTipsMsgEx(player, "上一个红包正在拾取中！")
			return
		end
	end
	
	if gift:GetInt("SendGoldIngot_IsOpeningGift") == 1 then
		sLuaApp:NotifyTipsMsg(player, "红包从来都是先到先得，少侠，这个红包已经有主了！")
		return
	end
		local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if level < SendGoldIngot.Config['MinLevel'] then
		sLuaApp:NotifyTipsMsg(player, "充值红包需要达到"..SendGoldIngot.Config['MinLevel'].."级才可以领取，快去努力升级吧！")
		return
	end
	if player:GetDayInt("RechargeRedPacketDayCount") >= SendGoldIngot.Config['GiftCount'] then
		sLuaApp:NotifyTipsMsg(player, "每天只能领取"..SendGoldIngot.Config['GiftCount'].."次充值红包，明天再来吧！")
		return
	end
	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormMarry", "StopPickupItem", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..Marry.ProgressBarTime.."#"..Marry.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, Marry.ProgressBarTime,1,"SendGoldIngot.GiveReward", ""..gift:GetGUID())
	if t_guid then
		gift:SetInt("SendGoldIngot_IsOpeningGift", 1)
		player:SetInt("SendGoldIngot_OpeningGiftGUID", gift:GetGUID())
		player:SetInt("SendGoldIngot_OpenGiftTimer", t_guid)
	end
end

--进度条打断
function SendGoldIngot.StopPickupItem(player)
	local timer_guid = player:GetInt("SendGoldIngot_OpenGiftTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."SendGoldIngot.StopPickupItem HasTimer错误")
	end
	player:SetInt("SendGoldIngot_OpenGiftTimer", 0)
	
	local gift_guid = player:GetInt("SendGoldIngot_OpeningGiftGUID")
	player:SetInt("SendGoldIngot_OpeningGiftGUID", 0)
	local gift = sItemSystem:GetItemByGUID(gift_guid)
	if gift then
		gift:SetInt("SendGoldIngot_IsOpeningGift", 0)
	end
end

--发奖励
function SendGoldIngot.GiveReward(player, timer, params)
	local item_guid = tonumber(params)
	local gift = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if not gift then
		return
	end
	local type = gift:GetInt("SendGoldIngot_Type")
	if not SendGoldIngot.Config['GiftReward'][type] then
		type = 0
	end
	local num = Lua_tools.PlayerStartRandom(SendGoldIngot.Config['GiftReward'][type],"SendGoldIngotGiftReward"..type,1, true, true)[1]
	local add_money_type = SendGoldIngot.Config['GiftReward'][type][num]["MoneyType"]
	local add_money_val = SendGoldIngot.Config['GiftReward'][type][num]["MoneyVal"]
	if add_money_type and add_money_val and add_money_val > 0 then
		Lua_tools.AddMoney(player, add_money_type, add_money_val, "system", "SendGoldIngot", "OnUseItem")
		sLuaApp:NotifyTipsMsgEx(player, "获得"..add_money_val..Lua_tools.GetMoneyName(add_money_type))
		player:SetDayInt("RechargeRedPacketDayCount",player:GetDayInt("RechargeRedPacketDayCount")+1)
		if add_money_type == 1 then
			local str =  string.gsub(SendGoldIngot.Config['GiftShout'],"name",""..player:GetName(),1)
			str =  string.gsub(str,"num",""..add_money_val,1)
			sLuaApp:NotifyTopMsgToAll(1, str)
		end
	end
	sItemSystem:DestroyItem(gift, "system", "结婚", "红包被捡起")
	player:SetInt("SendGoldIngot_OpenGiftTimer", 0)
	player:SetInt("SendGoldIngot_OpeningGiftGUID", 0)
	
end