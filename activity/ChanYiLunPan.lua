--禅意大富翁
ChanYiLunPan = {}
--点击骰子物品 或者 活动参与 打开轮盘界面

--活动界面显示物品
ChanYiLunPan.ShowItem = "61024,20910,20738,30023,20741"

--经过起点奖励
ChanYiLunPan.CrossStartReward = {
	ItemList = {"高级宝石福袋",1,0,},
}

--奖励列表 数量必须与SiteNum相等
	--Type 	-0 物品 -字符串 表示轮盘效果 对应ChanYiLunPan.Effect表key 
	--rand	- 选中概率
ChanYiLunPan.RewardList = {
	{ItemList = {"小银币袋",1,0}, Type = 0, Rand = 100},				
	{ItemList = {"装备强化石",2,0}, Type = 0, Rand = 20},                    
  	{ItemList = {"增加体质",1,0}, Type = 0, Rand = 100},                       
	{ItemList = {"装备强化石",1,0}, Type = 0, Rand = 50},                      
	{ItemList = {"小银币袋",10,0}, Type = 0, Rand = 30},                       
	{ItemList = {"初级物攻资质丹",5,0}, Type = 0, Rand = 150},                           
	{ItemList = {"血池3",1,0}, Type = 0, Rand = 80},                  
	{ItemList = {"忠诚度1",5,0}, Type = 0, Rand = 150},                   
	{ItemList = {"100奇遇值",1,0}, Type = 0, Rand = 15},                            
	{ItemList = {"N礼包",1,0}, Type = 0, Rand = 100},                  
	{ItemList = {"R礼包",1,0}, Type = 0, Rand = 30},                    
	{ItemList = {"小修炼丹",10,0}, Type = 0, Rand = 100},                    
	{ItemList = {"小银币袋",10,0}, Type = 0, Rand = 200},                       
	{ItemList = {}, Type = "后退2", Rand = 80},                           
	{ItemList = {"3级生命石",2,0}, Type = 0, Rand = 80},             
	{ItemList = {"培养液1",3,0}, Type = 0, Rand = 100},    	
	{ItemList = {"宝石福袋",1,0}, Type = 0, Rand = 30},                 
 	{ItemList = {"3级暴击石",2,0}, Type = 0, Rand = 80},   	
	{ItemList = {}, Type = "后退1", Rand = 200},                     
	{ItemList = {"小银币袋",10,0}, Type = 0, Rand = 200},                     
	{ItemList = {"烹饪2",2,0}, Type = 0, Rand = 100},
	{ItemList = {"魔池3",1,0}, Type = 0, Rand = 80},
	{ItemList = {"小修炼丹",10,0}, Type = 0, Rand = 100},
	{ItemList = {}, Type = "前进1", Rand = 200},
	{ItemList = {"强化保固石",1,0}, Type = 0, Rand = 25},
	{ItemList = {"3级生命石",2,0}, Type = 0, Rand = 80},    
	{ItemList = {"培养液1",3,0}, Type = 0, Rand = 100}, 
	{ItemList = {"高级物防丹",1,0}, Type = 0, Rand = 30},
	{ItemList = {"3级暴击石",2,0}, Type = 0, Rand = 80},
	{ItemList = {"SR礼包",1,0}, Type = 0, Rand = 3},
	{ItemList = {"小银币袋",10,0}, Type = 0, Rand = 200},
	{ItemList = {"初级物攻资质丹",5,0}, Type = 0, Rand = 150},
}                            					 

--轮盘效果格子
ChanYiLunPan.Effect = {
	["后退2"] = {Icon = 1900815620,Tips = "你将回到棋盘起点，重新进行游戏", ShowMsg = "命运指引你，回到起点..."},
	["后退1"] = {Icon = 1900814070,Tips = "你将后退1~5步", ShowMsg = "遭遇魔兽袭击..."},
	["前进1"] = {Icon = 1900815830,Tips = "你将前进1~5步", ShowMsg = "乘风而行..."},
	--["进退1"] = {Icon = 1900815700,Tips = "你将前进5步~后退5步", ShowMsg = "狂风大作..."},
}

--骰子keyname or 轮盘效果Type = {点数最大值，点数最小值} or {具体固定index}   --不支持掷出点数不连续
	-- 骰子keyname 需要是 "骰子"+index 且在物品表里存在 就在客户端显示该骰子 index表示显示顺序
ChanYiLunPan.Dice = {
	--真实骰子
	["骰子1"] = {1,6},	
	["骰子2"] = {2,12},
	["骰子3"] = {3,18},
	["骰子4"] = {1,3},
	["骰子5"] = {4,6},
	["骰子6"] = {1,8},
	--特殊格子效果
	["后退1"] = {-5,-1},
	["后退2"] = {1},
	["前进1"] = {1,5},
	--["进退1"] = {-5,5}
}

