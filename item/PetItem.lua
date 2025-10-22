--装备相关表单

PetItem = {}

--GROW 		增加成长率，100 = 0.01
--EXP		增加经验值，不会自动转生
--RESPEC	宠物洗点
--REARTI	炼妖重置
--LOYAL		增加忠诚度
--INTIM		增加亲密度
PetItem.List = {
	['成长丹'] = {Attr = "GROW", Val = 100, Desc = "成长率"},
	['神兽丹'] = {Attr = "EXP", Val = 68000, Desc = "经验值"},
	['高级神兽丹'] = {Attr = "EXP", Val = 340000, Desc = "经验值"},
	['超级神兽丹'] = {Attr = "EXP", Val = 3000000, Desc = "经验值"},
	['一转易筋丸'] = {Attr = "RE_1", Desc = "等级"},
	['重洗髓丹'] = {Attr = "RESPEC", Desc = ""},
	['炼妖重置丹'] = {Attr = "REARTI", Desc = ""},
	['忠诚度1'] = {Attr = "LOYAL", Val = 10, ValMax = 200, Desc = "忠诚度"},
	['忠诚度2'] = {Attr = "LOYAL", Val = 30, ValMax = 200, Desc = "忠诚度"},
	['忠诚度3'] = {Attr = "LOYAL", Val = 50, ValMax = 200, Desc = "忠诚度"},
	['忠诚度4'] = {Attr = "LOYAL", Val = 100, ValMax = 200, Desc = "忠诚度"},
	['亲密度1'] = {Attr = "INTIM", Val = 10000, ValMax = 20000000, Desc = "亲密度"},
	['亲密度2'] = {Attr = "INTIM", Val = 30000, ValMax = 20000000, Desc = "亲密度"},
	['亲密度3'] = {Attr = "INTIM", Val = 200000, ValMax = 20000000, Desc = "亲密度"},
}

--宠物最大成长次数
local PetMaxGrowTimes = 3

