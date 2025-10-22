--无尽的试炼配置
ShiLianConfig = {}

ShiLianConfig.ShowItem = "61024,61025,20169,61020,61002"

-- 开始试炼的固定NPC 
ShiLianConfig.StartNPC = "切磋-女儿国武将"

--tips
ShiLianConfig.Tips = [[
1.小心应对各路妖怪。
2.获得额外技能，助你强壮百倍。
3.无尽的试炼中获得的奖励，将在完成试炼后通过邮件发放。
4.保护好随行包裹中的乾坤袋。
5.每日可挑战一次无尽的试炼。
6.首次通关任一难度并开启下一难度时，额外获得一次挑战机会。
]]

-- 试炼中怪物的等级设置 用等级影响怪物难度
ShiLianConfig.MonsterLevelConfig = "math.floor(Difficulty * 23 + RoundNum * Difficulty / 3 + 5)"

-- 活动刷新时间 1表示每天可以打一次
ShiLianConfig.RefreshTimeDay = 1

--货币配置
ShiLianConfig.MoneyConfig = {
	--["Icon"] = 1900910120,
	["Name"] = "残火石",
	--点击后显示详情
	["Info"] = "妖怪们都爱这蕴藏三昧真火点点余温的残火石",
}

--刷新事件选项消耗 -消耗货币 配置可以与事件波数RoundNum相关 与难度Difficulty相关
ShiLianConfig.RefreshConsume = {
	["Consume_1"] = {
		["MoneyType"] = 5,
		["MoneyVal"] = 0,--客户端显示免费
	},
	["Consume_2"] = {
		["MoneyType"] = 5,
		["MoneyVal"] = "RoundNum * 10000 * Difficulty",
	},
	["Consume_3"] = {
		["MoneyType"] = 5,
		["MoneyVal"] = "RoundNum * 15000 * Difficulty",
	}, 
	["Consume_4"] = {
		["MoneyType"] = 1,
		["MoneyVal"] = "RoundNum * 30 * Difficulty",
	},
	["Consume_5"] = {
		["MoneyType"] = 1,
		["MoneyVal"] = "100 + RoundNum * 40 * Difficulty",
	},
}

-- 失败后 获得经验和货币的比例（万分比）
ShiLianConfig.FailRewardRatio = "RoundNum / 25 * 10000"

--结算界面相关  -- Time/Monster 配置不存在 或 等于0表示 不显示改选项， Info在逻辑中硬写的
ShiLianConfig.EndConfig = {
	["胜利"] = {
		["Title"] = "恭喜通关",
		["Msg"] = "无尽的试炼不过如此，红毛小儿已被吾斩于马下！少侠请再接再厉，明日可再次挑战无尽的试炼。",
		-- 本次无尽的试炼共耗时XXX，同难度下，你的最好成绩是XXXX # 已刷新同难度下最好成绩！ #请再接再厉
		["Time"] = {--时间结算界面
			["Name"] = "试炼时长",
			["Grade"] = 5,
			["Icon"] = 1900816380,
		},
		-- 恭喜您通过了本次无尽的试炼，奖励已通过邮件发放。   ##   非常遗憾，您未通过本次无尽的试炼，乾坤袋在战斗失败时略有破损，遗失部分袋内奖励，其他奖励已通过邮件发放。
		["Reward"] = {--奖励结算界面
			["Name"] = "试炼奖励",
			["Grade"] = 5,
			["Icon"] = 1900013710,	
		},
		-- 本次试炼，您遭遇了怪物XXXX，最终败于XXX之手，望您再接再厉，下次一定行！##  您遭遇了怪物XXXX，将此等宵小皆战于马下，威武非凡，所向披靡
		["Monster"] = {--怪物结算界面
			["Name"] = "击败怪物",
			["Grade"] = 5,
			["Icon"] = 1900816830,	
		},
	},
	["失败"] = {
		["Title"] = "遗憾离场",
		["Msg"] = "此地果然险恶至极！少侠请重拾信心，明日可再次挑战无尽的试炼。",
		["Time"] = 0,
		["Reward"] = {--奖励结算界面
			["Name"] = "试炼奖励",
			["Grade"] = 4,
			["Icon"] = 1900013700,	
		},
		["Monster"] = {--怪物结算界面
			["Name"] = "被怪物击败",
			["Grade"] = 4,
			["Icon"] = 1900817150,
		},
	},
}


--完整奖励配置
-- ["Reward"] = {
	-- ["Exp"] = "",
	-- ["PetExp"] = "",
	-- ["MoneyType"] = 5,
	-- ["MoneyVal"] = "",
	-- ["Item"] = {},
	-- ["Juju"] = "2", -- 获得护身符 JujuKey
	-- ["RandItemList"]={
		-- [1] = {
			-- ["RandTime"] = 1,
			-- ["ItemRand"] = {
				-- {ItemKey = "义之金叶神", Num = 1, Bind = 0, Rand = 10000},
				-- {ItemKey = "仁之木叶神", Num = 1, Bind = 0, Rand = 10000},
				-- {ItemKey = "信之土叶神", Num = 1, Bind = 0, Rand = 10000},
				-- {JujuKey = "2", Rand = 10000},--获得护身符
			-- },
		-- },
	-- },
	-- ["ShiLianItem"] = {},--XXXXXXXXXXXX
	-- ["ShiLianMoney"] = 100,
-- },
--完整buff配置
-- ["Buff"] = {
	-- ["MainMonster"] = {50120}, --主怪
	-- ["RandomMonster"] = {50120,2}, --随机2个怪物
	-- ["AllMonster"] = {50120},--所有怪物
	-- ["ServantMonster"] = {50120}, --除了主怪的其他怪物
	
	-- ["MainPlayer"] = {50120}, -- 1号位玩家 队长
	-- ["AllFriend"] = {50120},--所有友方
	-- ["RandomFriend"] = {50120,2},--随机2个友方
	
	-- ["AllPet"] = {50120},--所有宠物
	-- ["AllGuard"] = {50120},--所有侍从
-- },

ShiLianConfig.DifficultyList = {
	["Difficulty_1"] = {--难1
		["Name"] = "初入西游",
		["Grade"] = 1,
		["Icon"] = 1900100310,
		["Info"] = "第一次试炼，来初入西游难度找找手感吧！",
		
	}, 
	["Difficulty_2"] = {--难2
		["Name"] = "二探火云",
		["Grade"] = 2,
		["Icon"] = 1900100320,
		["Info"] = "二探火云，试炼让人成长。",
		
	}, 
	["Difficulty_3"] = {--难3
		["Name"] = "三昧真火",
		["Grade"] = 3,
		["Icon"] = 1900100330,
		["Info"] = "三昧真火，试炼路上不过是些许荆棘。",
		
	}, 
	["Difficulty_4"] = {--难4
		["Name"] = "四海龙王",
		["Grade"] = 4,
		["Icon"] = 1900100340,
		["Info"] = "四海龙王，试炼中的一切已经轻车熟路，整理行装，即刻出发。",
		
	}, 
	["Difficulty_5"] = {--难5
		["Name"] = "功成名就",
		["Grade"] = 5,
		["Icon"] = 1900100350,
		["Info"] = "功成名就，完全掌握无尽的试炼。",
		
	}, 
	--[6] = "出入平安", --难6
}


-- 按钮类型 Button --1 刷新 --2 购买 --3 选择 --4 路过 --5 战斗 --6 确认

