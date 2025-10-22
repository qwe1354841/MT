--密藏配置
SeasonPassConfig = {}

--密藏功能开关("on"需要小写)
SeasonPassConfig.Switch = "on"

--密藏开启等级
SeasonPassConfig.OpenLevel = 10

--密藏最大等级
SeasonPassConfig.MaxLevel = 100

--每X级给个大奖(给客户端做显示用)
SeasonPassConfig.GoodRewardLevel = 10

--密藏每级所需经验(不支持单独配置特定等级所需经验)
SeasonPassConfig.LevelUpExp = 1000

--购买1级密藏等级消耗金元宝数
SeasonPassConfig.BuyLevelCost = 2000

--密藏有效时间(只可向后增加, 不可删除之前的配置)
SeasonPassConfig.Time = {
		"2021-10-1 10:00:00", "2021-10-31 23:59:59",
		"2021-11-1 10:00:00", "2021-11-30 23:59:59",
		"2021-12-1 10:00:00", "2021-12-31 23:59:59",
		"2022-1-1 10:00:00", "2022-1-26 23:59:59",
		"2022-1-26 10:00:00", "2022-2-28 23:59:59",
		"2022-3-1 10:00:00", "2022-3-31 23:59:59",
		"2022-4-1 10:00:00", "2022-4-30 23:59:59",
		"2022-5-1 10:00:00", "2022-5-31 23:59:59",
		"2022-6-1 10:00:00", "2022-6-30 23:59:59",
		"2022-7-1 10:00:00", "2022-7-31 23:59:59",
		"2022-8-1 10:00:00", "2022-8-31 23:59:59",
		"2022-9-1 10:00:00", "2022-9-30 23:59:59",
		"2022-10-1 10:00:00", "2022-10-31 23:59:59",
		"2022-11-1 10:00:00", "2022-11-30 23:59:59",
		"2022-12-1 10:00:00", "2022-12-31 23:59:59",
  		"2023-1-1 10:00:00", "2023-1-31 23:59:59",
		"2023-2-1 10:00:00", "2023-2-28 23:59:59",
}

--购买密藏花费
SeasonPassConfig.PriceConfig = {
	{Code = "com.mengtu.98.seasonpass", Name = "普通版密藏", Amount = 98, Goods = "NormalPrice"},             --普通版
	{Code = "com.mengtu.198.seasonpass", Name = "高级版密藏", Amount = 198, Goods = "LuxuriousPrice"},        --高级版
}

