--套装
SuitSys = {}

--随机套装标记
function SuitSys.random(equip,randomkey)
	if not SuitSys.check() then
		return false
	end
	if not equip then
		sLuaApp:LuaDbg("SuitSys.random is err , equip is nil")
		return false
	end
	randomkey = tostring(randomkey)
	if not randomkey then
		sLuaApp:LuaDbg("SuitSys.random is err , randomkey is nil")
		return false
	end
	if not SuitConfig.EquipSuitRadomConfig[''..randomkey] then	
		sLuaApp:LuaDbg("SuitSys.random is err , SuitConfig.EquipSuitRadomConfig["..randomkey.."] is nil")
		return false
	end
	local equip_suit_keyname = SuitSys.random_rank(SuitConfig.EquipSuitRadomConfig[''..randomkey],randomkey)
	if equip_suit_keyname == "" then	
		sLuaApp:LuaDbg("SuitSys.random is err , equip_suit_keyname  = "..equip_suit_keyname)
		return false
	end
	if equip:GetString("equip_suit_keyname") ~= "" then
		sLuaApp:LuaDbg("SuitSys.random is err , equip's has equip_suit_keyname , equip_suit_keyname = "..equip:GetString("equip_suit_keyname"))
		return false
	end
	equip:SetString(SuitConfig.Main['Sign_STR'],equip_suit_keyname)
	return true
end

--套装打标记
function SuitSys.set_equip_suit_keyname(equip,key)
	if not SuitSys.check() then
		return false
	end
	if not equip then
		sLuaApp:LuaDbg("SuitSys.random is err , equip is nil")
		return false
	end
	key = tostring(key)
	if not key then
		sLuaApp:LuaDbg("SuitSys.random is err , key is nil")
		return false
	end
	if not SuitConfig.Main[''..key] then	
		sLuaApp:LuaDbg("SuitSys.random is err , SuitConfig.Main["..key.."] is nil")
		return false
	end
	if equip:GetString("equip_suit_keyname") ~= "" then
		sLuaApp:LuaDbg("SuitSys.random is err , equip's has equip_suit_keyname , equip_suit_keyname = "..equip:GetString("equip_suit_keyname"))
		return false
	end
	equip:SetString(SuitConfig.Main['Sign_STR'],key)
	return true
end


--穿装备
function SuitSys.on_post_equip(player,equip)
	if not SuitSys.check() then
		return
	end
	local equip_suit_keyname = equip:GetString(SuitConfig.Main['Sign_STR'])
	if equip_suit_keyname == "" then
		return
	end
	if not SuitConfig.Main[''..equip_suit_keyname] then	
		sLuaApp:LuaDbg("SuitSys.on_post_equip is err , SuitConfig.Main["..equip_suit_keyname.."] is nil")
		return
	end
	local player_suit_str = player:GetString("player_suit_str")
	local player_suit_tb = {}
	if player_suit_str ~= "" then
		player_suit_tb = assert(load("return "..player_suit_str))()
	end
	local suit_num = 0
	if player_suit_tb[''..equip_suit_keyname] then
		suit_num = player_suit_tb[''..equip_suit_keyname]
	end
	suit_num = suit_num + 1
	if not SuitConfig.Main[''..equip_suit_keyname]['Total'] then
		sLuaApp:LuaDbg("SuitSys.on_post_equip is err , Total is nil , equip_suit_keyname = "..equip_suit_keyname) 
	end
	if suit_num > SuitConfig.Main[''..equip_suit_keyname]['Total'] then
		sLuaApp:LuaDbg("SuitSys.on_post_equip is err , suit_num > Total , suit_num = "..suit_num..",equip_suit_keyname = "..equip_suit_keyname)
	end
	player_suit_tb[''..equip_suit_keyname] = suit_num
	player:SetString("player_suit_str",Lua_tools.serialize(player_suit_tb))
	SuitSys.set_dyn_attr(player)
