--贸易配置
TradeConfig = {}

-- 贸易开启NPC
TradeConfig.StartNPC = "贸易_开启"

TradeConfig.ShowItem = "30001,61022"

TradeConfig.Tips = [[唐王有旨，每位少侠每日可任意挑选地点，开始贸易。请各位少侠准备好贸易品，选择适合的护送侍从，更需留心解决邮件中传来的种种困难。贸易完成后，大唐商会将根据本次贸易品质给予贸易票据奖励。]]

--奖励的票据keyname 绑定
TradeConfig.Voucher = "贸易票据"

-- 客户端是否明确显示 哪几个是推荐护送侍从 -- 1显示 0不显示
TradeConfig.ShowRecommendGuard = 1

TradeConfig.Main = {
	{
		["TradeName"] = "丝路",
		-- 配置的Place需要在 TradeConfig.Place中对应
		--["Place"] = {"甘州","沙州","楼兰","高昌","伊犁"},	
		["Place"] = {"甘州","沙州","楼兰","伊犁"},	
	},
	{
		["TradeName"] = "南洋",
		-- 配置的Place需要在 TradeConfig.Place中对应
		--["Place"] = {"爪哇","苏门答腊","苏禄","彭亨","真腊","暹罗"},	
		["Place"] = {"爪哇","苏门答腊","苏禄","彭亨"},	
	},
}

--贸易单配置尽量注意历史地理宗教因素 
--贸易地点配置 
--已经有玩家进行中的配置不可删除
TradeConfig.Place = {
	["甘州"] = {
		["Info"] = "甘州，素有“桑麻之地”、“渔米之乡”之美称。盛产小麦、玉米、水稻、豆类、油料、瓜果、蔬菜。",
		--贸易时长 -秒
		["Time"] = 30 * 60,
		--贸易单数量
		["OrderNum"] = 1,
		--可随机到的贸易单列表
		["OrderList"] = {"贸易路上_1"},
 		--总完成度 --客户端显示百分比
		["SumCompletion"] = 10000,
		--每个贸易单中贸易品的完成度 -完成度与交齐的贸易品数量相关
		["GoodsCompletion"] = 2000,
		--每个贸易单中侍从护送的完成度 -完成度与侍从数量相关
		["GuardCompletion"] = 500,
		--奖励票据数量公式 -与完成度相关 - RealCompletion 实际完成度(最低为0 最高不超过总完成度)
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 80)",
		--随机贸易事件的触发点 - 0~100
		["EventTrigger"] = {40},
		--可能随机到的事件名
		--["EventList"] = {"强盗_1","问路_1","失踪_1"},
		["EventList"] = {"问路_1"},
	},
	["沙州"] = {
		["Info"] = "沙州，南枕气势雄伟的祁连山，西接浩瀚无垠的罗布泊荒原，北靠嶙峋蛇曲的北塞山，东峙峰岩突兀的三危山",
		["Time"] = 40 * 60,
		["OrderNum"] = 1,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 100)",
		["EventTrigger"] = {20,50},
		["EventList"] = {"强盗_1","问路_1","失踪_1","打劫_1"},
	},
	["楼兰"] = {
		["Info"] = "楼兰，地沙卤，少田，寄田仰谷旁国。国出玉，多葭苇、柽柳、胡桐、白草。民随畜牧逐水草，有驴马，多橐驼，能作兵，与婼羌同。",
		["Time"] = 50 * 60,
		["OrderNum"] = 2,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2500,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 100)",
		["EventTrigger"] = {20,50},
		["EventList"] = {"强盗_1","问路_1","失踪_1","打劫_1"},
	},
	["伊犁"] = {
		["Info"] = "伊犁，唐显庆三年，唐灭西突厥置昆陵、蒙池都护府，伊犁等地归于唐。",
		["Time"] = 60 * 60,
		["OrderNum"] = 3,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3","丹药_1"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 100)",
		["EventTrigger"] = {20,50},
		["EventList"] = {"强盗_1","问路_1","失踪_1","打劫_1"},
	},
	
	["爪哇"] = {
		["Info"] = "爪哇，指爪哇岛，并非某种语言。",
		--["Time"] = 10 * 60,
		["Time"] = 120 * 60,
		["OrderNum"] = 3,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3","丹药_1","茶_1","食物_1"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 120)",
		["EventTrigger"] = {20,50,70},
		["EventList"] = {"问路_1","打劫_1","需求_1","需求_2"},
	},
	["苏门答腊"] = {
		["Info"] = "苏门答腊，黄金岛、金洲之名引得不少探险者前来。",
		["Time"] = 120 * 60,
		["OrderNum"] = 4,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3","丹药_1","丹药_2","食物_1"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 120)",
		["EventTrigger"] = {20,70},
		["EventList"] = {"问路_1","打劫_1","需求_1","需求_2"},
	},
	["苏禄"] = {
		["Info"] = "苏禄，其国小，有巉岩之岭，其极南为石崎山、犀角屿、珠池，因岛环绕，海内有珍珠。",
		["Time"] = 180 * 60,
		--["Time"] = 10,
		["OrderNum"] = 4,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3","丹药_1","丹药_2","茶_1"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 140)",
		["EventTrigger"] = {20,50,70},
		["EventList"] = {"问路_1","打劫_1","需求_1","需求_2"},
	},
	["彭亨"] = {
		["Info"] = "彭亨，古其国其国，土田沃，气候常温，米粟饶足，煮海为盐，酿椰浆为酒。上下亲狎，无寇贼。",
		["Time"] = 180 * 60,
		["OrderNum"] = 4,
		["OrderList"] = {"贸易路上_1","贸易路上_2","贸易路上_3","丹药_1","丹药_2","茶_1","食物_1"},
		["SumCompletion"] = 10000,
		["GoodsCompletion"] = 2000,
		["GuardCompletion"] = 500,
		["VoucherNum"] = "math.ceil(RealCompletion / SumCompletion * 140)",
		["EventTrigger"] = {20,40,60,80},
		["EventList"] = {"问路_1","打劫_1","需求_1","需求_2"},
	},
}