function ChanYiLunPan.GetData(player)
	local now_site = player:GetInt("ChanYiLunPanNowPos")
	if now_site == 0 then
		now_site = 1
		player:SetInt("ChanYiLunPanNowPos", 1)
	end

	sLuaApp:LuaDbg("now_site"..player:GetInt("ChanYiLunPanNowPos"))
	--传ChanYiLunPan.RewardList 和 now_site 和 ChanYiLunPan.Position 
	
	local str = [[
		if MonopolyUI then
			MonopolyUI.RewardList = ]] .. Lua_tools.serialize(ChanYiLunPan.ShowRewardList).. [[
			MonopolyUI.Effect = ]] .. Lua_tools.serialize(ChanYiLunPan.Effect).. [[
			MonopolyUI.DiceList = ]]..Lua_tools.serialize(ChanYiLunPan.AllDiceList)..[[
			MonopolyUI.RefreshData()
		end
	]]
	--sLuaApp:LuaErr("str"..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end
--掷骰子
function ChanYiLunPan.Roll(player, is_dice, dice_name, dice_num)--is_dice 1-是骰子roll点 0-是轮盘效果roll点  dice_numXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	dice_num = 1 --骰子个数
	if not(is_dice and dice_name and dice_num) then return end
	if not ChanYiLunPan.Dice[dice_name] then 
		sLuaApp:LuaErr("ChanYiLunPan.Roll 缺少ChanYiLunPan.Dice"..dice_name)
		return
	end
	if player:GetInt("ChanYiLunPanRewardItemIndex") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "您的上一次奖励尚未领取！")
		return
	end
	--先把骰子扣了
	if tonumber(is_dice) == 1 then
		local cos_item_data = ItemConfig.GetByKeyName(dice_name)
		if sItemSystem:GetItemAmount(player, cos_item_data.Id, 3) >= dice_num then
			sItemSystem:ConsumeItemWithPriority(player, cos_item_data.Id, dice_num, true, "system", "大富翁轮盘","掷骰子")
		else
			sLuaApp:LuaErr("ChanYiLunPan.Roll"..player:GetName().."使用了"..dice_name.."，实际物品不足")
			sLuaApp:NotifyTipsMsg(player, cos_item_data.Name.."不足，无法投掷！")
			return
		end
	end

	local now_site = player:GetInt("ChanYiLunPanNowPos")
	if now_site == 0 then
		sLuaApp:LuaErr(player:GetName() .."  ChanYiLunPan.Roll now_site == 0 未经过ChanYiLunPan.GetData")
		return
	end
	
	local round_num = 0
	local item_index = 0
	local steps = 0
	if #ChanYiLunPan.Dice[dice_name] == 2 then --步数是范围
		round_num, item_index = ChanYiLunPan.GetRollList(now_site, dice_name)
		--计算步数
		local real_list_num = #ChanYiLunPan.RewardList
		steps = (item_index - now_site) + round_num * real_list_num
	elseif #ChanYiLunPan.Dice[dice_name] == 1 then --步数是固定index	
		item_index = ChanYiLunPan.Dice[dice_name][1] 
		if type(item_index) ~= "number" then
			sLuaApp:LuaErr("ChanYiLunPan.Dice"..dice_name.."配置错误")
			return
		end
		steps = item_index - now_site
	end
	player:SetInt("ChanYiLunPanNowPos", item_index)
	
	local type_name = ChanYiLunPan.RewardList[item_index]["Type"]
	if type(type_name) == "string" and ChanYiLunPan.Effect[type_name] then
		local index_tb = player:GetString("ChanYiLunPanIndexRecord")
		if index_tb == "" then
			player:SetString("ChanYiLunPanIndexRecord", Lua_tools.serialize({steps}))
		else
			local tmp_tb = assert(load(" return ".. index_tb))()
			table.insert(tmp_tb, steps)
			player:SetString("ChanYiLunPanIndexRecord", Lua_tools.serialize(tmp_tb))
		end
		-- 记录客户端表演动画时间 
		local show_time = 2500 + math.abs(steps) * 300 + player:GetInt("ChanYiLunPanShowTime")
		player:SetInt("ChanYiLunPanShowTime", show_time)
		
		ChanYiLunPan.Roll(player, 0, type_name, 1)
	else
		local index_tb = player:GetString("ChanYiLunPanIndexRecord")
		local tmp_tb = {} 
		if index_tb == "" then
			tmp_tb[1] = steps
		else
			tmp_tb = assert(load(" return ".. index_tb))()
			table.insert(tmp_tb, steps)
			player:SetString("ChanYiLunPanIndexRecord", "")
		end
		--发送轮数和格子Index
		local str = [[
			if MonopolyUI then
				MonopolyUI.RollResult = ]]..Lua_tools.serialize(tmp_tb)..[[
				MonopolyUI.OnRollResult()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		-- 需要根据steps+掷骰子时间 做延时给奖励 
		player:SetInt("ChanYiLunPanRewardItemIndex", item_index)
		player:SetInt("ChanYiLunPanRewardRoundNum", round_num)
		local show_time = 2500 + math.abs(steps) * 300 + player:GetInt("ChanYiLunPanShowTime")
		player:SetInt("ChanYiLunPanShowTime", 0)
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_LOGOUT, "ChanYiLunPan", "GiveReward")
		sLuaTimerSystem:AddTimerEx(player, show_time,1, "ChanYiLunPan.GiveReward","")
	end
	-- sLuaApp:LuaDbg("round_num:"..round_num)
	-- sLuaApp:LuaDbg("item_index:"..item_index)
	-- sLuaApp:LuaDbg("steps:"..steps)
end



function ChanYiLunPan.GetRollList(now_site, dice_name)
	-- 现在位置  骰子名字 ==> 可能位置的列表
	if not next(ChanYiLunPan.RewardList) then
		sLuaApp:LuaErr("ChanYiLunPan.RewardList为空")
		return
	end
	local min_num = now_site + ChanYiLunPan.Dice[dice_name][1]
	local max_num = now_site + ChanYiLunPan.Dice[dice_name][2]
	local select_list = {}
	local round_num = 0 --随机权重总和
	local rand_sum = 0 --轮数 正负区分前进后退
	local real_list_num = #ChanYiLunPan.RewardList
	
	local function GetRound(min_num, max_num, round_num, real_list_num)
		if min_num > real_list_num then
			min_num = min_num - real_list_num
			max_num = max_num - real_list_num
			round_num = round_num + 1
			return GetRound(min_num, max_num, round_num, real_list_num)
		elseif min_num < 1 then
			min_num = min_num + real_list_num
			max_num = max_num + real_list_num
			round_num = round_num - 1
			return GetRound(min_num, max_num, round_num, real_list_num)
		else
			return min_num,max_num,round_num
		end
	end
	
	while min_num <= max_num do
		min_num, max_num, round_num = GetRound(min_num, max_num, round_num, real_list_num)
		local cell_config = ChanYiLunPan.RewardList[min_num]
		rand_sum = rand_sum + cell_config['Rand']
		table.insert(select_list, {["Index"] = cell_config['Index'], ["Rand" ] = rand_sum, ["Round"] = round_num})
		min_num = min_num + 1
	end
	table.insert(select_list, 1, {["Index"] = 0, ["Rand" ] = 0, ["Round"] = 0})
	--表中根据权重随机一个 ==> 轮数 位置序号Idnex
	local tmp_r = sLuaApp:RandInteger(1,rand_sum)
	local round_num = 0
	local item_index = 0
	for k,v in ipairs(select_list) do
		if tmp_r <= v["Rand"] then
			round_num = v["Round"]
			item_index = v["Index"]
			break
		end
	end
	if item_index == 0 then
		sLuaApp:LuaErr("ChanYiLunPan.GetSelectItem item_index错误")
	end
	return round_num, item_index
end

--  判断 给物品奖励   起点奖励 
function ChanYiLunPan.GiveReward(player)
	-- 做延时给奖励 
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_LOGOUT, "ChanYiLunPan", "GiveReward")
	local item_index = player:GetInt("ChanYiLunPanRewardItemIndex")
	local round_num = player:GetInt("ChanYiLunPanRewardRoundNum")
	if item_index == 0 then
		sLuaApp:LuaErr("ChanYiLunPan.GiveReward item_index为0")
		return
	end
	
	local cell_config = ChanYiLunPan.RewardList[item_index]
	if cell_config["Type"] == 0 and Lua_tools and next(cell_config["ItemList"]) then
		Lua_tools.AddItem(player, cell_config['ItemList'], "system", "轮盘", "单格奖励")
	else
		sLuaApp:LuaErr("ChanYiLunPan.GiveReward  RewardList"..item_index.."配置错误")
		return
	end
	
	local cross_num = math.abs(round_num)--反向过起点也有奖励
	if cross_num > 0 then
		if ChanYiLunPan.CrossStartReward and ChanYiLunPan.CrossStartReward['ItemList'] and ChanYiLunPan.CrossStartReward['TipList'] then
			local item_msg = ""
			for _,v in ipairs(ChanYiLunPan.CrossStartReward['TipList']) do
				item_msg = item_msg .. v .." "
			end
			sLuaApp:NotifyTipsMsg(player, "通过起点，额外获得"..item_msg)
			for i = 1, cross_num, 1 do
				Lua_tools.AddItem(player, ChanYiLunPan.CrossStartReward['ItemList'], "system", "轮盘", "过起点奖励")
			end
		end
	end
	player:SetInt("ChanYiLunPanRewardItemIndex", 0)
	player:SetInt("ChanYiLunPanRewardRoundNum", 0)
