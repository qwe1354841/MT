EquipArtifice = {}

EquipArtifice.LoopNum = 20		--循环随机次数，越大越精准，对应的消耗也会越高，建议10-20

--属性随机数量的几率
EquipArtifice.AttrNum = {
	[1] = 800,
	[2] = 800,
	[3] = 800,
	[4] = 1000,
	[5] = 1500,
	[6] = 1000,
}

--属性随机数量的几率（护身符）
EquipArtifice.AttrNum_4 = {
	[1] = 1000,
	[2] = 2000,
	[3] = 600,
}

EquipArtifice.Consume = {
	[0] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5}},
	[1] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5,"洗炼锁",1}},
	[2] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5,"洗炼锁",2}},
	[3] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5,"洗炼锁",3}},
	[4] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5,"洗炼锁",4}},
	[5] = {MoneyType = 5, MoneyVal = 15000, itemList = {"内丹",5,"洗炼锁",5}},
}

EquipArtifice.EquipList = {
	{SubType = 1},
	{SubType = 2},
	{SubType = 3},
	{SubType = 4},
}

EquipArtifice.AttrRandom = {
	 ['武器'] = {--大话2武器
	--	{attr = "封印抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "混乱抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "昏睡抵抗概率", minValue = 150, maxValue = 1000, rand = 500},	
	--	{attr = "毒系抵抗中毒概率", minValue = 200, maxValue = 1250, rand = 500},
	--	{attr = "风系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
	--	{attr = "火系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
	--	{attr = "雷系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
	--	{attr = "水系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
	--	{attr = "鬼火系伤害抵抗百分比", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "抗吸血攻击固定值", minValue = 160, maxValue = 680, rand = 500},
	--	{attr = "吸收物理伤害结果的百分比", minValue = 120, maxValue = 800, rand = 500},
	--	{attr = "闪避", minValue = 150, maxValue = 1000, rand = 500},

	--	{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "物理攻击致命机率", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "连击概率", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "反击概率", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "物理狂暴率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
		{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 1100, maxValue = 4000, rand = 500},
		{attr = "物攻", minValue = 400, maxValue = 1700, rand = 500},

	--	{attr = "每回合恢复血量", minValue = 27, maxValue = 105, rand = 500},
	--	{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 2, maxValue = 17, rand = 500},
		{attr = "力量", minValue = 2, maxValue = 17, rand = 500},
		{attr = "灵性", minValue = 2, maxValue = 17, rand = 500},
		{attr = "敏捷", minValue = 2, maxValue = 17, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
	--	{attr = "血量上限", minValue = 225, maxValue = 650, rand = 500},
	--	{attr = "法力上限", minValue = 225, maxValue = 650, rand = 500},
		{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视鬼火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视遗忘抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "毒系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "混乱概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "封印概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "昏睡概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "遗忘概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "鬼火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "吸血攻击固定值", minValue = 400, maxValue = 1700, rand = 500},
		{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少等级-10
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 400, maxValue = 3000, rand = 500},
	--	{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},
		--[[{
			rand = 30,
			mutexAttrs = {
				{attr = "生命值上限百分比", minValue = 50, maxValue = 200, rand = 500},
				{attr = "法力值上限百分比", minValue = 50, maxValue = 200, rand = 500},
				{attr = "怒气值上限百分比", minValue = 50, maxValue = 200, rand = 500},
				{attr = "活力值上限百分比", minValue = 50, maxValue = 200, rand = 500},		
			},
		},
		{
			rand = 30,
			mutexAttrs = {
				{attr = "五行属性金", minValue = 10, maxValue = 20, rand = 500},
				{attr = "五行属性木", minValue = 10, maxValue = 20, rand = 500},
				{attr = "五行属性土", minValue = 10, maxValue = 20, rand = 500},
				{attr = "五行属性水", minValue = 10, maxValue = 20, rand = 500},		
				{attr = "五行属性火", minValue = 10, maxValue = 20, rand = 500},		
			},
		},
	--]]--
	},
	['帽子'] = {--大话2头盔
		{attr = "封印抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 300, maxValue = 2000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 400, maxValue = 1700, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "闪避", minValue = 150, maxValue = 1000, rand = 500},

	--	{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "连击概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "反击概率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理狂暴率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
	--	{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 550, maxValue = 2000, rand = 500},
		{attr = "物攻", minValue = 200, maxValue = 850, rand = 500},

		{attr = "每回合恢复血量", minValue = 90, maxValue = 350, rand = 500},
		{attr = "每回合恢复法力", minValue = 90, maxValue = 350, rand = 500},
		{attr = "根骨", minValue = 2, maxValue = 15, rand = 500},
		{attr = "力量", minValue = 2, maxValue = 15, rand = 500},
		{attr = "灵性", minValue = 2, maxValue = 15, rand = 500},
		{attr = "敏捷", minValue = 2, maxValue = 15, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "混乱概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "封印概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "昏睡概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "遗忘概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		--{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},

	},

	['衣服'] = {--大话2衣服
		{attr = "封印抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 300, maxValue = 2000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 200, maxValue = 800, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 150, maxValue = 1000, rand = 500},
	--	{attr = "闪避", minValue = 150, maxValue = 1000, rand = 500},

	--	{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "物理攻击致命机率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击概率", minValue = 300, maxValue = 2000, rand = 500},
	--	{attr = "反击概率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "物理狂暴率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
	--	{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 550, maxValue = 2000, rand = 500},
		{attr = "物攻", minValue = 200, maxValue = 850, rand = 500},

		{attr = "每回合恢复血量", minValue = 90, maxValue = 350, rand = 500},
		{attr = "每回合恢复法力", minValue = 90, maxValue = 350, rand = 500},
		{attr = "根骨", minValue = 2, maxValue = 15, rand = 500},
		{attr = "力量", minValue = 2, maxValue = 15, rand = 500},
		{attr = "灵性", minValue = 2, maxValue = 15, rand = 500},
		{attr = "敏捷", minValue = 2, maxValue = 15, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "混乱概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "封印概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "昏睡概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "遗忘概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		--{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},
	},
    
	['腰带'] = {--大话2鞋子
		{attr = "封印抵抗概率", minValue = 120, maxValue = 800, rand = 500},
		{attr = "混乱抵抗概率", minValue = 120, maxValue = 800, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 120, maxValue = 800, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 160, maxValue = 1000, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 160, maxValue = 1000, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 160, maxValue = 1000, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 160, maxValue = 1000, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 160, maxValue = 1000, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 120, maxValue = 800, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 200, maxValue = 850, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 120, maxValue = 800, rand = 500},
		{attr = "闪避", minValue = 300, maxValue = 2000, rand = 500},

		{attr = "命中", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "连击概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "反击概率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理狂暴率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
	--	{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 220, maxValue = 800, rand = 500},
		{attr = "物攻", minValue = 80, maxValue = 340, rand = 500},

		{attr = "每回合恢复血量", minValue = 45, maxValue = 175, rand = 500},
		{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 5, maxValue = 31, rand = 500},
		{attr = "力量", minValue = 5, maxValue = 31, rand = 500},
		{attr = "灵性", minValue = 5, maxValue = 31, rand = 500},
		{attr = "敏捷", minValue = 5, maxValue = 31, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "混乱概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "封印概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "昏睡概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "遗忘概率", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		--{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 120, maxValue = 900, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 120, maxValue = 900, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 120, maxValue = 900, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 120, maxValue = 900, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 120, maxValue = 900, rand = 500},
	--	{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},

	},                  
            
	['挂坠'] = {--大话2项链
		{attr = "封印抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 300, maxValue = 2000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 400, maxValue = 1700, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "闪避", minValue = 300, maxValue = 2000, rand = 500},

	--	{attr = "命中", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "物理攻击致命机率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击概率", minValue = 300, maxValue = 2000, rand = 500},
	--	{attr = "反击概率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "物理狂暴率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
	--	{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 600, maxValue = 4000, rand = 500},
		{attr = "物攻", minValue = 400, maxValue = 1700, rand = 500},

		{attr = "每回合恢复血量", minValue = 90, maxValue = 350, rand = 500},
		{attr = "每回合恢复法力", minValue = 90, maxValue = 350, rand = 500},
		{attr = "根骨", minValue = 5, maxValue = 31, rand = 500},
		{attr = "力量", minValue = 5, maxValue = 31, rand = 500},
		{attr = "灵性", minValue = 5, maxValue = 31, rand = 500},
		{attr = "敏捷", minValue = 5, maxValue = 31, rand = 500},
		{attr = "战斗速度", minValue = 4, maxValue = 25, rand = 500},
	--	{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "忽视风系伤害抵抗百分比", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视火系伤害抵抗百分比", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视雷系伤害抵抗百分比", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视水系伤害抵抗百分比", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视封印抵抗概率", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视混乱抵抗概率", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视昏睡抵抗概率", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视鬼火系伤害抵抗百分比", minValue = 40, maxValue = 200, rand = 500},
		{attr = "忽视遗忘抵抗概率", minValue = 40, maxValue = 200, rand = 500},
		{attr = "火系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "雷系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "水系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "风系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "毒系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "混乱概率", minValue = 50, maxValue = 400, rand = 500},
		{attr = "封印概率", minValue = 50, maxValue = 400, rand = 500},
		{attr = "昏睡概率", minValue = 50, maxValue = 400, rand = 500},
		{attr = "遗忘概率", minValue = 50, maxValue = 400, rand = 500},
		{attr = "鬼火系法术伤害百分比", minValue = 50, maxValue = 400, rand = 500},
		{attr = "吸血攻击固定值", minValue = 200, maxValue = 850, rand = 500},
		--{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 400, maxValue = 3000, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 400, maxValue = 3000, rand = 500},
	--	{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
	--	{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},

	},
	['护腕'] = {--大话2挂件配饰
		{attr = "封印抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 150, maxValue = 1000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 200, maxValue = 850, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 150, maxValue = 1000, rand = 500},
--[[大力属性大幅度削弱
	--	{attr = "闪避", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "反击概率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "物理狂暴率", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
--]]
	--	{attr = "闪避", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "命中", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "连击概率", minValue = 30, maxValue = 200, rand = 500},
		{attr = "反击概率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "物理狂暴率", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	
		{attr = "每回合恢复血量", minValue = 27, maxValue = 105, rand = 500},
		{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 1, maxValue = 6, rand = 500},
		{attr = "力量", minValue = 1, maxValue = 6, rand = 500},
		{attr = "灵性", minValue = 1, maxValue = 6, rand = 500},
		{attr = "敏捷", minValue = 1, maxValue = 6, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
	--	{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 2130 + level * 530, maxValue = 2130 + level * 530, rand = 500},
	--	{attr = "混乱概率", minValue = 225 + level * 55, maxValue = 225 + level * 55, rand = 500},
	--	{attr = "封印概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "昏睡概率", minValue = 590 + level * 150, maxValue = 590 + level * 150, rand = 500},
	--	{attr = "遗忘概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "风系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 715 + level * 175, maxValue = 715 + level * 175, rand = 500},
		--缺少等级-10
		--缺少需求-10%
	--	{attr = "增加对敌方的水属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的金属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的木属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的土属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的火属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},

	}, 
	['项链'] = {--大话2面具配饰
		{attr = "封印抵抗概率", minValue = 120, maxValue = 800, rand = 500},
		{attr = "混乱抵抗概率", minValue = 120, maxValue = 800, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 120, maxValue = 800, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 120, maxValue = 1000, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 120, maxValue = 1000, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 120, maxValue = 1000, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 120, maxValue = 1000, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 120, maxValue = 1000, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 120, maxValue = 800, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 160, maxValue = 680, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 120, maxValue = 800, rand = 500},
		{attr = "闪避", minValue = 120, maxValue = 800, rand = 500},
	--[[大力属性大幅度削弱	
		{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "反击概率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "物理狂暴率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
		{attr = "反击数量", minValue = 1, maxValue = 13, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
		--]]
		{attr = "命中", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "连击概率", minValue = 30, maxValue = 200, rand = 500},
		{attr = "反击概率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "物理狂暴率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "连击数量", minValue = 1, maxValue = 3, rand = 500},
		{attr = "反击数量", minValue = 1, maxValue = 3, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	
		{attr = "每回合恢复血量", minValue = 27, maxValue = 105, rand = 500},
		{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 1, maxValue = 6, rand = 500},
		{attr = "力量", minValue = 1, maxValue = 6, rand = 500},
		{attr = "灵性", minValue = 1, maxValue = 6, rand = 500},
		{attr = "敏捷", minValue = 1, maxValue = 6, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 225, maxValue = 650, rand = 500},
		{attr = "法力上限", minValue = 225, maxValue = 650, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 2130 + level * 530, maxValue = 2130 + level * 530, rand = 500},
	--	{attr = "混乱概率", minValue = 225 + level * 55, maxValue = 225 + level * 55, rand = 500},
	--	{attr = "封印概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "昏睡概率", minValue = 590 + level * 150, maxValue = 590 + level * 150, rand = 500},
	--	{attr = "遗忘概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "风系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 715 + level * 175, maxValue = 715 + level * 175, rand = 500},
		--缺少等级-10
		--缺少需求-10%
	--	{attr = "增加对敌方的水属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的金属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的木属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的土属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的火属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},
	},
	['鞋子'] = {--大话2腰带+披风配饰，实际配置腰带洗练
		{attr = "封印抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 150, maxValue = 1000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 160, maxValue = 560, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "闪避", minValue = 450, maxValue = 1500, rand = 500},
		--[[大力属性大幅度削弱
		{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "反震率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "反震伤害比分比", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "物理攻击致命机率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "反击概率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "物理狂暴率", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	--]]
		{attr = "命中", minValue = 90, maxValue = 300, rand = 500},
		{attr = "反震率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "反震伤害比分比", minValue = 90, maxValue = 300, rand = 500},
		{attr = "物理攻击致命机率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "连击概率", minValue = 30, maxValue = 200, rand = 500},
		{attr = "反击概率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "物理狂暴率", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	
		{attr = "每回合恢复血量", minValue = 27, maxValue = 105, rand = 500},
		{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 1, maxValue = 6, rand = 500},
		{attr = "力量", minValue = 1, maxValue = 6, rand = 500},
		{attr = "灵性", minValue = 1, maxValue = 6, rand = 500},
		{attr = "敏捷", minValue = 1, maxValue = 6, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
	--	{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 2130 + level * 530, maxValue = 2130 + level * 530, rand = 500},
	--	{attr = "混乱概率", minValue = 225 + level * 55, maxValue = 225 + level * 55, rand = 500},
	--	{attr = "封印概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "昏睡概率", minValue = 590 + level * 150, maxValue = 590 + level * 150, rand = 500},
	--	{attr = "遗忘概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "风系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 715 + level * 175, maxValue = 715 + level * 175, rand = 500},
		--缺少等级-10
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 240, maxValue = 1800, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 240, maxValue = 1800, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 240, maxValue = 1800, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 240, maxValue = 1800, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 240, maxValue = 1800, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},
	},
	['戒指'] = {--大话2戒指*2配饰，实际配置披风洗练
		{attr = "封印抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 150, maxValue = 1000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 200, maxValue = 1250, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 160, maxValue = 680, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 120, maxValue = 800, rand = 500},
		{attr = "闪避", minValue = 150, maxValue = 1000, rand = 500},
	--[[大力属性大幅度削弱	
		{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "连击概率", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "反击概率", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "物理狂暴率", minValue = 450, maxValue = 1500, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	--]]
		{attr = "命中", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
	--	{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "连击概率", minValue = 30, maxValue = 200, rand = 500},
		{attr = "反击概率", minValue = 90, maxValue = 300, rand = 500},
		{attr = "物理狂暴率", minValue = 90, maxValue = 300, rand = 500},
	--	{attr = "连击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "反击数量", minValue = 1, maxValue = 10, rand = 500},
	--	{attr = "物理伤害结果加成百分比", minValue = 400, maxValue = 2000, rand = 500},
	--	{attr = "物攻", minValue = 75, maxValue = 500, rand = 500},
	
		{attr = "每回合恢复血量", minValue = 27, maxValue = 105, rand = 500},
		{attr = "每回合恢复法力", minValue = 45, maxValue = 175, rand = 500},
		{attr = "根骨", minValue = 1, maxValue = 6, rand = 500},
		{attr = "力量", minValue = 1, maxValue = 6, rand = 500},
		{attr = "灵性", minValue = 1, maxValue = 6, rand = 500},
		{attr = "敏捷", minValue = 1, maxValue = 6, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 225, maxValue = 650, rand = 500},
		{attr = "法力上限", minValue = 225, maxValue = 650, rand = 500},
	--	{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
	--	{attr = "忽视鬼火系伤害抵抗百分比", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "忽视遗忘抵抗概率", minValue = 2040 + level * 505, maxValue = 2040 + level * 505, rand = 500},
	--	{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
	--	{attr = "毒系法术伤害百分比", minValue = 2130 + level * 530, maxValue = 2130 + level * 530, rand = 500},
	--	{attr = "混乱概率", minValue = 225 + level * 55, maxValue = 225 + level * 55, rand = 500},
	--	{attr = "封印概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "昏睡概率", minValue = 590 + level * 150, maxValue = 590 + level * 150, rand = 500},
	--	{attr = "遗忘概率", minValue = 240 + level * 60, maxValue = 240 + level * 60, rand = 500},
	--	{attr = "鬼火系法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "吸血法术伤害百分比", minValue = 1900 + level * 475, maxValue = 1900 + level * 475, rand = 500},
	--	{attr = "风系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "火系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "雷系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "水系狂暴概率", minValue = 420 + level * 115, maxValue = 420 + level * 115, rand = 500},
	--	{attr = "鬼火系狂暴概率", minValue = 715 + level * 175, maxValue = 715 + level * 175, rand = 500},
		--缺少等级-10
		--缺少需求-10%
	--	{attr = "增加对敌方的水属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的金属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的木属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的土属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
	--	{attr = "增加对敌方的火属性伤害", minValue = 905 + level * 225, maxValue = 905 + level * 225, rand = 500},
		{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},
	},      
	
	['护符'] = {--大话2护身符
		{attr = "封印抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "混乱抵抗概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "昏睡抵抗概率", minValue = 300, maxValue = 2000, rand = 500},	
		{attr = "毒系抵抗中毒概率", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "风系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "火系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "雷系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "水系伤害抵抗百分比", minValue = 400, maxValue = 2500, rand = 500},
		{attr = "鬼火系伤害抵抗百分比", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "抗吸血攻击固定值", minValue = 400, maxValue = 1700, rand = 500},
		{attr = "吸收物理伤害结果的百分比", minValue = 150, maxValue = 1000, rand = 500},
		{attr = "闪避", minValue = 150, maxValue = 1000, rand = 500},

		{attr = "命中", minValue = 450, maxValue = 1500, rand = 500},
		{attr = "反震率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "反震伤害比分比", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理攻击致命机率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "连击概率", minValue = 300, maxValue = 2000, rand = 500},
		{attr = "反击概率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "物理狂暴率", minValue = 900, maxValue = 3000, rand = 500},
		{attr = "连击数量", minValue = 1, maxValue = 13, rand = 500},
		{attr = "反击数量", minValue = 4, maxValue = 13, rand = 500},
		{attr = "物理伤害结果加成百分比", minValue = 550, maxValue = 2000, rand = 500},
		{attr = "物攻", minValue = 200, maxValue = 850, rand = 500},

		{attr = "每回合恢复血量", minValue = 90, maxValue = 350, rand = 500},
		{attr = "每回合恢复法力", minValue = 90, maxValue = 350, rand = 500},
		{attr = "根骨", minValue = 2, maxValue = 15, rand = 500},
		{attr = "力量", minValue = 2, maxValue = 15, rand = 500},
		{attr = "灵性", minValue = 2, maxValue = 15, rand = 500},
		{attr = "敏捷", minValue = 2, maxValue = 15, rand = 500},
		{attr = "战斗速度", minValue = 2, maxValue = 12, rand = 500},
		{attr = "血量上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "法力上限", minValue = 450, maxValue = 1300, rand = 500},
		{attr = "忽视风系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视雷系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视水系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视封印抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视混乱抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视昏睡抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视鬼火系伤害抵抗百分比", minValue = 100, maxValue = 500, rand = 500},
		{attr = "忽视遗忘抵抗概率", minValue = 100, maxValue = 500, rand = 500},
		{attr = "火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "雷系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "水系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "风系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "毒系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "混乱概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "封印概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "昏睡概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "遗忘概率", minValue = 100, maxValue = 800, rand = 500},
		{attr = "鬼火系法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "吸血法术伤害百分比", minValue = 100, maxValue = 800, rand = 500},
		{attr = "风系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "雷系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "水系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		{attr = "鬼火系狂暴概率", minValue = 150, maxValue = 1050, rand = 500},
		--缺少需求-10%
		{attr = "增加对敌方的水属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的金属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的木属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的土属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		{attr = "增加对敌方的火属性伤害", minValue = 200, maxValue = 1500, rand = 500},
		--{attr = "被攻击时触发技能3概率", minValue = 700, maxValue = 2000, rand = 500},
		--{attr = "被攻击时触发技能2概率", minValue = 700, maxValue = 2000, rand = 500},
		--{attr = "被攻击时触发技能1概率", minValue = 700, maxValue = 2000, rand = 500},

	},

}

function EquipArtifice.GetData(player)
	local dataTb = {}
	dataTb.Consume = EquipArtifice.Consume
	dataTb.EquipList = EquipArtifice.EquipList
	if EquipAttrClassify then
		dataTb.AttrMark = EquipAttrClassify.EquipArtifice or 11
	end
	if Lua_tools then
		--sLuaApp:LuaDbg("表单回馈")
		local str = [[ if EquipArtificeUI then
				EquipArtificeUI.serverData = ]] .. Lua_tools.serialize(dataTb) .. [[
				EquipArtificeUI.Refresh()
			end
		]]

		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function EquipArtifice.Artificing(player, item_guid, locking, guard_guid)
	local item
	--sLuaApp:LuaDbg("进入Artifcing")
	if item_guid then
		item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	end
	if not item then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行炼化")
		return
	end
	local guard = sGuardSystem:GetGuard(tonumber(guard_guid))
	if guard == nil then
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	else
		local Master = guard:GetMaster()
		if item:GetOwnerGUID() ~= player:GetGUID() then
			if item:GetOwnerGUID() ~= guard:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
			if Master:GetGUID() ~= player:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
		end
	end
	--sLuaApp:LuaDbg("item_guid = " .. item_guid .. "    keyname = " .. item:GetKeyName())
	
	local itemData = ItemConfig.GetByKeyName(item:GetKeyName())
	local type_1 = 1
	local type_2 = 1
	if itemData.Type ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "非装备无法进行炼化")
		return
	end
	type_1 = itemData.Subtype
	
	local types = ""
    if type_1 == 1 then	--武器
		types = "武器"
	elseif type_1 == 2 then	--防具
		type_2 = itemData.Subtype2
		if type_2 == 1 then
			types = "帽子"
		elseif type_2 == 2 then
			types = "衣服"
		elseif type_2 == 3 then
			types = "腰带"
		elseif type_2 == 5 then
			types = "挂坠"
		end
	elseif type_1 == 3 then	--配饰
		type_2 = itemData.Subtype2
		if type_2 == 1 then
			types = "戒指"
		elseif type_2 == 2 then
			types = "项链"
		elseif type_2 == 3 then
			types = "护腕"
		elseif type_2 == 4 then
			types = "鞋子"
		end
	elseif type_1 == 4 then	--防具
		types = "护符"
	end
	--sLuaApp:LuaDbg("11111111111")
	if types == "" then
		sLuaApp:NotifyTipsMsg(player, "该部位的装备无法进行炼化")
		return
	end
	
	EquipArtifice.RandomStart(player, item, locking, types, type_1)
end

function EquipArtifice.RandomStart(player, item, locking, types, itemType)
	local Tb_locking = sLuaApp:StrSplit(locking, ",")
	local locks = 0
	
	for k,v in ipairs(Tb_locking) do
		v = tonumber(v)
		if v == 1 then
			locks = locks + 1
			--sLuaApp:LuaDbg("第"..k.."条为锁定条目")
		end
	end
	--sLuaApp:LuaDbg("22222222222222")
	local AttrClassify
	if EquipAttrClassify then
		AttrClassify = EquipAttrClassify.EquipArtifice
	end
	if not AttrClassify then
		sLuaApp:NotifyTipsMsg(player, "AttrClassify配置异常，没有EquipArtifice属性")
		return
	end
	local Now_Attrs = item:GetDynAttrsByMark(AttrClassify)
	
	if locks >= EquipArtifice.MaxAttrs then
		sLuaApp:NotifyTipsMsg(player, "您锁定的条目已经超过洗练上限了")
		return
	end
	
	if locks > #Now_Attrs or #Tb_locking ~= #Now_Attrs then
		sLuaApp:NotifyTipsMsg(player, "锁定条目异常，客户端锁定条目数"..#Tb_locking.."，当前已有条目"..#Now_Attrs)
		--print("所有条目如下 = "..Lua_tools.serialize(Now_Attrs))
		return
	end
	--sLuaApp:LuaDbg("3333333333333")
	if EquipArtifice.Consume then
		local Tb_consume = EquipArtifice.Consume[locks]
		if Tb_consume then
			local DefectList = Lua_tools.GetDefectList(player, Tb_consume.itemList)
			if #DefectList ~= 0 then
				OneKeyBuy.Main(player, DefectList)
				sLuaApp:NotifyTipsMsg(player, "洗练需要的材料不够哦")
				return
			end
			if not Lua_tools.IsMoneyEnough(player, Tb_consume.MoneyType, Tb_consume.MoneyVal) then
				sLuaApp:NotifyTipsMsg(player, "洗练需要的"..Lua_tools.GetMoneyName(Tb_consume.MoneyType).."不够哦")
				return
			end
			if not Lua_tools.SubMoney(player, Tb_consume.MoneyType, Tb_consume.MoneyVal, "system", "装备洗练", "装备洗练") then
				sLuaApp:NotifyTipsMsg(player, "洗练需要的"..Lua_tools.GetMoneyName(Tb_consume.MoneyType).."不够哦")
				return
			end
			if not Lua_tools.SubItem(player, Tb_consume.itemList, "system", "装备洗练", "装备洗练") then
				sLuaApp:NotifyTipsMsg(player, "洗练需要的材料不够哦")
				return
			end
		end
	end
	--sLuaApp:LuaDbg("3.5skr")
	local lock_attrs = {}
	for k,v in ipairs(Tb_locking) do
		v = tonumber(v)
		if v == 1 then
			if Now_Attrs[k] then
				--sLuaApp:LuaDbg("保留属性"..Now_Attrs[k].attr)
				lock_attrs['Id_'..Now_Attrs[k].attr] = 1
			end
		else
			if Now_Attrs[k] then
				--sLuaApp:LuaDbg("删除属性"..Now_Attrs[k].attr)
				item:SetDynAttr(AttrClassify, Now_Attrs[k].attr, 0)
			end
		end
	end
	--sLuaApp:LuaDbg("4444444444444")
	if EquipArtifice.AttrRandom then
		--sLuaApp:LuaDbg("4.1")
		--print("".. types)
		if EquipArtifice.AttrRandom[types] then
			--sLuaApp:LuaDbg("4.2")
			if EquipArtifice.RandomTable then
				--sLuaApp:LuaDbg("4.3")
				local attrs = {}
				local attr_num = 0
				local ResultRandomTable = EquipArtifice.RandomTable['RandNum_'..itemType] or EquipArtifice.RandomTable['RandNum']
				if ResultRandomTable then
					sLuaApp:LuaDbg(" itemType = " .. itemType)
					local rand = sLuaApp:RandInteger(0, ResultRandomTable[#ResultRandomTable])
					local times = 0
					for i = 1,#ResultRandomTable-1 do
						if rand <= ResultRandomTable[i+1] and rand > ResultRandomTable[i] then
							times = i
						end
					end
					if times <= locks then
						sLuaApp:NotifyTipsMsg(player, "运气不好！没能洗练出更多的属性~")
						return
					end
					--sLuaApp:LuaDbg("5555555555")
					for i = 1,(EquipArtifice.LoopNum or 10)  do
						if attr_num + locks >= times then
							break
						end
						local result = EquipArtifice.GetRandResult(types, 0)
						local answer = EquipArtifice.AttrRandom[types][result]
						if answer then
							if answer['attr'] then
								if not attrs[answer['attr']] then
									if not lock_attrs['Id_'..answer['attrId']] then
										attrs[answer['attr']] = sLuaApp:RandInteger(answer['minValue'],answer['maxValue'])
										attr_num = attr_num + 1
									end
								end
							elseif answer['mutexAttrs'] then
								local result_2 = EquipArtifice.GetRandResult(types, result)
								local answer_2 = answer[result_2]
								if answer_2 then
									if answer_2['attr'] then
										if not attrs[answer_2['attr']] then
											if not lock_attrs['Id_'..answer_2['attrId']] then
												attrs[answer_2['attr']] = sLuaApp:RandInteger(answer_2['minValue'],answer_2['maxValue'])
												attr_num = attr_num + 1
											end
										end
									end
								end
							end
						end
					end
					--sLuaApp:LuaDbg("6666666666")
					--sLuaApp:LuaDbg("随机次数"..EquipArtifice.LoopNum.."   应当随机属性"..times.."个   实际随机属性"..attr_num.."个")
					local index = 1
					for k,v in pairs(attrs) do
						item:SetDynAttr(AttrClassify, AttrConfig.GetByKeyName(k).Id, v)							
						--sLuaApp:LuaDbg("第"..index.."条属性为【"..k.."  "..v.."】")
						index = index + 1
						--sLuaApp:LuaDbg("炼化完成")
					end
				end
			end
		end
	end
end

function EquipArtifice.Initialization()
	if not EquipArtifice.RandomTable then
		EquipArtifice.RandomTable = {}
		--EquipArtifice.ConsumePlus = {}
	end
	--初始化随机表数据
	for k,v in pairs(EquipArtifice.AttrRandom) do
		EquipArtifice.RandomTable[k] = {0}
		local rand = 0
		for a,b in ipairs(v) do
			b.attrId = AttrConfig.GetByKeyName(b.attr).Id
			rand = rand + (b.Rand or 1000)
			sVarSystem:SetInt("RandomTable_luatools_"..k.."_"..a, rand)
			EquipArtifice.RandomTable[k][a+1] = rand
			if b.mutexAttrs then
				local rand_lit = 0
				EquipArtifice.RandomTable[k.."_"..a] = {0}
				for m,n in ipairs(b) do
					rand_lit = rand_lit + (n.Rand or 1000)
					sVarSystem:SetInt("RandomTable_luatools_"..k.."_"..a.."_"..m, rand_lit)
					EquipArtifice.RandomTable[k.."_"..a][m+1] = rand_lit
				end
			end
		end
	end
	if EquipArtifice.AttrNum then
		EquipArtifice.RandomTable['RandNum'] = {0}
		local rand = 0
		for k,v in ipairs(EquipArtifice.AttrNum) do
			rand = rand + v
			sVarSystem:SetInt("RandomTable_luatools_RandNum_"..k, rand)
			EquipArtifice.RandomTable['RandNum'][k+1] = rand
		end
	end
	--初始化最大属性数量
	EquipArtifice.MaxAttrs = 0
	for k,v in pairs(EquipArtifice.AttrNum) do
		if k > EquipArtifice.MaxAttrs then
			EquipArtifice.MaxAttrs = k
		end
	end
	for i = 1,4 do 
		if EquipArtifice['AttrNum_'..i] then
			EquipArtifice.RandomTable['RandNum_'..i] = {0}
			local rand = 0
			for k,v in ipairs(EquipArtifice['AttrNum_'..i]) do
				rand = rand + v
				sVarSystem:SetInt("RandomTable_luatools_RandNum_"..i.."_"..k, rand)
				EquipArtifice.RandomTable['RandNum_'..i][k+1] = rand
			end
			--sLuaApp:LuaDbg("AttrNum_"..i.." = " .. Lua_tools.serialize(EquipArtifice.RandomTable['RandNum_'..i]))
		end
	end
end

function EquipArtifice.GetRandResult(Type, subType)
	if not EquipArtifice.RandomTable then
		EquipArtifice.Initialization()
	end
	if EquipArtifice.RandomTable[Type] then
		if subType and subType ~= 0 then
			local ResultRandomTable = EquipArtifice.RandomTable[Type.."_"..subType]
			if ResultRandomTable then
				local rand = sLuaApp:RandInteger(0, ResultRandomTable[#ResultRandomTable])
				for i = 1,#ResultRandomTable-1 do
					if rand <= ResultRandomTable[i+1] and rand > ResultRandomTable[i] then
						return i
					end
				end
			end
		else
			local ResultRandomTable = EquipArtifice.RandomTable[Type]
			if ResultRandomTable then
				local rand = sLuaApp:RandInteger(0, ResultRandomTable[#ResultRandomTable])
				for i = 1,#ResultRandomTable-1 do
					if rand <= ResultRandomTable[i+1] and rand > ResultRandomTable[i] then
						return i
					end
				end
			end
		end
	end
	return 0
end

--EquipArtifice.Initialization()