--贸易单配置
--已经有玩家进行中的配置不可删除
TradeConfig.Order = {
	["贸易路上_1"] = {
		["Name"] = "运输淡水",
		["Info"] = "贸易路上，水可少不了。",
		["Icon"] = 1901201520,
		["NeedItem"] = {"烹饪佐料1", 5},
		["EscortGuardNum"] = 2,
		--推荐侍从
		["RecommendGuardList"] = {"水德真君","小白龙","灵感大王","龙王","沙和尚"},
		--推荐提示
		["RecommendTips"] = "从水中而来的侍从更能胜任此次任务。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"呼风唤雨礼包",1,1},
			-- ["RandItemList"]={
				-- [1] = {
					-- ["RandTime"] = 1,
					-- ["ItemRand"] = {
						-- {ItemKey = "2级攻击石", Num = 1, Bind = 0, Rand =700},
						-- {ItemKey = "2级魔攻石", Num = 1, Bind = 0, Rand =700},
						-- {ItemKey = "2级物抗石", Num = 1, Bind = 0, Rand =1300},
					-- },
				-- },
			-- },
		},
	},
	["贸易路上_2"] = {
		["Name"] = "运输蔬菜",
		["Info"] = "贸易路上，蔬菜可少不了。",
		["Icon"] = 1901201530,
		["NeedItem"] = {"烹饪材料2", 5},
		["EscortGuardNum"] = 2,
		--推荐侍从
		["RecommendGuardList"] = {"虎力大仙","鹿力大仙","羊力大仙"},
		--推荐提示
		["RecommendTips"] = "车迟国的国师们表示此任务小菜一碟。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"呼风唤雨礼包",1,1},
		},
	},

	["贸易路上_3"] = {
		["Name"] = "运输食盐",
		["Info"] = "盐，朝廷对此管制甚严，运送它可要万分小心。",
		["Icon"] = 1901201510,
		["NeedItem"] = {"烹饪佐料3", 5},
		["EscortGuardNum"] = 2,
		--推荐侍从
		["RecommendGuardList"] = {"太上老君","水德真君","鹿力大仙","太乙天尊","镇元子"},
		--推荐提示
		["RecommendTips"] = "使用拂尘的侍从更适合此次任务。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"如有神助礼包",1,1},
		},
	},
	
	["丹药_1"] = {
		["Name"] = "外伤药",
		["Info"] = "此去路途艰险，带些外伤药，合情合理。",
		["Icon"] = 1901201510,
		["NeedItem"] = {"血药-1", 2,"血药-2", 1},
		["EscortGuardNum"] = 2,
		--推荐侍从
		["RecommendGuardList"] = {"程咬金","混世魔王","黄风怪","牛魔王"},
		--推荐提示
		["RecommendTips"] = "使用斧头的侍从更适合此次任务。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"斩妖除魔礼包",1,1},
		},
	},
	
	["丹药_2"] = {
		["Name"] = "外伤药",
		["Info"] = "此去路途艰险，带些外伤药，合情合理。",
		["Icon"] = 1901201510,
		["NeedItem"] = {"血药-1", 2,"血药-2", 1},
		["EscortGuardNum"] = 2,
		--推荐侍从
		["RecommendGuardList"] = {"灵吉菩萨","观音菩萨"},
		--推荐提示
		["RecommendTips"] = "菩萨们更适合此次任务。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"普度众生礼包",1,1},
		},
	},
	["丹药_3"] = {
		["Name"] = "回魂丹",
		["Info"] = "这些起死回生的仙药在哪儿都是有价无市的。",
		["Icon"] = 1901201510,
		["NeedItem"] = {"80级复活药", 2},
		["EscortGuardNum"] = 3,
		--推荐侍从
		["RecommendGuardList"] = {"猪八戒","孙悟空","唐僧","沙和尚"},
		--推荐提示
		["RecommendTips"] = "取经一行人对此次任务得心应手。",
		--全部护送侍从 都选择推荐侍从的额外奖励 (需保证贸易品全部交齐)
		["GuardReward"] = {
			["Item"] = {"斩妖除魔礼包",1,1},
		},
	},
	
	["茶_1"] = {
		["Name"] = "茶叶",
		["Info"] = "如果停止喝茶，文明就会坍塌。",
		["Icon"] = 1901201530,
		["NeedItem"] = {"解除异常药", 5},
		["EscortGuardNum"] = 2,
		["RecommendGuardList"] = {"红孩儿","罗刹女","牛魔王"},
		["RecommendTips"] = "圣婴大王一家表示对此次任务负责。",
		["GuardReward"] = {
			["Item"] = {"普度众生礼包",1,1},
		},
	},
	
	["食物_1"] = {
		["Name"] = "中原美食",
		["Info"] = "那些蛮夷怎么可能拒绝中原美食。",
		["Icon"] = 1901201500,
		["NeedItem"] = {"烹饪3", 2, "烹饪8", 2},
		["EscortGuardNum"] = 2,
		["RecommendGuardList"] = {"白无常","黑无常"},
		["RecommendTips"] = "鬼使二人组对此次任务兴趣极大。",
		["GuardReward"] = {
			["Item"] = {"如有神助礼包",1,1},
		},
	},
}

