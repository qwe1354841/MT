GuildGuardian = {}
--

GuildGuardian.Config = {
	[1] = {
		Name = "大成守护",
		--Exchange 中 Attr 和 Val 对应要换货币的类型和值      AllPoint 表示玩家最多可拥有的点数
		Exchange = {Attr_1 = 356, Val_1 = 150, Attr_2 = 355, Val_2 = 20000, AllPoint = 60},
		--Attrs 中 Attr 为属性KEYNAME ， MaxPoint 为最大加点数， AttrAdd 为每点加的属性
		ResetItem = "大成重置册",
		Attrs = {
			{Attr = "闪避", Icon = "1900816890", MaxPoint = 30, AttrAdd = 100},
			{Attr = "震摄躲闪概率", Icon = "1900816900", MaxPoint = 30, AttrAdd = 40},
			{Attr = "火法躲闪概率", Icon = "1900815870", MaxPoint = 30, AttrAdd = 40},
			{Attr = "雷法躲闪概率", Icon = "1900815890", MaxPoint = 30, AttrAdd = 40},
			{Attr = "水法躲闪概率", Icon = "1900816000", MaxPoint = 30, AttrAdd = 40},
			{Attr = "风法躲闪概率", Icon = "1900815730", MaxPoint = 30, AttrAdd = 40},
			{Attr = "毒法躲闪概率", Icon = "1900815820", MaxPoint = 30, AttrAdd = 40},
			{Attr = "封印躲闪概率", Icon = "1900803450", MaxPoint = 30, AttrAdd = 40},
			{Attr = "昏睡躲闪概率", Icon = "1900816140", MaxPoint = 30, AttrAdd = 40},
			{Attr = "混乱躲闪概率", Icon = "1900815810", MaxPoint = 30, AttrAdd = 40},
			{Attr = "鬼火躲闪概率", Icon = "1900816260", MaxPoint = 30, AttrAdd = 40},
			{Attr = "吸血躲闪概率", Icon = "1900816360", MaxPoint = 30, AttrAdd = 40},
			{Attr = "水法伤害修正", Icon = "1900816230", MaxPoint = 30, AttrAdd = 40},
			{Attr = "火法伤害修正", Icon = "1900816190", MaxPoint = 30, AttrAdd = 40},
			{Attr = "鬼火伤害修正", Icon = "1900816090", MaxPoint = 30, AttrAdd = 40},
			{Attr = "风法伤害修正", Icon = "1900815710", MaxPoint = 30, AttrAdd = 40},
			{Attr = "雷法伤害修正", Icon = "1900816100", MaxPoint = 30, AttrAdd = 40},
		}
	},
	[2] = {
		Name = "小成守护",
		--Exchange 中 Attr 和 Val 对应要换货币的类型和值      AllPoint 表示玩家最多可拥有的点数
		Exchange = {Attr_1 = 351, Val_1 = 20000, Attr_2 = 355, Val_2 = 20000, AllPoint = 30},
		ResetItem = "小成重置册",
		Attrs = {
			{Attr = "鬼火系伤害抵抗百分比", Icon = "1900816150", MaxPoint = 20, AttrAdd = 150},
			{Attr = "抗吸血攻击固定值", Icon = "1900816190", MaxPoint = 20, AttrAdd = 120},
			{Attr = "物理伤害抵抗百分比", Icon = "1900816800", MaxPoint = 20, AttrAdd = 150},
			{Attr = "火系伤害抵抗百分比", Icon = "1900816910", MaxPoint = 20, AttrAdd = 150},
			{Attr = "雷系伤害抵抗百分比", Icon = "1900816180", MaxPoint = 20, AttrAdd = 150},
			{Attr = "水系伤害抵抗百分比", Icon = "1900816300", MaxPoint = 20, AttrAdd = 150},
			{Attr = "风系伤害抵抗百分比", Icon = "1900816310", MaxPoint = 20, AttrAdd = 150},
			{Attr = "毒系抵抗中毒概率", Icon = "1900816570", MaxPoint = 20, AttrAdd = 150},
			{Attr = "封印抵抗概率", Icon = "1900816860", MaxPoint = 20, AttrAdd = 150},
			{Attr = "混乱抵抗概率", Icon = "1900816880", MaxPoint = 20, AttrAdd = 150},
			{Attr = "震摄伤害抵抗百分比", Icon = "1900816870", MaxPoint = 20, AttrAdd = 50},
			{Attr = "昏睡抵抗概率", Icon = "1900816540", MaxPoint = 20, AttrAdd = 150},
			{Attr = "遗忘抵抗概率", Icon = "1900816550", MaxPoint = 20, AttrAdd = 150},
		}
	}
}


