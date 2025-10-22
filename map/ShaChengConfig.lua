--沙城遗址配置
ShaChengConfig = {}

--地图表 流程表 MapConfig
	--地图keyname 按顺序跳地图
	--地图（副本）事件
--地图（副本）事件
	--添加npc	√	AddNPC 
	--删除npc	√	DelNPC
	--添加宝箱  √	AddNPC (Type = "Box")
	--添加tips	√	AddTips
	--给npc加召唤怪属性	 √ AddSummon (参数 被隐藏的坐标  被隐藏npc 现形距离   照明灯物品  照明灯npc  距离判断方式)
	--给多个npc添加共生属性 只要有一个怪活着 其他怪会无限复活 需要先AddNPC √ AddSymbiosis (参数 npckeyname列表  复活时间)
	
--NPC配置表 NPCConfig
	--MonID 对应怪物组id
	--WinTime 追踪条件数量 （如果QuestAim不是该npc则字段无意义）
	--WinRand 达成一次追踪条件的概率（如果QuestAim不是该npc则字段无意义）
	--NextStep 完成条件后跳转下一 Step（如果QuestAim不是该npc则字段无意义）
	--WinToDel 战斗胜利后 是否销毁npc
	--DestroyToNextFloor NPC摧毁后是否进入下一层 数字代表前往楼层，0代表退出秘境
	
--NPC对话表 NpcTalk
	-- 地图序号 => Step => NPCKeyName
	-- NextTalk 下一句对话 NextStep 下一进度 StartFight 是否战斗 NextFloor 下一层(0表示退出副本)

--进度/NPC奖励表 RewardConfig
	-- 默认奖励表 KeyName不可改
	-- 进度奖励 KeyName 规则 地图序号_进度(1_Step_0)
	-- NPC奖励 KeyName
	
--副本存在时间（分）
ShaChengConfig.ContinueTime = 180

--活动跳转点
ShaChengConfig.EnterPos = {"大唐境外", 84, 31, 10, "秘境2_开启"}

--退出点
ShaChengConfig.QuitPos = {"大唐境外", 89, 35, 10}

--参加次数上限
ShaChengConfig.JoinMax = 0

--单层获得活跃值
ShaChengConfig.ActiveAddNum = 0

--活跃值上限
ShaChengConfig.ActiveMax = 0

--Dungeon描述
ShaChengConfig.ShowDesc = "近来有魔气隐隐笼罩沙城遗址上空，快去调查一番吧。"

--Dungeon背景图
ShaChengConfig.ShowPic = "1800600710"

