--天降宝箱活动配置
TianJiangBaoXiangConfig = {}


--参加次数上限
TianJiangBaoXiangConfig.join_max = 5	
--单次获得活跃值
TianJiangBaoXiangConfig.active_add_num = 2
--获得活跃值上限 
TianJiangBaoXiangConfig.active_max = 10
--活动界面显示的物品 字符串 物品id
TianJiangBaoXiangConfig.ShowItem = "61024,20168,60001"
--宝箱keyname
TianJiangBaoXiangConfig.BoxKeyname = "宝箱"
--宝箱刷新时间 （秒）
TianJiangBaoXiangConfig.RefreshTime = 900
--宝箱销毁时间 （秒）
TianJiangBaoXiangConfig.DestroyTime = 900

--宝箱刷新数量 -能否活动 1能活动
TianJiangBaoXiangConfig.Refresh = {
	["江南野外"] = {Num = 10, Move = 0},
	["傲来村野"] = {Num = 10, Move = 0},
	["长安城"] = {Num = 10, Move = 0},
}
--进度条时间(毫秒)
TianJiangBaoXiangConfig.ProgressBarTime = 3000
--#进度条提示
TianJiangBaoXiangConfig.ProgressBarTip = "打开宝箱中..."
--天降宝箱奖励 
TianJiangBaoXiangConfig.Reward = {
	--['Exp'] = "level * 1500",
	['MoneyType'] = 5,
	['MoneyVal'] = {9000, 11000},
	--['Item'] = {"初级装备培养礼包",1,1},
	['RandTime'] = 1,
	['ItemRand'] = {
		{ItemKey = "SR礼包", Num = 1, Bind = 0, Rand =0},
		{ItemKey = "R礼包", Num = 1, Bind = 0, Rand =2200},
		{ItemKey = "N礼包", Num = 1, Bind = 0, Rand =2900},
		{ItemKey = "常规烟花", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "心形烟花", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "百年好合", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "郎才女貌", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "白头偕老", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "永结同心", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "拉炮1", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "拉炮2", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "单簇烟花", Num = 1, Bind = 0, Rand =100},
		{ItemKey = "死亡替身", Num = 1, Bind = 0, Rand =1000},
	--	{ItemKey = "飞行旗补充包", Num = 1, Bind = 0, Rand =1000},
		{ItemKey = "翅膀升级1", Num = 1, Bind = 0, Rand =2000},
	},
	--['Broadcast'] = {"宠物培养豪华礼包","高级炼妖礼包"}
}