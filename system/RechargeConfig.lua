RechargeConfig = {}

-----月卡
RechargeConfig.MonthCard_Switch = "on"
RechargeConfig.MonthCard_Time = {"2020-01-01 00:00:00","2029-12-31 23:59:59"}
RechargeConfig.MonthCard_Config = {
	{Code = "com.mengtu.30.monthcard", Name = "月惠卡", Amount = 30, FirstIngot = 6000, BonusOnce = 1000},
	{Code = "com.mengtu.128.monthcard", Name = "至尊卡", Amount = 128, FirstIngot = 25600, BonusOnce = 5000},
}

-----充值功能表单√
RechargeConfig.RechargeFunction_Config = {
--{Amount = 1, Ingot = 100, BonusOnce = 50, BonusNor = 0, Icon = 1800408600},--测试数据
{Code = "com.mengtu.6", Name = "1200金元宝", Amount = 6, Ingot = 1200, BonusOnce = 1200, BonusNor = 0, Icon = 1800408600},
{Code = "com.mengtu.30", Name = "6000金元宝", Amount = 30, Ingot = 6000, BonusOnce = 6000, BonusNor = 0, Icon = 1800408610},
{Code = "com.mengtu.68", Name = "13600金元宝", Amount = 68, Ingot = 13600, BonusOnce = 13600, BonusNor = 0, Icon = 1800408620},
{Code = "com.mengtu.98", Name = "19600金元宝", Amount = 98, Ingot = 19600, BonusOnce = 19600, BonusNor = 0, Icon = 1800408650},
{Code = "com.mengtu.128", Name = "25600金元宝", Amount = 128, Ingot = 25600, BonusOnce = 25600, BonusNor = 0, Icon = 1800408630},
{Code = "com.mengtu.198", Name = "39600金元宝", Amount = 198, Ingot = 39600, BonusOnce = 39600, BonusNor = 0, Icon = 1800408640},
{Code = "com.mengtu.328", Name = "65600金元宝", Amount = 328, Ingot = 65600, BonusOnce = 65600, BonusNor = 0, Icon = 1800408660},
{Code = "com.mengtu.648", Name = "129600金元宝", Amount = 648, Ingot = 129600, BonusOnce = 129600, BonusNor = 0, Icon = 1800408670},
}

-----等级基金√
RechargeConfig.LevelFund_Switch = "on"
RechargeConfig.LevelFund_Time = {"2020-11-01 00:00:00","2029-01-31 23:59:59"}
RechargeConfig.LevelFund_Mode = "player"
RechargeConfig.LevelFund_Config = {
	['RMB_Val'] = 128,--128元
	['MoneyVal'] = 25600,--10000金元购买
	['MoneyType'] = 1,
	['Desc'] = "128元购买等级基金，即可享受7倍返还！",
	['Code'] = "com.mengtu.128.jijin",
	['Name'] = "等级基金",
	['Reward'] = {
		{Level = 1, Reward_Money = 25600, Reward_Type = 1, Icon = 1800408700},
		{Level = 10, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408610},
		{Level = 20, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408620},
		{Level = 30, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408690},
		{Level = 40, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408650},
		{Level = 50, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408630},
		{Level = 60, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408640},
		{Level = 70, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408660},
		{Level = 80, Reward_Money = 16000, Reward_Type = 1, Icon = 1800408700},
		{Level = 90, Reward_Money = 25600, Reward_Type = 1, Icon = 1800408670},
	},
}

