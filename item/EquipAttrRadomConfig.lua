EquipAttrRandom = {}

EquipAttrRandom.EquipBuild = {
	['kangxing'] = {
		{attr = "血量上限", minValue = 100, maxValue = 200, rand = 500},
		{attr = "风系狂暴概率", minValue = 100, maxValue = 1000, rand = 500},
		{attr = "附风攻击概率", minValue = 100, maxValue = 1000, rand = 500},
		{attr = "封印概率", minValue = 100, maxValue = 1000, rand = 500},
		{attr = "附混乱攻击概率", minValue = 100, maxValue = 1000, rand = 500},
	
	},












}

EquipAttrRandom.CoeConfig = {
	--普通装备的系数库
	Normal = {
		GradeCoe = {
			[1] = {10000,10000},
			[2] = {15000,16500},
			[3] = {16500,21230},
			[4] = {21400,24780},
			[5] = {26000,27300},
		},
		LevelCoe = {
			[1] = 10000,
			[5] = 28000,
			[10] = 28000,
			[15] = 48000,
			[20] = 48000,
			[25] = 70000,
			[30] = 70000,
			[35] = 93000,
			[40] = 93000,
			[45] = 118000,
			[50] = 118000,
			[55] = 145000,
			[60] = 145000,
			[65] = 173000,
			[70] = 173000,
			[75] = 203000,
			[80] = 203000,
			[85] = 235000,
			[90] = 235000,
			[95] = 268000,
			[100] = 268000,
			[105] = 303000,			
			[110] = 303000,
			[115] = 339000,				
			[120] = 339000,
			[200] = 1000000,			
		},
	},
	Guang = {
		GradeCoe = {
			[1] = {10000,10000},
			[2] = {15750,15750},
			[3] = {18865,18865},
			[4] = {23090,23090},
			[5] = {26650,26650},
		},
		LevelCoe = {
			[1] = 10000,
			[5] = 28000,
			[10] = 28000,
			[15] = 48000,
			[20] = 48000,
			[25] = 70000,
			[30] = 70000,
			[35] = 93000,
			[40] = 93000,
			[45] = 118000,
			[50] = 118000,
			[55] = 145000,
			[60] = 145000,
			[65] = 173000,
			[70] = 173000,
			[75] = 203000,
			[80] = 203000,
			[85] = 235000,
			[90] = 235000,
			[95] = 268000,
			[100] = 268000,
			[105] = 303000,			
			[110] = 303000,
			[115] = 339000,				
			[120] = 339000,
			[200] = 1000000,			
		},
	
	}
}

