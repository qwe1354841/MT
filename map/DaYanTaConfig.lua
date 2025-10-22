--大雁塔配置
DaYanTaConfig = {}

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
DaYanTaConfig.ContinueTime = 180

--活动跳转点
DaYanTaConfig.EnterPos = {"长安城", 443, 56, 10, "秘境1_开启"}

--退出点
DaYanTaConfig.QuitPos = {"长安城", 379, 69, 10}

--参加次数上限
DaYanTaConfig.JoinMax = 0

--单层获得活跃值
DaYanTaConfig.ActiveAddNum = 0

--活跃值上限
DaYanTaConfig.ActiveMax = 0

--Dungeon描述
DaYanTaConfig.ShowDesc = "大雁塔灵气涣散吸引了八方的妖魔，快肩负起除魔卫道的重任吧。"

--Dungeon背景图
DaYanTaConfig.ShowPic = "1800600700"

--地图表 流程表
DaYanTaConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "秘境-大雁塔一层", 
		["Movie"] = "90701",
		["BornPoint"] = {75, 92, 1},
		["Step_0"] = {
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "少侠，请前往(75,92)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_1"},
			AddTips = {Message = "这大雁塔是各路捉妖者的封妖之地，平时都是大门紧闭，封印重重。小小强盗怎能进入，莫非那道士在骗我？", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境1_1_1", X = 75, Y = 92, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(112,113)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_2"},
			AddNPC = {
				{KeyName = "秘境1_1_2", X = 112, Y = 113, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_1", Del_Num = -1},--  全删 -1
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(149,94)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_3"},
			AddNPC = {
				{KeyName = "秘境1_1_3", X = 149, Y = 94, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_2", Del_Num = -1},--  全删 -1
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(120,81)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_4"},
			AddNPC = {
				{KeyName = "秘境1_1_4", X = 120, Y = 81, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_3", Del_Num = -1},--  全删 -1
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(73,56)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_5"},
			AddNPC = {
				{KeyName = "秘境1_1_5", X = 73, Y = 56, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_4", Del_Num = -1},--  全删 -1
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(52,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_6"},
			AddNPC = {
				{KeyName = "秘境1_1_6", X = 52, Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_5", Del_Num = -1},--  全删 -1
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(111,81)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_7"},
			AddNPC = {
				{KeyName = "秘境1_1_7", X = 111, Y = 81, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_6", Del_Num = -1},--  全删 -1
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(149,56)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_1_8"},
			AddNPC = {
				{KeyName = "秘境1_1_8", X = 149, Y = 56, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_7", Del_Num = -1},--  全删 -1
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(112,40)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_1_9"},
			AddNPC = {
				{KeyName = "秘境1_1_9", X = 112, Y = 40, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励吧", QuestMode = "Open", QuestAim = "秘境宝箱1"},
			AddNPC = {
				{KeyName = "秘境宝箱1", X = 112, Y = 40, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_1_9", Del_Num = -1},
			},
		},
	},
	[2] = {
		["MapKeyName"] = "秘境-大雁塔二层", 
		["Movie"] = "90702",
		["BornPoint"] = {107, 50, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(107,50)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_1"},
			AddTips = {Message = "这大雁塔二层的小妖真弱，看来是塔内的妖气汇聚而生的。", Color="#3CB371FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "秘境1_2_1", X = 107, Y = 50, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(71,52)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_2"},
			AddNPC = {
				{KeyName = "秘境1_2_2", X = 71, Y = 52, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(46,67)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_3"},
			AddNPC = {
				{KeyName = "秘境1_2_3", X = 46, Y = 67, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(22,79)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_4"},
			AddNPC = {
				{KeyName = "秘境1_2_4", X = 22, Y = 79, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(81,105)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_5"},
			AddNPC = {
				{KeyName = "秘境1_2_5", X = 81, Y = 105, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(121,116)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_6"},
			AddNPC = {
				{KeyName = "秘境1_2_6", X = 121, Y = 116, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(110,86)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_7"},
			AddNPC = {
				{KeyName = "秘境1_2_7", X = 110, Y = 86, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(149,101)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_2_8"},
			AddNPC = {
				{KeyName = "秘境1_2_8", X = 149, Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(160,63)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_2_9"},
			AddNPC = {
				{KeyName = "秘境1_2_9", X = 160, Y = 63, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱2"},
			AddNPC = {
				{KeyName = "秘境宝箱2", X = 160, Y = 63, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_2_9", Del_Num = -1},
			},
		},
	},
	[3] = {
		["MapKeyName"] = "秘境-大雁塔三层", 
		["Movie"] = "90703",
		["BornPoint"] = {172, 65, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(172,65)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_1"},
			AddNPC = {
				{KeyName = "秘境1_3_1", X = 172, Y = 65, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(151,81)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_2"},
			AddNPC = {
				{KeyName = "秘境1_3_2", X = 151, Y = 81, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(111,40)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_3"},
			AddNPC = {
				{KeyName = "秘境1_3_3", X = 111, Y = 40, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(83,63)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_4"},
			AddNPC = {
				{KeyName = "秘境1_3_4", X = 83, Y = 63, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(100,82)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_5"},
			AddNPC = {
				{KeyName = "秘境1_3_5", X = 100, Y = 82, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(115,101)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_6"},
			AddNPC = {
				{KeyName = "秘境1_3_6", X = 115, Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(77,87)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_7"},
			AddNPC = {
				{KeyName = "秘境1_3_7", X = 77, Y = 87, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(39,67)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_3_8"},
			AddNPC = {
				{KeyName = "秘境1_3_8", X = 39, Y = 67, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(67,50)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_3_9"},
			AddNPC = {
				{KeyName = "秘境1_3_9", X = 67, Y = 50, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱3"},
			AddNPC = {
				{KeyName = "秘境宝箱3", X = 67, Y = 50, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_3_9", Del_Num = -1},
			},
		},
	},
	[4] = {
		["MapKeyName"] = "秘境-大雁塔四层", 
		["Movie"] = "90704",
		["BornPoint"] = {42, 69, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(42,69)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_1"},
			AddNPC = {
				{KeyName = "秘境1_4_1", X = 42, Y = 69, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(69,83)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_2"},
			AddNPC = {
				{KeyName = "秘境1_4_2", X = 69, Y = 83, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(115,65)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_3"},
			AddNPC = {
				{KeyName = "秘境1_4_3", X = 115, Y = 65, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(115,106)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_4"},
			AddNPC = {
				{KeyName = "秘境1_4_4", X = 115, Y = 106, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(141,93)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_5"},
			AddNPC = {
				{KeyName = "秘境1_4_5", X = 141, Y = 93, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(165,80)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_6"},
			AddNPC = {
				{KeyName = "秘境1_4_6", X = 165, Y = 80, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(162,60)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_7"},
			AddNPC = {
				{KeyName = "秘境1_4_7", X = 162, Y = 60, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(136,47)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_4_8"},
			AddNPC = {
				{KeyName = "秘境1_4_8", X = 136, Y = 47, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(110,34)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_4_9"},
			AddNPC = {
				{KeyName = "秘境1_4_9", X = 110, Y = 34, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱4"},
			AddNPC = {
				{KeyName = "秘境宝箱4", X = 110, Y = 34, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_4_9", Del_Num = -1},
			},
		},
	},
	[5] = {
		["MapKeyName"] = "秘境-大雁塔五层", 
		["Movie"] = "90705",
		["BornPoint"] = {59, 53, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(59,53)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_1"},
			AddNPC = {
				{KeyName = "秘境1_5_1", X = 59, Y = 53, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(35,69)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_2"},
			AddNPC = {
				{KeyName = "秘境1_5_2", X = 35, Y = 69, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(70,86)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_3"},
			AddNPC = {
				{KeyName = "秘境1_5_3", X = 70, Y = 86, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(94,66)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_4"},
			AddNPC = {
				{KeyName = "秘境1_5_4", X = 94, Y = 66, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(109,58)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_5"},
			AddNPC = {
				{KeyName = "秘境1_5_5", X = 109, Y = 58, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(117,43)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_6"},
			AddNPC = {
				{KeyName = "秘境1_5_6", X = 117, Y = 43, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(144,67)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_7"},
			AddNPC = {
				{KeyName = "秘境1_5_7", X = 144, Y = 67, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(128,84)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_5_8"},
			AddNPC = {
				{KeyName = "秘境1_5_8", X = 128, Y = 84, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(101,101)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_5_9"},
			AddNPC = {
				{KeyName = "秘境1_5_9", X = 101, Y = 101, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱5"},
			AddNPC = {
				{KeyName = "秘境宝箱5", X = 101, Y = 101, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_5_9", Del_Num = -1},
			},
		},
	},
	[6] = {
		["MapKeyName"] = "秘境-大雁塔六层", 
		["Movie"] = "90706",
		["BornPoint"] = {76, 86, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(76,86)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_1"},
			AddNPC = {
				{KeyName = "秘境1_6_1", X = 76, Y = 86, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(57,76)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_2"},
			AddNPC = {
				{KeyName = "秘境1_6_2", X = 57, Y = 76, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(37,66)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_3"},
			AddNPC = {
				{KeyName = "秘境1_6_3", X = 37, Y = 66, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(97,64)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_4"},
			AddNPC = {
				{KeyName = "秘境1_6_4", X = 97, Y = 64, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(131,69)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_5"},
			AddNPC = {
				{KeyName = "秘境1_6_5", X = 131, Y = 69, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(121,43)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_6"},
			AddNPC = {
				{KeyName = "秘境1_6_6", X = 121, Y = 43, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(98,51)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_7"},
			AddNPC = {
				{KeyName = "秘境1_6_7", X = 98, Y = 51, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(65,46)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_6_8"},
			AddNPC = {
				{KeyName = "秘境1_6_8", X = 65, Y = 46, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(89,33)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_6_9"},
			AddNPC = {
				{KeyName = "秘境1_6_9", X = 89, Y = 33, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱6"},
			AddNPC = {
				{KeyName = "秘境宝箱6", X = 89, Y = 33, Range = 3, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_6_9", Del_Num = -1},
			},
		},
	},
	[7] = {
		["MapKeyName"] = "秘境-大雁塔七层", 
		["Movie"] = "90707",
		["BornPoint"] = {55, 35, 1},
		["Step_0"] = {
			Trace = {Desc = "少侠，请前往(55,35)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_1"},
			AddNPC = {
				{KeyName = "秘境1_7_1", X = 55, Y = 35, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			Trace = {Desc = "少侠，请前往(32,46)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_2"},
			AddNPC = {
				{KeyName = "秘境1_7_2", X = 32, Y = 46, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_1", Del_Num = -1},
			},
		},
		["Step_2"] = {
			Trace = {Desc = "少侠，请前往(48,59)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_3"},
			AddNPC = {
				{KeyName = "秘境1_7_3", X = 48, Y = 59, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_2", Del_Num = -1},
			},
		},
		["Step_3"] = {
			Trace = {Desc = "少侠，请前往(69,72)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_4"},
			AddNPC = {
				{KeyName = "秘境1_7_4", X = 69, Y = 72, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_3", Del_Num = -1},
			},
		},
		["Step_4"] = {
			Trace = {Desc = "少侠，请前往(104,66)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_5"},
			AddNPC = {
				{KeyName = "秘境1_7_5", X = 104, Y = 66, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_4", Del_Num = -1},
			},
		},
		["Step_5"] = {
			Trace = {Desc = "少侠，请前往(134,51)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_6"},
			AddNPC = {
				{KeyName = "秘境1_7_6", X = 134, Y = 51, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_5", Del_Num = -1},
			},
		},
		["Step_6"] = {
			Trace = {Desc = "少侠，请前往(85,54)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_7"},
			AddNPC = {
				{KeyName = "秘境1_7_7", X = 85, Y = 54, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_6", Del_Num = -1},
			},
		},
		["Step_7"] = {
			Trace = {Desc = "少侠，请前往(93,27)消灭$Aim1，奖励多多哦。", QuestMode = "Fight", QuestAim = "秘境1_7_8"},
			AddNPC = {
				{KeyName = "秘境1_7_8", X = 93, Y = 27, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_7", Del_Num = -1},
			},
		},
		["Step_8"] = {
			Trace = {Desc = "妖气似乎一下子变重了！请少侠前往(108,37)消灭$Aim1！务必小心哦", QuestMode = "Fight", QuestAim = "秘境1_7_9"},
			AddNPC = {
				{KeyName = "秘境1_7_9", X = 108, Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_8", Del_Num = -1},
			},
		},
		["Step_9"] = {
			Trace = {Desc = "恭喜少侠击败秘境怪物，赶紧去打开$Aim1获取你应有的奖励，然后去往下一层吧", QuestMode = "Open", QuestAim = "秘境宝箱7"},
			AddNPC = {
				{KeyName = "秘境宝箱7", X = 108, Y = 37, Range = 1, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "秘境1_7_9", Del_Num = -1},
			},
		},
	},
}

--NPC配置表
DaYanTaConfig.NPCConfig = {
	["秘境1_1_1"] = {
		["MonID"] = 33001,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_1_2"] = {
		["MonID"] = 33002,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_1_3"] = {
		["MonID"] = 33003,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_1_4"] = {
		["MonID"] = 33004,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_1_5"] = {
		["MonID"] = 33005,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_1_6"] = {
		["MonID"] = 33006,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_1_7"] = {
		["MonID"] = 33007,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_1_8"] = {
		["MonID"] = 33008,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_1_9"] = {
		["MonID"] = 33009,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱1"] = {
		["MonID"] = 33009,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 2,
	},
	
	["秘境1_2_1"] = {
		["MonID"] = 33010,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_2_2"] = {
		["MonID"] = 33011,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_2_3"] = {
		["MonID"] = 33012,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_2_4"] = {
		["MonID"] = 33013,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_2_5"] = {
		["MonID"] = 33014,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_2_6"] = {
		["MonID"] = 33015,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_2_7"] = {
		["MonID"] = 33016,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_2_8"] = {
		["MonID"] = 33017,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_2_9"] = {
		["MonID"] = 33018,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱2"] = {
		["MonID"] = 33018,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 3,
	},
	
	["秘境1_3_1"] = {
		["MonID"] = 33019,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_3_2"] = {
		["MonID"] = 33020,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_3_3"] = {
		["MonID"] = 33021,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_3_4"] = {
		["MonID"] = 33022,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_3_5"] = {
		["MonID"] = 33023,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_3_6"] = {
		["MonID"] = 33024,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_3_7"] = {
		["MonID"] = 33025,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_3_8"] = {
		["MonID"] = 33026,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_3_9"] = {
		["MonID"] = 33027,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱3"] = {
		["MonID"] = 33027,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 4,
	},
	
	["秘境1_4_1"] = {
		["MonID"] = 33028,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_4_2"] = {
		["MonID"] = 33029,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_4_3"] = {
		["MonID"] = 33030,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_4_4"] = {
		["MonID"] = 33031,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_4_5"] = {
		["MonID"] = 33032,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_4_6"] = {
		["MonID"] = 33033,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_4_7"] = {
		["MonID"] = 33034,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_4_8"] = {
		["MonID"] = 33035,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_4_9"] = {
		["MonID"] = 33036,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱4"] = {
		["MonID"] = 33036,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 5,
	},
	
	["秘境1_5_1"] = {
		["MonID"] = 33037,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_5_2"] = {
		["MonID"] = 33038,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_5_3"] = {
		["MonID"] = 33039,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_5_4"] = {
		["MonID"] = 33040,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_5_5"] = {
		["MonID"] = 33041,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_5_6"] = {
		["MonID"] = 33042,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_5_7"] = {
		["MonID"] = 33043,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_5_8"] = {
		["MonID"] = 33044,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_5_9"] = {
		["MonID"] = 33045,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱5"] = {
		["MonID"] = 33045,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 6,
	},
	
	["秘境1_6_1"] = {
		["MonID"] = 33046,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_6_2"] = {
		["MonID"] = 33047,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_6_3"] = {
		["MonID"] = 33048,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_6_4"] = {
		["MonID"] = 33049,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_6_5"] = {
		["MonID"] = 33050,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_6_6"] = {
		["MonID"] = 33051,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_6_7"] = {
		["MonID"] = 33052,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_6_8"] = {
		["MonID"] = 33053,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_6_9"] = {
		["MonID"] = 33054,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱6"] = {
		["MonID"] = 33054,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 7,
	},
	
	["秘境1_7_1"] = {
		["MonID"] = 33055,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	["秘境1_7_2"] = {
		["MonID"] = 33056,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	["秘境1_7_3"] = {
		["MonID"] = 33057,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	["秘境1_7_4"] = {
		["MonID"] = 33058,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	["秘境1_7_5"] = {
		["MonID"] = 33059,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
	["秘境1_7_6"] = {
		["MonID"] = 33060,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 6,
		["WinToDel"] = 1,
	},
	["秘境1_7_7"] = {
		["MonID"] = 33061,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 7,
		["WinToDel"] = 1,
	},
	["秘境1_7_8"] = {
		["MonID"] = 33062,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	["秘境1_7_9"] = {
		["MonID"] = 33063,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	["秘境宝箱7"] = {
		["MonID"] = 33063,
		["WinTime"] = 1,
		["WinRand"] = 10000,  
		["NextStep"] = 10,
		["WinToDel"] = 1,
		["DestroyToNextFloor"] = 0,
	},
	
}

--NPC对话表
DaYanTaConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["秘境1_1_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_1_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_1_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_1_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_1_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_1_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_1_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_1_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只她了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_1_9"] ={
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
			["秘境1_2_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_2_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_2_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_2_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_2_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_2_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_2_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_2_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_2_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "败敌，只需一击足以。", NextTalk = -1, NextStep = -1,}, 
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
			["秘境1_3_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_3_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_3_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_3_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_3_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_3_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_3_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_3_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_3_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "有他无我，有我无他！", NextTalk = -1, NextStep = -1,}, 
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
			["秘境1_4_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_4_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_4_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_4_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_4_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_4_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_4_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_4_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_4_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我是游戏里最萌的！", NextTalk = -1, NextStep = -1,}, 
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
			["秘境1_5_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_5_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_5_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_5_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_5_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_5_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_5_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_5_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_5_9"] ={
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
			["秘境1_6_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_6_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_6_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_6_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_6_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_6_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_6_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_6_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_6_9"] ={
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
			["秘境1_7_1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "看啊，又有个傻子来送死了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["秘境1_7_2"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "吼吼吼！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["秘境1_7_3"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哎呦，不错哦！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["秘境1_7_4"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不错嘛，居然能走到我的面前！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["秘境1_7_5"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "之前的那些只是热身，你准备好了吗？", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["秘境1_7_6"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人是人他妈生的，妖是妖他妈生的。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["秘境1_7_7"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我不会让你通过这里的！", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["秘境1_7_8"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "打败我，你就可以看到那只猪了。", NextTalk = -1, NextStep = -1,}, 
					["Option"] = {
						[1] = {Msg = "挑战怪物", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["秘境1_7_9"] ={
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "鱼唇的凡人，你吵到你大爷我睡觉了！", NextTalk = -1, NextStep = -1,}, 
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
DaYanTaConfig.ShowItem = "20739,20740,20741,61024,61025"

--用于判断是否支持首通奖励配置，1为允许使用首通奖励，0为不允许 --是否已获得首通奖励根据 RewardConfig Key区分
DaYanTaConfig.FirstRewardSwitch = 1 

--进度/NPC奖励表  怪物npc打完给 宝箱直接给
DaYanTaConfig.RewardConfig = {
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
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["2_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["3_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["3_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["4_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["4_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["5_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["5_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["6_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["6_Step_9"] = {	
		['Item'] = {"N礼包", 2, 0},
		['RandItemList']={},
	},
	
	["7_Step_8"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["7_Step_9"] = {	
		['Item'] = {"R礼包", 2, 0},
		['RandItemList']={},
	},
	
	
	--  默认奖励表
	["通用默认奖励配置表"] = {
		['Exp'] = "400 + 10*(process + (floors_num-1)*9-1)",
		["PetExp"] = "400 + 10*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 + 5*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"装备强化石",1,0},
		['RandItemList']={},
	},
	
	["通用默认奖励配置表First"] = {
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
	--	['Item'] = {"大银币袋",1,0},
		['RandItemList']={},
	},
	--进度奖励
	["1_Step_2_First"] ={
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["5_Step_2_First"] ={
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["6_Step_2_First"] ={
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
		['Item'] = {"N礼包", 3, 0},
		['RandItemList']={},
	},
	
	["7_Step_2_First"] ={
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['Item'] = {"100奇遇值",1,1},
		['RandItemList']={
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
		['Exp'] = "2000 + 50*(process + (floors_num-1)*9-1)",
		["PetExp"] = "2000 + 50*(process + (floors_num-1)*9-1)",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000 + 50*(process + (floors_num-1)*9-1)",
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
DaYanTaConfig.BackupConfig = {
	
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