--进度表
ShiLianConfig.RoundList = {
	["Round_0"] = { -- Round_0 难度选择回合，会特殊处理
		["ShowStep"] = 0, --是否在进度中显示
		["IsGetRoundReward"] = 0, --本回合结束时是否获得回合奖励
		["Title"] = "选择难度",
		["Msg"] = "开始试炼前，请选择难度。",
	},
	
	["Round_1"] = {
		["ShowStep"] = 1, --是否在进度中显示
		["IsGetRoundReward"] = 0, --本回合结束时是否获得回合奖励
		["Title"] = "选择护身符",
		["Msg"] = "修行时积攒了这些护身符，此次降妖，路途艰险，带上一件吧！",
		["EventNum"] = 3,-- #EventList <= EventNum时 全部显示  否则随机EventNum个显示
		["EventList"] = { --没有Rand字段 或Rand = -1 表示 该选项固定显示 占一个EventNum数量
			{Type = "JujuList", Key = "无名小刀_1", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "家传宝典_1", Button = {"刷新","选择"}, Rand = 100},
			--{Type = "JujuList", Key = "飞鹰", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "铁护腕", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "玉佩_1", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "戒指_1", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "大块残火石_1", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "大块残火石_2", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "无尽药品_1", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "无尽药品_2", Button = {"刷新","选择"}, Rand = 100},
			{Type = "JujuList", Key = "草_1", Button = {"刷新","选择"}, Rand = 100},
		},
		
	},
	
	["Round_2"] = {
		["ShowStep"] = 1, --是否在进度中显示
		["IsGetRoundReward"] = 1, --本回合结束时是否获得回合奖励
		["Title"] = "路遇强盗",
		--["Msg"] = "这枯松涧也是个妖气横生之地。",
		["Msg"] = "光天化日，居然有强盗拦路抢劫？",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
		},
	},
	
	["Round_3"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "分岔路口",
		["Msg"] = "前方三条岔路，走哪一条好呢？",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"战斗"}, Rand = 100},
			{Type = "ExtraRoundList", Key = "宝箱分支_1", Button = {"选择"}, Rand = 100},
		},
	},
	["Round_4"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "路遇小妖",
		["Msg"] = "这枯松涧是个妖气横生之地，只要一靠近，就有不少小妖拦路。",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
		},	
	},
	
	["Round_5"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "枯松涧商店",
		["Msg"] = "荒郊野岭的，也只有这些妖商做些买卖。妖商：“要么给我残火石，要么，滚！”",
		["EventNum"] = 3,
		["EventList"] = {
			--{Type = "MonsterList", Key = "商店怪_1", Button = {"路过","战斗"}, Rand = -1},
			{Type = "BuffList", Key = "无尽药品_1", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "无尽药品_2", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "鹤顶红_1", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "全体中毒_1", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "主怪中毒_1", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "GoodsList", Key = "宝石_3", Button = {"刷新","路过","购买"}, Rand = 100},
			--{Type = "GoodsList", Key = "家传宝典_1", Button = {"刷新","路过","购买"}, Rand = 10},	
		},
	},

	-- ["Round_6"] = {
		-- ["ShowStep"] = 1,
		-- ["IsGetRoundReward"] = 0,
		-- ["Title"] = "贪财妖王",
		-- ["Msg"] = "妖王：“没有大王的通行证，谁也别想从我这儿过！不过嘛，大王可没说我不能卖通行证。”",
		-- ["EventNum"] = 2,
		-- ["EventList"] = {
			-- {Type = "MonsterList", Key = "妖王_1", Button = {"战斗"}, Rand = 100},
			-- {Type = "GoodsList", Key = "妖王过路费_1", Button = {"选择"}, Rand = 100},
		-- },
	-- },
	
	["Round_6"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "路遇小妖",
		["Msg"] = "越靠近枯松涧，小妖就越来越多。",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = -1},
		},	
	},

	["Round_7"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "乌云密布",
		["Msg"] = "天空忽然乌云密布，看起来大雨顷刻将至！",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "ExtraRoundList", Key = "躲雨_1", Button = {"选择"}, Rand = 100},
			{Type = "ExtraRoundList", Key = "不躲雨_1", Button = {"选择"}, Rand = 100},
		},
	},
	
	["Round_8"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "枯松涧商店",
		["Msg"] = "荒郊野岭的，也只有这些妖商做些买卖。妖商：“要么给我残火石，要么，滚！”",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "商店怪_1", Button = {"路过","战斗"}, Rand = -1},
			{Type = "BuffList", Key = "祈祷_1", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "GoodsList", Key = "宝石_1", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "GoodsList", Key = "宝石_2", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "GoodsList", Key = "宝石_3", Button = {"刷新","路过","购买"}, Rand = 100},	
		},
	},
	
	["Round_9"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "火云洞口",
		["Msg"] = "终于到了火云洞洞口。哟~还有妖怪出门迎接本大爷。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "Boss_1", Button = {"战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "Boss_2", Button = {"战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "Boss_3", Button = {"战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "Boss_4", Button = {"战斗"}, Rand = 100},
		},	
	},
	["Round_10"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "妖怪宝箱",
		["Msg"] = "这小妖竟然随身带着一个锦囊，不知里面藏着什么东西？",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "ExtraRoundList", Key = "打开锦囊_1", Button = {"选择"}, Rand = 100},
			{Type = "ExtraRoundList", Key = "不打开锦囊_1", Button = {"路过"}, Rand = 100},
		},	
	},
	["Round_11"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "火云洞口",
		["Msg"] = "小妖们源源不断的从火云洞中涌出，准备迎敌！",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
		},	
	},
	["Round_12"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "火云洞口",
		["Msg"] = "小妖越来越多，像是除不尽一般！",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
		},	
	},
	
	["Round_13"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "贪财妖王",
		["Msg"] = "妖王：“没有大王的通行证，谁也别想从我这儿过！不过嘛，大王可没说我不能卖通行证。”",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "MonsterList", Key = "妖王_1", Button = {"战斗"}, Rand = 100},
			{Type = "GoodsList", Key = "妖王过路费_1", Button = {"选择"}, Rand = 100},
		},
	},
	
	["Round_14"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "休整",
		["Msg"] = "暂且脱身休整吧，逛逛商城。怎么哪的妖商都摆着一副臭脸？",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "商店怪_1", Button = {"路过","战斗"}, Rand = -1},
			{Type = "BuffList", Key = "祈祷_2", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "祈祷_3", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "BuffList", Key = "祈祷_4", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "BuffList", Key = "祈祷_5", Button = {"刷新","路过","购买"}, Rand = 100},	
		},	
	},
	["Round_15"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "初遇红孩儿",
		["Msg"] = "那帮妖怪竟然阵势浩荡地追了出来，阵中有一红毛小儿，昂首挺胸好不威风。想必那便是火云洞洞主红孩儿！",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "Boss_5", Button = {"战斗"}, Rand = 100},
		},	
	},
	["Round_16"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "逃离战场",
		["Msg"] = "好不容易从那三昧真火中逃了出来，得好好想想计策。不过，先把这些紧追不舍的小妖解决吧。",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
		},	
	},
	["Round_17"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "迷失的灵魂",
		["Msg"] = "一个灵魂在路上飘荡，像是迷了路，要不要帮帮他呢？",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "ExtraRoundList", Key = "帮助鬼魂_1", Button = {"选择"}, Rand = 100},
			{Type = "ExtraRoundList", Key = "不帮助鬼魂_1", Button = {"路过"}, Rand = 100},
		},	
	},
	["Round_18"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "寻找对策",
		["Msg"] = "五行之中，水克火，东海龙王一定有办法对付那三昧真火的。突出重围，前往东海！",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
			{Type = "MonsterList", Key = "随机怪物", Button = {"刷新","战斗"}, Rand = 100},
		},	
	},
	["Round_19"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "龙王的馈赠",
		["Msg"] = "东海龙王果真是财大气粗，这几件宝物竟然让人随便选！",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "BuffList", Key = "祈祷_6", Button = {"选择"}, Rand = 100},	
			{Type = "BuffList", Key = "祈祷_7", Button = {"选择"}, Rand = 100},	
			{Type = "BuffList", Key = "持续_6", Button = {"选择"}, Rand = 100},	
			{Type = "BuffList", Key = "天赋_1", Button = {"选择"}, Rand = 100},	
			{Type = "BuffList", Key = "天赋_2", Button = {"选择"}, Rand = 100},	
			{Type = "BuffList", Key = "天赋_3", Button = {"选择"}, Rand = 100},	
		},	
	},
	["Round_20"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "再战红孩儿",
		["Msg"] = "红毛小儿，何不再战三百回合！",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "Boss_6", Button = {"战斗"}, Rand = 100},
		},	
	},
	["Round_21"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "暂且撤退",
		["Msg"] = "大意了，没想那三昧真火居然不怕凡水！先休整一番吧。",
		["EventNum"] = 2,
		["EventList"] = {
			{Type = "ExtraRoundList", Key = "点火_1", Button = {"选择"}, Rand = 100},
			{Type = "ExtraRoundList", Key = "不点火_1", Button = {"选择"}, Rand = 100},
		},	
	},
	["Round_22"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "寻求帮助",
		["Msg"] = "想要扑灭这三昧真火，看来只能去南海请观音菩萨了。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "GoodsList", Key = "路遇观音_1", Button = {"确认"}, Rand = 100},	
		},	
	},
	["Round_23"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 1,
		["Title"] = "假冒观音",
		["Msg"] = "大圣的火眼金睛一眼就看出，这观音是红孩儿假冒的！",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "随机怪物", Button = {"战斗"}, Rand = 100},
		},	
	},
	["Round_24"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "等候大圣",
		["Msg"] = "看来只能靠大圣去请观音菩萨了！我们在妖商处等候，妖商的脸还是那么丑。",
		["EventNum"] = 3,
		["EventList"] = {
			{Type = "BuffList", Key = "天赋_4", Button = {"刷新","路过","购买"}, Rand = 100},
			{Type = "BuffList", Key = "天赋_5", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "BuffList", Key = "天赋_6", Button = {"刷新","路过","购买"}, Rand = 100},	
			{Type = "BuffList", Key = "天赋_7", Button = {"刷新","路过","购买"}, Rand = 100},	
		},	
	},
	["Round_25"] = {
		["ShowStep"] = 1,
		["IsGetRoundReward"] = 0,
		["Title"] = "三战红孩儿",
		["Msg"] = "红孩儿主动出击，来势汹汹。他是怎么找到我的，难道是这妖商？",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "Boss_7", Button = {"战斗"}, Rand = 100},
		},	
	},
}

