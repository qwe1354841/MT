--无尽的试炼
ShiLian = {}

ShiLian.FightTag = 10070
-- player 上记 --当前难度	最高难度	当前回合	货币数量	进度
-- data 上记 --当前选项index	玩家包裹	已选buff列表	已选buff总效果	
--每波需要发给客户端信息
	--title msg {event_name event_grade event_icon event_info} button_type 
	-- 进度 包裹 货币数量

--打开界面
function ShiLian.GetData(player)
	if not ShiLian.CheckLevel(player) then return end
	if not ShiLianConfig then return end
	--判断组队
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "无尽试炼为单人活动，无法组队参与！")
		return
	end
	local player_guid = tostring(player:GetGUID())
	local status = player:GetInt("WuJinShiLianStatus") -- 0 未开始 1 进行中 2 已完成
	if status == 0 then
		ShiLian.InitPlayerData(player)
		ShiLian.GetEventList(player)
	elseif status == 1 then
		if not Data["WuJinShiLian"] or not Data["WuJinShiLian"][player_guid] then
			--活动过程中 服务器关闭 数据丢失 --或者其他未知情况导致数据丢失
			player:SetInt("WuJinShiLianStatus", 0)
			sLuaApp:NotifyTipsMsg(player, "进度已重置")
			ShiLian.GetData(player)
			return
		end
	elseif status == 2 then
		local now_time =  sLuaApp:DaySinceEpoch(0)
		local can_start_day = player:GetInt("WuJinShiLianStartTimeDay") + (ShiLianConfig.RefreshTimeDay or 1)
		if can_start_day > now_time then
			sLuaApp:NotifyTipsMsg(player, "今日试炼已完成！")
			-- 当天打完后服务器重启 会导致结算界面信息丢失
			if not Data["WuJinShiLian"] or not Data["WuJinShiLian"][player_guid] then return end
			ShiLian.GetEndData(player)
		else
			player:SetInt("WuJinShiLianStatus", 0)
			ShiLian.GetData(player)
		end
		return
	end
	
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	local round_config = ShiLian.GetRoundConfig(player)

	local show_data = {}
	show_data["Title"] = round_config["Title"]
	show_data["Msg"] = round_config["Msg"]
	show_data["Step"] = {ShiLianConfig.RoundShowStep[round_num], ShiLianConfig.RoundMaxStep}
	
	show_data["ShiLianMoneyVal"] = player:GetInt("WuJinShiLianMoneyVal")
	show_data["Juju"] = Data["WuJinShiLian"][player_guid]["Juju"]
	show_data["Buff"] = Data["WuJinShiLian"][player_guid]["SelectedBuff"]
	show_data["Goods"] = Data["WuJinShiLian"][player_guid]["GoodsList"]
	
	show_data["Event"] = {}
	--sLuaApp:LuaErr("event_config"..Lua_tools.serialize(Data["WuJinShiLian"][player_guid]["OptionEventList"]))
	for _,v in ipairs(Data["WuJinShiLian"][player_guid]["OptionEventList"]) do
		local show_event = {}
		--local event_list_config = round_config["EventList"][v]
		local event_config = assert(load("return ShiLianConfig."..v[1].."['"..v[2].."']"))()
		show_event = ShiLian.GetShowData(event_config)
		--show_event["Key"] = v
		show_event["Button"] = v[3]
		
		-- 可购买按钮 加入价格
		for _,b in ipairs(show_event["Button"]) do
			if b == "购买" then
				local show_event_price = "<color=#FF0000ff>价格：免费</color>"
				local price_config = event_config["Price"]
				if price_config and price_config ~= -1 and price_config ~= 0 then
					show_event_price = "<color=#FF0000ff> 价格：".. ShiLian.ConfigToNumber(player, price_config) .. ShiLianConfig.MoneyConfig["Name"].."。</color>"
				end
				show_event["Info"] = show_event["Info"] .. show_event_price
				break
			end
		end
		table.insert(show_data["Event"], show_event)
	end
	--show_data["DifficultyConfig"] = ShiLianConfig.DifficultyConfig
	local select_difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
	show_data["SelectDifficulty"] = ShiLianConfig.DifficultyConfig[select_difficulty]
	show_data["SelectOptionIndex"] = (round_num == 0 and player:GetInt("WuJinShiLianMaxDifficulty") or 1)
	--show_data["MaxDifficulty"] = player:GetInt("WuJinShiLianMaxDifficulty")
	
	show_data["Tips"] = ShiLianConfig.Tips
	show_data["MoneyInfo"] = ShiLianConfig.MoneyConfig["Info"]
	local str = [[
		if not GUI.HasWnd('EndlessTrialsUI') then
			GUI.OpenWnd("EndlessTrialsUI")
		end
		if EndlessTrialsUI then
			EndlessTrialsUI.FormShiLianData = ]]..Lua_tools.serialize(show_data)..[[
			EndlessTrialsUI.RefreshForm()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr("str"..str)
end



--结算界面
function ShiLian.GetEndData(player)
	local is_victory = player:GetInt("ShiLian_IsVictory")
	local player_guid = tostring(player:GetGUID())
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	if not ShiLianConfig.EndConfig then
		sLuaApp:LuaErr("不存在ShiLianConfig.EndConfig")
		return 
	end
	local round_config = is_victory == 1 and ShiLianConfig.EndConfig["胜利"] or ShiLianConfig.EndConfig["失败"]
	
	local show_data = {}
	show_data["Title"] = round_config["Title"]
	show_data["Msg"] = round_config["Msg"]
	show_data["Step"] = {ShiLianConfig.RoundShowStep[round_num], ShiLianConfig.RoundMaxStep}
	
	show_data["ShiLianMoneyVal"] = player:GetInt("WuJinShiLianMoneyVal")
	show_data["Juju"] = Data["WuJinShiLian"][player_guid]["Juju"] or {}
	show_data["Buff"] = Data["WuJinShiLian"][player_guid]["SelectedBuff"] or {}
	--show_data["Goods"] = Data["WuJinShiLian"][player_guid]["GoodsList"]
	show_data["Goods"] = {}
	show_data["Goods"]["Item"] = {}
	show_data["Goods"]["Exp"] = 0	
	show_data["Goods"]["PetExp"] = 0
	
	local select_difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
	show_data["SelectDifficulty"] = ShiLianConfig.DifficultyConfig[select_difficulty]
	show_data["SelectOptionIndex"] = 1
	--show_data["MaxDifficulty"] = player:GetInt("WuJinShiLianMaxDifficulty")
	
	show_data["Tips"] = ShiLianConfig.Tips
	show_data["MoneyInfo"] = ShiLianConfig.MoneyConfig["Info"]
	
	show_data["Event"] = {}
	
	local show_reward_config =  round_config["Reward"]
	if show_reward_config and show_reward_config ~= 0 and next(show_reward_config) then
		local show_event = {}
		show_event = ShiLian.GetShowData(show_reward_config)
		show_event["Button"] = {"关闭"}
		
		local info = ""
		if is_victory == 1 then
			info = "恭喜您通过了本次无尽的试炼，奖励已通过邮件发放。"
		else
			if player:GetInt("ShiLian_RewardNeedRatio") == 1 then
				info = "非常遗憾，您未通过本次无尽的试炼，乾坤袋在战斗失败时略有破损，遗失部分袋内奖励，其他奖励已通过邮件发放。"
			else
				info = "非常遗憾，您未通过本次无尽的试炼，奖励已通过邮件发放。"
			end
		end
		show_event["Info"] = info
		
		table.insert(show_data["Event"], show_event)
	end
	
	local show_time_config = round_config["Time"]
	if show_time_config and show_time_config ~= 0 and next(show_time_config) then
		local show_event = {}
		show_event = ShiLian.GetShowData(show_time_config)
		show_event["Button"] = {"关闭"}
		
		local consume_time = player:GetInt("ShiLian_EndTime") - player:GetInt("ShiLian_StartTime")
		local record_time = player:GetInt("ShiLian_RecordTime_"..select_difficulty)
		local info = "本次无尽的试炼共耗时"..PetDevelop.GetColor(ShiLian.GetTimeStr(consume_time), "Red").."，"
		if record_time == 0 or consume_time <= record_time then
			player:SetInt("ShiLian_RecordTime_"..select_difficulty, consume_time)
			info = info.."已刷新同难度下最好成绩，请再接再厉！"
		else
			info = info.."同难度下，你的最好成绩是"..PetDevelop.GetColor(ShiLian.GetTimeStr(record_time), "Red").."，请再接再厉！"
		end
		show_event["Info"] = info
		
		table.insert(show_data["Event"], show_event)
	end
	
	local show_monster_config = round_config["Monster"]
	local monster_name_tb = Data["WuJinShiLian"][player_guid]["FightMonsterName"]
	if show_monster_config and show_monster_config ~= 0 and next(show_monster_config) and next(monster_name_tb) then
		local show_event = {}
		show_event = ShiLian.GetShowData(show_monster_config)
		show_event["Button"] = {"关闭"}
		
		local info = "本次试炼，您遭遇了怪物"
		for _,v in ipairs(monster_name_tb) do
			local name = v[1]
			local grade = v[2]
			info = info .. PetDevelop.GetColor(name, grade == 1 and "Grey" or grade) .. "，"
		end
		
		if is_victory == 1 then
			info = info .. "将此等宵小皆斩于马下，威武非凡，所向披靡！"
		else
			local lose_monster_tb = monster_name_tb[#monster_name_tb]
			info = info .. "最终败于"..PetDevelop.GetColor(lose_monster_tb[1], lose_monster_tb[2] == 1 and "Grey" or lose_monster_tb[2]).."之手，望您再接再厉，下次一定行！"
		end
		show_event["Info"] = info
		
		table.insert(show_data["Event"], show_event)
	end
	
	local str = [[
		if not GUI.HasWnd('EndlessTrialsUI') then
			GUI.OpenWnd("EndlessTrialsUI")
		end
		if EndlessTrialsUI then
			EndlessTrialsUI.FormShiLianData = ]]..Lua_tools.serialize(show_data)..[[
			EndlessTrialsUI.RefreshForm()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
	--大月卡任务
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.ShiLian(player)
	end
	
end

function ShiLian.GetRoundConfig(player)
	local round_config = {}
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	local extra_round_key = player:GetString("WuJinShiLian_ExtraRoundKey") --在额外回合内
	if extra_round_key ~= "" then
		round_config = ShiLianConfig.ExtraRoundList[extra_round_key]
		if not round_config or not next(round_config) then
			sLuaApp:LuaErr("ShiLian.GetRoundConfig  ShiLianConfig.ExtraRoundList 不存在 "..extra_round_key)
			return
		end
	else
		round_config = ShiLianConfig.RoundList["Round_"..round_num]
	end
	return round_config
end

-- 开始试炼 初始化
function ShiLian.InitPlayerData(player)
	if not Data then
		sLuaApp:LuaErr("ShiLian.GetData 缺少Data")
		return
	end
	if not Data["WuJinShiLian"] then
		Data["WuJinShiLian"] = {}
	end

	local max_difficulty = player:GetInt("WuJinShiLianMaxDifficulty")
	if max_difficulty == 0 then
		player:SetInt("WuJinShiLianMaxDifficulty", 1)
	end	
	local player_guid = tostring(player:GetGUID())
	Data["WuJinShiLian"][player_guid] = {}
	Data["WuJinShiLian"][player_guid]["OptionEventList"] = {}		-- 选项列表 {{MonsterList, 小怪_1,{buff_config}}}
	Data["WuJinShiLian"][player_guid]["SelectedBuff"] = {} 			-- 显示buff用
	Data["WuJinShiLian"][player_guid]["HasBuff"] = {}				-- 战斗+buff用
	Data["WuJinShiLian"][player_guid]["BuffPaoPao"] = {}			-- 战斗中喊buff 壮士气用
	Data["WuJinShiLian"][player_guid]["Juju"] = {}					-- 异宝展示用
	Data["WuJinShiLian"][player_guid]["HasJuju"] = {}				-- 玩家已拥有的juju
	Data["WuJinShiLian"][player_guid]["FightMonsterName"] = {}		-- 记录打过的怪物名 --- 结算时用
	Data["WuJinShiLian"][player_guid]["GoodsList"] = {}				-- 战斗包裹
	Data["WuJinShiLian"][player_guid]["GoodsList"]["Exp"] = 0		-- 记录人物经验	
	Data["WuJinShiLian"][player_guid]["GoodsList"]["PetExp"] = 0	-- 记录宠物经验
	Data["WuJinShiLian"][player_guid]["GoodsList"]["Money"] = {}	-- 记录货币
	Data["WuJinShiLian"][player_guid]["GoodsList"]["Item"] = {}		-- 记录物品  --- {[ItemKeyName] = {[0] = 物品显示序号, [1] = 非绑定物品数量, [2] = 绑定物品数量}, }
	Data["WuJinShiLian"][player_guid]["GoodsList"]["ItemIndex"] = 0 -- 记录的物品种类（排序用）
	Data["WuJinShiLian"][player_guid]["GoodsList"]["GetJuju"] = {}	-- 记录获得的juju
	Data["WuJinShiLian"][player_guid]["SelectedOptionEventKey"] = {}-- 记录单回合已选择的事件名
	
	player:SetInt("WuJinShiLianSelectDifficulty", 1)		-- 默认难度为1
	player:SetInt("WuJinShiLianRoundNum", 0)				-- 回合 0
	player:SetInt("WuJinShiLianMoneyVal", 0)				-- 货币 0
	player:SetInt("WuJinShiLianStatus", 1)					-- 状态 进行中
	player:SetInt("WuJinShiLianRefreshNum",1)				-- 设置刷新次数为 1
	player:SetInt("ShiLian_IsVictory", 0)					-- 重置是否胜利
	player:SetInt("ShiLian_StartTime", 0)					-- 重置开始时间
	player:SetInt("ShiLian_EndTime", 0)						-- 重置结束时间
	player:SetInt("ShiLian_RewardNeedRatio", 0)				-- 重置是否最终奖励打折扣
	player:SetInt("ShiLian_SubOptionNum", 0)				-- 重置扣除选项数量

	player:SetInt("WuJinShiLianStartTimeDay", sLuaApp:DaySinceEpoch(0)) --记录开启时间

	local has_juju_str = player:GetString("WuJinShiLianHasJuju")
	if has_juju_str == "" then
		Data["WuJinShiLian"][player_guid]["HasJuju"] = ShiLianConfig.JujuInitial
		player:SetString("WuJinShiLianHasJuju", Lua_tools.serialize(ShiLianConfig.JujuInitial)) -- 不存也没关系
	else
		Data["WuJinShiLian"][player_guid]["HasJuju"] = assert(load("return " .. has_juju_str))()
	end
end

-- 难度选择
function ShiLian.GetDifficultyList(player)
	if not ShiLianConfig.DifficultyList then 
		sLuaApp:LuaErr("不存在ShiLianConfig.DifficultyList")
		return 
	end
	local max_difficulty = player:GetInt("WuJinShiLianMaxDifficulty")
	local option_event_list = {}
	
	for i = 1, max_difficulty do
	--for k,v in ipairs(ShiLianConfig.DifficultyList) do
		local difficulty_event = {}
		difficulty_event[1] = "DifficultyList"
		difficulty_event[2] = "Difficulty_"..i
		difficulty_event[3] = {"选择"}
		table.insert(option_event_list, difficulty_event)
	end
	local player_guid = tostring(player:GetGUID())
	Data["WuJinShiLian"][player_guid]["OptionEventList"] = option_event_list
end

-- 随机+记录可选选项
function ShiLian.GetEventList(player)
	--当前round数
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	if round_num == 0 then
		ShiLian.GetDifficultyList(player)
		return
	end
	local player_guid = tostring(player:GetGUID())
	local event_list = ShiLianConfig.RoundList["Round_"..round_num]["EventList"]
	local rand_name = "ShiLian_".. round_num
	
	local is_cache = true
	if round_num == 1 then--第一回合选择juju 需要从玩家已拥有的juju中取
		event_list = Lua_tools.DupTable(event_list)
		for k,v in ipairs(event_list) do 
			if not ShiLian.HasValue(Data["WuJinShiLian"][player_guid]["HasJuju"], v["Key"]) then
				event_list[k] = nil --需要key对应
				----table.remove(event_list,k)
			end
		end
		-- 每次随机库都不同
		is_cache = false
	end
	
	local event_num = ShiLianConfig.RoundList["Round_"..round_num]["EventNum"]
	local sub_option_num = player:GetInt("ShiLian_SubOptionNum")
	if sub_option_num > 0 then -- 如果该回合有扣掉的选项，该回合已选择的事件不能进随机事件表 -- 购买商品事件用
		event_num = event_num - sub_option_num
		event_list = Lua_tools.DupTable(event_list)
		for k,v in ipairs(event_list) do 
			if Data["WuJinShiLian"][player_guid]["SelectedOptionEventKey"][v["Key"]] then
				event_list[k] = nil
			end
		end
		is_cache = false
	end
	--sLuaApp:LuaErr("event_list"..Lua_tools.serialize(event_list))

	local event_index_list = ShiLian.GetRandIndex(event_list, rand_name, event_num, is_cache)
	Data["WuJinShiLian"][player_guid]["OptionEventList"] = ShiLian.EventIndexToOption(player, event_list, event_index_list)
end

function ShiLian.EventIndexToOption(player, event_list, event_index_list)
	-- sLuaApp:LuaErr("event_list "..Lua_tools.serialize(event_list))
	-- sLuaApp:LuaErr("event_index_list "..Lua_tools.serialize(event_index_list))
	local option_event_list = {}
	local rand_monster_num = {} -- 存button样式
	for _,v in ipairs(event_index_list) do
		local event = event_list[v]
		local typ = event["Type"]
		local key = event["Key"]
		local button_config = event["Button"]
		if typ == "MonsterList" and key == "随机怪物" then
			table.insert(rand_monster_num, button_config)
			--rand_monster_num = rand_monster_num + 1
		else
			table.insert(option_event_list, {typ, key, button_config})
		end
	end
	if #rand_monster_num > 0 then
		local difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
		local round_num = player:GetInt("WuJinShiLianRoundNum")
		if not ShiLianConfig.MonsterGroupList[difficulty] then
			sLuaApp:LuaErr("ShiLianConfig.MonsterGroupList  缺少 " ..difficulty)
			return {}
		end
		local monster_group = ShiLianConfig.MonsterGroupList[difficulty][round_num]
		if not monster_group then
			sLuaApp:LuaErr("ShiLianConfig.MonsterGroupList "..difficulty.." 缺少 " ..round_num)
			return {}
		end
		local monster_group_index_tb = ShiLian.GetRandIndex(monster_group, "MonsterGroup_"..difficulty.."_"..round_num, #rand_monster_num, true)
		for k,v in ipairs(monster_group_index_tb) do
			table.insert(option_event_list, {"MonsterList", monster_group[v], rand_monster_num[k]})
		end
	end
	--sLuaApp:LuaErr("OptionEventList"..Lua_tools.serialize(option_event_list))
	return option_event_list
end

-----点击选项----
--点击button后 -- show_index是客户端的index  -- 第一回合需要选择难度
function ShiLian.GetButtonClick(player, show_index, button_type, check_mod)
	if not ShiLian.CheckLevel(player) then return end
	--判断组队
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "无尽试炼为单人活动，无法组队参与！")
		return
	end
	
	if not show_index or not button_type then return end
	show_index = tonumber(show_index)
	if not show_index then return end
	button_type = tostring(button_type)
	
	if button_type == "关闭" then
		ShiLian.CloseSelect(player)
		return 
	end
	
	local player_guid = tostring(player:GetGUID())
	local option_event_list = Data["WuJinShiLian"][player_guid]["OptionEventList"]
	local event_list_config = option_event_list[show_index]
	if not event_list_config then
		sLuaApp:LuaErr("ShiLian.GetButtonClick "..player_guid.." OptionEventList不存在show_index "..show_index)
		return
	end
	local button_config = event_list_config[3]
	if not ShiLian.HasValue(button_config, button_type) then
		sLuaApp:LuaErr("ShiLian.GetButtonClick button_type选择了"..button_type.." 实际不可选")
		return
	end
	if not ShiLian.ButtonFunction[button_type] then
		sLuaApp:LuaErr("ShiLian.GetButtonClick  ButtonFunction中不存在button_type"..button_type)
		return
	end
	local event_type = event_list_config[1]
	local event_key = event_list_config[2]
	
	--难度选择
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	if round_num == 0 and button_type == "选择" then
		if not check_mod or check_mod ~= 1 then
			local msg = "是否确定挑战<color=#FF0000ff>"..ShiLianConfig.DifficultyList[event_key]["Name"].."</color>难度？确认后本次挑战无法修改难度！"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "ShiLian.GetButtonClick(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..show_index..",'"..button_type.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
	end
	
	if round_num == 1 and button_type == "选择" then
		if not check_mod or check_mod ~= 1 then
			local msg = "是否确定"
			local juju_config = ShiLianConfig.JujuList[event_key]
			if not juju_config then
				sLuaApp:LuaErr("ShiLian.GetButtonClick JujuList缺少"..event_key)
				return
			end
			local juju_name = juju_config["Name"]
			if juju_name then
				msg = msg.."选择<color=#FF0000ff>"..juju_name.."</color>？确认后本次挑战无法修改护身符！"
			end
			
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "ShiLian.GetButtonClick(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..show_index..",'"..button_type.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
	end

	ShiLian.ButtonFunction[button_type](player, event_type, event_key, show_index)
end

--去掉选项 --记录去掉的选项事件名 --没有选项就进入下一回合
function ShiLian.RemoveOption(player, show_index, event_key)
	local player_guid = tostring(player:GetGUID())
	local option_event_list = Data["WuJinShiLian"][player_guid]["OptionEventList"]
	table.remove(option_event_list, show_index)
	if next(option_event_list) then
		player:SetInt("ShiLian_SubOptionNum", player:GetInt("ShiLian_SubOptionNum") + 1)
		--记录去掉的选项事件名
		Data["WuJinShiLian"][player_guid]["SelectedOptionEventKey"][event_key] = true
		ShiLian.GetData(player)
	else
		ShiLian.ToNextRound(player)
	end
end

--接受到button类型 需要根据事件类型 判断能否进行
-- button分支
ShiLian.ButtonFunction = {
	["刷新"] = function(player, event_type, event_key, show_index)
		ShiLian.EventRefresh(player, 0)
	end,
	["购买"] = function(player, event_type, event_key, show_index)
		if event_type == "BuffList" then
			if ShiLian.SubMoney(player, ShiLianConfig.BuffList[event_key]) then
				ShiLian.BuffSelect(player, event_key)
				ShiLian.RemoveOption(player, show_index, event_key)
			end
			
		elseif event_type == "GoodsList" then
			if ShiLian.SubMoney(player, ShiLianConfig.GoodsList[event_key]) then
				ShiLian.GoodsSelect(player, event_key)
				ShiLian.RemoveOption(player, show_index, event_key)
			end

		end
	end,
	["选择"] = function(player, event_type, event_key, show_index)
		if event_type == "JujuList" then
			ShiLian.JujuSelect(player, event_key)
			ShiLian.ToNextRound(player)
		elseif event_type == "BuffList" then
			if ShiLian.SubMoney(player, ShiLianConfig.BuffList[event_key]) then
				ShiLian.BuffSelect(player, event_key)
				ShiLian.ToNextRound(player)
			end
		elseif event_type == "GoodsList" then
			if ShiLian.SubMoney(player, ShiLianConfig.GoodsList[event_key]) then --存在 选择按钮 且 扣货币
				ShiLian.GoodsSelect(player, event_key)
				ShiLian.ToNextRound(player)
			end
		elseif event_type == "ExtraRoundList" then
			ShiLian.ExtraRoundSelect(player, event_key)
		elseif event_type == "DifficultyList" then
			ShiLian.DifficultySelect(player, event_key)
			ShiLian.ToNextRound(player)
		end
	end,
	["路过"] = function(player, event_type, event_key, show_index)
		--进入下一回合
		ShiLian.ToNextRound(player)
	end,
	["战斗"] = function(player, event_type, event_key, show_index)
		--只有MonsterList能进入战斗
		if event_type ~= "MonsterList"  then
			sLuaApp:LuaErr("ShiLian.ButtonFunction 战斗 event_type ~= MonsterList")
			return false
		end
		ShiLian.MonsterFight(player, event_key)
	end,
	["确认"] = function(player, event_type, event_key, show_index)
		if event_type == "BuffList" then
			ShiLian.BuffSelect(player, event_key)
			ShiLian.ToNextRound(player)
			
		elseif event_type == "GoodsList" then
			ShiLian.GoodsSelect(player, event_key)
			ShiLian.ToNextRound(player)
		elseif event_type == "ExtraRoundList" then
			ShiLian.ExtraRoundSelect(player, event_key)
		end
	end,
}

function ShiLian.DifficultySelect(player, event_key)
	local difficulty_config = ShiLianConfig.DifficultyList[event_key]
	if not difficulty_config then
		sLuaApp:LuaErr("ShiLian.DifficultySelect   不存在 "..event_key)
		return
	end
	local max_difficulty = player:GetInt("WuJinShiLianMaxDifficulty")
	local select_difficulty = tonumber(sLuaApp:StrSplit(event_key, "_")[2])
	
	player:SetInt("WuJinShiLianSelectDifficulty", select_difficulty)
	
	--记录开始时间
	local now_time = sLuaApp:SecondSinceEpoch(0)
	player:SetInt("ShiLian_StartTime", now_time)
end

--刷新按钮 -所有类型事件
function ShiLian.EventRefresh(player, check_mod)
	local refresh_num = player:GetInt("WuJinShiLianRefreshNum")	
	local consume_config = ShiLianConfig.RefreshConsume["Consume_"..refresh_num]
	if not consume_config then
		sLuaApp:NotifyTipsMsg(player, "当前刷新次数已达上限！")
		return
	end
	local consume_money_type = consume_config["MoneyType"]
	local consume_money_val = consume_config["MoneyVal"]
	if not consume_money_type or not consume_money_val then
		sLuaApp:LuaErr("ShiLianConfig.RefreshConsume 配置错误  Consume_"..refresh_num)
		return
	end
	local res_money_val = ShiLian.ConfigToNumber(player, consume_money_val)
	if check_mod ~= 1 and res_money_val > 0 then
		local str = [[GlobalUtils.ShowServerBoxMessage("本次刷新将消耗#OFFSET<X:0,Y:-8#IMAGE]]..ShiLianConfig.MoneyIcon[consume_money_type]..[[#OFFSETEND>#]]..res_money_val..[[，是否确定？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "ShiLian.EventRefresh(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),1)")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	if not Lua_tools.IsMoneyEnough(player, consume_money_type, res_money_val) then
		if MoneyChange then
			local f_name = [[ShiLian.EventRefresh(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),1)]]
			MoneyChange.LackMoney(player, consume_money_type, res_money_val, f_name)
		else
			sLuaApp:NotifyTipsMsg(player,"您的"..Lua_tools.GetMoneyName(consume_money_type).."不足！")
		end
		return
	end
	if not Lua_tools.SubMoney(player, consume_money_type, res_money_val, "system", "无尽试炼", "刷新消耗") then
		sLuaApp:LuaErr("您的"..Lua_tools.GetMoneyName(consume_money_type).."不足！")
		return
	end
	ShiLian.GetEventList(player)
	player:SetInt("WuJinShiLianRefreshNum", refresh_num + 1)
	sLuaApp:NotifyTipsMsg(player, "刷新成功！")
	ShiLian.GetData(player)
end

--选择按钮 -JujuList -- 暂不考虑 换juju or 删juju 的情况XXXXX
function ShiLian.JujuSelect(player, event_key)
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	if not round_num == 1 then
		sLuaApp:LuaErr("暂不支持非第一回合选择juju")--XXXXXXXXXXXX
		return false
	end
	
	local player_guid = tostring(player:GetGUID())
	local juju_config = ShiLianConfig.JujuList[event_key]
	if not juju_config then
		sLuaApp:LuaErr("ShiLianConfig.JujuList 不存在 ".. event_key)
		return false
	end
	
	if juju_config["Buff"] then
		ShiLian.AddBuff(player, juju_config["Buff"], juju_config["BuffTrigger"] and juju_config["BuffTrigger"] or 1)
	end	
	if juju_config["Reward"] then
		ShiLian.RecordReward(player, juju_config["Reward"], "ShiLian_JujuList_"..event_key)
	end
	
	Data["WuJinShiLian"][player_guid]["Juju"] = ShiLian.GetShowData(juju_config) -- 加入客户端显示表

end

--获得buff
function ShiLian.BuffSelect(player, event_key)
	local buff_config = ShiLianConfig.BuffList[event_key]
	if not buff_config then
		sLuaApp:LuaErr("ShiLianConfig.BuffList 不存在 ".. event_key)
		return false
	end
	
	if not buff_config["Buff"] then
		sLuaApp:LuaErr("ShiLianConfig.BuffList "..event_key .." 缺少buff配置" )
		return false
	end
	local buff_trigger = buff_config["BuffTrigger"] or 1
	ShiLian.AddBuff(player, buff_config["Buff"], buff_trigger)
	
	--加入客户端显示表
	local player_guid = tostring(player:GetGUID())
	table.insert(Data["WuJinShiLian"][player_guid]["SelectedBuff"], ShiLian.GetShowData(buff_config))
	--加入 战斗中喊话表
	buff_trigger = tostring(buff_trigger)
	if not Data["WuJinShiLian"][player_guid]["BuffPaoPao"][buff_trigger] then
		Data["WuJinShiLian"][player_guid]["BuffPaoPao"][buff_trigger] = {}
	end
	local round_buff_name_tb = Data["WuJinShiLian"][player_guid]["BuffPaoPao"][buff_trigger]
	table.insert(round_buff_name_tb, buff_config["Name"])
end

--选择物品 -- 把物品加入临时背包
function ShiLian.GoodsSelect(player, event_key)
	local goods_config = ShiLianConfig.GoodsList[event_key]
	if not goods_config then
		sLuaApp:LuaErr("ShiLianConfig.GoodsList 不存在 ".. event_key)
		return false
	end
	
	if not goods_config["Reward"] then
		sLuaApp:LuaErr("ShiLianConfig.GoodsList "..event_key .." 缺少reward配置" )
		return false
	end
	ShiLian.RecordReward(player, goods_config["Reward"], "ShiLian_GoodsList_"..event_key)
end

--选择额外回合
function ShiLian.ExtraRoundSelect(player, event_key)
	local extra_round_config = ShiLianConfig.ExtraRoundList[event_key]

	local player_guid = tostring(player:GetGUID())
	local event_list = extra_round_config["EventList"]

	--sLuaApp:LuaErr(" ExtraRoundSelect event_list"..Lua_tools.serialize(event_list))
	--local round_num = player:GetInt("WuJinShiLianRoundNum")
	local rand_name = "ShiLian_ExtraRound_".. event_key
	local event_num = extra_round_config["EventNum"]
	local event_index_list = ShiLian.GetRandIndex(event_list, rand_name, event_num, true)
	
	--Data["WuJinShiLian"][player_guid]["EventIndexList"] = event_index_list
	Data["WuJinShiLian"][player_guid]["OptionEventList"] = ShiLian.EventIndexToOption(player, event_list, event_index_list)
	--记录额外回合
	player:SetString("WuJinShiLian_ExtraRoundKey", event_key)
	--设置刷新次数为 1
	player:SetInt("WuJinShiLianRefreshNum",1)	
	
	ShiLian.GetData(player)
end

-- 扣货币
function ShiLian.SubMoney(player, event_config)
	if not event_config then
		sLuaApp:LuaErr("ShiLian.SubMoney  不存在 event_config")
		return false
	end
	local price = event_config["Price"]
	if not price then
		sLuaApp:LuaErr("ShiLian.SubMoney  不存在 price")
		return false
	end
	if price == -1 then
		return true
	end
	local res_price = ShiLian.ConfigToNumber(player, price)
	local has_money = player:GetInt("WuJinShiLianMoneyVal")
	if res_price > has_money then
		sLuaApp:NotifyTipsMsg(player, "您的"..ShiLianConfig.MoneyConfig["Name"].."不足！")
		return false
	end
	player:SetInt("WuJinShiLianMoneyVal", has_money - res_price)
	return true
end

--战斗按钮 MonsterList
function ShiLian.MonsterFight(player, event_key)
	--local player_guid = tostring(player:GetGUID())
	local monster_config = ShiLianConfig.MonsterList[event_key]
	if not monster_config then
		sLuaApp:LuaErr("ShiLianConfig.MonsterList 不存在 ".. event_key)
		return false
	end
	local mon_id = monster_config["MonID"]
	
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_PRE_GEN_MONSTER, "ShiLian", "on_pre_gen_monster")
	if sFightSystem:StartTagPVE(player, mon_id, ShiLian.FightTag, "ShiLian", "MonsterFightCallBack", ""..player:GetGUID()) then
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "ShiLian", "MonsterFightOnResult")
		player:SetString("ShiLianMonsterFight_MonsterKey", event_key)
		local str = [[
			GUI.DestroyWnd("EndlessTrialsUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sTriggerSystem:DelTrigger(player, TRIGGER_ON_PRE_GEN_MONSTER, "ShiLian", "on_pre_gen_monster")
		sLuaApp:LuaErr("ShiLian.MonsterFight 开始pve失败")
		return false
	end
end

--战斗前回调
function ShiLian.on_pre_gen_monster(player, monster_id, monster_level)
	local difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
	local round_num = player:GetInt("WuJinShiLianRoundNum")
	local new_monster_level = ShiLianConfig.MonsterLevel[difficulty][round_num]
	if not new_monster_level then
		sLuaApp:LuaErr("ShiLian.MonsterFight 不存在 monster_level")
		return monster_level
	end
	--sLuaApp:LuaErr("SetNewMonsterLevel "..new_monster_level)
	return new_monster_level
end

--战斗完回调
function ShiLian.MonsterFightCallBack(typ, tag, custom)
end

--人物完成战斗回调
function ShiLian.MonsterFightOnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "ShiLian", "MonsterFightOnResult")
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_PRE_GEN_MONSTER, "ShiLian", "on_pre_gen_monster")
	local event_key = player:GetString("ShiLianMonsterFight_MonsterKey")
	player:SetString("ShiLianMonsterFight_MonsterKey", "")
	
	local monster_config = ShiLianConfig.MonsterList[event_key]
	if not monster_config then
		sLuaApp:LuaErr("ShiLianConfig.MonsterList 不存在 ".. event_key)
		return false
	end
	-- 记下怪物名字
	local player_guid = tostring(player:GetGUID())
	table.insert(Data["WuJinShiLian"][player_guid]["FightMonsterName"], {monster_config["Name"], monster_config["Grade"]})
	
	if victory == 2 then
		--记录奖励和buff 
		if monster_config["Reward"] then
			ShiLian.RecordReward(player, monster_config["Reward"], "ShiLian_MonsterList_"..event_key)
		end
		
		--进入下一回合
		ShiLian.ToNextRound(player)
		
		local str = [[
			GUI.OpenWnd("EndlessTrialsUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		ShiLian.GetData(player)
	else
		ShiLian.End(player, false)
	end
end

--进入下一回合
function ShiLian.ToNextRound(player)
	--清除记录的额外回合
	if player:GetString("WuJinShiLian_ExtraRoundKey") ~= "" then
		player:SetString("WuJinShiLian_ExtraRoundKey", "")
	end
	--需要扣除的选项数量清零
	player:SetInt("ShiLian_SubOptionNum", 0)
	--清空本回合已选择事件
	local player_guid = tostring(player:GetGUID())
	Data["WuJinShiLian"][player_guid]["SelectedOptionEventKey"] = {}
	
	local now_round_num = player:GetInt("WuJinShiLianRoundNum")
	--记录回合奖励
	local round_config = ShiLianConfig.RoundList["Round_"..now_round_num]
	if round_config["IsGetRoundReward"] and round_config["IsGetRoundReward"] == 1 then
		local difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
		if ShiLianConfig.RoundRewardList[difficulty] then
			local round_reward_group = ShiLianConfig.RoundRewardList[difficulty][now_round_num]
			if round_reward_group then
				local round_reward_key = round_reward_group[sLuaApp:RandInteger(1, #round_reward_group)]
				ShiLian.RecordReward(player, ShiLianConfig.RoundReward[round_reward_key], "RoundReward_"..round_reward_key)
			else
				sLuaApp:LuaErr("ShiLianConfig.RoundRewardList "..difficulty.." 缺少round_num"..now_round_num)
			end
		else
			sLuaApp:LuaErr("ShiLianConfig.RoundRewardList 缺少difficulty"..difficulty)
		end		
	end
	
	local next_round_num = now_round_num + 1
	if ShiLianConfig.RoundList["Round_"..next_round_num] then
		player:SetInt("WuJinShiLianRoundNum", next_round_num)
		--设置刷新次数为 1
		player:SetInt("WuJinShiLianRefreshNum",1)	
		ShiLian.GetEventList(player)
		ShiLian.GetData(player)
		--提示进入下一回合
		local round_config = ShiLian.GetRoundConfig(player)
		local title = round_config["Title"]
		sLuaApp:NotifyTipsMsgEx(player, "<color=#FF0000ff> 回合 "..next_round_num.." ："..title.." </color>")
		--sLuaApp:NotifyTipsMsgEx(player, "<color=#FF0000ff> 回合 ".." ："..title.." </color>")
	else
		ShiLian.End(player, true)
	end
end

function ShiLian.CloseSelect(player)
	if player:GetInt("WuJinShiLianStatus") == 2 then
		local is_victory = player:GetInt("ShiLian_IsVictory")
		--player:SetString("SYSTEM_ConfirmBox_Function", "")
		if is_victory == 1 then
			local max_difficulty = player:GetInt("WuJinShiLianMaxDifficulty")
			local difficulty = player:GetInt("WuJinShiLianSelectDifficulty")
			if max_difficulty == difficulty then
				--更新排行榜
				if is_victory then
					local ranking_list_id = RankingListSystem.Config["无尽的试炼榜"] or 56
					local difficulty_name = ShiLianConfig.DifficultyConfig[difficulty]
					sRanklistSystem:UpdateRanklist(ranking_list_id, player:GetGUID(), difficulty, player:GetName(), difficulty_name)
				end
				local next_difficulty = difficulty + 1
				if ShiLianConfig.DifficultyConfig[next_difficulty] then
					player:SetInt("WuJinShiLianMaxDifficulty", next_difficulty)
					sLogServerSystem:LogToServer(0, player, "无尽的试炼最高难度", difficulty, next_difficulty, "无尽的试炼最高难度", "最高可挑战难度")
					player:SetInt("WuJinShiLianStatus", 0)
					local end_msg = "无尽试炼已结束！已解锁<color=#FF0000ff>"..ShiLianConfig.DifficultyConfig[next_difficulty].."</color>难度！是否继续挑战？"
					player:SetString("SYSTEM_ConfirmBox_Function", "ShiLian.GetData(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
					local str = [[GlobalUtils.ShowServerBoxMessage("]]..end_msg..[[")]]
					sLuaApp:ShowForm(player, "脚本表单", str)
				end
			end
		end
		
	end
	local str = [[
		if GUI.HasWnd('EndlessTrialsUI') then
			GUI.DestroyWnd("EndlessTrialsUI")
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--结束试炼
function ShiLian.End(player,is_victory) --is_victory 是否通关
	-- 结算奖励 发奖励邮件
	ShiLian.TemporaryBagAddItem(player)

	player:SetInt("WuJinShiLianStatus", 2)	--状态已结束
	--记录是否胜利
	player:SetInt("ShiLian_IsVictory", is_victory and 1 or 0)
	--记录结束时间
	local now_time = sLuaApp:SecondSinceEpoch(0)
	player:SetInt("ShiLian_EndTime", now_time)
	--结算界面
	ShiLian.GetEndData(player)

	sLuaApp:NotifyTipsMsg(player, "试炼结束！")
	--player:SetInt("WuJinShiLianRoundNum", 0) --回合数置为 0

	--player:SetInt("WuJinShiLianMoneyVal", 0) --货币清零
	--player:SetInt("WuJinShiLianRefreshNum",0)--刷新次数清零
end

-- ShiLianConfig.BuffList["Buff_1"]["Buff"]
--添加buff 进战斗用buff表 --添加buff暂不考虑需要删buff的情况XXXXXXXX
function ShiLian.AddBuff(player, buff_config, trigger_round)
	local player_guid = tostring(player:GetGUID())
	local has_buff_data = Data["WuJinShiLian"][player_guid]["HasBuff"]
	trigger_round = tostring(trigger_round)
	if not has_buff_data[trigger_round] then
		has_buff_data[trigger_round] = {}
	end
	
	for k,v in pairs(buff_config) do
		if not has_buff_data[trigger_round][k] then
			has_buff_data[trigger_round][k] = {}
		end
		for _,b in ipairs(v) do
			table.insert(has_buff_data[trigger_round][k], b) --进战斗+buff用
		end
	end
end

--记录已获得的奖励
function ShiLian.RecordReward(player, reward_config, reward_name)
	-- 随机物品需要做随机  试炼货币直接加上
	if not next(reward_config) then return end
	local player_guid = tostring(player:GetGUID())
	local record_reward_list = Data["WuJinShiLian"][player_guid]["GoodsList"]
	
	local reward_msg = "" --需求 加个提示
	-- +exp
	local add_exp = reward_config["Exp"]
	if add_exp and add_exp ~= 0 then
		local res_exp = ShiLian.ConfigToNumber(player, add_exp)
		record_reward_list["Exp"] = record_reward_list["Exp"] + res_exp
		reward_msg = reward_msg .. ShiLian.GetIconMsg("Exp", res_exp).."，"
	end
	-- +pet exp
	local add_pet_exp = reward_config["PetExp"]
	if add_pet_exp and add_pet_exp ~= 0 then
		local res_pet_exp = ShiLian.ConfigToNumber(player, add_pet_exp)
		record_reward_list["PetExp"] = record_reward_list["PetExp"] + res_pet_exp
		reward_msg = reward_msg .. ShiLian.GetIconMsg("PetExp", res_pet_exp).."，"
	end
	-- +money
	local add_money_type = reward_config["MoneyType"]
	local add_money_val = reward_config["MoneyVal"]
	if add_money_type and add_money_val and add_money_val ~= 0 then
		add_money_type = tostring(add_money_type)
		local res_money = ShiLian.ConfigToNumber(player, add_money_val)
		if record_reward_list["Money"][add_money_type] then
			record_reward_list["Money"][add_money_type] = record_reward_list["Money"][add_money_type] + res_money
		else
			record_reward_list["Money"][add_money_type] = res_money
		end

		reward_msg = reward_msg .. ShiLian.GetIconMsg(tonumber(add_money_type), res_money).."，"
	end
	-- +juju
	local add_juju = reward_config["Juju"]
	if add_juju and add_juju ~= "" then
		record_reward_list["GetJuju"][add_juju] = true
		reward_msg = reward_msg .. "护身符 "..add_juju.."，"
	end
	-- +固定物品  record_reward_list["Item"] = {[ItemKeyName] = {[0] = 物品显示序号, [1] = 非绑定物品数量, [2] = 绑定物品数量}}
	local item_index = record_reward_list["ItemIndex"]
	local item_list = reward_config["Item"]
	if item_list and next(item_list) then
		for k,v in ipairs(item_list) do
			if type(v) == "string" then
				if not record_reward_list["Item"][v] then
					record_reward_list["Item"][v] = {}
					record_reward_list["Item"][v]["0"] = item_index
					item_index = item_index + 1
				end
				if item_list[k+2] == 0 then
					record_reward_list["Item"][v]["1"] = (record_reward_list["Item"][v]["1"] or 0) + item_list[k+1]
				else
					record_reward_list["Item"][v]["2"] = (record_reward_list["Item"][v]["2"] or 0) + item_list[k+1]
				end

				local item_name = ShiLian.ItemKeyToName(v)
				reward_msg = reward_msg .. item_name.."*".. item_list[k+1] .."，"
			end
		end
	end
	-- +随机物品
	local rand_item_list = reward_config["RandItemList"]
	if rand_item_list and next(rand_item_list) then
		for k,v in ipairs(rand_item_list) do
			local item_rand_time = v["RandTime"] or 1
			local item_rand_list = v["ItemRand"]
			if item_rand_list then
				local res_index_list = Lua_tools.PlayerStartRandom(item_rand_list, reward_name.."_"..k, item_rand_time, true, true)
				for _,v in ipairs(res_index_list) do
					local res_rand_tb = item_rand_list[v]
					if res_rand_tb["JujuKey"] then
						record_reward_list["GetJuju"][res_rand_tb["JujuKey"]] = true
						reward_msg = reward_msg .. "护身符 "..res_rand_tb["JujuKey"].."，"
					elseif res_rand_tb["ItemKey"] and res_rand_tb["ItemKey"] ~= "nil" then
						local item_key = res_rand_tb["ItemKey"]
						--local item_index = record_reward_list["ItemIndex"]
						if not record_reward_list["Item"][item_key] then
							record_reward_list["Item"][item_key] = {}
							record_reward_list["Item"][item_key]["0"] = item_index
							item_index = item_index + 1
						end
						if res_rand_tb["Bind"] == 0 then
							record_reward_list["Item"][item_key]["1"] = (record_reward_list["Item"][item_key]["1"] or 0) + res_rand_tb["Num"]
						else
							record_reward_list["Item"][item_key]["2"] = (record_reward_list["Item"][item_key]["2"] or 0) + res_rand_tb["Num"]
						end
						
						local item_name = ShiLian.ItemKeyToName(item_key)
						reward_msg = reward_msg .. item_name.."*".. res_rand_tb["Num"] .."，"
					end
				end
			end
		end
	end
		
	-- +ShiLian货币   -不记录 直接加
	local add_shilian_money = reward_config["ShiLianMoney"]
	if add_shilian_money and add_shilian_money ~= 0 then
		local res_add_shilian_money = ShiLian.ConfigToNumber(player, add_shilian_money)
		local res_shilian_money = res_add_shilian_money + player:GetInt("WuJinShiLianMoneyVal")
		if res_shilian_money < 0 then
			res_shilian_money = 0
		end
		player:SetInt("WuJinShiLianMoneyVal", res_shilian_money)
		reward_msg = reward_msg .. ShiLianConfig.MoneyConfig["Name"] .."*" ..res_add_shilian_money.."，"
	end
	
	if reward_msg ~= "" then
		reward_msg = string.sub(reward_msg, 1, -4)
		sLuaApp:NotifyTipsMsgEx(player, "随行包裹中增加了".. reward_msg)
	end
	
	ShiLian.GetData(player)
end
-- 发送记录的奖励
function ShiLian.TemporaryBagAddItem(player)
	if player:GetInt("WuJinShiLianStatus") ~= 1 then
		return
	end

	local player_guid = tostring(player:GetGUID())
	local record_reward_list = Data["WuJinShiLian"][player_guid]["GoodsList"]
	
	local need_ratio = false
	local reward_ratio = -1
	if ShiLianConfig.FailRewardRatio then
		reward_ratio = ShiLian.ConfigToNumber(player, ShiLianConfig.FailRewardRatio)
		if reward_ratio >= 0 and reward_ratio < 10000 then
			need_ratio = true
			player:SetInt("ShiLian_RewardNeedRatio", 1)
		end
	end
	-- +exp
	local record_exp = record_reward_list["Exp"]
	if record_exp and record_exp > 0 then
		if need_ratio then
			record_exp = math.floor(record_exp * reward_ratio / 10000)
		end
		player:AddExp(record_exp, "system", "无尽试炼", "发送记录的奖励")
	end
	-- +pet exp
	local record_pet_exp = record_reward_list["PetExp"]
	if record_pet_exp and record_pet_exp ~= 0 then
		if need_ratio then
			record_pet_exp = math.floor(record_pet_exp * reward_ratio / 10000)
		end
		local pets = Lua_tools.GetFightPets(player)
		for _,pet in ipairs(pets) do
			pet:AddExp(record_pet_exp, "system", "无尽试炼", "发送记录的奖励")
		end
	end
	-- +money
	local record_money_tb = record_reward_list["Money"]
	if record_money_tb and next(record_money_tb) then
		for money_type,money_val in pairs(record_money_tb) do
			if need_ratio then
				money_val = math.floor(money_val * reward_ratio / 10000)
			end
			Lua_tools.AddMoney(player, tonumber(money_type), money_val, "system", "无尽试炼", "发送记录的奖励")
		end
	end
	-- +juju
	local record_juju = record_reward_list["GetJuju"]
	if record_juju and next(record_juju) then
		local data_hasjuju_tb = Data["WuJinShiLian"][player_guid]["HasJuju"]
		for k,_ in pairs(record_juju) do
			if not ShiLian.HasValue(data_hasjuju_tb, k) then
				table.insert(data_hasjuju_tb, k)
			end
		end
		player:SetString("WuJinShiLianHasJuju", Lua_tools.serialize(data_hasjuju_tb))
	end
	-- +物品  record_reward_list["Item"] = {[ItemKeyName] = {[0] = 物品显示序号, [1] = 非绑定物品数量, [2] = 绑定物品数量}}
	local record_item = record_reward_list["Item"]
	if record_item and next(record_item) then
		local mail_item_list = {}
		for k,v in pairs(record_item) do
			local item_id = sItemSystem:GetItemIdByKeyname(k)
			if item_id ~= 0 then
				if v["1"] and v["1"] > 0 then
					table.insert(mail_item_list, k)
					table.insert(mail_item_list, v["1"])
					table.insert(mail_item_list, 0)
				end
				if v["2"] and v["2"] > 0 then
					table.insert(mail_item_list, k)
					table.insert(mail_item_list, v["2"])
					table.insert(mail_item_list, 1)
				end
			end
		end
		-- 因为物品数量不能超堆叠数
		Lua_tools.SendItemMail(player:GetGUID(), {["ItemList"] = mail_item_list}, "无尽试炼", "无尽试炼奖励", "少侠在本次试炼中披荆斩棘，收获颇丰！")
		--sLuaApp:LuaErr("偶现bug mail_item_list "..Lua_tools.serialize(mail_item_list))
		--sMailSystem:SendMail(0, "无尽试炼", player:GetGUID(), 1, "无尽试炼奖励", "少侠在本次试炼中披荆斩棘，收获颇丰！", {}, mail_item_list)
	end
end

function ShiLian.GetShowData(tb)
	local show_tb = {}
	show_tb["Name"] = tb["Name"] or ""
	show_tb["Grade"] = tb["Grade"] or 0
	show_tb["Icon"] = tb["Icon"] or 0
	show_tb["Info"] = tb["Info"] or ""
	return show_tb
end

function ShiLian.HasValue(tb, value)
	for _,v in pairs(tb) do
      if v == value then
          return true
      end
    end
    return false
end

-- 返回随机index_tb --index不重复  -- rand = -1表示附加该index 
ShiLian.RandomTable = {}
ShiLian.RequiredTable = {}
function ShiLian.GetRandIndex(tb_rand,tbname,times,is_cache)
	if type(tb_rand) ~= "table" then		
		return
	end
	if not times or times < 1 then		
		sLuaApp:LuaErr("ShiLian.GetRandIndex  times错误")
		return
	end
	if not is_cache then
		tbname = tbname .."_NotCache"
	end
	--表格存储
	if not ShiLian.RandomTable[tbname] then
		ShiLian.RandomTable[tbname] = {{0,0}} --{index,rand}
		ShiLian.RequiredTable[tbname] = {}
		for k,v in pairs(tb_rand) do
			if v then
				if v.Rand == -1 then
					table.insert(ShiLian.RequiredTable[tbname], k)
				else
					local tb_len = #ShiLian.RandomTable[tbname]
					ShiLian.RandomTable[tbname][tb_len+1] = {k, ShiLian.RandomTable[tbname][tb_len][2] + (v.Rand or 100)}
				end
			end
		end
	end
	--进行随机
	local rander = Lua_tools.DupTable(ShiLian.RandomTable[tbname])
	--sLuaApp:LuaErr("rander"..Lua_tools.serialize(rander))
	local index_tb = Lua_tools.DupTable(ShiLian.RequiredTable[tbname])
	if times > #rander then
		times = #rander
		--sLuaApp:LuaErr("ShiLian.GetRandIndex  times过大 tbname"..tbname)
	end
	times = times - #index_tb
	for s = 1,times do
		local rand = sLuaApp:RandInteger(1,rander[#rander][2])
		for i = 1, #rander-1 do
			if rand <= rander[i+1][2] and rand > rander[i][2] then
				table.insert(index_tb,rander[i+1][1])
				local diff = rander[i+1][2] - rander[i][2]
				table.remove(rander, i+1)
				for j = i+1, #rander do
					rander[j][2] = rander[j][2] - diff
				end
				break
			end
		end
	end
	if not is_cache then
		ShiLian.RandomTable[tbname] = nil
		ShiLian.RequiredTable[tbname] = nil
	end
	return index_tb
end

--奖励配置表转数字
function ShiLian.ConfigToNumber(player, config_num)
	local res_num = 0
	local str_factor = [[
		local Level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local RoundNum = ]].. player:GetInt("WuJinShiLianRoundNum") ..[[
		local Difficulty = ]].. player:GetInt("WuJinShiLianSelectDifficulty") ..[[
	]]
	
	if type(config_num) == "table" then
		local min_num = config_num[1]
		local max_num = config_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	elseif type(config_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. config_num))()
	elseif type(config_num) == "number" then
		res_num = config_num
	end
	return math.floor(res_num)
end

function ShiLian.CheckLevel(player)
	local act_id = sVarSystem:GetInt("ShiLian_ActivityID")
	local act_data = ActivityConfig.GetById(act_id)
	if not act_data then
		sLuaApp:LuaErr("ShiLian.CheckLevel ActivityConfig 不存在 "..act_id)
		return false
	end
	local level_min = act_data.LevelMin
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsgEx(player, "不到"..level_min.."级无法进入无尽的试炼！")
		return false
	end
	return true
end

--秒数转为时分秒
function ShiLian.GetTimeStr(leftTimeNum)

	leftTimeNum = leftTimeNum or 0
    leftTimeNum = math.max(leftTimeNum, 0)
    local day = math.floor(leftTimeNum / 86400)
    local hour = math.floor(leftTimeNum % 86400 / 3600)
    local minute = math.floor(leftTimeNum % 3600 / 60)
    local s = leftTimeNum % 60
    if day > 0 then
        return day .. "天" .. hour .. "小时", day, hour, minute, s
    elseif hour > 0 then
        return hour .. "小时" .. minute .. "分", day, hour, minute, s
    elseif minute > 0 then
        return minute .. "分" .. s .. "秒", day, hour, minute, s
    else
        return s .. "秒", day, hour, minute, s
    end
end

ShiLian.Icon = {
	[1] = "1800408250",
	[2] = "1800408260",
	[4] = "1800408270",
	[5] = "1800408280",
	--["ShiLianMoney"] = "1900910120",
	["Exp"] = "1800408330",
	["PetExp"] = "1800408320",
}

function ShiLian.GetIconMsg(icon_type, val)
	return "#OFFSET<X:0,Y:-8#IMAGE"..(ShiLian.Icon[icon_type] or "1800408250") .."#OFFSETEND>#"..val
end

function ShiLian.ItemKeyToName(item_keyname)
	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not item_data then 
		sLuaApp:LuaErr("ShiLian.ItemKeyToName  ItemConfig 不存在 "..item_keyname)
		return "物品"
	end
	return item_data.Name
end

function ShiLian.smtd(player)
	local player_guid = tostring(player:GetGUID())
	sLuaApp:LuaErr("Data    "..Lua_tools.serialize(Data["WuJinShiLian"][player_guid]))
end

-- 活动开始前回调
function ShiLian.OnDeclare(id, seconds) 
end
-- 活动开始回调
function ShiLian.OnStart(id, is_normal)
	sVarSystem:SetInt("ShiLian_ActivityID", id)
end
-- 活动结束回调
function ShiLian.OnStop(id)
	sVarSystem:SetInt("ShiLian_ActivityID", 0)
end
-- 玩家点击参与活动回调
function ShiLian.OnJoin(id, player)
	if sLuaApp:IsActivityRunning(id) then
		local level_min = ActivityConfig.GetById(id).LevelMin
		if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
			sLuaApp:NotifyTipsMsg(player,"不到"..level_min.."级无法进入无尽的试炼！" )
			return
		end
		
		if not ShiLianConfig then return end
		--判断组队
		if player:GetTeam() then
			sLuaApp:NotifyTipsMsg(player, "无尽试炼为单人活动，无法组队参与！")
			return
		end
		local npc_data = NpcConfig.GetByKeyName(ShiLianConfig.StartNPC)
		if not npc_data then
			sLuaApp:LuaErr("ShiLian.OnJoin  NpcConfig 不存在 "..ShiLianConfig.StartNPC)
			return 
		end
		
		Lua_tools.MoveToNpc(player, npc_data.Id)
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开始！")
	end
end
-- 玩家客户端查询数据回调
function ShiLian.OnQuery(id, player)
	local show_item = ShiLianConfig.ShowItem or "61024,61025"
	local status = player:GetInt("WuJinShiLianStatus")
	local is_joined = 0
	if status == 2 then
		local now_time = sLuaApp:DaySinceEpoch(0)
		local can_start_day = player:GetInt("WuJinShiLianStartTimeDay") + (ShiLianConfig.RefreshTimeDay or 1)
		if can_start_day <= now_time then
			player:SetInt("WuJinShiLianStatus", 0)
		else
			is_joined = 1
		end
	end

	local str = is_joined..":1:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("ShiLian") or "2,3,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end