-----连续充值奖励√
RechargeConfig.RechargeOfCon_Switch = "on"
RechargeConfig.RechargeOfCon_Time = {
"2019-05-13 10:00:00","2019-05-19 23:59:59",
"2019-05-20 10:00:00","2019-05-26 23:59:59",
"2019-05-27 10:00:00","2019-06-02 23:59:59",
"2019-06-03 10:00:00","2019-06-09 23:59:59",
"2019-06-10 10:00:00","2019-06-16 23:59:59",
"2019-06-17 10:00:00","2019-06-23 23:59:59",
"2019-06-24 10:00:00","2019-06-30 23:59:59",
"2019-07-01 10:00:00","2019-07-07 23:59:59",
"2019-07-08 10:00:00","2019-07-14 23:59:59",
"2019-07-15 10:00:00","2019-07-21 23:59:59",
"2019-07-22 10:00:00","2019-07-28 23:59:59",
"2019-07-29 10:00:00","2019-08-04 23:59:59",
"2019-08-05 10:00:00","2019-08-11 23:59:59",
"2019-08-12 10:00:00","2019-08-18 23:59:59",
"2019-08-19 10:00:00","2019-08-25 23:59:59",
"2019-08-26 10:00:00","2019-09-01 23:59:59",
}
RechargeConfig.RechargeOfCon_SeverTime = {
"1 10:00:00","7 23:59:59",
"8 10:00:00","14 23:59:59",
"15 10:00:00","21 23:59:59",
"22 10:00:00","28 23:59:59",
"29 10:00:00","35 23:59:59",
"36 10:00:00","42 23:59:59",
"43 10:00:00","49 23:59:59",
"50 10:00:00","56 23:59:59",
"57 10:00:00","63 23:59:59",
"64 10:00:00","70 23:59:59",
"71 10:00:00","77 23:59:59",
"78 10:00:00","84 23:59:59",
"85 10:00:00","91 23:59:59",
"92 10:00:00","98 23:59:59",
"99 10:00:00","105 23:59:59",
"106 10:00:00","112 23:59:59",
"113 10:00:00","119 23:59:59",
"120 10:00:00","126 23:59:59",
"127 10:00:00","133 23:59:59",
"134 10:00:00","140 23:59:59",
"141 10:00:00","147 23:59:59",
"148 10:00:00","154 23:59:59",
"155 10:00:00","161 23:59:59",
"162 10:00:00","168 23:59:59",
"169 10:00:00","175 23:59:59",
"176 10:00:00","182 23:59:59",
"183 10:00:00","189 23:59:59",
"190 10:00:00","196 23:59:59",
"197 10:00:00","203 23:59:59",
"204 10:00:00","210 23:59:59",
"211 10:00:00","217 23:59:59",
"218 10:00:00","224 23:59:59",
"225 10:00:00","231 23:59:59",
"232 10:00:00","238 23:59:59",
"239 10:00:00","245 23:59:59",
"246 10:00:00","252 23:59:59",
"253 10:00:00","259 23:59:59",
"260 10:00:00","266 23:59:59",
"267 10:00:00","273 23:59:59",
"274 10:00:00","280 23:59:59",
"281 10:00:00","287 23:59:59",
"288 10:00:00","294 23:59:59",
"295 10:00:00","301 23:59:59",
}

RechargeConfig.RechargeOfCon_Config = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "装备强化石2",Num = 5, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "强化保固石",Num = 5, Bind = 0},
	{Pet = "伪玄影猫",Bind = 0},
	}
RechargeConfig.RechargeOfCon_Config_1 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "装备强化石2",Num = 5, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "强化保固石",Num = 5, Bind = 0},
	{Pet = "伪玄影猫",Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_2 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_3 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_4 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_5 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_6 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_7 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}
RechargeConfig.RechargeOfCon_Config_8 = {
	{Item = "装备强化石",Num = 10, Bind = 0},
	{Item = "高级宝石福袋",Num = 5, Bind = 0},
	{Item = "1000银元",Num = 10, Bind = 0},
	{Item = "仙兽玉牌",Num = 5, Bind = 0},
	{Item = "变异吞噬宠物",Num = 1,Bind = 0},
}

