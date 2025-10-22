--帮派摇钱树配置
GuildCashTreeConfig = {}

--单次获得活跃值
GuildCashTreeConfig.ActiveAddNum = 2
--获得活跃值上限
GuildCashTreeConfig.ActiveMax = 20
--活动界面显示的物品 字符串 物品id
GuildCashTreeConfig.ShowItem = "61025,61024,30002,20349,60001"

--摇钱树种植地点 在帮派领地的位置
GuildCashTreeConfig.Site = {159,135}
--摇钱树生长阶段时长 分钟   --收获阶段时长 = 活动表中配置的活动时长 - GrowTime
GuildCashTreeConfig.GrowTime = 60
-- 摇钱树npc变化 任务完成数量达到 X万分比时 npc变化  
	--活动开始时万分比为0 必须配置 --万分比10000表示任务做完摇钱树成熟 必须配置
GuildCashTreeConfig.NPCChange = {
	[0] = "摇钱树幼苗",
	[5000] = "摇钱树成熟",
	[10000] = "摇钱树完全",
}
--邮件内容 任务完成数量达到 X万分比时 发生邮件内容 
	--活动开始时万分比为0 必须配置 --万分比10000表示任务做完摇钱树成熟 必须配置
GuildCashTreeConfig.MailMsg = {
	[0] = "天生异象，帮派领地中竟然长出一棵树苗！经帮派师爷鉴定，这是一棵摇钱树，摇钱树从生长到成熟都伴随着珍宝，各位少侠切勿错过！",
	[5000] = "摇钱树在各位的努力下茁壮成长，希望各位少侠再接再厉！",
	[10000] = "摇钱树在各位的齐心协力下，终于成熟了！请各位在帮派领地的摇钱树处，摇下属于自己的珍宝吧~",
}

--可获得个人奖励的任务数量
GuildCashTreeConfig.OwnRewardNum = 5
--摇钱树等级 需要完成的任务数量 随机任务的比重 
GuildCashTreeConfig.Task = {
	["Level_1"] = {
		["TaskNum"] = 25,--任务总量
		["TaskRandom"] = {
			{Event = "除草", Rand = 1000},
			{Event = "施肥", Rand = 1000},
			{Event = "浇水", Rand = 1500},
			{Event = "除虫", Rand = 1000},
			{Event = "盗贼", Rand = 100},
		},
	},
	["Level_2"] = {
		["TaskNum"] = 40,--任务总量
		["TaskRandom"] = {
			{Event = "除草", Rand = 1000},
			{Event = "施肥", Rand = 1000},
			{Event = "浇水", Rand = 1000},
			{Event = "除虫", Rand = 1000},
			{Event = "盗贼", Rand = 1000},
		},
	},
	["Level_3"] = {
		["TaskNum"] = 60,--任务总量
		["TaskRandom"] = {
			{Event = "除草", Rand = 1000},
			{Event = "施肥", Rand = 1000},
			{Event = "浇水", Rand = 1000},
			{Event = "除虫", Rand = 1000},
			{Event = "盗贼", Rand = 1000},
		},
	},
	["Level_4"] = {
		["TaskNum"] = 80,--任务总量
		["TaskRandom"] = {
			{Event = "除草", Rand = 1000},
			{Event = "施肥", Rand = 1000},
			{Event = "浇水", Rand = 1000},
			{Event = "除虫", Rand = 1000},
			{Event = "盗贼", Rand = 1000},
		},
	},
	["Level_5"] = {
		["TaskNum"] = 100,--任务总量
		["TaskRandom"] = {
			{Event = "除草", Rand = 1500},
			{Event = "施肥", Rand = 1000},
			{Event = "浇水", Rand = 500},
			{Event = "除虫", Rand = 1500},
			{Event = "盗贼", Rand = 1000},
		},
	},
}

--盗贼 -战斗胜利后 留下一个宝箱
--除虫 -进入战斗选项中 选择使用物品，可以增加本次任务奖励
--除草 -选项中 选择使用物品 降低战斗难度
--浇水 -在地图上随机刷新npc 点击npc取水
--施肥 -摇钱树npc给选项，选择不同选项给不同奖励
-- 选择 TreeOption 或 NPCOption（有MonID会进入战斗） 即表示任务完成
	--任务奖励配置支持与人物等级和摇钱树等级相关	不应该也不支持与任务进度相关
	--不支持配置任务奖励中随机礼包的Rand
