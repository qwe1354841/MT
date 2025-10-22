--水帘洞窟配置
ShuiLianDongConfig = {}

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
	--MonID 对应怪物组id 与npcid不是同一个
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
ShuiLianDongConfig.ContinueTime = 180

--活动跳转点
ShuiLianDongConfig.EnterPos = {"花果山", 116, 86, 4, "秘境3_开启"}

--退出点
ShuiLianDongConfig.QuitPos = {"花果山", 120, 88, 4}

--参加次数上限
ShuiLianDongConfig.JoinMax = 0

--单层获得活跃值
ShuiLianDongConfig.ActiveAddNum = 0

--活跃值上限
ShuiLianDongConfig.ActiveMax = 0

--Dungeon描述
ShuiLianDongConfig.ShowDesc = "听说水帘洞中最近不太平，快去瞧瞧究竟是怎么回事吧。"

--Dungeon背景图
ShuiLianDongConfig.ShowPic = "1800600720"

--地图表 流程表
ShuiLianDongConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "秘境-水帘洞窟一层", 
		["Movie"] = "90715",
		["BornPoint"] = {41, 98, 1},
		["Step_0"] = {
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "少侠，请前往(41,98)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_1"},
			--AddTips = {Message = "这水帘洞窟是各路捉妖者的封妖之地，平时都是大门紧闭，封印重重。小小强盗怎能进入，莫非那道士在骗我？", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境3_1_1", X = 41, Y = 98, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(95,104)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_2"},
			AddNPC = {
				{KeyName = "秘境3_1_2", X = 95, Y = 104, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_1", Del_Num = -1},--  全删 -1
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(81,70)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_3"},
			AddNPC = {
				{KeyName = "秘境3_1_3", X = 81, Y = 70, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_2", Del_Num = -1},--  全删 -1
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(58,36)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_4"},
			AddNPC = {
				{KeyName = "秘境3_1_4", X = 58, Y = 36, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_3", Del_Num = -1},--  全删 -1
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(121,53)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_5"},
			AddNPC = {
				{KeyName = "秘境3_1_5", X = 121, Y = 53, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_4", Del_Num = -1},--  全删 -1
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(163,40)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_6"},
			AddNPC = {
				{KeyName = "秘境3_1_6", X = 163, Y = 40, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_5", Del_Num = -1},--  全删 -1
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(151,73)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_7"},
			AddNPC = {
				{KeyName = "秘境3_1_7", X = 151, Y = 73, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_6", Del_Num = -1},--  全删 -1
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(156,79)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_1_8"},
			AddNPC = {
				{KeyName = "秘境3_1_8", X = 156, Y = 79, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_7", Del_Num = -1},--  全删 -1
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(168,99)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_1_9"},
			AddNPC = {
				{KeyName = "秘境3_1_9", X = 168, Y = 99, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励吧", QuestMode = "Open", QuestAim = "秘境宝箱1"},
			AddNPC = {
				{KeyName = "秘境宝箱1", X = 168, Y = 99, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_1_9", Del_Num = -1},
			},
		},
	},
	[2] = {
		["MapKeyName"] = "秘境-水帘洞窟二层", 
		["Movie"] = "90716",
		["BornPoint"] = {30, 61, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(30,61)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_1"},
			--AddTips = {Message = "这水帘洞窟二层的小妖真弱，看来是塔内的妖气汇聚而生的。", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境3_2_1", X = 30, Y = 61, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(51,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_2"},
			AddNPC = {
				{KeyName = "秘境3_2_2", X = 51, Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(50,103)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_3"},
			AddNPC = {
				{KeyName = "秘境3_2_3", X = 50, Y = 103, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(82,110)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_4"},
			AddNPC = {
				{KeyName = "秘境3_2_4", X = 82, Y = 110, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(118,66)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_5"},
			AddNPC = {
				{KeyName = "秘境3_2_5", X = 118, Y = 66, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(105,23)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_6"},
			AddNPC = {
				{KeyName = "秘境3_2_6", X = 105, Y = 23, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(160,38)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_7"},
			AddNPC = {
				{KeyName = "秘境3_2_7", X = 160, Y = 38, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(181,79)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_2_8"},
			AddNPC = {
				{KeyName = "秘境3_2_8", X = 181, Y = 79, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(156,105)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_2_9"},
			AddNPC = {
				{KeyName = "秘境3_2_9", X = 156, Y = 105, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱2"},
			AddNPC = {
				{KeyName = "秘境宝箱2", X = 156, Y = 105, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_2_9", Del_Num = -1},
			},
		},
	},
	[3] = {
		["MapKeyName"] = "秘境-水帘洞窟三层", 
		["Movie"] = "90717",
		["BornPoint"] = {33, 48, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(33,48)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_1"},
			AddNPC = {
				{KeyName = "秘境3_3_1", X = 33, Y = 48, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(64,30)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_2"},
			AddNPC = {
				{KeyName = "秘境3_3_2", X = 64, Y = 30, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(154,39)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_3"},
			AddNPC = {
				{KeyName = "秘境3_3_3", X = 154, Y = 39, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(143,74)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_4"},
			AddNPC = {
				{KeyName = "秘境3_3_4", X = 143, Y = 74, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(168,90)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_5"},
			AddNPC = {
				{KeyName = "秘境3_3_5", X = 168, Y = 90, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(129,99)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_6"},
			AddNPC = {
				{KeyName = "秘境3_3_6", X = 129, Y = 99, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(95,67)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_7"},
			AddNPC = {
				{KeyName = "秘境3_3_7", X = 95, Y = 67, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(59,87)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_3_8"},
			AddNPC = {
				{KeyName = "秘境3_3_8", X = 59, Y = 87, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(56,112)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_3_9"},
			AddNPC = {
				{KeyName = "秘境3_3_9", X = 56, Y = 112, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱3"},
			AddNPC = {
				{KeyName = "秘境宝箱3", X = 56, Y = 112, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_3_9", Del_Num = -1},
			},
		},
	},
	[4] = {
		["MapKeyName"] = "秘境-水帘洞窟四层", 
		["Movie"] = "90718",
		["BornPoint"] = {171, 50, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(171,50)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_1"},
			AddNPC = {
				{KeyName = "秘境3_4_1", X = 171, Y = 50, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(130,38)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_2"},
			AddNPC = {
				{KeyName = "秘境3_4_2", X = 130, Y = 38, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(93,24)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_3"},
			AddNPC = {
				{KeyName = "秘境3_4_3", X = 93, Y = 24, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(42,35)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_4"},
			AddNPC = {
				{KeyName = "秘境3_4_4", X = 42, Y = 35, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(68,62)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_5"},
			AddNPC = {
				{KeyName = "秘境3_4_5", X = 68, Y = 62, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(20,82)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_6"},
			AddNPC = {
				{KeyName = "秘境3_4_6", X = 20, Y = 82, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(96,101)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_7"},
			AddNPC = {
				{KeyName = "秘境3_4_7", X = 96, Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(141,93)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_4_8"},
			AddNPC = {
				{KeyName = "秘境3_4_8", X = 141, Y = 93, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(159,108)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_4_9"},
			AddNPC = {
				{KeyName = "秘境3_4_9", X = 159, Y = 108, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱4"},
			AddNPC = {
				{KeyName = "秘境宝箱4", X = 159, Y = 108, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_4_9", Del_Num = -1},
			},
		},
	},
	[5] = {
		["MapKeyName"] = "秘境-水帘洞窟五层", 
		["Movie"] = "90719",
		["BornPoint"] = {29, 47, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(29,47)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_1"},
			AddNPC = {
				{KeyName = "秘境3_5_1", X = 29, Y = 47, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(65,28)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_2"},
			AddNPC = {
				{KeyName = "秘境3_5_2", X = 65, Y = 28, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(103,48)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_3"},
			AddNPC = {
				{KeyName = "秘境3_5_3", X = 103, Y = 48, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(38,81)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_4"},
			AddNPC = {
				{KeyName = "秘境3_5_4", X = 38, Y = 81, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(42,107)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_5"},
			AddNPC = {
				{KeyName = "秘境3_5_5", X = 42, Y = 107, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(89,112)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_6"},
			AddNPC = {
				{KeyName = "秘境3_5_6", X = 89, Y = 112, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(125,95)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_7"},
			AddNPC = {
				{KeyName = "秘境3_5_7", X = 125, Y = 95, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(163,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_5_8"},
			AddNPC = {
				{KeyName = "秘境3_5_8", X = 163, Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(177,51)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_5_9"},
			AddNPC = {
				{KeyName = "秘境3_5_9", X = 177, Y = 51, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱5"},
			AddNPC = {
				{KeyName = "秘境宝箱5", X = 177, Y = 51, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_5_9", Del_Num = -1},
			},
		},
	},
	[6] = {
		["MapKeyName"] = "秘境-水帘洞窟六层", 
		["Movie"] = "90720",
		["BornPoint"] = {35, 100, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(35,100)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_1"},
			AddNPC = {
				{KeyName = "秘境3_6_1", X = 35, Y = 100, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(57,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_2"},
			AddNPC = {
				{KeyName = "秘境3_6_2", X = 57, Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(94,97)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_3"},
			AddNPC = {
				{KeyName = "秘境3_6_3", X = 94, Y = 97, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(135,101)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_4"},
			AddNPC = {
				{KeyName = "秘境3_6_4", X = 135, Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(162,88)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_5"},
			AddNPC = {
				{KeyName = "秘境3_6_5", X = 162, Y = 88, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(158,55)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_6"},
			AddNPC = {
				{KeyName = "秘境3_6_6", X = 158, Y = 55, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(120,36)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_7"},
			AddNPC = {
				{KeyName = "秘境3_6_7", X = 120, Y = 36, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(53,36)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_6_8"},
			AddNPC = {
				{KeyName = "秘境3_6_8", X = 53, Y = 36, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(23,37)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_6_9"},
			AddNPC = {
				{KeyName = "秘境3_6_9", X = 23, Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱6"},
			AddNPC = {
				{KeyName = "秘境宝箱6", X = 23, Y = 37, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_6_9", Del_Num = -1},
			},
		},
	},
	[7] = {
		["MapKeyName"] = "秘境-水帘洞窟七层", 
		["Movie"] = "90721",
		["BornPoint"] = {34, 60, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(34,60)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_1"},
			AddNPC = {
				{KeyName = "秘境3_7_1", X = 34, Y = 60, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(69,32)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_2"},
			AddNPC = {
				{KeyName = "秘境3_7_2", X = 69, Y = 32, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(138,38)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_3"},
			AddNPC = {
				{KeyName = "秘境3_7_3", X = 138, Y = 38, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(169,54)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_4"},
			AddNPC = {
				{KeyName = "秘境3_7_4", X = 169, Y = 54, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(166,90)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_5"},
			AddNPC = {
				{KeyName = "秘境3_7_5", X = 166, Y = 90, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(119,110)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_6"},
			AddNPC = {
				{KeyName = "秘境3_7_6", X = 119, Y = 110, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(75,115)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_7"},
			AddNPC = {
				{KeyName = "秘境3_7_7", X = 75, Y = 115, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(69,73)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境3_7_8"},
			AddNPC = {
				{KeyName = "秘境3_7_8", X = 69, Y = 73, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(97,60)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境3_7_9"},
			AddNPC = {
				{KeyName = "秘境3_7_9", X = 97, Y = 60, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱7"},
			AddNPC = {
				{KeyName = "秘境宝箱7", X = 97, Y = 60, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境3_7_9", Del_Num = -1},
			},
		},
	},
}

--NPC配置表
ShuiLianDongConfig.NPCConfig = {
	["秘境3_1_1"] = {
		["MonID"] = 33127,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_1_2"] = {
		["MonID"] = 33128,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_1_3"] = {
		["MonID"] = 33129,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_1_4"] = {
		["MonID"] = 33130,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_1_5"] = {
		["MonID"] = 33131,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_1_6"] = {
		["MonID"] = 33132,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_1_7"] = {
		["MonID"] = 33133,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_1_8"] = {
		["MonID"] = 33134,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_1_9"] = {
		["MonID"] = 33135,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱1"] = {
		["MonID"] = 33135,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 2,
	},
	
	["秘境3_2_1"] = {
		["MonID"] = 33136,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_2_2"] = {
		["MonID"] = 33137,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_2_3"] = {
		["MonID"] = 33138,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_2_4"] = {
		["MonID"] = 33139,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_2_5"] = {
		["MonID"] = 33140,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_2_6"] = {
		["MonID"] = 33141,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_2_7"] = {
		["MonID"] = 33142,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_2_8"] = {
		["MonID"] = 33143,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_2_9"] = {
		["MonID"] = 33144,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱2"] = {
		["MonID"] = 33144,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 3,
	},
	
	["秘境3_3_1"] = {
		["MonID"] = 33145,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_3_2"] = {
		["MonID"] = 33146,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_3_3"] = {
		["MonID"] = 33147,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_3_4"] = {
		["MonID"] = 33148,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_3_5"] = {
		["MonID"] = 33149,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_3_6"] = {
		["MonID"] = 33150,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_3_7"] = {
		["MonID"] = 33151,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_3_8"] = {
		["MonID"] = 33152,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_3_9"] = {
		["MonID"] = 33153,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱3"] = {
		["MonID"] = 33153,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 4,
	},
	
	["秘境3_4_1"] = {
		["MonID"] = 33154,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_4_2"] = {
		["MonID"] = 33155,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_4_3"] = {
		["MonID"] = 33156,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_4_4"] = {
		["MonID"] = 33157,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_4_5"] = {
		["MonID"] = 33158,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_4_6"] = {
		["MonID"] = 33159,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_4_7"] = {
		["MonID"] = 33160,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_4_8"] = {
		["MonID"] = 33161,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_4_9"] = {
		["MonID"] = 33162,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱4"] = {
		["MonID"] = 33162,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 5,
	},
	
	["秘境3_5_1"] = {
		["MonID"] = 33163,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_5_2"] = {
		["MonID"] = 33164,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_5_3"] = {
		["MonID"] = 33165,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_5_4"] = {
		["MonID"] = 33166,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_5_5"] = {
		["MonID"] = 33167,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_5_6"] = {
		["MonID"] = 33168,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_5_7"] = {
		["MonID"] = 33169,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_5_8"] = {
		["MonID"] = 33170,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_5_9"] = {
		["MonID"] = 33171,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱5"] = {
		["MonID"] = 33171,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 6,
	},
	
	["秘境3_6_1"] = {
		["MonID"] = 33172,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_6_2"] = {
		["MonID"] = 33173,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_6_3"] = {
		["MonID"] = 33174,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_6_4"] = {
		["MonID"] = 33175,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_6_5"] = {
		["MonID"] = 33176,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_6_6"] = {
		["MonID"] = 33177,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_6_7"] = {
		["MonID"] = 33178,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_6_8"] = {
		["MonID"] = 33179,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_6_9"] = {
		["MonID"] = 33180,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱6"] = {
		["MonID"] = 33180,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 7,
	},
	
	["秘境3_7_1"] = {
		["MonID"] = 33181,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境3_7_2"] = {
		["MonID"] = 33182,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境3_7_3"] = {
		["MonID"] = 33183,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境3_7_4"] = {
		["MonID"] = 33184,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境3_7_5"] = {
		["MonID"] = 33185,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境3_7_6"] = {
		["MonID"] = 33186,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境3_7_7"] = {
		["MonID"] = 33187,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境3_7_8"] = {
		["MonID"] = 33188,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境3_7_9"] = {
		["MonID"] = 33189,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱7"] = {
		["MonID"] = 33189,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 0,
	},
	
}

--NPC对话表
ShuiLianDongConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["秘境3_1_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_1_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_1_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_1_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_1_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_1_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_1_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_1_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_1_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "没错，又是我们姐妹花。", NextTalk = -1, NextStep = -1,}, 
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
			["秘境3_2_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_2_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_2_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_2_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_2_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_2_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_2_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_2_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_2_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "一剑，一命。", NextTalk = -1, NextStep = -1,}, 
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
			["秘境3_3_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_3_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_3_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_3_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_3_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_3_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_3_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_3_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_3_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我是谁，我在哪，我要做什么？", NextTalk = -1, NextStep = -1,}, 
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
			["秘境3_4_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_4_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_4_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_4_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_4_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_4_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_4_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_4_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_4_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "谁敢比我们萌！", NextTalk = -1, NextStep = -1,}, 
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
			["秘境3_5_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_5_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_5_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_5_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_5_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_5_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_5_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_5_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_5_9"] ={
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
			["秘境3_6_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_6_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_6_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_6_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_6_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_6_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_6_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_6_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_6_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "怎么又是你们啊！别妨碍我做实验。", NextTalk = -1, NextStep = -1,}, 
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
			["秘境3_7_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "卖票了啊，5W金币一张，走过路过不要错过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境3_7_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "站住，查票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境3_7_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你看我干啥，休想让我买东西！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境3_7_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "先上车，后补票。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境3_7_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境3_7_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "黑心商人！！！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境3_7_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不买纪念品休想通过这里。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境3_7_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "泥嚎，要不要看看我们这里的特色产品呢？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境3_7_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "嗷嗷嗷！", NextTalk = -1, NextStep = -1,}, 
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
ShuiLianDongConfig.ShowItem = "20739,20738,20741,61024,61025"

--用于判断是否支持首通奖励配置，1为允许使用首通奖励，0为不允许 --是否已获得首通奖励根据 RewardConfig Key区分
ShuiLianDongConfig.FirstRewardSwitch = 1 

--进度/NPC奖励表  怪物npc打完给 宝箱直接给
ShuiLianDongConfig.RewardConfig = {
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
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["2_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["3_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["3_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["4_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["4_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["5_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["5_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["6_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["6_Step_9"] = {
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	["7_Step_8"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["7_Step_9"] = {
		['Item'] = {"SR礼包", 2, 0},
		['RandItemList']={},
	},
	
	
	--  默认奖励表
	["通用默认奖励配置表"] = {
		['Exp'] = "1660 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "1660 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "830 + 5*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"装备强化石",1,0},
		['RandItemList']={},
	},
	
	["通用默认奖励配置表First"] = {
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"大银币袋",1,0},
		['RandItemList']={},
	},
	--进度奖励
	["1_Step_2_First"] ={
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["2_Step_2_First"] ={
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["3_Step_2_First"] ={
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"R礼包", 3, 0},
		['RandItemList']={},
	},
	
	["4_Step_2_First"] ={
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",3,1},
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
		['Exp'] = "8300 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "8300 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "8300 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"SR礼包", 3, 0},
		['RandItemList']={},
	},
}

--用作备份，如有需要，把对应阶段放回RewardConfig中
ShuiLianDongConfig.BackupConfig = {
	
	
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