--分支表 --作为额外事件使用
ShiLianConfig.ExtraRoundList = {
	["宝箱分支_1"] = {
		["Name"] = "轻奢宝箱",
		["Grade"] = 3,
		["Icon"] = 1801208170,
		["Info"] = "一个宝箱躺在路中央，不知是不是陷阱。",
		
		["Title"] = "打开宝箱",
		["Msg"] = "终于还是抵挡不住宝箱的诱惑，缓缓将其打开。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "宝箱怪_1", Button = {"战斗"}, Rand = 100},
			{Type = "GoodsList", Key = "打开宝箱_1", Button = {"确认"}, Rand = 100},
		},
	},
	
	["躲雨_1"] = {
		["Name"] = "躲雨",
		["Grade"] = 1,
		["Icon"] = 1900802060,
		["Info"] = "要下雨了，躲躲吧。",
		
		["Title"] = "躲雨",
		["Msg"] = "路边树下躲雨。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "BuffList", Key = "躲雨buff_1", Button = {"确认"}, Rand = 100},
			{Type = "BuffList", Key = "躲雨buff_2", Button = {"确认"}, Rand = 100},
		},
	},
	["不躲雨_1"] = {
		["Name"] = "不躲雨",
		["Grade"] = 1,
		["Icon"] = 1900816010,
		["Info"] = "一点点小雨，有何可怕，继续前行！",
		
		["Title"] = "不躲雨",
		["Msg"] = "继续前行！",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "MonsterList", Key = "不躲雨怪_1", Button = {"战斗"}, Rand = 100},
			{Type = "BuffList", Key = "不躲雨Buff_1", Button = {"确认"}, Rand = 100},
		},
	},
	["打开锦囊_1"] = {
		["Name"] = "锦囊",
		["Grade"] = 1,
		["Icon"] = 1900015300,
		["Info"] = "打开它！里面说不定是些随身携带的宝物。",
		
		["Title"] = "锦囊",
		["Msg"] = "打开锦囊！",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "BuffList", Key = "打开锦囊Buff_1", Button = {"确认"}, Rand = 100},
			{Type = "BuffList", Key = "打开锦囊Buff_2", Button = {"确认"}, Rand = 100},
			{Type = "GoodsList", Key = "打开锦囊Goods_3", Button = {"确认"}, Rand = 100},
		},
	},
	["不打开锦囊_1"] = {
		["Name"] = "不打开",
		["Grade"] = 1,
		["Icon"] = 1900015300,
		["Info"] = "不管它！妖怪的东西，都很危险。",
		
		["Title"] = "路过",
		["Msg"] = "不知道东西不要碰！",
		["EventNum"] = 1,
		["EventList"] = {
			
		},
	},	
	["帮助鬼魂_1"] = {
		["Name"] = "帮助鬼魂",
		["Grade"] = 1,
		["Icon"] = 1900814330,
		["Info"] = "助人为乐是美好品德。",
		
		["Title"] = "帮助鬼魂",
		["Msg"] = "尽自己所能帮助迷失的鬼魂找到了通往转生的路。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "BuffList", Key = "帮助鬼魂Buff_1", Button = {"确认"}, Rand = 100},
			{Type = "GoodsList", Key = "帮助鬼魂Goods_2", Button = {"确认"}, Rand = 100},
			{Type = "GoodsList", Key = "帮助鬼魂Goods_3", Button = {"确认"}, Rand = 100},
		},
	},
	["不帮助鬼魂_1"] = {
		["Name"] = "不帮助鬼魂",
		["Grade"] = 1,
		["Icon"] = 1900814330,
		["Info"] = "不是你干的，你为什么要帮？",
		
		["Title"] = "不帮助鬼魂",
		["Msg"] = "不帮助鬼魂！",
		["EventNum"] = 1,
		["EventList"] = {
		},
	},	
	["点火_1"] = {
		["Name"] = "营火",
		["Grade"] = 1,
		["Icon"] = 1801208110,
		["Info"] = "点起营火，好好休整。",
		
		["Title"] = "点起营火",
		["Msg"] = "火焰熊熊燃烧。",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "BuffList", Key = "点起营火Buff_1", Button = {"确认"}, Rand = 100},
			{Type = "MonsterList", Key = "小怪_1", Button = {"战斗"}, Rand = 100},
		},
	},
	["不点火_1"] = {
		["Name"] = "不点火",
		["Grade"] = 1,
		["Icon"] = 1801208100,
		["Info"] = "这荒郊野岭的，点起火来，岂不是会引得豺狼虎豹。",
		
		["Title"] = "不点火",
		["Msg"] = "没有休整好，身心俱疲",
		["EventNum"] = 1,
		["EventList"] = {
			{Type = "BuffList", Key = "不点营火Buff_1", Button = {"确认"}, Rand = 100},
		},
	},
}


