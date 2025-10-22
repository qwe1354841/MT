--装备相关表单

FormActivity = {}

function FormActivity.ActivitySystem_GetData(player)
	sLuaApp:LuaDbg("FormActivityGet!")
	--EquipBuild.Initialization(0)
	if not MainUISwitch.CheckOpenLevel(player,"活动") then
		return ""
	end
	if ActivitySystem then
		ActivitySystem.GetData(player, pet_guid)
	end
	return ""
end

function FormActivity.GuildBattle_LeaveField(player)
	sLuaApp:LuaDbg("FormActivityGet!")
	--EquipBuild.Initialization(0)
	if not MainUISwitch.CheckOpenLevel(player,"活动") then
		return ""
	end
	if GuildBattle then
		GuildBattle.PlayerTryLeave(player)
	end
	return ""
end

function FormActivity.GuildBattle_GetPanelInfo(player)
	sLuaApp:LuaDbg("FormActivityGet!")
	--EquipBuild.Initialization(0)
	if not MainUISwitch.CheckOpenLevel(player,"活动") then
		return ""
	end
	if GuildBattle then
		GuildBattle.GetPanelInfo(player)
	end
	return ""
end