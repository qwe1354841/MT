--装备打造

EquipBuild = {}

function EquipBuild.GetData(player, Version)
	sLuaApp:LuaDbg("信息接收1")
	if EquipBuildConfig then	
		sLuaApp:LuaDbg("表格判断")
		if Version ~= EquipBuildConfig.Version then
			local dataTb = {}
			dataTb.Version = EquipBuildConfig.Version
			dataTb.Classify_Desc = EquipBuildConfig.Classify_Desc
			dataTb.Classify_Table = EquipBuildConfig.Classify_Table
			dataTb.Build_Time = EquipBuildConfig.Build_Time

			if Lua_tools then
				sLuaApp:LuaDbg("表单回馈")
				local str = [[ if EquipProduceUI then
						EquipProduceUI.serverData = ]] .. Lua_tools.serialize(dataTb) .. [[
						EquipProduceUI.Refresh()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			end
		end
	end
end


function EquipBuild.GetLevelData(player,level)

	if EquipBuildConfig then	
		local str = ""
		local Synthesis = {}
		Synthesis[level] = {}
		local role = player:GetAttr(ROLE_ATTR_ROLE)
		local school1 = player:GetAttr(ROLE_ATTR_JOB_1)
		local school2 = player:GetAttr(ROLE_ATTR_JOB_2)
		local school3 = player:GetAttr(ROLE_ATTR_JOB_3)
		local sex = player:GetAttr(ROLE_ATTR_GENDER)

		if EquipBuild.Synthesis then
			if EquipBuild.Synthesis[level] then
				for a,b in pairs(EquipBuild.Synthesis[level]) do
					if a == 'Normal' then
						Synthesis[level]['Normal'] = b
					else
						local tb_condition = sLuaApp:StrSplit(a, "_")
						if #tb_condition == 3 then
							local condition1 = tonumber(tb_condition[1])
							local condition2 = tonumber(tb_condition[2])
							local condition3 = tonumber(tb_condition[3])
							if role == condition1 or condition1 == 0 then
								if condition2 == 0 or school1 == condition2 or school2 == condition2 or school3 == condition2 then
									if sex == condition3 or condition3 == 0 then
										Synthesis[level][a] = b
									end
								end
							end
						elseif #tb_condition == 4 then
							local condition1 = tonumber(tb_condition[1])
							local condition2 = tonumber(tb_condition[2])
							local condition3 = tonumber(tb_condition[3])
							local condition4 = tonumber(tb_condition[4])
							if role == condition1 or role == condition2 or condition1 == 0 or condition2 == 0 then
								if condition3 == 0 or school1 == condition3 or school2 == condition3 or school3 == condition3 then
									if sex == condition4 or condition4 == 0 then
										Synthesis[level][a] = b
									end
								end
							end
						end
					end
				end
			end
		end

		if Lua_tools then
			str = [[
				if EquipProduceUI then
					EquipProduceUI.RefreshLvDes(]].. Lua_tools.serialize(Synthesis)..[[)
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function EquipBuild.GetEquipData(player, classify, index)
	if player == nil then
		return
	end

	if index <= 0 then
		return
	end

	local tb_choose = EquipBuildConfig.Synthesis[classify][index]
	local EquipPreview = {}
	
	local num = 0

	local basic_itemKey = tb_choose.result_basic[#tb_choose.result_basic-1]
	local adder_itemKey = tb_choose.result_adder[#tb_choose.result_adder-1]
	local result_library = tb_choose.result_library or "EquipCreate.Config"
	EquipPreview[basic_itemKey] = {}
	EquipPreview[adder_itemKey] = {}

	EquipPreview[basic_itemKey]['attr'],num  = EquipBuild.EquipDataTable(basic_itemKey,result_library)
	EquipPreview[basic_itemKey]['tips'] = "有概率获得随机特效"
	if num > 0 then
		EquipPreview[basic_itemKey]['tips'] = (#EquipPreview[basic_itemKey]['attr'] > 0 and "额外" or "" ).."获得".. num .. "条随机属性\n" .. EquipPreview[basic_itemKey]['tips']
	end

	EquipPreview[adder_itemKey]['attr'],num = EquipBuild.EquipDataTable(adder_itemKey,result_library)
	EquipPreview[adder_itemKey]['tips'] = "获得随机特效概率增加，并有概率获得随机特技"
	if num > 0 then
		EquipPreview[adder_itemKey]['tips'] = (#EquipPreview[adder_itemKey]['attr'] > 0 and "额外" or "" ).."获得".. num .. "条随机属性\n" .. EquipPreview[adder_itemKey]['tips']
	end

	local str =[[
		if EquipProduceUI then
			EquipProduceUI.DesRefresh(]].. Lua_tools.serialize(EquipPreview)..[[)
		end
	 ]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipBuild.EquipDataTable(itemkey,result_library)
	local itemData = ItemConfig.GetByKeyName(itemkey)

	local Type = itemData.Subtype
	local SubType = itemData.Subtype2
	local Attrtable = {}
	local RandAttrCnt = 0

	if EquipCreate.Config[Type] then
		local tb_Rand = assert(load("return "..result_library.."["..Type.."]["..SubType.."] or "..result_library.."["..Type.."][0]"))()
		--local tb_Rand = EquipCreate.Config[Type][SubType] or EquipCreate.Config[Type][0]
		if type(tb_Rand) == "table" then
			for k,v in ipairs(tb_Rand) do
				if type(v) == "string" then
					Attrtable, RandAttrCnt = EquipCreate.EquipAttrRandom(nil, "Create", v, type(tb_Rand[k+1]) == "number" and tb_Rand[k+1] or 1,true,itemkey)
				end
			end
		end
	end
	return Attrtable, RandAttrCnt
end

function EquipBuild.StartBuilding(player, classify, index, issuper, UseUnbind)
	if EquipBuild.CheckCanBuild(0, player, classify, index, issuper, UseUnbind) == true then		
		sLuaTimerSystem:AddTimerEx(player, (EquipBuildConfig.Build_Time or 3), 1, "EquipBuild.DelayBuiding", classify .. "," .. index .. "," .. issuper .. "," .. UseUnbind)
		--密藏相关
		if SeasonPassQuestFunc then
			SeasonPassQuestFunc.UpdateQuestProgress(player, 58)
		end
	end
end

--[[
	moneytype:
    [1] = "金元宝",
	[2] = "银元宝",
	[4] = "金币",
	[5] = "银币",
--]]

function EquipBuild.CheckCanBuild(check, player, classify, index, issuper, UseUnbind)
	if check ~= 0 then
		return false
	end
	
	local ItemContainer = player:GetItemContainer(1) 
	if ItemContainer:GetFreeSiteCount() < 1 then
		sLuaApp:NotifyTipsMsg(player, "您的需要有空余的包裹才能进行锻造！")
		return false
	end
	
	if EquipBuildConfig then
		if EquipBuildConfig.Synthesis then
			if EquipBuildConfig.Synthesis[classify] then
				local tb_choose = EquipBuildConfig.Synthesis[classify][index]
				if tb_choose then
					if tb_choose.consume then
						local MoneyType = tb_choose.consume.MoneyType
						local MoneyVal = tb_choose.consume.MoneyVal
						if MoneyType then
							if MoneyType == 5 then
								if player:GetBindGold() < MoneyVal then
									if MoneyChange then
										local f_name = [[EquipBuild.CheckCanBuild(]]..check..[[,sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),"]]..classify..[[",]]..index..[[,]]..issuper..[[)]]
										MoneyChange.LackMoney(player, MoneyType, MoneyVal, f_name)
									else
										sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(MoneyType).."不足，无法进行锻造")
									end
									return false
								end
							end
							if MoneyType == 4 then
								if player:GetGold() < MoneyVal then
									if MoneyChange then
										local f_name = [[EquipBuild.CheckCanBuild(]]..check..[[,sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..classify..[[,]]..index..[[,]]..issuper..[[)]]
										MoneyChange.LackMoney(player, MoneyType, MoneyVal, f_name)
									else
										sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(MoneyType).."不足，无法进行锻造")
									end
									return false
								end
							end
							if MoneyType == 2 then
								if player:GetBindIngot() < MoneyVal then
									if MoneyChange then
										local f_name = [[EquipBuild.CheckCanBuild(]]..check..[[,sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..classify..[[,]]..index..[[,]]..issuper..[[)]]
										MoneyChange.LackMoney(player, MoneyType, MoneyVal, f_name)
									else
										sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(MoneyType).."不足，无法进行锻造")
									end
									return false
								end
							end
							if MoneyType == 1 then
								if player:GetIngot() < MoneyVal then
									if MoneyChange then
										local f_name = [[EquipBuild.CheckCanBuild(]]..check..[[,sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..classify..[[,]]..index..[[,]]..issuper..[[)]]
										MoneyChange.LackMoney(player, MoneyType, MoneyVal, f_name)
									else
										sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(MoneyType).."不足，无法进行锻造")
									end
									return false
								end
							end
						end
					end
					local EquipVitality = tb_choose.vitality
					if EquipVitality then
						local playerVitality = player:GetAttr(ROLE_ATTR_VP)
						if playerVitality < EquipVitality then
							sLuaApp:NotifyTipsMsg(player, "您的活力不够，无法进行锻造")
							return false
						end
					end

					local item_tb = tb_choose.formula_basic
					local isEnough = true
					local OneKeyBuyList = {}
					if item_tb then
						for k,v in ipairs(item_tb) do
							local item = ""
							local num = 1
							if type(v) == "string" then
								item = v
								if item_tb[k+1] then
									if type(item_tb[k+1]) == "number" then
										num = item_tb[k+1]
									end
								end
							end
							if item ~= "" then
								if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
									table.insert(OneKeyBuyList,item)
									table.insert(OneKeyBuyList,(num - sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) ))
									--sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
									--return false
									isEnough = false
								end
							end
						end
					end
					if tonumber(issuper) == 1 then
						local item_tb = tb_choose.formula_adder
						if item_tb then
							for k,v in ipairs(item_tb) do
								local item = ""
								local num = 1
								if type(v) == "string" then
									item = v
									if item_tb[k+1] then
										if type(item_tb[k+1]) == "number" then
											num = item_tb[k+1]
										end
									end
								end
								if item ~= "" then
									if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
										table.insert(OneKeyBuyList,item)
										table.insert(OneKeyBuyList,(num - sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) ))
										--sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
										--return false
										isEnough = false
									end
								end
							end
						end
					end
					if isEnough == false then
						--sLuaApp:LuaDbg('OneKeyBuyList'..Lua_tools.serialize(OneKeyBuyList))
						if OneKeyBuy.Main( player , OneKeyBuyList ) == false then
							sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
						end
					end
					return isEnough
				end		
			end
		end
	end
	return false
end

function EquipBuild.DelayBuiding(player, timer_id, param)
	if type(timer_id) ~= "number" then
		return
	end
	
	local tb_param = sLuaApp:StrSplit(param, ",")
	local classify = tb_param[1]
	local index	= tonumber(tb_param[2])
	local issuper = tonumber(tb_param[3])
	local UseUnbind = tonumber(tb_param[4])
	local HaveBind = false
	
	if EquipBuild.CheckCanBuild(0, player, classify, index, issuper) == true then
		if EquipBuildConfig then
			if EquipBuildConfig.Synthesis then
				if EquipBuildConfig.Synthesis[classify] then
					local tb_choose = EquipBuildConfig.Synthesis[classify][index]

					if EquipBuild.CheckCanBuild(0, player, classify, index, issuper, UseUnbind) == false then
						return
					end
					local item_tb_basic = tb_choose.formula_basic
					if item_tb_basic then
						for k,v in ipairs(item_tb_basic) do
							local item = ""
							local num = 1
							if type(v) == "string" then
								item = v
								if item_tb_basic[k+1] then
									if type(item_tb_basic[k+1]) == "number" then
										num = item_tb_basic[k+1]
									end
								end
								local unBindItems = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 1)
								local BindItems = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 2)
								if UseUnbind == 0 then
									if BindItems ~= 0 then
										HaveBind = true
									end
								elseif UseUnbind == 1 then
									if unBindItems < num then
										HaveBind = true
									end
								end
							end
							if item ~= "" then
								if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
									sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
									return false
								end
							end
						end
						--if HaveBind == true then
						--	local str = [[GlobalUtils.ShowServerBoxMessage("使用的材料中含有绑定道具，这样打造出的装备为绑定装备，是否继续？")]]
						--	player:SetString("SYSTEM_ConfirmBox_Function", "EquipBuild.ConsumeItem('"..player:GetGUID().."','"..classify.."',"..index..","..issuper..","..tostring(BandFirst)..","..tostring(HaveBind)..")")
						--	sLuaApp:ShowForm(player, "脚本表单", str)
						--else
						--	EquipBuild.ConsumeItem(player:GetGUID(),classify,index,issuper,BandFirst,HaveBind)
						--end
					end
					if issuper == 1 then
						local item_tb_adder = tb_choose.formula_adder
						if item_tb_adder then
							for k,v in ipairs(item_tb_adder) do
								local item = ""
								local num = 1
								if type(v) == "string" then
									item = v
									if item_tb_adder[k+1] then
										if type(item_tb_adder[k+1]) == "number" then
											num = item_tb_adder[k+1]
										end
									end
								local unBindItems = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 1)
								local BindItems = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 2)
								if UseUnbind == 0 then
									if BindItems ~= 0 then
										HaveBind = true
									end
								elseif UseUnbind == 1 then
									if unBindItems < num then
										HaveBind = true
									end
								end
								end
								if item ~= "" then
									if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
										sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
										return false
									end
								end
							end
						end
					end
					if HaveBind == true then
						local str = [[GlobalUtils.ShowServerBoxMessage("使用的材料中含有绑定道具，这样打造出的装备为绑定装备，是否继续？")]]
						player:SetString("SYSTEM_ConfirmBox_Function", "EquipBuild.ConsumeItem('"..player:GetGUID().."','"..classify.."',"..index..","..issuper..","..tostring(UseUnbind)..","..tostring(HaveBind)..")")
						sLuaApp:ShowForm(player, "脚本表单", str)
					else
						EquipBuild.ConsumeItem(player:GetGUID(),classify,index,issuper,UseUnbind,HaveBind)
					end	
				end
			end
		end	
	end
end

function EquipBuild.ResultRandom(check, items_1)
	if check ~= 0 then
		return
	end
	local ResultRandomTable = {0}
	local ResultRandomItems = {}
	for k,v in ipairs(items_1) do
		if type(v) == "string" then
			table.insert(ResultRandomItems, v)
			if items_1[k+1] then
				if type(items_1[k+1]) == "number" then
					table.insert(ResultRandomTable, items_1[k+1] + ResultRandomTable[#ResultRandomTable])
				else
					table.insert(ResultRandomTable, 10000 + ResultRandomTable[#ResultRandomTable])
				end
			else
				table.insert(ResultRandomTable, 10000 + ResultRandomTable[#ResultRandomTable])
			end
		end
	end
	--if #items_2 > 0 then
	--	for k,v in ipairs(items_2) do
	--		if type(v) == "string" then
	--			table.insert(ResultRandomItems, v)
	--			if items_2[k+1] then
	--				if type(items_2[k+1]) == "number" then
	--					table.insert(ResultRandomTable, items_2[k+1] + ResultRandomTable[#ResultRandomTable])
	--				else
	--					table.insert(ResultRandomTable, 10000 + ResultRandomTable[#ResultRandomTable])
	--				end
	--			else
	--				table.insert(ResultRandomTable, 10000 + ResultRandomTable[#ResultRandomTable])
	--			end
	--		end
	--	end
	--end
	
	local ran = sLuaApp:RandInteger(0, ResultRandomTable[#ResultRandomTable])
	--print("ResultRandomTable = " .. Lua_tools.serialize(ResultRandomTable))
	--print("ResultRandomItems = " .. Lua_tools.serialize(ResultRandomItems))
	for i = 1,#ResultRandomItems do
		--print(i)
		if ran <= ResultRandomTable[i+1] and ran > ResultRandomTable[i] then
			return ResultRandomItems[i]
		end
	end
	
	return items_1[1]
end

function EquipBuild.ConsumeItem(playerguid,classify,index,issuper,UseUnbind,HaveBind)
	if playerguid == nil then
		return false
	end
	if classify == nil then
		return false
	end
	if index == nil then
		return false
	end
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(playerguid))
	local ItemContainer = player:GetItemContainer(1)
	if ItemContainer:GetFreeSiteCount() < 1 then
		sLuaApp:NotifyTipsMsg(player, "您需要有空余的包裹才能进行锻造！")
		return
	end
	local tb_choose = EquipBuildConfig.Synthesis[classify][index]
	if tb_choose then
		if tb_choose.consume then
			local MoneyType = tb_choose.consume.MoneyType
			local MoneyVal = tb_choose.consume.MoneyVal
			if MoneyType then
				if MoneyType == 5 then
					if not Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "装备打造", "打造消耗") then
						sLuaApp:NotifyTipsMsg(player, "您的银币不够，无法进行锻造")
						return
					end
				end
				if MoneyType == 4 then
					if not player:SubGold(MoneyVal,"system","装备打造","打造消耗") then
						sLuaApp:NotifyTipsMsg(player, "您的金币不够，无法进行锻造")
						return
					end
				end
				if MoneyType == 2 then
					if not Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "装备打造", "打造消耗") then
						sLuaApp:NotifyTipsMsg(player, "您的银元宝不够，无法进行锻造")
						return
					end
				end
				if MoneyType == 1 then
					if not Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "装备打造", "打造消耗") then
						sLuaApp:NotifyTipsMsg(player, "您的金元宝不够，无法进行锻造")
						return
					end
				end
			end
		end

		local EquipVitality = tb_choose.vitality
		if EquipVitality then
			if player:SubVp(EquipVitality,"system","装备打造","打造消耗") == false then
				sLuaApp:NotifyTipsMsg(player, "您的活力不够，无法进行锻造")
				return
			end
		end
	end
	local BandFirst = false
	if UseUnbind == 0 then
		BandFirst = true
	elseif UseUnbind == 1 then
		BandFirst = false
	end
	
	local itemList = tb_choose.formula_basic
	for k,v in ipairs(itemList) do
		local item = ""
		local num = 1
		if type(v) == "string" then
			item = v
			if itemList[k+1] then
				if type(itemList[k+1]) == "number" then
					num = itemList[k+1]
				end
			end
		end
		if item ~= "" then
			if not sItemSystem:ConsumeItemWithPriority(player, sItemSystem:GetItemIdByKeyname(item), num, BandFirst , "system", "装备打造", "作为普通材料消耗") then
				sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
				return false
			end
		end
	end
	if issuper == 1 then
		local item_tb = tb_choose.formula_adder
		for k,v in ipairs(item_tb) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item_tb[k+1] then
					if type(item_tb[k+1]) == "number" then
						num = item_tb[k+1]
					end
				end
			end
			if item ~= "" then
				if not sItemSystem:ConsumeItemWithPriority(player, sItemSystem:GetItemIdByKeyname(item), num, BandFirst , "system", "装备打造", "作为普通材料消耗") then
					sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
					return false
				end
			end
		end
	end
	--东西都扣成功了
	local itemR = ""
	if issuper == 0 then
		itemR = EquipBuild.ResultRandom(0, tb_choose.result_basic)
	elseif issuper == 1 then
		itemR = EquipBuild.ResultRandom(0, tb_choose.result_adder)
	end
	local equipsTable = sItemSystem:AddItemEx(player, sItemSystem:GetItemIdByKeyname(itemR), 1, HaveBind, "system", "装备打造", ""..classify.."_"..itemR)
	
	if #equipsTable ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "打造成功")
		sLuaApp:ShowForm(player, "脚本表单", "if EquipProduceUI then EquipProduceUI.OnBuildSucces() end")
		if Achievement then
			Achievement.Equip_Other(player,2)
		end
		--随机套装
		local Suit = Lua_tools.PlayerStartRandom(tb_choose.SuitRadom,"EquipBuild_SuitRandom_"..classify.."_"..index,1, false, false)
		if Suit[1] == "none" then
			return
		else
			SuitSys.set_equip_suit_keyname(equipsTable[1],Suit[1])
		end
		--随机特技
		--随机特效
	end

end

function EquipBuild.CheckRedPoint(player)
	local TB_EquipBuild = {}
	if EquipBuild.Role_Sex_NormalTB then
		local Role_Id = player:GetAttr(1)
		if Role_Id then
			TB_EquipBuild = EquipBuild.Role_Sex_NormalTB["Role = "..tostring(Role_Id)]
		end
	end
	local WhetherRedPoint = "false"
	local record = 0
	if EquipBuildConfig.Classify_Table and EquipBuildConfig.Synthesis then 
		for i = 1, #EquipBuildConfig.Classify_Table do
			local classify = EquipBuildConfig.Classify_Table[i]
			if TB_EquipBuild and classify and TB_EquipBuild[classify] then	
				local isEnough = false
				if record == 0 then
					for j = 1, #TB_EquipBuild[classify] do
						local tb_choose = TB_EquipBuild[classify][j]
						isEnough = EquipBuild.CheckCanBuild_RedPoint(player, tb_choose)
						if isEnough == true then
							WhetherRedPoint = "true"
							record = 1
						end
					end
				end
			else
				sLuaApp:LuaErr("缺少EquipBuildConfig.Synthesis[classify]数据")
			end
		end
	else
		sLuaApp:LuaErr("EquipBuild.CheckRedPoint缺少EquipBuildConfig.Classify_Table数据")
	end
	TB_EquipBuild["WhetherRedPoint"] = WhetherRedPoint
	--sLuaApp:LuaErr(Lua_tools.serialize(TB_EquipBuild))
	return TB_EquipBuild
end

function EquipBuild.CheckCanBuild_RedPoint(player, tb_choose)
	if tb_choose then
		if tb_choose.consume then
			local MoneyType = tb_choose.consume.MoneyType
			local MoneyVal = tb_choose.consume.MoneyVal
			if MoneyType then
				if MoneyType == 5 then
					if player:GetBindGold() < MoneyVal then
						return false
					end
				end
				if MoneyType == 4 then
					if player:GetGold() < MoneyVal then
						return false
					end
				end
				if MoneyType == 2 then
					if player:GetBindIngot() < MoneyVal then
						return false
					end
				end
				if MoneyType == 1 then
					if player:GetIngot() < MoneyVal then
						return false
					end
				end
			end
		end
		local EquipVitality = tb_choose.vitality
		if EquipVitality then
			local playerVitality = player:GetAttr(ROLE_ATTR_VP)
			if playerVitality < EquipVitality then
				return false
			end
		end
		local item_tb = tb_choose.formula_basic
		local isEnough = true
		if item_tb then
			for k,v in ipairs(item_tb) do
				local item = ""
				local num = 1
				if type(v) == "string" then
					item = v
					if item_tb[k+1] then
						if type(item_tb[k+1]) == "number" then
							num = item_tb[k+1]
						end
					end
				end
				if item ~= "" then
					if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
						isEnough = false
					end
				end
			end
		end
		if tonumber(issuper) == 1 then
			local item_tb = tb_choose.formula_adder
			if item_tb then
				for k,v in ipairs(item_tb) do
					local item = ""
					local num = 1
					if type(v) == "string" then
						item = v
						if item_tb[k+1] then
							if type(item_tb[k+1]) == "number" then
								num = item_tb[k+1]
							end
						end
					end
					if item ~= "" then
						if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
							isEnough = false
						end
					end
				end
			end
		end
		--if isEnough == false then
		--end
		return isEnough
	end
	return false
end

function EquipBuild.Initialization(check)
	if check ~= 0 then
		return
	end
	if not EquipBuildConfig then
		require("form/EquipBuild_Config")
	end
	--sLuaApp:LuaDbg("EquipBuild.Initialization")
	if EquipBuildConfig then
		--sLuaApp:LuaDbg("EquipBuildConfig")
		if not EquipBuild.Synthesis then
			EquipBuild.Synthesis = {}
		end
		if not EquipBuild.Role_Sex_NormalTB then       --新加
			EquipBuild.Role_Sex_NormalTB = {}          --新加
		end                                            --新加
		if EquipBuildConfig.Classify_Table then
			for k,v in ipairs(EquipBuildConfig.Classify_Table) do
				EquipBuild.Synthesis[v] = {}
				--sLuaApp:LuaErr(Lua_tools.serialize(v))
			end
		end
		if EquipBuildConfig.Synthesis then
			for k,v in pairs(EquipBuild.Synthesis) do
				local tb_Sys = EquipBuildConfig.Synthesis[k]
				if tb_Sys then
					for a,b in ipairs(tb_Sys) do
						b.index = a
						if b.condition then
							local str_name = ""
							if type(b.condition['Role']) == "table" then
								str_name = (b.condition['Role'][1] or "0") .. "_" .. (b.condition['Role'][2] or "0") .. "_" .. (b.condition['School'] or "0") .. "_" .. (b.condition['Sex'] or "0")
							else
								str_name = (b.condition['Role'] or "0") .. "_" .. (b.condition['School'] or "0") .. "_" .. (b.condition['Sex'] or "0")
							end

							if str_name == "0_0_0" then
								str_name = 'Normal'
							end
							if not EquipBuild.Synthesis[k][str_name] then
								EquipBuild.Synthesis[k][str_name] = {}
							end
							table.insert(EquipBuild.Synthesis[k][str_name],b)
						else
							if not EquipBuild.Synthesis[k]['Normal'] then
								EquipBuild.Synthesis[k]['Normal'] = {}
							end
							table.insert(EquipBuild.Synthesis[k]['Normal'],b)
						end
					end
				end
			end
			local roleTB = RoleConfig.GetTableData()
			for i = 1, #roleTB do
				--sLuaApp:LuaErr(roleTB[i]["Id"])
				if not EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]] then
					EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]] = {}
				end
				for k,v in ipairs(EquipBuildConfig.Classify_Table) do
					if not EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]][v] then
						EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]][v] = {}
					end
					if EquipBuildConfig.Synthesis[v] then
						for m = 1, #EquipBuildConfig.Synthesis[v] do
							if EquipBuildConfig.Synthesis[v][m] then
								if EquipBuildConfig.Synthesis[v][m]["condition"] then
									if EquipBuildConfig.Synthesis[v][m]["condition"]["Role"] then
										if type(EquipBuildConfig.Synthesis[v][m]["condition"]["Role"]) == "table" then
											for a, b in pairs(EquipBuildConfig.Synthesis[v][m]["condition"]["Role"]) do
												local Role = EquipBuildConfig.Synthesis[v][m]["condition"]["Role"][a]
												if Role == tonumber(roleTB[i]["Id"]) then
													--sLuaApp:LuaErr("Role  A==========   "..Role)
													local tb = {}
													tb.ConsumeItem = EquipBuildConfig.Synthesis[v][m]["formula_basic"]
													tb.MoneyCost = EquipBuildConfig.Synthesis[v][m]["consume"]
													tb.Vitality = EquipBuildConfig.Synthesis[v][m]["vitality"]
													tb.Item = {}
													tb.Item.Index = m
													--sLuaApp:LuaDbg("table"..Lua_tools.serialize(tb))
													table.insert(EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]][v], tb)
												end
											end
										elseif type(EquipBuildConfig.Synthesis[v][m]["condition"]["Role"]) == "number" then
											local Role = EquipBuildConfig.Synthesis[v][m]["condition"]["Role"]
											--sLuaApp:LuaErr("Role  B==========   "..Role)		--Role = 0 代表通用装备
											if Role == tonumber(roleTB[i]["Id"]) or Role == 0 then
												local tb = {}
												tb.ConsumeItem = EquipBuildConfig.Synthesis[v][m]["formula_basic"]
												tb.MoneyCost = EquipBuildConfig.Synthesis[v][m]["consume"]
												tb.Vitality = EquipBuildConfig.Synthesis[v][m]["vitality"]
												tb.Item = {}
												tb.Item.Index = m
												--sLuaApp:LuaDbg("number"..Lua_tools.serialize(tb))
												table.insert(EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]][v], tb)
											end
										end
									elseif EquipBuildConfig.Synthesis[v][m]["condition"]["Sex"] then
										local Sex = EquipBuildConfig.Synthesis[v][m]["condition"]["Sex"]
										if Sex == tonumber(roleTB[i]["Sex"])then
											local tb = {}
											tb.ConsumeItem = EquipBuildConfig.Synthesis[v][m]["formula_basic"]
											tb.MoneyCost = EquipBuildConfig.Synthesis[v][m]["consume"]
											tb.Vitality = EquipBuildConfig.Synthesis[v][m]["vitality"]
											tb.Item = {}
											tb.Item.Index = m
											--sLuaApp:LuaDbg("Sex"..Lua_tools.serialize(tb))
											table.insert(EquipBuild.Role_Sex_NormalTB["Role = "..roleTB[i]["Id"]][v], tb)
										end
									end
								end
							end
						end
					end
				end
			end
			--sLuaApp:LuaDbg('EquipBuild.Role_Sex_NormalTB  = ' .. Lua_tools.serialize(EquipBuild.Role_Sex_NormalTB))
		end
		--sLuaApp:LuaDbg('Synthesis  = ' .. Lua_tools.serialize(EquipBuild.Synthesis))
	end	
end

EquipBuild.Initialization(0)