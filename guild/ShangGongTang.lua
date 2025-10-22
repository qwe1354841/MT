ShangGongTang = {}
--赏功堂
ShangGongTang.AwardPoolNum = {
	[0] = 0,
	[1] = 12,	--赏功堂等级对应的奖池格子数量
	[2] = 24,	
	[3] = 36,
	[4] = 48,
	[5] = 60,
}

ShangGongTang.DefaultConfig = {
	DrawTime = 3,		--默认抽奖次数
	DrawConsume = 300,	--默认消耗战功
	Probability = 5000,	--默认奖池道具数量低于24时的抽奖概率
	MaxRecord = 80,		--默认最大赏功记录条数
	DrawTimeRange = {1, 5}, --设置抽奖次数范围
}

function ShangGongTang.takeRecordData(player, guild, guild_guid)
	Data.SGT = {}
	Data.SGT[guild_guid] = {}
	--sLuaApp:LuaErr("下标自定义变量"..guild:GetInt("SGTStringIndex"))
	--sLuaApp:LuaErr("玩家抽奖剩余次数自定义变量"..player:GetString("Player_DrawTime"))
	if guild:GetInt("SGTIndexTips") ~= 0 then
		--sLuaApp:LuaErr("进入下标下的遍历")
		for i = guild:GetInt("SGTIndexTips"), ShangGongTang.DefaultConfig["MaxRecord"] do
			if guild:GetString("SGTRecordIndex_"..i) ~= "" then
				table.insert(Data.SGT[guild_guid], guild:GetString("SGTRecordIndex_"..i))
			end
		end
		for i = 1, guild:GetInt("SGTIndexTips") do
			if guild:GetString("SGTRecordIndex_"..i) ~= "" then
				table.insert(Data.SGT[guild_guid], guild:GetString("SGTRecordIndex_"..i))
			end
		end
	else
		for i = 1, ShangGongTang.DefaultConfig["MaxRecord"] do
			sLuaApp:LuaErr("循环将guild上的自定义变量赋值给Data"..i)
			if guild:GetString("SGTRecordIndex_"..i) ~= "" then
				table.insert(Data.SGT[guild_guid], guild:GetString("SGTRecordIndex_"..i))
			else
				sLuaApp:LuaErr("没有该自定义变量，SGTRecordIndex_"..i.."  break ")
				break
			end
		end 
	end
end


