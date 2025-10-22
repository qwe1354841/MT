--人参树活动
GinSengTree = {}

GinSengTree.Global = {
	--消耗道具金击子修改为其他道具时，在OneKeyBuy的配置中添加该道具的快捷购买配置，若OneKeyBuy中已有该道具的配置则无需添加
	[1] = {Tap = "金锥", Consume = {Type = "2", UseItem = {keyName = "金击子", Id = 29822}, UseNum = {0, 1, 2, 3, 4, 5, 10}}},
	[2] = {Tap = "金元", Consume = {Type = "1", MoneyType = {1, 1900001410}, UseNum = {0, 100, 300, 500, 700, 900, 1500}}},
	[3] = {Tap = "银元", Consume = {Type = "1", MoneyType = {2, 1800408260}, UseNum = {0, 100, 300, 500, 700, 900, 1500}}},
}

GinSengTree.Version = "0821.30"

--奖池可自选，分档位，自选内容可配置， 不同单位自选数量也可配置， 对应概率也可配置
--奖池N个物品，总计抽N次，每次价格可配置，消耗资源或道具可配置，每个物品概率可配置，N个物品概率总计100%
--可配置每次消耗资源数量，当数量为0时，则免费

GinSengTree.ItemConfig = {
	["金锥"] = {
		{ItemKey = "装备强化石", Bind = false, num = 20, Draw = 1, x = 620, y = 55, Rand = 10},
		{ItemKey = "装备强化石2", Bind = false, num = 15, Draw = 1, x = 480, y = 55, Rand = 130},
		{ItemKey = "强化保固石", Bind = false, num = 20, Draw = 1, x = 240, y = 230, Rand = 220},
		{ItemKey = "70书铁", Bind = false, num = 15, Draw = 1, x = 360, y = 350, Rand = 340},
		{ItemKey = "80书铁", Bind = false, num = 15, Draw = 1, x = 880, y = 295, Rand = 100},
		{ItemKey = "90书铁", Bind = false, num = 15, Draw = 1, x = 720, y = 320, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 420, y = 220, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 320, y = 110, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 550, y = 180, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 700, y = 200, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 780, y = 90, Rand = 150},
		{ItemKey = "100书铁", Bind = false, num = 5, Draw = 1, x = 850, y = 190, Rand = 150},
	},
	["金元"] = {
		{ItemKey = "重剑书70", Bind = false, num = 1, Draw = 1, x = 620, y = 55, Rand = 200},
		{ItemKey = "扇子书70", Bind = false, num = 1, Draw = 1, x = 480, y = 55, Rand = 250},
		{ItemKey = "笛子书70", Bind = false, num = 1, Draw = 1, x = 240, y = 230, Rand = 250},
		{ItemKey = "阔刀书70", Bind = false, num = 1, Draw = 1, x = 850, y = 250, Rand = 270},
		{ItemKey = "西海龙宫120天赋1", Bind = false, num = 1, Draw = 1, x = 320, y = 110, Rand = 10},
		{ItemKey = "西海龙宫120天赋2", Bind = false, num = 1, Draw = 1, x = 430, y = 200, Rand = 10},
		{ItemKey = "西海龙宫120天赋3", Bind = false, num = 1, Draw = 1, x = 700, y = 200, Rand = 10},
		{ItemKey = "西海龙宫120天赋2", Bind = false, num = 1, Draw = 1, x = 780, y = 90, Rand = 10},
	},
	["银元"] = {
		{ItemKey = "修炼丹", Bind = false, num = 50, Draw = 1, x = 680, y = 65, Rand = 10},
		{ItemKey = "花果山80天赋1", Bind = false, num = 1, Draw = 1, x = 540, y = 55, Rand = 50},
		{ItemKey = "花果山80天赋2", Bind = false, num = 1, Draw = 1, x = 270, y = 200, Rand = 200},
		{ItemKey = "花果山80天赋3", Bind = false, num = 1, Draw = 1, x = 550, y = 300, Rand = 500},
		{ItemKey = "4级魔攻石", Bind = false, num = 5, Draw = 1, x = 400, y = 100, Rand = 600},
		{ItemKey = "4级攻击石", Bind = false, num = 5, Draw = 1, x = 550, y = 180, Rand = 20},
		{ItemKey = "4级物抗石", Bind = false, num = 5, Draw = 1, x = 700, y = 200, Rand = 150},
		{ItemKey = "百炼精铁80", Bind = false, num = 15, Draw = 1, x = 820, y = 150, Rand = 45},
		{ItemKey = "4级生命石", Bind = false, num = 5, Draw = 1, x = 850, y = 280, Rand = 76},
		{ItemKey = "4级暴击石", Bind = false, num = 5, Draw = 1, x = 420, y = 220, Rand = 84},
	},
}

