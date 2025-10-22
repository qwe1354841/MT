--仙兽福缘
XianShouFuYuan = {}

--单次获得活跃值+2
XianShouFuYuan.ActiveAddNum = 2

--获得活跃值上限 最大+10
XianShouFuYuan.ActiveMax = 10

--活动界面显示的物品 字符串 物品id
XianShouFuYuan.ShowItem = "20169,21008,30007,30003,20820"

--宝箱keyname
XianShouFuYuan.BoxKeyname = "仙兽福缘宝箱"

--宝箱刷新时间 （秒）
XianShouFuYuan.RefreshTime = 1800

--宝箱销毁(存在)时间 （秒）
XianShouFuYuan.DestroyTime = 1800

--宝箱刷新数量 -能否活动 1能活动
XianShouFuYuan.Refresh = {
	["江南野外"] = {Num = 10, Move = 0},
	["解阳山"] = {Num = 10, Move = 0},
	["花果山"] = {Num = 10, Move = 0},
	["两界山"] = {Num = 10, Move = 0},
	["大唐国境"] = {Num = 10, Move = 0},
	["西梁女国"] = {Num = 10, Move = 0},
	["大唐境外"] = {Num = 10, Move = 0},
	--["长安城"] = {Num = 20, Move = 0},
	["玄阴池"] = {Num = 10, Move = 0},
	["蟠桃园"] = {Num = 10, Move = 0},
	["天界"] = {Num = 10, Move = 0},
	["西海龙宫"] = {Num = 10, Move = 0},
	["酆都"] = {Num = 10, Move = 0},
	["流沙界"] = {Num = 10, Move = 0},
	["净坛禅院"] = {Num = 10, Move = 0},
	["慈恩寺"] = {Num = 10, Move = 0},
}

--奖励列表 数量必须与SiteNum相等
	--key 钥匙keyname
	--CrossStartReward 经过起点奖励
	--Type 	-0 物品 -字符串 表示轮盘效果 对应XianShouFuYuan.Effect表key 
	--rand	- 选中概率
