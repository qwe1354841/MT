-- 积分物品
IntegralItem={}

--[物品keyname]={
	--Type = 1 FuncName 表示接口名 2 FuncName 表示player Int
	--Num 单个物品添加点数
	--ShowName tips显示名字
--}
IntegralItem.Config = {
	["战功牌"] = {["Type"] = 1,["FuncName"] = "AddPvp", ["Num"] = 1,["ShowName"] = "战功点"},
	["双倍经验点"] = {["Type"] = 2,["FuncName"] = "FreezeDoubleExpPoint", ["Num"] = 100,["ShowName"] = "双倍经验点"},
	["活动辅助丹"] = {["Type"] = 2,["FuncName"] = "Assist_AssistPoint", ["Num"] = 200,["ShowName"] = "侠义值"},
	["侠义金丹"] = {["Type"] = 2,["FuncName"] = "Assist_AssistPoint", ["Num"] = 300,["ShowName"] = "侠义值"},
	["测试用大辅助丹"] = {["Type"] = 2,["FuncName"] = "Assist_AssistPoint", ["Num"] = 1000,["ShowName"] = "侠义值"},
	["活动辅助丹2"] = {["Type"] = 2,["FuncName"] = "Assist_AssistPoint", ["Num"] = 100,["ShowName"] = "侠义值"},
	["贸易票据"] = {["Type"] = 2,["FuncName"] = "TradeIntegral", ["Num"] = 1,["ShowName"] = "贸易票据"},
	["帮派宝券"] = {["Type"] = 1,["FuncName"] = "AddGuildContribute", ["Num"] = 50,["ShowName"] = "帮贡"},
	["离线摆摊符"] = {["Type"] = 2,["FuncName"] = "Stall_OfflineTimeExtra", ["Num"] = 3600,["ShowName"] = "离线摆摊时间"},
}
-- 创建物品 
function IntegralItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function IntegralItem.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function IntegralItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end	
	local Item_Name=item:GetKeyName()
	if Item_Name == "双倍经验点" and DoubleExp then
		return DoubleExp.CheckMax(player)
	end
	if not IntegralItem.Config[Item_Name] then
		sLuaApp:NotifyTipsMsg(player, "无法使用")
		return false
	end
	return true
end

-- 使用物品
function IntegralItem.on_use_item(player, item, count)
    if item == nil then
        return
    end
	local Item_Name=item:GetKeyName()
	local config = IntegralItem.Config[Item_Name]
	local num = count * config["Num"]
	if config["Type"] == 1 then
		assert(load("local player = sPlayerSystem:GetPlayerByGUID('"..player:GetGUID().."') return player:"..config["FuncName"].."("..num..",'system','"..Item_Name.."','')"))()
		if OfficialPosition then
			OfficialPosition.UpPosition(player)
		end	
	elseif config["Type"] == 2 then
		sLogServerSystem:LogToServer(0, player, "使用积分物品", player:GetInt(config["FuncName"]), player:GetInt(config["FuncName"]) + num, "获得"..config["ShowName"], "改变自定义变量Int".. config["FuncName"])
		player:SetInt(config["FuncName"], player:GetInt(config["FuncName"]) + num)
	end
	sLuaApp:NotifyTipsMsg(player, "恭喜获得"..num.."点"..config["ShowName"])
	
	if Item_Name == "双倍经验点" and DoubleExp then
		DoubleExp.GetData(player)
	end
end