--赤脚大仙
Chijiaodaxian = {}
function Chijiaodaxian.option1(npc, player, content)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('SealedBookUI')")
    return ""
end

function Chijiaodaxian.main(npc, player)
	sLuaApp:LuaDbg("Chijiaodaxian.main")
	if not Chijiaodaxian.IsWordlessBookOpen then
		Chijiaodaxian.WordlessBookStateGet()
	end
	local CanJoin = 0
	if Chijiaodaxian.IsWordlessBookOpen == 1 then
		sLuaApp:LuaDbg("IsWordlessBookOpen = 1")
		local player_R = player:GetAttr(ROLE_ATTR_REINCARNATION)
		local player_L = player:GetAttr(ROLE_ATTR_LEVEL)
		sLuaApp:LuaDbg("player_R = " .. player_R)
		sLuaApp:LuaDbg("player_L = " .. player_L)
		
		if player_R > Chijiaodaxian.WordlessBook_Rein then
			CanJoin = 1
		elseif player_R == Chijiaodaxian.WordlessBook_Rein then
			if player_L >= Chijiaodaxian.WordlessBook_Level then
				CanJoin = 1
			end
		end
	end
	if CanJoin == 1 then
		
		player:AddNpcOption(npc, 0, "无字真经", "option1", "1");
	end
    
    return "现在不穿鞋是不行了,走哪哪烫脚。";
end

function Chijiaodaxian.WordlessBookStateGet()
	local ActionID = sVarSystem:GetInt("ACT_WordlessBook_Id")
	sLuaApp:LuaDbg("Chijiaodaxian.WordlessBookStateGet   ActionID = " .. ActionID)
	Chijiaodaxian.IsWordlessBookOpen = 0
	Chijiaodaxian.WordlessBook_Rein = 0
	Chijiaodaxian.WordlessBook_Level = 0
	if ActionID ~= 0 then
		if sLuaApp:IsActivityRunning(ActionID) then
			Chijiaodaxian.IsWordlessBookOpen = 1
			local ActData = ActivityConfig.GetById(ActionID)
			if ActData then
				Chijiaodaxian.WordlessBook_Rein = ActData.Rein
				Chijiaodaxian.WordlessBook_Level = ActData.LevelMin
			end
		end
	end
	
	sLuaApp:LuaDbg("IsWordlessBookOpen = " .. Chijiaodaxian.IsWordlessBookOpen)
	sLuaApp:LuaDbg("WordlessBook_Rein = " .. Chijiaodaxian.WordlessBook_Rein)
	sLuaApp:LuaDbg("WordlessBook_Level = " .. Chijiaodaxian.WordlessBook_Level)
end