GuildCashTreeConfig.Event = {
	["除虫"] = {
		["TreeExplain"] = "周围有虫子咬我，少侠救我！",
		["NPCKeyName"] = "帮派摇钱树_1",
		["MonID"] = 6212,
		["Reward"] = {
		--	["Exp"] = "5000 * TreeLevel + 100 * PlayerLevel",
		--	["PetExp"] = "5000 * TreeLevel + 100 * PlayerLevel",
			["MoneyType"] = 5,
			["MoneyVal"] = "500 * TreeLevel + 10 * PlayerLevel",
			["GuildFund"] = "5 * TreeLevel + 0.5 * PlayerLevel",
			["GuildContribute"] = "250 * TreeLevel + 25 * PlayerLevel",
				--[[	["Item"] = {},
			["RandItemList"]={
			[1] = {
					["RandTime"] = 1,
					["ItemRand"] = {
						{ItemKey = "义之金叶神", Num = 1, Bind = 0, Rand = 10000},
						{ItemKey = "仁之木叶神", Num = 1, Bind = 0, Rand = 10000},
						{ItemKey = "信之土叶神", Num = 1, Bind = 0, Rand = 10000},
					},
				},
			},--]]
		},
		["NPCExplain"] = "多美味的叶子啊！",
		["NPCOption_0"] = {
			["Msg"] = "徒手消灭虫子！",
		},
		["NPCOption_1"] = {
			["Msg"] = "购买水晶瓶收集虫王精华！",
			["BuyItemName"] = "水晶瓶",
			["ConsumeType"] = 5,
			["ConsumeVal"] = 10000,
			["Reward"] = {
				["Item"] = {"1级宝石包",1,0},
			},
		},

	},
	["除草"] = {
		["TreeExplain"] = "周围杂草丛生，少侠帮帮我！",
		["NPCKeyName"] = "帮派摇钱树_2",
		["MonID"] = 6211,
		["Reward"] = {
		--	["Exp"] = "6000 * TreeLevel + 120 * PlayerLevel",
		--	["PetExp"] = "6000 * TreeLevel + 120 * PlayerLevel",
			["MoneyType"] = 5,
			["MoneyVal"] = "600 * TreeLevel + 12 * PlayerLevel",
			["GuildFund"] = "6 * TreeLevel + 0.6 * PlayerLevel",
			["GuildContribute"] = "300 * TreeLevel + 30 * PlayerLevel",
		},
		["NPCExplain"] = "这里的阳光真好，我就是喜欢晒太阳！",
		["NPCOption_0"] = {
			["Msg"] = "徒手消灭杂草！",
		},
		["NPCOption_1"] = {
			["Msg"] = "购买除草剂消灭杂草！",
			["BuyItemName"] = "除草剂",
			["ConsumeType"] = 5,
			["ConsumeVal"] = 10000,
			["BuffID"] = 735,
		},
	},
	["盗贼"] = {
		["TreeExplain"] = "嘘！我感觉到周围有贼在惦记我的身上的宝贝，烦劳少侠去解决了他！",
		["NPCKeyName"] = "帮派摇钱树_3",
		["MonID"] = 6213,
		["Reward"] = {
		--	["Exp"] = "8000 * TreeLevel + 160 * PlayerLevel",
		--	["PetExp"] = "8000 * TreeLevel + 160 * PlayerLevel",
			["MoneyType"] = 5,
			["MoneyVal"] = "800 * TreeLevel + 16 * PlayerLevel",
			["GuildFund"] = "8 * TreeLevel + 0.8 * PlayerLevel",
			["GuildContribute"] = "400 * TreeLevel + 40 * PlayerLevel",	
		
		},
		["NPCExplain"] = "啊，一棵摇钱树，那可是宝贝啊，宝贝只能在我这里！",
		["NPCOption_0"] = {
			["Msg"] = "大胆小偷，吃你爷爷一棒！",
			["GetBoxRand"] = 8000,
			["BoxKeyName"] = "帮派摇钱树_5",
			["BoxReward"] = {
				["Item"] = {"1级宝石包",1,0},
			},
			["GetBoxTips"] = "小偷逃跑时留下一个宝箱！",
		},

	},
	["浇水"] = {
		["TreeExplain"] = "南海的观音菩萨出现在帮派领地之中，她手中玉净瓶里的灵水可助我生长，烦请少侠找到观音菩萨。",
		["NPCKeyName"] = "帮派摇钱树_4",
		["Reward"] = {
		--	["Exp"] = "4000 * TreeLevel + 80 * PlayerLevel",
		--	["PetExp"] = "4000 * TreeLevel + 80 * PlayerLevel",
			["MoneyType"] = 5,
			["MoneyVal"] = "400 * TreeLevel + 8 * PlayerLevel",
			["GuildFund"] = "4 * TreeLevel + 0.4 * PlayerLevel",
			["GuildContribute"] = "200 * TreeLevel + 20 * PlayerLevel",	
		},
		["NPCRefreshArea"] = {
			{["X"] = 70,["Y"] = 220,["Range"] = 30},
			{["X"] = 254,["Y"] = 193,["Range"] = 40},
			{["X"] = 264,["Y"] = 113,["Range"] = 30},
			{["X"] = 208,["Y"] = 32,["Range"] = 10},
			{["X"] = 119,["Y"] = 38,["Range"] = 10},
		},
		["NPCOption_0"] = {
			["Msg"] = "请菩萨帮帮摇钱树！",
		},
		["NPCExplain"] = "我这玉净瓶里装的可是五湖四海的水。",

	},
	["施肥"] = {
		["TreeExplain"] = "这广场上怎么干净得一点养分都没有？少侠帮帮我！",
		["TreeOption_0"] = {
			["Msg"] = "朴实无华农家肥",
			-- ["BuyItemName"] = "农家肥",
			-- ["ConsumeType"] = 5,
			-- ["ConsumeVal"] = 2000,
			["Reward"] = {
			--	["Exp"] = "4000 * TreeLevel + 80 * PlayerLevel",
			--	["PetExp"] = "4000 * TreeLevel + 80 * PlayerLevel",
				["MoneyType"] = 5,
				["MoneyVal"] = "400 * TreeLevel + 8 * PlayerLevel",
				["GuildFund"] = "4 * TreeLevel + 0.4 * PlayerLevel",
				["GuildContribute"] = "200 * TreeLevel + 20 * PlayerLevel",			
			},
		},
		["TreeOption_1"] = {
			["Msg"] = "轻奢之选无机肥",
			["BuyItemName"] = "无机肥",
			["ConsumeType"] = 5,
			["ConsumeVal"] = 20000,
			["Reward"] = {
			--	["Exp"] = "6000 * TreeLevel + 120 * PlayerLevel",
			--	["PetExp"] = "6000 * TreeLevel + 120 * PlayerLevel",
				["MoneyType"] = 5,
				["MoneyVal"] = "600 * TreeLevel + 12 * PlayerLevel",
				["GuildFund"] = "6 * TreeLevel + 0.6 * PlayerLevel",
				["GuildContribute"] = "300 * TreeLevel + 30 * PlayerLevel",
				["Item"] = {"藏宝图",1,0},
			},
		},
		["TreeOption_2"] = {
			["Msg"] = "富丽堂皇复合肥",
			["BuyItemName"] = "复合肥",
			["ConsumeType"] = 1,
			["ConsumeVal"] = 200,
			["Reward"] = {
			--	["Exp"] = "8000 * TreeLevel + 160 * PlayerLevel",
			--	["PetExp"] = "8000 * TreeLevel + 160 * PlayerLevel",
				["MoneyType"] = 5,
				["MoneyVal"] = "800 * TreeLevel + 16 * PlayerLevel",
				["GuildFund"] = "8 * TreeLevel + 0.8 * PlayerLevel",
				["GuildContribute"] = "400 * TreeLevel + 40 * PlayerLevel",	
				["RandItemList"]={
					[1] = {
						["RandTime"] = 1,
						["ItemRand"] = {
							{ItemKey = "藏宝图", Num = 1, Bind = 0, Rand =500},
							{ItemKey = "烹饪材料2", Num = 1, Bind = 0, Rand =500},
							{ItemKey = "烹饪材料3", Num = 1, Bind = 0, Rand =500},
							{ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand =500},
							{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand =500},
						},
					},
				},
			},
		},
	},
	
}

