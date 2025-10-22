--无字真经

WordlessBook = {}


WordlessBook.OverConsume = 5  --无字真经挂机活力值消耗

WordlessBook.RandomEx = 2  --道具随机倍率

WordlessBook.ShowItem = "61024,61025,30909,35502,20737"

WordlessBook.Config = {
	['Chapter_1'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 45, Name = "小动物大暴走"},
		['Mission_1'] = {ShowMonster = 15001, MonsterTeam = 15001, Info = "野外动物突然开始袭击行人，快去看看吧。", 
			Reward = {Exp = 16875, MoneyType = 5, MoneyVal = 10125, ItemList = {}},
			Over_Reward = {Exp = 1625, MoneyType = 5, MoneyVal = 750, ItemList = {}},
			Rare_Reward = {
				{Item = "小银币袋", Rand = 400},
				{Item = "宠物经验丹", Rand = 400},
				{Pet = "野猪妖宝宝", Rand = 200},
			},
		},
		['Mission_2'] = {ShowMonster = 15003, MonsterTeam = 15002, Info = "河里出现了巨大的螃蟹精，附近居民委托你降妖。", 
			Reward = {Exp = 17630, MoneyType = 5, MoneyVal = 10580, ItemList = {}},
			Over_Reward = {Exp = 1750, MoneyType = 5, MoneyVal = 800, ItemList = {}},
			Rare_Reward = {
				{Item = "小银币袋", Rand = 400},
				{Item = "藏宝图", Rand = 400},
				{Pet = "蟹将军宝宝", Rand = 200},
			},
		},
		['Mission_3'] = {ShowMonster = 15005, MonsterTeam = 15003, Info = "狐狸幻化的美人似乎想诱惑你，精神紧张的你决定先下手为强。", 
			Reward = {Exp = 18405, MoneyType = 5, MoneyVal = 11045, ItemList = {}},
			Over_Reward = {Exp = 1800, MoneyType = 5, MoneyVal = 850, ItemList = {}},
			Rare_Reward = {
				{Item = "血池1", Rand = 600},
				{Item = "地涌夫人信物", Rand = 200},
				{Pet = "魅音狐宝宝", Rand = 200},
			},
		},
		['Mission_4'] = {ShowMonster = 15007, MonsterTeam = 15004, Info = "夭寿啦，野猪祖宗出现了，似乎准备用獠牙在你屁股上开个洞。", 
			Reward = {Exp = 19200, MoneyType = 5, MoneyVal = 11520, ItemList = {}},
			Over_Reward = {Exp = 1900, MoneyType = 5, MoneyVal = 950, ItemList = {}},
			Rare_Reward = {
				{Item = "藏宝图", Rand = 200},
				{Item = "宠物经验丹", Rand = 400},
				{Item = "小修炼丹", Rand = 300},
				{Pet = "变异野猪妖宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15009, MonsterTeam = 15005, Info = "原来是贼人偷走了动物幼崽，是时候替天行道了！", 
			Reward = {Exp = 20005, MoneyType = 5, MoneyVal = 12005, ItemList = {"宝石福袋",2,"特效卷轴礼盒1",1,"特技卷轴礼盒2",1}},
			Over_Reward = {Exp = 2000, MoneyType = 5, MoneyVal = 1150, ItemList = {}},
			Rare_Reward = {
				{Item = "宠物经验丹2", Rand = 400},
				{Item = "春十三娘信物", Rand = 100},
				{Item = "VIP经验卡", Rand = 200},
				{Item = "祈福卷轴1", Rand = 200},
				{Pet = "变异无根草宝宝", Rand = 100},
			},
		},
	},
	['Chapter_2'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 50, Name = "小虎妖历险记"},
		['Mission_1'] = {ShowMonster = 15011, MonsterTeam = 15006, Info = "小虎妖跑进了废弃道观，他的母亲希望你把它带回来。", 
			Reward = {Exp = 20830, MoneyType = 5, MoneyVal = 12500, ItemList = {}},
			Over_Reward = {Exp = 2050, MoneyType = 5, MoneyVal = 1250, ItemList = {}},
			Rare_Reward = {
				{Item = "魔池1", Rand = 500},
				{Item = "宝石福袋", Rand = 400},
				{Pet = "无根草宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15013, MonsterTeam = 15007, Info = "道观之中居然还有道士的游魂，这里发生了什么？", 
			Reward = {Exp = 21675, MoneyType = 5, MoneyVal = 13005, ItemList = {}},
			Over_Reward = {Exp = 2150, MoneyType = 5, MoneyVal = 1300, ItemList = {}},
			Rare_Reward = {
				{Item = "藏宝图", Rand = 500},
				{Item = "小银币袋", Rand = 400},
				{Pet = "行者游魂宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15015, MonsterTeam = 15008, Info = "千辛万苦终于找到了小虎妖，然而他却不愿离开，教训他一顿吧。", 
			Reward = {Exp = 22530, MoneyType = 5, MoneyVal = 13520, ItemList = {}},
			Over_Reward = {Exp = 2250, MoneyType = 5, MoneyVal = 1350, ItemList = {}},
			Rare_Reward = {
				{Item = "鹿力大仙信物", Rand = 100},
				{Item = "祈福卷轴1", Rand = 700},
				{Pet = "变异小虎妖宝宝", Rand = 200},
			},
		},
		['Mission_4'] = {ShowMonster = 15017, MonsterTeam = 15009, Info = "还有只瑞兽幼崽和小虎妖一起冒险，把这个小家伙一齐带出去吧。", 
			Reward = {Exp = 23405, MoneyType = 5, MoneyVal = 14045, ItemList = {}},
			Over_Reward = {Exp = 2340, MoneyType = 5, MoneyVal = 1400, ItemList = {}},
			Rare_Reward = {
				{Item = "小修炼丹", Rand = 400},
				{Item = "宝石福袋", Rand = 300},
				{Pet = "瑞兽幼崽宝宝", Rand = 200},
				{Pet = "变异瑞兽幼崽宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15019, MonsterTeam = 15010, Info = "毁灭了道观后在地底沉睡的毒尸被四处躲避你的小虎妖惊醒了，并向你袭来。", 
				Reward = {Exp = 24300, MoneyType = 5, MoneyVal = 14580, ItemList = {"高级宝石福袋",1,"特效卷轴礼盒1",2,"特技卷轴礼盒2",1,"真经小白菜",1}},
			Over_Reward = {Exp = 2400, MoneyType = 5, MoneyVal = 1450, ItemList = {}},
			Rare_Reward = {
				{Item = "高级宝石福袋", Rand = 300},
				{Item = "祈福卷轴1", Rand = 300},
				{Item = "黄风怪信物", Rand = 100},
				{Pet = "女尸怨灵宝宝", Rand = 200},
				{Pet = "变异女尸怨灵宝宝", Rand = 100},
			},
		},
	},
	['Chapter_3'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 55, Name = "被抢走的书生"},
		['Mission_1'] = {ShowMonster = 15021, MonsterTeam = 15011, Info = "只听说强盗抢美女，然而附近的山寨却开始抢男人？", 
			Reward = {Exp = 25205, MoneyType = 5, MoneyVal = 15125, ItemList = {}},
			Over_Reward = {Exp = 2500, MoneyType = 5, MoneyVal = 1500, ItemList = {}},
			Rare_Reward = {
				{Item = "血池1", Rand = 400},
				{Item = "小银币袋", Rand = 500},
				{Pet = "洞花妖宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15024, MonsterTeam = 15012, Info = "大部分男人都被放回来了，然而教书先生却被带走了。他的家人委托你救救他。", 
			Reward = {Exp = 26130, MoneyType = 5, MoneyVal = 15680, ItemList = {}},
			Over_Reward = {Exp = 2600, MoneyType = 5, MoneyVal = 1550, ItemList = {}},
			Rare_Reward = {
				{Item = "血池2", Rand = 450},
				{Item = "魔池2", Rand = 450},
				{Pet = "山贼斥候宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15027, MonsterTeam = 15013, Info = "原来寨主的女儿看上了教书先生，你觉得婚姻之事得问问教书先生的意见。", 
			Reward = {Exp = 27075, MoneyType = 5, MoneyVal = 16245, ItemList = {}},
			Over_Reward = {Exp = 2700, MoneyType = 5, MoneyVal = 1600, ItemList = {}},
			Rare_Reward = {
				{Item = "藏宝图", Rand = 700},
				{Item = "六耳猕猴信物", Rand = 100},
				{Pet = "山贼斥候宝宝", Rand = 200},
			},
		},
		['Mission_4'] = {ShowMonster = 15030, MonsterTeam = 15014, Info = "到山寨你却发生先生在教大汉们念书。头目表示先生被你带回去他就不好交代，只能动手了。", 
			Reward = {Exp = 28030, MoneyType = 5, MoneyVal = 16820, ItemList = {}},
			Over_Reward = {Exp = 2800, MoneyType = 5, MoneyVal = 1650, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴1", Rand = 300},
				{Item = "宝石福袋", Rand = 200},
				{Item = "小修炼丹", Rand = 400},
				{Pet = "山贼斥候宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15033, MonsterTeam = 15015, Info = "先生表示自己不愿意和长的跟程咬金一个样的女人结婚，大当家只好亲自出马。", 
			Reward = {Exp = 29005, MoneyType = 5, MoneyVal = 17405, ItemList = {"高级宝石福袋",2,"特效卷轴礼盒1",1,"特技卷轴礼盒2",1}},
			Over_Reward = {Exp = 2900, MoneyType = 5, MoneyVal = 1700, ItemList = {}},
			Rare_Reward = {
				{Item = "神兽猪碎片", Rand = 100},
				{Item = "特技卷轴礼盒1", Rand = 200},
				{Item = "特效卷轴礼盒0", Rand = 300},
				{Item = "高级宝石福袋", Rand = 300},
				{Item = "程咬金信物", Rand = 100},
			},
		},
	},
	['Chapter_4'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 60, Name = "东海选美"},
		['Mission_1'] = {ShowMonster = 15037, MonsterTeam = 15016, Info = "听说东海龙宫要举办选美大赛，好奇的你偷偷潜入龙宫。", 
			Reward = {Exp = 30000, MoneyType = 5, MoneyVal = 18000, ItemList = {}},
			Over_Reward = {Exp = 3000, MoneyType = 5, MoneyVal = 1800, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 600 },
				{Item = "高级宝石福袋", Rand = 300},
				{Pet = "水判官宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15040, MonsterTeam = 15017, Info = "首先上场的是雪领主，亮色的毛皮颇受好评，然而因为不是水生物，很快被轰了下去。", 
			Reward = {Exp = 31005, MoneyType = 5, MoneyVal = 18605, ItemList = {}},
			Over_Reward = {Exp = 3100, MoneyType = 5, MoneyVal = 1860, ItemList = {}},
			Rare_Reward = {
				{Item = "血池3", Rand = 500},
				{Item = "祈福卷轴1", Rand = 400},
				{Pet = "雪坊主宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15043, MonsterTeam = 15018, Info = "接下来上场的是一只……一只巨大的鲤鱼壮汉，你感觉自己的眼睛受到了污染。", 
			Reward = {Exp = 32030, MoneyType = 5, MoneyVal = 19220, ItemList = {}},
			Over_Reward = {Exp = 3200, MoneyType = 5, MoneyVal = 1900, ItemList = {}},
			Rare_Reward = {
				{Item = "魔池3", Rand = 500},
				{Item = "祈福卷轴2", Rand = 400},
				{Item = "灵感大王信物", Rand = 100},
			},
		},
		['Mission_4'] = {ShowMonster = 15046, MonsterTeam = 15019, Info = "最后的选美冠军是只碧水兽。你所看好的田螺小姐，人鱼小姐纷纷无缘决赛。", 
			Reward = {Exp = 33075, MoneyType = 5, MoneyVal = 19845, ItemList = {}},
			Over_Reward = {Exp = 3300, MoneyType = 5, MoneyVal = 1960, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 400},
				{Item = "高级藏宝图", Rand = 300},
				{Item = "宠物经验丹3", Rand = 200},
				{Pet = "圣麒麟", Rand = 50},

			},
		},
		['Mission_5'] = {ShowMonster = 15049, MonsterTeam = 15020, Info = "你感叹东海生物的审美无法理解，却被参赛选手听到，感觉受到了侮辱的众人开始追杀你。快逃吧！", 
			Reward = {Exp = 34130, MoneyType = 5, MoneyVal = 20480, ItemList = {"高级宝石福袋",3,"100奇遇值",1,"特效卷轴礼盒3",2,"特技卷轴礼盒3",1,"真经小不懂",1}},
			Over_Reward = {Exp = 3400, MoneyType = 5, MoneyVal = 2000, ItemList = {}},
			Rare_Reward = {
				{Item = "中银币袋", Rand = 300},
				{Item = "高级宝石福袋", Rand = 200},
				{Item = "龙王信物", Rand = 100},
				{Item = "VIP经验卡", Rand = 200},
				{Item = "阵法书残卷", Rand = 200},
			},
		},
	},
	['Chapter_5'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 65, Name = "麻将引发的血案"},
		['Mission_1'] = {ShowMonster = 15053, MonsterTeam = 15021, Info = "蟠桃会上，王母倍感数次蟠桃宴毫无新意，决定用麻将决定九千年蟠桃的归属。", 
			Reward = {Exp = 35205, MoneyType = 5, MoneyVal = 21125, ItemList = {}},
			Over_Reward = {Exp = 3500, MoneyType = 5, MoneyVal = 2100, ItemList = {}},
			Rare_Reward = {
				{Item = "藏宝图", Rand = 500},
				{Item = "高级宝石福袋", Rand = 400},
				{Pet = "七仙女宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15056, MonsterTeam = 15022, Info = "借助无字天书之力，你获得了一个参赛名额，开始寻找靶子苦练麻将。", 
			Reward = {Exp = 36300, MoneyType = 5, MoneyVal = 21780, ItemList = {}},
			Over_Reward = {Exp = 3600, MoneyType = 5, MoneyVal = 2150, ItemList = {}},
			Rare_Reward = {
				{Item = "宠物经验丹3", Rand = 500},
				{Item = "祈福卷轴2", Rand = 400},
				{Pet = "变异七仙女宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15059, MonsterTeam = 15023, Info = "你面对的是三个从未接触过麻将这种凡物的天将，赶快解决他们。", 
			Reward = {Exp = 37405, MoneyType = 5, MoneyVal = 22445, ItemList = {}},
			Over_Reward = {Exp = 3700, MoneyType = 5, MoneyVal = 2200, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 400},
				{Item = "血池3", Rand = 300},
				{Item = "阵法书残卷", Rand = 300},
			},
		},
		['Mission_4'] = {ShowMonster = 15066, MonsterTeam = 15024, Info = "没想到如意真仙居然如此精通麻将，在她的手下，你节节败退。", 
			Reward = {Exp = 38530, MoneyType = 5, MoneyVal = 23120, ItemList = {}},
			Over_Reward = {Exp = 3800, MoneyType = 5, MoneyVal = 2310, ItemList = {}},
			Rare_Reward = {
				{Item = "如意真仙信物", Rand = 100},
				{Item = "藏宝图", Rand = 300},
				{Item = "魔池3", Rand =300},
				{Item = "宠物经验丹3", Rand =300},
			},
		},
		['Mission_5'] = {ShowMonster = 15065, MonsterTeam = 15025, Info = "隔壁太上老君为老不尊，出老千被发现了，还牵连出数位仙人，蟠桃宴顿时乱成一团。", 
			Reward = {Exp = 39675, MoneyType = 5, MoneyVal = 23805, ItemList = {"高级宝石福袋",4,"100奇遇值",2,"R礼包",10,"特技卷轴礼盒3",1}},
			Over_Reward = {Exp = 3900, MoneyType = 5, MoneyVal = 2350, ItemList = {}},
			Rare_Reward = {
				{Item = "金池长老信物", Rand = 100},
				{Item = "高级宝石福袋", Rand = 300},
				{Item = "高级藏宝图", Rand = 300},
				{Item = "特效卷轴礼盒1", Rand = 200},
				{Item = "特技卷轴礼盒2", Rand = 200},
			},
		},
	},
	['Chapter_6'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 70, Name = "雪山风波"},
		['Mission_1'] = {ShowMonster = 15069, MonsterTeam = 15026, Info = "闲暇之际，你决定去雪山旅游，却发现妖魔躁动。", 
			Reward = {Exp = 40830, MoneyType = 5, MoneyVal = 24500, ItemList = {}},
			Over_Reward = {Exp = 4000, MoneyType = 5, MoneyVal = 2450, ItemList = {}},
			Rare_Reward = {
				{Item = "高级宝石福袋", Rand = 500},
				{Item = "宠物经验丹3", Rand = 400},
				{Pet = "变异雪坊主宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15072, MonsterTeam = 15027, Info = "偶遇一只通人性的白狐，你希望它告诉你发生了什么。然而它却瞧不起你，揍它！", 
			Reward = {Exp = 42005, MoneyType = 5, MoneyVal = 25205, ItemList = {}},
			Over_Reward = {Exp = 4200, MoneyType = 5, MoneyVal = 2500, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴2", Rand = 600},
				{Item = "阵法书残卷", Rand = 300},
				{Pet = "素尾白狐宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15085, MonsterTeam = 15028, Info = "白狐说雪山深处有巨大的气息苏醒，前去发现守门的是一只巨大妖魔。", 
			Reward = {Exp = 43200, MoneyType = 5, MoneyVal = 25920, ItemList = {}},
			Over_Reward = {Exp = 4300, MoneyType = 5, MoneyVal = 2550, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 400},
				{Item = "血池3", Rand = 500},
				{Item = "白无常信物", Rand = 100},
			},
		},
		['Mission_4'] = {ShowMonster = 15078, MonsterTeam = 15029, Info = "深入雪山，当你发现冰魄剑灵时，感觉大事不妙。", 
			Reward = {Exp = 44405, MoneyType = 5, MoneyVal = 26645, ItemList = {}},
			Over_Reward = {Exp = 4400, MoneyType = 5, MoneyVal = 2650, ItemList = {}},
			Rare_Reward = {
				{Item = "小银币袋", Rand = 700},
				{Item = "宠物经验丹3", Rand = 200},
				{Pet = "冰魄剑灵宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15081, MonsterTeam = 15030, Info = "雪山的最深处，等待你的是共工的一片残魂，是时候拯救世界了！", 
			Reward = {Exp = 45630, MoneyType = 5, MoneyVal = 27380, ItemList = {"高级宝石福袋",5,"100奇遇值",3,"SR礼包",5,"特效卷轴礼盒3",1,"真经大虾米",1}},
			Over_Reward = {Exp = 4550, MoneyType = 5, MoneyVal = 2700, ItemList = {}},
			Rare_Reward = {
				{Item = "神兽兔碎片", Rand = 100},
				{Item = "高级宝石福袋", Rand = 500},
				{Item = "VIP经验卡", Rand = 200},
				{Item = "高级修炼丹", Rand = 300},
				{Item = "黑无常信物", Rand = 200},
			},
		},
	},
	['Chapter_7'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 75, Name = "混世魔王"},
		['Mission_1'] = {ShowMonster = 15086, MonsterTeam = 15031, Info = "大圣爷，哦不，是斗战胜佛，多年没有回花果山了，准备回家看看，结果发现花果山乌烟瘴气，群魔乱舞。", 
			Reward = {Exp = 46075, MoneyType = 5, MoneyVal = 28125, ItemList = {}},
			Over_Reward = {Exp = 4600, MoneyType = 5, MoneyVal = 2800, ItemList = {}},
			Rare_Reward = {
				{Item = "宠物经验丹3", Rand = 500},
				{Item = "高级藏宝图", Rand = 400},
				{Pet = "踏火神犀宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15090, MonsterTeam = 15032, Info = "花果山变成这样肯定和这个爱搞事的混世魔王脱不了干系，赶紧追上去看看！", 
			Reward = {Exp = 46520, MoneyType = 5, MoneyVal = 28884, ItemList = {}},
			Over_Reward = {Exp = 4650, MoneyType = 5, MoneyVal = 2850, ItemList = {}},
			Rare_Reward = {
				{Item = "高级修炼丹", Rand = 400},
				{Item = "高级宝石福袋", Rand = 500},
				{Item = "中银币袋", Rand = 200},
			},
		},
		['Mission_3'] = {ShowMonster = 15094, MonsterTeam = 15033, Info = "这个混世魔王是属泥鳅的吗，怎么抓都抓不住，赶紧追上去。", 
			Reward = {Exp = 46965, MoneyType = 5, MoneyVal = 29655, ItemList = {}},
			Over_Reward = {Exp = 4670, MoneyType = 5, MoneyVal = 2960, ItemList = {}},
			Rare_Reward = {
				{Item = "阵法书残卷", Rand = 800},
				{Item = "羊力大仙信物", Rand = 100},
				{Pet = "变异踏火神犀宝宝", Rand = 100},
			},
		},
		['Mission_4'] = {ShowMonster = 15098, MonsterTeam = 15034, Info = "终于追上了这个混世魔王，教训教训他，让他知道猴子屁股为什么这样……为什么这里有个山贼？", 
			Reward = {Exp = 47410, MoneyType = 5, MoneyVal = 30438, ItemList = {}},
			Over_Reward = {Exp = 4700, MoneyType = 5, MoneyVal = 3000, ItemList = {}},
			Rare_Reward = {
				{Item = "小银币袋", Rand = 600},
				{Item = "中银币袋", Rand = 100},
				{Item = "祈福卷轴2", Rand = 150},
				{Item = "宠物经验丹3", Rand = 150},
			},
		},
		['Mission_5'] = {ShowMonster = 15103, MonsterTeam = 15035, Info = "击败了乱入的山贼，却发现混世魔王要呼朋唤友搞事情，赶紧弄他！", 
			Reward = {Exp = 47855, MoneyType = 5, MoneyVal = 31233, ItemList = {"高级宝石福袋",8,"100奇遇值",3,"SSR礼包",1,"特技卷轴礼盒3",1}},
			Over_Reward = {Exp = 4750, MoneyType = 5, MoneyVal = 3100, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 400},
				{Item = "祈福卷轴3", Rand = 300},
				{Item = "混世魔王信物", Rand = 100},
				{Pet = "混世魔王宝宝", Rand = 100},
				{Pet = "伪神兽宝宝", Rand = 50},
			},
		},
	},
	['Chapter_8'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 80, Name = "猪妖风波"},
		['Mission_1'] = {ShowMonster = 15108, MonsterTeam = 15036, Info = "听说高老庄又出现了猪妖，看了一眼身边的八戒，这次又会是谁呢？", 
			Reward = {Exp = 48300, MoneyType = 5, MoneyVal = 32040, ItemList = {}},
			Over_Reward = {Exp = 4800, MoneyType = 5, MoneyVal = 3200, ItemList = {}},
			Rare_Reward = {
				{Item = "阵法书残卷", Rand = 500},
				{Item = "宠物经验丹3", Rand = 400},
				{Pet = "变异行者游魂宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15110, MonsterTeam = 15037, Info = "没有发现猪妖，倒是碰到了以前的对头山贼，难道是傲来村的山贼转移阵地了？", 
			Reward = {Exp = 48745, MoneyType = 5, MoneyVal = 32859, ItemList = {}},
			Over_Reward = {Exp = 4850, MoneyType = 5, MoneyVal = 3250, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴2", Rand = 500},
				{Item = "高级宝石福袋", Rand = 400},
				{Pet = "变异山贼斥候宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15114, MonsterTeam = 15038, Info = "这猪妖见势不妙，直接开溜了。不能让他跑了，快追上去！", 
			Reward = {Exp = 49190, MoneyType = 5, MoneyVal = 33690, ItemList = {}},
			Over_Reward = {Exp = 4910, MoneyType = 5, MoneyVal = 3350, ItemList = {}},
			Rare_Reward ={
				{Item = "藏宝图", Rand = 500},
				{Item = "高级藏宝图", Rand = 400},
				{Item = "猪八戒信物", Rand = 100},
			},
		},
		['Mission_4'] = {ShowMonster = 15117, MonsterTeam = 15039, Info = "没就在追上猪妖之时，一群小妖前来阻拦。快点击败小妖，追上去！", 
			Reward = {Exp = 49635, MoneyType = 5, MoneyVal = 34533, ItemList = {}},
			Over_Reward = {Exp = 4950, MoneyType = 5, MoneyVal = 3400, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 400},
				{Item = "高级宝石福袋", Rand = 350},
				{Item = "中银币袋", Rand = 150},
				{Item = "VIP经验卡", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15120, MonsterTeam = 15040, Info = "经过千辛万苦，终于追上了猪妖。快点降伏此妖！", 
			Reward = {Exp = 50080, MoneyType = 5, MoneyVal = 35388, ItemList = {"极品宝石福袋",1,"100奇遇值",4,"SSR礼包",2,"特效卷轴礼盒4",1}},
			Over_Reward = {Exp = 5000, MoneyType = 5, MoneyVal = 3500, ItemList = {}},
			Rare_Reward = {
				{Item = "李靖信物", Rand = 100},
				{Item = "高级藏宝图", Rand = 400},
				{Item = "极品宝石福袋", Rand = 100},
				{Item = "高级修炼丹", Rand = 200},
				{Item = "祈福卷轴3", Rand = 200},
			},
		},
	},
	['Chapter_9'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 85, Name = "金鹏试炼"},
		['Mission_1'] = {ShowMonster = 15125, MonsterTeam = 15041, Info = "师傅被妖怪捉了去，快去救回师傅！", 
			Reward = {Exp = 50525, MoneyType = 5, MoneyVal = 36255, ItemList = {}},
			Over_Reward = {Exp = 5050, MoneyType = 5, MoneyVal = 3600, ItemList = {}},
			Rare_Reward = {
				{Item = "高级宝石福袋", Rand = 600},
				{Item = "极品宝石福袋", Rand = 300},
				{Pet = "天神石像宝宝", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15128, MonsterTeam = 15042, Info = "击败了守山大将，却不知师傅现在何处。正好碰到一群巡山小妖！", 
			Reward = {Exp = 50970, MoneyType = 5, MoneyVal = 37134, ItemList = {}},
			Over_Reward = {Exp = 5070, MoneyType = 5, MoneyVal = 3700, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴2", Rand = 700},
				{Pet = "水帘妖宝宝", Rand = 200},
				{Pet = "变异水帘妖宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15131, MonsterTeam = 15043, Info = "从巡山小妖口中，知道了师傅所在！师傅现在被妖怪总兵看守，快去解救师傅！", 
			Reward = {Exp = 51415, MoneyType = 5, MoneyVal = 38025, ItemList = {}},
			Over_Reward = {Exp = 5100, MoneyType = 5, MoneyVal = 3800, ItemList = {}},
			Rare_Reward = {
				{Item = "修炼丹", Rand = 600},
				{Item = "高级修炼丹", Rand = 300},
				{Pet = "变异天神石像宝宝", Rand = 100},
			},
		},
		['Mission_4'] = {ShowMonster = 15134, MonsterTeam = 15044, Info = "击败了妖怪总兵，成功解救了师傅。但此时却被金翅大鹏包围了！", 
			Reward = {Exp = 51860, MoneyType = 5, MoneyVal = 38928, ItemList = {}},
			Over_Reward = {Exp = 5150, MoneyType = 5, MoneyVal = 3850, ItemList = {}},
			Rare_Reward = {
				{Item = "宠物经验丹3", Rand = 800},
				{Item = "中银币袋", Rand = 500},
				{Item = "唐僧信物", Rand = 800},
				{Item = "高级宝石福袋", Rand = 1000},
			},
		},
		['Mission_5'] = {ShowMonster = 15137, MonsterTeam = 15045, Info = "没想到这居然是佛祖的考验。既然如此，快打败金翅大鹏，通过考验！", 
			Reward = {Exp = 52305, MoneyType = 5, MoneyVal = 39843 , ItemList = {"极品宝石福袋",1,"100奇遇值",4,"SSR礼包",3,"特技卷轴礼盒4",1}},
			Over_Reward = {Exp = 5200, MoneyType = 5, MoneyVal = 3900, ItemList = {}},
			Rare_Reward = {
				{Item = "灵吉菩萨信物", Rand = 100},
				{Item = "神兽鸡碎片", Rand = 100},
				{Item = "高级藏宝图", Rand = 400},
				{Item = "宠物经验丹3", Rand = 300},
				{Item = "祈福卷轴3", Rand = 300},
			},
		},
	},
	['Chapter_10'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 90, Name = "蟠桃宴"},
		['Mission_1'] = {ShowMonster = 15140, MonsterTeam = 15046, Info = "蟠桃大会，终于要开始了。但诸妖也闻风而动，前来捣乱！玉帝下令维护秩序，但总觉的事情不简单！", 
			Reward = {Exp = 52750, MoneyType = 5, MoneyVal = 40770, ItemList = {}},
			Over_Reward = {Exp = 5250, MoneyType = 5, MoneyVal = 4050, ItemList = {}},
			Rare_Reward = {
				{Item = "宝石福袋", Rand = 600},
				{Item = "高级宝石福袋", Rand = 300},
				{Item = "极品宝石福袋", Rand = 100},
			},
		},
		['Mission_2'] = {ShowMonster = 15143, MonsterTeam = 15047, Info = "击退了捣乱的小妖，正要松一口气，却看到一群天兵天将偷偷摸摸地进了蟠桃园！", 
			Reward = {Exp = 53195, MoneyType = 5, MoneyVal = 41709, ItemList = {}},
			Over_Reward = {Exp = 5310, MoneyType = 5, MoneyVal = 4125, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴1", Rand = 600},
				{Item = "祈福卷轴2", Rand = 300},
				{Item = "祈福卷轴3", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15146, MonsterTeam = 15048, Info = "这群天兵天将居然是来偷蟠桃！被发现后居然和妖怪合流了！！", 
			Reward = {Exp = 53640, MoneyType = 5, MoneyVal = 42660, ItemList = {}},
			Over_Reward = {Exp = 5350, MoneyType = 5, MoneyVal = 4250, ItemList = {}},
			Rare_Reward = {
				{Item = "罗刹女信物", Rand = 200},
				{Item = "修炼丹", Rand = 500},
				{Item = "高级修炼丹", Rand = 300},
			},
		},
		['Mission_4'] = {ShowMonster = 15149, MonsterTeam = 15049, Info = "平定了蟠桃园的动乱，返回蟠桃宴。发现众仙已经醉醺醺得！更有一些开始闹事了！", 
			Reward = {Exp = 54085, MoneyType = 5, MoneyVal = 43623, ItemList = {}},
			Over_Reward = {Exp = 5400, MoneyType = 5, MoneyVal = 5360, ItemList = {}},
			Rare_Reward = {
				{Item = "血池3", Rand = 400},
				{Item = "魔池3", Rand = 400},
				{Item = "中银币袋", Rand = 100},
				{Pet = "巨灵神宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15152, MonsterTeam = 15050, Info = "喝醉的哪吒说着要去报仇！而众仙似乎在拼命阻拦！快去帮忙！", 
			Reward = {Exp = 54530, MoneyType = 5, MoneyVal = 44598 , ItemList = {"极品宝石福袋",1,"100奇遇值",5,"SSR礼包",5,"特效卷轴礼盒4",1}},
			Over_Reward = {Exp = 5450, MoneyType = 5, MoneyVal = 4450, ItemList = {}},
			Rare_Reward = {
				{Item = "小白龙信物", Rand = 100},
				{Item = "高级藏宝图", Rand =500},
				{Item = "特技卷轴礼盒4", Rand = 200},
				{Item = "特效卷轴礼盒4", Rand = 200},
				{Item = "极品宝石福袋", Rand = 200},
			},
		},
	},
	['Chapter_11'] = {
		['Chapter_Setting'] = { Rein = 0, Level = 95, Name = "天庭考核"},
		['Mission_1'] = {ShowMonster = 15155, MonsterTeam = 15051, Info = "天庭开始对天兵天将进行试炼考核，身为天庭其中一员，自然也要考核！", 
			Reward = {Exp = 54975, MoneyType = 5, MoneyVal = 45585, ItemList = {}},
			Over_Reward = {Exp = 5475, MoneyType = 5, MoneyVal = 4555, ItemList = {}},
			Rare_Reward = {
				{Item = "宠物经验丹3", Rand = 500},
				{Item = "高级宝石福袋", Rand = 300},
				{Item = "极品宝石福袋", Rand = 200},
			},
		},
		['Mission_2'] = {ShowMonster = 15158, MonsterTeam = 15052, Info = "成功通过了人之试炼，妖之试炼接踵而来！", 
			Reward = {Exp = 55420, MoneyType = 5, MoneyVal = 46584, ItemList = {}},
			Over_Reward = {Exp = 5540, MoneyType = 5, MoneyVal = 4650, ItemList = {}},
			Rare_Reward = {
				{Item = "高级藏宝图", Rand = 500},
				{Item = "修炼丹", Rand = 400},
				{Pet = "变异素尾白狐宝宝", Rand = 100},
			},
		},
		['Mission_3'] = {ShowMonster = 15161, MonsterTeam = 15053, Info = "来自地府的鬼之试炼，阴寒之极。要多加小心才行！", 
			Reward = {Exp = 55865, MoneyType = 5, MoneyVal = 47595, ItemList = {}},
			Over_Reward = {Exp = 5580, MoneyType = 5, MoneyVal = 4750, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴2", Rand = 600},
				{Item = "杨戬信物", Rand = 100},
				{Pet = "怨灵鬼宝宝", Rand = 300},
			},
		},
		['Mission_4'] = {ShowMonster = 15164, MonsterTeam = 15054, Info = "终于到了神之试炼，居然由巨灵神亲自守关！", 
			Reward = {Exp = 56310, MoneyType = 5, MoneyVal = 48618, ItemList = {}},
			Over_Reward = {Exp = 5630, MoneyType = 5, MoneyVal = 4810, ItemList = {}},
			Rare_Reward = {
				{Item = "祈福卷轴2", Rand = 500},
				{Item = "极品宝石福袋", Rand = 200},
				{Item = "高级修炼丹", Rand = 200},
				{Pet = "变异巨灵神宝宝", Rand = 100},
			},
		},
		['Mission_5'] = {ShowMonster = 15167, MonsterTeam = 15055, Info = "没想到最后一关居然是丹灵试炼，相信此次也能通过！", 
			Reward = {Exp = 56755, MoneyType = 5, MoneyVal = 49653 , ItemList = {"极品宝石福袋",2,"100奇遇值",5,"SSR礼包",5,"特效卷轴礼盒4",2,"真经大玩家",1}},
			Over_Reward = {Exp = 5650, MoneyType = 5, MoneyVal = 4950, ItemList = {}},
			Rare_Reward = {
				{Item = "神兽狗碎片", Rand = 100},
				{Item = "银角大王信物", Rand = 200},
				{Item = "极品宝石福袋", Rand = 300},
				{Item = "特效卷轴礼盒5", Rand = 200},
				{Item = "特技卷轴礼盒5", Rand = 200},
			},
		},
	},

}



-- 活动开始前回调
function WordlessBook.OnDeclare(id, seconds)
end

-- 活动开始回调
function WordlessBook.OnStart(id, is_normal)
	--if sVarSystem:GetInt("IsWordlessBookNpcShow") == 0 then		
	--	sVarSystem:SetInt("IsWordlessBookNpcShow", 1)
	--end
	sVarSystem:SetInt("ACT_WordlessBook_Id", id)
end

-- 活动结束回调
function WordlessBook.OnStop(id)

end

-- 玩家点击参与活动回调
function WordlessBook.OnJoin(id, player)
	Lua_tools.MoveToNpc(player, 10035)
end

-- 玩家客户端查询数据回调
function WordlessBook.OnQuery(id, player)
	local show_item = WordlessBook.ShowItem or "61024,61025,36016,50204"
	local str = "0:0:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("WordlessBook") or '2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

-- 客户端获取属性
function WordlessBook.GetConfig(player)
	if not WordlessBook.ConfigStr then
		WordlessBook.Initialization()
		WordlessBook.ConfigStr = Lua_tools.serialize(WordlessBook.Config)
	end
	--sLuaApp:LuaDbg("ConfigStr = " .. WordlessBook.ConfigStr)
	local str = [[if SealedBookUI then
		SealedBookUI.ServerData = {}
		SealedBookUI.ServerData.Config = ]]..WordlessBook.ConfigStr..[[
		SealedBookUI.ServerData.Chapter = ]]..player:GetInt("ACT_WordlessBook_Chapter")..[[
		SealedBookUI.ServerData.Mission = ]]..player:GetInt("ACT_WordlessBook_Mission")..[[
		SealedBookUI.ServerData.OverConsume = ]]..WordlessBook.OverConsume..[[
		SealedBookUI.Refresh()
	end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function WordlessBook.GetData(player)
	local str = [[if SealedBookUI then
			SealedBookUI.ServerData.Chapter = ]]..player:GetInt("ACT_WordlessBook_Chapter")..[[
			SealedBookUI.ServerData.Mission = ]]..player:GetInt("ACT_WordlessBook_Mission")..[[
			SealedBookUI.PlayerDataRefresh()
		end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

WordlessBook.FightTag = 5000
-- 开始战斗
function WordlessBook.StartFight(player,Chapter,Mission,isAuto)
	local config = WordlessBook.Config['Chapter_'..Chapter]['Mission_'..Mission]
	if not config then
		sLuaApp:NotifyTipsMsg(player, "您没有选择有效的关卡")
		return
	end
	Chapter = tonumber(Chapter)
	Mission = tonumber(Mission)
	local now_C = player:GetInt("ACT_WordlessBook_Chapter")
	local now_M = player:GetInt("ACT_WordlessBook_Mission")
	local NewMission = 0
	if now_M == 5 or now_M == 0 then
		if Chapter > now_C+1 then
			sLuaApp:NotifyTipsMsg(player, "无法挑战当前关卡")
			return
		end
		if Chapter == now_C then
			if Mission > now_M + 1 then
				sLuaApp:NotifyTipsMsg(player, "无法挑战当前关卡")
				return
			elseif Mission == now_M + 1 then
				NewMission = 1
			end
		end
		if Chapter == now_C+1 then
			if Mission == 1 then
				NewMission = 1
			else
				sLuaApp:NotifyTipsMsg(player, "无法挑战当前关卡")
				return
			end
		end
	else
		if Chapter > now_C then
			sLuaApp:NotifyTipsMsg(player, "无法挑战当前关卡")
			return
		elseif Chapter == now_C then
			if Mission > now_M + 1 then
				sLuaApp:NotifyTipsMsg(player, "无法挑战当前关卡")
				return
			elseif Mission == now_M + 1 then
				NewMission = 1
			end
		end
	end
	local rein = WordlessBook.Config['Chapter_'..Chapter]['Chapter_Setting'].Rein
	local level = WordlessBook.Config['Chapter_'..Chapter]['Chapter_Setting'].Level
	
	local player_R = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local player_L = player:GetAttr(ROLE_ATTR_LEVEL)
	
	if rein > player_R then
		sLuaApp:NotifyTipsMsg(player, "您的转生等级不够，无法挑战当前关卡")
		return
	end
	
	if rein == player_R and level > player_L then
		sLuaApp:NotifyTipsMsg(player, "您的等级不够，无法挑战当前关卡")
		return
	end
	
	--sLuaApp:LuaDbg("Chapter = " .. Chapter .. "     Mission = " .. Mission .. "  MonsterTeam = " .. config.MonsterTeam .. "       now_C = " .. now_C .. "          now_M = " ..now_M)
	--sLuaApp:LuaDbg("                      ")
	--sLuaApp:LuaDbg("                      ")
	--sLuaApp:LuaDbg("                      ")
	--sLuaApp:LuaDbg("                      ")
	if NewMission == 0 then
		if WordlessBook.OverConsume then
			if not player:SubVp(WordlessBook.OverConsume, "system", "无字真经扫荡", ""..Chapter.."_"..Mission) then
				sLuaApp:NotifyTipsMsg(player, "您的活力值不足，无法进行当前关卡！（重复进行无字真经将消耗"..WordlessBook.OverConsume.."点活力）")
				return
			end
		end
	end
	if sFightSystem:StartTagPVE(player, config.MonsterTeam, WordlessBook.FightTag, "WordlessBook", "FightCallBack", ""..Chapter.."_"..Mission) then
		if Data then
			if not Data['WordlessBook_isNewMission'] then
				Data['WordlessBook_isNewMission'] = {}
			end
			--Data['WordlessBook_isNewMission']['GUID_'..player:GetGUID()] = NewMission
		end
		local team = player:GetTeam()
		local memberlist = {}
		if team and not player:IsTempLeave() then
			memberlist = team:GetTeamMembers(false)
		else
			memberlist[1] = player
		end
		for _,v in ipairs(memberlist) do
			Data['WordlessBook_isNewMission']['GUID_'..v:GetGUID()] = NewMission
			v:SetString("ACT_WordlessBook_NowFigt", Chapter.."_"..Mission)
			sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "WordlessBook", "OnResult")
		end
	else
		sLuaApp:NotifyTipsMsg(player, "进入战斗失败")
	end
	
	if tonumber(isAuto) == 1 then
		player:SetInt("WordlessBook_isAuto",1)
	else
		player:SetInt("WordlessBook_isAuto",0)
	end
end

function WordlessBook.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= WordlessBook.FightTag then
		sLuaApp:LuaErr("NaoShi.FightCallBack回调错误")
		return
	end
end

function WordlessBook.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "WordlessBook", "OnResult")
	
	local IsAuto = player:GetInt("WordlessBook_isAuto")
	if victory == 2 then
		sLuaApp:LuaDbg("custom = " .. custom)
		local FightStr = player:GetString("ACT_WordlessBook_NowFigt")
		local custom_tb = sLuaApp:StrSplit(FightStr, "_")
		local Chapter = tonumber(custom_tb[1])
		local Mission = tonumber(custom_tb[2])
		
		local Player_C = player:GetInt("ACT_WordlessBook_Chapter")
		local Player_M = player:GetInt("ACT_WordlessBook_Mission")
		
		--sLuaApp:NotifyTipsMsg(player,"1111111111        Player_C ====== " ..Player_C.. "       Chapter ====== " .. Chapter)
		local LevelDown = WordlessBook.Config['Chapter_'..Chapter]['Chapter_Setting']['Level']
		local ReinDown = WordlessBook.Config['Chapter_'..Chapter]['Chapter_Setting']['Rein']
		
		local player_R = player:GetAttr(ROLE_ATTR_REINCARNATION)
		local player_L = player:GetAttr(ROLE_ATTR_LEVEL)
		
		if ReinDown > player_R then
			sLuaApp:NotifyTipsMsg(player, "您还没解锁该关卡，无法获得奖励")
			return
		end
		
		if ReinDown == player_R and LevelDown > player_L then
			sLuaApp:NotifyTipsMsg(player, "您还没解锁该关卡，无法获得奖励")
			return
		end
	
		if Chapter == Player_C then
			if Mission == Player_M + 1 then
				Player_C = Chapter
				Player_M = Mission
			elseif Player_M >= Mission then
				WordlessBook.GiveOverReward(player,Chapter,Mission)
				return
			else
				sLuaApp:NotifyTipsMsg(player,"您还没解锁该关卡，无法获得奖励")
				return
			end
		elseif Chapter == Player_C + 1 then
			if Player_M == 5 and Mission == 1 then
				Player_C = Chapter
				Player_M = 1
			elseif Player_M ~= 0 or Chapter ~= 1 or Mission ~= 1 or Player_C ~= 0 then
				sLuaApp:NotifyTipsMsg(player,"您还没解锁该关卡，无法获得奖励")
				return
			end
		elseif Chapter < Player_C then
			WordlessBook.GiveOverReward(player,Chapter,Mission)
			return
		else
			--sLuaApp:NotifyTipsMsg(player,"22222222222   Player_C ====== " ..Player_C.. "       Chapter ====== " .. Chapter)
			sLuaApp:NotifyTipsMsg(player,"您还没解锁该关卡，无法获得奖励")
			return
		end
		--sLuaApp:NotifyTipsMsg(player,"33333333333         Player_C ====== " ..Player_C.. "       Chapter ====== " .. Chapter)
		
		sLuaApp:NotifyTipsMsg(player, "战斗胜利！")
		local config = WordlessBook.Config['Chapter_'..Chapter]['Mission_'..Mission].Reward
		Lua_tools.AddMoney(player, config.MoneyType, config.MoneyVal, "system", "无字真经", ""..Chapter.."_"..Mission)
		sLuaApp:NotifyTipsMsg(player, "您获得了"..Lua_tools.GetMoneyName(config.MoneyType) .. config.MoneyVal)
		Lua_tools.AddItem(player, config.ItemList, "system", "无字真经", ""..Chapter.."_"..Mission)
		player:AddExp(config.Exp, "system", "无字真经", ""..Chapter.."_"..Mission)
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(config.Exp, "system", "无字真经", ""..Chapter.."_"..Mission)
		end
		player:SetInt("ACT_WordlessBook_Chapter", Chapter)
		player:SetInt("ACT_WordlessBook_Mission", Mission)
		
		local str = [[
		GUI.OpenWnd("SealedBookUI")
		if SealedBookUI then
			SealedBookUI.ServerData.Chapter = ]]..Chapter..[[
			SealedBookUI.ServerData.Mission = ]]..Mission..[[
			SealedBookUI.ServerData.IsAuto = ]]..IsAuto..[[
			SealedBookUI.PlayerDataRefresh()
		end]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		if IsAuto == 1 then
			sLuaApp:NotifyTipsMsg(player, "已开启自动战斗，5秒后将继续进行本关！")
			sLuaTimerSystem:AddTimerEx(player, 5000, 1, "WordlessBook.AutoFight", FightStr)
		end
		
		if Data then
			if Data['WordlessBook_isNewMission'] then
				local player_guid = player:GetGUID()
				if Data['WordlessBook_isNewMission']['GUID_'..player_guid] == 1 then
					local RankID = RankingListSystem.Config['无字真经榜']
					if RankID then
						if Lua_tools.Num2Txt then
							sRanklistSystem:UpdateRanklist(RankID,player_guid,Chapter*100+Mission,""..player:GetName(),"第"..Lua_tools.Num2Txt(Chapter).."卷/第"..Lua_tools.Num2Txt(Mission).."话")
						end
					end
				end
			end
		end
	else
		if IsAuto == 1 then
			player:SetInt("WordlessBook_isAuto",0)
			local str = [[
			GUI.OpenWnd("SealedBookUI")
			if SealedBookUI then
				SealedBookUI.ServerData.IsAuto = 0
				SealedBookUI.PlayerDataRefresh()
			end]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function WordlessBook.AutoFight(player, timer_id, custom)
	if player:GetInt("WordlessBook_isAuto") == 1 then
		local custom_tb = sLuaApp:StrSplit(player:GetString("ACT_WordlessBook_NowFigt"), "_")
		local Chapter = tonumber(custom_tb[1])
		local Mission = tonumber(custom_tb[2])
		
		WordlessBook.StartFight(player,Chapter,Mission,1)
	end
end

function WordlessBook.GiveOverReward(player,Chapter,Mission)
	local Over_Reward = WordlessBook.Config['Chapter_'..Chapter]['Mission_'..Mission].Over_Reward
	local Rare_Reward = WordlessBook.Config['Chapter_'..Chapter]['Mission_'..Mission].Rare_Reward
	
	if Over_Reward then
		Lua_tools.AddMoney(player, Over_Reward.MoneyType, Over_Reward.MoneyVal, "system", "无字真经", ""..Chapter.."_"..Mission)
		Lua_tools.AddItem(player, Over_Reward.ItemList, "system", "无字真经", ""..Chapter.."_"..Mission)
		player:AddExp(Over_Reward.Exp, "system", "无字真经", ""..Chapter.."_"..Mission)
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(Over_Reward.Exp, "system", "无字真经", ""..Chapter.."_"..Mission)
		end
	end
	
	if Rare_Reward then
		for k,v in ipairs(Rare_Reward) do
			local Rander = sLuaApp:RandInteger(1,math.floor(10000/(WordlessBook.RandomEx or 1)))
			if Rander <= v.Rand then
				if v.Item then
					Lua_tools.AddItem(player, {v.Item}, "system", "无字真经扫荡", ""..Chapter.."_"..Mission)
				end
				if v.Pet then
					if not v.PetID then
						local petData = PetConfig.GetByKeyName(v.Pet)
						if not petData then
							sLuaApp:LuaErr("配置中宠物【"..v.Pet.."】不存在！！！！！！！！！！  Chapter = " .. Chapter .. "   Mission = " .. Mission)
							break
						else
							v.PetID = petData.Id
						end	
					end
					sPetSystem:AddPetEx(player, v.PetID, 1, true, "system", "无字真经扫荡", ""..Chapter.."_"..Mission)
				end
			end
		end
	end
	
	local IsAuto = player:GetInt("WordlessBook_isAuto")
		
	local str = [[
	GUI.OpenWnd("SealedBookUI")
	if SealedBookUI then
		SealedBookUI.ServerData.IsAuto = ]]..IsAuto..[[
		SealedBookUI.PlayerDataRefresh()
	end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	if IsAuto == 1 then
		sLuaApp:NotifyTipsMsg(player, "已开启自动战斗，5秒后将继续进行本关！")
		sLuaTimerSystem:AddTimerEx(player, 5000, 1, "WordlessBook.AutoFight", ""..Chapter.."_"..Mission)
	end
end

function WordlessBook.Initialization()
	--sLuaApp:LuaDbg("WordlessBook.Initialization")
	for k,v in pairs(WordlessBook.Config) do
		local i = 1
		while v['Mission_'..i] do
			local monID = v['Mission_'..i].ShowMonster
			local monData = MonsterConfig.GetByIdLevel(monID,1)
			if monData then
				v['Mission_'..i].MonId = monData.Model
				v['Mission_'..i].MonName = monData.Name
				v['Mission_'..i].Scale = monData.Scale
			end
			if v['Mission_'..i].Over_Reward then
				if v['Mission_'..i].Over_Reward.PetList then
					Lua_tools.RegisterPets(v['Mission_'..i].Over_Reward.PetList)
				end
			end
			if v['Mission_'..i].Rare_Reward then
				for a,b in ipairs(v['Mission_'..i].Rare_Reward) do
					if b.Pet then
						--sLuaApp:LuaDbg("尝试注册宠物" .. b.Pet)
						Lua_tools.RegisterPets({b.Pet})
					end
				end
			end
			i = i + 1
		end
	end
end