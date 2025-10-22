--LuaTools脚本便捷工具
Lua_tools = {}

--tb_rand 随机表 --tbname 缓存表keyname，每个随机表需要不重复 --times 结果数量 --isOnly 结果是否唯一 --isIndex 是否只返回序号表
function Lua_tools.PlayerStartRandom(tb_rand,tbname,times, isOnly, isIndex)
	if type(tb_rand) ~= "table" then		
		return
	end
	if not times then		
		times = 1
	end
	if times < 1 then
		times = 1
	end
	if not Lua_tools.RandomTable_luatools then
		Lua_tools.RandomTable_luatools = {}
	end
	--初始化数据
	--if sVarSystem:GetInt("RandomTable_luatools_"..tbname.."_1") == 0 then
	--	local rand = 0
	--	for k,v in ipairs(tb_rand) do
	--		rand = rand + (v.Rand or 100)
	--		sVarSystem:SetInt("RandomTable_luatools_"..tbname.."_"..k, rand)
	--	end
	--end
	--表格存储
	if not Lua_tools.RandomTable_luatools[tbname] then
		Lua_tools.RandomTable_luatools[tbname] = {0}
		for k,v in ipairs(tb_rand) do
			Lua_tools.RandomTable_luatools[tbname][k+1] = Lua_tools.RandomTable_luatools[tbname][k] + (v.Rand or 100)
		end
	end
	--进行随机
	local rander = Lua_tools.RandomTable_luatools[tbname]
	local itemList = {}
	local index = 1
	local Randomed = {}
	for s = 1,times do
		for cishu = 1,20 do
			local rand = sLuaApp:RandInteger(1,rander[#rander])
			for i = 1,#tb_rand do
				if rand <= rander[i+1] and rand > rander[i] then
					index = i
					break
				end
			end
			if isOnly ~= true then
				break
			end
			if not Randomed[index] then
				Randomed[index] = 1
				break
			end
		end
		local answer = tb_rand[index]
		if isIndex ~= true then
			if answer['ItemKey'] then
				table.insert(itemList,answer['ItemKey'])
				if answer['Num'] then
					table.insert(itemList,answer['Num'])
					if answer['Bind'] then
						table.insert(itemList,answer['Bind'])
					end
				end
			end
		else
			table.insert(itemList,index)
		end
	end
	return itemList
end

function Lua_tools.IsItemEnough(player, itemList)
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end
					if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
						--sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
						return false
					end
				end
			end
		end
	end
	return true
end

function Lua_tools.IsBagEnough(player, itemList)
	local BagAdd = 0
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end
					local itemData = ItemConfig.GetByKeyName(v)
					if itemData then
						local isNotBag = 0
						if itemData.Type == 3 and itemData.Subtype == 9 then
							isNotBag = 1
						end
						if itemData.Type == 6 then
							isNotBag = 1
						end
						if isNotBag == 0 then
							BagAdd = BagAdd + math.ceil(num/itemData.StackMax)
						end
					end
				end
			end
		end
	end
	if BagAdd <= Lua_tools.GetBagFree(player) then
		return true
	end
	return false
end

function Lua_tools.GetDefectList(player, itemList)
	local DefectList = {}
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end
					local have = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3)
					if have < num then
						table.insert(DefectList, v)
						table.insert(DefectList, num - have)
					end
				end
			end
		end
	end
	return DefectList
end

function Lua_tools.SubItem(player, itemList, sender, reason, detail)
	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end
					if num > 0 then
						if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, 3, sender, reason, detail) ~= 0 then
							return false
						end
					end
				end
			end		
		end
	end
	return true
end

function Lua_tools.AddItem(player, itemList, sender, reason, detail)
	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	--sLuaApp:LuaDbg(" add item = " .. Lua_tools.serialize(itemList))
	local MailItem = {}
	if itemList then
		local MailStr = ""
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			local bind = true
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							--sLuaApp:LuaDbg("000")
							num = itemList[k+1]
							if type(itemList[k+2]) == "number" then
								sLuaApp:LuaDbg("111   " .. itemList[k+2])
								if itemList[k+2] == 0 then
									bind = false
								end
							end
						end
					end
					if num > 0 then
						local Inten = 0
						if string.find(v,"#") then
							local table_item = sLuaApp:StrSplit(v, "#")
							v = table_item[1]
							Inten = tonumber(table_item[2])
							if type(Inten) ~= "number" then
								Inten = 0
							end
						end
						local item_id = sItemSystem:GetItemIdByKeyname(v)
						if Inten > 0 then
							player:SetInt("ItemIntensify_" .. item_id, Inten)
						end
						if sItemSystem:MergeItemEx(player, item_id, num, bind, sender, reason, detail) ~= 0 then
							local itemCfg = ItemConfig.GetByKeyName(v)
							if not itemCfg then
								sLuaApp:LuaErr("道具 " .. v .. "不存在，检查配置！")
							else
								local StackMax = itemCfg.StackMax
								if num >= StackMax then
									for i = 1,math.floor(num/StackMax) do
										table.insert(MailItem, item_id)
										table.insert(MailItem, StackMax)
										table.insert(MailItem, itemList[k+2] == 0 and 0 or 1)
									end
								end
								if num%StackMax ~= 0 then
									table.insert(MailItem, item_id)
									table.insert(MailItem, num%StackMax)
									table.insert(MailItem, itemList[k+2] == 0 and 0 or 1)
								end
								if Inten > 0 then
									if MailStr ~= "" then
										MailStr = MailStr .. ','
									end
									MailStr = MailStr .. item_id .. ',' .. Inten
								end
							end
						end
					end
				end
			end		
		end
		if #MailItem > 0 then
			local MailGUID = sMailSystem:SendMail(0, "大唐驿站", player:GetGUID(), 1, "遗失物品查收", "我们在驿站发现了一批无人认领的包裹，经长安府追查，发现该包裹是少侠遗失的，现寄送给少侠，请少侠查收。", {}, MailItem)
			if MailStr ~= "" then
				player:SetString('MailIntensify_'..MailGUID, MailStr)
			end
		end
	end
	return true