end

ChanYiLunPan.SiteNum = 32 --客户端格子数量 -不可改
-- --轮盘格子排列 --目前不需要 客户端显示写死
-- ChanYiLunPan.Position = {
	-- Top = 10,
	-- Right = 6,
	-- Under = 10,
	-- Left = 6,
-- }


function ChanYiLunPan.Initialization()
	if not ChanYiLunPan.RewardList then
		sLuaApp:LuaErr("缺少ChanYiLunPan.RewardList")
		return
	end
	if ChanYiLunPan.Position then
		ChanYiLunPan.SiteNum = ChanYiLunPan.Position['Top'] + ChanYiLunPan.Position['Right'] + ChanYiLunPan.Position['Under'] + ChanYiLunPan.Position['Left']
	end
	if ChanYiLunPan.SiteNum ~= #ChanYiLunPan.RewardList then
		sLuaApp:LuaErr("ChanYiLunPan 格子数量与ChanYiLunPan.RewardList物品列表数量不相等   " .. ChanYiLunPan.SiteNum .." : "..#ChanYiLunPan.RewardList)
		return
	end
	
	--客户端显示用 ShowRewardList.
	ChanYiLunPan.ShowRewardList = {}
	for k,v in ipairs(ChanYiLunPan.RewardList) do
		ChanYiLunPan.RewardList[k]["Index"] = k
		table.insert(ChanYiLunPan.ShowRewardList,{["ItemList"] = v["ItemList"], ["Type"] = v["Type"]})
	end
	--过起点奖励表
	if ChanYiLunPan.CrossStartReward then
		if ChanYiLunPan.CrossStartReward['ItemList'] then
			ChanYiLunPan.CrossStartReward['TipList'] = {}
			for _,v in ipairs(ChanYiLunPan.CrossStartReward['ItemList']) do
				if type(v) == "string" then
					local item_name = ItemConfig.GetByKeyName(v).Name
					table.insert(ChanYiLunPan.CrossStartReward['TipList'], item_name)
				end
			end
		end
	end
	
	--骰子表 客户端显示用
	if not Lua_tools then
		require("system/Lua_tools")
	end
	if not ChanYiLunPan.Dice then
		sLuaApp:LuaErr("缺少ChanYiLunPan.Dice")
		return
	end
	ChanYiLunPan.AllDiceList = {}
	local has_item = {}
	for k,v in pairs(ChanYiLunPan.Dice) do
		if ItemConfig.GetByKeyName(k) then
			has_item[k] = v
		end
	end
	for i = 1, Lua_tools.tablecount(has_item) do 
		if has_item["骰子"..i] then
			table.insert(ChanYiLunPan.AllDiceList,{["Name"] = "骰子"..i, ["Min"] = has_item["骰子"..i][1], ["Max"] = has_item["骰子"..i][2]})
			has_item["骰子"..i] = nil
		end
	end
	if next(has_item) then
		for k,v in pairs(has_item) do
			table.insert(ChanYiLunPan.AllDiceList,{["Name"] = k, ["Min"] = v[1], ["Max"] = v[2]})
		end
	end
	
	-- sLuaApp:LuaErr("ChanYiLunPan.CrossStartReward"..Lua_tools.serialize(ChanYiLunPan.CrossStartReward))
	--sLuaApp:LuaErr("ChanYiLunPan.AllDiceList"..Lua_tools.serialize(ChanYiLunPan.AllDiceList))
	--sLuaApp:LuaErr("ChanYiLunPan.ShowRewardList"..Lua_tools.serialize(ChanYiLunPan.ShowRewardList))
end
ChanYiLunPan.Initialization()


-- 活动开始前回调
function ChanYiLunPan.OnDeclare(id, seconds) 
end
-- 活动开始回调
function ChanYiLunPan.OnStart(id, is_normal)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['ChanYiDaFuWeng'] ~= "on" then
			return
		end
	end
end
-- 活动结束回调
function ChanYiLunPan.OnStop(id)
end
-- 玩家点击参与活动回调
function ChanYiLunPan.OnJoin(id, player)
	--打开界面
	if sLuaApp:IsActivityRunning(id) then
		local str = [[
			GUI.OpenWnd("MonopolyUI")
			GUI.CloseWnd("ActivityPanelUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end
-- 玩家客户端查询数据回调
function ChanYiLunPan.OnQuery(id, player)
	local show_item = ChanYiLunPan.ShowItem or "61024,61025"
	local str = "0:0:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("ChanYiLunPan") or "2,3,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end