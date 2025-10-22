--帮派地图脚本 by shodow_yong
GuildMAP = {}

function GuildMAP.on_map_create(map)
	sLuaApp:LuaDbg("GuildMAP.on_map_create")
	if not sNpcSystem:CreateNpc(20057, map, 95, 104, 0, 3, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20057 is err")
		return
	end
	
	if not sNpcSystem:CreateNpc(20058, map, 161, 92, 0, 5, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20058 is err")
		return
	end
	
	if not sNpcSystem:CreateNpc(20059, map, 65, 79, 0, 3, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20059 is err")
		return
	end
	
	if not sNpcSystem:CreateNpc(20060, map, 78, 72, 0, 3, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20060 is err")
		return
	end
	
	if not sNpcSystem:CreateNpc(20061, map, 78, 153, 0, 3, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20061 is err")
		return
	end
	
	--if not sNpcSystem:CreateNpc(20078, map, 144, 54, 0, 4, 0) then
	--	sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20078 is err")
	--	return
	--end
	
	if not sNpcSystem:CreateNpc(20068, map, 242, 135, 0, 5, 0) then
		sLuaApp:LuaDbg( "GuildMAP.on_map_create CreateMoveNpc 20068 is err")
		return
	end
end