end
--脱装备
function SuitSys.on_post_unequip(player,equip)
	if not SuitSys.check() then
		return
	end
	local equip_suit_keyname = equip:GetString(SuitConfig.Main['Sign_STR'])
	if equip_suit_keyname == "" then
		return
	end
	if not SuitConfig.Main[''..equip_suit_keyname] then	
		sLuaApp:LuaDbg("SuitSys.on_post_unequip is err , SuitConfig.Main["..equip_suit_keyname.."] is nil")
		return
	end
	local player_suit_str = player:GetString("player_suit_str")
	local player_suit_tb = {}
	if player_suit_str ~= "" then
		player_suit_tb = assert(load("return "..player_suit_str))()
	end
	local suit_num = 0
	if player_suit_tb[''..equip_suit_keyname] then
		suit_num = player_suit_tb[''..equip_suit_keyname]
	end
	suit_num = suit_num - 1
	if suit_num < 0 then
		sLuaApp:LuaDbg("SuitSys.on_post_unequip is err , suit_num < 0 ")
	end
	player_suit_tb[''..equip_suit_keyname] = suit_num
	player:SetString("player_suit_str",Lua_tools.serialize(player_suit_tb))
	SuitSys.set_dyn_attr(player)
end
--重新计算属性
function SuitSys.set_dyn_attr(player)
	--清空所有属性值
	player:SetDynAttrsByMark(PlayerAttrClassify['Suit_Attr'],0)
	local attr_tb = {}
	local player_suit_str = player:GetString("player_suit_str")
	local player_suit_tb = {}
	if player_suit_str == "" then
		return
	end
	player_suit_tb = assert(load("return "..player_suit_str))()
	for k,v in pairs(player_suit_tb) do 
		if SuitConfig.Main[''..k] then
			for a,b in pairs(SuitConfig.Main[''..k]['Size']) do
				if a <= v then
					if b['Attr'] then
						for c,d in pairs(b['Attr']) do
							if attr_tb[d[1]] then
								attr_tb[d[1]] = attr_tb[d[1]] + d[2]
							else
								attr_tb[d[1]] = d[2]
							end
						end
					end
				end
			end
		end
	end
	for k,v in pairs(attr_tb) do
		if AttrConfig.GetByKeyName(k) then
			player:SetDynAttr(PlayerAttrClassify['Suit_Attr'],AttrConfig.GetByKeyName(k).Id,v)
		else	
			sLuaApp:LuaDbg("SuitSys.set_dyn_attr is err,AttrConfig.GetByKeyName is nil ,key = "..k)
		end
	end
	player:RecalcAttr()
end
--上线给客户端发表单
function SuitSys.on_login(player)
	if not SuitSys.check() then
		return
	end
	local str = [[
			if GlobalUtils then
				GlobalUtils.GetEquipSuitConfig(]].. Lua_tools.serialize(SuitConfig.Main) ..[[)
				GlobalUtils.ChangeByItem(]].. Lua_tools.serialize(SuitConfig.ChangeByItem) ..[[)
			end
		]]
	sLuaApp:ShowForm(player,"脚本表单", str)	
end
--简单的检查
function SuitSys.check()
	if not FunctionSwitch then
		return false
	end
	if not FunctionSwitch.AllFuncitonConfig then
		return false
	end
	if FunctionSwitch.AllFuncitonConfig['Suit'] ~= "on" then
		return false
	end
	if not SuitConfig then
		sLuaApp:LuaDbg("SuitSys.check is err , SuitConfig is nil")
		return false
	end 
	if not SuitConfig.Main then
		sLuaApp:LuaDbg("SuitSys.check is err , SuitConfig.Main is nil")
		return false
	end
	if not SuitConfig.EquipSuitRadomConfig then
		sLuaApp:LuaDbg("SuitSys.check is err , SuitConfig.EquipSuitRadomConfig is nil")
		return false
	end
	if not SuitConfig.ChangeByItem then
		return false
	end
	return true
