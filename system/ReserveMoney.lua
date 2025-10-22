--仓库银币
ReserveMoney = {}

--@newinter ReserveMoney.AddWarehouseGold(player, 1000)
--存储仓库银币
function ReserveMoney.AddWarehouseGold(player, val)
	--sLuaApp:LuaDbg("存储银币")
	local val = tonumber(val)
	local BindGoldVal = player:GetBindGold()
	--sLuaApp:LuaDbg("BindGoldVal："..BindGoldVal)
	if BindGoldVal >= val then
		local WarehouseGold = player:GetWarehouseGold()
		--sLuaApp:LuaDbg("WarehouseGold_before："..WarehouseGold)
		if player:AddWarehouseGold(val, "仓库系统", "玩家向仓库存储银币", "玩家向仓库存储银币增加仓库银币") then
			player:SubBindGold(val, "仓库系统", "玩家向仓库存储银币", "玩家向仓库存储银币扣除玩家身上的银币")
			sLuaApp:ShowForm(player, "脚本表单", "BagUI.RefreshWarehouse()")
			return ""
		else
			sLuaApp:LuaErr("FormReserveMoney.SubWarehouseGold 存储仓库银币失败")
			return ""
		end
	else
		sLuaApp:NotifyTipsMsg(player, "您身上的银币不足！")
		return ""
	end
	--sLuaApp:LuaDbg("BindGoldVal_after:"..player:GetBindGold())
	--sLuaApp:LuaDbg("WarehouseGold_after："..player:GetWarehouseGold())
end

--@newinter ReserveMoney.SubWarehouseGold(player, 2000)
--取出仓库银币
function ReserveMoney.SubWarehouseGold(player, val)
	--sLuaApp:LuaDbg("取出银币")
	local val = tonumber(val)
	local WarehouseGold = player:GetWarehouseGold()
	if val <= WarehouseGold then
		--sLuaApp:LuaDbg("WarehouseGold_before："..WarehouseGold)
		if player:SubWarehouseGold(val, "仓库系统", "玩家从仓库取出银币", "玩家从仓库取出银币减少仓库银币") then
			player:AddBindGold(val, "仓库系统", "玩家从仓库取出银币", "玩家从仓库取出银币增加玩家身上的银币")
			sLuaApp:ShowForm(player, "脚本表单", "BagUI.RefreshWarehouse()")
			return ""
		else
			sLuaApp:LuaErr("FormReserveMoney.SubWarehouseGold 取出仓库银币失败")
			return ""
		end
		--sLuaApp:LuaDbg("BindGoldVal_after:"..player:GetBindGold())
		--sLuaApp:LuaDbg("WarehouseGold_after："..player:GetWarehouseGold())
		return ""
	else
		sLuaApp:NotifyTipsMsg(player, "您仓库中的银币不足！")
		return ""
	end
end
