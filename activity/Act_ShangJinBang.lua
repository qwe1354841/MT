--赏金榜活动脚本
Act_ShangJinBang = {}
Act_ShangJinBang.Config = {
	['Name'] = {
		[0] = "天道赏金榜",
		[1] = "魔道赏金榜",
	},
	['ShowQuestNum'] = 5,--任务显示数量
	['DayCountMax'] = 20,--每日最大接取任务次数
	['DoubleTimeStart'] = 18,--双倍奖励开始时间  18为下午18：00
	['DoubleTimeEnd'] = 19,--双倍奖励结束时间
	['Refresh'] = {--刷新配置
		['RefreshItem'] = 35520,--刷新物品id
		['Config'] = {
			{['max'] = 5,['min'] = 5,['num'] = 4,},--max:最大未接任务数量   min：最小未接任务数量  num：需要的刷新物品数量
			{['max'] = 4,['min'] = 4,['num'] = 3,},
			{['max'] = 3,['min'] = 3,['num'] = 2,},
			{['max'] = 2,['min'] = 2,['num'] = 1,},
			{['max'] = 1,['min'] = 1,['num'] = 0,},
		}, 
	},
	['Quest'] = {
		['QuestRand'] = {--各星级任务刷新几率
				['Star5'] = 10,
				['Star4'] = 1,
				['Star3'] = 2,
				['Star2'] = 5,
				['Star1'] = 1,
			},
		['QuestList'] = {--任务配置
			[128] = {['QuestId'] = 128,['Star'] = 1,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '慕名拜访',['QuestDescribe'] = '天道盟与诸多正派势力都保持着良好的关系，你去拜访一下吧！',},
			[129] = {['QuestId'] = 129,['Star'] = 1,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '秣马厉兵',['QuestDescribe'] = '与魔道盟大战在即，你速去筹备一些物资！',},
			[130] = {['QuestId'] = 130,['Star'] = 5,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '天道除恶',['QuestDescribe'] = '替天道盟教训一下魔道盟的人！',},
			[131] = {['QuestId'] = 131,['Star'] = 2,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '慕名拜访',['QuestDescribe'] = '天道盟与诸多正派势力都保持着良好的关系，你去拜访一下吧！',},
			[132] = {['QuestId'] = 132,['Star'] = 2,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '秣马厉兵',['QuestDescribe'] = '与魔道盟大战在即，你速去筹备一些物资！',},
			[133] = {['QuestId'] = 133,['Star'] = 2,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '教训恶霸',['QuestDescribe'] = '恶霸鱼肉乡里，甚是可恶。你去教训一下他！',},
			[134] = {['QuestId'] = 134,['Star'] = 3,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '慕名拜访',['QuestDescribe'] = '天道盟与诸多正派势力都保持着良好的关系，你去拜访一下吧！',},
			[135] = {['QuestId'] = 135,['Star'] = 3,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '秣马厉兵',['QuestDescribe'] = '与魔道盟大战在即，你速去筹备一些物资！',},
			[136] = {['QuestId'] = 136,['Star'] = 3,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '教训恶霸',['QuestDescribe'] = '恶霸鱼肉乡里，甚是可恶。你去教训一下他！',},
			[137] = {['QuestId'] = 137,['Star'] = 4,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '慕名拜访',['QuestDescribe'] = '天道盟与诸多正派势力都保持着良好的关系，你去拜访一下吧！',},
			[138] = {['QuestId'] = 138,['Star'] = 4,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '秣马厉兵',['QuestDescribe'] = '与魔道盟大战在即，你速去筹备一些物资！',},
			[139] = {['QuestId'] = 139,['Star'] = 4,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '教训恶霸',['QuestDescribe'] = '恶霸鱼肉乡里，甚是可恶。你去教训一下他！',},
			[140] = {['QuestId'] = 140,['Star'] = 5,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '慕名拜访',['QuestDescribe'] = '天道盟与诸多正派势力都保持着良好的关系，你去拜访一下吧！',},
			[141] = {['QuestId'] = 141,['Star'] = 5,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '秣马厉兵',['QuestDescribe'] = '与魔道盟大战在即，你速去筹备一些物资！',},
			[142] = {['QuestId'] = 142,['Star'] = 5,['ShowReward'] = {61024,1,61025,1},['QuestName'] = '魔道杀戮',['QuestDescribe'] = '替魔道盟教训一下天道盟的人！',},
		},
		['QuestStar'] = {--各星级任务对应任务id
			[0] = {
				['Star1'] = {128,129,},
				['Star2'] = {131,132,133,},
				['Star3'] = {134,135,136,},
				['Star4'] = {137,138,139,},
				['Star5'] = {140,141,130,},
			},
			[1] = {
				['Star1'] = {128,129,},
				['Star2'] = {131,132,133,},
				['Star3'] = {134,135,136,},
				['Star4'] = {137,138,139,},
				['Star5'] = {140,141,142},
			},
		},
		['Reward'] = {--奖励配置
			['Star5'] = {
				['Exp'] = 'return level*1000',
				['BindGold'] = 'return level*100',
				['ItemList'] = {"宝石福袋",1,0},
			},
			['Star4'] = {
				['Exp'] = 'return level*800',
				['BindGold'] = 'return level*80',
				['ItemList'] = {"1级宝石包",1,0},
			},
			['Star3'] = {
				['Exp'] = 'return level*600',
				['BindGold'] = 'return level*60',
			--	['ItemList'] = {"中级炼妖礼包",1,0},
			},
			['Star2'] = {
				['Exp'] = 'return level*500',
				['BindGold'] = 'return level*50',
			--	['ItemList'] = {"中级炼妖礼包",1,0},
			},
			['Star1'] = {
				['Exp'] = 'return level*400',
				['BindGold'] = 'return level*40',
			--	['ItemList'] = {"中级炼妖礼包",1,0},
			},
		},
	},
	
}
Act_ShangJinBang.ShowItem = "61024,61025,20826,20818"