--贸易事件配置
--已经有玩家进行中的配置不可删除
TradeConfig.Event = {
	["强盗_1"] = {
		["Name"] = "路遇山贼",
		["Info"] = "【贸易中】前往$place的路途艰险，难免碰上个小山贼，请前往$map附近解决。",
		["Icon"] = 1900351050,
		--事件持续时间 （秒）
		["Duration"] = 5 * 60,
		--NPCKeyname
		["NPCKeyname"] = "贸易_山贼",
		--NPC对话文本
		["TalkMsg"] = "把金银珠宝都交出来！",
		["Option"] = {
			--选项文本  事件类型
			{["OptionMsg"] = "看招！",["Type"] = "打怪",["MonID"] = 20005,},--怪物组id（如果进入战斗）
		},
		
		--刷新点 {地图, x, y, 范围, 方向}
		["Map"] = {
			{"大唐境外", 295, 87, 20, 4},
			{"大唐境外", 460, 99, 20, 4},
			{"解阳山", 167, 111, 20, 4},
			{"傲来村野", 139, 113, 20, 4},
		},
		["Move"] = 0,
		--完成后提高完成度
		["RewardCompletion"] = {400, 1000},
	},
	["问路_1"] = {
		["Name"] = "迷失方向",
		["Info"] = "【贸易中】翻山越岭，岔路繁多，一不小心就迷失了方向，快找去$map附近，寻找当地村民问下路吧。",
		["Icon"] = 1900352250,
		--事件持续时间 （秒）
		["Duration"] = 5 * 60,
		--NPCKeyname
		["NPCKeyname"] = "贸易_村民",
		--NPC对话文本
		["TalkMsg"] = "由此处向前，下一个路口左转，再下一个路过左转，再下一个路过还是左转，便是正确的方向啦。",
		["Option"] = {
			--选项文本  事件类型
			{["OptionMsg"] = "只能听他的了", ["Type"] = "对话",},
			{["OptionMsg"] = "不理他", ["Type"] = "无事发生",},
		},
		--["MonID"] = 4310,
		["Map"] = {
			{"傲来村野", 103, 50, 1, 4},
			{"大唐境外", 621, 126, 20, 4},
			{"解阳山", 46, 133, 20, 4},
		},
		["Move"] = 1,
		--完成后提高完成度
		["RewardCompletion"] = {-300, 800},
	},
	["失踪_1"] = {
		["Name"] = "队员失踪",
		["Info"] = "【贸易中】穿越草原时，一位冒失的队员独自去追逐一只兔子，之后就再也见不到他了，快去找找他吧，最后看到他的地方是$map。",
		["Icon"] = 1900352410,
		["Duration"] = 5 * 60,
		["NPCKeyname"] = "贸易_队员",
		["TalkMsg"] = "呜呜呜，我迷路了，谁来救救我。",
		["Option"] = {
			{["OptionMsg"] = "带他回来", ["Type"] = "对话",},
		},
		["Map"] = {
			{"傲来村野", 103, 50, 50, 4},
			{"傲来村野", 138, 108, 50, 4},
			{"江南野外", 89, 170, 50, 4},
			{"江南野外", 109, 44, 50, 4},
			{"大唐境外", 201, 51, 50, 4},
		},
		["Move"] = 1,
		["RewardCompletion"] = {300, 800},
	},
	["打劫_1"] = {
		["Name"] = "遭遇打劫",
		["Info"] = "【贸易中】小小毛贼胆敢打劫大唐的商队，快去$map会会他。",
		["Icon"] = 1900351040,
		["Duration"] = 5 * 60,
		["NPCKeyname"] = "贸易_强盗",
		["TalkMsg"] = "要不是家中老母重病，无钱买药，又有谁愿意来打劫呢？",
		["Option"] = {
			{["OptionMsg"] = "胆敢打劫！", ["Type"] = "打怪", ["MonID"] = 20009,},
			{["OptionMsg"] = "这钱你收下", ["Type"] = "上交", ["Needs"] = {["MoneyType"] = 5,["MoneyVal"] = 5000,},},
		},
		
		["Map"] = {
			{"傲来村野", 103, 50, 10, 4},
			{"东海海湾", 136, 31, 20, 4},
		},
		["Move"] = 1,
		["RewardCompletion"] = {300, 800},
	},
	
	["需求_1"] = {
		["Name"] = "大唐美食",
		["Info"] = "【贸易中】行至$place，当地有一位美食家想要【蟹黄豆腐煲】，快去$map找他。",
		["Icon"] = 1900352260,
		["Duration"] = 5 * 60,
		["NPCKeyname"] = "贸易_美食家",
		["TalkMsg"] = "早就听说大唐美食【蟹黄豆腐煲】十分美味，不知能否有幸品尝？",
		["Option"] = {
			{["OptionMsg"] = "给你", ["Type"] = "上交", ["Needs"] = {["Item"] = {"烹饪3", 1}},},
		},
		
		["Map"] = {
			{"傲来村野", 103, 50, 10, 4},
			{"东海海湾", 70, 108, 20, 4},
			{"傲来村野", 138, 108, 50, 4},
			{"江南野外", 89, 170, 50, 4},
			{"江南野外", 109, 44, 50, 4},
		},
		["Move"] = 0,
		["RewardCompletion"] = {300, 800},
	},
	
	["需求_2"] = {
		["Name"] = "贪财国王",
		["Info"] = "【贸易中】前往$place的途中经过一蛮夷小国，这贪财国王居然当场索贿，去$map搞定他。",
		["Icon"] = 1900352990,
		["Duration"] = 5 * 60,
		["NPCKeyname"] = "贸易_国王",
		["TalkMsg"] = "要想从此过，留下买路钱，哦不对，留下通关文书钱。",
		["Option"] = {
			{["OptionMsg"] = "给你", ["Type"] = "上交", ["Needs"] = {["MoneyType"] = 5,["MoneyVal"] = 10000,},},
		},
		
		["Map"] = {
			{"东海海湾", 70, 108, 20, 4},
			{"傲来村野", 138, 108, 50, 4},
			{"江南野外", 89, 170, 50, 4},
			{"江南野外", 109, 44, 50, 4},
		},
		["Move"] = 0,
		["RewardCompletion"] = {300, 800},
	},
	
}