function GuildGuardian.GetConfig(player)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
	if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	local str = [[if FactionUI then
		FactionUI.GuardianConfig = ]]..Lua_tools.serialize(GuildGuardian.Config)..[[
	]]
	--sLuaApp:ShowForm(player, "脚本表单", str)
	GuildGuardian.RefreshData(player,0,str)
end

--刷新界面
function GuildGuardian.RefreshData(player,index,str)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
    if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	
	if not str then
		str = [[if FactionUI then
		]]
	end
	
	--sLuaApp:LuaDbg("RefreshData 11111")
	if index == 0 or index == nil then
		for k,v in ipairs(GuildGuardian.Config) do
			local attrs = v.Attrs
			if attrs then
				if #attrs > 0 then
					--sLuaApp:LuaDbg("RefreshData attrs  " .. k)
					for i = 1,#attrs do
						str = str .. [[
						FactionUI.]]..'Guardian_'..k..'_'..i..[[ = ]]..player:GetInt("ATTR_GuildGuardian_"..k..'_'..i)
					end
				end
			end
			str = str .. [[
				FactionUI.Guardian_APoint_]]..k..[[ = ]]..player:GetInt("ATTR_GuildGuardian_AllPoint_"..k)..[[
				FactionUI.Guardian_Remain_]]..k..[[ = ]]..player:GetInt("ATTR_GuildGuardian_RemainPoint_"..k)..[[
			]]
			sLuaApp:LuaDbg("RefreshData 2222222  " .. k)
		end
		str = str .. [[
			FactionUI.RefreshGuardianData()
		end]]
	else
		--sLuaApp:LuaDbg("RefreshData index = " .. index)
		index = tonumber(index)
		local configs = GuildGuardian.Config[index]
		if not configs then
			sLuaApp:NotifyTipsMsg(player, "错误的index数据")
			return
		end
		
		local attrs = configs.Attrs
		if attrs then
			if #attrs > 0 then
				for i = 1,#attrs do
					str = str .. [[
					FactionUI.]]..'Guardian_'..index..'_'..i..[[ = ]]..player:GetInt("ATTR_GuildGuardian_"..index..'_'..i)
				end
			end
		end
		str = str .. [[
			FactionUI.Guardian_APoint_]]..index..[[ = ]]..player:GetInt("ATTR_GuildGuardian_AllPoint_"..index)..[[
			FactionUI.Guardian_Remain_]]..index..[[ = ]]..player:GetInt("ATTR_GuildGuardian_RemainPoint_"..index)..[[
			FactionUI.RefreshGuardianData()
		end]]
	end
	
	--sLuaApp:LuaDbg("str = " .. str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--点天赋
function GuildGuardian.AddPoint(player,index, str_point)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
	if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	local point_tb = sLuaApp:StrSplit(str_point, "_")
	index = tonumber(index)
	local configs = GuildGuardian.Config[index]
	if not configs then
		sLuaApp:NotifyTipsMsg(player, "错误的index数据")
		return
	end
	local attrs = configs.Attrs
	if not attrs then
		sLuaApp:NotifyTipsMsg(player, "错误的加点配置")
		return
	end
	local all_point_add = 0
	local all_point_all = 0
	--加点验证
	if #point_tb ~= #attrs then
		sLuaApp:NotifyTipsMsg(player, "错误的加点数据")
		return
	end
	local new_points = {}
	for k,v in ipairs(point_tb) do
		v = tonumber(v)
		if v ~= math.floor(v) then
			sLuaApp:NotifyTipsMsg(player, "错误的加点数据")
			return
		end
		if v < 0 then
			sLuaApp:NotifyTipsMsg(player, "错误的加点数据")
			return
		end
		new_points[k] = v + player:GetInt("ATTR_GuildGuardian_"..index..'_'..k)
		if new_points[k] > attrs[k].MaxPoint then
			sLuaApp:NotifyTipsMsg(player, "超过加点上限，无法加点")
			return
		end
		all_point_add = all_point_add + v
		all_point_all = all_point_all + new_points[k]
	end
	local remain = player:GetInt("ATTR_GuildGuardian_RemainPoint_"..index) - all_point_add
	if remain < 0 then
		sLuaApp:NotifyTipsMsg(player, "剩余点数不足！")
		return
	end
	if all_point_all > configs.Exchange.AllPoint then
		sLuaApp:NotifyTipsMsg(player, "总点数超过了"..configs.Name.."上限！")
		return
	end
	player:SetInt("ATTR_GuildGuardian_RemainPoint_"..index, remain)
	local AttrMark = PlayerAttrClassify.GuildGuardian or 30
	for k,v in ipairs(new_points) do
		player:SetDynAttr(AttrMark+index,GuildGuardian.Key2Id[index][k],v*attrs[k].AttrAdd)
		--sLuaApp:LuaDbg("属性ID = " .. GuildGuardian.Key2Id[index][k] .. "    属性Val = " .. v*attrs[k].AttrAdd)
		player:SetInt("ATTR_GuildGuardian_"..index..'_'..k, v)
	end
	sLuaApp:NotifyTipsMsg(player, "加点成功！")
	GuildGuardian.RefreshData(player,index)
end

function GuildGuardian.ExchangePoint(player,index,val)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
	if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	index = tonumber(index)
	local configs = GuildGuardian.Config[index]
	if not configs then
		sLuaApp:NotifyTipsMsg(player, "错误的index数据")
		return
	end
	local exc_data = configs.Exchange
	if not exc_data then
		sLuaApp:NotifyTipsMsg(player, "错误的加点配置")
		return
	end
	local buyed = player:GetInt("ATTR_GuildGuardian_AllPoint_"..index)
	if buyed >= exc_data.AllPoint then
		sLuaApp:NotifyTipsMsg(player, "已达到拥有上限，不能在兑换更多的"..configs.Name.."了")
		return
	end
	val = tonumber(val)
	if val + buyed > exc_data.AllPoint then
		sLuaApp:NotifyTipsMsg(player, "您最多还能兑换"..(exc_data.AllPoint - buyed).."个"..configs.Name.."")
		return
	end
	local Max_ExA = 0
	for i = 1,5 do
		local attrId = exc_data['Attr_'..i]
		local attrVal = exc_data['Val_'..i]
		if attrId and attrVal then		
			if player:GetAttr(attrId) < attrVal then
				sLuaApp:NotifyTipsMsg(player, "您的 " .. AttrConfig.GetById(attrId).ChinaName .. " 不足")
				return
			end
			Max_ExA = i
			--if 
			--else
			--	sLuaApp:NotifyTipsMsg(player, "不在可交易范围的属性 " .. attrId)
			--	return
			--end
		end
	end
	
	for i = 1,Max_ExA do
		local attrId = exc_data['Attr_'..i]
		local attrVal = exc_data['Val_'..i]
		if attrId and attrVal then
			if attrId == 356 then
				-- 战功
				player:SubGuildFightScore(attrVal*val, "Guild", "GuildGuardian", " index = " .. index .. " num = " .. val)
			elseif attrId == 355 then
				-- 帮派成就
				player:SubGuildAchievement(attrVal*val, "Guild", "GuildGuardian", " index = " .. index .. " num = " .. val)
			elseif attrId == 351 then
				-- 帮贡
				player:SubGuildContribute(attrVal*val, "Guild", "GuildGuardian", " index = " .. index .. " num = " .. val)
			else
				sLuaApp:NotifyTipsMsg(player, "不在可交易范围的属性 " .. attrId)
				return
			end
		end
	end
	sLuaApp:NotifyTipsMsg(player, "兑换成功！")
	player:SetInt("ATTR_GuildGuardian_AllPoint_"..index, buyed+val)
	player:SetInt("ATTR_GuildGuardian_RemainPoint_"..index, player:GetInt("ATTR_GuildGuardian_RemainPoint_"..index)+val)
	GuildGuardian.RefreshData(player,index)
	return
end

function GuildGuardian.ResetPoint(player,index)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
	if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	if player:GetInt("ATTR_GuildGuardian_RemainPoint_"..index) == player:GetInt("ATTR_GuildGuardian_AllPoint_"..index) then
		sLuaApp:NotifyTipsMsg(player, "您还没有使用过点数")
		return
	end
	index = tonumber(index)
	local itemKey = GuildGuardian.Config[index].ResetItem
	if itemKey then
		if not Lua_tools.IsItemEnough(player, {itemKey,1}) then
			OneKeyBuy.Main(player,{itemKey,1})
			return
		end
		if not GuildGuardian['ResetItemName_'..index] then
			GuildGuardian['ResetItemName_'..index] = ItemConfig.GetByKeyName(itemKey).Name
		end
		local info = "确定消耗一个"..GuildGuardian['ResetItemName_'..index].."充值你的加点吗？"
		local str = [[GlobalUtils.ShowServerBoxMessage("]]..info..[[")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "GuildGuardian.ResetPoint_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..index..")")
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function GuildGuardian.ResetPoint_Confirm(player,index)
	if FunctionSwitch.AllFuncitonConfig.GuildGuardian ~= "on" then
		return
	end
	if player:GetGuild() == nil then
		sLuaApp:NotifyTipsMsg(player, "您还没有帮派")
		return
	end
	index = tonumber(index)
	local itemKey = GuildGuardian.Config[index].ResetItem
	if itemKey then
		if not Lua_tools.SubItem(player, {itemKey,1}, "System", "GuildGuardian", "重置点数消耗") then
			OneKeyBuy.Main(player,{itemKey,1})
			return
		end
		local AttrMark = PlayerAttrClassify.GuildGuardian or 30
		player:SetDynAttrsByMark(AttrMark+index,0)
		for k,v in ipairs(GuildGuardian.Config[index].Attrs) do
			player:SetInt("ATTR_GuildGuardian_"..index..'_'..k, 0)
		end	
		player:SetInt("ATTR_GuildGuardian_RemainPoint_"..index, player:GetInt("ATTR_GuildGuardian_AllPoint_"..index))
		GuildGuardian.RefreshData(player,index)
	end
end

function GuildGuardian.Initialization()
	GuildGuardian.Key2Id = {}
	for x,a in ipairs(GuildGuardian.Config) do
		GuildGuardian.Key2Id[x] = {}
		if a.Attrs then
			for k,v in ipairs(a.Attrs) do
				if v.Attr then
					local AttrData = AttrConfig.GetByKeyName(v.Attr)
					if not AttrData then
						sLuaApp:LuaWrn("GuildGuardian.Config配置错误，不存在的KEYNAME = " .. v.Attr)
					else
						GuildGuardian.Key2Id[x][k] = AttrData.Id
					end
				end
			end
		end
	end
	--if Lua_tools then
	--	sLuaApp:LuaDbg("GuildGuardian.Key2Id = " .. Lua_tools.serialize(GuildGuardian.Key2Id))
	--end
end

--GuildGuardian.Initialization()