--具体奖励配置
SeasonPassConfig.Item = {
--最多可以写三个参数，格式为  道具keyname, 道具数量, 是否绑定 0不绑定 1绑定 不填默认绑定
--	[1] = {		LowValue = {"密藏代币", 1000}, 				HighValue = {{"高级修炼丹", 1}, {"高级修炼丹", 1}}		},
		[1] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级生命石", 1}, {"解锁背包栏位", 1}}},
		[2] = { LowValue = {"密藏代币", 2000}, HighValue = {{"强化保固石", 2}, {"高级修炼丹", 5}}},
		[3] = { LowValue = {"密藏代币", 1000}, HighValue = {{"1000银元", 1}}},
		[4] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[5] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[6] = { LowValue = {"密藏代币", 2000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[7] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级暴击石", 1}}},
		[8] = { LowValue = {"密藏代币", 1000}, HighValue = {{"强化保固石", 4}}},
		[9] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[10] = { LowValue = {"孙悟空信物", 50}, HighValue = {{"密藏代币", 5000}, {"溅射中(特效)", 1}}},
		[11] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[12] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级生命石", 1}}},
		[13] = { LowValue = {"密藏代币", 1000}, HighValue = {{"1000银元", 1}}},
		[14] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[15] = { LowValue = {"密藏代币", 2000}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[16] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[17] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级暴击石", 1}}},
		[18] = { LowValue = {"密藏代币", 1000}, HighValue = {{"强化保固石", 6}}},
		[19] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[20] = { LowValue = {"5级生命石", 1}, HighValue = {{"密藏代币", 5000}, {"祈福卷轴3", 10}}},
		[21] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[22] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级生命石", 1}}},
		[23] = { LowValue = {"密藏代币", 1000}, HighValue = {{"1000银元", 1}}},
		[24] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[25] = { LowValue = {"密藏代币", 2000}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[26] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[27] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级暴击石", 1}}},
		[28] = { LowValue = {"密藏代币", 1000}, HighValue = {{"强化保固石", 8}}},
		[29] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[30] = { LowValue = {"5级暴击石", 1}, HighValue = {{"密藏代币", 5000}, {"神兽吞噬宠物", 1}}},
		[31] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[32] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级生命石", 1}}},
		[33] = { LowValue = {"密藏代币", 1000}, HighValue = {{"1000银元", 1}}},
		[34] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[35] = { LowValue = {"密藏代币", 2000}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[36] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[37] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级暴击石", 1}}},
		[38] = { LowValue = {"密藏代币", 1000}, HighValue = {{"强化保固石", 10}}},
		[39] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[40] = { LowValue = {"高级修炼丹", 5}, HighValue = {{"密藏代币", 5000}, {"祈福卷轴3", 10}}},
		[41] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[42] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级生命石", 1}}},
		[43] = { LowValue = {"密藏代币", 1000}, HighValue = {{"1000银元", 1}}},
		[44] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[45] = { LowValue = {"密藏代币", 2000}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[46] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[47] = { LowValue = {"密藏代币", 1000}, HighValue = {{"5级暴击石", 1}}},
		[48] = { LowValue = {"密藏代币", 1000}, HighValue = {{"强化保固石", 12}}},
		[49] = { LowValue = {"密藏代币", 1000}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[50] = { LowValue = {"孙悟空信物", 50}, HighValue = {{"密藏代币", 5000}, {"神兽吞噬宠物", 1}}},
		[51] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[52] = { LowValue = {}, HighValue = {{"5级生命石", 1}}},
		[53] = { LowValue = {}, HighValue = {{"1000银元", 1}}},
		[54] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[55] = { LowValue = {}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[56] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[57] = { LowValue = {}, HighValue = {{"5级暴击石", 1}}},
		[58] = { LowValue = {}, HighValue = {{"强化保固石", 14}}},
		[59] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[60] = { LowValue = {"密藏代币", 5000}, HighValue = {{"密藏代币", 5000}, {"祈福卷轴3", 10}}},
		[61] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[62] = { LowValue = {}, HighValue = {{"5级生命石", 1}}},
		[63] = { LowValue = {}, HighValue = {{"1000银元", 1}}},
		[64] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[65] = { LowValue = {}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[66] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[67] = { LowValue = {}, HighValue = {{"5级暴击石", 1}}},
		[68] = { LowValue = {}, HighValue = {{"强化保固石", 16}}},
		[69] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[70] = { LowValue = {"密藏代币", 5000}, HighValue = {{"密藏代币", 5000}, {"神兽吞噬宠物1", 1}}},
		[71] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[72] = { LowValue = {}, HighValue = {{"5级生命石", 1}}},
		[73] = { LowValue = {}, HighValue = {{"1000银元", 1}}},
		[74] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[75] = { LowValue = {}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[76] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[77] = { LowValue = {}, HighValue = {{"5级暴击石", 1}}},
		[78] = { LowValue = {}, HighValue = {{"强化保固石", 18}}},
		[79] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[80] = { LowValue = {"密藏代币", 5000}, HighValue = {{"密藏代币", 5000}, {"祈福卷轴3", 10}}},
		[81] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[82] = { LowValue = {}, HighValue = {{"5级生命石", 1}}},
		[83] = { LowValue = {}, HighValue = {{"1000银元", 1}}},
		[84] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[85] = { LowValue = {}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[86] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[87] = { LowValue = {}, HighValue = {{"5级暴击石", 1}}},
		[88] = { LowValue = {}, HighValue = {{"强化保固石", 20}}},
		[89] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[90] = { LowValue = {"密藏代币", 5000}, HighValue = {{"密藏代币", 5000}, {"神兽吞噬宠物1", 1}}},
		[91] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 5}}},
		[92] = { LowValue = {}, HighValue = {{"5级生命石", 1}}},
		[93] = { LowValue = {}, HighValue = {{"1000银元", 1}}},
		[94] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[95] = { LowValue = {}, HighValue = {{"密藏代币", 2000}, {"随机神兽碎片", 10}}},
		[96] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"强化打造石1", 2}}},
		[97] = { LowValue = {}, HighValue = {{"5级暴击石", 1}}},
		[98] = { LowValue = {}, HighValue = {{"强化保固石", 20}}},
		[99] = { LowValue = {}, HighValue = {{"密藏代币", 1000}, {"高级修炼丹", 10}}},
		[100] = { LowValue = {"随机神兽碎片", 20}, HighValue = {{"密藏代币", 5000}, {"炎帝翅膀永久", 1}}},

}

--已经配置完的慎改, 尤其是Id, 且Id不可重复;  Name,Info,UnitStr随便改
SeasonPassConfig.QuestList = {				
	--Count用于设置完成任务所需的总值, ShowCount用于客户端显示完成度(可以不写, 根据Coefficient和Count生成  Count/Coefficient=ShowCount), Exp用于显示战令经验
	--UnitStr用于客户端显示单位, 不影响功能只影响显示, 但是必须有这项, 如果不想显示单位就填空字符串""
	--如果加新任务, 需要在对应的活动脚本的完成回调里添加SeasonPassQuestFunc.UpdateQuestProgress(player, Quest_Id), 否则无法统计;
	--接上, 如果新任务不是活动, 需要单独写函数以及SeasonPassConfig.QuestKeyWord里的配置
	--Unlock的配置目前只支持设置解锁等级和解锁转生等级  RoleLevel人物等级  RoleAttrReincarnation人物转生等级
	--QuestId是用于判断该密藏目标与哪个主线、支线或者环任务挂钩(填写任务id; 且修业和苦行因为已经配置完毕所以不用填); 如果不挂钩可以不写
	["DailyQuest"] = {
		{Id = 1, Name = "每日在线", Info = "每日在线2小时", Unlock = {RoleAttrReincarnation = 0}, Count = 7200, Exp = 125, Coefficient = 3600, UnitStr = "小时"},
		{Id = 2, Name = "西游奇缘·日", Info = "每日完成西游奇缘任务", Unlock = {RoleAttrReincarnation = 0, RoleLevel = 30}, Count = 10, Exp = 125, Coefficient = 1, UnitStr = "题"},
		{Id = 3, Name = "会考·日", Info = "每日完成乡试，会试或者殿试1次", Unlock = {RoleLevel = 30}, Count = 1, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 4, Name = "银元宝", Info = "从每日活动中获取银元宝6000", Unlock = {RoleLevel = 25}, Count = 6000, Exp = 250, Coefficient = 1, UnitStr = ""},
		{Id = 5, Name = "任意祈福", Info = "进行任意祈福5次", Unlock = {RoleLevel = 13}, Count = 5, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 6, Name = "消耗活力值·日", Info = "每日消耗活力值50点", Unlock = {}, Count = 50, Exp = 125, Coefficient = 1, UnitStr = ""},
		{Id = 7, Name = "降妖任务", Info = "完成降妖任务", Unlock = {RoleLevel = 35}, Count = 10, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 8, Name = "地仙祈福", Info = "进行地仙祈福5次", Unlock = {RoleLevel = 13}, Count = 5, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 9, Name = "飞仙祈福", Info = "进行飞仙祈福5次", Unlock = {RoleLevel = 13}, Count = 5, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 10, Name = "天神祈福", Info = "进行天神祈福5次", Unlock = {RoleLevel = 13}, Count = 5, Exp = 125, Coefficient = 1, UnitStr = "次"},
		{Id = 11, Name = "战斗胜利·日", Info = "每日累计战斗胜利15次", Unlock = {}, Count = 15, Exp = 50, Coefficient = 1, UnitStr = "次"},
		{Id = 12, Name = "普通藏宝图", Info = "使用普通藏宝图5张", Unlock = {}, Count = 5, Exp = 50, Coefficient = 1, UnitStr = "张"},
		{Id = 13, Name = "高级藏宝图", Info = "使用高级藏宝图5张", Unlock = {}, Count = 5, Exp = 50, Coefficient = 1, UnitStr = "张"},
		{Id = 21, Name = "收获金元宝", Info = "获取金元宝6000", Unlock = {}, Count = 6000, Exp = 500, Coefficient = 1, UnitStr = ""},
	},
	
	["WeeklyQuest"] = {
		{Id = 51, Name = "无尽的试炼", Info = "完成无尽的试炼1次", Unlock = {RoleLevel = 30}, Count = 1, Exp = 400, Coefficient = 1, UnitStr = "次"},
		{Id = 52, Name = "消耗活力值·周", Info = "每周消耗活力值450点", Unlock = {}, Count = 450, Exp = 400, Coefficient = 1, UnitStr = ""},
		{Id = 53, Name = "副本·周", Info = "每周通关任意副本5次", Unlock = {RoleLevel = 50}, Count = 5, Exp = 400, Coefficient = 1, UnitStr = "次"},
		{Id = 54, Name = "秘境·周", Info = "每周通关任意秘境3次", Unlock = {RoleLevel = 35}, Count = 3, Exp = 400, Coefficient = 1, UnitStr = "次"},
		{Id = 55, Name = "生产食物·周", Info = "每周生产任意食物5次", Unlock = {RoleLevel = 41}, Count = 5, Exp = 400, Coefficient = 1, UnitStr = "次"},
		{Id = 56, Name = "获取活跃值·周", Info = "每周累计获取活跃值600点", Unlock = {RoleLevel = 25}, Count = 600, Exp = 500, Coefficient = 1, UnitStr = ""},
		{Id = 57, Name = "战斗胜利·周", Info = "每周累计战斗胜利150次", Unlock = {}, Count = 150, Exp = 500, Coefficient = 1, UnitStr = "次"},
		{Id = 58, Name = "打造装备", Info = "打造任意装备1件", Unlock = {}, Count = 1, Exp = 500, Coefficient = 1, UnitStr = "件"},
		{Id = 59, Name = "洗练宠物装备", Info = "洗练任意宠物装备1次", Unlock = {}, Count = 1, Exp = 500, Coefficient = 1, UnitStr = "次"},
	},
	
	["OnceQuest"] = {
		{Id = 101, Name = "修业任务", Info = "完整完成一次修业任务", Unlock = {RoleLevel = 50}, Count = 100, Exp = 1000, Coefficient = 100, UnitStr = "次"},
		{Id = 102, Name = "苦行任务", Info = "完整完成一次苦行任务", Unlock = {RoleLevel = 50}, Count = 100, Exp = 1000, Coefficient = 100, UnitStr = "次"},
		{Id = 103, Name = "消耗银币", Info = "消耗一千万银币", Unlock = {}, Count = 10000000, Exp = 1000, Coefficient = 10000, UnitStr = "万"},
		{Id = 104, Name = "新的旅程", Info = "完成主线任务·新的旅程", Unlock = {}, Count = 1, Exp = 5000, Coefficient = 1, UnitStr = "次", QuestId = 200},
		{Id = 105, Name = "消耗金元宝", Info = "消耗一万金元宝", Unlock = {}, Count = 10000, Exp = 1000, Coefficient = 10000, UnitStr = "万"},
		{Id = 106, Name = "消耗银元宝", Info = "消耗一万银元宝", Unlock = {}, Count = 10000, Exp = 1000, Coefficient = 10000, UnitStr = "万"},

		{Id = 111, Name = "挑战·十二星官", Info = "挑战十二星官10次", Unlock = {RoleLevel = 40}, Count = 10, Exp = 2000, Coefficient = 1, UnitStr = "次"},
		{Id = 112, Name = "闹事的妖怪", Info = "击败闹事的妖怪10次", Unlock = {RoleLevel = 30}, Count = 10, Exp = 2000, Coefficient = 1, UnitStr = "次"},
	},
}

--任务配置关键词，已经配置完的慎改
SeasonPassConfig.QuestKeyWord = {
	["1"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) SeasonPassQuestFunc.GetTodayOnlineSec(player)",
	--["2"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) SeasonPassQuestFunc.XiYouQiYuan(player)",
	--["3"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) SeasonPassQuestFunc.Exam(player)",
	--["4"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) SeasonPassQuestFunc.GetTodayIngot(player)",
	--["7"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) SeasonPassQuestFunc.Act_XiaoGui(player)",
	--["101"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) local Quest_Id = 22 SeasonPassQuestFunc.RingQuest(player, Quest_Id)",
	--["102"] = "local player = sPlayerSystem:GetPlayerByGUID(playerGuid) local Quest_Id = 115 SeasonPassQuestFunc.RingQuest(player, Quest_Id)",
}

--兑换商店配置
SeasonPassConfig.ExchangeShop = {
	[1] = {
		Name = "神兽鸡",                   --道具KeyName(必须得是在item表中, 不支持pet表中的宠物; 如果需要送宠物可以参考这个神兽鸡, 通过兑换一件能"获取宠物"的道具的形式给玩家宠物)
		MoneyType = 0,                     --货币种类, 0代表使用代币, 其余规则与常规货币相同(目前不生效)
		TokenCost = 40000,                   --购买所需代币数量(数字不建议过大), 最好保证总价在五位数及以内 TokenCost * MaxBuy
		MaxBuy = 1,                      --限购数量, 0代表不限购
		Bind = 1,                          --是否绑定, 0不绑定  1绑定, 不填默认1
	},
	[2] = {
		Name = "神兽虎",
		MoneyType = 0,
		TokenCost = 40000,
		MaxBuy = 1,
		Bind = 1,
	},
	[3] = {		Name = "神兽吞噬宠物",		MoneyType = 0,		TokenCost = 36000,		MaxBuy = 0,		Bind = 1,	},
	[4] = {		Name = "神兽吞噬宠物1",		MoneyType = 0,		TokenCost = 72000,		MaxBuy = 0,		Bind = 1,	},
	[5] = {		Name = "中银币袋",		MoneyType = 0,		TokenCost = 10000,		MaxBuy = 0,		Bind = 1,	},
	[6] = {		Name = "6000银元",		MoneyType = 0,		TokenCost = 5000,		MaxBuy = 0,		Bind = 1,	},
	[7] = {		Name = "7级攻击石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[8] = {		Name = "7级魔攻石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[9] = {		Name = "7级物抗石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[10] = {		Name = "7级生命石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[11] = {		Name = "7级速度石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[12] = {		Name = "7级封印石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[13] = {		Name = "7级魔抗石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[14] = {		Name = "7级暴击石",		MoneyType = 0,		TokenCost = 800,		MaxBuy = 20,		Bind = 1,	},
	[15] = {		Name = "强化保固石",		MoneyType = 0,		TokenCost = 500,		MaxBuy = 100,		Bind = 1,	},
	[16] = {		Name = "强化打造石1",		MoneyType = 0,		TokenCost = 500,		MaxBuy = 100,		Bind = 1,	},

}

--购买页 普通版
SeasonPassConfig.PurchaesPageNormal = {
	ShowItem = {                            --只用于客户端展示(如果没有此表或者表格为空, 系统会根据SeasonPassConfig.GoodRewardLevel自动生成, 只取HighValue的数据)
		{"炎帝翅膀永久", 1},                	--格式为 道具KeyName; 道具数量; 是否绑定, 0不绑定  1绑定, 不填默认1
		{"神兽吞噬宠物1", 2},	                    --KeyName相同的道具最好保持Bind一致
		{"溅射中(特效)", 1},	
		{"神兽吞噬宠物", 2},
		{"随机神兽碎片", 120},	
		{"祈福卷轴3", 40},	
		{"5级生命石", 11},
		{"5级暴击石", 11},	
		{"高级修炼丹", 105},	
		{"解锁背包栏位", 1},
		{"1000银元", 10},	
		{"强化保固石", 130},	
		{"强化打造石1", 40},				
	},
	GiveItem = {                            --购买后立即赠送道具, GiveItem可以为空表但是必须有这张表
		{"8级生命石", 1},                   --格式与ShowItem中的道具相同,
		{"强化打造石1", 5},	
		{"神兽吞噬宠物", 1},	
	},
	ShowToken = 180000,                     --显示用代币数量
	GiveToken = 2000,                       --购买后立即赠送代币数量
	
	ShowExp = 0,                            --显示用密藏经验
	GiveExp = 0,                            --购买后立即赠送密藏经验
}

--购买页 高级版
SeasonPassConfig.PurchaesPageLuxurious = {
	ShowItem = {                            --只用于客户端展示(系统不会自动生成)
		{"炎帝翅膀永久", 1},                	--格式为 道具KeyName; 道具数量; 是否绑定, 0不绑定  1绑定, 不填默认1
		{"神兽吞噬宠物1", 2},	                    --KeyName相同的道具最好保持Bind一致
		{"溅射中(特效)", 1},	
		{"神兽吞噬宠物", 2},
		{"随机神兽碎片", 120},	
		{"祈福卷轴3", 40},	
		{"5级生命石", 11},
		{"5级暴击石", 11},	
		{"高级修炼丹", 105},	
		{"解锁背包栏位", 1},
		{"1000银元", 10},	
		{"强化保固石", 130},	
		{"强化打造石1", 40},	
	},
	GiveItem = {                            --购买后立即赠送道具, 格式与ShowItem相同, GiveItem可以为空表但是必须有这张表
		{"9级生命石", 1},
		{"强化打造石1", 20},
		{"神兽吞噬宠物1", 1},
	},
	ShowToken = 180000,                      --显示用代币数量
	GiveToken = 20000,                      --购买后立即赠送代币数量
	
	ShowExp = 0,                            --显示用密藏经验
	GiveExp = 10000,                            --购买后立即赠送密藏经验
}

function SeasonPassConfig.Initilization()
	for k, v in pairs(SeasonPassConfig.QuestList) do
		table.sort(v,function (a,b)
			return a.Id < b.Id
		end)
	end
	SeasonPassConfig.NormalItem = {ShowItem = {}, GiveItem = {}, ShowName = {}, GiveName = {}, ShowBind = {}, GiveBind = {}, ShowToken = 0, GiveToken = 0, ShowCount = 0, GiveCount = 0, ShowExp = 0, GiveExp = 0}
	SeasonPassConfig.LuxuriousItem = {ShowItem = {}, GiveItem = {}, ShowName = {}, GiveName ={}, ShowBind = {}, GiveBind = {}, ShowToken = 0, GiveToken = 0,  ShowCount = 0, GiveCount = 0, ShowExp = 0, GiveExp = 0}
	--普通版
	if not SeasonPassConfig.PurchaesPageNormal or not SeasonPassConfig.PurchaesPageNormal.ShowItem or not next(SeasonPassConfig.PurchaesPageNormal.ShowItem) then
		for i = SeasonPassConfig.GoodRewardLevel, SeasonPassConfig.MaxLevel, SeasonPassConfig.GoodRewardLevel do
			if SeasonPassConfig.Item[i] and SeasonPassConfig.Item[i].HighValue and next(SeasonPassConfig.Item[i].HighValue) then
				for j = 1, #SeasonPassConfig.Item[i].HighValue do
					if SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.Item[i].HighValue[j][1]] then
						SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.Item[i].HighValue[j][1]] = SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.Item[i].HighValue[j][1]] + SeasonPassConfig.Item[i].HighValue[j][2]
					else
						SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.Item[i].HighValue[j][1]] = SeasonPassConfig.Item[i].HighValue[j][2]
						table.insert(SeasonPassConfig.NormalItem.ShowName, SeasonPassConfig.Item[i].HighValue[j][1])
						local Bind = SeasonPassConfig.Item[i].HighValue[j][3] or 1
						SeasonPassConfig.NormalItem.ShowBind[SeasonPassConfig.Item[i].HighValue[j][1]] = Bind
					end
				end
			end
		end
	else
		for i = 1, #SeasonPassConfig.PurchaesPageNormal.ShowItem do
			if SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1]] then
				SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1]] = SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1]] + SeasonPassConfig.PurchaesPageNormal.ShowItem[i][2]
			else
				SeasonPassConfig.NormalItem.ShowItem[SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1]] = SeasonPassConfig.PurchaesPageNormal.ShowItem[i][2]
				table.insert(SeasonPassConfig.NormalItem.ShowName, SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1])
				local Bind = SeasonPassConfig.PurchaesPageNormal.ShowItem[i][3] or 1
				SeasonPassConfig.NormalItem.ShowBind[SeasonPassConfig.PurchaesPageNormal.ShowItem[i][1]] = Bind
			end
		end
	end
	if SeasonPassConfig.PurchaesPageNormal and SeasonPassConfig.PurchaesPageNormal.GiveItem and next(SeasonPassConfig.PurchaesPageNormal.GiveItem) then
		for i = 1, #SeasonPassConfig.PurchaesPageNormal.GiveItem do
			if SeasonPassConfig.NormalItem.GiveItem[SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1]] then
				SeasonPassConfig.NormalItem.GiveItem[SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1]] = SeasonPassConfig.NormalItem.GiveItem[SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1]] + SeasonPassConfig.PurchaesPageNormal.GiveItem[i][2]
			else
				SeasonPassConfig.NormalItem.GiveItem[SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1]] = SeasonPassConfig.PurchaesPageNormal.GiveItem[i][2]
				table.insert(SeasonPassConfig.NormalItem.GiveName, SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1])
				local Bind = SeasonPassConfig.PurchaesPageNormal.GiveItem[i][3] or 1
				SeasonPassConfig.NormalItem.GiveBind[SeasonPassConfig.PurchaesPageNormal.GiveItem[i][1]] = Bind
			end
		end
	end
	SeasonPassConfig.NormalItem.ShowToken = SeasonPassConfig.PurchaesPageNormal.ShowToken or 0
	SeasonPassConfig.NormalItem.GiveToken = SeasonPassConfig.PurchaesPageNormal.GiveToken or 0
	
	SeasonPassConfig.NormalItem.ShowExp = SeasonPassConfig.PurchaesPageNormal.ShowExp or 0
	SeasonPassConfig.NormalItem.GiveExp = SeasonPassConfig.PurchaesPageNormal.GiveExp or 0
	
	if SeasonPassConfig.NormalItem.ShowToken > 0 then
		table.insert(SeasonPassConfig.NormalItem.ShowName, "密藏代币")
		SeasonPassConfig.NormalItem.ShowItem["密藏代币"] = SeasonPassConfig.NormalItem.ShowToken
	end
	if SeasonPassConfig.NormalItem.ShowExp > 0 then
		table.insert(SeasonPassConfig.NormalItem.ShowName, "密藏经验")
		SeasonPassConfig.NormalItem.ShowItem["密藏经验"] = SeasonPassConfig.NormalItem.ShowExp
	end
	SeasonPassConfig.NormalItem.ShowCount = #SeasonPassConfig.NormalItem.ShowName
	
	if SeasonPassConfig.NormalItem.GiveToken > 0 then
		table.insert(SeasonPassConfig.NormalItem.GiveName, "密藏代币")
		SeasonPassConfig.NormalItem.GiveItem["密藏代币"] = SeasonPassConfig.NormalItem.GiveToken
	end
	if SeasonPassConfig.NormalItem.GiveExp > 0 then
		table.insert(SeasonPassConfig.NormalItem.GiveName, "密藏经验")
		SeasonPassConfig.NormalItem.GiveItem["密藏经验"] = SeasonPassConfig.NormalItem.GiveExp
	end
	SeasonPassConfig.NormalItem.GiveCount = #SeasonPassConfig.NormalItem.GiveName
	
	--高级版
	if SeasonPassConfig.PurchaesPageLuxurious and SeasonPassConfig.PurchaesPageLuxurious.ShowItem and next(SeasonPassConfig.PurchaesPageLuxurious.ShowItem) then
		for i = 1, #SeasonPassConfig.PurchaesPageLuxurious.ShowItem do
			if SeasonPassConfig.LuxuriousItem.ShowItem[SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1]] then
				SeasonPassConfig.LuxuriousItem.ShowItem[SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1]] = SeasonPassConfig.LuxuriousItem.ShowItem[SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1]] + SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][2]
			else
				SeasonPassConfig.LuxuriousItem.ShowItem[SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1]] = SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][2]
				table.insert(SeasonPassConfig.LuxuriousItem.ShowName, SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1])
				local Bind = SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][3] or 1
				SeasonPassConfig.LuxuriousItem.ShowBind[SeasonPassConfig.PurchaesPageLuxurious.ShowItem[i][1]] = Bind
			end
		end
	end
	if SeasonPassConfig.PurchaesPageLuxurious and SeasonPassConfig.PurchaesPageLuxurious.GiveItem and next(SeasonPassConfig.PurchaesPageLuxurious.GiveItem) then
		for i = 1, #SeasonPassConfig.PurchaesPageLuxurious.GiveItem do
			if SeasonPassConfig.LuxuriousItem.GiveItem[SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1]] then
				SeasonPassConfig.LuxuriousItem.GiveItem[SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1]] = SeasonPassConfig.LuxuriousItem.GiveItem[SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1]] + SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][2]
			else
				SeasonPassConfig.LuxuriousItem.GiveItem[SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1]] = SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][2]
				table.insert(SeasonPassConfig.LuxuriousItem.GiveName, SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1])
				local Bind = SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][3] or 1
				SeasonPassConfig.LuxuriousItem.GiveBind[SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][1]] = Bind
			end
		end
	end
	
	if SeasonPassConfig.PurchaesPageLuxurious then
		SeasonPassConfig.LuxuriousItem.ShowToken = SeasonPassConfig.PurchaesPageLuxurious.ShowToken or 0
		SeasonPassConfig.LuxuriousItem.GiveToken = SeasonPassConfig.PurchaesPageLuxurious.GiveToken or 0
		
		SeasonPassConfig.LuxuriousItem.ShowExp = SeasonPassConfig.PurchaesPageLuxurious.ShowExp or 0
		SeasonPassConfig.LuxuriousItem.GiveExp = SeasonPassConfig.PurchaesPageLuxurious.GiveExp or 0
	end
	
	if SeasonPassConfig.LuxuriousItem.ShowToken > 0 then
		table.insert(SeasonPassConfig.LuxuriousItem.ShowName, "密藏代币")
		SeasonPassConfig.LuxuriousItem.ShowItem["密藏代币"] = SeasonPassConfig.LuxuriousItem.ShowToken
	end
	if SeasonPassConfig.LuxuriousItem.ShowExp > 0 then
		table.insert(SeasonPassConfig.LuxuriousItem.ShowName, "密藏经验")
		SeasonPassConfig.LuxuriousItem.ShowItem["密藏经验"] = SeasonPassConfig.LuxuriousItem.ShowExp
	end
	SeasonPassConfig.LuxuriousItem.ShowCount = #SeasonPassConfig.LuxuriousItem.ShowName
	
	if SeasonPassConfig.LuxuriousItem.GiveToken > 0 then
		table.insert(SeasonPassConfig.LuxuriousItem.GiveName, "密藏代币")
		SeasonPassConfig.LuxuriousItem.GiveItem["密藏代币"] = SeasonPassConfig.LuxuriousItem.GiveToken
	end
	if SeasonPassConfig.LuxuriousItem.GiveExp > 0 then
		table.insert(SeasonPassConfig.LuxuriousItem.GiveName, "密藏经验")
		SeasonPassConfig.LuxuriousItem.GiveItem["密藏经验"] = SeasonPassConfig.LuxuriousItem.GiveExp
	end
	SeasonPassConfig.LuxuriousItem.GiveCount = #SeasonPassConfig.LuxuriousItem.GiveName
	--sLuaApp:LuaErr(Lua_tools.serialize(SeasonPassConfig.NormalItem))
	--sLuaApp:LuaErr(Lua_tools.serialize(SeasonPassConfig.LuxuriousItem))
end

SeasonPassConfig.Initilization()