-----幸运转盘√
RechargeConfig.LuckyWheel_Switch = "on"
RechargeConfig.LuckyWheel_TenthMode = 1
RechargeConfig.LuckyWheel_Time = {"2021-6-10 14:02:00","2028-06-31 23:59:59"}
RechargeConfig.LuckyWheel_Config = {
	['ConsumeToTimes'] = 10000,
	['WheelList_1'] = {
		{Item = "孙悟空信物",Num = 50, Bind = 1, Advert = 1, Rand = 1},
		{Item = "孙悟空信物",Num = 1, Bind = 1, Advert = 1, Rand = 30000},
		{Item = "幻身咒礼包4",Num = 1, Bind = 1, Rand = 200000},
		{Item = "宠物经验丹",Num = 10, Bind = 1, Rand = 200000},
		{Item = "1000银元宝",Num = 2, Bind = 1, Rand = 200000},
		{Item = "高级宝石福袋",Num = 1, Bind = 1, Advert = 1, Rand = 70000},
		{Item = "宝石福袋",Num = 2, Bind = 1, Rand = 150000},
		{Item = "装备强化石",Num = 5, Bind = 1, Rand = 150000},
	},
	['WheelList_2'] = {
		{Item = "高级藏宝图",Num = 5, Bind = 1, Advert = 1, Rand = 100},
		{Item = "高级宠物秘籍包",Num = 1, Bind = 1, Advert = 1, Rand = 10000},
		{Item = "普通宠物秘籍包",Num = 1, Bind = 1, Rand = 200000},
		{Item = "宠物经验丹",Num = 10, Bind = 1, Rand = 250000},
		{Item = "1000银元宝",Num = 2, Bind = 1, Rand = 250000},
		{Item = "还原丹",Num = 5, Bind = 1, Rand = 250000},
		{Item = "高级还原丹",Num = 1, Bind = 1, Advert = 1, Rand = 10000},
		{Item = "神兽狗碎片",Num = 20, Bind = 1, Advert = 1, Rand = 1},
	},
}

RechargeConfig.LuckyWheel_Config_2 = {
	['ConsumeToTimes'] = 10000,
	['WheelList_1'] = {
		{Item = "观音菩萨信物",Num = 50, Bind = 1, Advert = 1, Rand = 1},
		{Item = "观音菩萨信物",Num = 1, Bind = 1, Advert = 1, Rand = 30000},
		{Item = "幻身咒礼包4",Num = 1, Bind = 1, Rand = 200000},
		{Item = "宠物经验丹",Num = 10, Bind = 1, Rand = 200000},
		{Item = "1000银元宝",Num = 2, Bind = 1, Rand = 200000},
		{Item = "高级宝石福袋",Num = 1, Bind = 1, Advert = 1, Rand = 70000},
		{Item = "宝石福袋",Num = 2, Bind = 1, Rand = 150000},
		{Item = "装备强化石",Num = 5, Bind = 1, Rand = 150000},
	},
	['WheelList_2'] = {
		{Item = "高级藏宝图",Num = 5, Bind = 1, Advert = 1, Rand = 100},
		{Item = "高级宠物秘籍包",Num = 1, Bind = 1, Advert = 1, Rand = 10000},
		{Item = "普通宠物秘籍包",Num = 1, Bind = 1, Rand = 200000},
		{Item = "宠物经验丹",Num = 10, Bind = 1, Rand = 250000},
		{Item = "1000银元宝",Num = 2, Bind = 1, Rand = 250000},
		{Item = "还原丹",Num = 5, Bind = 1, Rand = 250000},
		{Item = "高级还原丹",Num = 1, Bind = 1, Advert = 1, Rand = 10000},
		{Item = "神兽狗碎片",Num = 20, Bind = 1, Advert = 1, Rand = 1},
	},
}