--收获/任务留下的宝箱 进度条时间(毫秒)
GuildCashTreeConfig.ProgressBarTime = 3000
--#收获/任务留下的宝箱 进度条提示
GuildCashTreeConfig.ProgressBarTip = "开启中..."

-- 完成全部任务摇钱树说的话
GuildCashTreeConfig.TreeNoHarvestMsg = "各位没有满足我的全部需求！我现在营养不良的样子都怪你们！"
-- 没完成全部任务说的话
GuildCashTreeConfig.TreeHarvestMsg = "各位满足了我的所有请求，谢谢！请各位摇下自己的奖励吧。"
-- 摇钱树收获阶段摇下的宝箱
GuildCashTreeConfig.FinalBox = "帮派摇钱树_6"

-- 收获阶段奖励 
	--支持配置奖励中随机礼包的Rand --Rand计算结果 < 0 时  Rand = 0 
	--配置支持 摇钱树等级TreeLevel相关 与摇钱树任务进度完成度TaskRatio相关（0 - 100%）  
	--配置不支持与人物等级相关 （如果需要和等级相关 可以分两个奖励表发）
GuildCashTreeConfig.FinalReward = {
	["Exp"] = 0,
	["PetExp"] = 0,
	["MoneyType"] = 5,
	["MoneyVal"] = "20000 + 2000 * TreeLevel + 20000 * TaskRatio",
	["GuildFund"] = "200 + 20 * TreeLevel + 0.2 * TaskRatio",
	["GuildContribute"] = "10000 + 1000 * TreeLevel + 10 * TaskRatio",
	--["Item"] = {"仙兽玉牌",1,0},
	["RandItemList"]={
		[1] = {
			["RandTime"] = 1,
			["ItemRand"] = {
				{ItemKey = "人物染料", Num = 1, Bind = 0, Rand =100},
				{ItemKey = "宠物染料", Num = 1, Bind = 0, Rand =100},
				{ItemKey = "制药材料1", Num = 1, Bind = 0, Rand =250},
				{ItemKey = "制药材料2", Num = 1, Bind = 0, Rand =250},
				{ItemKey = "制药材料3", Num = 1, Bind = 0, Rand =250},
				{ItemKey = "制药材料4", Num = 1, Bind = 0, Rand =250},
				{ItemKey = "制药材料5", Num = 1, Bind = 0, Rand =250},
				{ItemKey = "藏宝图", Num = 1, Bind = 0, Rand =500},
				{ItemKey = "烹饪材料2", Num = 1, Bind = 0, Rand =500},
				{ItemKey = "烹饪材料3", Num = 1, Bind = 0, Rand =500},
				{ItemKey = "烹饪佐料2", Num = 1, Bind = 0, Rand =500},
				{ItemKey = "烹饪佐料3", Num = 1, Bind = 0, Rand =500},
				{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand =950},
				{ItemKey = "活力药1", Num = 1, Bind = 0, Rand =1000},
				{ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand =1000},
				{ItemKey = "还原丹", Num = 1, Bind = 0, Rand =1000},
				{ItemKey = "烹饪佐料1", Num = 1, Bind = 0, Rand =1000},
				{ItemKey = "烹饪材料1", Num = 1, Bind = 0, Rand =1000},
				{ItemKey = "高级宠物染料", Num = 1, Bind = 0, Rand ="25 * (TreeLevel-1)"},--2级
				{ItemKey = "高级人物染料", Num = 1, Bind = 0, Rand ="25 * (TreeLevel-1)"},--2级
			
				{ItemKey = "1级宝石包", Num = 1, Bind = 0, Rand = 20000},
				{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 2000},
				{ItemKey = "普通宠物秘籍包", Num = 1, Bind = 0, Rand = 10000},
				{ItemKey = "4级宝石福袋", Num = 1, Bind = 0, Rand = 5000},
				{ItemKey = "高级宝石福袋", Num = 1, Bind = 0, Rand = "100 * (TreeLevel-1)"},--2级
				{ItemKey = "6级宝石福袋", Num = 1, Bind = 0, Rand = "100 * (TreeLevel-1)"},--2级
				{ItemKey = "极品宝石福袋", Num = 1, Bind = 0, Rand = "10 * (TreeLevel-2)"},--3级
				{ItemKey = "高级宠物秘籍包", Num = 1, Bind = 0, Rand = "5 * (TreeLevel-3)"},--4级
				{ItemKey = "随机神兽碎片", Num = 1, Bind = 0, Rand = "5 * (TreeLevel-3)"},--4级
				{ItemKey = "8级宝石福袋", Num = 1, Bind = 0, Rand = "2 * (TreeLevel-3)"},--4级
				{ItemKey = "9级宝石福袋", Num = 1, Bind = 0, Rand = "1 * (TreeLevel-4)"},--5级
				{ItemKey = "神兽饰品", Num = 1, Bind = 0, Rand = "10 * (TreeLevel-4)"},--5级
				{ItemKey = "神兽吞噬宠物", Num = 1, Bind = 0, Rand = "1 * (TreeLevel-4)"},--5级
			},
		},
	},

}

function GuildCashTreeConfig.Initialization()
	GuildCashTreeConfig.NPCChangeEx = {}
	GuildCashTreeConfig.MailMsgEx = {}
	local i = 1
	while GuildCashTreeConfig.Task["Level_"..i] do
		local task_num = GuildCashTreeConfig.Task["Level_"..i]["TaskNum"]
		GuildCashTreeConfig.NPCChangeEx[i] = {}
		for k,v in pairs(GuildCashTreeConfig.NPCChange) do
			GuildCashTreeConfig.NPCChangeEx[i][math.floor(task_num*k/10000)] = v
		end
		GuildCashTreeConfig.MailMsgEx[i] = {}
		for k,v in pairs(GuildCashTreeConfig.MailMsg) do
			GuildCashTreeConfig.MailMsgEx[i][math.floor(task_num*k/10000)] = v
		end
		i = i + 1
	end
	--sLuaApp:LuaErr("NPCChangeEx"..Lua_tools.serialize(GuildCashTreeConfig.NPCChangeEx))
	--sLuaApp:LuaErr("MailMsgEx"..Lua_tools.serialize(GuildCashTreeConfig.MailMsgEx))
end
GuildCashTreeConfig.Initialization()