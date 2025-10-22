--傲来秘宝(困难)配置
AoLaiMiBaohardConfig = {}

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
AoLaiMiBaohardConfig.ContinueTime = 60

--活动跳转点
AoLaiMiBaohardConfig.EnterPos = {"傲来村", 12, 118, 10,"45副本0"}

--退出点
AoLaiMiBaohardConfig.QuitPos = {"傲来村", 21, 120, 10}

--参加次数上限
AoLaiMiBaohardConfig.JoinMax = 1

--单张地图获得活跃值
AoLaiMiBaohardConfig.ActiveAddNum = 10

--活跃值上限
AoLaiMiBaohardConfig.ActiveMax = 10

--Dungeon描述
AoLaiMiBaohardConfig.ShowDesc = "听说傲来村因为藏有一个惊天的大秘密，已经被一帮山贼盯上了，快去帮他们守住传说中的宝藏！"

--Dungeon背景图
AoLaiMiBaohardConfig.ShowPic = "1800600740"

--地图表 流程表
AoLaiMiBaohardConfig.MapConfig = {
	[1] = {
		["MapKeyName"] = "90副本-傲来村", 
		["BornPoint"] = {148, 149, 4},
		["Step_0"] = {
			["Movie"] = "90818",
			--是否显示该进度 默认显示  ShowStep = 1 显示
			ShowStep = 1,
			--加字段，表示是否记入最大进度
			-- $Aim1 --1是QuestAim的顺序  --QuestMode 是Fight or Open显示（0/1）
			Trace = {Desc = "击败准备登岸的$Aim1，让他们看看你的厉害。", QuestMode = "Fight", QuestAim = "90副本1"},
			AddTips = {Message = "---傲来村畔守匪迹---", Color="#FFD700FF"}, --颜色RGBA
			AddNPC = {
				{KeyName = "90副本1", X = 139 , Y = 154, Range = 0, Direction = 0, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-药品商店", X = 51 , Y = 119, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-宠物商店", X = 104 , Y = 42, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-武器商店", X = 186 , Y = 125, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-装备商店", X = 152 , Y = 93, Range = 0, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-杂货商店", X = 103 , Y = 139, Range = 0, Direction = 3, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
				{KeyName = "90副本-饰品商店", X = 59 , Y = 31, Range = 0, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_1"] = {
			ShowStep = 0,
			Trace = {Desc = "成功击溃登陆的强盗，看看手下败将$Aim1还有什么好说的。", QuestMode = "Talk", QuestAim = "90副本1"},
		},
		["Step_2"] = {
			["Movie"] = "90820",
			ShowStep = 1,
			Trace = {Desc = "赶紧去西南面看看，那边似乎也有$Aim1登岸了。", QuestMode = "Fight", QuestAim = "90副本2"},
			AddTips = {Message = "---湖畔激战知匪计---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "90副本1", Del_Num = -1},--  全删 -1
			},
			AddNPC = {
				{KeyName = "90副本2", X = 38 , Y = 150, Range = 0, Direction = 2, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_3"] = {
			ShowStep = 0,
			Trace = {Desc = "逼问$Aim1说出行动计划。", QuestMode = "Talk", QuestAim = "90副本2"},
		},
		["Step_4"] = {
			["Movie"] = "90821",
			ShowStep = 1,
			Trace = {Desc = "去找附近的$Aim1问问有没有看到其他强盗。", QuestMode = "Talk", QuestAim = "90副本-药品商店"},
			AddTips = {Message = "---傲来药店知匪踪---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "90副本2", Del_Num = -1},--  全删 -1
			},
		},
		["Step_5"] = {
			ShowStep = 0,
			Trace = {Desc = "老爷子说$Aim1往北面去了，去会会他们。", QuestMode = "Fight", QuestAim = "90副本3"},
			AddNPC = {
				{KeyName = "90副本3", X = 63 , Y = 83, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_6"] = {
			ShowStep = 0,
			Trace = {Desc = "追问$Aim1其他强盗的下落。", QuestMode = "Talk", QuestAim = "90副本3"},
		},
		["Step_7"] = {
			["Movie"] = "90822",
			ShowStep = 1,
			Trace = {Desc = "去另一半看看，有没有$Aim1把守。", QuestMode = "Fight", QuestAim = "90副本4"},
			AddTips = {Message = "---调虎离山破匪阵---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "90副本3", Del_Num = -1},--  全删 -1
			},
			AddNPC = {
				{KeyName = "90副本4", X = 135 , Y = 91, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			}
		},
		["Step_8"] = {
			["Movie"] = "90823",
			ShowStep = 1,
			Trace = {Desc = "差一点就让他把信号发出去了。饰品店传来求救声，快去看看$Aim1！", QuestMode = "Fight", QuestAim = "90副本-饰品商店"},
			AddTips = {Message = "---傲来剿匪助烟儿---", Color="#FFD700FF"}, 
		},
		["Step_9"] = {
			ShowStep = 0,
			Trace = {Desc = "附近篝火旁的$Aim1似乎被强盗抓住了，快去看看吧！", QuestMode = "Talk", QuestAim = "90副本-宠物商店"},
			AddNPC = {
				{KeyName = "90副本5", X = 118 , Y = 46, Range = 0, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
		},
		["Step_20"] = {
			ShowStep = 0,
			Trace = {Desc = "收下陆烟儿的谢礼$Aim1。", QuestMode = "Open", QuestAim = "90副本宝箱1"},
			AddNPC = {
				{KeyName = "90副本宝箱1", X = 48 , Y = 33, Range = 0, Direction = 4, Move = 0, Add_Num = 1, Min_Num = 0, Type = "Box"},
			},
			DelNPC = {
				{KeyName = "90副本-饰品商店", Del_Num = -1},--  全删 -1
			},
		},
		["Step_21"] = {
			ShowStep = 0,
			Trace = {Desc = "附近篝火旁的$Aim1似乎被强盗抓住了，快去看看吧！", QuestMode = "Talk", QuestAim = "90副本-宠物商店"},
		},
		["Step_10"] = {
			ShowStep = 1,
			Trace = {Desc = "替傲来村民击败$Aim1！", QuestMode = "Fight", QuestAim = "90副本5"},
			AddTips = {Message = "---傲来战匪救卿酒---", Color="#FFD700FF"}, 
			DelNPC = {
				{KeyName = "90副本-饰品商店", Del_Num = -1},--  全删 -1
			},
		},
		["Step_11"] = {
			ShowStep = 0,
			Trace = {Desc = "找$Aim1问问，这群强盗到底为什么而来。", QuestMode = "Talk", QuestAim = "90副本-宠物商店"},
		},
		["Step_12"] = {
			ShowStep = 1,
			Trace = {Desc = "听苏卿酒说$Aim1似乎往东北面花果山的方向去了，快去看看。", QuestMode = "Fight", QuestAim = "90副本6"},
			AddTips = {Message = "---流水潺边斗首领---", Color="#FFD700FF"}, 
			AddNPC = {
				{KeyName = "90副本6", X = 191 , Y = 23, Range = 0, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "90副本5", Del_Num = -1},--  全删 -1
			},
		},
		["Step_13"] = {
			["Movie"] = "90819",
			ShowStep = 1,
			Trace = {Desc = "前方出现了一个怪人，去和$Aim1聊聊。", QuestMode = "Fight", QuestAim = "90副本7"},
			AddTips = {Message = "---流水潺边斗首领---", Color="#FFD700FF"}, 
			AddNPC = {
				{KeyName = "90副本7", X = 191 , Y = 23, Range = 0, Direction = 5, Move = 0, Add_Num = 1, Min_Num = 0, Type = "NPC"},
			},
			DelNPC = {
				{KeyName = "90副本6", Del_Num = -1},--  全删 -1
			},
		},
		["Step_14"] = {
			["Movie"] = "90824",
			ShowStep = 1,
			Trace = {Desc = "恭喜你们，通关傲来秘宝副本！", QuestMode = "Talk", QuestAim = "90副本7"},
		},
	},
}

--NPC配置表
AoLaiMiBaohardConfig.NPCConfig = {
	["90副本1"] = {
		["MonID"] = 1551,
		["WinTime"] = 1,	--记在地图上 作为追踪条件
		["WinRand"] = 10000,  --万分比
		["NextStep"] = 2,
		["WinToDel"] = 0,
	},
	
	["90副本2"] = {
		["MonID"] = 1552,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 4,
		["WinToDel"] = 0,
	},
	
	["90副本3"] = {
		["MonID"] = 1553,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 7,
		["WinToDel"] = 0,
	},
	
	["90副本4"] = {
		["MonID"] = 1554,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 8,
		["WinToDel"] = 1,
	},
	
	["90副本-饰品商店"] = {
		["MonID"] = 1551,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 9,
		["WinToDel"] = 0,
	},
	
	["90副本宝箱1"] = {
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 21,
		["WinToDel"] = 1,
	},
	
	["90副本5"] = {
		["MonID"] = 1555,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 11,
		["WinToDel"] = 0,
	},
	
	["90副本6"] = {
		["MonID"] = 1556,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 13,
		["WinToDel"] = 0,
	},
	
	["90副本7"] = {
		["MonID"] = 1557,
		["WinTime"] = 1,
		["WinRand"] = 10000,
		["NextStep"] = 14,
		["WinToDel"] = 0,
	},
}

--NPC对话表
--Msg中带*NPC*代表要使用其他NPC的模型，在*NPC*后接上需要使用的NPC的KeyName再加上*
AoLaiMiBaohardConfig.NpcTalk = {
	[1] = {
		["Step_0"] = {
			["90副本1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "哪来的小屁孩，一边呆着去。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来村畔守匪迹", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*就凭你们？哼，先过了我这关。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_1"] = {
			["90副本1"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "切，你这小屁孩还挺厉害！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "但是你以为这样就结束了吗？那你就错了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "这次我们做足了完全的准备！我们是最后一个登岸的队伍！西南面的兄弟早就登陆了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*你说什么？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*你们这群该死的强盗！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "溜了溜了，只要兄弟们成了我这下半辈子也衣食无忧了哈哈哈哈！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*赶紧去西南面看看，希望还来得及！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 2, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_2"] = {
			["90副本2"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "要么打败我，要么赶紧滚！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "湖畔激战知匪计", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*看来刚才那个家伙说的没错，这边也有强盗登岸了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "兄弟们注意了，听说有些自诩正义的人在岸边等着我们，都给我小心点！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*自诩正义？难道你们这群打家劫舍的强盗还有理了？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*赶紧告诉我，除了你们两队之外这次还来了多少强盗！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "呵呵，击败我也许我会告诉你！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_3"] = {
			["90副本2"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "该死的，这些个小鬼还挺厉害的嘛。这么周密的计划为什么会被他们发现！？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*若想人不知，除非己莫为！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "哼哼，你以为击败我们就行了吗？实话告诉你，我们老大早就猜到了我们之中会有奸细，早就改了行动时间！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*那你们！！！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "哈哈哈，我们只是诱饵，没准我们老大早就得手了！哈哈哈哈！好了我的任务完成了，就不陪你玩了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*Player*你们这群该死的强盗！！！我和你们没完！时间紧迫赶紧回村里看看！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 4, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_4"] = {
			["90副本-药品商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "明治病之术者，杜未生之疾。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来药店知匪踪", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "今天晚上好热闹啊，这么多人来咱们傲来村玩吗？年轻真好啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*老爷子，你看到其他强盗了吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "啥！强盗，在哪？看我不打死他！居然敢来我们傲来村撒野！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*老爷子你先别激动，我刚听你说今天晚上来了很多人，他们都往哪去了啊？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "哦，你说那群到傲来村观光的人啊，好像往北面去了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*老爷子，你早些休息吧，我去会会那些“观光客”！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 5, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_5"] = {
			["90副本3"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "你是谁，从哪里来，要到哪里去？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来药店知匪踪", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "站住！你是谁？老大有命，任何人都不可以通过这里，除非你击败我！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_6"] = {
			["90副本3"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "咳，不能让你过去，不能让你打扰老大的好事！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "嘿嘿嘿，就算你打败我也没用，我刚才已经把信号发出去了！很快就会有大批的兄弟过来！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*糟了，他肯定是发信号了。看来从这边过去是不可能了。得想个法子。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "没用的！两个口子都被我们的兄弟看守着，等会他们就会过来支援我了，你休想打扰我们老大的好事！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,},  
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*两个口子？如果是这样的话！赶紧去另一边看看或许还有机会！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 7, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_7"] = {
			["90副本4"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "老大有命，任何人都不可以通过这里，除非你击败我！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "调虎离山破匪阵", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*果然人都去另一边了，这里的守卫薄弱了很多！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "你是谁？我怎么从来没有见过你！？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*Player*糟糕，被发现了！赶紧解决他！千万别让他把同伴引过来！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_8"] = {
			["90副本-饰品商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "上好的首饰啊，来看看吗？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来剿匪助烟儿", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "救命啊！救命啊！少侠帮帮我，有一伙强盗进了我的饰品店，我一个弱女子根本拦不住他们啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*看来这帮强盗只劫财", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "而且他们还叫嚷着要什么傲来秘宝，到处打砸抢，把我的店里搞得一团糟。少侠你是知道的，我这里只有普通的饰品，讲究一个薄利多销，哪有什么秘宝啊！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*可恶，我这就进店降敌！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_9"] = {
			["90副本-饰品商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "多谢少侠出手相助。这里还有些未被破坏的小饰品，希望少侠不要嫌弃。小女子先去收拾店内了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "多谢姑娘", NextTalk = -1, NextStep = 20, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
			["90副本-宠物商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我家的宠物多可爱啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来战匪救卿酒", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "你休想，我是不会告诉你们的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*小娘们！你不要敬酒不吃吃罚酒！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*我大哥脾气好，不打女人，不代表老二我没办法对付你！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*我说你是谁老二啊？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*你他娘的又是谁啊！少TMD多管闲事！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "少侠！你来的正好！这群强盗不知道从哪里听来的消息说我们傲来村有秘宝！到处打家劫舍！希望少侠替我们替天行道！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 10, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_21"] = {
			["90副本-宠物商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我家的宠物多可爱啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来战匪救卿酒", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "你休想，我是不会告诉你们的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*小娘们！你不要敬酒不吃吃罚酒！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*我大哥脾气好，不打女人，不代表老二我没办法对付你！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*我说你是谁老二啊？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*你他娘的又是谁啊！少TMD多管闲事！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "少侠！你来的正好！这群强盗不知道从哪里听来的消息说我们傲来村有秘宝！到处打家劫舍！希望少侠替我们替天行道！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 10, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_10"] = {
			["90副本5"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "有些闲事是不能乱管的！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来战匪救卿酒", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
				
			},
		},
		["Step_11"] = {
			["90副本-宠物商店"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "我家的宠物多可爱啊。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来战匪救卿酒", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "*Player*镁铝，这群强盗到底为什么而来？我刚听你说什么傲来秘宝？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "哎......果然还是来了啊！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "之前一直有个传言，说五圣和他的弟子再封印了共工之时，有一道光从天而降，就落在我们傲来村！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "这个传闻不知怎么的越传越邪乎，现在变成了有宝物散落在傲来村，真是三人成虎啊！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "*NPC*90副本5*哼，你休想骗我们！我们老大推算出傲来村有三宝！就肯定有！更何况那几个傲来村的商人都说似乎见过！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*你给我老实点！傲来三宝，看来得去调查一下，最好能找到强盗头子看看到底是什么情况。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "我记得之前似乎还有个人，他好像往东北面去了！少侠可以过去看看。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = 12, StartFight = -1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_12"] = {
			["90副本6"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "一边待着去，我现在没空理你。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "流水潺边斗首领", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "“花果山下流水潺”，应该就在这附近了啊。怎么会没有呢？为什么！！！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*你就是那个强盗头子吗！说，你们来傲来村究竟是为了什么！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "哪来的小屁孩，我现在没空理你，一边待着去", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*呵！看来只能用武力了！", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
		["Step_13"] = {
			["90副本7"] = {
				["Talk_1"] = {
					["TalkMsg"] = {Msg = "来吧少年，让吾见识下汝的能耐。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "傲来遇旧炼魂考", NextTalk = 2, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_2"] = {
					["TalkMsg"] = {Msg = "莫要惊慌，吾便是汝，汝亦是吾。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 3, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_3"] = {
					["TalkMsg"] = {Msg = "*Player*说什么阴阳怪气的话呢，你莫不是古代来的吧？", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 4, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_4"] = {
					["TalkMsg"] = {Msg = "小子答对了一半，吾乃是上古参与封印共工中丢失的一份魂魄，一直匿于这深山之中，近日汝圣灵已现，也到了吾重见天日的时候了。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 5, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_5"] = {
					["TalkMsg"] = {Msg = "*Player*（原来他和我丢失的记忆有关）既然你是我的一部分，那也是时候回归本体了吧，这样我实力大增也好护送法师前去取经。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 6, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_6"] = {
					["TalkMsg"] = {Msg = "诚然诚然，但吾离体过久，直接进入恐怕有损肉身，不如借以魂考的方式，一来确保万无一失，二来也能增进默契。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 7, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_7"] = {
					["TalkMsg"] = {Msg = "*Player*（魂考又是什么）不管了，为了让你这残魂归体，纵使九九劫难，尽管来吧。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = 8, NextStep = -1, StartFight = -1, NextFloor = -1,}, 
					},
				},
				["Talk_8"] = {
					["TalkMsg"] = {Msg = "汝准备好接受魂考了吗。", NextTalk = -1 , NextStep = -1}, 
					["Option"] = {
						[1] = {Msg = "*None*", NextTalk = -1, NextStep = -1, StartFight = 1, NextFloor = -1,}, 
					},
				},
			},
		},
	},
}

--活动展示用
AoLaiMiBaohardConfig.ShowItem = "26119,26112,61024,61025"


--进度/NPC奖励表  怪物npc打完给 宝箱直接给
AoLaiMiBaohardConfig.RewardConfig = {
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
		['Exp'] = "6000",
		['PetExp'] = "6000",
		['MoneyType'] = 5,
		['MoneyVal'] = "6000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_2"] ={
		['Exp'] = "16000",
		['PetExp'] = "16000",
		['MoneyType'] = 5,
		['MoneyVal'] = "16000",
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
	
	["1_Step_3"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_4"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_5"] ={
		['Exp'] = "20000",
		['PetExp'] = "20000",
		['MoneyType'] = 5,
		['MoneyVal'] = "20000",
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
	
	["1_Step_6"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_7"] ={
		['Exp'] = "34000",
		['PetExp'] = "34000",
		['MoneyType'] = 5,
		['MoneyVal'] = "34000",
		['Item'] = {"山贼的袋子2", 1, 1},
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
	
	["1_Step_8"] ={
		['Exp'] = "36000",
		['PetExp'] = "36000",
		['MoneyType'] = 5,
		['MoneyVal'] = "36000",
		['Item'] = {"山贼的袋子2", 1, 1},
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
	
	["1_Step_9"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_21"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_10"] ={
		['Exp'] = "46000",
		['PetExp'] = "46000",
		['MoneyType'] = 5,
		['MoneyVal'] = "46000",
		['Item'] = {"山贼的袋子2", 1, 1},
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
	
	["1_Step_11"] ={
		['Exp'] = "2000",
		['PetExp'] = "2000",
		['MoneyType'] = 5,
		['MoneyVal'] = "2000",
		['Item'] = {},
		['RandItemList']={},
	},
	
	["1_Step_12"] ={
		['Exp'] = "60000",
		['PetExp'] = "60000",
		['MoneyType'] = 5,
		['MoneyVal'] = "60000",
		['Item'] = {"大当家的收藏2", 1, 1},
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
	
	["1_Step_13"] ={
		['Exp'] = "60000",
		['PetExp'] = "60000",
		['MoneyType'] = 5,
		['MoneyVal'] = "60000",
		['Item'] = {"90级套装福袋", 1, 1},
		['RandItemList']={
			{ItemKey = "Nil", Num = 1, Bind = 0, Rand = 9568},
			{ItemKey = "酆都60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "酆都60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "酆都60天赋3", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "花果山60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "花果山60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "花果山60天赋3", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "慈恩寺60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "慈恩寺60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "慈恩寺60天赋3", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "流沙界60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "流沙界60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "流沙界60天赋3", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "西海龙宫60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "西海龙宫60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "西海龙宫60天赋3", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "净坛禅院60天赋1", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "净坛禅院60天赋2", Num = 1, Bind = 0, Rand = 24},
			{ItemKey = "净坛禅院60天赋3", Num = 1, Bind = 0, Rand = 24},
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
	["90副本宝箱1"] = {
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
