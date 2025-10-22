--宝石镶嵌/装备强化等级奖励

AttributeEnhance = {}

AttributeEnhance.TypeEquipConfig = {
	0,					--武器
	1,					--帽子
	2,					--衣服
    3,            		--腰带
    4,             		--鞋子
    5,             		--护腕
    6,            		--戒指
    7,            		--项链	
	8,					--挂坠
}

--现在StarEquipConfig与StarGemConfig的称号配置支持配置多个称号，但是若要配置多个称号需要将下一等级的称号配在最后以方便显示
--	例：
--	AttributeEnhance.StarEquipConfig = {
--		{equiplevel =  4, titleid = 101, EffectId = 100},
--		{equiplevel =  8, titleid = {101, 102}, EffectId = 101},
--		{equiplevel = 12, titleid = {101, 102, 103}, EffectId = 102},
--		{equiplevel = 16, titleid = {101, 102, 103, 104}, EffectId = 103},
--		{equiplevel = 20, titleid = {101, 102, 103, 104, 105}, EffectId = 104},
--	}
--  AttributeEnhance.StarGemConfig = {
--  	{gemlevel =  3, titleid = 151, EffectId = 200},
--  	{gemlevel =  5, titleid = {151, 152}, EffectId = 201},
--  	{gemlevel =  7, titleid = {151, 152, 153}, EffectId = 202},
--  	{gemlevel =  9, titleid = {151, 152, 153, 154}, EffectId = 203},
--  	{gemlevel = 10, titleid = {151, 152, 153, 154, 155}, EffectId = 204},
--  }
AttributeEnhance.StarEquipConfig = {
	{equiplevel =  4, titleid = 101, EffectId = 100},
	{equiplevel =  8, titleid = 102, EffectId = 101},
	{equiplevel = 12, titleid = 103, EffectId = 102},
	{equiplevel = 16, titleid = 104, EffectId = 103},
	{equiplevel = 20, titleid = 105, EffectId = 104},

}

AttributeEnhance.StarGemConfig = {
	{gemlevel =  3, titleid = 151, EffectId = 200},
	{gemlevel =  5, titleid = 152, EffectId = 201},
	{gemlevel =  7, titleid = 153, EffectId = 202},
	{gemlevel =  9, titleid = 154, EffectId = 203},
	{gemlevel = 10, titleid = 155, EffectId = 204},
}

function AttributeEnhance.DataInit()
	local gemRewardTb = {}
	gemRewardTb.EquipType = AttributeEnhance.TypeEquipConfig
	gemRewardTb.GemConfig = AttributeEnhance.StarGemConfig
	gemRewardTb.EquipConfig = AttributeEnhance.StarEquipConfig
	return gemRewardTb
end

function AttributeEnhance.player_on_login(player)
	AttributeEnhance.Equip_Strengthen_level(player)
end

