--长安保卫战配置
ChangAnBaoWeiConfig = {}

--活动界面显示的物品 字符串 物品id
ChangAnBaoWeiConfig.ShowItem = "61025,61024,61001,61018,61022"

--一场战斗获得的活跃值
ChangAnBaoWeiConfig.ActiveAddNum = 2

--最大活跃值
ChangAnBaoWeiConfig.ActiveMax = 10

--阶段配置
ChangAnBaoWeiConfig.RoundConfig = {
	["Round_1"] = {
		["Continue"] = 20, -- 持续时间 分钟
		["Map"] = {"长安城", 429, 253, 100},--地图 x y 半径
		["MonConfg"] = {
			-- ["长安保卫战1"] = {MonID = 1201, Num = 25, Move = 1, Integral = 10,},
			-- ["长安保卫战2"] = {MonID = 1202, Num = 5, Move = 1, Integral = 10,},
			["长安保卫战2"] = {MonID = 1202, Num = 30, Move = 1, Integral = 15,},
		},
		["StartMsg_1"] = "大唐统领：六耳猕猴率妖军袭击长安，请诸位少侠速速来长安助我军一臂之力", 
		["StartMsg_2"] = "大唐哨兵：报！妖军先锋已攻入长安", 
	},
	["Round_2"] = {
		["Continue"] = 20,
		["Map"] = {"长安城", 334, 198, 100},
		["MonConfg"] = {
			-- ["长安保卫战1"] = {MonID = 1201, Num = 8, Move = 1, Integral = 15,},
			-- ["长安保卫战2"] = {MonID = 1202, Num = 20, Move = 1, Integral = 15,},
			-- ["长安保卫战3"] = {MonID = 1203, Num = 2, Move = 1, Integral = 15,},
			["长安保卫战2"] = {MonID = 1202, Num = 30, Move = 1, Integral = 15,},
		},
		["StartMsg_1"] = "大唐统领：多亏诸位少侠相助，我军已成功击退妖军先锋", 
		["StartMsg_2"] = "大唐哨兵：报！妖军主力已攻入长安", 
	},
	["Round_3"] = {
		["Continue"] = 20,--累加时间应该等于活动时长
		["Map"] = {"长安城", 197, 130, 90},
		["MonConfg"] = {
			-- ["长安保卫战2"] = {MonID = 1202, Num = 3, Move = 1, Integral = 30,},
			-- ["长安保卫战3"] = {MonID = 1203, Num = 17, Move = 1, Integral = 30,},
			["长安保卫战2"] = {MonID = 1202, Num = 30, Move = 1, Integral = 15,},
		},
		["StartMsg_1"] = "哨兵：报！六耳猕猴已至长安城，并洒下无数猴毛分身", 
		["StartMsg_2"] = "斗战胜佛：莫慌，那厮已被我吓走，待俺且前去将他镇压，下面的小妖就有劳诸位了。",
		["EndMsg_1"] = "斗战胜佛：此次又被那厮走脱，俺老孙脸上实在无光，愧对诸位少侠",
		["EndMsg_2"] = "大唐统领：多亏诸位少侠相助，长安城才得以平安无事",
	},
}

--剩余妖兽数量提示
ChangAnBaoWeiConfig.TipsNum = {	
	{["Num"] = 10, ["Msg"] = "大唐统领：进犯长安的凶兽已被击退大半！",},
	--{["Num"] = 15, ["Msg"] = "大唐统领：进犯长安的凶兽已被击退小半！",},
}

--开宝箱 提示
ChangAnBaoWeiConfig.ProgressBarTime = 3000
ChangAnBaoWeiConfig.ProgressBarTip = "获取物资中..."

ChangAnBaoWeiConfig.BoxRefresh = {
	--宝箱刷新区域是当前阶段的怪物刷新区域
	["NeedIntegral"] = {300, 600, 900, 1200},--全服积分达到 300/600 刷新宝箱
	["Num"] = 40,--宝箱数量
	["Continue"] = 5, --持续时间 分钟
	["BoxKeyName"] = "保卫战战利品",
	["OpenMaxNum"] = 5, --个人开宝箱数量最大值--整个活动
	["Msg"] = "由于少侠们的英勇奋战，在长安保卫战中击杀大量敌军，战场上出现了大量战利品",
}

ChangAnBaoWeiConfig.Reward = {
	-- ["长安保卫战1"] = {
		-- ['Exp'] = 25000,
		-- ['PetExp'] = 25000,
		-- ['MoneyType'] = 5,
		-- ['MoneyVal'] = 2500,
		-- --['Item'] = {"修理石1",1,1},
		-- ['RandTime'] = 1,
		-- ['ItemRand'] = {
			-- {ItemKey = "Nil", Num = 1, Bind = 0, Rand = 2500},
			-- {ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand = 500},
		-- },
	-- },
	["长安保卫战2"] = {
		['Exp'] = "200 * level",
		['PetExp'] = "200 * level",
		['MoneyType'] = 5,
		['MoneyVal'] = "200 * level",
		--['Item'] = {"修理石1",1,1},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "N礼包", Num = 1, Bind = 0, Rand = 5},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1},
		},
	},
	-- ["长安保卫战3"] = {
		-- ['Exp'] = 40000,
		-- ['PetExp'] = 40000,
		-- ['MoneyType'] = 5,
		-- ['MoneyVal'] = 4000,
	-- --	['Item'] = {"修理石1",1,1},
		-- ['RandTime'] = 1,
		-- ['ItemRand'] = {
			-- {ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand = 1500},
			-- {ItemKey = "3级宝石包", Num = 1, Bind = 0, Rand = 500},
		-- },
	-- },
	["保卫战战利品"] = {
		['Exp'] = 0,
		['PetExp'] = 0,
		['MoneyType'] = 5,
		['MoneyVal'] = 0,
		--['Item'] = {"修理石1",1,1},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小银币袋", Num = 1, Bind = 0, Rand =500},
			{ItemKey = "小银币袋", Num = 1, Bind = 0, Rand =1000},
			{ItemKey = "中银币袋", Num = 1, Bind = 0, Rand =500},
			{ItemKey = "高级宝石福袋", Num = 1, Bind = 0, Rand =500},
			{ItemKey = "SSR礼包", Num = 1, Bind = 0, Rand =100},
			{ItemKey = "SR礼包", Num = 1, Bind = 0, Rand =500},
			{ItemKey = "R礼包", Num = 1, Bind = 0, Rand =1000},
			{ItemKey = "N礼包", Num = 1, Bind = 0, Rand =1500},
			{ItemKey = "50书铁", Num = 1, Bind = 0, Rand =2000},
			{ItemKey = "60书铁", Num = 1, Bind = 0, Rand =1000},
			{ItemKey = "70书铁", Num = 1, Bind = 0, Rand =300},
			{ItemKey = "80书铁", Num = 1, Bind = 0, Rand =100},
			{ItemKey = "死亡替身", Num = 1, Bind = 0, Rand =500},
			{ItemKey = "小银币袋", Num = 1, Bind = 0, Rand =500},
		},
	},
}