function TradeConfig.Initialization()
	TradeConfig.MaxEventNum = 1
	
	local show_config = {}
	show_config["Main"] = TradeConfig.Main
	show_config["Place"] = {}
	for k,v in pairs(TradeConfig.Place) do
		show_config["Place"][k] = {}
		local place_tmp = show_config["Place"][k]
		place_tmp["Info"] = v["Info"]
		place_tmp["Time"] = v["Time"]
		place_tmp["OrderNum"] = v["OrderNum"]
		place_tmp["SumCompletion"] = v["SumCompletion"]
		place_tmp["VoucherNum"] = v["VoucherNum"]
		place_tmp["EventTrigger"] = v["EventTrigger"]		
		
		if #v["EventList"] > TradeConfig.MaxEventNum then
			TradeConfig.MaxEventNum = #v["EventList"]
		end
	end
	
	show_config["Order"] = {}
	for k,v in pairs(TradeConfig.Order) do
		show_config["Order"][k] = {}
		local order_tmp = show_config["Order"][k]
		order_tmp["Name"] = v["Name"]
		order_tmp["Info"] = v["Info"]
		order_tmp["Icon"] = v["Icon"]
		order_tmp["NeedItem"] = v["NeedItem"]
		order_tmp["EscortGuardNum"] = v["EscortGuardNum"]
		order_tmp["RecommendTips"] = v["RecommendTips"]
		--客户端直接显示推荐侍从 --贺振坤需求的 2021-11-18 15:32:45
		if TradeConfig.ShowRecommendGuard and TradeConfig.ShowRecommendGuard == 1 then
			order_tmp["RecommendGuardList"] = v["RecommendGuardList"]
		end
		
		v["NeedItemEx"] = {}
		v["NeedFinishNum"] = 0
		for a,b in ipairs(v["NeedItem"]) do
			if type(b) == "string" then
				v["NeedItemEx"][b] = v["NeedItem"][a+1]
				v["NeedFinishNum"] = v["NeedFinishNum"] + 1
			end
		end
		v["RecommendGuardListEx"] = {}
		for _,b in ipairs(v["RecommendGuardList"]) do
			v["RecommendGuardListEx"][b] = true
		end
	end
	
	TradeConfig.ShowConfigStr = Lua_tools.serialize(show_config)
	--sLuaApp:LuaErr(TradeConfig.ShowConfigStr)
end
TradeConfig.Initialization()