EquipAttrRandom.Create = {
--武器产生时先从item_attr中生成属性，然后根据EquipCreate里的属性条目数和下面的随机方法再计算一次，相同的属性会覆盖掉item_attr生成的属性。
--如果只需要脚本生成属性，可以清除item_attr中的属性配置
	['通用武器'] = {
		{attr = "物理攻击", minValue = "20*GradeCoe*LevelCoe", maxValue = "20*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "法术攻击", minValue = "20*GradeCoe*LevelCoe", maxValue = "20*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		--{attr = "进阶随机", minValue = "", maxValue = "", Random = 10000, attrLink = "通用武器进阶库1", attrLinkNum = 1},--通用武器进阶库1	
		--{attr = "进阶随机", minValue = "", maxValue = "", Random = 10000, attrLink = "通用武器进阶库2", attrLinkNum = 1},--通用武器进阶库2	
	},
	['通用武器进阶库1'] = {
		{attr = "灵力", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "灵力", minValue = "5*GradeCoe*LevelCoe", maxValue = "5*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
	},
	['通用武器进阶库2'] = {
		{attr = "力量", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "力量", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['通用头盔'] = {
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe", maxValue = "5*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
	},
	['通用护甲'] = {
		{attr = "物理防御", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "法术防御", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
	},
	['通用护腰'] = {
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe", maxValue = "5*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
	},
	['通用挂坠'] = {
		{attr = "法力上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Normal", Random = 10000},
	},
	['通用靴子'] = {
		{attr = "战斗速度", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
	},
	['通用护腕'] = {
		{attr = "物理攻击", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
	},
	['通用戒指'] = {
		{attr = "战斗速度", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
	},
	['通用项链'] = {
		{attr = "法术攻击", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Normal", Random = 10000},
	},
	
	['光装武器'] = {
		{attr = "物理攻击", minValue = "20*GradeCoe*LevelCoe", maxValue = "20*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "法术攻击", minValue = "20*GradeCoe*LevelCoe", maxValue = "20*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['光装头盔'] = {
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe", maxValue = "5*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['光装护甲'] = {
		{attr = "物理防御", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "法术防御", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['光装护腰'] = {
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe", maxValue = "5*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['光装挂坠'] = {
		{attr = "法力上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
		{attr = "血量上限", minValue = "10*GradeCoe*LevelCoe", maxValue = "10*GradeCoe*LevelCoe", CoeConfig = "Guang", Random = 10000},
	},
	['光装靴子'] = {
		{attr = "战斗速度", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
	},
	['光装护腕'] = {
		{attr = "物理攻击", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
		{attr = "物理防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
	},
	['光装戒指'] = {
		{attr = "战斗速度", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
	},
	['光装项链'] = {
		{attr = "法术攻击", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
		{attr = "法术防御", minValue = "5*GradeCoe*LevelCoe/2", maxValue = "5*GradeCoe*LevelCoe/2", CoeConfig = "Guang", Random = 10000},
	},
	
	
--大力武器公共池
	['Weapon_Damage'] = {--此池子取1项
		{attr = "物攻", minValue = "8000 + level * 2000", maxValue = "8000 + level * 2000", Random = 500},
	},	
	['Weapon_PhyStatGroup'] = {--此池子取3项
		{attr = "物理狂暴率", minValue = "845 + level * 215", maxValue = "845 + level * 215", Random = 500},
		{attr = "反击概率", minValue = "845 + level * 215", maxValue = "845 + level * 215", Random = 500},
		{attr = "物理攻击致命机率", minValue = "845 + level * 215", maxValue = "845 + level * 215", Random = 500},
		{attr = "连击概率", minValue = "845 + level * 215", maxValue = "845 + level * 215", Random = 500},
		{attr = "命中", minValue = "845 + level * 215", maxValue = "845 + level * 215", Random = 500},
	},	
	['Weapon_IgnoreDef'] = {--此池子取1项
		{attr = "忽视物理防御的百分比", minValue = "5000 + 500 * level", maxValue = "5000 + 500 * level", Random = 500},
		{attr = "忽视目标物理防御概率", minValue = "5000 + 500 * level", maxValue = "5000 + 500 * level", Random = 500},
	},	
	['Weapon_IgnoreDefRate'] = {--此池子取1项
		{attr = "忽视物理伤害抵抗百分比", minValue = "3300 + 200 * level", maxValue = "3300 + 200 * level", Random = 500},
	},	
	['Weapon_AntiElement'] = {--此池子取1项
		{attr = "增加对敌方的水属性伤害", minValue = "905 + level * 225", maxValue = "905 + level * 225", Random = 500},
		{attr = "增加对敌方的金属性伤害", minValue = "905 + level * 225", maxValue = "905 + level * 225", Random = 500},
		{attr = "增加对敌方的木属性伤害", minValue = "905 + level * 225", maxValue = "905 + level * 225", Random = 500},
		{attr = "增加对敌方的土属性伤害", minValue = "905 + level * 225", maxValue = "905 + level * 225", Random = 500},
		{attr = "增加对敌方的火属性伤害", minValue = "905 + level * 225", maxValue = "905 + level * 225", Random = 500},
	},	
	['Weapon_Stat'] = {--此池子取1项
		{attr = "力量", minValue = "15 + level * 4", maxValue = "15 + level * 4", Random = 500},
	},	


}

local max_Looptime = 20

function EquipAttrRandom.ReturnAttrList(LibraryType, PoolType, Num, Shields, isPreview)
	if not Num then		
		Num = 1
	end
	if Num < 1 then
		Num = 1
	end
	if type(EquipAttrRandom[LibraryType]) ~= "table" then
		return "error"
	end
	if type(EquipAttrRandom[LibraryType][PoolType]) ~= "table" then
		return "error"
	end
	if not EquipAttrRandom.AllRand then
		EquipAttrRandom.AllRand = {}
	end
	if not EquipAttrRandom.AllRand[LibraryType] then
		EquipAttrRandom.AllRand[LibraryType] = {}
	end
	if not EquipAttrRandom.AllRand[LibraryType][PoolType] then
		EquipAttrRandom.AllRand[LibraryType][PoolType] = {} 
	end
	--初始化数据
	local tb_rand = EquipAttrRandom[LibraryType][PoolType]
	
	if #EquipAttrRandom.AllRand[LibraryType][PoolType] == 0 then
		local rand = 0
		EquipAttrRandom.AllRand[LibraryType][PoolType] = {0}
		for k,v in ipairs(tb_rand) do
			local configs = AttrConfig.GetByKeyName(v.attr) 
			if type(configs) == 'table' then
				v.attrID = configs.Id
			elseif v.attr == "进阶随机" then
				v.attrID = 99999
			end
			rand = rand + (v.Random or 100)
			--sVarSystem:SetInt("EQUIPATTRRANDOM_"..LibraryType.."_"..PoolType.."_"..k, rand)
			EquipAttrRandom.AllRand[LibraryType][PoolType][k+1] = rand
		end
	end
	
	local RandAnswer = {}
	local CoeAnswer = {}
	local RandAnswer_index = {}
	local RandAnswer_son = {}
	local CoeAnswer_son = {}
	local ShieldPoolType = Shields or {}
	local rander = EquipAttrRandom.AllRand[LibraryType][PoolType]
	--sLuaApp:LuaDbg("rander = " ..Lua_tools.serialize(rander))
	if #rander == 0 then
		sLuaApp:LuaErr("LibraryType = " ..LibraryType.. "   PoolType = " ..PoolType .. " 没有属性")
		return {}, {}, Num or 0
	end
	local PreviewNum = 0
	if Num == #rander-1 then
		local randplus = 100000
		for k,v in ipairs(tb_rand) do
			local focusId = v.attrID
			if isPreview == true then
				if focusId == 99999 then
					PreviewNum = PreviewNum + 1
				else
					RandAnswer[focusId] = v
					if RandAnswer[focusId].CoeConfig then
						CoeAnswer[focusId] = EquipAttrRandom.CoeConfig[RandAnswer[focusId].CoeConfig]
					end
				end
			else
				RandAnswer[focusId] = v
				if RandAnswer[focusId].CoeConfig then
					CoeAnswer[focusId] = EquipAttrRandom.CoeConfig[RandAnswer[focusId].CoeConfig]
				end
				local SubPoolType = v['attrLink']
				if SubPoolType then
					if not ShieldPoolType[SubPoolType] then
						ShieldPoolType[SubPoolType] = 1
						RandAnswer_son, CoeAnswer_son = EquipAttrRandom.ReturnAttrList("Create", SubPoolType, v['attrLinkNum'] or 1)
						if not RandAnswer_son then
							sLuaApp:LuaErr("无法进行属性随机  属性库 = " .. SubPoolType)
						else
							if type(RandAnswer_son) == 'string' then
								sLuaApp:LuaErr("RandAnswer_son = " .. RandAnswer_son)
							end
							for k,v in pairs(RandAnswer_son) do
								RandAnswer[k] = v
								if v.CoeConfig then
									CoeAnswer[k] = EquipAttrRandom.CoeConfig[v.CoeConfig]
								end
							end
							for k,v in pairs(CoeAnswer_son) do
								CoeAnswer[k] = v
							end
						end
					end
				end
			end
		end
	else
		if isPreview == true then
			return {}, {}, Num or 0
		end
		for i = 1,Num do
			for j = 1,(max_Looptime or 10)  do
				local index = EquipAttrRandom.StartRandom(rander)
				local focusId = tb_rand[index].attrID
				if not focusId then
					sLuaApp:LuaErr("EquipAttrRandom属性配置错误，错误属性名称  " .. tb_rand[index].attr)
					return {}, {}, Num or 0
				end
				if not RandAnswer_index[index] then
					RandAnswer_index[index] = 1
					RandAnswer[focusId] = tb_rand[index]
					if RandAnswer[focusId].CoeConfig then
						CoeAnswer[focusId] = EquipAttrRandom.CoeConfig[RandAnswer[focusId].CoeConfig]
					end
					local SubPoolType = tb_rand[index]['attrLink']
					if SubPoolType then
						if not ShieldPoolType[SubPoolType] then
							ShieldPoolType[SubPoolType] = 1
							RandAnswer_son, CoeAnswer_son = EquipAttrRandom.ReturnAttrList("Create", SubPoolType, tb_rand[index]['attrLinkNum'] or 1)
							if not RandAnswer_son then
								sLuaApp:LuaErr("无法进行属性随机  属性库 = " .. SubPoolType)
							else
								if type(RandAnswer_son) == 'string' then
									sLuaApp:LuaErr("RandAnswer_son = " .. RandAnswer_son)
								end
								for k,v in pairs(RandAnswer_son) do
									RandAnswer[k] = v
									if v.CoeConfig then
										CoeAnswer[k] = EquipAttrRandom.CoeConfig[v.CoeConfig]
									end
								end
								for k,v in pairs(CoeAnswer_son) do
									CoeAnswer[k] = v
								end
							end
						end
					end
					break
				end
			end
		end
	end
	if RandAnswer[99999] then
		RandAnswer[99999] = nil
	end
	--sLuaApp:LuaDbg("PreviewNum = " .. PreviewNum)
	return RandAnswer, CoeAnswer, PreviewNum or 0
end

function EquipAttrRandom.StartRandom(Rand_tb)
	local rand = sLuaApp:RandInteger(1,Rand_tb[#Rand_tb])
	local index = 1
	for i = 1,#Rand_tb-1 do
		if rand <= Rand_tb[i+1] and rand > Rand_tb[i] then
			index = i
			break
		end
	end
	return index
end