XianShouFuYuan.MainList = {
	--序号表示客户端显示界面 钥匙的顺序 界面打开默认第一个 如果没有第一种钥匙但是有其他钥匙 客户端做切换 
	[1] = {
		["Key"] = "开箱子花钱钥匙",
		["ShowImg"] = 1801608050,
		["CrossStartReward"] = {"高级福缘礼盒",1,0},
		["Reward"] = {
			{ItemList = {"高级物攻丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"培养液1",1,0}, Type = 0, Rand = 80},
			{ItemList = {"高级物攻资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"65级宠物装备礼包",1,0}, Type = 0, Rand = 150},
			{ItemList = {"高级宠物秘籍包",1,0}, Type = 0, Rand = 35},
			{ItemList = {"35级宠物画像礼包",1,0}, Type = 0, Rand = 50},
			{ItemList = {"高级法攻资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"高级法攻丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"105级宠物装备礼包",1,0}, Type = 0, Rand = 60},
			{ItemList = {"高级物防资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"合成大幸运符",1,0}, Type = 0, Rand = 100},
			{ItemList = {"培养液3",1,0}, Type = 0, Rand = 20},
			{ItemList = {"45级宠物画像礼包",1,0}, Type = 0, Rand = 50},
			{ItemList = {}, Type = "花钱后退2", Rand = 30},
			{ItemList = {"高级物防丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"仙兽玉牌",5,0}, Type = 0, Rand = 50},
			{ItemList = {"高级法防资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"宠物复活药",1,0}, Type = 0, Rand = 100},
			{ItemList = {}, Type = "花钱后退1", Rand = 250},
			{ItemList = {"高级法防丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"高级血量上限资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"高级还原丹",1,0}, Type = 0, Rand = 10},
			{ItemList = {"55级宠物画像礼包",1,0}, Type = 0, Rand = 50},
			{ItemList = {}, Type = "花钱前进1", Rand = 40},
			{ItemList = {"高级宠物染料",1,0}, Type = 0, Rand = 90},
			{ItemList = {"高级血量上限丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"培养液2",1,0}, Type = 0, Rand = 70}, 
			{ItemList = {"高级速度资质丹",1,0}, Type = 0, Rand = 200},
			{ItemList = {"仙兽玉牌",5,0}, Type = 0, Rand = 50},
			{ItemList = {"高级速度丹",1,0}, Type = 0, Rand = 30},
			{ItemList = {"高级洗练符",1,0}, Type = 0, Rand = 100},
			{ItemList = {"85级宠物装备礼包",1,0}, Type = 0, Rand = 80},
		},
	},
	[2] = {
		["Key"] = "开箱子普通钥匙",
		["ShowImg"] = 1801608040,
		["CrossStartReward"] = {"福缘礼盒",1,1},
		["Reward"] = {
			{ItemList = {"45级宠物装备礼包",1,1}, Type = 0, Rand = 100},
			{ItemList = {"中级物攻资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"忠诚度1",1,1}, Type = 0, Rand = 500},
			{ItemList = {"宠物经验丹2",1,1}, Type = 0, Rand = 200},
			{ItemList = {"中级法攻资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"中级物攻丹",1,1}, Type = 0, Rand = 80},
			{ItemList = {"忠诚度2",1,1}, Type = 0, Rand = 400},
			{ItemList = {"中级法攻丹",1,1}, Type = 0, Rand = 80},
			{ItemList = {"中级物防资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"忠诚度3",1,1}, Type = 0, Rand = 350},
			{ItemList = {"普通洗练符",1,1}, Type = 0, Rand = 20},
			{ItemList = {"中级法防资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"中级物防丹",1,1}, Type = 0, Rand = 80},
			{ItemList = {}, Type = "普通后退2", Rand = 80},
			{ItemList = {"中级法防丹",1,1}, Type = 0, Rand = 80},
			{ItemList = {"仙兽玉牌",1,1}, Type = 0, Rand = 30},
			{ItemList = {"忠诚度4",1,1}, Type = 0, Rand = 300},
			{ItemList = {"15级宠物装备礼包",1,1}, Type = 0, Rand = 225},
			{ItemList = {}, Type = "普通后退1", Rand = 100},
			{ItemList = {"中级血量上限资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"普通宠物秘籍包",1,1}, Type = 0, Rand = 300},
			{ItemList = {"中级速度资质丹",1,1}, Type = 0, Rand = 100},
			{ItemList = {"寿命丹1",1,1}, Type = 0, Rand = 80},
			{ItemList = {}, Type = "普通前进1", Rand = 70},
			{ItemList = {"洗练锁定符",1,1}, Type = 0, Rand = 100},
			{ItemList = {"宠物染料",1,1}, Type = 0, Rand = 20},
			{ItemList = {"中级血量上限丹",1,1}, Type = 0, Rand = 80}, 
			{ItemList = {"还原丹",1,1}, Type = 0, Rand = 325},
			{ItemList = {"仙兽玉牌",1,1}, Type = 0, Rand = 30},
			{ItemList = {"中级速度丹",1,1}, Type = 0, Rand = 80},
			{ItemList = {"宠物经验丹",1,1}, Type = 0, Rand = 250},
			{ItemList = {"合成幸运符",1,1}, Type = 0, Rand = 100},
		},
	},
}

--轮盘效果格子
XianShouFuYuan.Effect = {
	["花钱后退2"] = {Icon = 1900815620,Tips = "你将回到棋盘起点，重新进行游戏", ShowMsg = "命运指引你，回到起点..."},
	["花钱后退1"] = {Icon = 1900814070,Tips = "你将后退1~5步", ShowMsg = "遭遇魔兽袭击..."},
	["花钱前进1"] = {Icon = 1900815830,Tips = "你将前进1~5步", ShowMsg = "乘风而行..."},
	
	["普通后退2"] = {Icon = 1900815620,Tips = "你将回到棋盘起点，重新进行游戏", ShowMsg = "命运指引你，回到起点..."},
	["普通后退1"] = {Icon = 1900814070,Tips = "你将后退1~5步", ShowMsg = "遭遇魔兽袭击..."},
	["普通前进1"] = {Icon = 1900815830,Tips = "你将前进1~5步", ShowMsg = "乘风而行..."},
	--["进退1"] = {Icon = 1900815700,Tips = "你将前进5步~后退5步", ShowMsg = "狂风大作..."},
}

--钥匙keyname or 轮盘效果Type = {点数最大值，点数最小值} or {具体固定index}   --不支持掷出点数不连续
XianShouFuYuan.Dice = {
	["开箱子花钱钥匙"] = {1,6},
	["花钱后退1"] = {-5,-1},
	["花钱后退2"] = {1},
	["花钱前进1"] = {1,5},
	
	["开箱子普通钥匙"] = {1,6},
	["普通后退1"] = {-5,-1},
	["普通后退2"] = {1},
	["普通前进1"] = {1,5},
	--["进退1"] = {-5,5}
}

XianShouFuYuan.SiteNum = 32 --不可改  -客户端格子数量  -Reward列表数量需要等于格子数量

-- 活动开始前回调
function XianShouFuYuan.OnDeclare(id, seconds)
end

-- 活动开始回调
function XianShouFuYuan.OnStart(id, is_normal)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['XianShouFuYuan'] ~= "on" then
			return
		end
	end
	--记录id 用钥匙跳转地图用
	sVarSystem:SetInt("ACTIVITY_XianShouFuYuan_ID", id)
	
	local act_name = ActivityConfig.GetById(id).Name
	--sLuaApp:NotifyTopMsgToAll( 1, act_name.."活动开始了!")
	--设置定时刷新
	XianShouFuYuan.RefreshBox(1, ""..id)--活动开始刷一波XXXXXXXXXXXXXXX 测试用
	local t_guid = sLuaTimerSystem:AddTimer(XianShouFuYuan.RefreshTime*1000, -1,"XianShouFuYuan.RefreshBox", ""..id)
	sVarSystem:SetInt("ACTIVITY_XianShouFuYuan_RefreshTimer", t_guid)
end

-- 活动结束回调
function XianShouFuYuan.OnStop(id)
	local t_guid = sVarSystem:GetInt("ACTIVITY_XianShouFuYuan_RefreshTimer")
	if t_guid then
		sLuaTimerSystem:DisableTimer(t_guid)
	else
		sLuaApp:LuaErr("XianShouFuYuan.OnStop 未找到刷新福缘宝箱定时器")
	end
	sVarSystem:SetInt("ACTIVITY_XianShouFuYuan_RefreshTimer", 0)
	local act_name = ActivityConfig.GetById(id).Name
	--sLuaApp:NotifyTopMsgToAll( 1, act_name.."活动结束!")
	
	sVarSystem:SetInt("ACTIVITY_XianShouFuYuan_ID", 0)
end

-- 玩家点击参与活动回调
function XianShouFuYuan.OnJoin(id, player)
	--跳到有怪的地图
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
		return
	end
	local level_min = ActivityConfig.GetById(id).LevelMin
	if level_min then 
		if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
			sLuaApp:NotifyTipsMsg(player, "不到"..level_min.."级是没有能力开启福缘宝箱的！")
			return
		end
	end
	local refresh_list = XianShouFuYuan.Refresh
	if next(refresh_list) then
		local tmp_num = 0
		local goto_map_id = 0
		local map_id = 0
		for k,_ in pairs(refresh_list) do
			map_id = MapConfig.GetByKeyName(k).Id
			local map_box_num = sVarSystem:GetInt("XianShouFuYuan_"..map_id.."_BoxNum")
			if map_box_num > tmp_num then
				tmp_num = map_box_num
				goto_map_id = map_id
			end
		end
		if goto_map_id ~=0 then
			local map = sMapSystem:GetMapById(goto_map_id)
			--中心点坐标
			local x = math.floor(map:GetWidth()/2)
			local y = math.floor(map:GetHeight()/2)
			local range = math.min(x,y)
			if Lua_tools.Jump(player, map, x, y, range) then
				local str = [[
					if ActivityPanelUI then
						GUI.CloseWnd("ActivityPanelUI")
					end
					if BagUI then
						GUI.CloseWnd("BagUI")
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			else
				sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
			end
		else
			sLuaApp:NotifyTipsMsg(player, "来晚啦，所有福缘宝箱里的宝物已被各位少侠收入囊中！")
			return
		end
	end
end

-- 玩家客户端查询数据回调
function XianShouFuYuan.OnQuery(id, player)
	local active_num = player:GetDayInt("XianShouFuYuanActiveNum")
	local show_item = XianShouFuYuan.ShowItem or "61024"
	local str = "0:0:"..active_num..":"..XianShouFuYuan.ActiveMax..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("XianShouFuYuan") or "1,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--按时刷新
function XianShouFuYuan.RefreshBox(t_guid, id)
	if not XianShouFuYuan.Refresh or not XianShouFuYuan.BoxKeyname then return end

	local delay_time = 10
	for k,v in pairs(XianShouFuYuan.Refresh) do
		sLuaTimerSystem:AddTimer(delay_time, 1,"XianShouFuYuan.TimeRefresh", id.. ","..k..","..v["Move"]..","..v["Num"])
		delay_time = delay_time + 100
	end
end

function XianShouFuYuan.TimeRefresh(t_guid, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local id = tonumber(tmp_tb[1])
	local map_keyname = tmp_tb[2]
	local is_move = tonumber(tmp_tb[3])
	local npc_num = tonumber(tmp_tb[4])
	
	local map_id = MapConfig.GetByKeyName(map_keyname).Id
	local map = sMapSystem:GetMapById(map_id)
	local x = math.floor(map:GetWidth()/2)
	local y = math.floor(map:GetHeight()/2)
	local range = math.max(x,y) --刷怪范围
	
	local npc_id = NpcConfig.GetByKeyName(XianShouFuYuan.BoxKeyname).Id
	if is_move == 1 then
		for i = 1, npc_num do
			local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
			local npc = sNpcSystem:CreateMoveNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, 0)
			if npc then
				sLuaTimerSystem:AddTimerEx(npc, XianShouFuYuan.DestroyTime*1000,1,"XianShouFuYuan.DestroyNPC", "")
				npc:SetInt("XianShouFuYuan_MapID", map_id)
				sVarSystem:SetInt("XianShouFuYuan_"..map_id.."_BoxNum", sVarSystem:GetInt("XianShouFuYuan_"..map_id.."_BoxNum") + 1)
				npc:SetInt("XianShouFuYuan_ID", id)--判断等级用
			end
		end
	elseif is_move == 0 then
		for i=1, npc_num do
			local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
			local dir = sLuaApp:RandInteger(0, 7)
			local npc = sNpcSystem:CreateNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, dir, 0)
			if npc then
				sLuaTimerSystem:AddTimerEx(npc, XianShouFuYuan.DestroyTime*1000,1,"XianShouFuYuan.DestroyNPC", "")
				npc:SetInt("XianShouFuYuan_MapID", map_id)
				sVarSystem:SetInt("XianShouFuYuan_"..map_id.."_BoxNum", sVarSystem:GetInt("XianShouFuYuan_"..map_id.."_BoxNum") + 1)
				npc:SetInt("XianShouFuYuan_ID", id)
			end
		end
	end
	
end

function XianShouFuYuan.DestroyNPC(npc, timer, p)
	local map_id = npc:GetInt("XianShouFuYuan_MapID")
	sVarSystem:SetInt("XianShouFuYuan_"..map_id.."_BoxNum", sVarSystem:GetInt("XianShouFuYuan_"..map_id.."_BoxNum") - 1)
	sNpcSystem:DestroyNpc(npc)
end


--打开轮盘界面 -需要选中第一个钥匙
function XianShouFuYuan.OpenBox(npc, player)
	local id = npc:GetInt("XianShouFuYuan_ID")
	local level_min = ActivityConfig.GetById(id).LevelMin
	if not level_min then return end
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "不到"..level_min.."级是没有能力开启福缘宝箱的！")
		return false
	end
	
	--点击使用钥匙 就要删除宝箱 宝箱guid记在人身上 如果玩家打开界面后没用钥匙，guid无法清除
	player:SetInt("XianShouFuYuanBox", npc:GetGUID())
	
	for k,_ in ipairs(XianShouFuYuan.MainList) do
		local now_site = player:GetInt("XianShouFuYuanNowPos_"..k)
		if now_site == 0 then
			now_site = 1
			player:SetInt("XianShouFuYuanNowPos_"..k, 1)
		end
	end
	
	local str = [[
		GUI.OpenWnd("SpinWinEX")
		if SpinWinEX then
			SpinWinEX.RewardList = ]] .. XianShouFuYuan.ShowRewardStr.. [[
			SpinWinEX.Effect = ]] .. XianShouFuYuan.EffectStr.. [[
			SpinWinEX.DiceList = ]]..XianShouFuYuan.AllDiceStr..[[
			SpinWinEX.RefreshData()
		end
	]]
	--sLuaApp:LuaErr("str"..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--掷骰子 Roll点
function XianShouFuYuan.Roll(player, is_dice, dice_name, dice_num)--is_dice 1-是骰子roll点 0-是轮盘效果roll点  dice_numXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	dice_num = 1 --钥匙个数XXXXXXXXXXX
	if not(is_dice and dice_name and dice_num) then return end
	if not XianShouFuYuan.Dice[dice_name] then 
		sLuaApp:LuaErr("XianShouFuYuan.Roll 缺少XianShouFuYuan.Dice"..dice_name)
		return
	end
	if player:GetInt("XianShouFuYuanRewardItemIndex") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "您的上一次奖励尚未领取！")
		return
	end
	--先把钥匙扣了
	if tonumber(is_dice) == 1 then
		local cos_item_data = ItemConfig.GetByKeyName(dice_name)
		if sItemSystem:GetItemAmount(player, cos_item_data.Id, 3) >= dice_num then
			sItemSystem:ConsumeItemWithPriority(player, cos_item_data.Id, dice_num, true, "system", "仙兽福缘","用钥匙")
		else
			sLuaApp:LuaErr("XianShouFuYuan.Roll"..player:GetName().."使用了"..dice_name.."，实际物品不足")
			sLuaApp:NotifyTipsMsg(player, cos_item_data.Name.."不足，无法投掷！")
			return
		end
	end
	--把箱子销毁了
	local npc_guid = player:GetInt("XianShouFuYuanBox")
	if npc_guid ~= 0 then
		local npc = sNpcSystem:GetNpcByGUID(npc_guid)
		if npc then
			sNpcSystem:DestroyNpc(npc)
		end
		player:SetInt("XianShouFuYuanBox", 0)
	end
	-- +活跃值
	local active = player:GetDayInt("XianShouFuYuanActiveNum")
	if active < XianShouFuYuan.ActiveMax then
		local active_sum = active + XianShouFuYuan.ActiveAddNum
		if active_sum > XianShouFuYuan.ActiveMax then
			player:SetDayInt("XianShouFuYuanActiveNum", XianShouFuYuan.ActiveMax)
			ActivitySystem.AddActiveVal(player, XianShouFuYuan.ActiveMax - active)
		else
			player:SetDayInt("XianShouFuYuanActiveNum", active_sum)
			ActivitySystem.AddActiveVal(player, XianShouFuYuan.ActiveAddNum)
		end
	end

	local index = XianShouFuYuan.DiceToIndex[dice_name]
	if index then
		player:SetInt("XianShouFuYuanRewardIndex", index)
	else
		index = player:GetInt("XianShouFuYuanRewardIndex")
	end
	if index == 0 then
		sLuaApp:LuaErr("XianShouFuYuan.Roll index无法获取")
		return
	end

	local now_site = player:GetInt("XianShouFuYuanNowPos_"..index)
	if now_site == 0 then
		sLuaApp:LuaErr(player:GetName() .."  XianShouFuYuan.Roll now_site == 0 未经过 打开界面")
		return
	end
	
	local real_list = XianShouFuYuan.MainList[index]["Reward"]
	local round_num = 0
	local item_index = 0
	local steps = 0
	if #XianShouFuYuan.Dice[dice_name] == 2 then --步数是范围
		round_num, item_index = XianShouFuYuan.GetRollList(now_site, dice_name, real_list)
		--计算步数
		local real_list_num = #real_list
		steps = (item_index - now_site) + round_num * real_list_num
	elseif #XianShouFuYuan.Dice[dice_name] == 1 then --步数是固定index	
		item_index = XianShouFuYuan.Dice[dice_name][1] 
		if type(item_index) ~= "number" then
			sLuaApp:LuaErr("XianShouFuYuan.Dice"..dice_name.."配置错误")
			return
		end
		steps = item_index - now_site
	end
	player:SetInt("XianShouFuYuanNowPos_"..index, item_index)
	
	local type_name = real_list[item_index]["Type"]
	if type(type_name) == "string" and XianShouFuYuan.Effect[type_name] then
		local index_tb = player:GetString("XianShouFuYuanIndexRecord")
		if index_tb == "" then
			player:SetString("XianShouFuYuanIndexRecord", Lua_tools.serialize({steps}))
		else
			local tmp_tb = assert(load(" return ".. index_tb))()
			table.insert(tmp_tb, steps)
			player:SetString("XianShouFuYuanIndexRecord", Lua_tools.serialize(tmp_tb))
		end
		-- 记录客户端表演动画时间 
		local show_time = 2500 + math.abs(steps) * 300 + player:GetInt("XianShouFuYuanShowTime")
		player:SetInt("XianShouFuYuanShowTime", show_time)
		
		XianShouFuYuan.Roll(player, 0, type_name, 1)
	else
		local index_tb = player:GetString("XianShouFuYuanIndexRecord")
		local tmp_tb = {} 
		if index_tb == "" then
			tmp_tb[1] = steps
		else
			tmp_tb = assert(load(" return ".. index_tb))()
			table.insert(tmp_tb, steps)
			player:SetString("XianShouFuYuanIndexRecord", "")
		end
		--发送轮数和格子Index
		local str = [[
			if SpinWinEX then
				SpinWinEX.RollResult = ]]..Lua_tools.serialize(tmp_tb)..[[
				SpinWinEX.OnRollResult()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--sLuaApp:LuaErr("rollstr"..str)
		-- 需要根据steps+roll点时间 做延时给奖励 
		player:SetInt("XianShouFuYuanRewardItemIndex", item_index)
		player:SetInt("XianShouFuYuanRewardRoundNum", round_num)
		local show_time = 2500 + math.abs(steps) * 300 + player:GetInt("XianShouFuYuanShowTime")
		player:SetInt("XianShouFuYuanShowTime", 0)
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_LOGOUT, "XianShouFuYuan", "GiveReward")
		sLuaTimerSystem:AddTimerEx(player, show_time,1, "XianShouFuYuan.GiveReward","")
	end
	sLuaApp:LuaDbg("round_num:"..round_num)
	sLuaApp:LuaDbg("item_index:"..item_index)
	sLuaApp:LuaDbg("steps:"..steps)
end



function XianShouFuYuan.GetRollList(now_site, dice_name, reward_list)
	-- 现在位置  骰子名字 ==> 可能位置的列表
	if not next(reward_list) then
		sLuaApp:LuaErr("XianShouFuYuan.GetRollList  reward_list为空")
		return
	end
	local min_num = now_site + XianShouFuYuan.Dice[dice_name][1]
	local max_num = now_site + XianShouFuYuan.Dice[dice_name][2]
	local select_list = {}
	local round_num = 0 --随机权重总和
	local rand_sum = 0 --轮数 正负区分前进后退
	local real_list_num = #reward_list
	
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
		local cell_config = reward_list[min_num]
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
		sLuaApp:LuaErr("XianShouFuYuan.GetRollList item_index错误")
	end
	return round_num, item_index
end

--  判断 给物品奖励   起点奖励 
function XianShouFuYuan.GiveReward(player)
	-- 做延时给奖励 
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_LOGOUT, "XianShouFuYuan", "GiveReward")
	local index = player:GetInt("XianShouFuYuanRewardIndex")
	local item_index = player:GetInt("XianShouFuYuanRewardItemIndex")
	local round_num = player:GetInt("XianShouFuYuanRewardRoundNum")
	
	if item_index == 0 then
		sLuaApp:LuaErr("XianShouFuYuan.GiveReward item_index为0")
		return
	end
	
	local real_list = XianShouFuYuan.MainList[index]
	local cell_config = real_list["Reward"][item_index]
	if cell_config["Type"] == 0 and Lua_tools and next(cell_config["ItemList"]) then
		Lua_tools.AddItem(player, cell_config['ItemList'], "system", "仙兽福缘", "单格奖励")
	else
		sLuaApp:LuaErr("XianShouFuYuan.GiveReward  MainList"..index.."Reward"..item_index.."配置错误")
		return
	end
	
	local cross_num = math.abs(round_num)--反向过起点也有奖励
	if cross_num > 0 then
		if real_list["CrossStartReward"] and real_list['CrossStartRewardTipList'] then
			local item_msg = ""
			for _,v in ipairs(real_list['CrossStartRewardTipList']) do
				item_msg = item_msg .. v .." "
			end
			sLuaApp:NotifyTipsMsg(player, "通过起点，额外获得"..item_msg)
			for i = 1, cross_num, 1 do
				Lua_tools.AddItem(player, real_list["CrossStartReward"], "system", "仙兽福缘", "过起点奖励")
			end
		end
	end
	
	player:SetInt("XianShouFuYuanRewardIndex", 0)
	player:SetInt("XianShouFuYuanRewardItemIndex", 0)
	player:SetInt("XianShouFuYuanRewardRoundNum", 0)
end

function XianShouFuYuan.Initialization()
	if not Lua_tools then
		require("system/Lua_tools")
	end
	if not XianShouFuYuan.MainList then
		sLuaApp:LuaErr("缺少XianShouFuYuan.MainList")
		return
	end
	if not XianShouFuYuan.Dice then
		sLuaApp:LuaErr("缺少XianShouFuYuan.Dice")
		return
	end
	
	local show_reward_list = {}
	local all_dice_list = {}
	XianShouFuYuan.DiceToIndex = {}
	for k,v in ipairs(XianShouFuYuan.MainList) do
		if not (v["Key"] and v["CrossStartReward"] and v["Reward"]) then
			sLuaApp:LuaErr("XianShouFuYuan.MainList缺少配置")
			return
		end
		--判断列表数量
		if #v["Reward"] ~= XianShouFuYuan.SiteNum then
			sLuaApp:LuaErr("XianShouFuYuan SiteNum格子数量与XianShouFuYuan.MainList "..k.." Reward物品列表数量不相等")
			return
		end
		
		--客户端显示用 show_reward_list
		show_reward_list[k] = {}
		for a,b in ipairs(v["Reward"]) do
			b["Index"] = a
			table.insert(show_reward_list[k],{["ItemList"] = b["ItemList"], ["Type"] = b["Type"]})
		end
		
		--过起点奖励表 弹tips用
		v["CrossStartRewardTipList"] = {}		
		for _,b in ipairs(v["CrossStartReward"]) do
			if type(b) == "string" then
				local item_data = ItemConfig.GetByKeyName(b)
				if item_data then
					local item_name = item_data.Name
					table.insert(v["CrossStartRewardTipList"], item_name)
				else
					sLuaApp:LuaErr("XianShouFuYuan.MainList "..k.." CrossStartReward 物品不存在")
				end
			end
		end
		
		--钥匙表 客户端显示用
		local key_keyname = v["Key"]
		local item_key_data = ItemConfig.GetByKeyName(key_keyname) 
		if not item_key_data then
			sLuaApp:LuaErr("XianShouFuYuan.MainList "..k.." Key 物品不存在")
			return
		end
		local key_tb = XianShouFuYuan.Dice[key_keyname]
		if not key_tb then
			sLuaApp:LuaErr("XianShouFuYuan.Dice 缺少"..key_keyname)
			return	
		end
		table.insert(all_dice_list,{["Name"] = key_keyname, ["Min"] = key_tb[1], ["Max"] = key_tb[2], ["ShowImg"] = v["ShowImg"]})
		--钥匙对应列表序号
		XianShouFuYuan.DiceToIndex[key_keyname] = k
		
		--注册变量
		sCustomVarSystem:SetBroadcastScope(0, "XianShouFuYuanNowPos_"..k, 1)
	end
	
	XianShouFuYuan.AllDiceStr = Lua_tools.serialize(all_dice_list)
	XianShouFuYuan.ShowRewardStr = Lua_tools.serialize(show_reward_list)
	XianShouFuYuan.EffectStr = Lua_tools.serialize(XianShouFuYuan.Effect)
	-- sLuaApp:LuaErr("XianShouFuYuan.MainList"..Lua_tools.serialize(XianShouFuYuan.MainList))
	-- sLuaApp:LuaErr("XianShouFuYuan.DiceToIndex"..Lua_tools.serialize(XianShouFuYuan.DiceToIndex))
	-- sLuaApp:LuaErr("XianShouFuYuan.AllDiceList"..XianShouFuYuan.AllDiceStr)
	-- sLuaApp:LuaErr("XianShouFuYuan.ShowRewardList"..XianShouFuYuan.ShowRewardStr)
	-- sLuaApp:LuaErr("XianShouFuYuan.EffectStr"..XianShouFuYuan.EffectStr)
end
XianShouFuYuan.Initialization()