-----累积充值奖励√
RechargeConfig.RechargeOfAcc_Switch = "on"
RechargeConfig.RechargeOfAcc_Time = {
"2020-01-01 00:00:00","2021-01-31 23:59:59",
}
RechargeConfig.RechargeOfAcc_SeverTime = {
"1 10:00:00","5 23:59:59",
"6 10:00:00","10 23:59:59",
"11 10:00:00","15 23:59:59",
"16 10:00:00","20 23:59:59",
"21 10:00:00","25 23:59:59",
"26 10:00:00","30 23:59:59",
"31 10:00:00","35 23:59:59",
"36 10:00:00","40 23:59:59",
"41 10:00:00","45 23:59:59",
"46 10:00:00","50 23:59:59",
"51 10:00:00","55 23:59:59",
"56 10:00:00","60 23:59:59",
"61 10:00:00","65 23:59:59",
"66 10:00:00","70 23:59:59",
"71 10:00:00","75 23:59:59",
"76 10:00:00","80 23:59:59",
"81 10:00:00","85 23:59:59",
"86 10:00:00","90 23:59:59",
"91 10:00:00","95 23:59:59",
"96 10:00:00","100 23:59:59",
"101 10:00:00","105 23:59:59",
"106 10:00:00","110 23:59:59",
"111 10:00:00","115 23:59:59",
"116 10:00:00","120 23:59:59",
"121 10:00:00","125 23:59:59",
"126 10:00:00","130 23:59:59",
"131 10:00:00","135 23:59:59",
"136 10:00:00","140 23:59:59",
"141 10:00:00","145 23:59:59",
"146 10:00:00","150 23:59:59",
"151 10:00:00","155 23:59:59",
"156 10:00:00","160 23:59:59",
"161 10:00:00","165 23:59:59",
"166 10:00:00","170 23:59:59",
"171 10:00:00","175 23:59:59",
"176 10:00:00","180 23:59:59",
"181 10:00:00","185 23:59:59",
"186 10:00:00","190 23:59:59",
"191 10:00:00","195 23:59:59",
"196 10:00:00","200 23:59:59",
"201 10:00:00","205 23:59:59",
"206 10:00:00","210 23:59:59",
"211 10:00:00","215 23:59:59",
"216 10:00:00","220 23:59:59",
"221 10:00:00","225 23:59:59",
"226 10:00:00","230 23:59:59",
"231 10:00:00","235 23:59:59",
"236 10:00:00","240 23:59:59",
"241 10:00:00","245 23:59:59",
"246 10:00:00","250 23:59:59",
"251 10:00:00","255 23:59:59",
"256 10:00:00","260 23:59:59",
"261 10:00:00","265 23:59:59",
"266 10:00:00","270 23:59:59",
"271 10:00:00","275 23:59:59",
"276 10:00:00","280 23:59:59",
"281 10:00:00","285 23:59:59",
"286 10:00:00","290 23:59:59",
"291 10:00:00","295 23:59:59",
"296 10:00:00","300 23:59:59",
}