end

function Lua_tools.SendItemMail(player_guid, tb_goods, sender, title, detail)
	if type(tb_goods) ~= "table" then
		sLuaApp:LuaDbg("Lua_tools.SendItemMail tb_goods) ~= table")
		return false
	end
	local itemList = tb_goods['ItemList']
	local items = {}
	local moneyList = tb_goods['MoneyList']
	local expList = tb_goods['ExpList']
	local attrs = {}
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			local bind = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							sLuaApp:LuaDbg("000")
							num = itemList[k+1]
							if type(itemList[k+2]) == "number" then
								bind = itemList[k+2]
							end
						end
					end
					if num > 0 then
						local item_id = sItemSystem:GetItemIdByKeyname(v)
						local StackMax = ItemConfig.GetByKeyName(v).StackMax
						if num >= StackMax then
							for i = 1,math.floor(num/StackMax) do
								table.insert(items, item_id)
								table.insert(items, StackMax)
								table.insert(items, bind)
							end
						end
						if num%StackMax ~= 0 then
							table.insert(items, item_id)
							table.insert(items, num%StackMax)
							table.insert(items, bind)	
						end
					end
				end	
			end
		end
	end
	if moneyList then
		for k,v in ipairs(moneyList) do
			if k%2 == 1 then
				table.insert(attrs, Lua_tools.GetMoneyAttrs(v))
				table.insert(attrs, moneyList[k+1])
			end
		end
	end
	if expList then
		for k,v in ipairs(expList) do
			table.insert(attrs,340)
			table.insert(attrs,v)
		end
	end
	if player_guid ~= 0 then
		sMailSystem:SendMail(0, ""..sender, player_guid, 1, ""..title, ""..detail, attrs, items)
	elseif player_guid == "ToAllPlayer" then
		sMailSystem:SendMail(0, ""..sender, 0, 1, ""..title, ""..detail, attrs, items)
	end
end

function Lua_tools.IsMoneyEnough(player, money_type, money_val)
	if type(money_type) ~= "number" or type(money_val) ~= "number" then
		return false
	end
	if money_type == 1 then
		return player:GetIngot() >= money_val
	elseif money_type == 2 then
		return player:GetBindIngot() >= money_val
	elseif money_type == 4 then
		return player:GetGold() >= money_val
	elseif money_type == 5 then
		return player:GetBindGold() >= money_val
	end
	return false
end

function Lua_tools.SubMoney(player, money_type, money_val, sender, reason, detail)
	if type(money_type) ~= "number" or type(money_val) ~= "number" then
		return false
	end
	if money_val == 0 then
		return true
	end
	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	if money_type == 1 then
		local TOF = player:SubIngot(money_val,sender,reason,detail)
		if TOF and SeasonPassQuestFunc then				--密藏功能计算金元宝消耗任务
			SeasonPassQuestFunc.SpendMoney(player, money_type, money_val)
		end
		return TOF
	elseif money_type == 2 then
		local TOF = player:SubBindIngot(money_val,sender,reason,detail)
		if TOF and SeasonPassQuestFunc then				--密藏功能计算银元宝消耗任务
			SeasonPassQuestFunc.SpendMoney(player, money_type, money_val)
		end
		return TOF
	elseif money_type == 4 then
		return player:SubGold(money_val,sender,reason,detail)
	elseif money_type == 5 then
		local TOF = player:SubBindGold(money_val,sender,reason,detail)
		if TOF and SeasonPassQuestFunc then				--密藏功能计算银币消耗任务
			SeasonPassQuestFunc.SpendMoney(player, money_type, money_val)
		end
		return TOF
	end
	return false
end

function Lua_tools.AddMoney(player, money_type, money_val, sender, reason, detail)
	if type(money_type) ~= "number" or type(money_val) ~= "number" then
		return false
	end
	if money_val == 0 then
		return true
	end
 	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	if money_type == 1 then
		sLuaApp:NotifyTipsMsg(player, "您获得了金元宝"..money_val)
		return player:AddIngot(money_val,sender,reason,detail)
	elseif money_type == 2 then
		sLuaApp:NotifyTipsMsg(player, "您获得了银元宝"..money_val)
		return player:AddBindIngot(money_val,sender,reason,detail)
	elseif money_type == 4 then
		return player:AddGold(money_val,sender,reason,detail)
	elseif money_type == 5 then
		return player:AddBindGold(money_val,sender,reason,detail)
	end
	return false
end

function Lua_tools.GetBagFree(player)
	local itemCon = player:GetItemContainer(1)
	return itemCon:GetFreeSiteCount()
end

function Lua_tools.GetGemBagFree(player)
	local itemCon
	if BagClassify.Mode and BagClassify.Mode == 1 then
		itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
	else
		itemCon = player:GetItemContainer(ITEM_CONTAINER_GEM_BAG)
	end
	return itemCon:GetFreeSiteCount()
end

function Lua_tools.GetTokenBagFree(player)
	local itemCon
	if BagClassify.Mode and BagClassify.Mode == 1 then
		itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
	else
		itemCon = player:GetItemContainer(ITEM_CONTAINER_GUARD_BAG)
	end	return itemCon:GetFreeSiteCount()
end

function Lua_tools.GetPetBagFree(player)
	local petCon = player:GetPetContainer(1)
	return (petCon:GetCapacity() - petCon:GetPetCount())
