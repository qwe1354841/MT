--洞窟伏魔配置
DongKuFuMohardConfig = {}

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
DongKuFuMohardConfig.ContinueTime = 60

--活动跳转点
DongKuFuMohardConfig.EnterPos = {"傲来村", 92, 54, 10,"70副本-引导"}

--退出点
DongKuFuMohardConfig.QuitPos = {"傲来村", 92, 54, 4}

--参加次数上限
DongKuFuMohardConfig.JoinMax = 1

--单张地图获得活跃值
DongKuFuMohardConfig.ActiveAddNum = 10

--活跃值上限
DongKuFuMohardConfig.ActiveMax = 10

--Dungeon描述
DongKuFuMohardConfig.ShowDesc = "少侠还记得水帘洞库秘境中遇见的那个怪物吗！近日水帘洞中似乎妖孽又起，快去瞧瞧究竟是怎么回事吧。"

--Dungeon背景图
DongKuFuMohardConfig.ShowPic = "1800600760"

--地图表 流程表
DongKuFuMohardConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "110副本-花果山", 
		["BornPoint"] = {162, 29, 0},
		["Step_0"] = {
			["Movie"] = "90829", 
			--是否显示该进度 默认显示  ShowStep = 1 显示
			ShowStep = 1,
			--加字段，表示是否记入最大进度
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "找到并击败$Aim1。", QuestMode = "Fight", QuestAim = "110副本2"},
			--AddTips = {Message = "---傲来村畔守匪迹---", Color="#FFD700FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "110副本1", X = 131 , Y = 24, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本2", X = 145 , Y = 32, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本3", X = 159 , Y = 68, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本4", X = 58 , Y = 60, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本5", X = 66 , Y = 27, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			ShowStep = 0,
			Trace = {Desc = "击败了花果山大弟子，赶紧找$Aim1问问是什么情况。", QuestMode = "Talk", QuestAim = "110副本1"},
		},
		["Step_2"] = {
			ShowStep = 1,
			Trace = {Desc = "东南方的山腰上似乎有个$Aim1，去看看是什么情况。", QuestMode = "Fight", QuestAim = "110副本3"},
			--AddTips = {Message = "---湖畔激战知匪计---", Color="#FFD700FF"}, 
		},
		["Step_3"] = {
			["Movie"] = "90830", 
			ShowStep = 1,
			Trace = {Desc = "找到并击败$Aim1。", QuestMode = "Fight", QuestAim = "110副本4"},
			--AddTips = {Message = "---傲来药店知匪踪---", Color="#FFD700FF"}, 
		},
		["Step_4"] = {
			["Movie"] = "90831", 
			ShowStep = 1,
			Trace = {Desc = "替大圣向$Aim1问好，顺便打听下魔物的下落。", QuestMode = "Talk", QuestAim = "110副本5"},
			AddNPC = {
				{KeyName = "110副本7", X = 86 , Y = 81, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本8", X = 110 , Y = 85, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_5"] = {
			ShowStep = 0,
			Trace = {Desc = "找到并消灭$Aim1。", QuestMode = "Fight", QuestAim = "110副本6"},
			AddNPC = {
				{KeyName = "110副本6", X = 52 , Y = 136, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_6"] = {
			["Movie"] = "90832", 
			ShowStep = 1,
			Trace = {Desc = "去水帘洞窟前找$Aim1，他似乎有紧急的事情找你。", QuestMode = "Talk", QuestAim = "110副本8"},
			--AddTips = {Message = "---调虎离山破匪阵---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "110副本6", Del_Num = -1},--  全删 -1
			},
		},
		["Step_7"] = {
			ShowStep = 0,
			Trace = {Desc = "准备好了就去找$Aim1，让他送你进去。", QuestMode = "Talk", QuestAim = "110副本7"},
			--AddTips = {Message = "---傲来剿匪助烟儿---", Color="#FFD700FF"}, 
		},
	},
	[2] = {
		["MapKeyName"] = "110副本-水帘洞窟", 
		["BornPoint"] = {114, 53, 0},
		["Step_0"] = {
			ShowStep = 1,
			Trace = {Desc = "赶紧击败并封印$Aim1吧！", QuestMode = "Fight", QuestAim = "110副本9"},
			AddNPC = {
				{KeyName = "110副本9", X = 96 , Y = 59, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_1"] = {
			["Movie"] = "90833", 
			ShowStep = 1,
			Trace = {Desc = "破开了封印再与$Aim1聊聊。", QuestMode = "Fight", QuestAim = "110副本12"},
			AddNPC = {
				{KeyName = "110副本12", X = 96 , Y = 59, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_2"] = {
			["Movie"] = "90840", 
			ShowStep = 1,
			Trace = {Desc = "恭喜你们，通关洞窟伏魔副本！", QuestMode = "Talk", QuestAim = "110副本11"},
			AddNPC = {
				{KeyName = "110副本10", X = 92 , Y = 46, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "110副本11", X = 101 , Y = 47, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "110副本12", Del_Num = -1},--  全删 -1
			},
		},
	},
}

--NPC配置表
DongKuFuMohardConfig.NPCConfig = {
	["110副本2"] = {
		["MonID"] = 1751,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 1,
		["WinToDel"] = 0,
	},
	
	["110副本3"] = {
		["MonID"] = 1752,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 3,
		["WinToDel"] = 0,
	},
	
	["110副本4"] = {
		["MonID"] = 1753,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 4,
		["WinToDel"] = 1,
	},
	
	["110副本6"] = {
		["MonID"] = 1754,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 6,
		["WinToDel"] = 0,
	},
	
	["110副本9"] = {
		["MonID"] = 1755,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 1,
		["WinToDel"] = 1,
	},
	
	["110副本12"] = {
		["MonID"] = 1756,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 2,
		["WinToDel"] = 1,
	},
	
}

--NPC对话表
--Msg中带*NPC*代表要使用其他NPC的模型，在*NPC*后接上需要使用的NPC的KeyName再加上*
DongKuFuMohardConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["110副本2"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我怎么就摊上了这么个不负责任的师傅？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "花果山上斗师兄", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["110副本1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "一整天吃斋念佛真是太无趣了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "误把灵猴当妖魔", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "不错不错，俺老孙果然还是喜欢看这样的“表演”。一整天吃斋念佛真是太无趣了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*大圣爷，我这次受师傅所托特地来问问您，之前在秘境中遇到的那个“东西”。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "嗯，你不说我也准备提，而且这事就说来话长了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "想当初俺占山为王，选了这花果山只是因为这风景秀丽，加上我这猴子猴孙也都喜欢，谁曾想，这花果山别有洞天，居然还暗藏了水帘洞窟这等秘境！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "更令俺没想到的是，我直到最近才发现，这水帘洞窟里居然还藏着一个隐患——一个封印法阵。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "最近这阵法似乎有些松动，总有一些邪魔之气外露。俺怀疑你遇到的那个魔物也和这个有关系。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "正好俺这边有个事情需要你帮忙。俺感觉又有邪魔之气外露，而且这次似乎比上次还要多，你替俺去探查一下。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 9, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_9"] = {
					["TalkMsg"] = {Msg = "*Player*我说你们这些个大人物怎么总喜欢使唤人呢，算了这件事我就免为其难的接下了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 2, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["110副本3"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "千万别给别人发现了，偷偷地......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "误把灵猴当妖魔", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠饶命啊！我再也不敢了！我这还是第一次啊！您就饶了我吧！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["110副本4"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "混世魔王，就是喜欢专门搞事，怕了吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "错打魔王知趣事", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "我真的只是来花果山观光旅游，顺便一睹大圣风采的！咋就老被人当做妖怪呢！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["110副本5"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哼，那只死猴子。也不知道来看看我。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "花果山下现魔踪", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "哼，那只死猴子。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*您就是铁扇公主吧？大圣爷让我替他和你请安了。（我好像听到了什么不得了的八卦啊！）", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "那只死猴子自己怎么不来，派个小屁孩来，算什么意思！哼！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*公主稍安勿躁，您听我讲， 最近水帘洞窟似乎有妖魔祸乱，大圣爷实在是走不开，才让我来和您请安的。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "嗯，你这小嘴还挺会说，不过我爱听。这次就原谅他了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "你刚说什么？魔物？说来也巧，我这次上山，在山脚石桥下遇见了几只邪魔，就顺手教训了一下他们。没准你能去那边找到些线索。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "*Player*是吗！多谢公主的消息，我这就去探明情况！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 5, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["110副本6"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "嘎嘎嘎嘎嘎，这群愚蠢的仙佛，果然一切都在大人的计算之中！就连你们也是！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "花果山下现魔踪", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["110副本8"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "一整天吃斋念佛真是太无趣了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "水帘洞前助大圣", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "少侠你可来了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "你且听俺说。这封印之物好生厉害，俺和游方老友只能在外勉强控制住。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "俺需要你帮个忙，进入这水帘洞窟第七层，将那个还没有化形成功的魔物给再次封印了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*替天行道，义不容辞！不过我该怎么做呢？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "你只需要击败他就可以了，剩下的交给俺就成。如果你准备好了，就让旁边的游方好友送你进去！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 7, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["110副本7"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "关关雎鸠，在河之洲。窈窕淑女，君子好逑。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "水帘洞前助大圣", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "嘿嘿嘿，少侠，咱们又见面了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*废话少说，事情紧急赶紧送我进去！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "OK，OK，最后叮嘱一句，少侠千万要小心！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = -1, NextFloor = 2,}, 
					},
				},
			},
		},
	},
	
	[2] = {
		["Step_0"] = {
			["110副本9"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "呵呵，就你这种蝼蚁也想来坏我的好事吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "再入洞窟降妖魔", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["110副本12"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "五圣之灵，必须被分散......", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "破除封印再降魔", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "呵呵呵呵呵呵，命运之晷终究神佛难阻，如来你终究也无法料到主人会以这样的方式苏醒。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*这妖怪是封印太久开始恍惚了么？先吃我一棒！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
	}
}

--活动展示用
DongKuFuMohardConfig.ShowItem = "26121,26114,61024,61025"


--进度/NPC奖励表  怪物npc打完给 宝箱直接给
DongKuFuMohardConfig.RewardConfig = {
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
		['Exp'] = "58000",
		['PetExp'] = "58000",
		['MoneyType'] = 5,
		['MoneyVal'] = "58000",
		['Item'] = {"猴子的袋子2", 1, 1},
		['RandItemList']={},
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
		['Exp'] = "60000",
		['PetExp'] = "60000",
		['MoneyType'] = 5,
		['MoneyVal'] = "60000",
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
	
	["1_Step_3"] ={
		['Exp'] = "60000",
		['PetExp'] = "60000",
		['MoneyType'] = 5,
		['MoneyVal'] = "60000",
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
		['Exp'] = "5000",
		['PetExp'] = "5000",
		['MoneyType'] = 5,
		['MoneyVal'] = "5000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_5"] ={
		['Exp'] = "115000",
		['PetExp'] = "115000",
		['MoneyType'] = 5,
		['MoneyVal'] = "40000",
		['Item'] = {"猴子的袋子2", 1, 1},
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
		['Exp'] = "15000",
		['PetExp'] = "15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "15000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_7"] ={
		['Exp'] = "15000",
		['PetExp'] = "15000",
		['MoneyType'] = 5,
		['MoneyVal'] = "15000",
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
	
	["2_Step_0"] ={
		['Exp'] = "180000",
		['PetExp'] = "180000",
		['MoneyType'] = 5,
		['MoneyVal'] = "180000",
		['Item'] = {"游方道士礼包2", 1, 1},
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
		['Exp'] = "180000",
		['PetExp'] = "180000",
		['MoneyType'] = 5,
		['MoneyVal'] = "180000",
		['Item'] = {"110级套装福袋", 1, 1},
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
	["1_Step_20"] ={
		['Exp'] = 0,
		['PetExp'] = 0,
		['MoneyType'] = 5,
		['MoneyVal'] = 0,
		['Item'] = {},
		['RandItemList']={},
	},
	--["1_Step_21"] ={
	--	['Exp'] = 0,
	--	['MoneyType'] = 5,
	--	['MoneyVal'] = 0,
	--	['Item'] = {},
	--	['RandItemList']={},
	--},
	
	--分支宝箱
	["45副本宝箱1"] = {
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 2000},
					{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 3000},
					{ItemKey = "山贼的袋子", Num = 1, Bind = 1, Rand = 3000},
				},
			},
		},
	},
	
}