--地图表 流程表
ShaChengConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "秘境-砂城遗址一层", 
		["BornPoint"] = {116, 109, 0},
		["Step_0"] = {
			["Movie"] = "90708",
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "少侠，请前往(118,113)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_1"},
			--AddTips = {Message = "这沙城遗址是各路捉妖者的封妖之地，平时都是大门紧闭，封印重重。小小强盗怎能进入，莫非那道士在骗我？", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境2_1_1", X = 119 , Y = 112, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(106,77)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_2"},
			AddNPC = {
				{KeyName = "秘境2_1_2", X = 106 , Y = 77, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_1", Del_Num = -1},--  全删 -1
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(35,118)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_3"},
			AddNPC = {
				{KeyName = "秘境2_1_3", X = 35 , Y = 118, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_2", Del_Num = -1},--  全删 -1
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(17,70)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_4"},
			AddNPC = {
				{KeyName = "秘境2_1_4", X = 17 , Y = 70, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_3", Del_Num = -1},--  全删 -1
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(23,20)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_5"},
			AddNPC = {
				{KeyName = "秘境2_1_5", X = 23 , Y = 20, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_4", Del_Num = -1},--  全删 -1
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(89,31)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_6"},
			AddNPC = {
				{KeyName = "秘境2_1_6", X = 89 , Y = 31, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_5", Del_Num = -1},--  全删 -1
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(119,40)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_7"},
			AddNPC = {
				{KeyName = "秘境2_1_7", X = 119 , Y = 40, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_6", Del_Num = -1},--  全删 -1
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(108,47)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_1_8"},
			AddNPC = {
				{KeyName = "秘境2_1_8", X = 108 , Y = 47, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_7", Del_Num = -1},--  全删 -1
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(156,32)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_1_9"},
			AddNPC = {
				{KeyName = "秘境2_1_9", X = 156 , Y = 32, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励吧", QuestMode = "Open", QuestAim = "秘境宝箱1"},
			AddNPC = {
				{KeyName = "秘境宝箱1", X = 156 , Y = 32, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_1_9", Del_Num = -1},
			},
		},
	},
	[2] = {
		["MapKeyName"] = "秘境-砂城遗址二层", 
		["BornPoint"] = {43, 78, 0},
		["Step_0"] = {
			["Movie"] = "90709",
			Trace = {Desc = "少侠，请前往(46,81)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_1"},
			--AddTips = {Message = "这沙城遗址二层的小妖真弱，看来是塔内的妖气汇聚而生的。", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境2_2_1", X = 46 , Y = 81, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(74,111)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_2"},
			AddNPC = {
				{KeyName = "秘境2_2_2", X = 74 , Y = 111, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(124,101)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_3"},
			AddNPC = {
				{KeyName = "秘境2_2_3", X = 124 , Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(155,79)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_4"},
			AddNPC = {
				{KeyName = "秘境2_2_4", X = 155 , Y = 79, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(152,42)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_5"},
			AddNPC = {
				{KeyName = "秘境2_2_5", X = 152 , Y = 42, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(132,20)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_6"},
			AddNPC = {
				{KeyName = "秘境2_2_6", X = 132 , Y = 20, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(86,45)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_7"},
			AddNPC = {
				{KeyName = "秘境2_2_7", X = 86 , Y = 45, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(89,64)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_2_8"},
			AddNPC = {
				{KeyName = "秘境2_2_8", X = 89 , Y = 64, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(54,38)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_2_9"},
			AddNPC = {
				{KeyName = "秘境2_2_9", X = 54 , Y = 38, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱2"},
			AddNPC = {
				{KeyName = "秘境宝箱2", X = 54 , Y = 38, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_2_9", Del_Num = -1},
			},
		},
	},
	[3] = {
		["MapKeyName"] = "秘境-砂城遗址三层", 
		["BornPoint"] = {77, 36, 0},
		["Step_0"] = {
			["Movie"] = "90710",
			Trace = {Desc = "少侠，请前往(81,38)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_1"},
			AddNPC = {
				{KeyName = "秘境2_3_1", X = 80 , Y = 39, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(115,18)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_2"},
			AddNPC = {
				{KeyName = "秘境2_3_2", X = 115 , Y = 18, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(148,37)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_3"},
			AddNPC = {
				{KeyName = "秘境2_3_3", X = 148 , Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(153,73)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_4"},
			AddNPC = {
				{KeyName = "秘境2_3_4", X = 153 , Y = 73, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(137,98)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_5"},
			AddNPC = {
				{KeyName = "秘境2_3_5", X = 137 , Y = 98, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(77,104)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_6"},
			AddNPC = {
				{KeyName = "秘境2_3_6", X = 77 , Y = 104, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(29,107)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_7"},
			AddNPC = {
				{KeyName = "秘境2_3_7", X = 29 , Y = 107, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(43,72)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_3_8"},
			AddNPC = {
				{KeyName = "秘境2_3_8", X = 43 , Y = 72, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(27,60)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_3_9"},
			AddNPC = {
				{KeyName = "秘境2_3_9", X = 27 , Y = 60, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱3"},
			AddNPC = {
				{KeyName = "秘境宝箱3", X = 27 , Y = 60, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_3_9", Del_Num = -1},
			},
		},
	},
	[4] = {
		["MapKeyName"] = "秘境-砂城遗址四层", 
		["BornPoint"] = {27, 44, 0},
		["Step_0"] = {
			["Movie"] = "90711",
			Trace = {Desc = "少侠，请前往(30,47)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_1"},
			AddNPC = {
				{KeyName = "秘境2_4_1", X = 30 , Y = 47, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(44,28)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_2"},
			AddNPC = {
				{KeyName = "秘境2_4_2", X = 44 , Y = 28, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(104,26)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_3"},
			AddNPC = {
				{KeyName = "秘境2_4_3", X = 104 , Y = 26, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(153,33)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_4"},
			AddNPC = {
				{KeyName = "秘境2_4_4", X = 153 , Y = 33, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(136,59)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_5"},
			AddNPC = {
				{KeyName = "秘境2_4_5", X = 136 , Y = 59, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(151,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_6"},
			AddNPC = {
				{KeyName = "秘境2_4_6", X = 151 , Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(110,94)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_7"},
			AddNPC = {
				{KeyName = "秘境2_4_7", X = 110 , Y = 94, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(73,69)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_4_8"},
			AddNPC = {
				{KeyName = "秘境2_4_8", X = 73 , Y = 69, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(47,89)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_4_9"},
			AddNPC = {
				{KeyName = "秘境2_4_9", X = 47 , Y = 89, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱4"},
			AddNPC = {
				{KeyName = "秘境宝箱4", X = 47 , Y = 89, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_4_9", Del_Num = -1},
			},
		},
	},
	[5] = {
		["MapKeyName"] = "秘境-砂城遗址五层", 
		["BornPoint"] = {111, 116, 0},
		["Step_0"] = {
			["Movie"] = "90712",
			Trace = {Desc = "少侠，请前往(114,120)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_1"},
			AddNPC = {
				{KeyName = "秘境2_5_1", X = 114 , Y = 119, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(143,99)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_2"},
			AddNPC = {
				{KeyName = "秘境2_5_2", X = 143 , Y = 99, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(148,62)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_3"},
			AddNPC = {
				{KeyName = "秘境2_5_3", X = 148 , Y = 62, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(154,30)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_4"},
			AddNPC = {
				{KeyName = "秘境2_5_4", X = 154 , Y = 30, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(85,62)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_5"},
			AddNPC = {
				{KeyName = "秘境2_5_5", X = 85 , Y = 62, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(54,79)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_6"},
			AddNPC = {
				{KeyName = "秘境2_5_6", X = 54 , Y = 79, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(19,102)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_7"},
			AddNPC = {
				{KeyName = "秘境2_5_7", X = 19 , Y = 102, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(19,67)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_5_8"},
			AddNPC = {
				{KeyName = "秘境2_5_8", X = 19 , Y = 67, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(67,28)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_5_9"},
			AddNPC = {
				{KeyName = "秘境2_5_9", X = 67 , Y = 28, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱5"},
			AddNPC = {
				{KeyName = "秘境宝箱5", X = 67 , Y = 28, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_5_9", Del_Num = -1},
			},
		},
	},
	[6] = {
		["MapKeyName"] = "秘境-砂城遗址六层", 
		["BornPoint"] = {141, 25, 0},
		["Step_0"] = {
			["Movie"] = "90713",
			Trace = {Desc = "少侠，请前往(145,29)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_1"},
			AddNPC = {
				{KeyName = "秘境2_6_1", X = 144 , Y = 28, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(143,56)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_2"},
			AddNPC = {
				{KeyName = "秘境2_6_2", X = 143 , Y = 56, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(146,95)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_3"},
			AddNPC = {
				{KeyName = "秘境2_6_3", X = 146 , Y = 95, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(98,106)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_4"},
			AddNPC = {
				{KeyName = "秘境2_6_4", X = 98 , Y = 106, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(56,111)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_5"},
			AddNPC = {
				{KeyName = "秘境2_6_5", X = 56 , Y = 111, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(21,92)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_6"},
			AddNPC = {
				{KeyName = "秘境2_6_6", X = 21 , Y = 92, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(75,63)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_7"},
			AddNPC = {
				{KeyName = "秘境2_6_7", X = 75 , Y = 63, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(64,39)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_6_8"},
			AddNPC = {
				{KeyName = "秘境2_6_8", X = 64 , Y = 39, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(25,28)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_6_9"},
			AddNPC = {
				{KeyName = "秘境2_6_9", X = 25 , Y = 28, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱6"},
			AddNPC = {
				{KeyName = "秘境宝箱6", X = 25 , Y = 28, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_6_9", Del_Num = -1},
			},
		},
	},
	[7] = {
		["MapKeyName"] = "秘境-砂城遗址七层", 
		["BornPoint"] = {20, 29, 0},
		["Step_0"] = {
			["Movie"] = "90714",
			Trace = {Desc = "少侠，请前往(23,32)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_1"},
			AddNPC = {
				{KeyName = "秘境2_7_1", X = 23 , Y = 32, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(20,65)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_2"},
			AddNPC = {
				{KeyName = "秘境2_7_2", X = 20 , Y = 65, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(43,90)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_3"},
			AddNPC = {
				{KeyName = "秘境2_7_3", X = 43 , Y = 90, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(35,105)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_4"},
			AddNPC = {
				{KeyName = "秘境2_7_4", X = 35 , Y = 105, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(75,108)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_5"},
			AddNPC = {
				{KeyName = "秘境2_7_5", X = 75 , Y = 108, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(129,109)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_6"},
			AddNPC = {
				{KeyName = "秘境2_7_6", X = 129 , Y = 109, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(154,90)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_7"},
			AddNPC = {
				{KeyName = "秘境2_7_7", X = 154 , Y = 90, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(120,62)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境2_7_8"},
			AddNPC = {
				{KeyName = "秘境2_7_8", X = 120 , Y = 62, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(119,37)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境2_7_9"},
			AddNPC = {
				{KeyName = "秘境2_7_9", X = 119 , Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱7"},
			AddNPC = {
				{KeyName = "秘境宝箱7", X = 119 , Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境2_7_9", Del_Num = -1},
			},
		},
	},

}

--NPC配置表
ShaChengConfig.NPCConfig = {
	["秘境2_1_1"] = {
		["MonID"] = 33064,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_1_2"] = {
		["MonID"] = 33065,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_1_3"] = {
		["MonID"] = 33066,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_1_4"] = {
		["MonID"] = 33067,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_1_5"] = {
		["MonID"] = 33068,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_1_6"] = {
		["MonID"] = 33069,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_1_7"] = {
		["MonID"] = 33070,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_1_8"] = {
		["MonID"] = 33071,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_1_9"] = {
		["MonID"] = 33072,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱1"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 2,
	},
	
	["秘境2_2_1"] = {
		["MonID"] = 33073,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_2_2"] = {
		["MonID"] = 33074,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_2_3"] = {
		["MonID"] = 33075,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_2_4"] = {
		["MonID"] = 33076,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_2_5"] = {
		["MonID"] = 33077,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_2_6"] = {
		["MonID"] = 33078,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_2_7"] = {
		["MonID"] = 33079,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_2_8"] = {
		["MonID"] = 33080,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_2_9"] = {
		["MonID"] = 33081,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱2"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 3,
	},
	
	["秘境2_3_1"] = {
		["MonID"] = 33082,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_3_2"] = {
		["MonID"] = 33083,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_3_3"] = {
		["MonID"] = 33084,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_3_4"] = {
		["MonID"] = 33085,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_3_5"] = {
		["MonID"] = 33086,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_3_6"] = {
		["MonID"] = 33087,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_3_7"] = {
		["MonID"] = 33088,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_3_8"] = {
		["MonID"] = 33089,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_3_9"] = {
		["MonID"] = 33090,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱3"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 4,
	},
	
	["秘境2_4_1"] = {
		["MonID"] = 33091,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_4_2"] = {
		["MonID"] = 33092,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_4_3"] = {
		["MonID"] = 33093,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_4_4"] = {
		["MonID"] = 33094,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_4_5"] = {
		["MonID"] = 33095,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_4_6"] = {
		["MonID"] = 33096,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_4_7"] = {
		["MonID"] = 33097,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_4_8"] = {
		["MonID"] = 33098,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_4_9"] = {
		["MonID"] = 33099,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱4"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 5,
	},
	
	["秘境2_5_1"] = {
		["MonID"] = 33100,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_5_2"] = {
		["MonID"] = 33101,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_5_3"] = {
		["MonID"] = 33102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_5_4"] = {
		["MonID"] = 33103,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_5_5"] = {
		["MonID"] = 33104,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_5_6"] = {
		["MonID"] = 33105,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_5_7"] = {
		["MonID"] = 33106,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_5_8"] = {
		["MonID"] = 33107,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_5_9"] = {
		["MonID"] = 33108,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱5"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 6,
	},
	
	["秘境2_6_1"] = {
		["MonID"] = 33109,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_6_2"] = {
		["MonID"] = 33110,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_6_3"] = {
		["MonID"] = 33111,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_6_4"] = {
		["MonID"] = 33112,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_6_5"] = {
		["MonID"] = 33113,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_6_6"] = {
		["MonID"] = 33114,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_6_7"] = {
		["MonID"] = 33115,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_6_8"] = {
		["MonID"] = 33116,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_6_9"] = {
		["MonID"] = 33117,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱6"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 7,
	},
	
	["秘境2_7_1"] = {
		["MonID"] = 33118,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境2_7_2"] = {
		["MonID"] = 33119,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境2_7_3"] = {
		["MonID"] = 33120,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境2_7_4"] = {
		["MonID"] = 33121,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境2_7_5"] = {
		["MonID"] = 33122,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境2_7_6"] = {
		["MonID"] = 33123,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境2_7_7"] = {
		["MonID"] = 33124,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境2_7_8"] = {
		["MonID"] = 33125,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境2_7_9"] = {
		["MonID"] = 33126,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱7"] = {
		["MonID"] = 6102,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 0,
	},
	
}

--NPC对话表
ShaChengConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["秘境2_1_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "此山我们开，此树我们栽！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_1_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "就是你打伤了我们兄弟！？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_1_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能走到我的面前，你也算不错了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_1_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我和刚才那个只会说大话的可不一样！小心咯！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_1_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_1_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你会知道和我作对是多愚蠢的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_1_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_1_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_1_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "呵呵呵，我和我妹妹谁比较美呀？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱1"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "鱼唇的凡人，你吵到你大爷我睡觉了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[2] = {
		["Step_0"] = {
			["秘境2_2_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "这里怎么又个人类啊！？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_2_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你怎么进来的！？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_2_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "就是你打伤了我们兄弟！？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_2_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能走到我的面前，你也算不错了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_2_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我和刚才那个只会说大话的可不一样！小心咯！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_2_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_2_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你会知道和我作对是多愚蠢的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_2_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊！吃妖的人类啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_2_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[3] = {
		["Step_0"] = {
			["秘境2_3_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊人类！大家快跑！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_3_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠，我上有老下有小......您饶我一命吧！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_3_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我的肉可不好吃！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_3_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠请嘴下留情啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_3_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "曾经有一个善良的人类出现在我的面前，而我没有珍惜。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_3_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_3_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你就是那个吃妖的人类吗！看招！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_3_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能够走到这里，你也挺不错了，但是接下来休想再前进了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_3_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吃俺老孙一棒！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[4] = {
		["Step_0"] = {
			["秘境2_4_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊人类！大家快跑！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_4_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠，我上有老下有小......您饶我一命吧！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_4_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我的肉可不好吃！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_4_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠请嘴下留情啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_4_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "曾经有一个善良的人类出现在我的面前，而我没有珍惜。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_4_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_4_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你就是那个吃妖的人类吗！看招！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_4_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能够走到这里，你也挺不错了，但是接下来休想再前进了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_4_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我们是最萌的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[5] = {
		["Step_0"] = {
			["秘境2_5_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊人类！大家快跑！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_5_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠，我上有老下有小......您饶我一命吧！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_5_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我的肉可不好吃！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_5_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠请嘴下留情啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_5_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "曾经有一个善良的人类出现在我的面前，而我没有珍惜。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_5_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_5_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你就是那个吃妖的人类吗！看招！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_5_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能够走到这里，你也挺不错了，但是接下来休想再前进了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_5_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不动如山。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[6] = {
		["Step_0"] = {
			["秘境2_6_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊人类！大家快跑！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_6_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠，我上有老下有小......您饶我一命吧！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_6_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我的肉可不好吃！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_6_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠请嘴下留情啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_6_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "曾经有一个善良的人类出现在我的面前，而我没有珍惜。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_6_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_6_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你就是那个吃妖的人类吗！看招！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_6_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能够走到这里，你也挺不错了，但是接下来休想再前进了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_6_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "嘿嘿嘿，又有新的实验素材了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
	[7] = {
		["Step_0"] = {
			["秘境2_7_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "啊人类！大家快跑！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境2_7_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠，我上有老下有小......您饶我一命吧！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境2_7_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我的肉可不好吃！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境2_7_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "少侠请嘴下留情啊！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境2_7_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "曾经有个善良的人类出现在我的面前，而我没有珍惜。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境2_7_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境2_7_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你就是那个吃妖的人类吗！看招！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境2_7_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "能够走到这里，你也挺不错了，但是接下来休想再前进了！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境2_7_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "就是你，打伤了我的小弟们吗！？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["秘境宝箱7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喵~", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
}

--活动展示用
ShaChengConfig.ShowItem = "20739,20740,20741,61024,61025"

--用于判断是否支持首通奖励配置，1为允许使用首通奖励，0为不允许 --是否已获得首通奖励根据 RewardConfig Key区分
ShaChengConfig.FirstRewardSwitch = 1 

ShaChengConfig.RewardConfig = {
	--出副本物品怪
	--["秘境3_4_1"] = {
	--	--['Exp'] = "level * 10",
	--	--['MoneyType'] = 5,
	--	--['MoneyVal'] = {10, 20},
	--	['DungeonItem'] = {"火把",1,1},--副本物品
	--	['Item'] = {},
	--	['RandItemList']={},
	--},
	
	["1_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_9"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["2_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_9"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["3_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["3_Step_9"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["4_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["4_Step_9"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["5_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["5_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["6_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["6_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["7_Step_8"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["7_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	
	--  默认奖励表
	["通用默认奖励配置表"] = {
		['Exp'] = "1030 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1030 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "515 + 5*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"装备强化石",1,0},
		['RandItemList']={},
	},
	
	["通用默认奖励配置表First"] = {
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"大银币袋",1,0},
		['RandItemList']={},
	},
	--进度奖励
	["1_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["1_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["1_Step_9_First"] = {
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["2_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["2_Step_9_First"] = {
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["3_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["3_Step_9_First"] = {
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["4_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["4_Step_9_First"] = {
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["5_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["5_Step_9_First"] = {
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["6_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["6_Step_9_First"] = {
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["7_Step_2_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_5_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",2,1},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_8_First"] ={
		['Exp'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "5150 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["7_Step_9_First"] = {
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
}

--用作备份，如有需要，把对应阶段放回RewardConfig中
ShaChengConfig.BackupConfig = {
	
	["秘境宝箱1"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱2"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱3"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱4"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱5"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱6"] = {
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	["秘境宝箱7"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	--进度奖励
	["1_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["1_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["1_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["1_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["1_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	
	["2_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["2_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["2_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	
	["3_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["3_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["3_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["4_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["4_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["5_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["5_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["6_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["6_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_0"] ={
		['Exp'] = "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_0_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_1"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_1_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_2"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_2_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_3"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_3_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_4"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_4_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_5"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_5_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_6"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_6_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_7"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_7_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_8"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_8_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},
	["7_Step_9"] ={
		['Exp'] =  "400+ 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400+ 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"装备强化石",1,0,"宠物培养包",1,0,"1级宝石包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},	
				},
			},
		},
	},
	["7_Step_9_First"] ={
		['Exp'] = "level * 15000",
		["PetExp"] = "level * 15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {"大银币袋",10,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9800},
					--{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 200},
				},
			},
		},
	},

}

-- NPC事件表={

-- 3 = {必须杀掉某个前置npc 才能打这个npc }		×
-- 4 = {必须消耗某个物品(标记)才能打这个怪}	×
-- 5 = {npc存在会刷定时刷其他npc}----频道上体现		×
-- 6 = {npc会在频道上定时广播与玩家的距离}	×
-- 7 = {npc 定时移动}	×
-- 9 = {共死}	×
-- 10 = {打完该npc的前置怪 会对该npc+buff}	×
-- }