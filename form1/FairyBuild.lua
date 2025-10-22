require("form/FairyBuild_Config")
--装备制造表单

FairyBuild = {}

function FairyBuild.GetData(player, Version)
	sLuaApp:LuaDbg("信息接收1")
	if FairyBuildConfig then	
		sLuaApp:LuaDbg("表格判断")
		if Version ~= FairyBuildConfig.Version then
			local str = ""
			local dataTb = {}
			dataTb.Version = FairyBuildConfig.Version
			dataTb.Build_Time = FairyBuildConfig.Build_Time
			dataTb.Synthesis = {}
			
			local role = player:GetAttr(ROLE_ATTR_ROLE)
			local school1 = player:GetAttr(ROLE_ATTR_JOB_1)
			local school2 = player:GetAttr(ROLE_ATTR_JOB_2)
			local school3 = player:GetAttr(ROLE_ATTR_JOB_3)
			local sex = player:GetAttr(ROLE_ATTR_GENDER)
			sLuaApp:LuaDbg("基础获取")
			if FairyBuild.Synthesis then
				sLuaApp:LuaDbg("FairyBuild.Synthesis存在")
				--sLuaApp:LuaDbg(Lua_tools.serialize(FairyBuild.Synthesis))
				for a,b in pairs(FairyBuild.Synthesis) do
					if a == 'Normal' then
						dataTb.Synthesis['Normal'] = b
					else
						local tb_condition = sLuaApp:StrSplit(a, "_")
						local condition1 = tonumber(tb_condition[1])
						local condition2 = tonumber(tb_condition[2])
						local condition3 = tonumber(tb_condition[3])
						if role == condition1 or condition1 == 0 then
							if condition2 == 0 or school1 == condition2 or school2 == condition2 or school3 == condition2 then
								if sex == condition3 or condition3 == 0 then
									dataTb.Synthesis[a] = b
								end
							end
						end
					end
				end
			end
			if Lua_tools then
				sLuaApp:LuaDbg("表单回馈")
				str = [[ if EquipFairyProduceUI then
						EquipFairyProduceUI.serverData = ]] .. Lua_tools.serialize(dataTb) .. [[
						EquipFairyProduceUI.Refresh()
					end
				]]
				--sLuaApp:LuaDbg("Tb = " .. Lua_tools.serialize(dataTb))
				sLuaApp:ShowForm(player, "脚本表单", str)
			end
		end
	end
end

function FairyBuild.StartBuilding(player, index, dir)
	--sLuaApp:LuaDbg('StartBuilding')
	if FairyBuild.CheckCanBuild(0, player, index, dir) == true then	
		sLuaApp:ShowForm(player, "脚本表单", "if EquipFairyProduceUI then EquipFairyProduceUI.OnBuildSucces() end")
		sLuaTimerSystem:AddTimerEx(player, (FairyBuildConfig.Build_Time or 1), 1, "FairyBuild.DelayBuiding", index .. "," .. dir)
	end
end

