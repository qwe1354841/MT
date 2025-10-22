--丹炉活动配置
DanLuConfig = {}

--活动界面显示的物品 字符串 物品id
DanLuConfig.ShowItem = "61024,20100,31006"

--活动期间上限就送
DanLuConfig.LoginItem = {"太清避火丹",20,1, "精金小锤子",10,1, "暗淡的金丹",20,1}

--参与打怪-器灵 最少人数 范围1-5
DanLuConfig.JoinMinNum = 1
--战斗标识
DanLu.FightTag = 10034
--npc刷新时间 （秒）
DanLuConfig.RefreshTime = 3600
--npc销毁时间 （秒）
DanLuConfig.DestroyTime = 3600
--npc刷新数量 -能否活动 1能活动
DanLuConfig.Refresh = {
	["江南野外"] = {
		["五一活动-器灵"] = {Num = 20, Move = 1},
		["五一活动-普通残渣"] = {Num = 10, Move = 0},
		["五一活动-坚固残渣"] = {Num = 6, Move = 0},
		["五一活动-金色残渣"] = {Num = 3, Move = 0},
	},
	["大唐国境"] = {
		["五一活动-器灵"] = {Num = 20, Move = 1},
		["五一活动-普通残渣"] = {Num = 15, Move = 0},
		["五一活动-坚固残渣"] = {Num = 9, Move = 0},
		["五一活动-金色残渣"] = {Num = 4, Move = 0},
	},
	["傲来村野"] = {
		["五一活动-器灵"] = {Num = 20, Move = 1},
		["五一活动-普通残渣"] = {Num = 10, Move = 0},
		["五一活动-坚固残渣"] = {Num = 6, Move = 0},
		["五一活动-金色残渣"] = {Num = 3, Move = 0},
	},
	["长安城"] = {
		["五一活动-器灵"] = {Num = 40, Move = 1},
		["五一活动-普通残渣"] = {Num = 20, Move = 0},
		["五一活动-坚固残渣"] = {Num = 12, Move = 0},
		["五一活动-金色残渣"] = {Num = 6, Move = 0},
	},
}
--npc怪物对照表 -npc 消耗物品keyname 消耗物品数量  怪物组id
DanLuConfig.NPCToMonster = {
	["五一活动-器灵"] = {
		['ConsumeItem'] = "太清避火丹",
		['ConsumeNum'] = 1,
		['MonID'] = 4301
	},
}

DanLuConfig.DropReward = {
	["五一活动-普通残渣"] = {
		--[ConsumeItem]=消耗的物品
		--[Open]={消耗物品数量，打开概率(显示用)(万分比), 真实打开概率(万分比)}
		['ConsumeItem'] = "精金小锤子",
		['Open'] = {
			{Consume = 1,Rand = 7500, RealRand = 6000},
			{Consume = 2,Rand = 10000, RealRand = 10000},
		},
	},
	["五一活动-坚固残渣"] = {
		['ConsumeItem'] = "精金小锤子",
		['Open'] = {
			{Consume = 1,Rand = 5000, RealRand = 4000},
			{Consume = 2,Rand = 7500, RealRand = 8000},
			{Consume = 3,Rand = 10000, RealRand = 10000},
		},
	},
	["五一活动-金色残渣"] = {
		['ConsumeItem'] = "精金小锤子",
		['Open'] = {
			{Consume = 1,Rand = 2500, RealRand = 2000},
			{Consume = 2,Rand = 5000, RealRand = 4000},
			{Consume = 5,Rand = 10000, RealRand = 10000},
		},
	},

}

