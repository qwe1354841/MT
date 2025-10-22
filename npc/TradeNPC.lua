--贸易相关NPC
TradeNPC = {}

function TradeNPC.main(npc, player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Trade'] ~= "on" then
			return "0"
		end
	end
	if npc:GetKeyName() == TradeConfig.StartNPC then
		player:AddNpcOption(npc, 0, "开始贸易", "option2", "")
		return "0"
	end

	local event_key = npc:GetString("Trade_EventKey")
	local event_config = TradeConfig.Event[event_key]
	if not event_config then
		sLuaApp:LuaErr("TradeNPC.main TradeConfig.Event 不存在"..event_key)
		return "0"
	end
	
	local option_conifg  = event_config["Option"] or {}
	for k,v in ipairs(option_conifg) do
		player:AddNpcOption(npc, 0, v["OptionMsg"], "option1", ""..v["Type"]..","..k)
	end
	local talk_msg = event_config["TalkMsg"] or "0"	
	return talk_msg
end

function TradeNPC.option1(npc, player, params)
	local params_tb = sLuaApp:StrSplit(params, ",")
	local typ = params_tb[1]
	local option_index = tonumber(params_tb[2])
	if Trade then
		if TradeNPC.NPCFunc[typ] then
			TradeNPC.NPCFunc[typ](player, npc, option_index)
		else
			sLuaApp:LuaErr("TradeNPC.option1  typ 错误 "..typ)
		end
	end
	return ""
end

function TradeNPC.option2(npc, player, params)
	if not Trade.CheckLevel(player) then return "" end
	local str  = [[
		GUI.OpenWnd("TradeRoadsUI")
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

TradeNPC.NPCFunc = {
	["打怪"] = function(player, npc, option_index)
		Trade.StartFight(player, npc, option_index)
	end,
	["对话"] = function(player, npc, option_index)
		Trade.NPCTalk(player, npc, option_index)
	end,
	["无事发生"] = function(player, npc, option_index)
		sLuaApp:NotifyTipsMsg(player, "无事发生！")
	end,
	["上交"] = function(player, npc, option_index)
		Trade.HandUp(player, npc, option_index, 0)
	end,
}