--VisibleMoney 充值大于等于多少可见，默认为0
RechargeConfig.RechargeOfAcc_Config = {
	--{Target = 1, ItemList = {"100金元宝",1,1,"R礼包",1,0,"装备强化符",4,0}},--测试数据
	{Target = 30, 		ItemList = {"1000银元",10,1,"R礼包",10,0,"解锁背包栏位",1,0,"解锁仓库栏位",1,0,"装备强化石",20,0}},
	{Target = 60, 		ItemList = {"1000银元",12,1,"SR礼包",5,0,"强化保固石",5,0,"宠物经验丹",5,0,"装备强化石",25,0}}, 
	{Target = 100, 	VisibleMoney = 0,	ItemList = {"1000银元",14,1,"SSR礼包",5,0,"解锁宠物栏位",1,0,"宠物经验丹",10,0,"解锁宠物仓库栏位",1,0}},
	{Target = 200, 	VisibleMoney = 0,	ItemList = {"1000银元",16,1,"强化打造石1",5,0,"高级宠物秘籍包",1,0,"高级宝石福袋",10,0},
		ItemList_31 = {"40级光无限橙重剑#4",1,0},--谪剑仙，男，重剑
		ItemList_32 = {"40级光无限橙弓箭#4",1,0},--飞翼姬，女，弓箭
		ItemList_33 = {"40级光无限橙扇子#4",1,0},--烟云客，男，扇子
		ItemList_34 = {"40级光无限橙笛子#4",1,0},--冥河使，男，笛子
		ItemList_35 = {"40级光无限橙爪刺#4",1,0},--阎魔令，男，爪刺
		ItemList_36 = {"40级光无限橙毛笔#4",1,0},--雨师君，男，毛笔
		ItemList_37 = {"40级光无限橙阔刀#4",1,0},--神霄卫，男，阔刀
		ItemList_38 = {"40级光无限橙长枪#4",1,0},--傲红莲，女，长枪
		ItemList_39 = {"40级光无限橙双剑#4",1,0},--花弄影，女，双剑
		ItemList_40 = {"40级光无限橙长鞭#4",1,0},--青丘狐，女，长鞭
		ItemList_41 = {"40级光无限橙短杖#4",1,0},--海鲛灵，女，短杖
		ItemList_42 = {"40级光无限橙绣伞#4",1,0},--凤凰仙，女，绣伞
	},	
	{Target = 500, 	VisibleMoney = 0,	ItemList = {"1000银元",18,"SSR礼包",10,0,"高级还原丹",1,0,"培养液2",2,0,"宠物经验丹",20,0}},
	{Target = 1000, VisibleMoney = 0,	ItemList = {"1000银元",20,1,"阵法礼包",2,0,"强化打造石1",10,0,"修炼丹",10,0},
		ItemList_31 = {"60级光无限橙重剑#4",1,0},--谪剑仙，男，重剑
		ItemList_32 = {"60级光无限橙弓箭#4",1,0},--飞翼姬，女，弓箭
		ItemList_33 = {"60级光无限橙扇子#4",1,0},--烟云客，男，扇子
		ItemList_34 = {"60级光无限橙笛子#4",1,0},--冥河使，男，笛子
		ItemList_35 = {"60级光无限橙爪刺#4",1,0},--阎魔令，男，爪刺
		ItemList_36 = {"60级光无限橙毛笔#4",1,0},--雨师君，男，毛笔
		ItemList_37 = {"60级光无限橙阔刀#4",1,0},--神霄卫，男，阔刀
		ItemList_38 = {"60级光无限橙长枪#4",1,0},--傲红莲，女，长枪
		ItemList_39 = {"60级光无限橙双剑#4",1,0},--花弄影，女，双剑
		ItemList_40 = {"60级光无限橙长鞭#4",1,0},--青丘狐，女，长鞭
		ItemList_41 = {"60级光无限橙短杖#4",1,0},--海鲛灵，女，短杖
		ItemList_42 = {"60级光无限橙绣伞#4",1,0},--凤凰仙，女，绣伞
	},
	{Target = 2000, VisibleMoney = 0,	ItemList = {"1000银元",22,1,"SSR礼包",20,0,"高级宝石福袋",20,0,"还原丹",10,0,"高级藏宝图",10,0}},
	{Target = 3000, VisibleMoney = 0,	ItemList = {"1000银元",24,1,"阵法礼包",10,0,"宠物经验丹",20,0,"强化打造石1",15,0,"宠物经验丹",25,0}},
	{Target = 4500, VisibleMoney = 0,	ItemList = {"1000银元",26,1,"SSR礼包",50,0,"宠物经验丹",30,0,"高级还原丹",2,0,"装备强化石2",20,0}},
	{Target = 6000, VisibleMoney = 0,	ItemList = {"1000银元",28,1,"宠物经验丹",30,0,"特殊宠物秘籍包",2,0,"高级宝石福袋",40,0,"装备强化石2",50,0}},
	{Target = 100000,VisibleMoney = 0, 	ItemList = {"1000银元",30,1,"随机神兽碎片",99,0,"SSR礼包",10,0,"培养液3",1,0,"超级宠物秘籍包",2,0}},
}

-----每日一元购√
RechargeConfig.BuyOfDay_Switch = "on"
RechargeConfig.BuyOfDay_Time = {"2020-11-01 00:00:00","2029-01-31 23:59:59"}
RechargeConfig.BuyOfDay_Mode = "player"
RechargeConfig.BuyOfDay_Config = {
	['Loop'] = "Weekly",
	['Goods'] = {
		--{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"10银元宝",2,1,"幻身咒礼包1",1,1},MoneyList = {4,30000}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"幻身咒礼包1",1,0,"N礼包",3,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"藏宝图",2,0,"R礼包",1,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"幻身咒礼包1",1,0,"宝石福袋",3,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"藏宝图",2,0,"装备强化石",5,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"幻身咒礼包1",1,0,"装备强化石2",1,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"藏宝图",2,0,"人物经验丹",2,0}},
		{Code = "com.mengtu.1.day", Name = "每日1元礼包", MoneyVal = 1, MoneyType = 999, ItemList = {"100银元宝",2,1,"幻身咒礼包1",1,0,"高级宠物秘籍包",1,0}},
	}
	
}


