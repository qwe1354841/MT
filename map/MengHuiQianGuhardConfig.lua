--梦回千古(困难)配置
MengHuiQianGuhardConfig = {}

--[[
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
	
--NPC对话表 NpcTalk
	-- 地图序号 => Step => NPCKeyName
	-- NextTalk 下一句对话 NextStep 下一进度 StartFight 是否战斗 NextFloor 下一层(0表示退出副本)

--进度/NPC奖励表 RewardConfig
	-- 默认奖励表 KeyName不可改
	-- 进度奖励 KeyName 规则 地图序号_进度(1_Step_0)
	-- NPC奖励 KeyName]]
	
--副本存在时间（分）
MengHuiQianGuhardConfig.ContinueTime = 60

--活动跳转点
MengHuiQianGuhardConfig.EnterPos = {"长安城", 502, 143, 10,"主线任务-袁守城-长安城"}

--退出点
MengHuiQianGuhardConfig.QuitPos = {"长安城", 502, 143, 10}

--参加次数上限
MengHuiQianGuhardConfig.JoinMax = 1

--单张地图获得活跃值
MengHuiQianGuhardConfig.ActiveAddNum = 10

--活跃值上限
MengHuiQianGuhardConfig.ActiveMax = 10

--Dungeon描述
MengHuiQianGuhardConfig.ShowDesc = "你头晕目眩，似乎觉醒了千年之前的零星记忆，去找袁守诚问问发生了什么事情吧！"

--Dungeon背景图
MengHuiQianGuhardConfig.ShowPic = "1800600750"

