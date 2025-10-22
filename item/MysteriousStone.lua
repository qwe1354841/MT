-- 神秘宝石
MysteriousStone={}

-- 宝石初始配置
MysteriousStone.Config = {
	[21104] = {5001, 5011, 5106, 5201, 5211, 5306, 5401, 5411},
	[21105] = {5002, 5012, 5107, 5202, 5212, 5307, 5402, 5412},
	[21106] = {5003, 5013, 5108, 5203, 5213, 5308, 5403, 5413},
	[21107] = {5004, 5014, 5109, 5204, 5214, 5309, 5404, 5414},
	[21108] = {5005, 5015, 5110, 5205, 5215, 5310, 5405, 5415},
	[21109] = {5006, 5101, 5111, 5206, 5301, 5311, 5406, 5501},
	[21110] = {5007, 5102, 5112, 5207, 5302, 5312, 5407, 5502},
	[21113] = {5008, 5103, 5113, 5208, 5303, 5313, 5408, 5503},
	[21114] = {5009, 5104, 5114, 5209, 5304, 5314, 5409, 5504},
	[21115] = {5010, 5105, 5115, 5210, 5305, 5315, 5410, 5505},
}

-- 
-- 创建物品
function MysteriousStone.on_item_create(item)
    if item == nil then
        return
	end
end

-- 销毁物品
function MysteriousStone.on_item_destroy(item)
	if item == nil then
		return
	end
end

-- 使用物品前
function MysteriousStone.on_pre_use_item(player,item,count)
	if item == nil then
		return false
	end

	if Lua_tools.GetBagFree(player) == 0 then
		sLuaApp:NotifyTipsMsg(player, "包裹已满，请清理再试")
		return false
	end

	return true
end

-- 使用物品
function MysteriousStone.on_use_item(player, item, count)
	if player == nil then
		return 
	end

	if item == nil then
		return
	end

	if count > 1 then
        sLuaApp:NotifyTipsMsgEx(player, "神秘宝石不能批量使用")
		return
	end

	local item_id = item:GetId()
	local is_bind = item:IsBound()
	local row = MysteriousStone.Config[item_id]
	if row == nil then
		sLuaApp:NotifyTipsMsgEx(player, "神秘宝石：找不到配置")
		return
	end

	local len = #row
	local idx = sLuaApp:RandInteger(1, len)
	local stone_id = row[idx]
	if stone_id == nil then
		sLuaApp:NotifyTipsMsgEx(player, "神秘宝石：找不到目标宝石")
		return
	end

	local gem_row = GemStone.Config[stone_id]
	if gem_row == nil then
		sLuaApp:NotifyTipsMsgEx(player, "神秘宝石：找不到目标宝石配置")
		return
	end

	local value = sLuaApp:RandInteger(gem_row.SpecialValueLow, gem_row.SpecialValueTop)
	local gem = sItemSystem:CreateItem(stone_id, 1, is_bind)
	if gem == nil then
		sLuaApp:NotifyTipsMsgEx(player, "神秘宝石：创建宝石失败")
		return
	end

	gem:SetInt("GemValue", value)
	local code = sItemSystem:AddItem(player, gem, "装备系统", "神秘宝石生成", "")
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "神秘宝石：添加失败")
		return
	end
end