--玩家初始拥有护身符池
ShiLianConfig.JujuInitial = {"无名小刀_1","铁护腕","玉佩_1","大块残火石_1","大块残火石_2","戒指_1","草_1"}
--护身符表 第一回合用 --玩家在活动中选择新的护身符，将放入玩家的护身符池
ShiLianConfig.JujuList = {
	["无名小刀_1"] = {
		["Name"] = "无名小刀",
		["Grade"] = 1,
		["Icon"] = 1900290080,
		["Info"] = "临行前村长说：“孩子啊，这是我们全村最锋利的刀了！”<color=#FF0000FF>自身攻击 + 5%</color>",
		["BuffTrigger"] = 1, -- Buff触发回合 默认第一回合触发 -1表示每个回合触发
		["Buff"] = {
			-- ["MainMonster"] = {50120},
			-- ["RandomMonster"] = {50120,2}, --随机2个
			-- --["AllMonster"] = {50120},
			-- ["ServantMonster"] = {50120}, --除了主怪
			
			["MainPlayer"] = {12050}, -- 1号位玩家 队长
			-- --["AllFriend"] = {50120},
			-- ["RandomFriend"] = {{50120,50105},2},
			-- ["AllPlayer"] = {50120},
			
			-- ["AllPet"] = {50120},
			-- ["AllGuard"] = {50120},
		},		
	},
	["家传宝典"] = {
		["Name"] = "家传宝典",
		["Grade"] = 1,
		["Icon"] = 1900801460,
		["Info"] = "老祖宗传下来的宝典，兴许有点作用。<color=#FF0000FF>自身暴击 +5%</color>",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12058}, 
		},
	},
	-- ["飞鹰"] = {
		-- ["Name"] = "飞鹰",
		-- ["Grade"] = 3,
		-- ["Icon"] = 1900814110,
		-- ["Info"] = "带上宠物鹰，路上多个伴。<color=#FF0000FF>可看到隐形怪物</color>",
		-- ["BuffTrigger"] = 1,
		-- ["Buff"] = {
			-- --XXX
		-- },		
	-- },
	["铁护腕"] = {
		["Name"] = "铁护腕",
		["Grade"] = 2,
		["Icon"] = 1900110490,
		["Info"] = "村口萧铁匠制作，新鲜出炉的护腕。<color=#FF0000FF>自身物防 +10%</color>",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12051}, 
		},		
	},
	["玉佩_1"] = {
		["Name"] = "玉佩",
		["Grade"] = 2,
		["Icon"] = 1900110620,
		["Info"] = "玉佩本是一对，分一凤一龙，初恋情人相赠。<color=#FF0000FF>自身法防 +10%</color>",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12052}, 
		},		
	},

	["戒指_1"] = {
		["Name"] = "古老的戒指",
		["Grade"] = 3,
		["Icon"] = 1900106010,
		["Info"] = "从村里饰品店买的戒指。<color=#FF0000FF>自身消耗魔法值会恢复等量的血量。</color>",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {10152}, 
		},		
	},
	["大块残火石_1"] = {
		["Name"] = "大块残火石",
		["Grade"] = 2,
		["Icon"] = 1900910140,
		["Info"] = "听说这东西在火云洞可是硬通货！<color=#FF0000FF>初始货币 +500。</color>",
		["Reward"] = {
			["ShiLianMoney"] = 500,
		},
		["BuffTrigger"] = 1,
		["Buff"] = {
		},
	},
	["大块残火石_2"] = {
		["Name"] = "诅咒的残火石",
		["Grade"] = 2,
		["Icon"] = 1900910440,
		["Info"] = "听说残火石在火云洞可是硬通货！这块有点绿，不过应该也没事吧？<color=#FF0000FF>初始货币 +750，回合开始时使随机3个友方中毒3回合。</color>",
		["Reward"] = {
			["ShiLianMoney"] = 750,
		},
		["BuffTrigger"] = 1,
		["Buff"] = {
			["RandomFriend"] = {{12303},3},
		},
	},

	["草_1"] = {
		["Name"] = "路边小草",
		["Grade"] = 3,
		["Icon"] = 1900120250,
		["Info"] = "藏在草里，怪物就看不见我了吧？<color=#FF0000FF>战斗开始随机使1个友方隐身5回合。</color>",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["RandomFriend"] = {{10126},1},
		},		
	},
	
}