function AttributeEnhance.GetData(player)
	local gemRewardTb = AttributeEnhance.DataInit()
	local equip_streng = 0
	local gem_streng = 0
	
	local gem_present_award_level = player:GetInt("attribute_gem_index")
	--sLuaApp:LuaDbg("============gem_present_award_level = "..gem_present_award_level)
	local gem_present_titleid = 0
	local gem_next_award_level = 0
	local gem_next_titleid = 0
	local gem_next_streng = 0
	
	if gem_present_award_level ~= 0 then  
		local now_titleid = gemRewardTb.GemConfig[gem_present_award_level].titleid
		if type(now_titleid) == "table" then
			gem_present_titleid = now_titleid[#now_titleid]
		elseif type(now_titleid) == "number" then
			gem_present_titleid = now_titleid
		else
			sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错81")
		end

		gem_streng = gemRewardTb.GemConfig[gem_present_award_level].gemlevel
	end
	if gem_streng < gemRewardTb.GemConfig[#gemRewardTb.GemConfig].gemlevel then
		gem_next_award_level = gem_present_award_level+1
		local next_titleid = gemRewardTb.GemConfig[gem_next_award_level].titleid
		if type(next_titleid) == "table" then
			gem_next_titleid = next_titleid[#next_titleid]
		elseif type(next_titleid) == "number" then
			gem_next_titleid = next_titleid
		else
			sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错94")
		end
		gem_next_streng = gemRewardTb.GemConfig[gem_next_award_level].gemlevel
	end

	local equip_present_award_level = player:GetInt("attribute_equip_index")
	--sLuaApp:LuaDbg("============equip_present_award_level = "..equip_present_award_level)
	local equip_present_titleid = 0
	local equip_next_award_level = 0
	local equip_next_titleid = 0
	local equip_next_streng = 0
	
	if equip_present_award_level ~= 0 then 
		equip_streng = gemRewardTb.EquipConfig[equip_present_award_level].equiplevel
		local now_titleid = gemRewardTb.EquipConfig[equip_present_award_level].titleid
		if type(now_titleid) == "table" then
			equip_present_titleid = now_titleid[#now_titleid]
		elseif type(now_titleid) == "number" then
			equip_present_titleid = now_titleid
		else
			sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错 114")
		end
		--equip_present_titleid = gemRewardTb.EquipConfig[equip_present_award_level].titleid
	end
	
	if equip_streng < gemRewardTb.EquipConfig[#gemRewardTb.EquipConfig].equiplevel then
		equip_next_award_level = equip_present_award_level+1
		local next_titleid = gemRewardTb.EquipConfig[equip_next_award_level].titleid
		if type(next_titleid) == "table" then
			equip_next_titleid = next_titleid[#next_titleid]
		elseif type(next_titleid) == "number" then
			equip_next_titleid = next_titleid
		else
			sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错 127")
		end
		--equip_next_titleid = gemRewardTb.EquipConfig[equip_present_award_level+1].titleid
		equip_next_streng = gemRewardTb.EquipConfig[equip_present_award_level+1].equiplevel
	end
	--sLuaApp:LuaDbg("gem_present_award_level:"..gem_present_award_level)
	local str = [[
		if EquipRewardUI then 
			EquipRewardUI.gem_streng = ]] .. gem_streng .. [[
			EquipRewardUI.gem_present_award_level = ]] .. gem_present_award_level .. [[
			EquipRewardUI.gem_present_titleid = ]] .. gem_present_titleid .. [[
			EquipRewardUI.gem_next_award_level = ]] .. gem_next_award_level .. [[
			EquipRewardUI.gem_next_titleid = ]] .. gem_next_titleid .. [[
			EquipRewardUI.gem_next_streng = ]] .. gem_next_streng .. [[
			EquipRewardUI.EnoughGemCount = ]]..player:GetInt("EnoughGemCount")..[[
			EquipRewardUI.equip_streng = ]] .. equip_streng .. [[
			EquipRewardUI.equip_present_award_level = ]] .. equip_present_award_level .. [[
			EquipRewardUI.equip_present_titleid = ]] .. equip_present_titleid .. [[
			EquipRewardUI.equip_next_award_level = ]] .. equip_next_award_level .. [[
			EquipRewardUI.equip_next_titleid = ]] .. equip_next_titleid .. [[
			EquipRewardUI.equip_next_streng = ]] .. equip_next_streng .. [[
			EquipRewardUI.EnoughEquipCount = ]]..player:GetInt("EnoughEquipCount")..[[
			EquipRewardUI.Refresh()
		end 
		if BagUI then
			BagUI.RewardBtnValueRefresh()
		end
	]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--宝石奖励等级
function AttributeEnhance.Gem_Strengthen_level(player)
	if player:GetType() ~= GUID_PLAYER then return end
	local gemRewardTb = AttributeEnhance.DataInit()
	local titleList = sTitleSystem:GetTitleList(player)
	local itemcon = player:GetItemContainer(5)
	local streng = gemRewardTb.GemConfig[#gemRewardTb.GemConfig].gemlevel + 10
	local change = 0
	local lastGemIndex = player:GetInt("attribute_gem_index")
	if itemcon:GetContainerType() ~= ITEM_CONTAINER_EQUIP then
		return ""
	end
	local gem_level_list = {}
	for i = 1, #gemRewardTb.EquipType do 
		local equip = itemcon:GetItemBySite(gemRewardTb.EquipType[i])
		if equip ~= nil then
			gem_level_list[i] = {}
			for j = 1, 3 do
				local gem_id = equip:GetInt("ITEM_GemId_"..j)
				if gem_id ~= 0 then
					local gem_level = ItemConfig.GetById(gem_id).Itemlevel
					table.insert(gem_level_list[i], gem_level)
					if gem_level < streng then
						streng = gem_level
					end
				else
					streng = 0
				end
			end
		else
			streng = 0
		end
	end
	if gemRewardTb.GemConfig[1].gemlevel > streng then 
		if #titleList ~= 0 then 
			for a = 1, #titleList do 
				for i = 1, #gemRewardTb.GemConfig do 
					local titleid = gemRewardTb.GemConfig[i].titleid
					if type(titleid) == "table" then
						for k, v in ipairs(titleid) do
							if v == titleList[a] then
								sTitleSystem:DelTitle(player,titleList[a])
								change = change + 1
							end
						end
					elseif type(titleid) == "number" then
						if titleid == titleList[a] then
							sTitleSystem:DelTitle(player,titleList[a])
							change = change + 1
						end
					else
						sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错 210")
					end
				end
			end
		end
		player:SetInt("attribute_gem_index",0)
	else
		for i = 1, #gemRewardTb.GemConfig do 
			if gemRewardTb.GemConfig[i].gemlevel <= streng then 
				if not gemRewardTb.GemConfig[i+1] or streng < gemRewardTb.GemConfig[i+1].gemlevel then
					if i ~= player:GetInt("attribute_gem_index") then
						if #titleList ~= 0 then 
							for a = 1, #titleList do 
								for b = 1, #gemRewardTb.GemConfig do 
									local titleid = gemRewardTb.GemConfig[b].titleid 
									if type(titleid) == "table" then
										for k,v in ipairs (titleid) do
											if v == titleList[a] then
												sTitleSystem:DelTitle(player,titleList[a])
												change = change + 1
											end
										end
									elseif type(titleid) == "number" then
										if titleid == titleList[a] then
											sTitleSystem:DelTitle(player,titleList[a])
											change = change + 1
										end
									else
										sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错 239")
									end
								end
							end
						end
						player:SetInt("attribute_gem_index",i)
						local titleid = gemRewardTb.GemConfig[i].titleid
						if type(titleid) == "table" then
							for k, v in ipairs(titleid) do
								sTitleSystem:AddTitle(player,v)
							end
						elseif type(titleid) == "number" then
							sTitleSystem:AddTitle(player,titleid)
						else
							sLuaApp:LuaErr("gemRewardTb.GemConfig 配置出错 253")
						end
						change = change + 1
					end
				end
			end
		end
	end
	local count = 0 
	for k, v in pairs(gem_level_list) do
		--sLuaApp:LuaDbg("k:"..k)
		for m, n in pairs(v) do
			if player:GetInt("attribute_gem_index") + 1 <= #gemRewardTb.GemConfig then
				if n ~= 0 and n >= gemRewardTb.GemConfig[player:GetInt("attribute_gem_index") + 1]["gemlevel"] then
					count = count + 1
				end
			else
				count = 27
			end
		end
	end
	
	if lastGemIndex ~= player:GetInt("attribute_gem_index") then
		--sLuaApp:LuaDbg("发生改变")
		if player:GetInt("attribute_gem_index") == 0 then
			player:SetInt("GemRewardLevel", 0)
		else
			player:SetInt("GemRewardLevel", gemRewardTb.GemConfig[player:GetInt("attribute_gem_index")].gemlevel)
		end
	end
	player:SetInt("EnoughGemCount", count)
	AttributeEnhance.GetData(player)
end

--GM设置装备奖励等级
function AttributeEnhance.SetEquipRewardLv(player, lv)
	local gemRewardTb = AttributeEnhance.DataInit()
	sLuaApp:LuaDbg("SetEquipRewardLv:"..lv)
	if lv <= #AttributeEnhance.StarEquipConfig then
		if lv ~= player:GetInt("attribute_equip_index") and lv >= 0 then
			sLuaApp:LuaDbg("设置装备奖励等级")
			player:SetInt("attribute_equip_index", lv)
			if lv == 0 then
				player:SetInt("EquipRewardLevel", 0)
			else
				sLuaApp:LuaDbg("equiplevel:"..gemRewardTb.EquipConfig[lv].equiplevel)
				player:SetInt("EquipRewardLevel", gemRewardTb.EquipConfig[lv].equiplevel)
			end
			sLuaApp:NotifyTipsMsg(player, "设置装备奖励等级为"..lv)
			return true
		else
			sLuaApp:LuaDbg("装备强化奖励等级没有变化")
			sLuaApp:NotifyTipsMsg(player, "装备强化奖励等级没有变化")
			return false
		end
	else
		sLuaApp:LuaDbg("超出装备强化奖励等级配置")
		sLuaApp:NotifyTipsMsg(player, "超出装备强化奖励等级配置")
		return false
	end
end

--GM设置宝石奖励等级
function AttributeEnhance.SetGemRewardLv(player, lv)
	local gemRewardTb = AttributeEnhance.DataInit()
	--sLuaApp:LuaDbg("SetGemRewardLv:"..lv)
	if lv <= #AttributeEnhance.StarGemConfig then
		--sLuaApp:LuaDbg("attribute_gem_index"..player:GetInt("attribute_gem_index"))
		if lv ~= player:GetInt("attribute_gem_index") and lv >= 0 then
			--sLuaApp:LuaDbg("设置宝石奖励等级")
			player:SetInt("attribute_gem_index", lv)
			if lv == 0 then
				player:SetInt("GemRewardLevel", 0)
			else
				--sLuaApp:LuaDbg("equiplevel:"..gemRewardTb.GemConfig[lv].gemlevel)
				player:SetInt("GemRewardLevel", gemRewardTb.GemConfig[lv].gemlevel)
			end
			sLuaApp:NotifyTipsMsg(player, "设置宝石奖励等级为"..lv)
			return true
		else
			--sLuaApp:LuaDbg("宝石奖励等级没有变化")
			sLuaApp:NotifyTipsMsg(player, "宝石奖励等级没有变化")
			return false
		end
	else
		--sLuaApp:LuaDbg("超出宝石奖励等级配置")
		sLuaApp:NotifyTipsMsg(player, "超出宝石奖励等级配置")
		return false
	end
end

--装备强化奖励等级
function AttributeEnhance.Equip_Strengthen_level(player)
	if player:GetType() ~= GUID_PLAYER then return end
	local gemRewardTb = AttributeEnhance.DataInit()
	local titleList = sTitleSystem:GetTitleList(player)
	local itemcon = player:GetItemContainer(5)
	local lastEquipIndex = player:GetInt("attribute_equip_index")
	local streng = gemRewardTb.EquipConfig[#gemRewardTb.EquipConfig].equiplevel + 10
	local change = 0
	local equip_level_list = {}
	for i = 1, #gemRewardTb.EquipType do 
		local item = itemcon:GetItemBySite(gemRewardTb.EquipType[i])
		if item ~= "" and item ~= nil then 
			local eq_lv = item:GetInt("EQUIP_IntensifyLevel")
			equip_level_list[i] = eq_lv
			if eq_lv < streng then
				streng = eq_lv
			end
		else
			streng = 0
		end
	end
	if streng < gemRewardTb.EquipConfig[1].equiplevel then 
		if #titleList ~= 0 then 
			for a = 1, #titleList do 
				for i = 1, #gemRewardTb.EquipConfig do 
					local titleid = gemRewardTb.EquipConfig[i].titleid
					if type(titleid) == "table" then
						for k, v in ipairs(titleid) do
							if v == titleList[a] then
								sTitleSystem:DelTitle(player,titleList[a])
								change = change + 1
							end
						end
					elseif type(titleid) == "number" then
						if titleid == titleList[a] then
							sTitleSystem:DelTitle(player,titleList[a])
							change = change + 1
						end
					else
						sLuaApp:LuaErr("gemRewardTb.EquipConfig 配置出错 383")
					end
					--if gemRewardTb.EquipConfig[i].titleid == titleList[a] then
					--	sTitleSystem:DelTitle(player,titleList[a])
					--	change = change + 1
					--end
				end
			end
		end 
		player:SetInt("attribute_equip_index",0)
	else
		for i = 1, #gemRewardTb.EquipConfig do 
			if gemRewardTb.EquipConfig[i].equiplevel <= streng then
				if not gemRewardTb.EquipConfig[i+1] or streng < gemRewardTb.EquipConfig[i+1].equiplevel then
					if i ~= player:GetInt("attribute_equip_index") then
						if #titleList ~= 0 then 
							for a = 1, #titleList do 
								for b = 1, #gemRewardTb.EquipConfig do 
									local titleid = gemRewardTb.EquipConfig[b].titleid
									if type(titleid) == "table" then
										for k,v in ipairs(titleid) do
											if v == titleList[a] then
												sTitleSystem:DelTitle(player,titleList[a])
												change = change + 1
											end
										end
									elseif type(titleid) == "number" then
										if titleid == titleList[a] then
											sTitleSystem:DelTitle(player,titleList[a])
											change = change + 1
										end
									else
										sLuaApp:LuaErr("gemRewardTb.EquipConfig 配置出错 415")
									end
								
									--if gemRewardTb.EquipConfig[b].titleid == titleList[a] then
									--	sTitleSystem:DelTitle(player,titleList[a])
									--	change = change + 1
									--end
								end
							end
						end
						player:SetInt("attribute_equip_index",i)
						local titleid = gemRewardTb.EquipConfig[i].titleid
						sLuaApp:LuaDbg("type 428:"..type(titleid))
						if type(titleid) == "table" then
							for k, v in ipairs(titleid) do
								sTitleSystem:AddTitle(player,v)
							end
						elseif type(titleid) == "number" then
							sTitleSystem:AddTitle(player,titleid)
						else
							sLuaApp:LuaErr("gemRewardTb.EquipConfig 配置出错 435")
						end
						
						--sTitleSystem:AddTitle(player,gemRewardTb.EquipConfig[i].titleid)
						change = change + 1
					end
				end
			end
		end
	end
	--sLuaApp:LuaDbg("streng:"..streng)
	--sLuaApp:LuaDbg("attribute_equip_index:"..player:GetInt("attribute_equip_index"))
	
	local count = 0 
	for k, v in pairs(equip_level_list) do
		--sLuaApp:LuaDbg("k:"..k.."  v:"..v)
		if player:GetInt("attribute_equip_index") + 1 <= #gemRewardTb.EquipConfig then
			if v ~= 0 and v >= gemRewardTb.EquipConfig[player:GetInt("attribute_equip_index") + 1]["equiplevel"] then
				count = count + 1
			end
		else
			count = 9
		end
	end
	
	--sLuaApp:LuaDbg("count:"..count)
	--sLuaApp:LuaDbg("lastEquipIndex:"..lastEquipIndex.."  attribute_equip_index:"..player:GetInt("attribute_equip_index"))
	if lastEquipIndex ~= player:GetInt("attribute_equip_index") then
		--sLuaApp:LuaDbg("发生改变")
		if player:GetInt("attribute_equip_index") == 0 then
			player:SetInt("EquipRewardLevel", 0)
		else
			player:SetInt("EquipRewardLevel", gemRewardTb.EquipConfig[player:GetInt("attribute_equip_index")].equiplevel)
		end
	end
	player:SetInt("EnoughEquipCount", count)
	--sLuaApp:LuaDbg("EquipRewardLevel:"..player:GetInt("EquipRewardLevel"))
	AttributeEnhance.Gem_Strengthen_level(player)
end
