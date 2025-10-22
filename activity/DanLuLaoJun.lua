--丹炉活动兑换NPC
DanLuLaoJun = {}

-- 暗淡的金丹 -换奖励 太上老君的分身 

--兑换商店 活动商店名称 名称需要在ExchangeShopConfig.ActTab
DanLuLaoJun.ShopName = "金丹商店"
DanLuLaoJun.ShowItem = "61024,20100,31006"
--兑换npc配置
DanLuLaoJun.NpcConfig = {
	["NPCKeyName"] = "五一活动-老君分身",
	["Site"] = {"长安城", 225, 206}

}
-- 活动开始前回调
function DanLuLaoJun.OnDeclare(id, seconds)
end

-- 活动开始回调
function DanLuLaoJun.OnStart(id, is_normal)
	--判断活动NPC是否存在，是的话不反复OnStart
	if sVarSystem:GetInt("DanLuLaoJunNPCGUID") ~= 0 then return end
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，丹炉老君活动开启!")
	--设置开启活动商店
	if ExchangeShop then
		ExchangeShop.AddTabConfig(DanLuLaoJun.ShopName)
	else
		sLuaApp:LuaErr("DanLuLaoJun.OnStart缺少ExchangeShop")
	end
	if DanLuLaoJun.NpcConfig then
		local npc_id = NpcConfig.GetByKeyName(DanLuLaoJun.NpcConfig["NPCKeyName"]).Id
		local npc_site = DanLuLaoJun.NpcConfig["Site"]
		local map_id = MapConfig.GetByKeyName(npc_site[1]).Id
		local map = sMapSystem:GetMapById(map_id)
		local npc = sNpcSystem:CreateNpc(npc_id, map, npc_site[2], npc_site[3], 0, 4, 0)
		if npc then
			sVarSystem:SetInt("DanLuLaoJunNPCGUID", npc:GetGUID())
			npc:SetInt("DanLuLaoJunActID", id)
		else
			sLuaApp:LuaErr("DanLuLaoJun.OnStart生成npc失败")
		end
	end
end

-- 活动结束回调
function DanLuLaoJun.OnStop(id)
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，丹炉活动结束!")
	--设置关闭活动商店
	local npc = sNpcSystem:GetNpcByGUID(sVarSystem:GetInt("DanLuLaoJunNPCGUID"))
	sNpcSystem:DestroyNpc(npc)
	sVarSystem:SetInt("DanLuLaoJunNPCGUID", 0)
	ExchangeShop.DelTabConfig(DanLuLaoJun.ShopName)
end

-- 玩家点击参与活动回调
function DanLuLaoJun.OnJoin(id, player)
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "老道不屑于接见等级低于"..level_min.."级的无名之辈!")
		return
	end
	local npc_site = DanLuLaoJun.NpcConfig["Site"]
	local map_id = MapConfig.GetByKeyName(npc_site[1]).Id
	local map = sMapSystem:GetMapById(map_id)
	if Lua_tools.Jump(player, map, npc_site[2], npc_site[3], 5) then
		local str = [[
			GUI.CloseWnd("ActivityPanelUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
	end
end

-- 玩家客户端查询数据回调
function DanLuLaoJun.OnQuery(id, player)
	local show_item = DanLuLaoJun.ShowItem or "61024,20100,31006"
	local str = "0:0:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("DanLuLaoJun") or "2,3,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end