-- 战斗buff表 作为技能事件选项 
ShiLianConfig.BuffList = {
	["天赋_1"] = {
		["Name"] = "侍从·狂暴嗜血",
		["Grade"] = 3,
		["Icon"] = 1900816620,
		["Info"] = "侍从暴击率+5%，暴击时下回合提升攻击。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {11303},
		},		
	},	
	["天赋_2"] = {
		["Name"] = "侍从·闪避反制",
		["Grade"] = 3,
		["Icon"] = 1900815760,
		["Info"] = "侍从闪避率提高10%，闪避后提高50%暴击2回合。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {10139},
		},		
	},
	["天赋_3"] = {
		["Name"] = "侍从·龙潜于渊",
		["Grade"] = 3,
		["Icon"] = 1900815870,
		["Info"] = "侍从受到伤害时法攻提高20%，持续2回合。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {10158},
		},		
	},
	["天赋_4"] = {
		["Name"] = "侍从·不灭幻影",
		["Grade"] = 3,
		["Icon"] = 1900816730,
		["Info"] = "侍从每次受到攻击时都加10%闪避，持续1回合。",
		["Price"] = "80 + 22 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {11325},
		},		
	},
	["天赋_5"] = {
		["Name"] = "侍从·不灭斗神",
		["Grade"] = 3,
		["Icon"] = 1900816740,
		["Info"] = "侍从受到伤害减少5%，受到攻击时有概率加攻击，持续2回合。",
		["Price"] = "80 + 22 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {11320},
		},		
	},
	["天赋_6"] = {
		["Name"] = "侍从·神鸟本相",
		["Grade"] = 3,
		["Icon"] = 1900816910,
		["Info"] = "侍从闪避率+5%，闪避时会恢复血量。",
		["Price"] = "80 + 22 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {11316},
		},		
	},
	["天赋_7"] = {
		["Name"] = "侍从·狂暴吸血",
		["Grade"] = 3,
		["Icon"] = 1900816590,
		["Info"] = "侍从暴击时会恢复血量。",
		["Price"] = "80 + 22 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllGuard"] = {11301},
		},		
	},
	
	["无尽药品_1"] = {
		["Name"] = "无尽小绿瓶",
		["Grade"] = 3,
		["Icon"] = 1900120090,
		["Info"] = "真奇怪，这瓶子里的药水怎么倒不完？<color=#FF0000FF>每回合恢复3%自身和侍从血量</color>",
		["Price"] = "80 + 18 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {10114},
			["AllGuard"] = {10114},
		},		
	},
	["无尽药品_2"] = {
		["Name"] = "无尽小黄瓶",
		["Grade"] = 3,
		["Icon"] = 1900120080,
		["Info"] = "真奇怪，这瓶子里的药水怎么倒不完？<color=#FF0000FF>每回合恢复3%自身和侍从魔法值</color>",
		["Price"] = "80 + 18 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {10111},
			["AllGuard"] = {10111},
		},		
	},
	
	["鹤顶红_1"] = {
		["Name"] = "一品鹤顶红",
		["Grade"] = 3,
		["Icon"] = 1900120200,
		["Info"] = "对人下毒，难免就脏了自己的手。回合开始对4个随机敌人施加剧毒，但对1个随机友方造成伤害。",
		["Price"] = "80 + 18 * RoundNum",
		["BuffTrigger"] = 1, -- Buff触发回合 默认第一回合触发
		["Buff"] = {
			-- --["MainMonster"] = {10142},
			["RandomMonster"] = {{12305},4},
			-- ["AllMonster"] = {10142},
			-- --["ServantMonster"] = {10142}, --除了主怪
			
			-- --["MainPlayer"] = {10142}, -- 1号位玩家 队长
			-- ["AllFriend"] = {10142},
			["RandomFriend"] = {{50154},1},
			-- -- ["AllPlayer"] = {10142},
			
			-- -- ["AllPet"] = {10142},
			-- -- ["AllGuard"] = {10142},
		},
	},
	["恢复光环_1"] = {
		["Name"] = "恢复光环",
		["Grade"] = 2,
		["Icon"] = 1900814410,
		["Info"] = "每个回合结束时，恢复己方全体单位5%的血量。",
		["Price"] = "80 + 18 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
		},
	},
	
	["加免伤_1"] = {
		["Name"] = "强壮起来",
		["Grade"] = 4,
		["Icon"] = 1900814240,
		["Info"] = "增加自身4%免伤。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12048},
		},		
	},
	
	["躲雨buff_1"] = {
		["Name"] = "雨过天晴",
		["Grade"] = 2,
		["Icon"] = 1900815060,
		["Info"] = "雨过天晴，神清气爽。自身增伤5%。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12027},
		},
	},
	
	["躲雨buff_2"] = {
		["Name"] = "不幸被劈",
		["Grade"] = 2,
		["Icon"] = 1900814480,
		["Info"] = "大树底下被人劈，自身回合开始受到伤害。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {50154},
		},
	},	
	
	["不躲雨Buff_1"] = {
		["Name"] = "雨中修行",
		["Grade"] = 2,
		["Icon"] = 1900802070,
		["Info"] = "雨中修行，所获颇多，自身物防法防加4%。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12035, 12036},
		},
	},
	
	["全体中毒_1"] = {
		["Name"] = "欺软怕硬",
		["Grade"] = 2,
		["Icon"] = 1900814460,
		["Info"] = "回合开始对除主怪外所有怪物施加中毒效果。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["ServantMonster"] = {12303},
		},
	},
	["主怪中毒_1"] = {
		["Name"] = "“欺硬怕软”",
		["Grade"] = 2,
		["Icon"] = 1900814460,
		["Info"] = "回合开始对主怪施加剧毒效果。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainMonster"] = {12305},
		},
	},
	["祈祷_1"] = {
		["Name"] = "祈祷·急速",
		["Grade"] = 4,
		["Icon"] = 1900817030,
		["Info"] = "第4回合开始，全体友方速度提升5%。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 4,
		["Buff"] = {
			["AllFriend"] = {12061},
		},
	},
	["祈祷_2"] = {
		["Name"] = "祈祷·终极",
		["Grade"] = 5,
		["Icon"] = 1900816940,
		["Info"] = "第6回合开始，全体友方暴击提升40点，攻击提升4%，物理防御提升8%，法术防御提升8%，但敌方全体封抗提升50点。",
		["Price"] = "130 + 28 * RoundNum",
		["BuffTrigger"] = 6,
		["Buff"] = {
			["AllMonster"] = {12057},
			["AllFriend"] = {12042, 12034, 12035, 12036},
		},
	},
	["祈祷_3"] = {
		["Name"] = "祈祷·减伤",
		["Grade"] = 5,
		["Icon"] = 1900817040,
		["Info"] = "第5回合开始，增加全体友方伤害减免5%。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 5,
		["Buff"] = {
			["AllFriend"] = {12064},
		},
	},
	["祈祷_4"] = {
		["Name"] = "祈祷·伤害",
		["Grade"] = 5,
		["Icon"] = 1900816970,
		["Info"] = "第5回合开始，全体友方最终伤害提升7%。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 5,
		["Buff"] = {
			["AllFriend"] = {12059},
		},
	},
	["祈祷_5"] = {
		["Name"] = "祈祷·防御",
		["Grade"] = 5,
		["Icon"] = 1900817040,
		["Info"] = "第6回合开始，全体友方物理防御提升10%，法术防御提升10%。",
		["Price"] = "80 + 20 * RoundNum",
		["BuffTrigger"] = 5,
		["Buff"] = {
			["AllFriend"] = {12051, 12052},
		},
	},
	["祈祷_6"] = {
		["Name"] = "祈祷·清心",
		["Grade"] = 4,
		["Icon"] = 1900817080,
		["Info"] = "第5回合开始，全体友方封抗提升50点。",
		["Price"] = -1,
		["BuffTrigger"] = 5,
		["Buff"] = {
			["AllFriend"] = {12057},
		},
	},
	["祈祷_7"] = {
		["Name"] = "祈祷·大回复",
		["Grade"] = 4,
		["Icon"] = 1900803070,
		["Info"] = "第8回合开始，自身回满血。",
		["Price"] = -1,
		["BuffTrigger"] = 8,
		["Buff"] = {
			["MainPlayer"] = {50150},
		},
	},
	["持续_6"] = {
		["Name"] = "持续·回复",
		["Grade"] = 4,
		["Icon"] = 1900815710,
		["Info"] = "每个回合开始，随机一个友方回复当前生命值20%血量。",
		["Price"] = -1,
		["BuffTrigger"] = -1,
		["Buff"] = {
			["RandomFriend"] = {{50131},1},
		},
	},
	["打开锦囊Buff_1"] = {
		["Name"] = "黑烟",
		["Grade"] = 4,
		["Icon"] = 1900015300,
		["Info"] = "锦囊内冒出一股黑烟，宠物闻了昏昏欲睡。战斗开始时，宠物睡眠2个回合。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllPet"] = {129},
		},
	},
	["打开锦囊Buff_2"] = {
		["Name"] = "清烟",
		["Grade"] = 4,
		["Icon"] = 1900015300,
		["Info"] = "锦囊内冒出一股清烟，让人闻了神清气爽。自身速度提升2%。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12013},
		},
	},
	["帮助鬼魂Buff_1"] = {
		["Name"] = "心情舒畅",
		["Grade"] = 1,
		["Icon"] = 1900815840,
		["Info"] = "帮助他人使人心情舒畅，自身命中提升40点。",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {12012},
		},
	},
	["点起营火Buff_1"] = {
		["Name"] = "休息完毕",
		["Grade"] = 1,
		["Icon"] = 1900816980,
		["Info"] = "经过一夜的休息，感觉神清气爽。友方最大血量提升4%",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["AllFriend"] = {12001},
		},
	},
	["不点营火Buff_1"] = {
		["Name"] = "身心俱疲",
		["Grade"] = 1,
		["Icon"] = 1900816120,
		["Info"] = "辗转难眠，俩黑眼圈。战斗开始自身睡眠2个回合",
		["Price"] = -1,
		["BuffTrigger"] = 1,
		["Buff"] = {
			["MainPlayer"] = {129},
		},
	},
	
}