end

function Lua_tools.GetGemList(player)
	local gem_list = {}
	if BagClassify.Mode and BagClassify.Mode == 1 then
		local itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
		local Bag_ItemList = itemCon:GetItemList()
		local TypeConfig = BagClassify.TypeConfig.Gem
		if not TypeConfig or not next(TypeConfig) then
			return {}
		end
		for k,v in pairs(Bag_ItemList) do
			local Id = v:GetId()
			local itemData = ItemConfig.GetById(Id)
			if itemData.Type == TypeConfig.Type and itemData.Subtype == TypeConfig.Subtype and itemData.Subtype2 == TypeConfig.Subtype2 then
				table.insert(gem_list,v)
			end
		end
	else
		local itemCon = player:GetItemContainer(ITEM_CONTAINER_GEM_BAG)
		gem_list = itemCon:GetItemList()
	end
	return gem_list
end

function Lua_tools.GetTokenList(player)
	local token_list = {}
	if BagClassify.Mode and BagClassify.Mode == 1 then
		local itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
		local Bag_ItemList = itemCon:GetItemList()
		local TypeConfig = BagClassify.TypeConfig.Guard
		if not TypeConfig or not next(TypeConfig) then
			return {}
		end
		for k,v in pairs(Bag_ItemList) do
			local Id = v:GetId()
			local itemData = ItemConfig.GetById(Id)
			if itemData.Type == TypeConfig.Type and itemData.Subtype == TypeConfig.Subtype and itemData.Subtype2 == TypeConfig.Subtype2 then
				table.insert(token_list,v)
			end
		end
	else
		local itemCon = player:GetItemContainer(ITEM_CONTAINER_GUARD_BAG)
		token_list = itemCon:GetItemList()
	end
	return token_list
end

Lua_tools.MoneyNames = {
	[1] = "金元宝",
	[2] = "银元宝",
	[4] = "金币",
	[5] = "银币",


}

function Lua_tools.GetMoneyName(money_type)
	local name = Lua_tools.MoneyNames[money_type]
	if type(name) == "string" then
		return name
	end
	return "货币"
end

Lua_tools.MoneyAttrs = {
	[1] = ROLE_ATTR_INGOT,
	[2] = ROLE_ATTR_BIND_INGOT,
	[4] = ROLE_ATTR_GOLD,
	[5] = ROLE_ATTR_BIND_GOLD,
}

function Lua_tools.GetMoneyAttrs(money_type)
	local attr = Lua_tools.MoneyAttrs[money_type]
	if type(attr) == "number" then
		return attr
	end
	return 0
end

function Lua_tools.GetMoneyId(attr)
	if not Lua_tools.MoneyIds then
		Lua_tools.MoneyIds = {}
		for k,v in pairs(Lua_tools.MoneyAttrs) do
			Lua_tools.MoneyIds[v] = k
		end
	end
	local id = Lua_tools.MoneyIds[attr]
	if type(id) == "number" then
		return id
	end
	return 0
end

--活动管理器
function Lua_tools.Activity_Start(id)
	if Data then
		if not Data.Activity_State then
			Data.Activity_State = {}
		end
		Data.Activity_State["ID_"..id] = 1
	end
	return false
end

function Lua_tools.Activity_End(id)
	if Data then
		if not Data.Activity_State then
			Data.Activity_State = {}
		end
		Data.Activity_State[id] = 0
	end
	return false
end

function Lua_tools.Activity_GetState(id)
	if Data then
		if not Data.Activity_State then
			Data.Activity_State = {}
		end
		if Data.Activity_State[id] == 1 then
			return 1
		end
	end
	return 0
end

--队伍管理器  true 算上暂离的   false 不算暂离的
function Lua_tools.GetTeamMember(player,leaver)
	local team = player:GetTeam()
	if not team then
		return 1
	end
	if leaver == true then
		return team:GetTeamMemberCount()
	else
		return #team:GetTeamMembers(false)
	end
end

function Lua_tools.GetTeamLeader(player)
	local team = player:GetTeam()
	if not team then
		return player
	end
	return team:GetTeamLeader()
end

function Lua_tools.GetTeamLowestlevel(player)
	local team = player:GetTeam()
	if not team then
		return player:GetAttr(ROLE_ATTR_LEVEL)
	end
	if player:IsTempLeave() then
		return player:GetAttr(ROLE_ATTR_LEVEL)
	end
	local level = -1
	for k,v in ipairs(team:GetTeamMembers(false)) do
		if level == -1 then
			level = v:GetAttr(ROLE_ATTR_LEVEL)
		elseif level > v:GetAttr(ROLE_ATTR_LEVEL) then
			level = v:GetAttr(ROLE_ATTR_LEVEL)
		end
	end
	return level
end

--获取队伍中玩家
function Lua_tools.GetPlayerTb(player)
	local memberlist = {}
	local team = player:GetTeam()	
	if team and not player:IsTempLeave() then
		memberlist = team:GetTeamMembers(false)
	else
		memberlist[1] = player
	end
	return memberlist
end

--table的深拷贝
function Lua_tools.DupTable(t)
	local o = {}
	for k, v in pairs(t) do
		if type(v) == "table" then
			o[k] = Lua_tools.DupTable(v)
		elseif type(v) == "userdata" then
			sLuaApp:LuaErr("Lua_tools.DupTable 不支持userdata")
			--assert(false, "不支持userdata")
		else
			o[k] = v
		end
	end
	return o
end

