--无字真经表单
FormWordlessBook = {}

function FormWordlessBook.GetConfig(player)
	if WordlessBook then
		WordlessBook.GetConfig(player)
	end
    return ""
end

function FormWordlessBook.GetData(player)
	if WordlessBook then
		WordlessBook.GetData(player)
	end
    return ""
end

function FormWordlessBook.StartFight(player,Chapter,Mission,isAuto)
	sLuaApp:LuaDbg("FormWordlessBook            Chapter = " .. Chapter .. "     Mission = " .. Mission)
	WordlessBook.StartFight(player,Chapter,Mission,isAuto)
	return ""
end

function FormWordlessBook.CloseAuto(player)
	player:SetInt("WordlessBook_isAuto",0)
	sLuaApp:NotifyTipsMsg(player, "已取消了无字真经中的自动挂机")
	return ""
end
