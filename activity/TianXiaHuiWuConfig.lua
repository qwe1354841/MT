--天下会武（世界PVP）配置表
TianXiaHuiWuConfig={}


--活动界面显示的物品 字符串 物品id
TianXiaHuiWuConfig.ShowItem = "61024,26199,20165,20166,20167"

TianXiaHuiWuConfig.DefaultRating = 2000 --初始rank分

TianXiaHuiWuConfig.Tips = [[1.通过战斗可以获得战功牌等其他丰厚奖励。\n2.战斗奖励礼包及胜利奖励礼包，达到条件后\n自动领取，包裹满时将以邮件发送。\n3.排行榜前三名还可通过邮件获得额外奖励。\n4.排行榜优先以活动积分为判断，积分相同\n时，以获得积分时间先后为判断。]]


--活动结束后邮件发的奖励表单 MoneyType 货币类型 MoneyVal 货币固定值
TianXiaHuiWuConfig.End_Mail_Reward = {
	reward_1 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",5,0,"神兽虎碎片",2,0 ,"蚩尤变身药",1,0 ,"变异吞噬宠物",1,0 ,"特技卷轴礼盒4",1,0,"战功牌",30,1}
	},
	reward_2 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",3,0,"神兽虎碎片",1,0 ,"蚩尤变身药",1,0 ,"宝宝吞噬宠物",1,0 ,"战功牌",20,1}
	},
	reward_3 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",1,0,"神兽虎碎片",1,0 ,"蚩尤变身药",1,0 ,"战功牌",10,1 }
	},
	reward_other = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",1,0,"宝石福袋",2,0 }
	}
}


--活动时奖励
--表格前两位{最大值，最小值}  数据类型 - 数字/等级(level)相关的字符串/胜利场数(wins)相关字符串
--MoneyType 货币类型  MoneyVal 货币数量
--Contribution 帮贡
--GuildGold 帮派资金
--Item 物品
TianXiaHuiWuConfig.Reward = {
	--战斗一场的奖励
	winner_reward = {
		Exp = 0,
		MoneyType = 5,
		MoneyVal = {"level * 50 + wins * 10 + 1000", "level * 70 + wins * 10 + 1000"},
		Contribution = 0, 
		GuildGold = 0,
		Item = {"战功牌",1,1},
	},
	loser_reward = {
		Exp = 0,
		MoneyType = 5,
		MoneyVal = {"level * 25 + wins * 5 + 500", "level * 35 + wins * 5 + 500"},
		Contribution = 0, 
		GuildGold = 0,
		Item = {"战功牌",1,1},
	},

	--战斗场数奖励和胜场数奖励 命名规则reward_index
	--typ 礼包类型 fight-战斗场数礼包/win-胜场数礼包  num 场数
	reward_1 = {
		typ = "fight",
		num = 1,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",5,1, "阵法书残卷",2,0},
	},
	reward_2 = {
		typ = "fight",
		num = 5,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",5,1, "阵法书残卷",2,0 ,"宝石福袋",1,0 },
	},
	reward_3 = {
		typ = "win",
		num = 5,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1 ,"宝石福袋",1,0 ,"特技卷轴礼盒2",1,0},
	},
	reward_4 = {
		typ = "fight",
		num = 10,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",8,1 ,"阵法书残卷",5,0 ,"宝石福袋",3,0 },
	},
	reward_5 = {
		typ = "win",
		num = 10,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1 ,"宝石福袋",3,0 ,"特效卷轴礼盒3",1,0},
	},
	reward_6 = {
		typ = "fight",
		num = 15,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",12,1 ,"阵法书残卷",10,0 ,"高级宝石福袋",1 ,0},
	},
	reward_7 = {
		typ = "win",
		num = 15,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1,"高级宝石福袋",1,0 ,"特技卷轴礼盒3",1,0 ,"宝宝吞噬宠物",1,0,"神兽虎碎片",1,0 },
	},
}