function FairyBuild.CheckCanBuild(check, player, index, dir)
	if check ~= 0 then
		return false
	end
	
	local ItemContainer = player:GetItemContainer(1) 
	if ItemContainer:GetFreeSiteCount() < 1 then
		sLuaApp:NotifyTipsMsg(player, "您的需要有空余的包裹才能进行锻造！")
		return false
	end
	
	if FairyBuildConfig then
		if FairyBuildConfig.Synthesis then

				local tb_choose = FairyBuildConfig.Synthesis[index]
				if tb_choose then
					if tb_choose.consume then
						local consumes = tb_choose.consume
						if consumes.MoneyType and consumes.MoneyVal then
							if not Lua_tools.IsMoneyEnough(player, consumes.MoneyType, consumes.MoneyVal) then
								sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consumes.MoneyVal).."不够，无法进行锻造")
								return
							end
						end
						--
						--if consumes then
						--	if player:GetBindGold() < consumes then
						--		sLuaApp:NotifyTipsMsg(player, "您的银币不够，无法进行锻造")
						--		return false
						--	end
						--end
						--consumes = tb_choose.consume.Gold
						--if consumes then
						--	if player:GetGold() < consumes then
						--		sLuaApp:NotifyTipsMsg(player, "您的金币不够，无法进行锻造")
						--		return false
						--	end
						--end
						--consumes = tb_choose.consume.BindIngot
						--if consumes then
						--	if player:GetBindIngot() < consumes then
						--		sLuaApp:NotifyTipsMsg(player, "您的银元宝不够，无法进行锻造")
						--		return false
						--	end
						--end
						--consumes = tb_choose.consume.Ingot
						--if consumes then
						--	if player:GetIngot() < consumes then
						--		sLuaApp:NotifyTipsMsg(player, "您的金元宝不够，无法进行锻造")
						--		return false
						--	end
						--end
					end
					local item_tb = tb_choose.formula
					local DefectList = Lua_tools.GetDefectList(player, item_tb)
					if #DefectList ~= 0 then
						OneKeyBuy.Main(player, DefectList)
						sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
						return false
					end
					--if item_tb then
					--	for k,v in ipairs(item_tb) do
					--		local item = ""
					--		local num = 1
					--		if type(v) == "string" then
					--			item = v
					--			if item_tb[k+1] then
					--				if type(item_tb[k+1]) == "number" then
					--					num = item_tb[k+1]
					--				end
					--			end
					--		
					--			if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(item), 3) < num then
					--				sLuaApp:LuaDbg("item = " .. item)
					--				sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
					--				return false
					--			end
					--		end
					--	end
					--end
					local item_rw = tb_choose.result
					dir = tonumber(dir)
					--sLuaApp:LuaDbg("CHECK    dir = " .. dir)
					if not dir then
						sLuaApp:NotifyTipsMsg(player, "锻造方向不明确")
						return false
					end
					if not item_rw[dir] then
						sLuaApp:NotifyTipsMsg(player, "锻造方向超出范围")
						return false
					end
					return true
				end		

		end
	end
	return false
end

