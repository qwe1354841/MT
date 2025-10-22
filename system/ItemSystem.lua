--道具总控
ItemSystem = {}
-- 初始宝石孔数
ItemSystem.InitGemNum = 3

function ItemSystem.on_item_create(item)
	if item == nil then
		return
	end

	if item:GetMajorType() == ITEM_TYPE_EQUIP then
		item:SetInt("ITEM_GemNum", ItemSystem.InitGemNum)
	end
end

function ItemSystem.on_item_destroy(item)
	if item == nil then
		return
	end
end



function ItemSystem.on_player_additem(player, item, amount, sender, reason, detail)
	--装备评分判定
	--sLuaApp:LuaDbg("on_player_additem =============================")
	if item:GetMajorType() == ITEM_TYPE_EQUIP then
		local itemId = item:GetId()
		local Inten = player:GetInt("ItemIntensify_" .. itemId)
		if Inten > 0 then
			player:SetInt("ItemIntensify_" .. itemId, 0)
			if EquipIntensify then
				EquipIntensify.SetEquipIntensifyLevel(player, item, Inten, 1)
			end
		end
		--sLuaApp:LuaDbg("on_player_additem ============================= " .. item:GetMajorType())
		local playerGUID = player:GetGUID()
		local Old_Score = 0
		local New_Score = item:GetScoreBase(player)
		--sLuaApp:LuaDbg("ItemName = " .. item:GetName() .. "          New_Score_Base = " .. New_Score)
		if ItemSystem.CanEquip(player, item) then
			local types = item:GetSubType()
			--sLuaApp:LuaDbg("装备部位为 " .. types .. " EQUIP_WEAPON = " .. EQUIP_WEAPON)
			local EquipCon = player:GetEquipContainer()
			if types == EQUIP_WEAPON then				
				local Equiping = EquipCon:GetItemBySite(EQUIP_SITE_WEAPON)
				if Equiping then
					--sLuaApp:LuaDbg("旧武器为 " .. Equiping:GetName())
					if Inten > Equiping:GetInt('EQUIP_IntensifyLevel') then
						--sLuaApp:LuaDbg("启用Ex战力比较")
						New_Score = item:GetScoreEx(player)
						Old_Score = Equiping:GetScoreEx(player)
					else
						Old_Score = Equiping:GetScoreBase(player)
					end
				end
			else
				local sec_types = item:GetSubType2()
				if not ItemSystem.TypesConfig then
					ItemSystem.TypesConfig = {
						['2_1'] = EQUIP_SITE_HAT,		-- 帽子
						['2_2'] = EQUIP_SITE_CLOTH   ,	-- 衣服
						['2_3'] = EQUIP_SITE_BELT    ,	-- 腰带
						['3_4'] = EQUIP_SITE_SHOES   ,	-- 鞋子
						['3_3'] = EQUIP_SITE_WRIST   ,	-- 护腕
						['3_1'] = EQUIP_SITE_RING    ,	-- 戒指
						['3_2'] = EQUIP_SITE_NECKLACE,	-- 项链
						['2_5'] = EQUIP_SITE_HANGINGS,	-- 挂坠
						['4_0'] = EQUIP_SITE_AMULET  ,	-- 法宝
						['5_0'] = EQUIP_SITE_MOUNT   ,	-- 坐骑
					}
				end
				local EuipIndex = ItemSystem.TypesConfig[types.."_0"]
				if not EuipIndex then
					EuipIndex = ItemSystem.TypesConfig[types.."_"..sec_types]
				end
				if not EuipIndex then
					--不存在的道具种类/宠物装备
					--sLuaApp:LuaWrn("装备 " .. item:GetKeyName() .. " 配置异常，不属于任何装备类型    " .. types .. "  " .. sec_types .. "  " .. (EuipIndex or 'nil'))
					return
				end
				
				local Equiping = EquipCon:GetItemBySite(EuipIndex)
				if Equiping then
					if Inten > Equiping:GetInt('EQUIP_IntensifyLevel') then
						--sLuaApp:LuaDbg("启用Ex战力比较")
						New_Score = item:GetScoreEx(player)
						Old_Score = Equiping:GetScoreEx(player)
					else
						Old_Score = Equiping:GetScoreBase(player)
					end
				end
			end	
			--sLuaApp:LuaDbg("on_player_additem ============================= Old_Score = " .. Old_Score .. "     New_Score = " .. New_Score)
			if Old_Score < New_Score then
				--向客户端推送
				--sLuaApp:LuaDbg("on_player_additem ============================= ShowForm")
				sLuaApp:ShowForm(player, "脚本表单", "MainUI.OnAddNewItem('"..item:GetGUID().."',"..(New_Score - Old_Score)..")")
			end
		end
	end
end

function ItemSystem.on_player_additem_bymail(player,mail_guid,items,pets)
	local MailStr = player:GetString('MailIntensify_'..mail_guid)
	if MailStr ~= "" then
		local Intens = sLuaApp:StrSplit(MailStr, ",")
		local Inten_Tb = {}
		for i = 1,math.floor(#Intens/2) do
			Inten_Tb[Intens[i]] = tonumber(Inten_Tb[Intens[i+1]])
		end
		for k,v in ipairs(items) do
			local IntenLv = Inten_Tb['' .. v:GetId()]
			if IntenLv then
				EquipIntensify.SetEquipIntensifyLevel(player, item, IntenLv, 1)
			end
		end
		player:SetString('MailIntensify_'..mail_guid, "")
	end
end

function ItemSystem.CanEquip(player, item)
	if item:GetMajorType() == ITEM_TYPE_EQUIP then
		local itemId = item:GetId()
		local itemData = ItemConfig.GetById(itemId)
		if itemData then
			--sLuaApp:LuaDbg("Level ========= " .. itemData.Level .. "  player = " .. player:GetAttr(ROLE_ATTR_LEVEL) )
			if itemData.Level <= player:GetAttr(ROLE_ATTR_LEVEL) then
				--sLuaApp:LuaDbg("1111111111111111")
				if itemData.Sex == 0 or itemData.Sex == player:GetAttr(ROLE_ATTR_GENDER) then
					--sLuaApp:LuaDbg("22222222222222222")
					if itemData.Job == 0 or itemData.Job == player:GetAttr(ROLE_ATTR_JOB1) then
						--sLuaApp:LuaDbg("33333333333333333")
						local RoleID = player:GetAttr(ROLE_ATTR_ROLE)
						local types = item:GetSubType()
						if types == EQUIP_WEAPON then
							--sLuaApp:LuaDbg("44444444444444444")
							if itemData.Role == 0 or itemData.Role2 == 0 or itemData.Role == RoleID or itemData.Role2 == RoleID then
								return true
							end
						else
							return true
						end
					end
				end
			end
		end
	end
	return false
end
