--天下第一活动配置
TianXiaDiYiConfig = {}

TianXiaDiYiConfig.MatchTime = {3,10}	--匹配时间
TianXiaDiYiConfig.CountdownTime = 3	--倒计时时间 --客户端动画定的3s
TianXiaDiYiConfig.JoinMax = 0		--参加次数上限
TianXiaDiYiConfig.ActiveAddNum = 5	--单次获得活跃值+5
TianXiaDiYiConfig.ActiveMax = 20	--获得活跃值上限 最大+20
TianXiaDiYiConfig.rank_type = 30  	--排行榜类型
TianXiaDiYiConfig.FightTag = 10053	--战斗标签
TianXiaDiYiConfig.DefaultRating = 2000 --初始rank分

--活动界面显示的物品 字符串 物品id
TianXiaDiYiConfig.ShowItem = "61024,20797,20165,20166,20167"
--活动tips
TianXiaDiYiConfig.Tips = [[1.通过战斗可以获得战功牌等其他丰厚奖励。\n2.战斗奖励礼包及胜利奖励礼包，达到条件后\n自动领取，包裹满时将以邮件发送。\n3.排行榜前三名还可通过邮件获得额外奖励。\n4.排行榜优先以活动积分为判断，积分相同\n时，以获得积分时间先后为判断。]]

World_Best_End_Mail_Reward = {
	reward_1 = {Gold = 0, Item = {"小银币袋",5,0,"随机神兽碎片",1,0,"蚩尤变身药",1,0 ,"强化保固石",5,0 ,"高级宠物秘籍包",1,0,"战功牌",30,1}},
	reward_2 = {Gold = 0, Item = {"小银币袋",3,0,"神兽鸡碎片",1,1,"蚩尤变身药",1,0 ,"强化保固石",3,0 ,"战功牌",20,1}},
	reward_3 = {Gold = 0, Item = {"小银币袋",1,0,"神兽碎片包",1,1,"蚩尤变身药",1,0,"强化保固石",1,0 ,"战功牌",10,1}},
	reward_other = {Gold = 0, Item = {"小银币袋",1,0,"宝石福袋",1,1,"宝石福袋",3,0 }}
}

--活动结束后邮件发的奖励表单 MoneyType 货币类型 MoneyVal 货币固定值
TianXiaDiYiConfig.EndMailReward = {
	Reward_1 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",5,0,"随机神兽碎片",1,0 ,"蚩尤变身药",1,0,"强化保固石",5,0 ,"高级宠物秘籍包",1,0,"战功牌",30,1 }
	},
	Reward_2 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",3,0,"神兽鸡碎片",1,1,"蚩尤变身药",1,0 ,"强化保固石",3,0 ,"战功牌",20,1 }
	},
	Reward_3 = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",1,0,"神兽碎片包",1,1,"蚩尤变身药",1,0,"强化保固石",1,0 ,"战功牌",10,1 }
	},
	Reward_Other = {
		MoneyType = 5,
		MoneyVal = 0,
		Item = {"小银币袋",1,0,"宝石福袋",1,1,"宝石福袋",3,0}
	}
}


--活动时奖励
--表格前两位{最大值，最小值}  数据类型 - 数字/等级(level)相关的字符串/胜利场数(wins)相关字符串
--MoneyType 货币类型  MoneyVal 货币数量
--Contribution 帮贡
--GuildGold 帮派资金
--Item 物品
TianXiaDiYiConfig.Reward = {
	--战斗一场的奖励
	winner_reward = {
		Exp = 0,
		MoneyType = 5,
		MoneyVal = {"level * 50 + wins * 10 + 1000", "level * 70 + wins * 10 + 1000"},
		Contribution = 10, 
		GuildGold = 0,
		Item = {"战功牌",1,1},
	},
	loser_reward = {
		Exp = 0,
		MoneyType = 5,
		MoneyVal = {"level * 25 + wins * 5 + 500", "level * 35 + wins * 5 + 500"},
		Contribution = 5, 
		GuildGold = 0,
		Item = {"战功牌",1,1},
	},

	--战斗场数奖励和胜场数奖励 命名规则reward_index
	--Type 礼包类型 fight-战斗场数礼包/win-胜场数礼包  Num 场数
	Reward_1 = {
		Type = "fight",
		Num = 1,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",5,1 ,"宝石福袋",2,0},
	},
	Reward_2 = {
		Type = "fight",
		Num = 5,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",5,1  ,"宝石福袋",3,0 },
	},
	Reward_3 = {
		Type = "win",
		Num = 5,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1 ,"宝石福袋",3,0},
	},
	Reward_4 = {
		Type = "fight",
		Num = 10,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",8,1 ,"宝石福袋",5,0 },
	},
	Reward_5 = {
		Type = "win",
		Num = 10,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1 ,"宝石福袋",5,0 },
	},
	Reward_6 = {
		Type = "fight",
		Num = 15,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 50000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",12,1 ,"宝石福袋",10,0 },
	},
	Reward_7 = {
		Type = "win",
		Num = 15,
		Exp = 0,
		MoneyType = 5,
		MoneyVal = 100000,
		Contribution = 0,
		GuildGold = 0,
		Item = {"战功牌",10,1 ,"宝石福袋",10,0 ,"高级宠物秘籍包",1,0,"宝石福袋",1,0},
	},
}