-- 活动开始前回调
function Act_ShangJinBang.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_ShangJinBang.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_ShangJinBang.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_ShangJinBang.OnJoin(id, player)
	local pk = player:GetPk()
	local npc_id = 0
	if id == 73 then
		if pk < 0 then
			sLuaApp:NotifyTipsMsg(player, "恶人不能参加天道赏金榜哦！")
			return
		end
		npc_id = 10620
	elseif id == 74 then
		if pk >= 0 then
			sLuaApp:NotifyTipsMsg(player, "善人不能参加魔道赏金榜哦！")
			return
		end
		npc_id = 10612
	end
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(]]..npc_id..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
	--@newinter sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('BountyQuestUI')")
-- 玩家客户端查询数据回调
function Act_ShangJinBang.OnQuery(id, player)
	local str = ""
	if id == 73 then
		str = ""..player:GetDayInt("ShangJinBangDayCount0")..":20:0:0:"..Act_ShangJinBang.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_ShangJinBang")
	elseif id == 74 then
		str = ""..player:GetDayInt("ShangJinBangDayCount1")..":20:0:0:"..Act_ShangJinBang.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_ShangJinBang")
	end
	
	return str
end

function Act_ShangJinBang.main(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetDayInt("ShangJinBangDayCount"..pk_type) >= Act_ShangJinBang.Config['DayCountMax'] then
		sLuaApp:NotifyTipsMsg(player,"您已经完成了今天的"..Act_ShangJinBang.Config['Name'][pk_type].."任务，请明天再来")
		local str = [[
			if BountyQuestUI then
				GUI.CloseWnd("BountyQuestUI")
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	if player:GetString("ShangJinBangQuestTab"..pk_type) == "" then
		Act_ShangJinBang.set_quest_tb(player)
	else
		if player:GetInt("ShangJinBangQuestCount"..pk_type) >= Act_ShangJinBang.Config['ShowQuestNum'] then
			Act_ShangJinBang.set_quest_tb(player)
		end
	end
	local quest_list = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
	local tb_form = {} 
	tb_form['Name'] = Act_ShangJinBang.Config['Name'][pk_type]
	tb_form['DayCountMax'] = Act_ShangJinBang.Config['DayCountMax']
	tb_form['DayCount'] = player:GetDayInt("ShangJinBangDayCount"..pk_type)
	tb_form['DoubleTimeStart'] = Act_ShangJinBang.Config['DoubleTimeStart']
	tb_form['DoubleTimeEnd'] = Act_ShangJinBang.Config['DoubleTimeEnd']
	tb_form['DoubleTimeEnd'] = Act_ShangJinBang.Config['DoubleTimeEnd']
	tb_form['QuestList'] = {}
	for k,v in pairs(quest_list) do
		local state = v
		if v == 1 then
			local quest_state = sQuestSystem:GetQuestState(player,Act_ShangJinBang.Config['Quest']['QuestList'][k]['QuestId'])
			if quest_state ~= 3 and quest_state ~= 4 then
				state = 0
				sLuaApp:LuaErr("玩家-"..player:GetName().."-赏金榜任务"..Act_ShangJinBang.Config['Quest']['QuestList'][k]['QuestId'].."储存状态不正确,"..v.."变为0")
				quest_list[k] = state
				player:SetInt("ShangJinBangQuestState"..pk_type,0)
				player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize(quest_list))
			end
		end
		local tb = {
			['QuestId'] = Act_ShangJinBang.Config['Quest']['QuestList'][k]['QuestId'],
			['Star'] = Act_ShangJinBang.Config['Quest']['QuestList'][k]['Star'],
			['QuestName'] = Act_ShangJinBang.Config['Quest']['QuestList'][k]['QuestName'],
			['QuestDescribe'] = Act_ShangJinBang.Config['Quest']['QuestList'][k]['QuestDescribe'],
			['ShowReward'] = Act_ShangJinBang.Config['Quest']['QuestList'][k]['ShowReward'],
			['State'] = state,
		}
		table.insert(tb_form['QuestList'],tb)
	end
	tb_form['Refresh'] = {}
	tb_form['Refresh']['Config'] = Act_ShangJinBang.Config['Refresh']['Config']
	tb_form['Refresh']['RefreshItem'] = Act_ShangJinBang.Config['Refresh']['RefreshItem']
	tb_form['Refresh']['Num'] = Act_ShangJinBang.get_refresh_item_num(player)
	
	local str = [[
		BountyQuestUI.GetConfig(]]..Lua_tools.serialize(tb_form)..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function Act_ShangJinBang.get_refresh_item_num(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	local a = (Act_ShangJinBang.Config['ShowQuestNum']) - (player:GetInt("ShangJinBangQuestCount"..pk_type))
	local num = -1
	for k,v in pairs(Act_ShangJinBang.Config['Refresh']['Config']) do
		if a <= v['max'] and a >= v['min'] then
			num = v['num']
		end
	end
	return num
end

function Act_ShangJinBang.set_quest_tb(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize({}))
	Act_ShangJinBang.random_quest_list(player)
	player:SetInt("ShangJinBangQuestCount"..pk_type,0)
end

function Act_ShangJinBang.random_quest_list(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	for i = 1 , Act_ShangJinBang.Config['ShowQuestNum'] , 1 do
		local tb = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
		local quest_id = Act_ShangJinBang.random_quest(player)
		tb[quest_id] = 0
		
		player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize(tb))
	end
end

function Act_ShangJinBang.random_quest(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	local start = Act_ShangJinBang.random_start()
	local quest_id = Act_ShangJinBang.Config['Quest']['QuestStar'][pk_type][''..start][math.random(1,#Act_ShangJinBang.Config['Quest']['QuestStar'][pk_type][''..start])]
	if not Act_ShangJinBang.is_has_quest(player,quest_id) then
		return quest_id
	end
	return Act_ShangJinBang.random_quest(player)
end

function Act_ShangJinBang.is_has_quest(player,quest_id)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetString("ShangJinBangQuestTab"..pk_type) ~= "" then
		local tb = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
		if tb[quest_id] then
			return true
		end
	end
	return false
end

function Act_ShangJinBang.random_start()
	local allrand = Act_ShangJinBang.get_all_rand()
	local randomrand =  math.random(1,allrand)
	local a = 0 
	for k,v in pairs(Act_ShangJinBang.Config['Quest']['QuestRand']) do
		a = v + a
		if randomrand <= a then
			return k
		end
	end
end

function Act_ShangJinBang.get_all_rand()
	local allrand = 0 
	for k,v in pairs(Act_ShangJinBang.Config['Quest']['QuestRand']) do
		allrand = allrand + v
	end
	return allrand
end

function Act_ShangJinBang.player_accept_quest(player, quest_id)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetInt("ShangJinBangQuestState"..pk_type) ~= 0 then
		local quest_state = sQuestSystem:GetQuestState(player,player:GetInt("ShangJinBangQuestState"..pk_type))
		if quest_state == 3 or quest_state == 4 then
			sLuaApp:NotifyTipsMsg(player,"您已经接取了赏金任务，赶快去完成它吧！")
			return
		end
		player:SetInt("ShangJinBangQuestState"..pk_type,0)
	end
	local quest_list = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
	if quest_list[quest_id] then
		if quest_list[quest_id] == 0 then
			if sQuestSystem:ForceAccept(player,quest_id) == 0 then
				quest_list[quest_id] = 1
				player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize(quest_list))
				player:SetInt("ShangJinBangQuestState"..pk_type,quest_id)
				player:SetDayInt("ShangJinBangDayCount"..pk_type,(player:GetDayInt("ShangJinBangDayCount"..pk_type)+1))
				--Act_ShangJinBang.main(player)
				local str = [[
					BountyQuestUI.OnExit()
					 local func = function()
						TrackUI.OnManualClickQuest(]]..quest_id..[[)
					end
					Timer.New(func, 0.5, 1):Start()
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			end
		end
	end
end

function Act_ShangJinBang.player_failed_quest(player,quest_id)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetInt("ShangJinBangQuestState"..pk_type) ~= quest_id then
		return
	end
	sQuestSystem:ForceAbandon(player,quest_id)
end

function Act_ShangJinBang.failed_or_abandon_quest(player,quest_id)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetInt("ShangJinBangQuestState"..pk_type) ~= quest_id then
		return
	end
	local quest_list = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
	if quest_list[quest_id] then
		if quest_list[quest_id] == 1 then
			quest_list[quest_id] = -1
			player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize(quest_list))
			player:SetInt("ShangJinBangQuestCount"..pk_type,(player:GetInt("ShangJinBangQuestCount"..pk_type)+1))
			player:SetInt("ShangJinBangQuestState"..pk_type,0)
			
			Act_ShangJinBang.main(player)
		end
	end
end

function Act_ShangJinBang.accomplish(player,quest_id)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetInt("ShangJinBangQuestState"..pk_type) ~= quest_id then
		if pk_type == 0 then
			pk_type = 1 
		end
		if pk_type == 1 then
			pk_type = 0
		end
		if player:GetInt("ShangJinBangQuestState"..pk_type) ~= quest_id then
			return
		end
	end
	local quest_list = assert(load("return " .. player:GetString("ShangJinBangQuestTab"..pk_type)))()
	if quest_list[quest_id] then
		if quest_list[quest_id] == 1 then
			quest_list[quest_id] = 2
			player:SetString("ShangJinBangQuestTab"..pk_type,Lua_tools.serialize(quest_list))
			player:SetInt("ShangJinBangQuestCount"..pk_type,(player:GetInt("ShangJinBangQuestCount"..pk_type)+1))
			player:SetInt("ShangJinBangQuestState"..pk_type,0)
			Act_ShangJinBang.give_reward(player,Act_ShangJinBang.Config['Quest']['QuestList'][quest_id]['Star'])
			--Act_ShangJinBang.main(player)
			
			local pk = player:GetPk()
			local npc_id = 0
			if pk >= 0 then
				npc_id = 10620
			elseif pk < 0 then
				npc_id = 10612
			end
			local FormStr = [[
					BountyQuestUI.OnExit()
					 local func = function()
						CL.StartMove(]]..npc_id..[[)
					end
					Timer.New(func, 0.5, 1):Start()
				]]
			sLuaApp:ShowForm(player, "脚本表单", FormStr)
		end
	end
end

function Act_ShangJinBang.give_reward(player,star)
	local tb = Act_ShangJinBang.Config['Quest']['Reward']['Star'..star]
	local GongShi = [[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	local double = 1 
	local nowhour = sLuaApp:Hour(0)
	if nowhour >= Act_ShangJinBang.Config['DoubleTimeStart'] and nowhour < Act_ShangJinBang.Config['DoubleTimeEnd'] then
		double = 2
	end
	if tb['Exp'] then
		exp = math.floor(assert(load(GongShi..tb['Exp']))())
		player:AddExp(exp*double, "Act_ShangJinBang", "Act_ShangJinBang", "nil")
	end
	if tb['BindGold'] then
		bindgold = math.floor(assert(load(GongShi..tb['BindGold']))())
		player:AddBindGold(bindgold*double, "Act_ShangJinBang", "Act_ShangJinBang", "nil")
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold*double.."银币")
	end 
	if tb['ItemList'] then
		Lua_tools.AddItem(player, tb['ItemList'], "Act_ShangJinBang", "Act_ShangJinBang", "")
	end
end
function Act_ShangJinBang.get_pk_type(player)
	local pk = player:GetPk()
	local pk_type = 0
	if pk < 0 then
		pk_type = 1
	end
	return pk_type
end

function Act_ShangJinBang.refresh_quest(player)
	local pk_type = Act_ShangJinBang.get_pk_type(player)
	if player:GetInt("ShangJinBangQuestState"..pk_type) ~= 0 then
		sLuaApp:NotifyTipsMsg(player,"接取赏金任务的情况下不能刷新噢！")
		return
	end
	local item_id = Act_ShangJinBang.Config['Refresh']['RefreshItem']
	local num = Act_ShangJinBang.get_refresh_item_num(player)
	if num > 0 then
		if sItemSystem:ConsumeItemWithId(player, item_id, num, 3, "Act_ShangJinBang", "Act_ShangJinBang", "刷任务") == 0 then
			player:SetString("ShangJinBangQuestTab"..pk_type,"")
			Act_ShangJinBang.main(player)
		else
			sLuaApp:NotifyTipsMsg(player,"道具不足")
			OneKeyBuy.Main(player,{"赏金令", (num - sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname("赏金令"), 3))})
		end
	elseif num == 0 then
		player:SetString("ShangJinBangQuestTab"..pk_type,"")
		Act_ShangJinBang.main(player)
	end
end
function Act_ShangJinBang.resert(str)
	str = tostring(str)
	local player = sPlayerSystem:GetPlayerByName(str)
	if not player then
		sLuaApp:NotifyTipsMsg(player,"赏金榜重置失败")
		return
	end
	player:SetString("ShangJinBangQuestTab0","")
	player:SetString("ShangJinBangQuestTab1","")
	player:SetInt("ShangJinBangQuestCount0",0)
	player:SetInt("ShangJinBangQuestCount1",0)
	player:SetInt("ShangJinBangQuestState0",0)
	player:SetInt("ShangJinBangQuestState1",0)
	sLuaApp:NotifyTipsMsg(player,"赏金榜重置成功")
end