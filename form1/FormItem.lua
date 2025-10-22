--物品相关表单

FormItem = {}

function FormItem.QueryItem(player, item_guid)
	if player == nil then
		return ""
	end

	local code = sItemSystem:QueryItem(player, item_guid)
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "查询物品不存在")
	end
	return ""
end