--怪物选项表
ShiLianConfig.MonsterList = {
	["小怪_1"] = {
		["Difficulty"] = {1,5},
		["Round"] = {1,14},
		
		["Name"] = "拦路小妖", --3aoe + 2单攻
		["Grade"] = 1,
		["Icon"] = 1900351120,
		["Info"] = "不知哪来的花花草草修炼成精。",
		["MonID"] = 4660,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_2"] = {
		["Difficulty"] = {1,5},
		["Round"] = {1,14, 16,25},
		 
		["Name"] = "山贼头领", -- 带毒
		["Grade"] = 1,
		["Icon"] = 1900351170,
		["Info"] = "路遇山贼，准备迎敌！",
		["MonID"] = 4661,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_3"] = {
		["Difficulty"] = {1,5},
		["Round"] = {1,14, 16,25},
		
		["Name"] = "猴子头领", -- 主怪连击
		["Grade"] = 1,
		["Icon"] = 1900351540,
		["Info"] = "喝醉了的妖猴，下山四处捣乱。",
		["MonID"] = 4662,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_4"] = {
		["Difficulty"] = {1,5},
		["Round"] = {1,14, 16,25},
		
		["Name"] = "冰魄剑灵", -- 控制
		["Grade"] = 1,
		["Icon"] = 1900351370,
		["Info"] = "很久很久以前，一位剑客死在了雪山深处。",
		["MonID"] = 4663,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_5"] = {
		["Difficulty"] = {3,5},
		["Round"] = {11,14, 16,25},
		
		["Name"] = "巨雪领主", -- 带毒 控制
		["Grade"] = 1,
		["Icon"] = 1900351330,
		["Info"] = "从雪山深处而来。",
		["MonID"] = 4664,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_6"] = {
		["Difficulty"] = {4,5},
		["Round"] = {11,14, 16,25},
		
		["Name"] = "龙王", -- 4aoe 1连击小怪
		["Grade"] = 1,
		["Icon"] = 1900352580,
		["Info"] = "不知是哪处小水洼的龙王，竟然与妖怪同流合污！",
		["MonID"] = 4665,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},
	["小怪_7"] = {
		["Difficulty"] = {4,5},
		["Round"] = {11,14, 16,25},
		
		["Name"] = "千年女妖", -- 主怪控制
		["Grade"] = 1,
		["Icon"] = 1900353200,
		["Info"] = "不过是年长一点的野鬼罢了！",
		["MonID"] = 4666,
		["Reward"] = {
			["ShiLianMoney"] = "25 + RoundNum * 8",
		},
	},

	["Boss_1"] = {
		-- ["Difficulty"] = {1,4},
		-- ["Round"] = {10,10},
		
		["Name"] = "火云洞先锋",
		["Grade"] = 4,
		["Icon"] = 1900351200,
		["Info"] = "一只身材雄壮的牛头妖怪向你走来，气势汹汹，像是妖怪中的精英。",
		["MonID"] = 4801,
		["Reward"] = {
			["Exp"] = "5000  + 2000 * (Difficulty - 1)",
			["PetExp"] = "5000 + 2000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "5000  + 2000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "2级攻击石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "2级魔攻石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "2级物抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "2级生命石", Num = 1, Bind = 0, Rand =2000},
						{ItemKey = "2级速度石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "2级封印石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "2级魔抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "2级暴击石", Num = 1, Bind = 0, Rand =1000},
					},
				},
			},
			["ShiLianMoney"] = "40 + RoundNum * 8",
		},
	},
	["Boss_2"] = {
		-- ["Difficulty"] = {1,4},
		-- ["Round"] = {10,10},
		
		["Name"] = "蛊毒巫师",
		["Grade"] = 4,
		["Icon"] = 1900353190,
		["Info"] = "一团绿烟向你袭来，光是闻到就让人头晕目眩，定眼一看，烟中有一巫师。",
		["MonID"] = 4802,
		["Reward"] = {
			["Exp"] = "5000  + 2000 * (Difficulty - 1)",
			["PetExp"] = "5000 + 2000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "5000  + 2000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "加封率小1(特效)", Num = 1, Bind = 0, Rand =650},
						{ItemKey = "加暴击小1(特效)", Num = 1, Bind = 0, Rand =650},
						{ItemKey = "加闪避小1(特效)", Num = 1, Bind = 0, Rand =650},
						{ItemKey = "加攻击小1(特效)", Num = 1, Bind = 0, Rand =650},
						{ItemKey = "减伤小1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加命中小1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加速度小1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加反击率小1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加攻击点1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加攻击点2(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加防御点1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加防御点2(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加血点1(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加血点2(特效)", Num = 1, Bind = 0, Rand =640},
						{ItemKey = "加封率小(特效)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加暴击小(特效)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加攻击小(特效)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "减伤小(特效)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加闪避小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加命中小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加速度小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加反击率小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "力量加攻小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "法力加攻小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "溅射小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "神佑小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加血小(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加攻击点3(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加防御点3(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加血点3(特效)", Num = 1, Bind = 0, Rand =55},
						{ItemKey = "加血中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加闪避中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加封率中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加暴击中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加攻击中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "减伤中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加命中中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加速度中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "加反击率中(特效)", Num = 1, Bind = 0, Rand =8},
						{ItemKey = "力量加攻中(特效)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "法力加攻中(特效)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "神佑中(特效)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加逃跑率(特效)", Num = 1, Bind = 0, Rand =7},
					},
				},
			},
			["ShiLianMoney"] = "40 + RoundNum * 8",
		},
	},
	["Boss_3"] = {
		-- ["Difficulty"] = {2,5},
		-- ["Round"] = {10,10},
		
		["Name"] = "熔火石灵",
		["Grade"] = 4,
		["Icon"] = 1900353070,
		["Info"] = "野生的地火成精？真是少见，可惜没有走上正途。",
		["MonID"] = 4803,
		["Reward"] = {
			["Exp"] = "5000  + 2000 * (Difficulty - 1)",
			["PetExp"] = "5000 + 2000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "5000  + 2000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
							{ItemKey = "必杀秘籍", Num = 1, Bind = 0, Rand =565},
							{ItemKey = "连击秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "吸血秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "蛮力秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "突击秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "反弹秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "复仇秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "飞行秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "坚韧秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "法伤秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "闪避秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "凝神秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "冥思秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "再生秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "金睛秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "迅捷秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "神佑秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "命中秘籍", Num = 1, Bind = 0, Rand =555},
					},
				},
			},
			["ShiLianMoney"] = "40 + RoundNum * 8",
		},
	},
	["Boss_4"] = {
		-- ["Difficulty"] = {3,6},
		-- ["Round"] = {10,10},
		
		["Name"] = "祈祷巫师",
		["Grade"] = 4,
		["Icon"] = 1900353190,
		["Info"] = "这恐怕就是元婴大王座下首席祷告巫师，听说万物皆能为它所用。",
		["MonID"] = 4804,
		["Reward"] = {
			["Exp"] = "5000  + 2000 * (Difficulty - 1)",
			["PetExp"] = "5000 + 2000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "5000  + 2000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "加血单1(特技)", Num = 1, Bind = 0, Rand =4500},
						{ItemKey = "加蓝单1(特技)", Num = 1, Bind = 0, Rand =4500},
						{ItemKey = "加血单2(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加蓝已1(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "减血单(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "减蓝单(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "减血蓝单1(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "减血蓝单2(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "复活单1(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "解封单(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加伤单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加防单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "降物攻单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "降物防单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "降速度单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加速度单10h(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "物攻减魔(特技)", Num = 1, Bind = 0, Rand =60},
						{ItemKey = "加血单3(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加血已1(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加蓝已2(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "减怒单(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "大量血(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "解封加血单(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "免封单5h(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加法防单3h(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "降速度全10h(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加速度全10h(特技)", Num = 1, Bind = 0, Rand =7},
						{ItemKey = "加速度已3h(特技)", Num = 1, Bind = 0, Rand =6},
						{ItemKey = "加闪避己3h(特技)", Num = 1, Bind = 0, Rand =6},
						{ItemKey = "吸血(特技)", Num = 1, Bind = 0, Rand =6},
						{ItemKey = "吸魔(特技)", Num = 1, Bind = 0, Rand =6},
						{ItemKey = "高攻重伤(特技)", Num = 1, Bind = 0, Rand =6},
					},
				},
			},
			["ShiLianMoney"] = "40 + RoundNum * 8",
		},
	},	
	["Boss_5"] = {
		["Name"] = "红孩儿",
		["Grade"] = 4,
		["Icon"] = 1900353100,
		["Info"] = "这孩儿手持一杆丈八长的火尖枪，也没什么盔甲，只在腰间束一条锦绣战裙，赤着脚。",
		["MonID"] = 4805,
		["Reward"] = {
			["Exp"] = "7500  + 3000 * (Difficulty - 1)",
			["PetExp"] = "7500 + 3000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "7500  + 3000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "5级攻击石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "5级魔攻石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "5级物抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "5级生命石", Num = 1, Bind = 0, Rand =2000},
						{ItemKey = "5级速度石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "5级封印石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "5级魔抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "5级暴击石", Num = 1, Bind = 0, Rand =1000},
					},
				},
			},
			["ShiLianMoney"] = "50 + RoundNum * 10",
		},
	},	
	["Boss_6"] = {
		["Name"] = "红孩儿",
		["Grade"] = 4,
		["Icon"] = 1900353100,
		["Info"] = "红孩儿轮枪拽步，双手绰枪威凛冽，祥光护体出门来",
		["MonID"] = 4806,
		["Reward"] = {
			["Exp"] = "7500  + 3000 * (Difficulty - 1)",
			["PetExp"] = "7500 + 3000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "7500  + 3000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
							{ItemKey = "高级必杀秘籍", Num = 1, Bind = 0, Rand =565},
							{ItemKey = "高级连击秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级吸血秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级蛮力秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级突击秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级反弹秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级复仇秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级飞行秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级坚韧秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级法伤秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级闪避秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级凝神秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级冥思秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级再生秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级金睛秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级迅捷秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级神佑秘籍", Num = 1, Bind = 0, Rand =555},
							{ItemKey = "高级命中秘籍", Num = 1, Bind = 0, Rand =555},
					},
				},
			},
			["ShiLianMoney"] = "50 + RoundNum * 10",
		},
	},	
	["Boss_7"] = {
		["Name"] = "红孩儿",
		["Grade"] = 5,
		["Icon"] = 1900353100,
		["Info"] = "红孩儿：“你是猴子请来的救兵吗？”",
		["MonID"] = 4807,
		["Reward"] = {
			["Exp"] = "7500  + 3000 * (Difficulty - 1)",
			["PetExp"] = "7500 + 3000 * (Difficulty - 1)",
			["MoneyType"] = 5,
			["MoneyVal"] = "7500  + 3000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
							{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand =495},
							{ItemKey = "橙品宠物装备盒", Num = 1, Bind = 0, Rand =5},
					},
				},
			},
			["ShiLianMoney"] = "50 + RoundNum * 10",			
		},
	},	
	
	["宝箱怪_1"] = {
		["Name"] = "箱边小妖",
		["Grade"] = 2,
		["Icon"] = 1900351120,
		["Info"] = "遭遇埋伏，精明的小妖们守着宝箱，埋伏来往的贪财之人",
		["MonID"] = 4668,
		["Reward"] = {
			
		},
	},
	
	["商店怪_1"] = {
		["Name"] = "抢劫老板",
		["Grade"] = 5,
		["Icon"] = 1900351170,
		["Info"] = "也许，这也是一个选择？",
		["MonID"] = 4669,
		["Reward"] = {
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "藏宝图", Num = 1, Bind = 0, Rand =100},
						{ItemKey = "高级藏宝图碎片1", Num = 1, Bind = 0, Rand =20},
						{ItemKey = "高级藏宝图碎片2", Num = 1, Bind = 0, Rand =20},
						{ItemKey = "高级藏宝图碎片3", Num = 1, Bind = 0, Rand =20},
						{ItemKey = "高级藏宝图碎片4", Num = 1, Bind = 0, Rand =20},
						{ItemKey = "高级藏宝图碎片5", Num = 1, Bind = 0, Rand =20},
					},
				},
			},
		},
	},
	
	["妖王_1"] = {
		["Name"] = "贪财妖王",
		["Grade"] = 5,
		["Icon"] = 1900359870,
		["Info"] = "妖王的实力不俗，这遍地白骨恐怕就是那些不想缴纳过路费的人。<color=#FF0000FF>建议花钱消灾！</color>",
		["MonID"] = 4678,
		["Reward"] = {
			-- ["Exp"] = "7500  + 3000 * (Difficulty - 1)",
			-- ["PetExp"] = "7500 + 3000 * (Difficulty - 1)",
			-- ["MoneyType"] = 5,
			-- ["MoneyVal"] = "7500  + 3000 * (Difficulty - 1)",
			["RandItemList"]={
				[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "3级攻击石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "3级魔攻石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "3级物抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "3级生命石", Num = 1, Bind = 0, Rand =2000},
						{ItemKey = "3级速度石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "3级封印石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "3级魔抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "3级暴击石", Num = 1, Bind = 0, Rand =1000},
					},
				},
			},
			["ShiLianMoney"] = 50,
		},
	},
	
	["不躲雨怪_1"] = {
		["Name"] = "雨中小妖",
		["Grade"] = 3,
		["Icon"] = 1900353200,
		["Info"] = "竟是一只喜水的妖怪。",
		["MonID"] = 4674,
	},

}

