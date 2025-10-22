-- 帮派配置
GuildConfig = {}

--帮派资金初始上限
GuildConfig.InitialFund = 500000
--帮派初始可以容纳人数
GuildConfig.InitialPlayerNum = 50
--弹劾时间,秒
GuildConfig.ImpeachTime = 60*60*24*7

-- 帮派建筑
GuildConfig.BuildingsConfig = {
	[1] = {
		["BuildingName"] = "忠义堂",
		["BuildingNpc"] = 0,
		["BuildingLevels"] = {
			[1] = {BuildDegreeRequired = 0, BuildingIdRequired = 0, BuildingLevelRequired = 0, FundRequired = 0, Param1= 0, Param2 = 0},
			[2] = {BuildDegreeRequired = 20000, BuildingIdRequired = 0, BuildingLevelRequired = 1, FundRequired = 400000, Param1= 0, Param2 = 0},
			[3] = {BuildDegreeRequired = 40000, BuildingIdRequired = 0, BuildingLevelRequired = 2, FundRequired = 640000, Param1= 0, Param2 = 0},
			[4] = {BuildDegreeRequired = 120000, BuildingIdRequired = 0, BuildingLevelRequired = 3, FundRequired = 960000, Param1= 0, Param2 = 0},
			[5] = {BuildDegreeRequired = 300000, BuildingIdRequired = 0, BuildingLevelRequired = 4, FundRequired = 1360000, Param1= 0, Param2 = 0},
		},
		['str'] = "忠义堂等级提升了，帮派已达到等级",
	},
	[2] = {
		["BuildingName"] = "帮派厢房",
		["BuildingNpc"] = 0,
		["BuildingLevels"] = {
			[1] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 2, FundRequired = 50000, Param1= 100, Param2 = 0},
			[2] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 3, FundRequired = 80000, Param1= 120, Param2 = 0},
			[3] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 4, FundRequired = 120000, Param1= 150, Param2 = 0},
			[4] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 170000, Param1= 200, Param2 = 0},
			[5] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 230000, Param1= 250, Param2 = 0},
		},
		['str'] = "帮派厢房的等级提升了，欢迎大家招揽新的朋友！",
	},
	[3] = {
		["BuildingName"] = "帮派金库",
		["BuildingNpc"] = 0,
		["BuildingLevels"] = {
			[1] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 2, FundRequired = 100000, Param1= 800000, Param2 = 0},
			[2] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 3, FundRequired = 160000, Param1= 1200000, Param2 = 0},
			[3] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 4, FundRequired = 240000, Param1= 1700000, Param2 = 0},
			[4] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 340000, Param1= 2300000, Param2 = 0},
			[5] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 460000, Param1= 3000000, Param2 = 0},
		},
		['str'] = "帮派金库的等级提升了，大家快去捐献建设帮派吧！",
	},
	[4] = {
		["BuildingName"] = "帮派书院",
		["BuildingNpc"] = 0,
		["BuildingLevels"] = {
			[1] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 1, FundRequired = 50000, Param1= 10, Param2 = 0},
			[2] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 2, FundRequired = 80000, Param1= 10, Param2 = 0},
			[3] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 3, FundRequired = 120000, Param1= 10, Param2 = 0},
			[4] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 4, FundRequired = 170000, Param1= 10, Param2 = 0},
			[5] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 300000, Param1= 20, Param2 = 0},
		},
		['str'] = "帮派书院的等级提升了，新的帮派技能等级上限已解锁！",
	},
	[5] = {
		["BuildingName"] = "帮派商店",
		["BuildingNpc"] = 0,
		["BuildingLevels"] = {
			[1] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 1, FundRequired = 150000, Param1= 10, Param2 = 0},
			[2] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 2, FundRequired = 240000, Param1= 20, Param2 = 0},
			[3] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 3, FundRequired = 360000, Param1= 30, Param2 = 0},
			[4] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 4, FundRequired = 510000, Param1= 40, Param2 = 0},
			[5] = {BuildDegreeRequired = 0, BuildingIdRequired = 1, BuildingLevelRequired = 5, FundRequired = 690000, Param1= 50, Param2 = 0},
		},
		['str'] = "帮派宝阁的等级提升了，阁主那里有新的道具出售哦~",
	},

}

--捐献配置
GuildConfig.DonateConfig = {
	['MoneyType'] = 2,
	['WeekMax'] = 200000,
	['Config'] = {
		[1] = {
			['MoneyValue'] = 200,
			['Contribute'] = 10,
			['Fund'] = 100,
		},
		[2] = {
			['MoneyValue'] = 2000,
			['Contribute'] = 100,
			['Fund'] = 1000,
		},
		[3] = {
			['MoneyValue'] = 20000,
			['Contribute'] = 1000,
			['Fund'] = 10000,
		},
		[4] = {
			['MoneyValue'] = 200000,
			['Contribute'] = 10000,
			['Fund'] = 100000,
		},
	},
}
--每日维护
GuildConfig.DailyCareFund = {
	[1] = 3000,
	[2] = 6000,
	[3] = 10000,
	[4] = 20000,
	[5] = 50000,
}
--分红计算公式
GuildConfig.Dividend = "return math.floor(LastWeekContrb*0.1+TotalContrb*0.1+0)"

GuildConfig.Job2Name = {
	[0] = "帮众",
	[1] = "精英",
	[2] = "",
	[3] = "玄武堂堂主",
	[4] = "朱雀堂堂主",
	[5]  = "白虎堂堂主",
	[6] = "青龙堂堂主",
	[7] = "副帮主",
	[8] = "帮主",      
}

--修改帮派名称
GuildConfig.ChangeNameBindGold = 50001
GuildConfig.ChangeNameGuildFund = 50001