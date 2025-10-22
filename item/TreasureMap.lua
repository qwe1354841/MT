--藏宝图配置和功能
TreasureMap = {}
--使用堆叠的宝图是否重新生成坐标
TreasureMap.StackReRandomPos = 1
TreasureMap.Config = {
	['MapKeyName'] = {"东海海湾","傲来村野","江南野外","大唐国境"},
	['藏宝图'] = {
		['ItemProbability'] = 80,
		['Item'] = {
			{ItemKey = "高级藏宝图碎片1", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片3", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片5", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 280},
			{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "人物染料", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "宠物染料", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "低级天赋秘籍包", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "中级天赋秘籍包", Num = 1, Bind = 0, Rand = 40},
			{ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand = 800},
			{ItemKey = "40级套装福袋", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "50级套装福袋", Num = 1, Bind = 0, Rand = 120},
			{ItemKey = "初级制造书", Num = 1, Bind = 0, Rand = 320},
			{ItemKey = "中级制造书", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "N礼包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "R礼包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "翅膀升级1", Num = 1, Bind = 0, Rand = 20},
			{ItemKey = "宠物经验丹", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "还原丹", Num = 1, Bind = 0, Rand = 560},
			{ItemKey = "百炼精铁50", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "百炼精铁60", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 800},
			{ItemKey = "强化保固石", Num = 1, Bind = 0, Rand = 320},
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 280},
			{ItemKey = "满怪卡2", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "双倍怪1", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "免遇敌卡", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "死亡替身", Num = 1, Bind = 0, Rand = 40},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 368},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "打造符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "缝纫符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "炼金符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "高级藏宝图碎片2", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片4", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 32},
		},
		['Even'] = {
		},
	},
	['高级藏宝图'] = {
		['ItemProbability'] = 99,
		['Item'] = {
			{ItemKey = "神兽虎碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "神兽羊碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "神兽牛碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "神兽鸡碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "神兽狗碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 0, Rand = 800},
			{ItemKey = "特殊宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "高级人物染料", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "高级宠物染料", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "神兽马碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "高级天赋秘籍包", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "高级宝石福袋", Num = 1, Bind = 0, Rand = 470},
			{ItemKey = "60级套装福袋", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "70级套装福袋", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "SSR礼包", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "超级宠物秘籍包", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "R礼包", Num = 1, Bind = 0, Rand = 300},
			{ItemKey = "SR礼包", Num = 1, Bind = 0, Rand = 300},
			{ItemKey = "宠物经验丹", Num = 1, Bind = 0, Rand = 400},
			{ItemKey = "还原丹", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "高级还原丹", Num = 1, Bind = 0, Rand = 300},
			{ItemKey = "超级还原丹", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石2", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "强化保固石", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "修炼丹", Num = 1, Bind = 0, Rand = 480},
			{ItemKey = "50物理系法宝", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "50魔法系法宝", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "神兽碎片包", Num = 1, Bind = 0, Rand = 850},
			{ItemKey = "双倍怪1", Num = 1, Bind = 0, Rand = 0},
			{ItemKey = "双倍经验点", Num = 1, Bind = 0, Rand = 0},
			{ItemKey = "神兽猪碎片", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "翅膀升级2", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "翅膀升级3", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 0},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 300},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 150},
			{ItemKey = "随机神兽碎片", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "极品宝石福袋", Num = 1, Bind = 0, Rand = 100},
		},
		['Even'] = {
		},
	},
	['绑定藏宝图'] = {
		['ItemProbability'] = 99,
		['Item'] = {
			{ItemKey = "高级藏宝图碎片1", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片3", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片5", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 280},
			{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "人物染料", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "宠物染料", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "低级天赋秘籍包", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "中级天赋秘籍包", Num = 1, Bind = 0, Rand = 40},
			{ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand = 800},
			{ItemKey = "40级套装福袋", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "50级套装福袋", Num = 1, Bind = 0, Rand = 120},
			{ItemKey = "初级制造书", Num = 1, Bind = 0, Rand = 320},
			{ItemKey = "中级制造书", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "N礼包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "R礼包", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "翅膀升级1", Num = 1, Bind = 0, Rand = 20},
			{ItemKey = "宠物经验丹", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "还原丹", Num = 1, Bind = 0, Rand = 560},
			{ItemKey = "百炼精铁50", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "百炼精铁60", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 800},
			{ItemKey = "强化保固石", Num = 1, Bind = 0, Rand = 320},
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 280},
			{ItemKey = "满怪卡2", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "双倍怪1", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "免遇敌卡", Num = 1, Bind = 0, Rand = 160},
			{ItemKey = "死亡替身", Num = 1, Bind = 0, Rand = 40},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 368},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 100},
			{ItemKey = "打造符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "缝纫符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "炼金符", Num = 1, Bind = 0, Rand = 600},
			{ItemKey = "高级藏宝图碎片2", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "高级藏宝图碎片4", Num = 1, Bind = 0, Rand = 80},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 10},
			{ItemKey = "装备强化石", Num = 1, Bind = 0, Rand = 32},
		},
		['Even'] = {
		},
	},
}
-- 创建物品 
function TreasureMap.on_item_create(item)
    if item == nil then
        return
    end
	if TreasureMap.Config['MapKeyName'] ~= nil and #TreasureMap.Config['MapKeyName'] > 0 then
		local map_keyname = TreasureMap.Config['MapKeyName'][math.random(1,#TreasureMap.Config['MapKeyName'])]
		local TreasureMap = sMapSystem:GetMapByKey(map_keyname)
		if not TreasureMap then
			sLuaApp:LuaDbg("TreasureMap.on_item_create: TreasureMap is nil")
			return
		end
		local x = math.floor(TreasureMap:GetWidth()/2)
		local y = math.floor(TreasureMap:GetHeight()/2)
		local range = math.min(x,y)-20
		local tb = sMapSystem:GetRandomPoint(TreasureMap,x,y,range)
		for k,v in pairs(tb) do
			sLuaApp:LuaDbg("TreasureMap.on_item_create: k = "..k)
			sLuaApp:LuaDbg("TreasureMap.on_item_create: v = "..v)
		end
		local TreasureMap_PosX = tb['x']
		local TreasureMap_PosY = tb['y']
		item:SetInt("TreasureMap_PosX",TreasureMap_PosX)
		item:SetInt("TreasureMap_PosY",TreasureMap_PosY)
		item:SetString("TreasureMap_MapKeyName",map_keyname)
	else
		sLuaApp:LuaDbg("TreasureMap.on_item_create: TreasureMap.Config[MapKeyName] is nil or #TreasureMap.Config[MapKeyName] <= 0")
		TreasureMap.on_item_destroy(item)
	end
end

-- 销毁物品
function TreasureMap.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function TreasureMap.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end	
	--if 0 >= Lua_tools.GetBagFree(player) then
	--	sLuaApp:NotifyTipsMsg(player,"背包已满")
	--	return false
	--end
	if player:GetInt("Assist_GoOn") == 1 then
		sLuaApp:NotifyTipsMsg(player, "正在辅助中，无法使用该物品！")
		return false
	end
	return true
end

-- 使用物品
function TreasureMap.on_use_item(player, item, count)
    if item == nil then
        return
    end
	local TreasureMap_MapKeyName = item:GetString("TreasureMap_MapKeyName")
	local TreasureMap = sMapSystem:GetMapByKey(TreasureMap_MapKeyName)
	if not TreasureMap then
		sLuaApp:LuaDbg("TreasureMap.on_use_item: TreasureMap is nil")
		return
	end
	local TreasureMap_ID = TreasureMap:GetId()
	local TreasureMap_PosX = item:GetInt("TreasureMap_PosX")
	local TreasureMap_PosY = item:GetInt("TreasureMap_PosY")
	sLuaApp:LuaDbg("TreasureMap.on_use_item: item:GetGUID() = "..item:GetGUID())
	local FormStr = [[
		MainUI.CloseOtherWnds()
		CL.StartMove(]]..TreasureMap_PosX..[[, CL.ChangeLogicPosZ(]]..TreasureMap_PosY..[[, ]]..TreasureMap_ID..[[), ]]..TreasureMap_ID..[[,eRoleHeadFlag.Pathfinding)
        CL.SetMoveEndAction(MoveEndAction.Treasure, ']]..item:GetGUID()..[[')
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)

end

function TreasureMap.move_end(player,item_guid)
	sLuaApp:LuaDbg("TreasureMap.move_end: item_guid = "..item_guid)
	local guid = TreasureMap.panduan(player ,item_guid)
	sLuaApp:LuaDbg("TreasureMap.move_end: guid = "..guid)
	if guid ~= "" then
		local FormStr = [[		
			MainUI.ShowTreasureTip(']]..guid..[[')
		]]
		sLuaApp:ShowForm(player, "脚本表单", FormStr)
		sLuaApp:LuaDbg("TreasureMap.move_end: guid send form")
	end
end

function TreasureMap.main(player,timerId,item_guid)
	local guid = TreasureMap.panduan(player ,item_guid)
	if guid == "" then
		sLuaApp:LuaDbg("TreasureMap.main: guid is nil")
		return
	end
	local item = sItemSystem:GetItemByGUID(guid)
	local item_KeyName = item:GetKeyName()
	if TreasureMap.Config[item_KeyName] then
		if TreasureMap.Config[item_KeyName]['ItemProbability'] then
			local ItemProbability = TreasureMap.Config[item_KeyName]['ItemProbability']
			if ItemProbability > 100 then
				ItemProbability = 100
			end
			if ItemProbability < 0 then
				ItemProbability = 0
			end
			if ItemProbability >= math.random(1,100) then
				local reward = Lua_tools.PlayerStartRandom(TreasureMap.Config[item_KeyName]['Item'], "Gift_"..item_KeyName, 1)
				if reward[1] ~= "Nil" then
					sItemSystem:ConsumeItem(item,1,"宝图系统",""..item_KeyName,"获得奖励")
					Lua_tools.AddItem(player, reward, "TreasureMap", item_KeyName, "")
				else
					sLuaApp:LuaDbg("TreasureMap.main: give item is fail")
				end
			else
				--放妖王
				sLuaApp:LuaDbg("YaoWang")
				if YaoWang then
					YaoWang.main(player)
					sItemSystem:ConsumeItem(item,1,"宝图系统",""..item_KeyName,"获得奖励")
				end
			end
			if SeasonPassQuestFunc then
				local itemKeyName = item:GetKeyName()
				--sLuaApp:LuaWrn("itemKeyName = "..itemKeyName)
				if itemKeyName == "藏宝图" then
					SeasonPassQuestFunc.UpdateQuestProgress(player, 12)
				elseif itemKeyName == "高级藏宝图" then
					SeasonPassQuestFunc.UpdateQuestProgress(player, 13)
				end
			end
			if Act_HuoDongZhanLing then
				Act_HuoDongZhanLing.TaskFinishBack(player,"藏宝图")
			end
			-- 重新随机坐标
			if TreasureMap.StackReRandomPos and TreasureMap.StackReRandomPos == 1 and item then
				TreasureMap.on_item_create(item)
			end
			TreasureMap.autouse(player,item_KeyName)
		else
			sLuaApp:LuaDbg("TreasureMap.main: TreasureMap.Config["..item_KeyName.."][ItemProbability] is nil")
		end
	else
		sLuaApp:LuaDbg("TreasureMap.main: TreasureMap.Config["..item_KeyName.."]  is nil")
	end
end
function TreasureMap.autouse(player,item_KeyName)
	local item_id = sItemSystem:GetItemIdByKeyname(item_KeyName)
	local item_list = sItemSystem:GetItemList(player,item_id,3)
	if #item_list > 0 then
		TreasureMap.on_use_item(player, item_list[1], 1)
	end
end
function TreasureMap.panduan(player ,item_guid)
	sLuaApp:LuaDbg("TreasureMap.panduan: item_guid = "..item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item then
		local map = player:GetMap()
		if not map then	
			sLuaApp:LuaDbg("TreasureMap.panduan: map is nil")
			return ""
		end
		
		local TreasureMap_MapKeyName = item:GetString("TreasureMap_MapKeyName")
		local TreasureMap_PosX = item:GetInt("TreasureMap_PosX")
		local TreasureMap_PosY = item:GetInt("TreasureMap_PosY")
		local player_PosX = sMapSystem:GetPosX(player) 
		local player_PosY = sMapSystem:GetPosY(player) 
		
		sLuaApp:LuaDbg(type(map:GetKeyName()))
		sLuaApp:LuaDbg(type(TreasureMap_MapKeyName))
		
		if tostring(map:GetKeyName()) == tostring(TreasureMap_MapKeyName) then
			sLuaApp:LuaDbg("TreasureMap.panduan: map:GetKeyName() == TreasureMap_MapKeyName")
			if (math.pow((TreasureMap_PosX - player_PosX), 2) + math.pow((TreasureMap_PosY - player_PosY), 2)) <= 9 then
				return item:GetGUID()
			else
				sLuaApp:LuaDbg("TreasureMap.panduan: is so far")
			end
		else
			sLuaApp:LuaDbg("TreasureMap.panduan: map:GetKeyName() ~= TreasureMap_MapKeyName")
		end
	else
		sLuaApp:LuaDbg("TreasureMap.panduan: item is nil")
	end
	return ""
end