--玩家最小参与等级
GinSengTree.MinLevel = 10

--活动界面 展示奖励 物品id
GinSengTree.ShowItem = "31402,61007,31002,20158"

-- 活动开始前回调
function GinSengTree.OnDeclare(id, seconds)
end
 
-- 活动开始回调
function GinSengTree.OnStart(id, is_normal)

end

-- 活动结束回调
function GinSengTree.OnStop(id)
    
end

--@newinter GinSengTree.OpenACTWnd(player)
function GinSengTree.OpenACTWnd(player)
	local remainTime = GinSengTree.TimeShow(player)
	--sLuaApp:LuaDbg("remainTime:"..remainTime)
	local str = [[
		GUI.OpenWnd("GinSengTreeUI")
		if GinSengTreeUI then
			GinSengTreeUI.RefreshTimetext(]]..remainTime..[[)
		end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--玩家点击参与回调
function GinSengTree.OnJoin(id, player)
    if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return
    end

	local activityData = ActivityConfig.GetById(id)
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(activityData.LevelMin) then
        sLuaApp:NotifyTipsMsg(player, "达到"..activityData.LevelMin.."级才能参加")
        return
    end
	
	local remainTime = GinSengTree.TimeShow(player)
	--sLuaApp:LuaDbg("remainTime:"..remainTime)

    local str = [[
        GUI.CloseWnd("ActivityPanelUI")
		GUI.OpenWnd("GinSengTreeUI")
		if GinSengTreeUI then
			GinSengTreeUI.RefreshTimetext(]]..remainTime..[[)
		end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function GinSengTree.TimeShow(player)
	local residue_weekday = 7 - sLuaApp:WeekDay(0)
	return residue_weekday * 24 * 60 * 60 + sLuaApp:GetTodayRemain()
end

--玩家客户端查询数据回调
function GinSengTree.OnQuery(id, player)
	local str = "0:0:0:0:"..GinSengTree.ShowItem..":2:"..ActivitySystem.Act_GetClassify("GinSengTree")
	
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--获取物品列表
function GinSengTree.GetGinSengTreeData(player, tap)
	local tap = tonumber(tap) or 1
	--sLuaApp:LuaDbg("传来的tap值为："..tap)
	local Global = GinSengTree.Global[tap]
	local ItemList = GinSengTree.Initialize(player, tap)
	local str = ""
	
	if Global["Consume"]["Type"] == "1" then
		str = [[
			if GinSengTreeUI then
				GinSengTreeUI['ItemData_]]..tap..[['] = ]]..Lua_tools.serialize(ItemList)..[[
				GinSengTreeUI.ConsumeType = 'Money'
				GinSengTreeUI.Version = ]]..GinSengTree.Version..[[
				GSTGLOBALDATA = ]]..Lua_tools.serialize(GinSengTree.Global)..[[
				GinSengTreeUI['ConsumeNum_]]..tap..[['] = ]]..tostring(Global["Consume"]["UseNum"][tonumber(player:GetWeekInt("Player_Consume_Index"..tap)+1)])..[[
				GinSengTreeUI.Refresh(]]..tap..[[)
			end
		]]
	elseif Global["Consume"]["Type"] == "2" then
		str = [[
			if GinSengTreeUI then
				GinSengTreeUI['ItemData_]]..tap..[['] = ]]..Lua_tools.serialize(ItemList)..[[
				GinSengTreeUI.ConsumeType = 'Item'
				GinSengTreeUI.Version = ]]..GinSengTree.Version..[[
				GSTGLOBALDATA = ]]..Lua_tools.serialize(GinSengTree.Global)..[[
				GinSengTreeUI['ConsumeNum_]]..tap..[['] = ]]..tostring(Global["Consume"]["UseNum"][tonumber(player:GetWeekInt( "Player_Consume_Index"..tap)+1)])..[[
				GinSengTreeUI.Refresh(]]..tap..[[)
			end
		]]
	end
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--扣除道具
--Draw字段通过Initialize方法记录玩家是否已经领取过该奖励
function GinSengTree.SubConsume(player, tap)
	sLuaApp:LuaDbg("回调subconsume")
	local tap = tonumber(tap) or 1
	local Global = GinSengTree.Global[tap]
	local ItemList = GinSengTree.Initialize(player, tap)
	local index = 1
	local count = 0
	for k, v in ipairs(ItemList) do
		if v["Draw"] == 2 then
			index = index + 1
			count = count + 1
		end
	end
	--sLuaApp:LuaDbg("index值"..index)
	if index > #ItemList then
		sLuaApp:NotifyTipsMsg (player, "人参果树上面的奖品已经被抽完了")
		return ""
	end
	
	if index > #Global["Consume"]["UseNum"] then
		index = #Global["Consume"]["UseNum"]
	end
	
	--sLuaApp:LuaDbg("index值"..index)
	local UseNum = 0
	UseNum = Global["Consume"]["UseNum"][tonumber(index)]
	
	count = #ItemList - count
	
	--sLuaApp:LuaDbg("UseNum"..UseNum)
	if Global["Consume"]["Type"] == "1" then
		--sLuaApp:LuaDbg("判断消耗类型为1")
		--sLuaApp:LuaDbg("MoneyType:"..Global["Consume"]["MoneyType"][1])
		if Lua_tools.SubMoney(player, Global["Consume"]["MoneyType"][1], UseNum) then
		--if PlayerSubMoney(player, Global["Consume"]["MoneyType"][1], UseNum) then
			--sLuaApp:LuaDbg("进入DrawReward")
			GinSengTree.DrawReward(player, tap, count)
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(Global["Consume"]["MoneyType"][1]).."不足，无法继续抽取")
			return ""
		end
	elseif Global["Consume"]["Type"] == "2" then
		--sLuaApp:LuaDbg("判断消耗类型为2")
		local subitem_list = {Global["Consume"]["UseItem"]["keyName"], UseNum}
		--sLuaApp:LuaDbg(Lua_tools.serialize(subitem_list))
		if Lua_tools.SubItem(player, subitem_list, "系统", "人参果树活动", "人参果树活动抽奖扣除道具") then
		--if lualib:Player_RemoveItem(player, Global["Consume"]["UseItem"]["Id"], UseNum) then
			--sLuaApp:LuaDbg("进入DrawReward")
			GinSengTree.DrawReward(player, tap, count)
		else
			--sLuaApp:NotifyTipsMsg(player, "您的道具数量不足")
			if OneKeyBuy then
				OneKeyBuy.Main(player, subitem_list)
			end
			return ""
		end
	end
	local ItemList = GinSengTree.Initialize(player, tap)
	if tonumber(index+1) > #Global["Consume"]["UseNum"] then
		index = tonumber(#Global["Consume"]["UseNum"]-1)
	end
	
	local rollTable = {}
	for k ,v in ipairs(ItemList) do	
		if v["Draw"] == 1 then
			table.insert(rollTable, k)
		end
	end
	local randerList = {}
	for i=1, #rollTable do
		local rander = sLuaApp:RandInteger(1, #rollTable)
		table.insert(randerList, rander)
	end
	player:SetWeekInt("Player_Consume_Index"..tap, index)
	local str = [[
		if GinSengTreeUI then
			GinSengTreeUI['ItemData_]]..tap..[['] = ]]..Lua_tools.serialize(ItemList)..[[
			GinSengTreeUI['DrawIndex_]]..tap..[['] = ]]..tostring(index)..[[
			GinSengTreeUI['ConsumeNum_]]..tap..[['] = ]]..tostring(Global["Consume"]["UseNum"][tonumber(index+1)])..[[
			GinSengTreeUI['LastItemIndex_]]..tap..[['] = ]]..player:GetWeekInt("Player_LastItem_Index"..tap)..[[
			GinSengTreeUI.RollLight(]]..Lua_tools.serialize(randerList)..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--lualib:ShowFormWithContent(player, "脚本表单", ""..str)
	return ""
end

--抽奖
function GinSengTree.DrawReward(player, tap, count)
	if type(count) ~= "number" then
		return
	end
	sLuaApp:LuaDbg("抽奖逻辑")
	local ItemList = GinSengTree.Initialize(player, tap)
	local randCount = 0
	local RandTable = {}
	for k, v in ipairs(ItemList) do
		if v["Draw"] == 1 then
			randCount = randCount + v["Rand"]
			table.insert(RandTable, randCount)
		end
	end
	table.sort(RandTable)
	if #RandTable == 0 then
		return
	end
	local rander = sLuaApp:RandInteger(tonumber(RandTable[1]), randCount)
	--sLuaApp:LuaDbg("rander:"..rander)
	if #RandTable > 1 then
		for i = 1, #RandTable do
			if rander > RandTable[i] and rander <= RandTable[i+1] then
				for k ,v in ipairs(ItemList) do
					if v["Draw"] == 1 then
						if v["Rand"] == RandTable[i+1] - RandTable[i] then
							if v["ItemKey"] then
								if GinSengTree.GiveReward(player, v["ItemKey"], "Item", v["num"], v["Bind"], count) then
									player:SetWeekInt("Player_LastItem_Index"..tap, k)
									v["Draw"] = 2 
									player:SetWeekInt("Player_HaveDraw_"..tap.."_index_"..k, 2)
								end
							elseif v["petkey"] then
								if GinSengTree.GiveReward(v["petkey"], "Pet", v["num"], v["Bind"], count) then
									player:SetWeekInt("Player_LastItem_Index"..tap, k)
									v["Draw"] = 2 
									player:SetWeekInt("Player_HaveDraw_"..tap.."_index_"..k, 2)
								end
							end
						break
						end
					end
				end
			
			end
		end
	else
		for k ,v in ipairs(ItemList) do
			if v["Draw"] == 1 then
				if v["Rand"] == RandTable[1] then
					if v["ItemKey"] then
						if GinSengTree.GiveReward(player, v["ItemKey"], "Item", v["num"], v["Bind"], count) then
							player:SetWeekInt("Player_LastItem_Index"..tap, k)
							v["Draw"] = 2 
							player:SetWeekInt("Player_HaveDraw_"..tap.."_index_"..k, 2)
						end
					elseif v["petkey"] then
						if GinSengTree.GiveReward(player, v["petkey"], "Pet", v["num"], v["Bind"], count) then
							player:SetWeekInt("Player_LastItem_Index"..tap, k)
							v["Draw"] = 2 
							player:SetWeekInt("Player_HaveDraw_"..tap.."_index_"..k, 2)
						end
					end
				break
				end
			end
		end
	end
end

--给予抽到的奖品
function GinSengTree.GiveReward(player, keyName, itemType, num, bind, count)
	if type(num) ~= "number" then
		return
	end
	if itemType == "Item" then
		local itemData = ItemConfig.GetByKeyName(keyName)
		local item_num = math.ceil(num/itemData.StackMax)
		--if Lua_tools.GetBagFree(player) < item_num then
		--	sLuaApp:NotifyTipsMsg(player, "你没有足够的背包空间")
		--	return false
		--else
		--sLuaApp:LuaDbg("count值"..count)
		local times = (count * 410)
		--lualib:ClearTimer(player)
		--sLuaApp:LuaDbg("GiveRewardtimes:"..times)
		local timer = sLuaTimerSystem:AddTimerEx(player, tonumber(times), 1, "GinSengTree.DelayGiveReward", keyName..","..num..","..tostring(bind))
		
		if timer then
			player:SetTempInt("GinSengTree_DelayGiveRewardTimer", timer)
		end
		--sLuaApp:LuaDbg("抽到的物品为"..keyName)
		return true
		--end
	elseif itemType == "Pet" then
		if Lua_tools.GetPetBagFree(player) < num then
			sLuaApp:NotifyTipsMsg(player, "你没有足够的宠物栏位")
			return false
		else
			--sLuaApp:LuaDbg("count值"..count)
			local times = (count * 410)
			--lualib:ClearTimer(player)
			--sLuaApp:LuaDbg("GiveRewardtimes:"..times)
			local timer = sLuaTimerSystem:AddTimerEx(player, tonumber(times), 1, "GinSengTree.DelayGivePetReward", keyName..","..num..","..tostring(bind))
			if timer then
				player:SetTempInt("GinSengTree_DelayGiveRewardTimer", timer)
			end
			--sLuaApp:LuaDbg("抽到的物品为"..keyName)
			return true
			--local petData = PetConfig.GetByKeyName(keyName)
			--sPetSystem:AddPetEx(player, petData.Id, 0, bind, "系统", "人参果树活动", "人参果树活动抽奖给予宠物")
			--sLuaApp:Player_AddPet(player, keyName, 0, bind, 0)
			--return true
		end
	end

end

--延迟发放宠物
function GinSengTree.DelayGivePetReward(player, timer_id, param)
	if type(timer_id) ~= "number" then
		return
	end
	local param_list = sLuaApp:StrSplit(param, ",")
	local keyName = param_list[1]
	local num = tonumber(param_list[2])
	local bind = param_list[3]
	--sLuaApp:LuaDbg("DelayGiveReward"..keyName)
	if bind == "true" then
		bind = 1
	elseif bind == "false" then
		bind = 0
	end
	local petData = PetConfig.GetByKeyName(keyName)
	sPetSystem:AddPetEx(player, petData.Id, 0, bind, "系统", "人参果树活动", "人参果树活动抽奖给予宠物")
	if player:GetTempInt("GinSengTree_DelayGiveRewardTimer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player:GetTempInt('GinSengTree_DelayGiveRewardTimer')) then
			sLuaTimerSystem:DisableTimer(player:GetTempInt('GinSengTree_DelayGiveRewardTimer'))
		end
		player:SetTempInt("GinSengTree_DelayGiveRewardTimer",0)
	end	
end

--延迟发放道具
function GinSengTree.DelayGiveReward(player, timer_id, param)
	--sLuaApp:LuaDbg("timer_id:"..timer_id.."   type:"..type(timer_id))
	--sLuaApp:LuaDbg("param:"..param)
	if type(timer_id) ~= "number" then
		return
	end
	local param_list = sLuaApp:StrSplit(param, ",")
	local keyName = param_list[1]
	local num = tonumber(param_list[2])
	local bind = param_list[3]
	--sLuaApp:LuaDbg("DelayGiveReward"..keyName)
	if bind == "true" then
		bind = 1
	elseif bind == "false" then
		bind = 0
	end
	Lua_tools.AddItem(player, {keyName, num, bind}, "系统", "人参果树活动", "人参果树活动抽奖给予道具")
	if player:GetTempInt("GinSengTree_DelayGiveRewardTimer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player:GetTempInt('GinSengTree_DelayGiveRewardTimer')) then
			sLuaTimerSystem:DisableTimer(player:GetTempInt('GinSengTree_DelayGiveRewardTimer'))
		end
		player:SetTempInt("GinSengTree_DelayGiveRewardTimer",0)
	end	
end

--初始化物品列表
function GinSengTree.Initialize(player, tap)
	--lualib:Error("初始化")
	local tap = tonumber(tap) or 1
	local Global = GinSengTree.Global[tap]
	local ItemList = GinSengTree.ItemConfig[Global["Tap"]]
	for i = 1 , #ItemList do
		if player:GetWeekInt("Player_HaveDraw_"..tap.."_index_"..i) == 2 then
			--player:SetWeekInt("Player_HaveDraw_"..tap.."_index_"..i, 1)
			--player:SetWeekInt("Player_Consume_Index"..tap, 1)
			ItemList[i]["Draw"] = 2
		else
			ItemList[i]["Draw"] = 1
		end
	end
	return ItemList
end
