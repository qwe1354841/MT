--仙器生成属性随机 ，依赖 EquipReBuild 脚本
FairyCreate = {}

function FairyCreate.on_item_create(item)
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	
	--local player = sPlayerSystem:GetPlayerByGUID(item:GetOwnerGUID())
	if EquipLevelupConfig then
		if EquipLevelupConfig[keyName] then
			item:SetInt("EQUIP_CanLevelUp",1)
		end
	end
	if EquipReBuild then
		if not FairyCreate.LibraryLink then
			FairyCreate.LibraryLink = EquipReBuild.LibraryLink
		end
	
		if FairyCreate.LibraryLink then
			if itemData.Type ~= 1 then
				sLuaApp:NotifyTipsMsg(player, "并非装备，无法操作")
				return ""
			end
			
			local LinkTb = EquipReBuild.KeyNameLink[keyName]
			--sLuaApp:LuaDbg("itemKey = " .. itemKey)
			if not LinkTb then
				local EquipType = itemData.Subtype
				local SiteType = itemData.Subtype2
				local Role = itemData.Role
				local Level = itemData.Itemlevel
				local Alevel = itemData.ArmorLevel
			
				LinkTb = EquipReBuild.LinkTbTest(EquipType, SiteType, Role, Level, Alevel)
			end
			
			local AttrList = item:GetDynAttrsByMark(0)
			local newList = {}
			for k,v in ipairs(AttrList) do
				if LinkTb['LockAttr'][v.attr] then
					newList[v.attr] = v.value
				end
			end
			
			local SPA_Mode = 0
			local SPAttrs = {}
			local SPNames = {}
			local SPShows = {}
			if LinkTb.SpecialAttrs then
				for a,b in ipairs(LinkTb.SpecialAttrs) do
					local value
					if b.minValue == b.maxValue then
						value = b.minValue
						if type(value) == "string" then
							value = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..value))()
							sLuaApp:LuaDbg("level = " .. (Level or itemData.Itemlevel) .. "   func = " .. value)
							value = math.floor(value) 
						end
					else
						local valueMax = b.maxValue
						local valueMin = b.minValue
						if type(valueMax) == "string" then
							valueMax = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..valueMax))()
							valueMax = math.floor(valueMax) 
						end
						if type(valueMin) == "string" then
							valueMin = assert(load("local level = "..(Level or itemData.Itemlevel).." return "..valueMin))()
							valueMin = math.floor(valueMin)
						end
						value = sLuaApp:RandInteger(valueMin,valueMax)
					end
					SPAttrs[a] = value
					SPNames[a] = b.Name
					SPShows[a] = b.isShow or 0
					SPA_Mode = 1
					sLuaApp:LuaDbg("随机到的【"..b.Name.."】的值为"..value)
				end
			end
			
			for k,v in ipairs(SPAttrs) do
				item:SetString("ITEM_SPAttrNa_"..k, SPNames[k])
				item:SetInt("ITEM_SPAttrVa_"..k, v)
				item:SetInt("ITEM_SPAttrSh_"..k, SPShows[k])
			end
			item:SetInt("ITEM_SPAttrNum", #SPAttrs)
			
			if EquipAttrRandom then
				if EquipAttrRandom.EquipReBuild then
					for k,v in ipairs(LinkTb['RandAttr']) do
						if type(v) == "string" then
							local rand_Tb = EquipAttrRandom.EquipReBuild[v]
							local rand_An = LinkTb['RandAttr'][k+1]
							if type(rand_An) ~= "number" then
								rand_An = 1
							end
							local str = ""
							if SPA_Mode == 1 then
								for a,b in ipairs(SPAttrs) do
									str = str .. "local SPAttr_" .. a .. " = " .. b .. " "
								end
							end
							for a,b in pairs(EquipAttrRandom.ReturnAttrList("EquipReBuild", v, rand_An)) do
								local value
								if b.minValue == b.maxValue then
									value = b.minValue
									if type(value) == "string" then
										value = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..value))()
										value = math.floor(value)
									end
								else
									local valueMax = b.maxValue
									local valueMin = b.minValue
									if type(valueMax) == "string" then
										valueMax = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..valueMax))()
										valueMax = math.floor(valueMax)
									end
									if type(valueMin) == "string" then
										valueMin = assert(load("local level = "..(Level or itemData.Itemlevel).." "..str.." return "..valueMin))()
										valueMin = math.floor(valueMin)
									end
									value = sLuaApp:RandInteger(valueMin,valueMax)
								end
								value = math.floor(value)
								item:SetDynAttr(0, a, value)
							end
						end
					end
				end
			end
		end
	end
end