-----每日充值奖励√
RechargeConfig.RechargeOfDay_Switch = "on"
RechargeConfig.RechargeOfDay_Time = {
"2020-01-01 00:00:00","2029-01-31 23:59:59",
}
RechargeConfig.RechargeOfDay_Config = {
	--{Target = 1, ItemList = {"宝石福袋",1,1,"装备强化符",1,0}},--测试数据
	{Target = 6, 	ItemList = {"宝石福袋",3,0,"装备强化石",5,0,"修炼丹",1,0}}, --PetList = {"高级素尾白狐"}},
	{Target = 30, 	ItemList = {"高级宝石福袋",1,0,"装备强化石",15,0,"修炼丹",3,0,"普通宠物秘籍包",1,0}}, 
	{Target = 98, 	ItemList = {"高级宝石福袋",3,0,"装备强化石",30,0,"修炼丹",7,0,"普通宠物秘籍包",2,0,"强化保固石",1,0}},
	{Target = 198,	ItemList = {"高级宝石福袋",7,0,"装备强化石2",15,0,"修炼丹",15,0,"高级宠物秘籍包",1,0,"强化保固石",2,0}},
	{Target = 328, 	ItemList = {"高级宝石福袋",20,0,"装备强化石2",25,0,"修炼丹",25,0,"高级宠物秘籍包",2,0,"强化保固石",6,0}},
	{Target = 648, 	ItemList = {"高级宝石福袋",30,0,"装备强化石2",35,0,"修炼丹",35,0,"超级宠物秘籍包",1,0,"强化保固石",15,0}},
	{Target = 1296, ItemList = {"高级宝石福袋",40,0,"装备强化石2",50,0,"修炼丹",50,0,"特殊宠物秘籍包",1,0,"强化保固石",35,0}},
}

------每日消费√
RechargeConfig.ConsumIngotOfDay_Switch = "on"
RechargeConfig.ConsumIngotOfDay_Time = {"2020-11-01 00:00:00","2029-01-31 23:59:59"}
RechargeConfig.ConsumIngotOfDay_Mode = "player"
RechargeConfig.ConsumIngotOfDay_Config = {
	{Target = 200, 		ItemList = {"宝石福袋",1,0,"装备强化石",1,0}}, 
	{Target = 1760, 	ItemList = {"宝石福袋",3,0,"装备强化石",1,0,"小修炼丹",1,0}}, 
	{Target = 3760,		ItemList = {"宝石福袋",6,0,"装备强化石",2,0,"小修炼丹",2,0,"N礼包",3,0,"强化保固石",1,0}}, 
	{Target = 7760, 	ItemList = {"高级宝石福袋",1,0,"装备强化石",5,0,"小修炼丹",3,0,"N礼包",5,0,"强化保固石",2,0}}, 
	{Target = 15760, 	ItemList = {"高级宝石福袋",2,0,"装备强化石",10,0,"修炼丹",1,0,"R礼包",1,0,"强化保固石",5,0}}, 
	{Target = 31760, 	ItemList = {"高级宝石福袋",5,0,"装备强化石",20,0,"修炼丹",2,0,"R礼包",5,0,"强化保固石",10,0}},
	{Target = 51760, 	ItemList = {"高级宝石福袋",10,0,"装备强化石",40,0,"修炼丹",4,0,"SR礼包",1,0,"强化保固石",15,0}},
	{Target = 71760, 	ItemList = {"高级宝石福袋",15,0,"装备强化石2",20,0,"修炼丹",6,0,"SR礼包",2,0,"强化保固石",20,0}},
	{Target = 91760, 	ItemList = {"高级宝石福袋",20,0,"装备强化石2",30,0,"修炼丹",8,0,"SSR礼包",1,0,"强化保固石",30,0}},
	{Target = 131760, 	ItemList = {"高级宝石福袋",25,0,"装备强化石2",40,0,"修炼丹",10,0,"SSR礼包",2,0,"强化保固石",40,0}},
	{Target = 191760, 	ItemList = {"高级宝石福袋",50,0,"装备强化石2",50,0,"修炼丹",20,0,"SSR礼包",3,0,"强化保固石",60,0}},
	{Target = 251760, 	ItemList = {"高级宝石福袋",75,0,"装备强化石2",60,0,"修炼丹",40,0,"SSR礼包",4,0,"强化保固石",80,0}},
}


