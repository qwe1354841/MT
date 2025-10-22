--宠物装备修理配置
PetEquipRepairConfig = {}

PetEquipRepairConfig.RepairGradeCoefficient = {
	--默认系数为 1
	[1] = 1,--白
	[2] = 1,--绿
	[3] = 1.2,--蓝
	[4] = 1.7,--紫
	[5] = 1.7,--橙
}


-- 宠物装备（非饰品）耐久：
-- 下限=100+（100+装备等级）*（品质-1），上限=下限+100
-- 宠物饰品：
-- 下限=500+参战宠物等级*4，上限=下限+100
-- 神兽、仙兽、魔兽饰品=1000~1100
-- 配置支持 Level装备等级 Grade品阶 GradeCoef 品阶系数（RepairGradeCoefficient表中配置）
PetEquipRepairConfig.DurableMax = {"90 + (100 + Level) * (Grade - 1) * 0.9", "180 + (100 + Level) * (Grade - 1) * 0.9"}


PetEquipRepairConfig.DurableMaxEx = {
	["0级参战宠物饰品"] =   {450,540},
	["5级参战宠物饰品"] =   {468,558},
	["15级参战宠物饰品"] =  {504,594},
	["25级参战宠物饰品"] =  {540,630},
	["35级参战宠物饰品"] =  {576,666},
	["45级参战宠物饰品"] =  {612,702},
	["55级参战宠物饰品"] =  {648,738},
	["65级参战宠物饰品"] =  {684,774},
	["75级参战宠物饰品"] =  {720,810},
	["85级参战宠物饰品"] =  {756,846},
	["95级参战宠物饰品"] =  {792,882},
	["105级参战宠物饰品"] = {828,918},
	["115级参战宠物饰品"] = {864,954},
	["神兽饰品"] =          {900,990},
	["仙兽饰品"] =          {900,990},
	["魔兽饰品"] =          {900,990},
}

-- 配置支持 Level装备等级 Grade品阶  GradeCoef 装备品阶系数（RepairGradeCoefficient表中配置）
-- MoneyValCoef 修理每点耐久度所 消耗的货币数量
PetEquipRepairConfig.RepairConsume = {
	["Level_15"] = {["MoneyType"] = 5, ["MoneyValCoef"] = "5 * GradeCoef", ["Item"] = {}},
	["Level_45"] = {["MoneyType"] = 5, ["MoneyValCoef"] = "10 * GradeCoef", ["Item"] = {}},
	["Level_65"] = {["MoneyType"] = 5, ["MoneyValCoef"] = "20 * GradeCoef", ["Item"] = {}},
	["Level_85"] = {["MoneyType"] = 5, ["MoneyValCoef"] = "40 * GradeCoef", ["Item"] = {}},
	["Level_105"] = {["MoneyType"] = 5, ["MoneyValCoef"] = "80 * GradeCoef", ["Item"] = {}},
	["Level_125"] ={["MoneyType"] = 5, ["MoneyValCoef"] = "150 * GradeCoef", ["Item"] = {}},
}

PetEquipRepairConfig.RepairConsumeEx = {
	["0级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 10, ["Item"] = {"混元石",1}},
	["5级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 12, ["Item"] = {"混元石",2}},
	["15级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 15, ["Item"] = {"混元石",2}},
	["25级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 18, ["Item"] = {"混元石",2}},
	["35级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 22, ["Item"] = {"混元石",2}},
	["45级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 26, ["Item"] = {"混元石",2}},
	["55级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 30, ["Item"] = {"混元石",2}},
	["65级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 35, ["Item"] = {"混元石",3}},
	["75级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 40, ["Item"] = {"混元石",3}},
	["85级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 45, ["Item"] = {"混元石",3}},
	["95级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 50, ["Item"] = {"混元石",3}},
	["105级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 55, ["Item"] = {"混元石",3}},
	["115级参战宠物饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 60, ["Item"] = {"混元石",3}},
	["神兽饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 40, ["Item"] = {"混元石",4}},
	["仙兽饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 30, ["Item"] = {"混元石",3}},
	["魔兽饰品"] = {["MoneyType"] = 5, ["MoneyValCoef"] = 60, ["Item"] = {"混元石",4}},

}

--无法修理装备

--无限耐久装备