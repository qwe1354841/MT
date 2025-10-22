--闹事的妖怪（配置脚本
NaoShi_1 = {}

--参与次数上限
NaoShi_1.Join_Max = 40
--单次参加获得的活跃值
NaoShi_1.Active_Add = 2
--活跃值上限
NaoShi_1.Active_Max = 10
--活动界面 展示奖励 物品id
NaoShi_1.ShowItem = "61024,61025"
--参与队伍最少人数 范围1-5
NaoShi_1.JoinMinNum = 3
--活动名称(也是必须配置
NaoShi_1.Active_Name = "闹事的妖怪" 
--VIP加成奖励次数（无则不需要配置或""）
NaoShi_1.VipEnhanced_Times = "闹事的妖怪奖励次数"
--VIP加成奖励经验（无则不需要配置或""）
NaoShi_1.VipEnhanced_Exp = "闹事的妖怪经验提升"
--VIP加成奖励银币（无则不需要配置或""）
NaoShi_1.VipEnhanced_Money = "闹事的妖怪银币提升"
--npc刷新 地图keyname NPCkeyname 对应怪物组id 刷新数量
NaoShi_1.Refresh = {
	["大唐国境"] = {
		{NPCName = "放妖-闹事的山贼斥候", MonID = 20005, Num = 6},
		{NPCName = "放妖-闹事的戍边府逃兵", MonID = 20005, Num = 3},
		{NPCName = "放妖-闹事的瑞兽幼崽", MonID = 20005, Num = 3},
	},	
	["大唐境外"] = {
		{NPCName = "放妖-闹事的水判官", MonID = 20009, Num = 6},
		{NPCName = "放妖-闹事的灵木怪", MonID = 20010, Num = 3},
		{NPCName = "放妖-闹事的幻灵鹿", MonID = 20011, Num = 3},
	},	
	["解阳山"] = {
		{NPCName = "放妖-闹事的素尾白狐", MonID = 20021, Num = 3},
		{NPCName = "放妖-闹事的冰魄剑灵", MonID = 20019, Num = 3},
		{NPCName = "放妖-闹事的水帘妖", MonID = 20021, Num = 3},
		{NPCName = "放妖-闹事的踏火神犀", MonID = 20019, Num = 3},
	},	
}


--一个小时为一个周期{开始刷怪时间(分：秒)，本次怪物存在时间(秒)}
NaoShi_1.RefreshTime = {
	{"05:30", 600},
	{"15:30", 600},
	{"25:30", 600},
	{"35:30", 600},
	{"45:30", 600},
	{"55:30", 600},
}

--奖励
--表格前两位{最大值，最小值}  数据类型 - 数字/等级相关的字符串 
--MoneyType 货币类型  MoneyVal 货币数量
--Item 固定物品表 ItemRand 随机物品表 RandTime随机几次
NaoShi_1.Reward = {
	--0转 1~9级
	["0_1-9"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 6900},
		},
	},
	--0转 10~39级
	["0_10-39"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "15级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 6400},
		},
	},
	--0转 40~59级
	["0_40-59"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "15级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "45级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	--0转 60~79级
	["0_60-79"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "45级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "65级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	--0转 80~99级
	["0_80-99"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "65级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "85级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	--0转 100~119级
	["0_100-119"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "85级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "105级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	--0转 120~120级
	["0_120-120"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "105级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "125级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	--1转 及以上 
	["else"] = {
		['Exp'] = "level * 180",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 180",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "105级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "125级宠物装备礼包", Num = 1, Bind = 0, Rand = 500},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 5900},
		},
	},
	
}

-- 活动开始前回调
function NaoShi_1.OnDeclare(id, seconds)
	NaoShi.OnDeclare(id, seconds)
end

-- 活动开始回调
function NaoShi_1.OnStart(id, is_normal)
	if Data then
		if not Data.NaoShi then
			Data.NaoShi = {}
		end
		local s_id = tostring(id)
		Data.NaoShi[s_id] = {}
		Data.NaoShi[s_id]["Join_Max"] = NaoShi_1.Join_Max
		Data.NaoShi[s_id]["Active_Add"] = NaoShi_1.Active_Add
		Data.NaoShi[s_id]["Active_Max"] = NaoShi_1.Active_Max
		Data.NaoShi[s_id]["Refresh"] = NaoShi_1.Refresh
		Data.NaoShi[s_id]["RefreshTime"] = NaoShi_1.RefreshTime
		Data.NaoShi[s_id]["Reward"] = NaoShi_1.Reward
		Data.NaoShi[s_id]["JoinMinNum"] = NaoShi_1.JoinMinNum
		Data.NaoShi[s_id]["Active_Name"] = NaoShi_1.Active_Name 
		Data.NaoShi[s_id]["VipEnhanced_Times"] = NaoShi_1.VipEnhanced_Times
		Data.NaoShi[s_id]["VipEnhanced_Exp"] = NaoShi_1.VipEnhanced_Exp
		Data.NaoShi[s_id]["VipEnhanced_Money"] = NaoShi_1.VipEnhanced_Money
	else
		--NaoShi.OnStop(id)
	end
	NaoShi.OnStart(id, is_normal)
end

-- 活动结束回调
function NaoShi_1.OnStop(id)
	Data.NaoShi[id] = nil
	NaoShi.OnStop(id)
end

-- 玩家点击参与活动回调
function NaoShi_1.OnJoin(id, player)
	NaoShi.OnJoin(id, player)
end

-- 玩家客户端查询数据回调
function NaoShi_1.OnQuery(id, player)
	local join_num = player:GetDayInt("NaoShi_Join_Num"..id)
	local active_num = player:GetDayInt("NaoShi_Active_Num"..id)
	local Join_Max = VipLogic.GetVipEnhanced(player,"闹事的妖怪奖励次数", "times", NaoShi_1.Join_Max)
	if join_num >= Join_Max then
		join_num = Join_Max
	end
	local str = join_num..":"..Join_Max..":"..active_num..":"..NaoShi_1.Active_Max..":"..NaoShi_1.ShowItem..":2:"..ActivitySystem.Act_GetClassify("NaoShi_1")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end