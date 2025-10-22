--服务器等级相关表单
FormServerLevel = {}

function FormServerLevel.get_function_switch(player)
	--sLuaApp:LuaErr("FormServerLevel.get_function_switch")
	if ServerLevel then
		ServerLevel.get_function_switch(player)
	end
	return ""
end

function FormServerLevel.get_level_by_client(player)
	--sLuaApp:LuaErr("FormServerLevel.get_level_by_client")
	if ServerLevel then
		ServerLevel.get_level_by_client(player)
	end
	return ""
end