end
--简化版权重方法,注意返回值
function SuitSys.random_rank(tb_rand,tbname)
	local suit_keyname = ""
	if type(tb_rand) ~= "table" then		
		return suit_keyname
	end
	if not SuitSys.RandomTable_luatools then
		SuitSys.RandomTable_luatools = {}
	end
	if not SuitSys.RandomTable_luatools[tbname] then
		SuitSys.RandomTable_luatools[tbname] = {0}
		for k,v in ipairs(tb_rand) do
			SuitSys.RandomTable_luatools[tbname][k+1] = SuitSys.RandomTable_luatools[tbname][k] + (v.Rand or 100)
		end
	end
	local rander = SuitSys.RandomTable_luatools[tbname]
	local index = 1
	for s = 1,1 do
		local rand = sLuaApp:RandInteger(1,rander[#rander])
		for i = 1,#tb_rand do
			if rand <= rander[i+1] and rand > rander[i] then
				index = i
				break
			end
		end
		suit_keyname = tb_rand[index]['suit_keyname']
	end
	return suit_keyname
end
--套装更换
function SuitSys.change_by_item(player,equip_guid,item_guid)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local equip = sItemSystem:GetItemByGUID(tonumber(equip_guid))
	if not SuitSys.check() then
		return
	end
	if not player then
		return
	end
	if not equip then
		return
	end
	if not item then
		return
	end
	local item_key = item:GetKeyName()
	item_key = tostring(item_key)
	if not SuitConfig.ChangeByItem[''..item_key] then
		return
	end
	local suit_key = SuitConfig.ChangeByItem[''..item_key]['suit_keyname']
	if not SuitConfig.Main[''..suit_key] then
		return
	end
	if tostring(equip:GetOwnerGUID()) ~= tostring(player:GetGUID()) then
		sLuaApp:NotifyTipsMsg(player, "套装符印更换出错，休想骗我，装备不是你的")	
		return
	end	
	if tostring(item:GetOwnerGUID()) ~= tostring(player:GetGUID()) then
		sLuaApp:NotifyTipsMsg(player, "套装符印更换出错，休想骗我，道具不是你的")	
		return
	end	
	local sub_type = equip:GetSubType()
	if not SuitConfig.ChangeByItem[''..item_key]['sub_type_'..sub_type] then
		sLuaApp:NotifyTipsMsg(player, "套装符印更换出错，当前部位没这个套装")	
		return
	end
	if SuitConfig.ChangeByItem[''..item_key]['sub_type_'..sub_type] ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "套装符印更换出错，当前部位没这个套装")	
		return
	end
	if equip:GetString("equip_suit_keyname") == suit_key then
		sLuaApp:NotifyTipsMsg(player, "当前装备已经是该套装效果了")	
		return
	end
	local is_bound = true
	is_bound = item:IsBound()
	--判断钱够不够
	if not Lua_tools.IsMoneyEnough(player,SuitConfig.ChangeByItem[''..item_key]['money_type'] , SuitConfig.ChangeByItem[''..item_key]['money_value']) then
		if MoneyChange then
		 	local f_name = [[SuitSys.change_by_item(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..equip_guid..[[,]]..item_guid..[[)]]
			MoneyChange.LackMoney(player, SuitConfig.ChangeByItem[''..item_key]['money_type'], SuitConfig.ChangeByItem[''..item_key]['money_value'], f_name)
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(SuitConfig.ChangeByItem[''..item_key]['money_type']).."不足，无法进行套装符印更换")
		end
		return
	end
	--判断道具够不够
	if not Lua_tools.IsItemEnough(player, {item_key,1}) then
		--sLuaApp:NotifyTipsMsg(player, "道具不足！")
		--这里可以添加一键购买
		OneKeyBuy.Main(player,{item_key, 1})
		return
	end
	--扣钱
	if not Lua_tools.SubMoney(player, SuitConfig.ChangeByItem[''..item_key]['money_type'], SuitConfig.ChangeByItem[''..item_key]['money_value'], "SuitSys.change_by_item","player:"..player:GetName(), "equip:"..equip:GetGUID().."     item:"..item:GetName()) then
		sLuaApp:NotifyTipsMsg(player, "套装符印出错，扣钱失败")	
		return
	end
	--扣道具
	if sItemSystem:ConsumeItem(item,1,"系统","套装符印",""..item:GetName().."  "..player:GetName()) ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "套装符印出错，扣除道具失败")
		return
	end
	
	--坑爹的成功率
	if sLuaApp:RandInteger(1,10000) > SuitConfig.ChangeByItem[''..item_key]['change_rate'] then
		sLuaApp:NotifyTipsMsg(player, "好惨啊，失败了")
		return
	end
	
	if is_bound then
		equip:SetBound()
	end
	--如果在身上，假装脱一次，重计算属性
	local item_container = equip:GetItemContainer()
	if item_container:GetContainerType() == ITEM_CONTAINER_EQUIP then
		SuitSys.on_post_unequip(player,equip)
	end
	
	equip:SetString(SuitConfig.Main['Sign_STR'],suit_key)
	
	--如果在身上，假装穿一次，重计算属性
	local item_container = equip:GetItemContainer()
	if item_container:GetContainerType() == ITEM_CONTAINER_EQUIP then
		SuitSys.on_post_equip(player,equip)
	end
	
	sLuaApp:NotifyTipsMsg(player, "套装符印更换成功")
end