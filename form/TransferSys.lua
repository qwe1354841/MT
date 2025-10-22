--地图跳转
TransferSys = {}

function TransferSys.Main(player,map_keyname,index)
	if map_keyname then
		map_keyname = tostring(map_keyname)
	else
		sLuaApp:LuaDbg("map_keyname is nil")
		return 
	end
	
	if index then
		index = tostring(index)
	else
		sLuaApp:LuaDbg("index is nil")
		return 
	end
	
	if map_keyname == "帮派地图" then
		GoBack(player)
		return
	else
		local map = sMapSystem:GetMapByKey(map_keyname)
		if not map then
			sLuaApp:LuaDbg("map is nil")
			return 
		end
		
		--地图等级判断
		if not Lua_tools.CheckMapLevel(player, map_keyname) then
			return
		end
		
		local tb = TransferConfig.GetByKeyName(map_keyname)
		if not tb then
			sLuaApp:LuaDbg("get table transfer bykeyname is nil , keyname = "..map_keyname)
			return 
		end
		local x = 0
		local y = 0
		local range = 0
		if index == "0" then
			x = tb['MidX']
			y = tb['MidY']
		else
			x = tb['TranX'..index]
			y = tb['TranY'..index]
		end
		
		if x and y and range then
			local team = player:GetTeam()
			if team then
				local leader_guid = team:GetTeamLeaderGUID()
				if leader_guid then
					if leader_guid ~= player:GetGUID() then
						if not sTeamSystem:IsTempLeave(player) then
							sLuaApp:LuaDbg("not leader and not leave")
							return
						end
					else
						sTeamSystem:EnterMap(team,map,x,y,range)
						return
					end
				end
			end
			sMapSystem:Jump(player,map,x,y,range)
		end
	end
end