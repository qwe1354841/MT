FairyBuildConfig = {}

FairyBuildConfig.Version = "0929_1.02"

FairyBuildConfig.Build_Time = 1			--动画播放时间


FairyBuildConfig.Synthesis = {
	{
		condition = {Role = 0},
		consume = {MoneyType = 5, MoneyVal = 1000},
		formula = {"新手打造卷轴", "仙玉碎片",20,},
		result = {
			{
				info = {"新手装备"},
				item = "新手项链",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男魔仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男魔仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男魔仙器力量向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男魔衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男魔衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男魔衣服力量向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男魔帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男魔帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男魔帽子力量向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男魔", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男魔", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 5},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女魔仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女魔仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女魔仙器力量向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女魔衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女魔衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女魔衣服力量向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女魔", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女魔帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女魔帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女魔帽子力量向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女魔", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女魔", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 6},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女魔", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男人仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男人仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男人仙器力量向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男人衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男人衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男人衣服力量向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男人帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男人帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男人帽子力量向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男人", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男人", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 1},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女人仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女人仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女人仙器力量向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女人衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女人衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女人衣服力量向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女人", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女人帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女人帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女人帽子力量向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女人", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女人", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 2},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女人", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男鬼仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男鬼仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男鬼仙器力量向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男鬼衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男鬼衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男鬼衣服力量向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男鬼帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男鬼帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男鬼帽子力量向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男鬼", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男鬼", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 7},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女鬼仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女鬼仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女鬼仙器力量向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女鬼衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女鬼衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女鬼衣服力量向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女鬼", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女鬼帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女鬼帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女鬼帽子力量向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女鬼", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女鬼", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 8},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女鬼", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "男仙仙器灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男仙仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男仙仙器力量向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "男仙衣服灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男仙衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男仙衣服力量向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "男仙帽子灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男仙帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男仙帽子力量向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男仙", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男仙", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用项链灵性向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用靴子灵性向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用戒指灵性向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 3},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用护腕灵性向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "女仙仙器灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女仙仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女仙仙器力量向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "女仙衣服灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女仙衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女仙衣服力量向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女仙", "仙器碎片",10},
		result = {
			{
				info = {"灵性向","强魔法（高）"},
				item = "女仙帽子灵性向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女仙帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女仙帽子力量向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女仙", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女仙", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用项链灵性向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用靴子灵性向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用戒指灵性向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 4},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女仙", "玄铁",10},
		result = {
			{
				info = {"灵性向"},
				item = "通用护腕灵性向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男龙仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男龙仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男龙仙器力量向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男龙衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男龙衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男龙衣服力量向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "男龙帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "男龙帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "男龙帽子力量向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男龙", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴男龙", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 9},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴男龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女龙仙器根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女龙仙器敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女龙仙器力量向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女龙衣服根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女龙衣服敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女龙衣服力量向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女龙", "仙器碎片",10},
		result = {
			{
				info = {"根骨向","强魔法（高）"},
				item = "女龙帽子根骨向",
			},
			{
				info = {"敏捷向","强魔法（中）"},
				item = "女龙帽子敏捷向",
			},
			{
				info = {"力量向","强物理"},
				item = "女龙帽子力量向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女龙", "仙器碎片",10},
		result = {
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用腰带倍道向",
			},
			{
				info = {"加强负速度","加强负速度属性"},
				item = "通用腰带负速向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 1, MoneyVal = 500},
		formula = {"1阶仙器卷轴女龙", "仙器碎片",10},
		result = {
			{
				info = {"加强气血","加强气血属性"},
				item = "通用挂坠气血向",
			},
			{
				info = {"加倍道兼行度","加倍道兼行度属性"},
				item = "通用挂坠倍道向",
			},
			{
				info = {"加强物理","加强物理属性"},
				item = "通用挂坠物理向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用项链根骨向",
			},
			{
				info = {"力量向"},
				item = "通用项链力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用项链敏捷向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用靴子根骨向",
			},
			{
				info = {"力量向"},
				item = "通用靴子力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用靴子敏捷向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用戒指根骨向",
			},
			{
				info = {"力量向"},
				item = "通用戒指力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用戒指敏捷向",
			},
		},
	},
	{
		condition = {Role = 10},
		consume = {MoneyType = 5, MoneyVal = 100000},
		formula = {"1级装备卷轴女龙", "玄铁",10},
		result = {
			{
				info = {"根骨向"},
				item = "通用护腕根骨向",
			},
			{
				info = {"力量向"},
				item = "通用护腕力量向",
			},
			{
				info = {"敏捷向"},
				item = "通用护腕敏捷向",
			},
		},
	},
}

