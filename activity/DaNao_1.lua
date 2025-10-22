DaNao_1 = {}
--大闹天宫

--参与次数上限
DaNao_1.Join_Max = 10
--单次参加获得的活跃值
DaNao_1.Active_Add = 2
--活跃值上限
DaNao_1.Active_Max = 20
--活动界面 展示奖励 物品id
DaNao_1.ShowItem = "61024, 61025"
--参与队伍最少人数 范围1-5
DaNao_1.JoinMinNum = 1

--npc刷新 地图keyname NPCKeyname 对应怪物组id 刷新数量
DaNao_1.Refresh = {
	["天界"] = {
		{NPCName = "大闹护卫_1", MonID = 6204, Num = 30 },
		{NPCName = "大闹护卫_2", MonID = 6205, Num = 20 },
		{NPCName = "大闹护卫_3", MonID = 6206, Num = 10 },
		{NPCName = "大闹护卫_4", MonID = 6207, Num = 5  },
		{NPCName = "大闹护卫_5", MonID = 6208, Num = 3  },
	},
	["长安城"] = {
		{NPCName = "大闹护卫_1", MonID = 6204, Num = 30 },
		{NPCName = "大闹护卫_2", MonID = 6205, Num = 20 },
		{NPCName = "大闹护卫_3", MonID = 6206, Num = 10 },
		{NPCName = "大闹护卫_4", MonID = 6207, Num = 5  },
		{NPCName = "大闹护卫_5", MonID = 6208, Num = 3  },
	}
}

--1小时为一个周期{开始刷怪时间(分:秒), 本次怪物存在时间(秒)}
DaNao_1.RefreshTime = {
	{"05:30", 1800},
	{"31:30", 1800}
}

--奖励
--表格前两位{最大值，最小值}  数据类型 - 数字/等级相关的字符串 
--MoneyType 货币类型  MoneyVal 货币数量
--Item 固定物品表 ItemRand 随机物品表 RandTime随机几次

DaNao_1.Reward = {
	["大闹护卫_1"] = {
		['Exp'] = "level * 100",
		['MoneyType'] = 5,
		['MoneyVal'] = {2000,5000},
		['Integral'] = {MoneyType = "DaNaoIntegral", MoneyName = "大闹积分"},
		['IntegralVal'] = 100,
	},
	["大闹护卫_2"] = {
		['Exp'] = "level * 200",
		['MoneyType'] = 5,
		['MoneyVal'] = {2000,5000},
		['Integral'] = {MoneyType = "DaNaoIntegral", MoneyName = "大闹积分"},
		['IntegralVal'] = 150,
	},
	["大闹护卫_3"] = {
		['Exp'] =  {"level * 300", "level * 500"},
		['MoneyType'] = 5,
		['MoneyVal'] = {2000,5000},
		['Integral'] = {MoneyType = "DaNaoIntegral", MoneyName = "大闹积分"},
		['IntegralVal'] = 200,
	},
	["大闹护卫_4"] = {
		['Exp'] =  {"level * 300", "level * 500"},
		['MoneyType'] = 5,
		['MoneyVal'] = {2000,5000},
		['Integral'] = {MoneyType = "DaNaoIntegral", MoneyName = "大闹积分"},
		['IntegralVal'] = 300,
	},
	["大闹护卫_5"] = {
		['Exp'] =  {"level * 300", "level * 500"},
		['MoneyType'] = 5,
		['MoneyVal'] = {2000,5000},
		['Integral'] = {MoneyType = "DaNaoIntegral", MoneyName = "大闹积分"},
		['IntegralVal'] = 400,
	},
}

--活动开始前回调
function DaNao_1.OnDeclare(id, seconds)
	NaoShi.OnDeclare(id, seconds)
end

--活动开始回调
function DaNao_1.OnStart(id, is_normal)
	if Data then
		if not Data.NaoShi then
			Data.NaoShi = {}
		end
		local s_id = tostring(id)
		Data.NaoShi[s_id] = {}
		Data.NaoShi[s_id]["Join_Max"] = DaNao_1.Join_Max
		Data.NaoShi[s_id]["Active_Add"] = DaNao_1.Active_Add
		Data.NaoShi[s_id]["Active_Max"] = DaNao_1.Active_Max
		Data.NaoShi[s_id]["Refresh"] = DaNao_1.Refresh
		Data.NaoShi[s_id]["RefreshTime"] = DaNao_1.RefreshTime
		Data.NaoShi[s_id]["Reward"] = DaNao_1.Reward
		Data.NaoShi[s_id]["JoinMinNum"] = DaNao_1.JoinMinNum
	
	else
		--NaoShi.OnStop(id)
	end
	NaoShi.OnStart(id, is_normal)
end


--活动结束回调
function DaNao_1.OnStop(id)
	Data.NaoShi[id] = nil
	NaoShi.OnStop(id)
end

--玩家点击参与活动回调
function DaNao_1.OnJoin(id, player)
	NaoShi.OnJoin(id, player)
end

--玩家客户端查询数据回调
function DaNao_1.OnQuery(id, player)
	local join_num = player:GetDayInt("NaoShi_Join_Num"..id)
	local active_num = player:GetDayInt("NaoShi_Active_Num"..id)
	
	local str = join_num..":"..DaNao_1.Join_Max..":"..active_num..":"..DaNao_1.Active_Max..":"..DaNao_1.ShowItem..":2:2,5"
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end