function Lua_tools.serialize(obj)
	local text = ""
    local t = type(obj)
    if t == "number" then
        text = text .. obj
    elseif t == "boolean" then
        text = text .. tostring(obj)
    elseif t == "string" then
        text = text .. string.format("%q", obj)
    elseif t == "table" then
        text = text .. "{\n"
        for k, v in pairs(obj) do
			if type(v) == "userdata" then
				sLuaApp:LuaErr("SSSSSSSSSSSSSSSSSSBBBBBBBBBBBBBBBBBB " .. k)
			end
			text = text .. "[" .. Lua_tools.serialize(k) .. "]=" .. Lua_tools.serialize(v) .. ",\n"
        end
        local metatable = getmetatable(obj)
        if metatable ~= nil and type(metatable.__index) == "table" then
			for k, v in pairs(metatable.__index) do
				if type(v) == "userdata" then
					sLuaApp:LuaErr("SSSSSSSSSSSSSSSSSSBBBBBBBBBBBBBBBBBB " .. k)
				end
				text = text .. "[" .. Lua_tools.serialize(k) .. "]=" .. Lua_tools.serialize(v) .. ",\n"
			end
		end

    text = text .. "}"

    elseif t == "nil" then
        return nil
    else
		if type(t) == "userdata" then
			sLuaApp:LuaErr("SSSSSSSSSSSSSSSSSSBBBBBBBBBBBBBBBBBB " .. type(t))
		end
		sLuaApp:LuaErr("serialize type "..t)
		text = text .. "userdata"
       -- log("can not serialize a " .. t .. " type.")
    end

    return text
end

function Lua_tools.tablecount(datatable)
	local count = 0
	if type(datatable) == "table" then
		for i,v in pairs(datatable) do
			count = count+1
		end
	end
	return count
end

--获取当前日期（数字版）
function Lua_tools.GetNowDate()
	if Lua_tools.NowDate then
		return Lua_tools.NowDate
	end
	
	Lua_tools.SetNowDate()
	return Lua_tools.NowDate
end

--每日日期赋值
function Lua_tools.SetNowDate()
	Lua_tools.NowDate = sLuaApp:Year(0)*10000+sLuaApp:Month(0)*100+sLuaApp:MonthDay(0)
end

--每个新的一天开始，进入回调
function Lua_tools.NewDayIntialization()
	sLuaApp:LuaDbg("NewDayIntialization")
	Lua_tools.SetNowDate()
	if MallConfig then
		MallConfig.Initialization()
	end
	if SevenDay then
		SevenDay.NewDayCallBack()
	end
	if MallFree then
		MallFree.NewDayCallBack()
	end

	local all_players = sPlayerSystem:GetAllPlayers()
	for _,v in ipairs(all_players) do
		Lua_tools.ResetOnlineTimes(v, 1)
	end
end

function Lua_tools.ResetOnlineTimes(player, is_new_day)
	local present_login_sec = 0
	if tonumber(is_new_day) == 1 then
		present_login_sec = sLuaApp:SecondSinceEpoch(0) - player:GetInt("PLAYER_LastLoginSec") --本次在线时长
	end
	player:SetInt("PLAYER_LastLoginSec", sLuaApp:SecondSinceEpoch(0))
	if player:GetDayInt("PLAYER_Logined") ~= 0 then
		return
	end
	-- sLuaTimerSystem:AddTimerEx(player, sLuaApp:GetTodayRemain()*1000 + 400, 1, "Lua_tools.ResetOnlineTimes", "1")	
	player:SetInt("PLAYER_PastOnlineSec", player:GetTotalOnlines() + present_login_sec)
	player:SetDayInt("PLAYER_Logined", 1)
end

function Lua_tools.GetTodayOnlineSec(player)
	local day_total_onlines = player:GetTotalOnlines() - player:GetInt("PLAYER_PastOnlineSec")
	return (day_total_onlines < 0 and 0 or day_total_onlines) + sLuaApp:SecondSinceEpoch(0) - player:GetInt("PLAYER_LastLoginSec")
end

function Lua_tools.TryToNewDay()
	sLuaTimerSystem:AddTimer(1000,1,"Lua_tools.NewDayIntialization", "")
end