function FairyBuild.DelayBuiding(player, timer_id, param)
	--sLuaApp:LuaDbg("DelayBuiding")
	if type(timer_id) ~= "number" then
		sLuaApp:LuaDbg("BUILD    return ")
		return
	end
	--sLuaApp:LuaDbg("BUILD    param = " .. param)
	local tb_param = sLuaApp:StrSplit(param, ",")
	--sLuaApp:LuaDbg("BUILD    tb_param = " .. Lua_tools.serialize(tb_param))
	local index	= tonumber(tb_param[1])
	local dir = tonumber(tb_param[2])
	--sLuaApp:LuaDbg("BUILD    dir = " .. dir)
	
	local ItemContainer = player:GetItemContainer(1) 
	if ItemContainer:GetFreeSiteCount() < 1 then
		sLuaApp:NotifyTipsMsg(player, "您的需要有空余的包裹才能进行锻造！")
		return
	end
	
	if FairyBuild.CheckCanBuild(0, player, index, dir) == true then
		if FairyBuildConfig then
			--sLuaApp:LuaDbg("DelayBuiding_1")
			if FairyBuildConfig.Synthesis then
					local tb_choose = FairyBuildConfig.Synthesis[index]
					if tb_choose then
						--sLuaApp:LuaDbg("DelayBuiding_2")
						if tb_choose.consume then
							local consumes = tb_choose.consume
							if consumes.MoneyType and consumes.MoneyVal then
								if not Lua_tools.SubMoney(player, consumes.MoneyType, consumes.MoneyVal, "system", "装备打造", "打造消耗") then
									sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consumes.MoneyVal).."不够，无法进行锻造")
									return
								end
							end
							--local consumes = tb_choose.consume.BindGold
							--if consumes then
							--	if not player:SubBindGold(consumes,"system","装备打造","打造消耗") then
							--		sLuaApp:NotifyTipsMsg(player, "您的银币不够，无法进行锻造")
							--		return
							--	end
							--end
							--consumes = tb_choose.consume.Gold
							--if consumes then
							--	if not player:SubGold(consumes,"system","装备打造","打造消耗") then
							--		sLuaApp:NotifyTipsMsg(player, "您的金币不够，无法进行锻造")
							--		return
							--	end
							--end
							--consumes = tb_choose.consume.BindIngot
							--if consumes then
							--	if not player:SubBindIngot(consumes,"system","装备打造","打造消耗") then
							--		sLuaApp:NotifyTipsMsg(player, "您的银元宝不够，无法进行锻造")
							--		return
							--	end
							--end
							--consumes = tb_choose.consume.Ingot
							--if consumes then
							--	if not player:SubIngot(consumes,"system","装备打造","打造消耗") then
							--		sLuaApp:NotifyTipsMsg(player, "您的金元宝不够，无法进行锻造")
							--		return
							--	end
							--end
						end

						local item_tb = tb_choose.formula
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
								
									if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(item), num, 3, "system", "装备打造", "作为普通材料消耗") ~= 0 then
										sLuaApp:NotifyTipsMsg(player, "您的材料不够，无法进行锻造")
										return
									end
								end
							end
						end
						local item_rw = tb_choose.result
						
						sLuaApp:LuaDbg("BUILD    dir = " .. dir)
						if not dir then
							sLuaApp:NotifyTipsMsg(player, "锻造方向不明确")
							return
						end
						
						if not item_rw[dir] then
							sLuaApp:NotifyTipsMsg(player, "锻造方向超出范围")
							return
						end
						
						local itemKey = item_rw[dir].item
						--东西都扣成功了
						local item = sItemSystem:AddItemEx(player, sItemSystem:GetItemIdByKeyname(itemKey), 1, false, "system", "装备打造", ""..itemKey)[1]
						if item then
							sLuaApp:ShowForm(player, "脚本表单", "if EquipFairyProduceUI then EquipFairyProduceUI.OnBuildSucces('"..item:GetGUID().."') end")
							sLuaApp:NotifyTipsMsg(player, "锻造成功")
							
							--打造任务判断
							if sQuestSystem:GetQuestState(player,4) == 3 then
								sQuestSystem:ForceReady(player,4)
							end
						end
					end		

			end
		end	
	end
end

function FairyBuild.Initialization(check)
	if check ~= 0 then
		return
	end
	print("FairyBuild.Initialization")
	if not FairyBuildConfig then
		require("form/FairyBuild_Config")
	end
	if FairyBuildConfig then
		--print("FairyBuildConfig")
		if not FairyBuild.Synthesis then
			FairyBuild.Synthesis = {}
		end
		if FairyBuildConfig.Synthesis then
			for k,v in pairs(FairyBuildConfig.Synthesis) do
				v.index = k
				if v.condition then
					local str_name = (v.condition['Role'] or "0") .. "_" .. (v.condition['School'] or "0") .. "_" .. (v.condition['Sex'] or "0")
					if str_name == "0_0_0" then
						str_name = 'Normal'
					end
					if not FairyBuild.Synthesis[str_name] then
						FairyBuild.Synthesis[str_name] = {}
					end
					table.insert(FairyBuild.Synthesis[str_name],v)
				else
					if not FairyBuild.Synthesis['Normal'] then
						FairyBuild.Synthesis['Normal'] = {}
					end
					table.insert(FairyBuild.Synthesis['Normal'],v)
				end
			end
		end
		--if Lua_tools then
		--	sLuaApp:LuaDbg(Lua_tools.serialize(FairyBuild.Synthesis))
		--end
	end
end

--FairyBuild.Initialization(0)