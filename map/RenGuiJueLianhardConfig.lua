--人鬼绝恋(困难)配置
RenGuiJueLianhardConfig = {}

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
RenGuiJueLianhardConfig.ContinueTime = 60

--活动跳转点
RenGuiJueLianhardConfig.EnterPos = {"长安城", 504, 143, 0,"80副本-引导"}

--退出点
RenGuiJueLianhardConfig.QuitPos = {"长安城", 504, 143, 4}

--参加次数上限
RenGuiJueLianhardConfig.JoinMax = 1

--单张地图获得活跃值
RenGuiJueLianhardConfig.ActiveAddNum = 10

--活跃值上限
RenGuiJueLianhardConfig.ActiveMax = 10

--Dungeon描述
RenGuiJueLianhardConfig.ShowDesc = "长安城里有一位神秘的青年在求人帮助，似乎是遇到了什么不得了的难题，赶紧去帮帮他吧！"

--Dungeon背景图
RenGuiJueLianhardConfig.ShowPic = "1800600770"

--地图表 流程表
RenGuiJueLianhardConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "120副本-酆都", 
		["BornPoint"] = {144, 98, 0},
		["Step_0"] = {
			["Movie"] = "90834", 
			--是否显示该进度 默认显示  ShowStep = 1 显示
			ShowStep = 1,
			--加字段，表示是否记入最大进度
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "帮助地府鬼将击败$Aim1。", QuestMode = "Fight", QuestAim = "120副本-捣乱的鬼魂"},
			--AddTips = {Message = "---傲来村畔守匪迹---", Color="#FFD700FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "120副本-地府鬼将1", X = 120 , Y = 102, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-地府鬼将2", X = 115 , Y = 108, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-捣乱的鬼魂", X = 134 , Y = 109, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-黑无常", X = 38 , Y = 36, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-白无常", X = 48 , Y = 32, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-孟婆", X = 25 , Y = 113, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-恶鬼", X = 31 , Y = 111, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			ShowStep = 0,
			Trace = {Desc = "击败了捣乱的鬼魂，赶紧问问附近的$Aim1是什么情况。", QuestMode = "Talk", QuestAim = "120副本-地府鬼将1"},
		},
		["Step_2"] = {
			ShowStep = 1,
			Trace = {Desc = "找$Aim1问问，黑白无常在哪里。", QuestMode = "Talk", QuestAim = "120副本-孟婆"},
			--AddTips = {Message = "---湖畔激战知匪计---", Color="#FFD700FF"}, 
		},
		["Step_3"] = {
			ShowStep = 0,
			Trace = {Desc = "帮助孟婆击败$Aim1。", QuestMode = "Fight", QuestAim = "120副本-恶鬼"},
			--AddTips = {Message = "---傲来药店知匪踪---", Color="#FFD700FF"}, 
		},
		["Step_4"] = {
			ShowStep = 1,
			Trace = {Desc = "击败了恶鬼，赶紧再去找$Aim1问问黑白无常在哪里吧。", QuestMode = "Talk", QuestAim = "120副本-孟婆"},
			DelNPC = {
				{KeyName = "120副本-恶鬼", Del_Num = -1},--  全删 -1
			},
		},
		["Step_5"] = {
			ShowStep = 0,
			Trace = {Desc = "去中央大殿找$Aim1了解下情况。", QuestMode = "Fight", QuestAim = "120副本-黑无常"},
		},
		["Step_6"] = {
			ShowStep = 0,
			Trace = {Desc = "黑无常似乎还没有冷静下来，找他的妹妹$Aim1谈谈。", QuestMode = "Talk", QuestAim = "120副本-白无常"},
			--AddTips = {Message = "---调虎离山破匪阵---", Color="#FFD700FF"}, 
		},
	},
	[2] = {
		["MapKeyName"] = "120副本-解阳山", 
		["BornPoint"] = {97, 121, 0},
		["Step_0"] = {
			["Movie"] = "90837", 
			ShowStep = 1,
			Trace = {Desc = "击败拦路的$Aim1。", QuestMode = "Fight", QuestAim = "120副本-女尸怨灵"},
			AddNPC = {
				{KeyName = "120副本-青年妻子", X = 196 , Y = 52, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-千年女妖", X = 206 , Y = 51, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-女尸怨灵", X = 155 , Y = 86, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			["Movie"] = "90835", 
			ShowStep = 1,
			Trace = {Desc = "赶紧去山顶，$Aim1应该就在那里！", QuestMode = "Talk", QuestAim = "120副本-青年妻子"},
			DelNPC = {
				{KeyName = "120副本-女尸怨灵", Del_Num = -1},--  全删 -1
			},
		},
		["Step_2"] = {
			ShowStep = 0,
			Trace = {Desc = "击败$Aim1。她很强大，千万不要大意！", QuestMode = "Fight", QuestAim = "120副本-千年女妖"},
		},
		["Step_3"] = {
			["Movie"] = "90836", 
			ShowStep = 1,
			Trace = {Desc = "准备好了就去和$Aim1聊聊。", QuestMode = "Talk", QuestAim = "120副本-黑无常结束"},
			AddNPC = {
				{KeyName = "120副本-黑无常结束", X = 196 , Y = 63, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-白无常结束", X = 188 , Y = 58, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "120副本-千年妖魂", X = 206 , Y = 51, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_4"] = {
			ShowStep = 0,
			Trace = {Desc = "击败$Aim1。", QuestMode = "Fight", QuestAim = "120副本-千年妖魂"},
		},
		["Step_5"] = {
			["Movie"] = "90841", 
			ShowStep = 1,
			Trace = {Desc = "恭喜你们，通关人鬼绝恋(困难)副本！", QuestMode = "Talk", QuestAim = "120副本-黑无常结束"},
		},
	},
}

--NPC配置表
RenGuiJueLianhardConfig.NPCConfig = {
	["120副本-捣乱的鬼魂"] = {
		["MonID"] = 1151,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 1,	--本来是1
		["WinToDel"] = 1,
	},
	
	["120副本-黑无常"] = {
		["MonID"] = 1153,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 6,
		["WinToDel"] = 0,
	},
	
	["120副本-恶鬼"] = {
		["MonID"] = 1152,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	
	["120副本-女尸怨灵"] = {
		["MonID"] = 1154,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	
	["120副本-千年女妖"] = {
		["MonID"] = 1155,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 3,
		["WinToDel"] = 1,
	},
	
	["120副本-千年妖魂"] = {
		["MonID"] = 1156,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 5,
		["WinToDel"] = 1,
	},
}

--NPC对话表
--Msg中带*NPC*代表要使用其他NPC的模型，在*NPC*后接上需要使用的NPC的KeyName再加上*
RenGuiJueLianhardConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["120副本-捣乱的鬼魂"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我得帮助小哥哥逃出去！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "初入地府探消息", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "必须把你们拦住，不然书生哥哥就不能趁乱出去了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["120副本-地府鬼将1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "地府办事，闲杂人等退开。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "初入地府探消息", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "多谢少侠出手相助。也不知最近怎么了，这捣乱的鬼魂真是多，都快忙不过来了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*我刚听那个鬼魂口中一直在叨叨什么书生哥哥。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "甭提了，自从那个鬼魂被两位无常大人带回来之后就没安分过。我估摸着这次的事情又是他策划的，他现在可能已经在阳间了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*看来想了解具体情况我还是得去找两位无常大人。这位大兄弟，两位无常大人现在在地府中吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "无常大人们这个点应该在孟婆那，你可以去西边的奈何桥看看。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 2, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["120副本-孟婆"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喝下这汤，从此前尘皆消。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "奈何桥边降恶鬼", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*孟婆，孟婆，你知道世界上最美的人......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*哦，不好意思，记错词了。我是想问你知道黑白无常两位大人在哪里吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "闪开闪开，没看见我在对付恶鬼吗，有什么事等会再谈。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*你们地府不是专门管这个的吗，怎么这么多豆腐渣工程。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "我看你挺闲的啊，你不是找两位无常大人吗？那你帮我把这个恶鬼解决一下。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*这有啥难的呢，我这就去把他打回原形！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "我可提醒你，这可不是普通的鬼怪。而是......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 9, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_9"] = {
					["TalkMsg"] = {Msg = "*Player*我知道我知道，是恶鬼，你就看我的吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 3, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["120副本-恶鬼"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "佛家有六字箴言：唵,嘛,呢,叭,咪,吽。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "奈何桥边降恶鬼", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["120副本-孟婆"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "喝下这汤，从此前尘皆消。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "奈何桥边降恶鬼", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*怎么样本少侠厉害吧！现在你可以告诉我两位无常大人在哪里了吧？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "居然真的把恶鬼给打败了，我倒是小看你了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "两位无常大人刚从我这里离去，似乎是去了中央大殿，你可以去那边看看。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 5, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["120副本-黑无常"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "生无常，天下太平。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "地府深处战无常", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "你们不是我地府中人吧，来我地府有何贵干！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*我们是为了一个书生而来。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "是了是了，又是那个该死的书生！我不是说了吗，他阳寿已尽！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*可是他一个普通书生，好端端的怎么会阳寿已尽呢？你们是不是搞错了？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "哪来这么多为什么！我看你们就是来我地府捣乱的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["120副本-白无常"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "鬼和人一样有善恶。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "地府深处战无常", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠且慢，我哥哥他只是一时气愤，并没有恶意的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*看起来这地府还是有明白事理的人啊，哦不，鬼啊。等一下，你到底是人还是鬼？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "我......少侠可是为了那青年书生而来？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*对对对，就是他。我看他就是一个普通书生，而且还是弱冠之年，怎么会阳寿已尽呢？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "这事说来也奇怪，但是生死簿上的的确确写明了他阳寿已尽，所以我们才会带他来地府。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "而且我观他体内的阳气似乎并不是正常的流失，更像是被吸尽的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "*Player*你的意思是他有可能是被妖魔吸尽了阳气？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 9, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_9"] = {
					["TalkMsg"] = {Msg = "是的，而且就他现在的情况，如果不赶快带回地府进入轮回，恐怕没过多久就会灰飞烟灭！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 10, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_10"] = {
					["TalkMsg"] = {Msg = "*Player*这么严重！那我得赶快把这个情况告诉他！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 11, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_11"] = {
					["TalkMsg"] = {Msg = "我刚使用了地府秘术，感受到他的气息在解阳山。事不宜迟，我这就使用传送之术带你过去！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = 2,}, 
					},
				},
			},
		},
	},
	
	[2] = {
		["Step_0"] = {
			["120副本-女尸怨灵"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "不要打扰我的主人！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "解阳山上寻青年", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "呵呵呵，果然还是被你们发现了。但是我不会让你们打扰到主人的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["120副本-青年妻子"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "为什么是我，为什么......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "跨越生死人鬼恋", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-千年女妖*哦呵呵，你还真是有个痴情的相公呢，看得奴家好生羡慕啊~", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "相公！不，不对！ 走，你们快走！不要管我！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-千年女妖*还真是一对苦命的鸳鸯啊~看的奴家都不忍心拆散你们了~", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-黑无常结束*！！！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-黑无常结束*千年女妖！你不是被封印了吗！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-千年女妖*是呀是呀，奴家可是被封印了千年之久呢~要不是这位少侠在水帘洞窟乱来，奴家可不知道要什么时候才能出来呢~", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "*NPC*120副本-千年女妖*正好奴家刚刚解封，缺少阳气。既然你们来了，就把你们的阳气都给奴家吧，好不好嘛~", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 2, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["120副本-千年女妖"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "愚蠢的人类，你们是来给我送阳气的吗！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "跨越生死人鬼恋", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["120副本-黑无常结束"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "生无常，天下太平。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "山顶圣泉除妖魂", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "时间紧迫！我来让她服下泉水，你们稳住自己的魂魄，我会让你们进入她的魂灵，一定要战胜她！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 4, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["120副本-千年妖魂"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "可恶，逼我妖魂显露，我要让你们万劫不复。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "山顶圣泉除妖魂", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "该死的黑白无常，还有你们这群凡人，都得死！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
	}
}

--活动展示用
RenGuiJueLianhardConfig.ShowItem = "26123,26115,61024,61025"


--进度/NPC奖励表  怪物npc打完给 宝箱直接给
RenGuiJueLianhardConfig.RewardConfig = {
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
		['Exp'] = "70000",
		['PetExp'] = "70000",
		['MoneyType'] = 5,
		['MoneyVal'] = "70000",
		['Item'] = {},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},
		},
	},
	
	["1_Step_1"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
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
		['Exp'] = "72000",
		['PetExp'] = "72000",
		['MoneyType'] = 5,
		['MoneyVal'] = "72000",
		['Item'] = {},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},
		},
	},
	
	["1_Step_4"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_5"] ={
		['Exp'] = "72000",
		['PetExp'] = "72000",
		['MoneyType'] = 5,
		['MoneyVal'] = "72000",
		['Item'] = {"鬼魂的收藏2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},
		},
	},
	
	["1_Step_6"] ={
		['Exp'] = "3000",
		['PetExp'] = "3000",
		['MoneyType'] = 5,
		['MoneyVal'] = "3000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_0"] ={
		['Exp'] = "150000",
		['PetExp'] = "150000",
		['MoneyType'] = 5,
		['MoneyVal'] = "150000",
		['Item'] = {"鬼魂的收藏2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},
		},
	},
	
	["2_Step_1"] ={
		['Exp'] = "15000",
		['PetExp'] = "15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "15000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_2"] ={
		['Exp'] = "255000",
		['PetExp'] = "255000",
		['MoneyType'] = 5,
		['MoneyVal'] = "255000",
		['Item'] = {"化蝶青年的遗物2", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9910},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 5},
		},
	},
	
	["2_Step_3"] ={
		['Exp'] = "15000",
		['PetExp'] = "15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "15000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["2_Step_4"] ={
		['Exp'] = "255000",
		['PetExp'] = "255000",
		['MoneyType'] = 5,
		['MoneyVal'] = "255000",
		['Item'] = {"120级套装福袋", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9748},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 14},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 14},
		},
	},
	
	--分支进度 不给奖励
	--["1_Step_20"] ={
	--	['Exp'] = 0,
	--	['MoneyType'] = 5,
	--	['MoneyVal'] = 0,
	--	['Item'] = {},
	--	['RandItemList']={},
	--},
	--["1_Step_21"] ={
	--	['Exp'] = 0,
	--	['MoneyType'] = 5,
	--	['MoneyVal'] = 0,
	--	['Item'] = {},
	--	['RandItemList']={},
	--},
	
	--分支宝箱
	--["45副本宝箱1"] = {
	--	['RandItemList']={
	--		[1] = {
	--			['RandTime'] = 1,
	--			['ItemRand'] = {
	--				{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 2000},
	--				{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 3000},
	--				{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 3000},
	--			},
	--		},
	--	},
	--},
	
}