function Lua_tools.MoveToNpc(player, npcID)
	if player:GetInt("Assist_GoOn") == 1 then
		sLuaApp:NotifyTipsMsg(player, "辅助中无法移动！")
		return
	end
	local str = [[
		MainUI.CloseOtherWnds()
		CL.StartMove(]]..npcID..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

local Site_Config = {
	["1_0"] =  0,   -- 武器
    ["2_1"] =  1,   -- 帽子
    ["2_2"] =  2,   -- 衣服
    ["2_3"] =  3,   -- 腰带
    ["3_4"] =  4,   -- 鞋子
    ["3_3"] =  5,   -- 护腕
    ["3_1"] =  6,   -- 戒指
    ["3_2"] =  7,   -- 项链
    ["2_5"] =  8,   -- 挂坠
    ["4_0"] =  9,   -- 法宝
    ["5_0"] =  10,  -- 坐骑
}
function Lua_tools.IsEquipped(player, item)
	if not item then
		return false
	end
	if item:GetOwnerGUID() ~= player:GetGUID() then
		return false
	end
	local itemData = ItemConfig.GetById(item:GetId())
	if itemData.Type ~= 1 then
		return false
	end
	local EquipType = itemData.Subtype
	local SiteType = itemData.Subtype2
	local site = Site_Config[EquipType.."_"..SiteType]
	if not site then
		site = Site_Config[EquipType.."_0"]
	end
	if not site then
		return false
	end
	local ItemContainer = player:GetItemContainer(5)  
	local item_equip = ItemContainer:GetItemBySite(site)
	if item_equip == item then
		return true
	end
	return false
end

--给予玩家道具
function Lua_tools.GiveGoods(player, tb_goods, sender, reason, detail)
	if type(tb_goods) ~= "table" then
		return false
	end
	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	local petList = {}
	local petBind = {}
	local petLevel = {}
	local tb_now = tb_goods['PetList']--PetList：1宠物keyname 2绑定 3等级
	if tb_now then
		local num = 0
		for k,v in ipairs(tb_now) do
			if type(v) == "string" then				
				num = num + 1
				petList[#petList+1] = v
				if type(tb_now[k+1]) ~= "string" and  tb_now[k+1] then
					if tonumber(tb_now[k+1]) == 0 then
						petBind[#petBind+1] = false
					else
						petBind[#petBind+1] = true
					end
				else
					petBind[#petBind+1] = true
				end
				if type(tb_now[k+2]) ~= "string" and  tb_now[k+2] then
					petLevel[#petLevel+1]=tonumber(tb_now[k+2])
				else
					petLevel[#petLevel+1]=0     --配置没有等级默认为0
				end
			end
		end
		for k,v in ipairs(petList) do
			local petdata = PetConfig.GetByKeyName(v)
			if Lua_tools.GetPetBagFree(player) >= 1 then
				sPetSystem:AddPetEx(player,petdata.Id,petLevel[k],petBind[k], sender, reason, detail)
			else
				sMailSystem:SendMailEx(0, "大唐驿站", player:GetGUID(), 1, "遗失宠物查收","我们在驿站发现了一只无人认领的宠物，经长安府追查，发现该宠物是少侠遗失的，现寄送给少侠，请少侠查收。",{},{},{petdata.Id,petLevel[k],petBind[k] and 1 or 0})
			end
		end
	end
	
	local MailItem = {}
	tb_now = tb_goods['ItemList']
	local MailStr = ""
	if tb_now then
		for k,v in ipairs(tb_now) do
			if type(v) == "string" and v ~= "" then
				local num = 1
				local bind = true
				if type(tb_now[k+1])=="number" then
					num = tb_now[k+1]
					if type(tb_now[k+2])=="number" then
						if tb_now[k+2] == 0 then
							bind = false
						end
					end
				end
				
				if num > 0 then
					local Inten = 0
					if string.find(v,"#") then
						local table_item = sLuaApp:StrSplit(v, "#")
						v = table_item[1]
						Inten = tonumber(table_item[2])
						if type(Inten) ~= "number" then
							Inten = 0
						end
					end
					local item_id = sItemSystem:GetItemIdByKeyname(v)
					if Inten > 0 then
						player:SetInt("ItemIntensify_" .. item_id, Inten)
					end
					if sItemSystem:MergeItemEx(player, item_id, num, bind, sender, reason, detail) ~= 0 then
						local ItemCfg = ItemConfig.GetByKeyName(v)
						if ItemCfg then 
							local StackMax = ItemCfg.StackMax
							if num >= StackMax then
								for i = 1,math.floor(num/StackMax) do
									table.insert(MailItem, item_id)
									table.insert(MailItem, StackMax)
									table.insert(MailItem, type(tb_now[k+2]) == 'number' and tb_now[k+2] or 1)
								end
							end
							if num%StackMax ~= 0 then
								table.insert(MailItem, item_id)
								table.insert(MailItem, num%StackMax)
								table.insert(MailItem, type(tb_now[k+2]) == 'number' and tb_now[k+2] or 1)
							end
							if Inten > 0 then
								if MailStr ~= "" then
									MailStr = MailStr .. ','
								end
								MailStr = MailStr .. item_id .. ',' .. Inten
							end
						else
							sLuaApp:LuaErr("道具 " .. v .. "并不存在，请检查配置！")
						end
					end		
				end
			end
		end
	end
	
	local Pro=player:GetAttr(ROLE_ATTR_ROLE)
	tb_now = tb_goods['ItemList_'..Pro]
	if tb_now then
		for k,v in ipairs(tb_now) do
			if type(v) == "string" then
				if v ~= "" then
					local num = 1
					local bind = true
					if type(tb_now[k+1])=="number" then
						num = tb_now[k+1]
						if type(tb_now[k+2])=="number" then
							bind=(tb_now[k+2]==0) and false or true
						end
					end
					if num > 0 then
						local Inten = 0
						if string.find(v,"#") then
							local table_item = sLuaApp:StrSplit(v, "#")
							v = table_item[1]
							Inten = tonumber(table_item[2])
							if type(Inten) ~= "number" then
								Inten = 0
							end
						end
						local item_id = sItemSystem:GetItemIdByKeyname(v)
						if Inten > 0 then
							player:SetInt("ItemIntensify_" .. item_id, Inten)
						end
						if sItemSystem:MergeItemEx(player, item_id, num, bind, sender, reason, detail) ~= 0 then
							local StackMax = ItemConfig.GetByKeyName(v).StackMax
							if num >= StackMax then
								for i = 1,math.floor(num/StackMax) do
									table.insert(MailItem, item_id)
									table.insert(MailItem, StackMax)
									table.insert(MailItem, type(tb_now[k+2]) == 'number' and tb_now[k+2] or 1)
								end
							end
							if num%StackMax ~= 0 then
								table.insert(MailItem, item_id)
								table.insert(MailItem, num%StackMax)
								table.insert(MailItem, type(tb_now[k+2]) == 'number' and tb_now[k+2] or 1)
							end
						end
						if Inten > 0 then
							if MailStr ~= "" then
								MailStr = MailStr .. ','
							end
							MailStr = MailStr .. item_id .. ',' .. Inten
						end
					end
				end
			end
		end
	end
	tb_now = tb_goods['GuardList']
	if tb_now then
		local level = player:GetAttr(ROLE_ATTR_LEVEL)
		for k,v in ipairs(tb_now) do
			if type(v) == "string" and v ~= "" then
				local guard_data = GuardConfig.GetByKeyName(v)
				if guard_data then
					local guard_id = guard_data.Id
					local becomepiece = 0
					local guard_con = player:GetGuardContainer()
					if guard_con:HasGuard(guard_id) then
						--if not lualib:Guard_IsLimitTime(player, v) then
						becomepiece = 1
						--end
					end
					if becomepiece == 0 then
						local guard = sGuardSystem:AddGuard(player, guard_id, level, sender, reason, detail)
						if not guard then
							sLuaApp:LuaErr("Lua_tools.GiveGoods AddGuard 失败 "..v)
						end
					else
						local call_item_id = guard_data.CallItemIcon
						local call_item_num = guard_data.ItemNumber
						call_item_num = math.ceil(call_item_num*(Lua_tools.GuardToPiece or 0.5))
						if call_item_num <= 0 then
							call_item_num = 1
						end
						local bind = tb_now[k+1]
						if type(bind) ~= "number" then
							bind = 1
						end
						local call_item_keyName = ItemConfig.GetById(call_item_id).KeyName
						Lua_tools.AddItem(player, {call_item_keyName, call_item_num, bind}, sender, reason, detail)
					end
				else
					sLuaApp:LuaErr("Lua_tools.GiveGoods GuardConfig 不存在 "..v)
				end
			end
		end
	end
	if #MailItem > 0 then
		local MailGUID = sMailSystem:SendMail(0, "大唐驿站", player:GetGUID(), 1, "遗失物品查收", "我们在驿站发现了一批无人认领的包裹，经长安府追查，发现该包裹是少侠遗失的，现寄送给少侠，请少侠查收。", {}, MailItem)
		if MailStr ~= "" then
			player:SetString('MailIntensify_'..MailGUID, MailStr)
		end
	end
	tb_now = tb_goods['MoneyList']
	if tb_now then
		for k,v in ipairs(tb_now) do
			if k%2 == 1 then
				Lua_tools.AddMoney(player, v, tb_now[k+1], sender, reason, detail)
			end
		end
	end
	return true
end

--注册可查询宠物
function Lua_tools.RegisterPets(Pets)
	if not Data.QueryPets then
		Data.QueryPets = {}
	end
	--sLuaApp:LuaDbg("1111")
	for k,v in ipairs(Pets) do
		if type(v) == 'string' then
			if not Data.QueryPets[v] then
				local PetData = PetConfig.GetByKeyName(v)
				if PetData then
					--sLuaApp:LuaDbg("录入宠物" .. v .. " 成功！")
					Data.QueryPets[v] = sPetSystem:CreatePet(PetData.Id, 1, false):GetGUID()
				end
			end
		end
	end
end

function Lua_tools.IngotDescStati(reason)
	if reason == "RMBShop" or reason == "MonthCard" or reason == "LevelFund" or reason == "SeasonPass_Recharge" or reason == "面对面交易" or reason == "摆摊" then
		return false
	end
	if string.find(reason, "拍卖行") or string.find(reason, "交易行") then
		return false
	end
	return true
end
function Lua_tools.AddGuildFund(player,num)
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local build_level = guild:GetWingRoomLevel() 
	local now_fund = guild:GetFund()
	local max_fund = GuildConfig.InitialFund
	if build_level ~= 0 then
		max_fund = GuildConfig.BuildingsConfig[3]["BuildingLevels"][build_level]['Param1']
	end
	if now_fund + num >= max_fund then
		num = max_fund - now_fund
	end
	if num > 0 then
		sGuildSystem:AddFund(guild, num)
	end
end
--获得身上装备 site -EQUIP_SITE_
function Lua_tools.GetEquipped(player, site)
	local ItemContainer = player:GetItemContainer(5)
	local Item = ItemContainer:GetItemBySite(site)
	return Item
end

--加载超级定时器
function Lua_tools.Player_AddTimerPlus(player, seconds, func, parms)
	if type(parms) ~= "string"  or parms == "" then
		parms = "0"
	end
	local tb_player_times = load("return " .. player:GetString("AddTimerPlus"))() or {}
	local AllSec = sLuaApp:GetTimes()*1000
	local str_Save = ""..func.."-"..parms.."-"..(seconds+AllSec)
	table.insert(tb_player_times, str_Save)
	player:SetString("AddTimerPlus",Lua_tools.serialize(tb_player_times))
	sLuaTimerSystem:AddTimerEx(player, seconds, 1, "Lua_tools.Player_DelTimerPlus", str_Save)
	sLuaTimerSystem:AddTimerEx(player, seconds, 1, func, parms)
end

--清除超级定时器
function Lua_tools.Player_DelTimerPlus(player, timer_id, parms)
	local tb_player_times = load("return " .. player:GetString("AddTimerPlus"))() or {}
	for i = #tb_player_times,1,-1 do
		if parms == tb_player_times[i] then
			table.remove(tb_player_times,i)
		end
	end
	player:SetString("AddTimerPlus",Lua_tools.serialize(tb_player_times))
end

--上线判断超级定时器
function Lua_tools.Player_TimerPlusCheck(player)
	local AllSec = sLuaApp:GetTimes()*1000
	local tb_player_times = load("return " .. player:GetString("AddTimerPlus"))() or {}
	-- local SystemRestart = 0
	-- if player:GetInt("LastLogoutTime") < sVarSystem:GetInt("SystemStartTime") then
		-- SystemRestart = 1
	-- end
	--lualib:SysMsg_SendTipsMsg(player, "上线触发超级定时器 " .. lualib:GetStr(player, "AddTimerPlus"))
	--if SystemRestart == 1 then
		player:SetString("AddTimerPlus", "{}")
	--end
	for i = #tb_player_times,1,-1 do
		local parms = sLuaApp:StrSplit( tb_player_times[i], "-" )
		local sec = tonumber(parms[3])
		if AllSec < sec then
			--lualib:SysMsg_SendTipsMsg(player, "超级定时器 " .. tb_player_times[i] .. "还剩 " .. sec - AllSec .. "毫秒触发")
			--Player_AddTimerPlus(player, sec - AllSec, parms[1], parms[2])
			--如果玩家下线到上线之间服务器重启了，需要添加Player_AddTimerPlus(player, sec - AllSec, parms[1], parms[2])
			--if SystemRestart == 1 then
				Lua_tools.Player_AddTimerPlus(player, sec - AllSec, parms[1], parms[2])
			--end
		else
			--lualib:SysMsg_SendTipsMsg(player, "超级定时器 " .. tb_player_times[i] .. "已经触发")
			sLuaTimerSystem:AddTimerEx(player, 10, 1, parms[1], parms[2])
		end
	end
end

--获取玩家当前可进入战斗的宠物（isForce == true时返回所有满足条件的宠物，否则只返回可增加经验的宠物）
function Lua_tools.GetFightPets(player, isForce)
	local pet = sPetSystem:GetMainPet(player)
	local team = player:GetTeam()
	local members = {player}
	
	if team then
		if team:GetTeamLeader() == player then
			members = team:GetTeamMembers(false)
		elseif player:IsTempLeave() == false then
			if pet then
				if isForce ~= true then
					if pet:GetAttr(ROLE_ATTR_LEVEL) - 5 >= player:GetAttr(ROLE_ATTR_LEVEL) then
						return {}
					end
				end
				return {pet}
			else
				return {}
			end
		end
	end
	local pets = {}
	if pet then
		pets = {pet}
	end
	local lineupContainer = player:GetLineupContainer()
	local lineupIndex = lineupContainer:GetCurrentLineup()
	local GuardList = lineupContainer:GetLineup(lineupIndex)
	for i = 1,4 do
		local pet_g = sPetSystem:GetGuardPet(player,i)
		if pet_g then
			if GuardList[i] then
				table.insert(pets,pet_g)
			end
		end
	end
	if #members > 1 then
		local index = 5
		for i = #members,2,-1 do
			--local member = members[i]
			--if sPetSystem:GetMainPet(member) then
				if #pets >= index then
					table.remove(pets,#pets)
				end
				index = index - 1
			--end
		end
	end
	if isForce ~= true then
		for i = #pets,1,-1 do
			if pets[i]:GetAttr(ROLE_ATTR_LEVEL) - 5 >= player:GetAttr(ROLE_ATTR_LEVEL) then
				table.remove(pets,i)
			end
		end
	end
	return pets
end

Lua_tools.Num2TxtConfig = {"", "十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千", "兆", "十", "百", "千"}
Lua_tools.Num2TxtNames = {[0] = "零", "一", "二", "三", "四", "五", "六", "七", "八", "九"}

--数字变文字
function Lua_tools.Num2Txt(number)
	if type(number) ~= "number" then
        return "输入错误"
    end
    local numerical_table = {}
 
    --数字转成表结构存储
    local numerical_length = string.len(number)
    for i = 1, numerical_length do
	numerical_table[i] = tonumber(string.sub(number, i, i))
    end
    --对应数字转中文处理
    local result_numberical = ""
    local to_append_zero, need_filling = false, true
    for index, number in ipairs(numerical_table) do
	--从高位到底位的顺序数字转成对应的从低位到高位的顺序数字单位.
	local real_unit_index = numerical_length - index + 1
    if number == 0 then
	   if need_filling then
	      if real_unit_index == 5 then--万位
		 result_numberical = result_numberical .. "万"
		 need_filling = false
	      end
	      if real_unit_index == 9 then--亿位
		 result_numberical = result_numberical .. "亿"
		 need_filling = false
	      end
	      if real_unit_index == 13 then--兆位
		 result_numberical = result_numberical .. "兆"
		 need_filling = false
	      end
	   end
       to_append_zero = true
        else
	   if to_append_zero then
	      result_numberical = result_numberical .. "零"
	      to_append_zero = false
           end
	   result_numberical = result_numberical  .. Lua_tools.Num2TxtNames[number] .. Lua_tools.Num2TxtConfig[real_unit_index]
	   if real_unit_index == 5 or real_unit_index == 9 or real_unit_index == 13 then
		need_filling = false
	   else
		need_filling = true
	   end
	end
    end
    return result_numberical
end

--跳转地图
function Lua_tools.Jump(obj, map, x, y, range)
	if obj:GetInt("Assist_GoOn") == 1 then
		sLuaApp:NotifyTipsMsgEx(obj, "辅助中无法移动！")
		return false
	end
	--地图等级判断
	if not Lua_tools.CheckMapLevel(obj, map:GetKeyName()) then
		return false
	end
	return sMapSystem:Jump(obj, map, x, y, range)
end

--地图等级判断
function Lua_tools.CheckMapLevel(player, map_keyname)
	local map_config = MapConfig.GetByKeyName(map_keyname)
	local level_min = map_config.LevelMin
	local level_max = map_config.LevelMax
	local player_tb = Lua_tools.GetPlayerTb(player)
	for _,member in ipairs(player_tb) do
		local level = member:GetAttr(ROLE_ATTR_LEVEL)
		if level < level_min or level > level_max then
			sLuaApp:NotifyTipsMsgEx(player, "地图等级为 "..level_min .." ~ "..level_max.."级，"..VipIngotTrace.GetPlayerName(member).."等级不符")
			return false
		end 
	end
	return true
end

--时间换算
function Lua_tools.Time2Txt(sec)
	local Days = math.floor(sec/(3600*24))
	local sec_sur = sec-Days*3600*24
	local Hours = math.floor(sec_sur/3600)
	sec_sur = sec_sur - Hours*3600
	local Mins = math.floor((sec_sur)/60)
	sec_sur = sec_sur - Mins*60
	local str = ""
	if Days > 0 then
		str = str .. Days .. "天"
	end
	if Hours > 0 or Days > 0 then
		str = str .. Hours .. "小时"
	end
	if Mins > 0 or Hours > 0 or Days > 0 then
		str = str .. Mins .. "分"
	end
	
	return str .. sec_sur .. "秒"
end

--取得距离的平方
function Lua_tools.GetDistance(actor1, actor2)
	if actor1:GetMap() ~= actor2:GetMap() then
		return nil
	end
	local PosX = sMapSystem:GetPosX(actor1) - sMapSystem:GetPosX(actor2)
	local PosY = sMapSystem:GetPosY(actor1) - sMapSystem:GetPosY(actor2)
	return PosX*PosX+PosY*PosY
end

--设置CustomName  --position 1 上面 2 下面 --types 1 文字类型 2 图片类型 --text 文字内容 图片编号 --color 文字颜色rgba 255,255,255,255
function Lua_tools.SetCustomName(role, position, types, text, color)
	-- sLuaApp:LuaErr(""..role:GetName()..text)
	local type = role:GetType()
	if type == GUID_NPC then
		local params = position.."#"..types.."#"..text
		if tonumber(types) == 1 then
			if color then
				params = params .."$"..color
			end
		end
		role:SetString("NPCCustomName", params)
	end

end

--设置玩家头顶文字
function Lua_tools.SetStallSigns(player,text)
	local params = text or ""
	player:SetString("PlayerStallSigns", params)	
end
--充值比例
Lua_tools.RMBtoIngot = 200

--重复侍从换取碎片的比例
Lua_tools.GuardToPiece = 0.8

---保留value小数点后n位数
function Lua_tools.FormatPercent(value, n)
    local temp = tostring(value)
    local length = string.len(value)
    local startIndex, endIndex = string.find(temp, ".", 1, true)
    if startIndex and startIndex > 0 then --有小数点
        if length - startIndex > n then --小数点后超过n位
			local formatString = "%."..n.."f"
			return tonumber(string.format(formatString, string.sub(temp, 1, length)))
            --return tonumber(string.sub(temp, 1, startIndex + n))
        else --小数点后不足n位
            local formatString = "%s"
            for i = 1, n - (length - startIndex) do
                formatString = formatString .. "0"
            end
            return tonumber(string.format(formatString, string.sub(temp, 1, length)))
            --return string.sub(temp, 1, length) --如果不需要补齐0,返回这一句语句
        end
    else --没有小数点
        local formatString = "%s."
        for i = 1, n do
            formatString = formatString .. "0"
        end
        return tonumber(string.format(formatString, temp))
        --return temp --如果不需要补齐0,直接返回temp
    end
end

--RGB转HSV颜色格式
function Lua_tools.RGB2HSV(r,g,b)
    r, g, b = r/255, g/255, b/255
    local mx = math.max(r,g,b)
    local mn = math.min(r,g,b)
    local H = 0
    local S = 0
    local V = mx

    if mx == 0 then
        S = 0
    else
        S = 1-(mn/mx)
    end

    if mx == mn then
        H = 0
    elseif mx == r and g >= b then
        H = 60 / 360*((g-b)/(mx-mn))
    elseif mx == r and g < b then
        H = 60 / 360*((g-b)/(mx-mn)) + 360 / 360
    elseif mx == g then
        H = 60 / 360*((b-r)/(mx-mn)) + 120 / 360
    elseif mx == b then
        H = 60 / 360*((r-g)/(mx-mn)) + 240 / 360
    end

    return Lua_tools.FormatPercent(H,4),Lua_tools.FormatPercent(S,4),Lua_tools.FormatPercent(V,4)
end

--HSV转RGB颜色格式
function Lua_tools.HSV2RGB(H,S,V)
    local r,g,b = 0,0,0
    H = H * 360

    if S == 0 then
        r = V
        g = V
        b = V
    else
        H = H/60
        local i = math.floor(H)
        local C = H - i

        local X = V * (1 - S)
        local Y = V * (1 - S * C)
        local Z = V * (1 - S * (1 - C))

        if i == 0 then r,g,b = V,Z,X
        elseif i == 1 then r,g,b = Y,V,X
        elseif i == 2 then r,g,b = X,V,Z
        elseif i == 3 then r,g,b = X,Y,V
        elseif i == 4 then r,g,b = Z,X,V
        elseif i == 5 then r,g,b = V,X,Y
        end
    end

    return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
end

--复制一份table，修改不会影响原来的表
function Lua_tools.CopyTable(table)
    local newTable = {}
    for key, value in pairs(table) do
        if type(value) == "table" then
            newTable[key] = Lua_tools.CopyTable(value)
        else
            newTable[key] = value
        end
    end
    return newTable
end

--验证客户端传的number是否合法 返回整数 非法则返回false -- bool include_zero 0是否合法
function Lua_tools.CheckNumber(number, include_zero)
	if type(number) ~= "number" then
		return false
	end
	if include_zero then
		if tonumber(number) < 0 then
			return false
		end
		if tonumber(number) >= 0 then
			number = math.floor(tonumber(number))
		end
	else
		if tonumber(number) <= 0 then
			return false
		end
		if tonumber(number) > 0 then
			number = math.floor(tonumber(number))
		end
	end
	return number
end