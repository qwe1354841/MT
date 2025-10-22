--跳转道具
JumpMapItem = {}

--跳转道具列表
local jumpItemList={
	['紫金灵丸'] = 10045,
	['乌金灵丸'] = 10045,
	['攻守之魂'] = 10024,
	['驱逐令'] = 20040,
	['叛逃令'] = 20040,
	["菩提子"]=20091,
	["再造丸"]=20091,
	["三味炼炉"]=20091,
	["寒蚕丝轴"]=20091,
	["仙尘玉玦"]=20091,
	["欢喜散"]=20091,
}


-- 创建物品
function JumpMapItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function JumpMapItem.on_item_destroy(item)
    if item == nil then
        return
    end
end
-- 使用物品前
function JumpMapItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	if player:GetInt("Assist_GoOn") == 1 then
		sLuaApp:NotifyTipsMsg(player, "正在辅助中，无法使用该物品！")
		return false
	end
	sLuaApp:LuaDbg("自动寻路")
	local item_name = item:GetKeyName()
	--下面item只需要根据上面的配置即可
	if jumpItemList[item_name] then
		--自动寻路
		sLuaApp:LuaDbg("自动寻路")
		Lua_tools.MoveToNpc(player, jumpItemList[item_name])

	end

	--下面item跳转需要特定的方法
	if item_name == "开箱子普通钥匙" or item_name == "开箱子花钱钥匙" then
		if XianShouFuYuan then
			local id = sVarSystem:GetInt("ACTIVITY_XianShouFuYuan_ID")
			if id == 0 then
				sLuaApp:NotifyTipsMsg(player, "活动尚未开启！")
				return false
			else
				XianShouFuYuan.OnJoin(id, player)
			end
		end
	end
	return  false
end

-- 使用物品
function JumpMapItem.on_use_item(player,item,count)
    if item == nil then
        return
    end
end

