--技能书分解合成分解相关表单
FormItemDisinOrCompo = {}
--分解
function FormItemDisinOrCompo.Disintegrate(player,item_guid_list,enter_itemnum)
	if ItemDisintegrate then
		ItemDisintegrate.Disintegrate(player,item_guid_list,enter_itemnum)
	end
	return ""
end
--合成

function FormItemDisinOrCompo.Composite(player,item_KeyName,isband)
	if ItemComposite then
		ItemComposite.Composite(player,item_KeyName,isband)
	end
	return ""
end

function FormItemDisinOrCompo.GetConfig(player)
	local money_type = 5
	local disintegrateList = Lua_tools.serialize(ItemDisintegrate.DisintegrateList)
	local str = [[
		DecomposeUI.GetConfig(]]..disintegrateList..','..tostring(money_type)..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end