--地图表 流程表
MengHuiQianGuhardConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "100副本-玄阴池", 
		["BornPoint"] = {35, 22, 0},
		["Step_0"] = {
			["Movie"] = "90825",
			--是否显示该进度 默认显示  ShowStep = 1 显示
			ShowStep = 1,
			--加字段，表示是否记入最大进度
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "击败$Aim1，让她看看你的厉害。", QuestMode = "Fight", QuestAim = "100副本-花妖"},
			AddTips = {Message = "---安魂液之100副本---", Color="#FFD700FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "100副本-花妖", X = 43 , Y = 29, Range = 1, Direction = 0, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "100副本-青年书生1", X = 42 , Y = 173, Range = 1, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "100副本-土地公", X = 207 , Y = 170, Range = 1, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			ShowStep = 0,
			Trace = {Desc = "和受伤的$Aim1谈谈，了解下这是哪里。", QuestMode = "Talk", QuestAim = "100副本-花妖"},
		},
		["Step_2"] = {
			["Movie"] = "90826",
			ShowStep = 1,
			Trace = {Desc = "去找木屋前的$Aim1聊聊，看看这是哪里", QuestMode = "Talk", QuestAim = "100副本-青年书生1"},
			AddTips = {Message = "---乐善好施取木精---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "100副本-花妖", Del_Num = -1},--  全删 -1
			},
		},
		["Step_3"] = {
			ShowStep = 0,
			Trace = {Desc = "去找玄阴池的$Aim1问问，他应该知道哪里有草木精华。", QuestMode = "Talk", QuestAim = "100副本-土地公"},
		},
		["Step_4"] = {
			ShowStep = 1,
			Trace = {Desc = "击败$Aim1，收集它的精华。", QuestMode = "Fight", QuestAim = "100副本-草木精华1"},
			AddTips = {Message = "---乐善好施取木精---", Color="#FFD700FF"}, 
			AddNPC = {
				{KeyName = "100副本-草木精华1", X = 274 , Y = 172, Range = 1, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_5"] = {
			ShowStep = 0,
			Trace = {Desc = "去问问$Aim1，这些草木精华够不够", QuestMode = "Talk", QuestAim = "100副本-土地公"},
			DelNPC = {
				{KeyName = "100副本-草木精华1", Del_Num = -1},--  全删 -1
			},
		},
		["Step_6"] = {
			ShowStep = 1,
			Trace = {Desc = "再去西北小树林找找，那边应该也有$Aim1。", QuestMode = "Fight", QuestAim = "100副本-草木精华2"},
			AddNPC = {
				{KeyName = "100副本-草木精华2", X = 242 , Y = 134, Range = 1, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_7"] = {
			ShowStep = 0,
			Trace = {Desc = "再去问问$Aim1这些草木精华够了吗。", QuestMode = "Talk", QuestAim = "100副本-土地公"},
			AddTips = {Message = "---乐善好施取木精---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "100副本-草木精华2", Del_Num = -1},--  全删 -1
			},
		},
		["Step_8"] = {
			ShowStep = 1,
			Trace = {Desc = "东北面小树林还没去过，去找找有没有$Aim1。", QuestMode = "Fight", QuestAim = "100副本-草木精华3"},
			AddTips = {Message = "---乐善好施取木精---", Color="#FFD700FF"}, 
			AddNPC = {
				{KeyName = "100副本-草木精华3", X = 272 , Y = 112, Range = 1, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_9"] = {
			ShowStep = 0,
			Trace = {Desc = "再去问问$Aim1这些草木精华够了吗。", QuestMode = "Talk", QuestAim = "100副本-土地公"},
			DelNPC = {
				{KeyName = "100副本-草木精华3", Del_Num = -1},--  全删 -1
			},
		},
		["Step_10"] = {
			ShowStep = 1,
			Trace = {Desc = "赶紧把草木精华拿给$Aim1，然后再问问他千年玄冰的消息！", QuestMode = "Talk", QuestAim = "100副本-青年书生1"},
			AddTips = {Message = "---玄阴池畔斗双妖---", Color="#FFD700FF"}, 
		},
		["Step_11"] = {
			ShowStep = 0,
			Trace = {Desc = "去玄阴池边找到并击败$Aim1，获取他体内的千年玄冰。", QuestMode = "Fight", QuestAim = "100副本-雪领主"},
			AddNPC = {
				{KeyName = "100副本-雪领主", X = 107 , Y = 105, Range = 1, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_12"] = {
			ShowStep = 0,
			Trace = {Desc = "快把千年玄冰交给$Aim1，他的妻子就有救了！", QuestMode = "Talk", QuestAim = "100副本-青年书生1"},
			AddTips = {Message = "---百转千回双魂生---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "100副本-雪领主", Del_Num = -1},--  全删 -1
			},
		},
		["Step_13"] = {
			ShowStep = 1,
			Trace = {Desc = "$Aim1似乎往玄阴池的东北方向去了。跟上去看看。", QuestMode = "Fight", QuestAim = "100副本-青年书生2"},
			DelNPC = {
				{KeyName = "100副本-青年书生1", Del_Num = -1},--  全删 -1
			},
			AddNPC = {
				{KeyName = "100副本-青年书生2", X = 255 , Y = 25, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_14"] = {
			["Movie"] = "90827",
			ShowStep = 1,
			Trace = {Desc = "去小木屋前找$Aim1聊聊。", QuestMode = "Talk", QuestAim = "100副本-圣灵残魂"},
			AddTips = {Message = "---千回百转战发灵---", Color="#FFD700FF"},
			DelNPC = {
				{KeyName = "100副本-青年书生2", Del_Num = -1},--  全删 -1
			},
			AddNPC = {
				{KeyName = "100副本-圣灵残魂", X = 52 , Y = 178, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_15"] = {
			ShowStep = 0,
			Trace = {Desc = "击败$Aim1，离开梦境。", QuestMode = "Fight", QuestAim = "100副本-发灵"},
			AddNPC = {
				{KeyName = "100副本-发灵", X = 42 , Y = 173, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_16"] = {
			["Movie"] = "90828",
			ShowStep = 1,
			Trace = {Desc = "恭喜你们，通关梦回千古副本！", QuestMode = "Talk", QuestAim = "100副本-圣灵残魂"},
		},
	},
}

--NPC配置表
MengHuiQianGuhardConfig.NPCConfig = {
	["100副本-花妖"] = {
		["MonID"] = 1601,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 2,
		["WinToDel"] = 0,
	},
	
	["100副本-草木精华1"] = {
		["MonID"] = 1602,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 5,
		["WinToDel"] = 0,
	},
	
	["100副本-草木精华2"] = {
		["MonID"] = 1602,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 7,
		["WinToDel"] = 0,
	},
	
	["100副本-草木精华3"] = {
		["MonID"] = 1602,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 9,
		["WinToDel"] = 1,
	},
	
	["100副本-雪领主"] = {
		["MonID"] = 1603,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 12,
		["WinToDel"] = 0,
	},
	
	["100副本-青年书生2"] = {
		["MonID"] = 1604,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 14,
		["WinToDel"] = 1,
	},
	
	["100副本-发灵"] = {
		["MonID"] = 1604,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 16,
		["WinToDel"] = 1,
	},
}

--NPC对话表
--如果Msg = "*None*" 代表不显示选项，点击屏幕任意位置即可继续对话
--如果Msg里有*Player* 代表是玩家说话，npc模型会换成玩家的
MengHuiQianGuhardConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["100副本-花妖"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "100副本战花妖", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "呵呵呵，打败我也许我会告诉你哦~", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["100副本-花妖"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "100副本战花妖", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "咳咳咳，看来这几千年来没有动手，有点生疏了啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*我记得我不是服用了安魂液吗，这不像是梦境啊，就算是幻觉也不应该如此清晰才对！这究竟是哪里？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "趁着这个人类在发呆，赶紧溜......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*恩......#FACE<X:1,Y:4010000000>#", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*Player*跑，跑了？这花妖溜得还真是快啊......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*下方好像有个木屋，催烟袅袅，应该是有人居住，去问问这到底是哪里吧。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 2, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["100副本-青年书生1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*这位兄台，我想和你打听下，这是哪里？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*喂喂喂，你在听我说话吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "草木精华......千年玄冰......这让我去哪里找啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*Player*草木精华？千年玄冰？这两个可都是稀世珍宝，你找这它们做啥？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "#FACE<X:1,Y:4010700000>#", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "你...你...！少侠！求求你救救我妻子吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 9, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_9"] = {
					["TalkMsg"] = {Msg = "*Player*#FACE<X:1,Y:4010700000>#......你先起来！有话好好说，什么情况。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 10, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_10"] = {
					["TalkMsg"] = {Msg = "前些日子我带着娘子周游各国，途经解阳山的时候她被小虫叮咬了。起初没有注意，后来身子越来越虚，浑身发烫，现在已经昏迷不醒了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 11, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_11"] = {
					["TalkMsg"] = {Msg = "我请了大夫来看，他们说是中了火毒！需要千年玄冰和草木精华一起服用才可以根治。为了压制娘子的火毒，我特地带着她来到了这玄阴池。听说这里可以找到草木精华和千年玄冰。可是我一个书生，手无缚鸡之力......哎。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 12, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_12"] = {
					["TalkMsg"] = {Msg = "*Player*兄台你且不要着急，安心照料好嫂子，这草木精华和千年玄冰，就交给我吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 3, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["100副本-土地公"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*你就是玄阴池的土地公吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "我是，我还知道少侠你是为了那草木精华而来。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*#FACE<X:1,Y:4011300000>#这你都知道！那你赶紧的告诉我在哪里有！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "这草木精华是集天地的灵气，经过千年的时间孕育而成的！可谓是绝世珍宝。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "多出现在草木旺盛的地方。少侠可以去东边的小树林找找。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*那我就先在这里谢过了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 4, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["100副本-草木精华1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "我们修炼不易，放过我们吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["100副本-土地公"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*你快看看，这点草木精华够不够？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "少侠，这点草木精华不够啊，你可以......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*不够是吧，那你等会，我再去找找！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "诶！少侠，听我说完啊！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 6, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["100副本-草木精华2"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "啊，就是这个人类！刚才杀了我们的同胞！大家快跑！#FACE<X:1,Y:4011400000>#", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*这些个草木精华还挺有灵性，可是跑也没用！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,},  
					},
				},
			},
		},
		["Step_7"] = {
			["100副本-土地公"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*我又拿了些来，这些总够了吧？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "还缺一点，少侠其实你可以换个方法获取草木精华的。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*还不够？你要求可真多，东北边的小树林我还没去过，我去看看。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "#FACE<X:1,Y:4010700000>#诶！少侠，你这样收集草木精华虽然能救活那人类，可是......哎！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 8, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["100副本-草木精华3"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "人类！你这样做会有报应的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*不就是个妖精，我还会怕你们吗！？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "你们这些该死的人类，为什么总是伤害我们！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["100副本-土地公"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "乐善好施取木精", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*土地公你快来看看，再加上这些应该够了吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "够了够了，这些个草木精华救一个人类绰绰有余了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*那我就现在这里谢过了，救人要紧我先走了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "哎，少侠你这么做，和当年的“他”又有何区别呢。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 10, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_10"] = {
			["100副本-青年书生1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "玄阴池畔斗双妖", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠你收集到草木精华了吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*那必须的，也不看看我是谁！给你。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "没错，真的是草木精华！我在这里替我的娘子先谢过少侠了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*别谢不谢的了，时间紧迫，赶紧告诉我千年玄冰的消息！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "千年玄冰只能从雪领主体内孕育而出，是他的本命结晶。听说玄阴池的雪领主修炼了数千年，就快要问鼎妖仙，练就了一身的可怕的神通，恐怕......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*别恐怕了，救人要紧，你赶紧告诉我他在哪。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "听闻那雪领主就在玄阴池中，少侠不妨去湖边找找。千万要小心啊！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 11, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_11"] = {
			["100副本-雪领主"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "玄阴池畔斗双妖", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "人类，这里不是你该来的地方，速速离去！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_12"] = {
			["100副本-青年书生1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "玄阴池畔斗双妖", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠，拿到千年玄冰了吗！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*那必须的，也不看看我是谁！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "太好了太好了，澜儿有救了！多谢少侠！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*先别谢我了，救嫂子要紧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*Player*事了拂衣去,深藏功与名。#FACE<X:1,Y:4011100000>#", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "少侠请留步！少侠可知玄阴冰魄？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "*Player*就是那个传说中可以炼制神器的玄阴冰魄！？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 9, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_9"] = {
					["TalkMsg"] = {Msg = "没错！看来少侠也是见多识广之人，在下不才，碰巧知道玄阴冰魄就藏在这玄阴池的某一处！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 10, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_10"] = {
					["TalkMsg"] = {Msg = "*Player*是吗是吗，那你赶紧告诉我在哪里！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 11, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_11"] = {
					["TalkMsg"] = {Msg = "少侠不要着急，且随我来。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 13, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_13"] = {
			["100副本-青年书生2"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "百转千回双魂生", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠，你终于来了，你可知道我等这一天等了有多久！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_14"] = {
			["100副本-圣灵残魂"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "千回百转战发灵", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*可有感受到什么？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "屋内有一把木梳，这幻境中满满的凄凉之感就来源于此，逆行封印之法，解开它！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 15, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_15"] = {
			["100副本-发灵"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "人生不过转瞬间，花开花落忆昔年。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "千回百转战发灵", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "我本无意伤害你们，何苦刁难。既然你们去意已决，那妾身只能出手了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
}

--活动展示用
MengHuiQianGuhardConfig.ShowItem = "26116,26113,61024,61025"


--进度/NPC奖励表  怪物npc打完给 宝箱直接给
MengHuiQianGuhardConfig.RewardConfig = {
	--打怪奖励(举例)
	["100副本-花妖"] = {
		['Exp'] = "0",
		['PetExp'] = "0",
		['MoneyType'] = 5,
		['MoneyVal'] = "0",
		['Item'] = {},
		['RandItemList']={},
	},
	
	--  默认奖励表
	["通用默认奖励配置表"] = {
		['Exp'] = "0",
		['PetExp'] = "0",
		['MoneyType'] = 5,
		['MoneyVal'] = "0",
		['Item'] = {},
		['RandItemList']={},
	},
	
	--进度奖励
	["1_Step_0"] ={
		['Exp'] = "45000",
		['PetExp'] = "45000",
		['MoneyType'] = 5,
		['MoneyVal'] = "45000",
		['Item'] = {"洞花妖的小袋子2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},		
		},
	},
	
	["1_Step_1"] ={
		['Exp'] = "1000",
		['PetExp'] = "1000",
		['MoneyType'] = 5,
		['MoneyVal'] = "1000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_2"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_3"] ={
		['Exp'] = "12000",
		['PetExp'] = "12000",
		['MoneyType'] = 5,
		['MoneyVal'] = "12000",
		['Item'] = {},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},		
		},
	},
	
	["1_Step_4"] ={
		['Exp'] = "12000",
		['PetExp'] = "12000",
		['MoneyType'] = 5,
		['MoneyVal'] = "12000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_5"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_6"] ={
		['Exp'] = "12000",
		['PetExp'] = "12000",
		['MoneyType'] = 5,
		['MoneyVal'] = "12000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_7"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_8"] ={
		['Exp'] = "12000",
		['PetExp'] = "12000",
		['MoneyType'] = 5,
		['MoneyVal'] = "12000",
		['Item'] = {},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},	
		},
	},
	
	["1_Step_9"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_10"] ={
		['Exp'] = "5000",
		['PetExp'] = "5000",
		['MoneyType'] = 5,
		['MoneyVal'] = "5000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_11"] ={
		['Exp'] = "85000",
		['PetExp'] = "85000",
		['MoneyType'] = 5,
		['MoneyVal'] = "85000",
		['Item'] = {"洞花妖的小袋子2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},		
		},
	},
	
	["1_Step_12"] ={
		['Exp'] = "5000",
		['PetExp'] = "5000",
		['MoneyType'] = 5,
		['MoneyVal'] = "5000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_13"] ={
		['Exp'] = "100000",
		['PetExp'] = "100000",
		['MoneyType'] = 5,
		['MoneyVal'] = "100000",
		['Item'] = {"共工感恩礼包2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9802},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 11},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 11},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 11},		
		},
	},
	
	["1_Step_14"] ={
		['Exp'] = "5000",
		['PetExp'] = "5000",
		['MoneyType'] = 5,
		['MoneyVal'] = "5000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_15"] ={
		['Exp'] = "100000",
		['PetExp'] = "100000",
		['MoneyType'] = 5,
		['MoneyVal'] = "100000",
		['Item'] = {"100级套装福袋", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9658},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 19},	
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 19},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 19},		
		},
	},
}
