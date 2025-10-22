--装备相关表单

FormReincarnation = {}

function FormReincarnation.GetConfig(player)
	if Reincarnation then
		local FormStr = [[
			REINCARNATION_DATA = ]]..Lua_tools.serialize(Reincarnation.Config)..[[
		]]
		sLuaApp:ShowForm(player, "脚本表单", FormStr)
	end
	return ""
end

function FormReincarnation.GetData(player)
	local reincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local tb = {}
	for i = 1 , reincarnation ,1 do 
		table.insert(tb,player:GetInt("Reincarnation"..i))
	end
	local FormStr = [[
		if TurnBornCorrectUI then
			TurnBornCorrectUI.GetData(]]..Lua_tools.serialize(tb)..[[)
		end
		if TurnBornAttrTipUI then
			TurnBornAttrTipUI.GetData(]]..Lua_tools.serialize(tb)..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
	
	return ""
end

function FormReincarnation.ChangeReincarnationByRole(player,reincarnation,role)
	if Reincarnation then
		if player and reincarnation and role then
			Reincarnation.ChangeReincarnationByRole(player,reincarnation,role)
		end
	end
	
	return ""
end