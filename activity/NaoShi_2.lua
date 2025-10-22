--十二星官（配置脚本
NaoShi_2 = {}

--参与次数上限
NaoShi_2.Join_Max = 0
--单次参加获得的活跃值
NaoShi_2.Active_Add = 0
--活跃值上限
NaoShi_2.Active_Max = 0 
--活动界面 展示奖励 物品id
NaoShi_2.ShowItem = "61025,61024,61002,61007,20169"
--参与队伍最少人数 范围1-5
NaoShi_2.JoinMinNum = 3
--活动名称
NaoShi_2.Active_Name = "十二星官" 

--是否需要世界公告，并为以下内容，不需要则为""或注释掉,下边NaoShi_2.OnStart()还需要存该数据
--NaoShi_2.Active_OnStartMsg = ""

--是否刷怪时显示公告，并为以下内容，不需要则为""或注释掉,下边NaoShi_2.OnStart()还需要存该数据
--NaoShi_2.Active_MsgOnNpcRefresh = ""

--npc刷新 地图keyname NPCkeyname 对应怪物组id 刷新数量
NaoShi_2.Refresh = {
	["傲来村野"] = {
		{NPCName = "亢金龙", MonID = 31001, Num = 1},
		{NPCName = "张月鹿", MonID = 31002, Num = 1},
		{NPCName = "昴日鸡", MonID = 31003, Num = 1},
		{NPCName = "牛金牛", MonID = 31004, Num = 1},
		{NPCName = "参水猿", MonID = 31007, Num = 1},
		{NPCName = "娄金狗", MonID = 31011, Num = 1},
		{NPCName = "鬼金羊", MonID = 31006, Num = 1},
	},
	["东海海湾"] = {
		{NPCName = "亢金龙", MonID = 31001, Num = 1},
		{NPCName = "心月狐", MonID = 31005, Num = 1},
		{NPCName = "鬼金羊", MonID = 31006, Num = 1},
		{NPCName = "参水猿", MonID = 31007, Num = 1},
		{NPCName = "室火猪", MonID = 31008, Num = 1},
		{NPCName = "尾火虎", MonID = 31009, Num = 1},
		{NPCName = "斗木獬", MonID = 31012, Num = 1},
	},
	["江南野外"] = {
		{NPCName = "尾火虎", MonID = 31009, Num = 1},
		{NPCName = "昴日鸡", MonID = 31003, Num = 1},
		{NPCName = "星日马", MonID = 31010, Num = 1},
		{NPCName = "娄金狗", MonID = 31011, Num = 1},
		{NPCName = "斗木獬", MonID = 31012, Num = 1},
		{NPCName = "心月狐", MonID = 31005, Num = 1},
		{NPCName = "室火猪", MonID = 31008, Num = 1},
	},
	
}
--一个小时为一个周期{开始刷怪时间(分：秒)，本次怪物存在时间(秒)}
NaoShi_2.RefreshTime = {
	{"05:30", 900},
	{"15:30", 900},
	{"26:30", 900},
	{"31:30", 900},
	{"42:30", 900},
}

--活动物品掉落限制
NaoShi_2.RewardDropLimit = {
	--["道具keyname"] = 最大获得的数量，如
	-- ["小修炼丹"] = 2 ,
	-- ["混元石"] = 2
}
--奖励
--表格前两位{最大值，最小值}  数据类型 - 数字/等级相关的字符串 
--MoneyType 货币类型  MoneyVal 货币数量
--Item 固定物品表 ItemRand 随机物品表 RandTime随机几次
NaoShi_2.Reward = {
	--0转 1~9级
	["0_1-9"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 10~39级
	["0_10-39"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 40~59级
	["0_40-59"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 60~79级
	["0_60-79"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 80~99级
	["0_80-99"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 100~119级
	["0_100-119"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--0转 120~120级
	["0_120-120"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
	--1转 及以上 
	["else"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = "level * 200",
		--['Item'] = {"战功牌",1,1,},
		['RandTime'] = 1,
		['ItemRand'] = {
			{ItemKey = "小修炼丹", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "混元石", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "阵法书残卷", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "宝石福袋", Num = 1, Bind = 0, Rand = 1000},
			{ItemKey = "绿品宠物装备盒", Num = 1, Bind = 0, Rand = 2000},
			{ItemKey = "蓝品宠物装备盒", Num = 1, Bind = 0, Rand = 200},
			{ItemKey = "紫品宠物装备盒", Num = 1, Bind = 0, Rand = 50},
			{ItemKey = "nil", Num = 1, Bind = 0, Rand = 4000},
		},
	},
}

-- 活动开始前回调
function NaoShi_2.OnDeclare(id, seconds)
	NaoShi.OnDeclare(id, seconds)
end

-- 活动开始回调
function NaoShi_2.OnStart(id, is_normal)
	if Data then
		if not Data.NaoShi then
			Data.NaoShi = {}
		end
		local s_id = tostring(id)
		Data.NaoShi[s_id] = {}
		Data.NaoShi[s_id]["Join_Max"] = NaoShi_2.Join_Max
		Data.NaoShi[s_id]["Active_Add"] = NaoShi_2.Active_Add
		Data.NaoShi[s_id]["Active_Max"] = NaoShi_2.Active_Max
		Data.NaoShi[s_id]["Refresh"] = NaoShi_2.Refresh
		Data.NaoShi[s_id]["RefreshTime"] = NaoShi_2.RefreshTime
		Data.NaoShi[s_id]["Reward"] = NaoShi_2.Reward
		Data.NaoShi[s_id]["JoinMinNum"] = NaoShi_2.JoinMinNum
		Data.NaoShi[s_id]["Active_Name"] = NaoShi_2.Active_Name
		Data.NaoShi[s_id]["RewardDropLimit"] = NaoShi_2.RewardDropLimit
		--Data.NaoShi[s_id]["Active_OnStartMsg"] = NaoShi_2.Active_OnStartMsg
		--Data.NaoShi[s_id]["Active_MsgOnNpcRefresh"] = NaoShi_2.Active_MsgOnNpcRefresh
	else
		--NaoShi.OnStop(id)
	end
	NaoShi.OnStart(id, is_normal)
end

-- 活动结束回调
function NaoShi_2.OnStop(id)
	Data.NaoShi[id] = nil
	NaoShi.OnStop(id)
end

-- 玩家点击参与活动回调
function NaoShi_2.OnJoin(id, player)
	NaoShi.OnJoin(id, player)
end

-- 玩家客户端查询数据回调
function NaoShi_2.OnQuery(id, player)
	local join_num = player:GetDayInt("NaoShi_Join_Num"..id)
	local active_num = player:GetDayInt("NaoShi_Active_Num"..id)
	local str = join_num..":"..NaoShi_2.Join_Max..":"..active_num..":"..NaoShi_2.Active_Max..":"..NaoShi_2.ShowItem..":2:"..ActivitySystem.Act_GetClassify("NaoShi_2")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end