function PetItem.ChooseItem(player, pet_guid, item_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法查看")
		return ""
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if not item then
		sLuaApp:LuaErr("PetItem.ChooseItem 找不到该物品 item_guid" .. item_guid)
		return ""
	end
	local item_Key = item:GetKeyName()
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法查看")
		return ""
	end
	
	local RecoveryList = ""
	if PetItem.List[item_Key] then
		local tb_Use = PetItem.List[item_Key]
		if tb_Use.Attr then
			local attrAdd = tb_Use.Attr
			if attrAdd == "EXP" then			--增加宠物经验
				local level = pet:GetAttr(ROLE_ATTR_LEVEL)
				local rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
				local now_exp = pet:GetAttr(ROLE_ATTR_EXP)
				local surplus = tb_Use.Val
				local levelup = PetLevelConfig.GetByLevelReincarnation(level, rein).UpgradeExp
				surplus = surplus - (levelup - now_exp)
				local newlevel = level + 1
				if PetLevelConfig.GetByLevelReincarnation(level + 1, rein) == nil then
					RecoveryList = "等级,"..level..","..level
				elseif surplus > 0 then
					while surplus >= 0 do
						local now_tb = PetLevelConfig.GetByLevelReincarnation(newlevel, rein)
						if now_tb then
							surplus = surplus - now_tb.UpgradeExp
							if surplus > 0 then
								newlevel = newlevel + 1
							else
								break
							end
						else
							break	
						end
					end
					RecoveryList = "等级,"..level..","..newlevel
				elseif surplus == 0 then
					RecoveryList = "等级,"..level..","..newlevel
				else
					RecoveryList = "经验值,"..now_exp..","..(now_exp + tb_Use.Val)
				end
			elseif attrAdd == "REARTI" then			--重置炼妖
				local times = pet:GetInt("PET_ArtificeTimes")
				if times > 0 then
					RecoveryList = "炼妖次数,"..times..",0,"
					local ArtMark = PetAttrClassify.PetArtifice or 11
					for k,v in ipairs(pet:GetDynAttrsByMark(ArtMark)) do
						local old_val = pet:GetDynAttr(v.attr)
						local new_val = old_val - v.value
						local tb_attr = AttrConfig.GetById(v.attr)
						if tb_attr then
							if tb_attr.IsPct == 1 then
								old_val = old_val/10000 .. "%"
								new_val = new_val/10000 .. "%"
							end
							RecoveryList = ","..tb_attr.ChinaName..","..old_val .. "," .. new_val							
						end
					end
				else
					RecoveryList = "炼妖次数,0,0"
				end
			elseif attrAdd == "GROW" then			--成长值
				local now_times = pet:GetInt("PET_GrowTimes")
				if now_times >= PetMaxGrowTimes then
					RecoveryList = "成长次数,"..now_times..","..now_times
				else
					local now_grow = pet:GetAttr(PET_ATTR_GROWTHRATE)
					RecoveryList = "成长次数,"..now_times..","..(now_times+1)..",成长率,"..(now_grow/10000)..","..((now_grow+tb_Use.Val)/10000)
				end
			elseif attrAdd == "RESPEC" then			--宠物洗点
				local points_used = pet:GetInt("PET_PointsUsed")
				local points_now = pet:GetAttr(ROLE_ATTR_REMAIN_POINT)
				if points_used > 0 then
					local attr1 = pet:GetAttr(ROLE_ATTR_VIT)
					local attr2 = pet:GetAttr(ROLE_ATTR_INT)
					local attr3 = pet:GetAttr(ROLE_ATTR_STR)
					local attr4 = pet:GetAttr(ROLE_ATTR_AGI)
					RecoveryList = "剩余加点,"..points_now..","..(points_now+points_used)
					RecoveryList = RecoveryList..",根骨,"..attr1..","..(attr1-pet:GetAttr(ROLE_ATTR_VIT_POINT))
					RecoveryList = RecoveryList..",灵性,"..attr2..","..(attr2-pet:GetAttr(ROLE_ATTR_INT_POINT))
					RecoveryList = RecoveryList..",力量,"..attr3..","..(attr3-pet:GetAttr(ROLE_ATTR_STR_POINT))
					RecoveryList = RecoveryList..",敏捷,"..attr4..","..(attr4-pet:GetAttr(ROLE_ATTR_AGI_POINT))
				else
					RecoveryList = "剩余加点,"..points_now..","..points_now
				end
			elseif attrAdd == "LOYAL" then			--忠诚度恢复
				local loyal = pet:GetAttr(PET_ATTR_LOYALTY)
				local loyal_new = loyal + tb_Use.Val
				if loyal_new > tb_Use.ValMax then
					loyal_new = tb_Use.ValMax
				end
				RecoveryList = "忠诚度,"..loyal..","..loyal_new
			elseif attrAdd == "INTIM" then			--亲密度增加
				local loyal = pet:GetAttr(PET_ATTR_CLOSE_POINT)
				local loyal_new = loyal + tb_Use.Val
				if loyal_new > tb_Use.ValMax then
					loyal_new = tb_Use.ValMax
				end
				RecoveryList = "亲密度,"..loyal..","..loyal_new
				if PetIntimacy then
					local loyal_level = pet:GetInt("PET_IntimacyLevel")	
					if loyal_level == 0 then
						loyal_level = 1
					end
					local loyal_level_new = PetIntimacy.CheckLevel(loyal_new)
					--if loyal_level ~= loyal_level_new then
					RecoveryList = RecoveryList..",".."亲密等级,"..(loyal_level == PetIntimacy.LevelMax and "MAX" or loyal_level)..","..(loyal_level_new == PetIntimacy.LevelMax and "MAX" or loyal_level_new)
						local old_List = PetIntimacy.Config[loyal_level].AttrList
						local new_List = {}
						local levelmax = 1
						if PetIntimacy.Config[loyal_level_new] then
							new_List = PetIntimacy.Config[loyal_level_new].AttrList
							levelmax = 0
						end
						local wrigted_List = {}
						local contrast = {}
						for k,v in ipairs(new_List) do
							if type(v) == "string" then
								contrast[v] = (type(new_List[k+1]) == "number" and new_List[k+1] or 1)
							end
						end
						--sLuaApp:LuaDbg("old_List = " .. Lua_tools.serialize(old_List))
						--sLuaApp:LuaDbg("new_List = " .. Lua_tools.serialize(new_List))
						--sLuaApp:LuaDbg("contrast = " .. Lua_tools.serialize(contrast))

						for k,v in ipairs(old_List) do
							if type(v) == "string" then
								wrigted_List[v] = (type(old_List[k+1]) == "number" and old_List[k+1] or 1)
								local attrData = AttrConfig.GetByKeyName(v)
								--sLuaApp:LuaDbg("attrData = " .. Lua_tools.serialize(attrData))
								--sLuaApp:LuaDbg("IsPct = " .. attrData.IsPct .. "    Type = ".. type(attrData.IsPct))
								if attrData.IsPct == 1 then
									wrigted_List[v] = wrigted_List[v]/100 .. "%"
									if contrast[v] then
										contrast[v] = contrast[v]/100 .. "%"
									else
										contrast[v] = 0
									end
								end
								--sLuaApp:LuaDbg("wrigted_List[v] = " .. wrigted_List[v] .. "    contrast[v] = ".. contrast[v])
								RecoveryList = RecoveryList..","..attrData.ChinaName..","..wrigted_List[v]..","..(levelmax == 1 and wrigted_List[v] or contrast[v])
								contrast[v] = nil
							end
						end
						
						for k,v in ipairs(contrast) do
							if v then
								local attrData = AttrConfig.GetByKeyName(k)
								if attrData.IsPct == 1 then
									v = v/10000 .. "%"
								end
								RecoveryList = RecoveryList..","..attrData.ChinaName..",0,"..v
							end
						end
					--end
				end
			elseif attrAdd == "RE_1" then			--转生
				local Rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
				if Rein >= 1 then
					RecoveryList = "转生次数,"..Rein..","..Rein
				else
					RecoveryList = "转生次数,0,1,等级,"..pet:GetAttr(ROLE_ATTR_LEVEL)..",1"
				end
			end
		elseif tb_Use.Custom then
		
		end
	else
		local itemData = ItemConfig.GetByKeyName(item_Key)
		local itemType = itemData.Type
		local itemSubType = itemData.Subtype
		local itemUser = itemData.User
		if itemType == 2 and itemSubType == 1 then
			if itemUser == 0 or itemUser == 2 then
				local PetHp = pet:GetAttr(ROLE_ATTR_HP)
				local PetHpMax = pet:GetAttr(ROLE_ATTR_HP_LIMIT)
				local PetMp = pet:GetAttr(ROLE_ATTR_MP)
				local PetMpMax = pet:GetAttr(ROLE_ATTR_MP_LIMIT)
				if PetHp > PetHpMax then
					sLuaApp:LuaDbg("宠物数值异常，HP = " .. PetHp .. "  HpMax = " .. PetHpMax)
					PetHp = PetHpMax
				end
				if PetMp > PetMpMax then
					sLuaApp:LuaDbg("宠物数值异常，MP = " .. PetMp .. "  MpMax = " .. PetMpMax)
					PetMp = PetMpMax
				end
				
				for k,v in ipairs(item:GetDynAttrsByMark(0)) do
					if v.attr == 40 then
						--当前血量
						local useOver = PetHp + v.value
						if useOver > PetHpMax then
							useOver = PetHpMax
						end
						RecoveryList = "生命值,"..PetHp..","..useOver
					elseif v.attr == 54 then
						--血量最大值
						local useOver = PetHp + math.floor(PetHpMax*v.value/1000)
						if useOver > PetHpMax then
							useOver = PetHpMax
						end
						RecoveryList = "生命值,"..PetHp..","..useOver	
					elseif v.attr == 42 then
						--当前法力
						local useOver = PetMp + v.value
						if useOver > PetMpMax then
							useOver = PetMpMax
						end
						RecoveryList = "法力值,"..PetMp..","..useOver
					elseif v.attr == 55 then
						--法力最大值
						local useOver = PetMp + math.floor(PetMpMax*v.value/1000)
						if useOver > PetMpMax then
							useOver = PetMpMax
						end
						RecoveryList = "法力值,"..PetMp..","..useOver	
					end
				end
			else
				sLuaApp:NotifyTipsMsg(player, "该道具无法对宠物使用")
				return ""
			end
		end
	end
	sLuaApp:ShowForm(player, "脚本表单", "if PetEduUI then PetEduUI.ShowGoodsInfo('"..RecoveryList.."') end")
end

function PetItem.UseItem(player, pet_guid, item_guid, isConfirm)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_id = item:GetId()
	local item_Key = item:GetKeyName()
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
		return ""
	end
	
	local sucess = 0
	if PetItem.List[item_Key] then
		local tb_Use = PetItem.List[item_Key]
		if tb_Use.Attr then
			local attrAdd = tb_Use.Attr
			if attrAdd == "EXP" then			--增加宠物经验
				local level = pet:GetAttr(ROLE_ATTR_LEVEL)
				local rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
				local now_exp = pet:GetAttr(ROLE_ATTR_EXP)
				local surplus = tb_Use.Val
				local levelup = PetLevelConfig.GetByLevelReincarnation(level, rein).UpgradeExp
				surplus = surplus - (levelup - now_exp)
				local newlevel = level + 1
				local now_tb = PetLevelConfig.GetByLevelReincarnation(newlevel, rein)
				if now_tb then
					if sItemSystem:ConsumeItem(item,1,"system","宠物升级","宠物对象:"..pet_guid) == 0 then
						pet:AddExp(tb_Use.Val,"system","宠物升级","宠物对象:"..pet_guid)
					end
				else
					sLuaApp:NotifyTipsMsg(player, "宠物已经到达最大等级，无法再升级了！")	
				end
			elseif attrAdd == "REARTI" then			--重置炼妖
				if isConfirm ~= 1 then
					local str = [[GlobalUtils.ShowServerBoxMessage("重置炼妖效果，宠物将失去所有炼妖属性。确定重置吗？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "PetItem.ConfirmUse('"..player:GetGUID().."','"..pet_guid.."','"..item_guid.."'")
					sLuaApp:ShowForm(player, "脚本表单", str)
				end
				local times = pet:GetInt("PET_ArtificeTimes")
				if times > 0 then
					if sItemSystem:ConsumeItem(item,1,"system","宠物成长","宠物对象:"..pet_guid) == 0 then
						if PetArtifice.ResetArtifice(player, pet) then
							sLuaApp:NotifyTipsMsg(player, "重置成功，您的宠物忘记了炼妖属性！")
						end
					end
				else
					sLuaApp:NotifyTipsMsg(player, "宠物未进行过炼妖")
				end
			elseif attrAdd == "GROW" then			--成长值
				local now_times = pet:GetInt("PET_GrowTimes")
				if now_times >= PetMaxGrowTimes then
					sLuaApp:NotifyTipsMsg(player, "宠物已经不能进行更多的成长了")
				else
					if sItemSystem:ConsumeItem(item,1,"system","宠物成长","宠物对象:"..pet_guid) == 0 then
						pet:AddPetGrowthrate(100)
						sLuaApp:NotifyTipsMsg(player, "使用成功")
						sucess = 1
						pet:SetInt("PET_GrowTimes", pet:GetInt("PET_GrowTimes")+1)
					end
				end
			elseif attrAdd == "RESPEC" then			--宠物洗点
				local points_used = pet:GetInt("PET_PointsUsed")
				local points_now = pet:GetAttr(ROLE_ATTR_REMAIN_POINT)
				if points_used > 0 then
					if sItemSystem:ConsumeItem(item,1,"system","宠物成长","宠物对象:"..pet_guid) == 0 then
						pet:ClearPoint()
						points_used = pet:SetInt("PET_PointsUsed", 0)
						sLuaApp:NotifyTipsMsg(player, "使用成功")
						sucess = 1
					end
				else
					sLuaApp:NotifyTipsMsg(player, "宠物还没加过点！不能洗点~")
				end
			elseif attrAdd == "LOYAL" then			--忠诚度恢复
				local loyal = pet:GetAttr(PET_ATTR_LOYALTY)
				if loyal < tb_Use.ValMax then
					if sItemSystem:ConsumeItem(item,1,"system","宠物忠诚度提高","宠物对象:"..pet_guid) == 0 then
						pet:AddPetLoyalty(tb_Use.Val)
						sLuaApp:NotifyTipsMsg(player, "使用成功")
						sucess = 1
					end
				else
					sLuaApp:NotifyTipsMsg(player, "宠物忠诚度已经满了，不需要再增加了")
				end
			elseif attrAdd == "INTIM" then		 	--亲密度增加
				local loyal = pet:GetAttr(PET_ATTR_CLOSE_POINT)
				if loyal < tb_Use.ValMax then
					if sItemSystem:ConsumeItem(item,1,"system","宠物亲密度提高","宠物对象:"..pet_guid) == 0 then
						pet:AddPetClosePoint(tb_Use.Val)
						if PetIntimacy then
							PetIntimacy.Refresh(pet)
						end
						sLuaApp:NotifyTipsMsg(player, "使用成功")
						sucess = 1
					end
				else
					sLuaApp:NotifyTipsMsg(player, "宠物亲密度已经满了，不需要再增加了")
				end
			elseif attrAdd == "RE_1" then			--转生
				local Rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
				if Rein >= 1 then
					sLuaApp:NotifyTipsMsg(player, "宠物的转生已经超过1转了")
				elseif player:GetAttr(ROLE_ATTR_REINCARNATION) < 1 then
					sLuaApp:NotifyTipsMsg(player, "宠物的转生等级不可以超过主人哦！")
				else
					if sItemSystem:ConsumeItem(item,1,"system","宠物成长","宠物对象:"..pet_guid) == 0 then
						PetBase.Reincarnation(player, pet)
					end
				end
			end
		elseif tb_Use.Custom then
		
		end
	else
		local itemData = ItemConfig.GetByKeyName(item_Key)
		local itemType = itemData.Type
		local itemSubType = itemData.Subtype
		local itemUser = itemData.User
		if itemType == 2 and itemSubType == 1 then
			if itemUser == 0 or itemUser == 2 then
				if sItemSystem:UseItem(pet,item) ~= 0 then
					sLuaApp:NotifyTipsMsg(player, "当前不需要使用该道具")
					return ""
				end
			else
				sLuaApp:NotifyTipsMsg(player, "该道具无法对宠物使用")
				return ""
			end
		end
	end
	--if sucess == 1 then
	--	sLuaApp:ShowForm(player, "脚本表单", "if PetEduUI then PetEduUI.UseGoodsSuccess() end")
	--end
end

function PetItem.ConfirmUse(player_guid,pet_guid,item_guid)
	PetItem.UseItem(sPlayerSystem:GetPlayerByGUID(player_guid), pet_guid, item_guid, 1)
end

function PetItem.UnlockPetField(player)
	local itemKey = "解锁宠物栏位"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>解锁1个宠物栏位？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormConfirm.TryUseItemByIdAndOneKeyBuy('"..player:GetGUID().."',"..itemData.Id..",'"..itemKey.."')")
					sLuaApp:ShowForm(player, "脚本表单", str)
end