--获取赏功堂道具列表
function ShangGongTang.GetSGTData(player)
	--sLuaApp:LuaErr("获取赏功堂道具列表")
	--local guild = player:GetGuild()
	local guild = sGuildSystem:GetGuildByPlayer(player)
	if not guild then
		sLuaApp:NotifyTipsMsg(player, "您还没有加入帮派！")
		return
	end
	local str = ""
	local guild_guid = tostring(guild:GetGUID())
	local WingRoomLevel = guild:GetWingRoomLevel()
	local AwardPool_Num = ShangGongTang.AwardPoolNum[WingRoomLevel]
	if not Data.SGT then
		ShangGongTang.takeRecordData(player,guild, guild_guid)
	end
	if guild:GetInt("SGT_DrawTime") == 0 then
		guild:SetInt("SGT_DrawTime", tonumber(Data.SGTDefault["DrawTime"]))
	end
	if guild:GetInt("SGT_DrawConsume") == 0 then
		guild:SetInt("SGT_DrawConsume", tonumber(Data.SGTDefault["DrawConsume"]))
	end
	if player:GetString("Player_DrawTime") == "" then
		player:SetString("Player_DrawTime", tostring(guild:GetInt("SGT_DrawTime")))
	end
	if guild:GetInt("Next_SGT_DrawTime") == 0 then
		guild:SetInt("Next_SGT_DrawTime", tonumber(Data.SGTDefault["DrawTime"]))
	end
	if guild:GetInt("Next_SGT_DrawConsume") == 0 then
		guild:SetInt("Next_SGT_DrawConsume", tonumber(Data.SGTDefault["DrawConsume"]))
	end
	ShangGongTang.RefreshDrawTimeAndConsume(player)
	local RewardItems = ShangGongTang.GetResSGTList(guild:GetRewardItems())
	str = str..[[
		if FactionPrizeUI then
			FactionPrizeUI.PrizePoolMax = ]]..AwardPool_Num..[[
			FactionPrizeUI.PrizePoolItemList = ]]..Lua_tools.serialize(RewardItems)..[[
			FactionPrizeUI.PrizeCostNum = ]]..guild:GetInt("SGT_DrawConsume")..[[
			FactionPrizeUI.TotalTimes = ]]..guild:GetInt("SGT_DrawTime")..[[
			FactionPrizeUI.CurTimes	= ]]..tonumber(player:GetString("Player_DrawTime"))..[[
			FactionPrizeUI.JobType = ]]..tonumber(sGuildSystem:GetGuildJob(player)+1)..[[
	]]
	local job = sGuildSystem:GetGuildJob(player)
    if job == GUILD_JOB_LEADER then
		str = str..[[
			FactionPrizeUI.SetNextWeekTimes = ]]..guild:GetInt("Next_SGT_DrawTime")..[[
			FactionPrizeUI.SetNextWeekCost = ]]..guild:GetInt("Next_SGT_DrawConsume")..[[
		]]
	end
	str = str..[[
			FactionPrizeUI.RefreshData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
end

--处理guild:GetRewardItems()接口返回的表格
function ShangGongTang.GetResSGTList(reward_itemlist)
	local res_list = {}
	for k, v in ipairs(reward_itemlist) do
		local res_data = {guid = tostring(v["guid"]), id = v["id"], num = v["amount"]}
		table.insert(res_list, res_data)
	end
	return res_list
end

--获取赏功堂道具数据
function ShangGongTang.GetSGTItemData(player, item_guid)
	local guild = sGuildSystem:GetGuildByPlayer(player)
	if guild:NotifyRewardItem(player, item_guid) ~= 0 then
		--sLuaApp:LuaErr("赏功堂奖池中没有该道具！")
		return false
	else
		return true
	end
end

--帮主判断
function ShangGongTang.JudgeLeader(player)
	local job = sGuildSystem:GetGuildJob(player)
    if job ~= GUILD_JOB_LEADER then
        sLuaApp:NotifyTipsMsgEx(player, "仅有帮主可操作")
        return false
    end
	return true
end


--设置消耗战功数量
function ShangGongTang.SetDrawConsume(player, val)
	--sLuaApp:LuaErr("设置抽奖消耗战功数量")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local value = tonumber(val)
	--sLuaApp:LuaErr(value)
	if ShangGongTang.JudgeLeader(player) then
		if value == 0 then
			sLuaApp:NotifyTipsMsg(player, "抽奖消耗战功不可设为0，请重新设置")
			return
		end
		if value >= 2100000000 then
			sLuaApp:NotifyTipsMsg(player, "设置的消耗过大，请重新设置")
			return
		end
		if value > 0 then
			guild:SetInt("Next_SGT_DrawConsume", value)
			guild:SetInt("SGTLastSetConsumeWeek", sLuaApp:WeekSinceEpoch(0))
			--guild:SetWeekInt("SGTLastSeConsume", 2)
			sLuaApp:NotifyTipsMsg(player, "修改抽奖所用帮派战功消耗成功！将从下周开始生效")
			local str = [[
				if FactionPrizeUI then
					FactionPrizeUI.SetNextWeekCost = ]]..guild:GetInt("Next_SGT_DrawConsume")..[[
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		else
			sLuaApp:NotifyTipsMsg(player, "抽奖消耗战功不可设为负数，请重新设置")
			return
		end
	end
end


--设置抽奖次数
function ShangGongTang.SetDrawTime(player, val)
	--sLuaApp:LuaErr("设置抽奖次数")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local value = tonumber(val)
	--sLuaApp:LuaErr(val)
	--sLuaApp:LuaErr(value)
	if ShangGongTang.JudgeLeader(player) then
	--sLuaApp:LuaErr("抽奖次数下限:"..ShangGongTang.DefaultConfig["DrawTimeRange"][1].." 抽奖次数上限:"..ShangGongTang.DefaultConfig["DrawTimeRange"][2])
		if value >= tonumber(ShangGongTang.DefaultConfig["DrawTimeRange"][1]) and value <= tonumber(ShangGongTang.DefaultConfig["DrawTimeRange"][2]) then
			guild:SetInt("SGTLastSetTimeWeek", sLuaApp:WeekSinceEpoch(0))
			guild:SetInt("Next_SGT_DrawTime", value)
			--guild:SetWeekInt("SGTLastSetTime", 2)
			sLuaApp:NotifyTipsMsg(player, "修改抽奖次数成功！将从下周开始生效")
			local str = [[
				if FactionPrizeUI then
					FactionPrizeUI.SetNextWeekTimes = ]]..guild:GetInt("Next_SGT_DrawTime")..[[
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		else
			sLuaApp:NotifyTipsMsg(player, "抽奖次数需设置在"..ShangGongTang.DefaultConfig["DrawTimeRange"][1].."~".. ShangGongTang.DefaultConfig["DrawTimeRange"][2].."之内，请重新设置")
			return
		end
	end
end

--刷新抽奖次数与消耗
function ShangGongTang.RefreshDrawTimeAndConsume(player)
	--sLuaApp:LuaErr("刷新抽奖次数与消耗")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	if sLuaApp:WeekSinceEpoch(0) ~= guild:GetInt("SGTLastSetTimeWeek") then 
		--sLuaApp:LuaErr("更新抽奖次数")
		guild:SetInt("SGT_DrawTime", guild:GetInt("Next_SGT_DrawTime"))
	end
	if sLuaApp:WeekSinceEpoch(0) ~= guild:GetInt("SGTLastSetConsumeWeek") then 
		--sLuaApp:LuaErr("刷新抽奖消耗")
		guild:SetInt("SGT_DrawConsum", guild:GetInt("Next_SGT_DrawConsume"))
	end
	if sLuaApp:WeekSinceEpoch(0) ~= player:GetInt("LastJackPotWeek") then
		--sLuaApp:LuaErr("刷新抽奖次数")
		player:SetString("Player_DrawTime", tostring(guild:GetInt("SGT_DrawTime")))
	end
end

--赏功堂抽奖
function ShangGongTang.JackPot(player)
	--sLuaApp:LuaErr("赏功堂抽奖")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	--local guild = player:GetGuild()
	local FightScorNum = player:GetGuildFightScore()
	if guild:GetInt("SGT_DrawTime") == 0 then
		guild:SetInt("SGT_DrawTime", tonumber(Data.SGTDefault["DrawTime"]))
	end
	if player:GetString("Player_DrawTime") == "" then
		player:SetString("Player_DrawTime", tostring(guild:GetInt("SGT_DrawTime")))
	end
	-- player:SubGuildFightScore() --扣除玩家帮派战功
	--sLuaApp:LuaErr("玩家帮派战功的值："..player:GetGuildFightScore()) --获取玩家帮派战功
	if tonumber(player:GetString("Player_DrawTime")) > 0 then
		if guild:GetInt("SGT_DrawConsume") == 0 then
			guild:SetInt("SGT_DrawConsume", Data.SGTDefault["DrawConsume"]) 
		end
		local rewardItems = guild:GetRewardItems()
		local long = #rewardItems
		if long > 0 then
			if player:GetGuildFightScore() >= guild:GetInt("SGT_DrawConsume") then
				local residue_time = tonumber(player:GetString("Player_DrawTime")) - 1
				player:SetString("Player_DrawTime", tostring(residue_time))
				if long < 24 then
					local success = sLuaApp:RandInteger(1, 10000)		--记得改回来
					if success <= Data.SGTDefault["Probability"] then
						ShangGongTang.GiveSGTAward(player, guild, long)
					else
						if player:SubGuildFightScore(guild:GetInt("SGT_DrawConsume"), "system", "赏功堂抽奖", "赏功堂抽奖扣除帮派战功") then
							sLuaApp:NotifyTipsMsg(player, "很遗憾，这次没有抽到奖品")
						else
							sLuaApp:NotifyTipsMsg(player, "扣除战功失败")
						end
					end
				else
					ShangGongTang.GiveSGTAward(player, guild, long)
				end
			else
				sLuaApp:NotifyTipsMsg(player, "抽奖所需战功不足")
			end
		else
			sLuaApp:NotifyTipsMsg(player, "当前奖池中道具数量为空，请等待帮主放入或帮战奖励")
		end
	else
		sLuaApp:NotifyTipsMsg(player, "您本周的抽奖次数已用完，请下周再来吧")
	end
	
	local nowRewardItems = ShangGongTang.GetResSGTList(guild:GetRewardItems())
	local str = [[
		if FactionPrizeUI then
			FactionPrizeUI.PrizePoolItemList = ]]..Lua_tools.serialize(nowRewardItems)..[[
			FactionPrizeUI.CurTimes	= ]]..tonumber(player:GetString("Player_DrawTime"))..[[
			FactionPrizeUI.RefreshPrizeTimeLeft()
			FactionPrizeUI.RefreshPrizePoolData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)	
end

function ShangGongTang.GiveSGTAward(player, guild, long)
	local index = sLuaApp:RandInteger(1, long)
	local rewardItems = guild:GetRewardItems()
	local item_guid = tonumber(rewardItems[index]["guid"])
	--sLuaApp:LuaErr("抽到的道具guid"..item_guid)
	if Lua_tools.GetBagFree(player) > 0 then
		if guild:GetRewardItem(player, item_guid) ~= 0 then
			if Lua_tools.GetGemBagFree(player) > 0 then
				sLuaApp:NotifyTipsMsg(player, "发放道具失败")
				return false
			else
				sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足")
				return false
			end
		else
			if player:SubGuildFightScore(guild:GetInt("SGT_DrawConsume"), "system", "赏功堂抽奖", "赏功堂抽奖扣除帮派战功") then
				--sLuaApp:LuaErr("GetRewardItem返回值"..resnum)
				--sLuaApp:LuaErr("抽奖之后道具的guid"..item_guid)
				ShangGongTang.SGTRecord(player, item_guid)
				player:SetInt("LastJackPotWeek", sLuaApp:WeekSinceEpoch(0))
				return true
			else
				sLuaApp:NotifyTipsMsg(player, "扣除战功失败")
				return false
			end
		end
	else
		sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足")
		return false
	end
end

--帮主将道具移入赏功堂奖池
function ShangGongTang.PutInAwardPool(player, item_guid, item_num)
	--sLuaApp:LuaErr("帮主将道具移入赏功堂奖池")
	local item = sItemSystem:GetItemByGUID(item_guid)
	--sLuaApp:LuaErr(item_guid)
	if item:IsBound() then
		sLuaApp:NotifyTipsMsg(player, "绑定物品不能放入赏功堂奖池")
		return
	end
	--sLuaApp:LuaErr(item:GetKeyName())
	local guild = sGuildSystem:GetGuildByPlayer(player)
	if ShangGongTang.JudgeLeader(player) then
		if player:GetMap():GetKeyName() == "帮派地图" then
			--sLuaApp:LuaErr(player:GetMap():GetKeyName())
			local AwardPool_Num = ShangGongTang.AwardPoolNum[guild:GetWingRoomLevel()]
			for i = 1 , item_num do 
				local rewardItems = guild:GetRewardItems()
				if #rewardItems < AwardPool_Num then
					--sLuaApp:LuaErr("进入循环放入道具")
					local itemList = {item:GetKeyName(), 1}
					--sLuaApp:LuaErr(itemList[1])
					local item_i = sItemSystem:CreateItem(item:GetId(), 1, item:IsBound())
					--sLuaApp:LuaErr(item_i:GetId())
					if Lua_tools.SubItem(player, itemList, "system", "放入赏功堂", "放入赏功堂后销毁物品") then
						if guild:PutRewardItem(item_i) ~= 0 then
							local ItemContainer = player:GetItemContainer(1)
							sLuaApp:NotifyTipsMsg(player, "道具放入赏功堂奖池失败")
						else
							--sLuaApp:NotifyTipsMsg(player, "放入道具成功")
						end
					else
						sLuaApp:NotifyTipsMsg(player, "放入失败")
					end
				else
					sLuaApp:NotifyTipsMsg(player, "赏功堂奖池已经放满啦")
					break
				end
			end
			--ShangGongTang.GetSGTData(player)
			local RewardItems = ShangGongTang.GetResSGTList(guild:GetRewardItems())
			
			local str = [[
				if FactionPrizeUI then
					FactionPrizeUI.PrizePoolItemList = ]]..Lua_tools.serialize(RewardItems)..[[
					FactionPrizeUI.RefreshPrizePoolData()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

--帮主从赏功堂奖池中取出道具
function ShangGongTang.GetOutAwardPool(player, item_guid)
	--sLuaApp:LuaErr("帮主从赏功堂奖池中取出道具")
	if ShangGongTang.JudgeLeader(player) then
		local guild = sGuildSystem:GetGuildByPlayer(player)
		--sLuaApp:LuaErr("item_guid"..item_guid)	
		if Lua_tools.GetBagFree(player) > 0 then
			if guild:GetRewardItem(player, item_guid) ~= 0 then
				if Lua_tools.GetGemBagFree(player) > 0 then
					sLuaApp:NotifyTipsMsg(player, "取出道具失败")
					return
				else
					sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足")
					return
				end
			else
				local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
				local itemKey = item:GetKeyName()
				--sLuaApp:LuaErr(itemKey)
				local RewardItems = ShangGongTang.GetResSGTList(guild:GetRewardItems())
				local str = [[
					if FactionPrizeUI then
						FactionPrizeUI.PrizePoolItemList = ]]..Lua_tools.serialize(RewardItems)..[[
						FactionPrizeUI.RefreshPrizePoolData()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			end
		else
			sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足")
			return
		end
	end
end

--FactionPrizeUI.RecordList = {{time="2020-02-12", jobType=Mathf.Random(1,9), name="山东省", awardType=Mathf.Random(1,2), awardID=50000+Mathf.Random(1,52)},{xxx},}
--FactionPrizeUI.RefreshRecordData() --记录界面刷新接口
--查询赏功记录
function ShangGongTang.GetSGTRecord(player, startPos, endPos, version)
	--sLuaApp:LuaErr("查询赏功记录")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local guild_guid = tostring(guild:GetGUID())
	--sLuaApp:LuaErr("本地记录的版本号："..guild:GetInt("SGTVersion"))
	--sLuaApp:LuaErr("startPos"..startPos.."  endPos"..endPos.."  version"..version)
	if version ~= guild:GetInt("SGTVersion") then 
	sLuaApp:LuaErr("版本号不同")
		local str = [[
			if FactionPrizeUI then
				FactionPrizeUI.RecordTempCache = nil
				FactionPrizeUI.RefreshParseSomeRecords()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	local str = [[
		if FactionPrizeUI then
			FactionPrizeUI.RecordTempCache = {}
		]]
	local index_k = 1
	for i = endPos, startPos, -1 do
		for k, v in ipairs(Data.SGT[guild_guid]) do
			--sLuaApp:LuaErr("循环遍历")
			local temporary_table =  sLuaApp:StrSplit(v, ",")
			--sLuaApp:LuaErr(temporary_table[1].." 2号元素"..temporary_table[2].."  index"..index_k)
			if temporary_table[1] == tostring(i) then
				str = str..
					--FactionPrizeUI.RecordTempCache[]]..index_k..[[]= ]]..Lua_tools.serialize(v)..[[]]
				--	sLuaApp:LuaErr(v)
					[[
					FactionPrizeUI.RecordTempCache[]]..index_k..[[]= "]]..v..[["]]
				index_k = index_k + 1
			end
		end
	end
	str = str..[[
			FactionPrizeUI.RefreshParseSomeRecords()
		end
	]]
	--sLuaApp:LuaErr(str)
	
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--记录抽奖数据
function ShangGongTang.SGTRecord(player, item_guid)
	--sLuaApp:LuaErr("记录下抽奖的数据")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local guild_guid = tostring(guild:GetGUID())
	local item = sItemSystem:GetItemByGUID(item_guid)
	--sLuaApp:LuaErr(item_guid)
	guild:SetInt("SGTRecordIndex", guild:GetInt("SGTRecordIndex")+1)
	sLuaApp:LuaErr("赏功记录数据中的index"..guild:GetInt("SGTRecordIndex"))
	if guild:GetInt("SGTRecordIndex") > 1000*10000 then
		guild:SetInt("SGTVersion", guild:GetInt("SGTVersion")+1)
		guild:SetInt("SGTRecordIndex", 1)
	end
	--local record = {index = "guild:GetInt("SGTRecordIndex"), time = sLuaApp:StrSplit(sLuaApp:DateTime2Str(sLuaApp:GetTimes()) , " ")[1], jobType = sGuildSystem:GetGuildJob(player)+1, name = player:GetName(), awardType = 1, awardID = item:GetId(),}
	local index = tostring(guild:GetInt("SGTRecordIndex"))
	local time = tostring(sLuaApp:StrSplit(sLuaApp:DateTime2Str(sLuaApp:GetTimes()) , " ")[1])
	local jobType = tostring(sGuildSystem:GetGuildJob(player)+1)
	local awardType = tostring(1)
	local awardID = tostring(item:GetId())
	local name = tostring(player:GetName())
	
	local recordString = index..","..time..","..jobType..","..awardType..","..awardID..","..name
	
	guild:SetInt("SGTStringIndex", guild:GetInt("SGTStringIndex")+1)
	if guild:GetInt("SGTStringIndex") > ShangGongTang.DefaultConfig["MaxRecord"] then
		guild:SetInt("SGTStringIndex", 1)
		guild:SetInt("SGTIndexTips", 2)
	end
	if guild:GetInt("SGTIndexTips") ~= 0 then
		guild:SetInt("SGTIndexTips", guild:GetInt("SGTIndexTips")+1)
		if guild:GetInt("SGTIndexTips") > ShangGongTang.DefaultConfig["MaxRecord"] then
			guild:SetInt("SGTIndexTips", 1)
		end
	end
	guild:SetString("SGTRecordIndex_"..guild:GetInt("SGTStringIndex"), recordString)
	--sLuaApp:LuaErr("type："..type(guild:GetString("SGTRecordIndex_"..guild:GetInt("SGTStringIndex"))))
	--sLuaApp:LuaErr(recordString)
	--sLuaApp:LuaErr("SGTRecordIndex_"..guild:GetInt("SGTStringIndex")..":"..guild:GetString("SGTRecordIndex_"..guild:GetInt("SGTStringIndex")))
	if not Data.SGT[guild_guid] then
		Data.SGT[guild_guid]  = {}
	end
	--sLuaApp:LuaErr("放入数据到Data.SGT[guild_guid]")
	table.insert(Data.SGT[guild_guid], recordString)
	--sLuaApp:LuaErr(#Data.SGT[guild_guid])
	if #Data.SGT[guild_guid] > ShangGongTang.DefaultConfig["MaxRecord"] then
		sLuaApp:LuaErr("超出上限，删除第一条数据")
		table.remove(Data.SGT[guild_guid], 1)
	end
end

--发送赏功记录msg
function ShangGongTang.GetSGTRecordMsg(player)
	--sLuaApp:LuaErr("发送赏功记录msg")
	local guild = sGuildSystem:GetGuildByPlayer(player)
	local guild_guid = tostring(guild:GetGUID())
	if not Data.SGT[guild_guid] then
		Data.SGT[guild_guid] = {}
	end
	if not Data.SGT[guild_guid][1] then
		sLuaApp:NotifyTipsMsg(player, "目前还没有玩家抽奖记录")
		return
	end
	local MinPos = sLuaApp:StrSplit(Data.SGT[guild_guid][1], ",")[1]
	local MaxPos = sLuaApp:StrSplit(Data.SGT[guild_guid][#Data.SGT[guild_guid]], ",")[1]
	
	sLuaApp:LuaErr(MinPos.."  "..MaxPos)
	local str = [[
		if FactionPrizeUI then
			FactionPrizeUI.RecordTotalNum = ]]..#Data.SGT[guild_guid]..[[
			FactionPrizeUI.RecordMinPos = ]]..MinPos..[[
			FactionPrizeUI.RecordMaxPos = ]]..MaxPos..[[
			FactionPrizeUI.RecordVersion = ]]..guild:GetInt("SGTVersion")..[[
			FactionPrizeUI.RefreshRecordTotalInfo()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--判断包裹是否空闲
function ShangGongTang.BagFree(player, itemData)
	--sLuaApp:LuaErr("判断包裹")
	if itemData.Type == 3 and itemData.Subtype == 9 then
		if Lua_tools.GetGemBagFree(player) > 0 then
			return true
		else
			sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足")
			return false
		end
	else
		if Lua_tools.GetBagFree(player) > 0 then
			return true
		else
			sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足")
			return false
		end
	end
end

--初始化
function ShangGongTang.Initialization()
	if not ShangGongTang.DefaultConfig then
		sLuaApp:LuaErr("赏功堂缺少DefaultConfig")
	end
	if Data then
		if not Data.SGTDefault then
			Data.SGTDefault = ShangGongTang.DefaultConfig
		end
	else
		sLuaApp:LuaErr("缺少Data")
	end
	--print("完成初始化")
end

--ShangGongTang.Initialization()