ShiLianConfig.RoundReward = {
	["回合奖励_1"] = {
		["Difficulty"] = {1,6},
		["Round"] = {1,10},
	
		["Exp"] = "10000 + 500 * RoundNum + 1000 * (Difficulty - 1)",
		["PetExp"] = "10000 + 500 * RoundNum + 1000 * (Difficulty - 1)",
		["MoneyType"] = 5,
		["MoneyVal"] = "10000 + 500 * RoundNum + 1000 * (Difficulty - 1)",
		["Item"] = {},
		--["Juju"] = "2", -- 获得护身符
		["RandItemList"]={
			[1] = {
				["RandTime"] = 1,
				["ItemRand"] = {
					{ItemKey = "nil", Num = 1, Bind = 1, Rand = 100000},
					{ItemKey = "宝石福袋", Num = 1, Bind = 1, Rand = 1000},
					{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "R礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "低级特效礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "低级特技礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "幻身咒礼包2", Num = 1, Bind = 1, Rand = 2000},
				},                                                     
			},                                                         
		},                                                             
		["ShiLianMoney"] = "50 + 5 * RoundNum",                        
	},                                                                 
	["回合奖励_2"] = {
		["Difficulty"] = {1,6},
		["Round"] = {11,20},
	
		["Exp"] = "10000 + 1000 * RoundNum + 2000 * (Difficulty - 1)",
		["PetExp"] = "10000 + 1000 * RoundNum + 2000 * (Difficulty - 1)",
		["MoneyType"] = 5,
		["MoneyVal"] = "10000 + 1000 * RoundNum + 2000 * (Difficulty - 1)",
		["Item"] = {},
		--["Juju"] = "2", -- 获得护身符
		["RandItemList"]={
			[1] = {
				["RandTime"] = 1,
				["ItemRand"] = {
					{ItemKey = "nil", Num = 1, Bind = 1, Rand = 100000},
					{ItemKey = "宝石福袋", Num = 1, Bind = 1, Rand = 1000},
					{ItemKey = "4级宝石福袋", Num = 1, Bind = 1, Rand = 200},
					{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 1, Rand = 100},
					{ItemKey = "R礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "SR礼包", Num = 1, Bind = 1, Rand = 100},
					{ItemKey = "低级特效礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "低级特技礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "中级特效礼包", Num = 1, Bind = 1, Rand = 100},
					{ItemKey = "中级特技礼包", Num = 1, Bind = 1, Rand = 100},
					{ItemKey = "幻身咒礼包2", Num = 1, Bind = 1, Rand = 2000},
					{ItemKey = "幻身咒礼包3", Num = 1, Bind = 1, Rand = 400},
				},
			},
		},
		["ShiLianMoney"] = "50 + 6 * RoundNum",
	},
	["回合奖励_3"] = {
		["Difficulty"] = {1,6},
		["Round"] = {21,25},
	
		["Exp"] = "10000 + 1500 * RoundNum + 3000 * (Difficulty - 1)",
		["PetExp"] = "10000 + 1500 * RoundNum + 3000 * (Difficulty - 1)",
		["MoneyType"] = 5,
		["MoneyVal"] = "10000 + 1500 * RoundNum + 3000 * (Difficulty - 1)",
		["Item"] = {},
		--["Juju"] = "2", -- 获得护身符
		["RandItemList"]={
			[1] = {
				["RandTime"] = 1,
				["ItemRand"] = {
					{ItemKey = "nil", Num = 1, Bind = 1, Rand = 100000},
					{ItemKey = "宝石福袋", Num = 1, Bind = 1, Rand = 1000},
					{ItemKey = "4级宝石福袋", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "6级宝石福袋", Num = 1, Bind = 1, Rand = 100},
					{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 1, Rand = 250},
					{ItemKey = "R礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "SR礼包", Num = 1, Bind = 1, Rand = 250},
					{ItemKey = "SSR礼包", Num = 1, Bind = 1, Rand = 50},
					{ItemKey = "低级特效礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "低级特技礼包", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "中级特效礼包", Num = 1, Bind = 1, Rand = 250},
					{ItemKey = "中级特技礼包", Num = 1, Bind = 1, Rand = 250},
					{ItemKey = "幻身咒礼包2", Num = 1, Bind = 1, Rand = 2000},
					{ItemKey = "幻身咒礼包3", Num = 1, Bind = 1, Rand = 1000},
					{ItemKey = "幻身咒礼包4", Num = 1, Bind = 1, Rand = 200},
				},
			},
		},
		["ShiLianMoney"] = "50 + 7 * RoundNum",
	},
}

--奖励物品及商品表
ShiLianConfig.GoodsList = {

	["打开宝箱_1"] = {
		["Name"] = "被打开的宝箱",
		["Grade"] = 2,
		["Icon"] = 1801208170,
		["Info"] = "金银珠宝尽在其中！",
		["Price"] = -1,
		["Reward"] = {
		--	["Exp"] = 100,
		--	["PetExp"] = 100,
			["MoneyType"] = 5,
			["MoneyVal"] = 20000,
		},
	},	
	["妖王过路费_1"] = {
		["Name"] = "购买通行令",
		["Grade"] = 5,
		["Icon"] = 1900015210,
		["Info"] = "买了通行令，妖王就不会为难人了！<color=#FF0000ff>价格：500残火石</color>",
		["Price"] = 500,
		["Reward"] = {
			--["Item"] = {"耻辱证",1,1},
		},
	},


	["家传宝典_1"] = {
		["Name"] = "家传宝典",
		["Grade"] = 5,
		["Icon"] = 1900801460,
		["Info"] = "护身符·家传宝典，现在打折出售咯。<买下护身符后，下次试炼可选择>",
		["Price"] = 500,
		["Reward"] = {
			["Juju"] = "家传宝典",
		},
	},
	
	["宝石_1"] = {
		["Name"] = "宝石",
		["Grade"] = 5,
		["Icon"] = 1900910440,
		["Info"] = "妖商不知从哪拿来的亮闪闪的宝石，这么完美的宝石居然要换残火石？",
		["Price"] = 150,
		["Reward"] = {
			["Item"] = {"4级生命石",1,1},
		},
	},
	["宝石_2"] = {
		["Name"] = "宝石",
		["Grade"] = 5,
		["Icon"] = 1900910840,
		["Info"] = "妖商不知从哪拿来的亮闪闪的宝石，这么完美的宝石居然要换残火石？",
		["Price"] = 150,
		["Reward"] = {
			["Item"] = {"4级暴击石",1,1},
		},
	},
	["宝石_3"] = {
		["Name"] = "宝石",
		["Grade"] = 5,
		["Icon"] = 1900910140,
		["Info"] = "妖商不知从哪拿来的一大堆亮闪闪的宝石，不过他只会随便掏两个给你。",
		["Price"] = 200,
		["Reward"] = {
		--	["Item"] = {"4级攻击石",1,1},
			["RandItemList"]={
				[1] = {
					["RandTime"] = 2,
					["ItemRand"] = {
						{ItemKey = "4级攻击石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "4级魔攻石", Num = 1, Bind = 0, Rand =700},
						{ItemKey = "4级物抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "4级生命石", Num = 1, Bind = 0, Rand =2000},
						{ItemKey = "4级速度石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "4级封印石", Num = 1, Bind = 0, Rand =1500},
						{ItemKey = "4级魔抗石", Num = 1, Bind = 0, Rand =1300},
						{ItemKey = "4级暴击石", Num = 1, Bind = 0, Rand =1000},
					},
				},
			},
		},
	},
	["打开锦囊Goods_3"] = {
		["Name"] = "锦囊内",
		["Grade"] = 4,
		["Icon"] = 1900015300,
		["Info"] = "一份宠物小点心被小心的包着，估计是妖怪留给自己心爱的宠物的。",
		["Price"] = -1,
		["Reward"] = {
			["Item"] = {"忠诚度1",1,1},
		},
	},
	["帮助鬼魂Goods_2"] = {
		["Name"] = "帮助鬼魂",
		["Grade"] = 1,
		["Icon"] = 1900910120,
		["Info"] = "你帮助这个灵魂找到了正确的路，作为回报，他愿意将生前积蓄都给你，<color=#FF0000ff>残火石 +500。</color>",
		["Price"] = -1,
		["Reward"] = {
			["ShiLianMoney"] = 500,
		},
	},
	["帮助鬼魂Goods_3"] = {
		["Name"] = "帮助鬼魂",
		["Grade"] = 1,
		["Icon"] = 1900910120,
		["Info"] = "不好！这个鬼魂生前是个贼，<color=#FF0000ff>残火石 -200。</color>",
		["Price"] = -1,
		["Reward"] = {
			["ShiLianMoney"] = -200,
		},
	},
	["路遇观音_1"] = {
		["Name"] = "路遇观音",
		["Grade"] = 1,
		["Icon"] = 1900040500,
		["Info"] = "没想到半路就遇到了观音菩萨，菩萨真是神机妙算，先行一步赶来。",
		["Price"] = -1,
		["Reward"] = {
		
		},
	},
	
}


ShiLianConfig.MoneyIcon = {
	[1] = "1800408250",
	[2] = "1800408260",
	[4] = "1800408270",
	[5] = "1800408280",
}

function ShiLianConfig.Initialization()
	ShiLianConfig.RoundShowStep = {}
	ShiLianConfig.RoundMaxStep = 0
	local i = 0
	while ShiLianConfig.RoundList["Round_"..i] do
		local is_show_step = ShiLianConfig.RoundList["Round_"..i]["ShowStep"]
		if is_show_step and is_show_step == 1 then
			ShiLianConfig.RoundMaxStep = ShiLianConfig.RoundMaxStep + 1
			
		end
		ShiLianConfig.RoundShowStep[i] = ShiLianConfig.RoundMaxStep
		i = i + 1
	end
	ShiLianConfig.MaxRoundNum = #ShiLianConfig.RoundShowStep
	--sLuaApp:LuaErr("ShiLianConfig.RoundShowStep "..Lua_tools.serialize(ShiLianConfig.RoundShowStep))
	
	ShiLianConfig.MonsterGroupList = {}
	for k,v in pairs(ShiLianConfig.MonsterList) do
		if v["Difficulty"] and v["Round"] then
			local min_diff = v["Difficulty"][1]
			local max_diff = v["Difficulty"][2]
			for i = 1, #v["Round"], 2 do
				local min_round = v["Round"][i]
				local max_round = v["Round"][i+1]
				if min_diff and max_diff and min_round and max_round then
					for i = min_diff, max_diff do
						if not ShiLianConfig.MonsterGroupList[i] then
							ShiLianConfig.MonsterGroupList[i] = {}
						end
						for j = min_round, max_round do
							if not ShiLianConfig.MonsterGroupList[i][j] then
								ShiLianConfig.MonsterGroupList[i][j] = {}
							end
							table.insert(ShiLianConfig.MonsterGroupList[i][j], k)
						end
					end
				end
			end
		end
	end
	--sLuaApp:LuaErr("ShiLianConfig.MonsterGroupList "..Lua_tools.serialize(ShiLianConfig.MonsterGroupList))
	
	ShiLianConfig.RoundRewardList = {}
	for k,v in pairs(ShiLianConfig.RoundReward) do
		if v["Difficulty"] and v["Round"] then
			local min_diff = v["Difficulty"][1]
			local max_diff = v["Difficulty"][2]
			for i = 1, #v["Round"], 2 do
				local min_round = v["Round"][i]
				local max_round = v["Round"][i+1]
				if min_diff and max_diff and min_round and max_round then
					for i = min_diff, max_diff do
						if not ShiLianConfig.RoundRewardList[i] then
							ShiLianConfig.RoundRewardList[i] = {}
						end
						for j = min_round, max_round do
							if not ShiLianConfig.RoundRewardList[i][j] then
								ShiLianConfig.RoundRewardList[i][j] = {}
							end
							table.insert(ShiLianConfig.RoundRewardList[i][j], k)
						end
					end
				end
			end
		end
	end
	--sLuaApp:LuaErr("ShiLianConfig.RoundRewardList "..Lua_tools.serialize(ShiLianConfig.RoundRewardList))
	
	ShiLianConfig.DifficultyConfig = {}
	for i = 1,Lua_tools.tablecount(ShiLianConfig.DifficultyList) do
		if ShiLianConfig.DifficultyList["Difficulty_"..i] then
			ShiLianConfig.DifficultyConfig[i] = ShiLianConfig.DifficultyList["Difficulty_"..i]["Name"]
		end
	end
	--sLuaApp:LuaErr("ShiLianConfig.DifficultyConfig "..Lua_tools.serialize(ShiLianConfig.DifficultyConfig))
	
	ShiLianConfig.MonsterLevel = {}
	for k in pairs(ShiLianConfig.DifficultyConfig) do
		ShiLianConfig.MonsterLevel[k] = {}
		for i = 1, ShiLianConfig.MaxRoundNum do
			local str_factor = [[
				local RoundNum = ]].. i ..[[
				local Difficulty = ]].. k ..[[
			]]
			ShiLianConfig.MonsterLevel[k][i] = assert(load(str_factor .. " return " .. ShiLianConfig.MonsterLevelConfig))()
		end
	end
	--sLuaApp:LuaErr("ShiLianConfig.MonsterLevel "..Lua_tools.serialize(ShiLianConfig.MonsterLevel))
end
ShiLianConfig.Initialization()