--丹炉奖励 
DanLuConfig.Reward = {
	['五一活动-器灵'] = {
		['Exp'] = "level * 100",
		['MoneyType'] = 5,
		['MoneyVal'] = {20000, 50000},
		['Item'] = {"中级装备培养礼包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "暗淡的金丹", Num = 1, Bind = 1, Rand = 5000},
					{ItemKey = "暗淡的金丹", Num = 2, Bind = 1, Rand = 5000},
				},
			},
			[2] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "Nil", Num = 1, Bind = 1, Rand = 500},
					{ItemKey = "精金小锤子", Num = 1, Bind = 1, Rand = 500},
				},
			},
			[3] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = '高级炼妖礼包',Num = 1,Bind = 0,Rand = 1000},
					{ItemKey = '低级炼妖礼包',Num = 1,Bind = 0,Rand = 10000},
					{ItemKey = '中级炼妖礼包',Num = 1,Bind = 0,Rand = 2500},
				},
			},
		},
	},
	["五一活动-普通残渣"] = {
		['Exp'] = "level * 100",
		['MoneyType'] = 5,
		['MoneyVal'] = {20000, 50000},
		['Item'] = {"普通宠物技能包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "暗淡的金丹", Num = 1, Bind = 1, Rand = 3000},
					{ItemKey = "暗淡的金丹", Num = 2, Bind = 1, Rand = 5000},
					{ItemKey = "暗淡的金丹", Num = 3, Bind = 1, Rand = 2000},
				},
			},
			[2] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "低级炼妖礼包", Num = 1, Bind = 0, Rand = 5000},
					{ItemKey = "中级炼妖礼包", Num = 1, Bind = 0, Rand = 500},
					{ItemKey = "高级炼妖礼包", Num = 1, Bind = 0, Rand = 50},
				},
			},
		},
	},
	["五一活动-坚固残渣"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = {70000, 120000},
		['Item'] = {"高级宠物技能包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "暗淡的金丹", Num = 2, Bind = 1, Rand = 2000},
					{ItemKey = "暗淡的金丹", Num = 3, Bind = 1, Rand = 3000},
					{ItemKey = "暗淡的金丹", Num = 4, Bind = 1, Rand = 3000},
					{ItemKey = "暗淡的金丹", Num = 5, Bind = 1, Rand = 2000},
				},
			},
			[2] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "低级炼妖礼包", Num = 1, Bind = 0, Rand = 5000},
					{ItemKey = "中级炼妖礼包", Num = 1, Bind = 0, Rand = 1000},
					{ItemKey = "高级炼妖礼包", Num = 1, Bind = 0, Rand = 200},
					{ItemKey = "终极炼妖礼包", Num = 1, Bind = 0, Rand = 40},

				},
			},
		},
	},
	["五一活动-金色残渣"] = {
		['Exp'] = "level * 500",
		['MoneyType'] = 5,
		['MoneyVal'] = {200000, 500000},
		['Item'] = {"终极宠物技能包",1,0},
		['RandItemList']={
			[1] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "暗淡的金丹", Num = 4, Bind = 1, Rand = 3000},
					{ItemKey = "暗淡的金丹", Num = 5, Bind = 1, Rand = 4000},
					{ItemKey = "暗淡的金丹", Num = 6, Bind = 1, Rand = 5000},
					{ItemKey = "暗淡的金丹", Num = 7, Bind = 1, Rand = 5000},
					{ItemKey = "暗淡的金丹", Num = 8, Bind = 1, Rand = 4000},
					{ItemKey = "暗淡的金丹", Num = 9, Bind = 1, Rand = 2000},
					{ItemKey = "暗淡的金丹", Num = 10, Bind = 1, Rand = 1000},
					{ItemKey = "暗淡的金丹", Num = 11, Bind = 1, Rand = 1000},
				},
			},
			[2] = {
				['RandTime'] = 1,
				['ItemRand'] = {
					{ItemKey = "中级炼妖礼包", Num = 1, Bind = 0, Rand = 5000},
					{ItemKey = "高级炼妖礼包", Num = 1, Bind = 0, Rand = 2000},
					{ItemKey = "终极炼妖礼包", Num = 1, Bind = 0, Rand = 800},
					{ItemKey = "天龙珠礼包", Num = 1, Bind = 0, Rand = 800},
				},
			},
		},
	},
}

function DanLuConfig.Initialization()
	--初始化 发邮件需要的item表 keyname==>id
	DanLuConfig.MailItemList={}
	if DanLuConfig.LoginItem then
		for k,v in pairs(DanLuConfig.LoginItem) do
			if type(v) == "string" and type(DanLuConfig.LoginItem[k+1]) == "number" and type(DanLuConfig.LoginItem[k+2]) == "number" then
				local itemData = ItemConfig.GetByKeyName(v)
				table.insert(DanLuConfig.MailItemList, itemData.Id)
				table.insert(DanLuConfig.MailItemList, DanLuConfig.LoginItem[k+1])
				table.insert(DanLuConfig.MailItemList, DanLuConfig.LoginItem[k+2])
			end
		end
	else
		sLuaApp:LuaErr("缺少DanLuConfig.LoginItem")
	end
end
--DanLuConfig.Initialization()