------累积消费返元宝√
RechargeConfig.ConsumIngotOfAcc_Switch = "on"
RechargeConfig.ConsumIngotOfAcc_Time = {"2020-11-01 00:00:00","2029-01-31 23:59:59"}
RechargeConfig.ConsumIngotOfAcc_Mode = "player"
RechargeConfig.ConsumIngotOfAcc_Config = {
	{Target = 1000, RewardVal = 40, RewardType = 1},
	{Target = 2000, RewardVal = 80, RewardType = 1},
	{Target = 4000, RewardVal = 160, RewardType = 1},
	{Target = 10000, RewardVal = 320, RewardType = 1},
	{Target = 20000, RewardVal = 800, RewardType = 1},
	{Target = 60000, RewardVal = 3000, RewardType = 1},
	{Target = 100000, RewardVal = 5000, RewardType = 1},
	{Target = 200000, RewardVal = 10000, RewardType = 1},
	{Target = 300000, RewardVal = 16000, RewardType = 1},
	{Target = 400000, RewardVal = 24000, RewardType = 1},
	{Target = 600000, RewardVal = 40000, RewardType = 1},
}



------人民币限购礼包√
RechargeConfig.RMBShopOfOnce_Switch = "on"
RechargeConfig.RMBShopOfOnce_Time = {
	"2020-11-01 00:00:00","2029-01-31 23:59:59",
	
}
RechargeConfig.RMBShopOfOnce_Mode = "player"
RechargeConfig.RMBShopOfOnce_Config = {
	--{Times = 3, Price = 1, RewardVal = 100, RewardType = 1, ItemList = {"装备强化石",4,0}},--测试数据
	{Code = "com.mengtu.98.xianshi", Name = "限时98元礼包", Times = 3, Price = 98, RewardVal = 19600, RewardType = 1, ItemList = {"神兽吞噬宠物",1,0,"普通洗练符",20,0,"高级洗练符",5,0}},
	{Code = "com.mengtu.198.xianshi", Name = "限时198元礼包", Times = 3, Price = 198, RewardVal = 39600, RewardType = 1, ItemList = {"神兽吞噬宠物",2,0,"普通洗练符",40,0,"高级洗练符",10,0}},
	{Code = "com.mengtu.328.xianshi", Name = "限时328元礼包", Times = 3, Price = 328, RewardVal = 65600, RewardType = 1, ItemList = {"神兽吞噬宠物",3,0,"普通洗练符",60,0,"高级洗练符",15,0}},
	{Code = "com.mengtu.648.xianshi", Name = "限时648元礼包", Times = 3, Price = 648, RewardVal = 129600, RewardType = 1, ItemList = {"神兽吞噬宠物",5,0,"普通洗练符",100,0,"高级洗练符",25,0}},
--[[
	{Times = 3, Price = 198, RewardVal = 19800, RewardType = 1, ItemList = {"特效卷轴礼盒1",3,1,"装备强化石2",10,0,"强化保固石",10,0}},
	{Times = 3, Price = 328, RewardVal = 32800, RewardType = 1, ItemList = {"特效卷轴礼盒3",1,1,"特技卷轴礼盒4",1,1,"强化保固石",20,0}},
	{Times = 3, Price = 648, RewardVal = 64800, RewardType = 1, ItemList = {"特技卷轴礼盒5",1,1,"装备强化石2",40,0,"强化保固石",40,0}},
--]]
}