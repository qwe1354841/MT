--宠物装备创建
PetEquipCreate = {}

-- Grade对应的系数
PetEquipCreate.GradeCoefficient = {
	["Grade_1"] = 0.7,
	["Grade_2"] = 1,
	["Grade_3"] = 1.1,
	["Grade_4"] = 1.3,
	["Grade_5"] = 1.6,

}


PetEquipCreate.AttrList = {--attrValue 可以为负数 
	-----------有 [item_keyname] = {} 会优先选用
	["0级参战宠物饰品"] = {{attr = "法暴率",   minValue = 300, maxValue = 350},{attr = "物暴率", minValue = 300, maxValue = 350},},
	["5级参战宠物饰品"] = {{attr = "法暴率",   minValue = 350, maxValue = 400},{attr = "物暴率", minValue = 350, maxValue = 400},},
	["15级参战宠物饰品"] = {{attr = "法暴率",  minValue = 400, maxValue = 450},{attr = "物暴率", minValue = 400, maxValue = 450},},
	["25级参战宠物饰品"] = {{attr = "法暴率",  minValue = 450, maxValue = 500},{attr = "物暴率", minValue = 450, maxValue = 500},},	
	["35级参战宠物饰品"] = {{attr = "法暴率",  minValue = 500, maxValue = 550},{attr = "物暴率", minValue = 500, maxValue = 550},},
	["45级参战宠物饰品"] = {{attr = "法暴率",  minValue = 550, maxValue = 600},{attr = "物暴率", minValue = 550, maxValue = 600},},
	["55级参战宠物饰品"] = {{attr = "法暴率",  minValue = 600, maxValue = 650},{attr = "物暴率", minValue = 600, maxValue = 650},},
	["65级参战宠物饰品"] = {{attr = "法暴率",  minValue = 650, maxValue = 700},{attr = "物暴率", minValue = 650, maxValue = 700},},
	["75级参战宠物饰品"] = {{attr = "法暴率",  minValue = 700, maxValue = 750},{attr = "物暴率", minValue = 700, maxValue = 750},},
	["85级参战宠物饰品"] = {{attr = "法暴率",  minValue = 750, maxValue = 800},{attr = "物暴率", minValue = 750, maxValue = 800},},	
	["95级参战宠物饰品"] = {{attr = "法暴率",  minValue = 800, maxValue = 900},{attr = "物暴率", minValue = 800, maxValue = 900},},
	["105级参战宠物饰品"] = {{attr = "法暴率", minValue = 900, maxValue = 1000},{attr = "物暴率", minValue = 900, maxValue = 1000},},
	["115级参战宠物饰品"] = {{attr = "法暴率", minValue = 1000, maxValue = 1100},{attr = "物暴率", minValue = 1000, maxValue = 1100},},
	["神兽饰品"] = {{attr = "法暴率", minValue = 1100, maxValue = 1200},{attr = "物暴率", minValue = 1100, maxValue = 1200},},
	["仙兽饰品"] = {{attr = "法暴率", minValue = 1000, maxValue = 1100},{attr = "物暴率", minValue = 1000, maxValue = 1100},},
	["魔兽饰品"] = {{attr = "法暴率", minValue = 1200, maxValue = 1300},{attr = "物暴率", minValue = 1200, maxValue = 1300},},	

	---------没有 [item_keyname] = {} 根据 PetEquipCreate_1 传的 item_type 选用 
	["宠物项圈"] =  {
		{attr = "血量上限", minValue = "((Level - 5) * 8) * GradeCoef", maxValue = "((Level - 5) * 8.8 -1 )* GradeCoef"},
	},
	["宠物物防衣服"] =  {
		{attr = "物理防御", minValue = "((Level - 5) * 3.2) * GradeCoef", maxValue = "((Level - 5) *3.52 -1 )* GradeCoef"},
	},
	["宠物法防衣服"] =  {
		{attr = "法术防御", minValue = "((Level - 5) * 3.2) * GradeCoef", maxValue = "((Level - 5) *3.52 -1 )* GradeCoef"},
	},
	["宠物物攻护符"] =  {
		{attr = "物理攻击", minValue = "((Level - 5) * 3.2) * GradeCoef", maxValue = "((Level - 5) *3.52 -1 )* GradeCoef"},
	},
	["宠物法攻护符"] =  {
		{attr = "法术攻击", minValue = "((Level - 5) * 3.2) * GradeCoef", maxValue = "((Level - 5) *3.52 -1 )* GradeCoef"},
	},
	["宠物饰品"] =  {
		{attr = "法暴率", minValue = "10 * ((Level - 5) * 3.2 + 20) * GradeCoef", maxValue = "10 * ((Level - 5) * 3.52 -1 + 20)* GradeCoef"},
		{attr = "物暴率", minValue = "10 * ((Level - 5) * 3.2 + 20) * GradeCoef", maxValue = "10 * ((Level - 5) * 3.52 -1 + 20)* GradeCoef"},
	},

}


function PetEquipCreate.ItemCreate(item, item_type)
	local attr_list = PetEquipCreate.AttrList[item_type]
	if not attr_list then
		sLuaApp:LuaErr("PetEquipCreate.AttrList 不存在"..item_type)
	end
	
	
	for _,v in ipairs(attr_list) do
		local attr_keyname = v['attr']
		local attr_data = AttrConfig.GetByKeyName(attr_keyname)
		if not attr_data then
			sLuaApp:LuaErr("PetEquipCreate.ItemCreate AttrConfig不存在"..attr_keyname)
			return
		end
		
		local attr_val = PetEquipCreate.GetAttrVal(item, v)
		local mark = EquipAttrClassify['Primordial'] or 0
		item:SetDynAttr(mark, attr_data.Id, attr_val)
	end

	--设置耐久度
	if PetEquipRepair then
		PetEquipRepair.CreateSetDurable(item)
	end
	--设置最大洗炼次数
	if PetEquipArtifice then
		PetEquipArtifice.SetMaxArtificeNum(item)
	end
end

function PetEquipCreate.GetAttrVal(item, attr_list)
	local min_val = attr_list["minValue"]
	local max_val = attr_list["maxValue"]
	if type(min_val) == "number" and type(max_val) == "number" then
		return sLuaApp:RandInteger(math.floor(min_val), math.floor(max_val))
	end
	
	
	local item_keyname = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(item_keyname)
	local Level = itemData.Level
	local GradeCoef = PetEquipCreate.GradeCoefficient["Grade_"..itemData.Grade] or 1
	local str_factor = [[
		local Level = ]].. Level ..[[
		local GradeCoef = ]].. GradeCoef ..[[
	]]
	
	local min_num = assert(load(str_factor .. " return " .. min_val))()
	local max_num = assert(load(str_factor .. " return " .. max_val))()

	if max_num < min_num then
		max_num,min_num = min_num,max_num
	end
	res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	
	return res_num
end