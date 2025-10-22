--物品生成属性随机
EquipCreate = {}

EquipCreate.Config = {
	[1] = {
		[0] = {"通用武器",2},
	},
	[2] = {
		[1] = {"通用头盔",2},
		[2] = {"通用护甲",2},
		[3] = {"通用护腰",2},
		[5] = {"通用挂坠",2},
	},
	[3] = {
		[1] = {"通用戒指",2},
		[2] = {"通用项链",2},
		[3] = {"通用护腕",2},
		[4] = {"通用靴子",2},
	},
}

function EquipCreate.on_item_create(item)
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	
	--local player = sPlayerSystem:GetPlayerByGUID(item:GetOwnerGUID())
	if itemData.Type ~= 1 then
		return
	end
	local Type = itemData.Subtype
	local SubType = itemData.Subtype2
	local Table_Str = item:GetString("EquipCreateRule")
	if Table_Str == "" then
		Table_Str = "EquipCreate.Config"
		--装备生成时产生随机特技特效
		if Type ~= EQUIP_AMULET then --判断是不是法宝
			if EquipSpecialEffect then
				EquipSpecialEffect.RandomByBuild(item,1)
			end
		end
	end
	
	local table_rule = assert(load("return " ..Table_Str))()
	
	if table_rule[Type] then
		local tb_Rand = table_rule[Type][SubType] or table_rule[Type][0]
		if type(tb_Rand) == "table" then
			for k,v in ipairs(tb_Rand) do
				if type(v) == "string" then
					EquipCreate.EquipAttrRandom(item, "Create", v, type(tb_Rand[k+1]) == "number" and tb_Rand[k+1] or 1)
				end
			end
		end
	end
	
	if RepairSystem then
		RepairSystem.createEquip(item)
	end
	
	if SuitSys then
		local ItemAttrConfig = ItemAttConfig.GetByKeyName(keyName)
		if ItemAttrConfig then
			if ItemAttrConfig.Suit ~= "0" then
				SuitSys.set_equip_suit_keyname(item,ItemAttrConfig.Suit)
			end
		end
		--SuitSys.random(item,"All")
	end
end

function EquipCreate.EquipAttrRandom(item, LibraryType, PoolType, Num, isPreview, Key)--isPreview 是否为预览 ，Key 预览物品Key
	if not EquipAttrRandom then
		return
	end
	
	--sLuaApp:LuaDbg("LibraryType = " .. LibraryType .. "     PoolType = " .. PoolType .. "       Num = " .. Num)
	local RandAnswer,CoeConfig, RandAttrNum = EquipAttrRandom.ReturnAttrList(LibraryType, PoolType, Num, {},isPreview)
	local keyName = ""
	if isPreview == true then
		keyName = Key
	else
		keyName = item:GetKeyName()
	end
	local AttrTable = {}
	local AttrNum = 1
	for i = 1, Num - RandAttrNum do
		AttrTable[i] = {}
		AttrTable[i].Name = 0
		AttrTable[i].PreviewMax = 0
		AttrTable[i].PreviewMin = 0
	end
	local itemData = ItemConfig.GetByKeyName(keyName)
	for k,v in pairs(RandAnswer) do
	
		local GradeCoeMin = 10000
		local GradeCoeMax = 10000
		local LevelCoeMin = 10000
		local LevelCoeMax = 10000
		local Coe = CoeConfig[k]
		--print(Lua_tools.serialize(Coe))
		if Coe then
			local Grade = 0
			if isPreview == true then
				Grade = itemData.Grade
			else
				Grade = item:GetGrade()
			end
			local config
			if Coe.LevelCoe then
				config = Coe.GradeCoe[Grade]
				if type(config) == "number" then
					GradeCoeMin = config
					GradeCoeMax = config
				elseif type(config) == "table" then
					GradeCoeMin = config[1]
					GradeCoeMax = config[2]
				end
			end
			
			local Level = itemData.Itemlevel
			if Coe.LevelCoe then
				config = Coe.LevelCoe[Level]
				if type(config) == "number" then
					LevelCoeMin = config
					LevelCoeMax = config
				elseif type(config) == "table" then
					LevelCoeMin = config[1]
					LevelCoeMax = config[2]
				end
			end
		end
		local value
		--if v.minValue == v.maxValue then
		--	value = v.minValue
		--	if type(value) == "string" then
		--		value = assert(load("local level = "..(Level or itemData.Itemlevel)..(Coe and " local GradeCoe = " .. GradeCoeMin .."/10000 local LevelCoe = ".. LevelCoeMin .. "/10000"  or "").." return "..value))()
		--		value = math.floor(value)
		--		AttrTable[AttrNum].PreviewMax = value
		--		AttrTable[AttrNum].PreviewMin = value
		--	end
		--else
			local valueMax = v.maxValue
			local valueMin = v.minValue
			if type(valueMax) == "string" then
				valueMax = assert(load("local level = "..(Level or itemData.Itemlevel)..(Coe and " local GradeCoe = " .. GradeCoeMax .."/10000 local LevelCoe = " .. LevelCoeMax .. "/10000"  or "").." return "..valueMax))()
				valueMax = math.floor(valueMax)
			end
			if type(valueMin) == "string" then
				valueMin = assert(load("local level = "..(Level or itemData.Itemlevel)..(Coe and " local GradeCoe = " .. GradeCoeMin .."/10000 local LevelCoe = " .. LevelCoeMin .. "/10000"  or "").." return "..valueMin))()
				valueMin = math.floor(valueMin)
			end
			--sLuaApp:LuaDbg("valueMin = " .. valueMin .. "          valueMax = " .. valueMax)
			value = sLuaApp:RandInteger(valueMin,valueMax)
			AttrTable[AttrNum].PreviewMax = valueMax
			AttrTable[AttrNum].PreviewMin = valueMin
		--end
		if isPreview == false or isPreview == nil then
			value = math.floor(value)
			item:SetDynAttr(0, k, value)
		end
		AttrTable[AttrNum].Name = k
		AttrNum = AttrNum+1
	end
	if isPreview == true then
		return AttrTable, RandAttrNum
	end
end