--兑换码
FormBonusExchange = {}

local ExchangeTable = { --直接兑换码 配置后可以直接使用 同一个兑换码 每个角色只能使用一次
	['hQuh62hi31bVs8ffq3oA4'] = "天龙珠礼包",
	['Hu3jIA5vnB1hF7K59gjSd'] = "高级炼妖礼包",
	['kQbe2xmaCvxy26SX7rE3S'] = "高级宠物技能包",
	['dt001'] = "内测礼包",
	['dt002'] = "内测礼包",
	['dt003'] = "内测礼包",
}

local PrefixTable = { --兑换码前缀 用于搭配运营后台生成批量兑换码 提取形式为"前缀-（后台生成的随机数字）" 同一个前缀生成的兑换码 每个角色只能使用一次
	['mttest'] = "新手礼包",
	['198fl'] = "日充198",
	['328fl'] = '日充328',
	['648fl'] = '日充648',
	['1000fl'] = '日充1000',
	['2000fl'] = '日充2000',
	['5000fl'] = '日充5000',
	['zywj'] = '转游礼包',
	['dtmt1'] = '节日礼包1号',
	['dtmt2'] = '节日礼包2号',
	['dtmt3'] = '节日礼包3号',
	['dtmt4'] = '节日礼包4号',
	['dtmt5'] = '节日礼包5号',
	['ncwj'] = '猴塞雷',
}




local Url = ""

function FormBonusExchange.Main(player, code)
	--sLuaApp:NotifyTipsMsg(player,"基础测试")
	--sLuaApp:NotifyTipsMsg(player, "lenth = " ..string.len(code)) 
	if string.len(code) < 3 then
		return "兑换码无效"
	end
	if ExchangeTable[code] then
		if player:GetInt("EXCHANGESYSTEM_" .. code) == 1 then
			sLuaApp:NotifyTipsMsg(player,"您已经使用过该兑换码了")
		else
			sLuaApp:NotifyTipsMsg(player,"兑换成功，请于邮箱获取奖励")
			local itemKey = ExchangeTable[code]
			local itemData = ItemConfig.GetByKeyName(itemKey)
			if itemData then
				sMailSystem:SendMail(0, "系统邮件", player:GetGUID(), 1, "奖品兑换", "您使用兑换码兑换了以下奖励，祝您游戏愉快！", {}, {itemData.Id,1,1})
				player:SetInt("EXCHANGESYSTEM_" .. code, 1)
			end
		end
	else
		local code_index = split(code,"-")[1]
		local Gift = PrefixTable[code_index]
		if code_index == "" or Gift == nil then
			return "兑换码无效"
		elseif player:GetInt("EXCHANGESYSTEM_" .. code_index) == 1 then
			return "您已经领取了该奖励"
		else
			player:SetString("BonusExchangeCode",code_index)
		end
		local accountid = player:GetUserId()
		local unixtime = sLuaApp:SecondSinceEpoch(0)
		unixtime = sLuaApp:Local2UTC(unixtime)
		if not FormBonusExchange.BonusExchage_serverid then
			FormBonusExchange.BonusExchage_serverid = sLuaApp:GetZoneId()
		end
		local md5 = string.lower(sLuaApp:MD5(""..accountid..FormBonusExchange.BonusExchage_serverid..code..unixtime..sLuaApp:GetKey()))
		
		if sLuaApp:GetURL("http://api.hzyotoy.com/api/codeverify.do?".."accountid="..accountid.."&serverid="..FormBonusExchange.BonusExchage_serverid.."&code="..code.."&unixtime="..unixtime.."&sign="..md5, "FormBonusExchange:URLCallBack", ""..player:GetGUID(), 30) == false then
			sLuaApp:NotifyTipsMsg(player,"兑换码无效")
		end
	end
	return ""
end

function FormBonusExchange.URLCallBack(player_guid, errcode, result)
	if type(player_guid) ~= "string" then
		return ""
	end
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(player_guid))
	local tb_result = split(result,[["]])
	local msg = tb_result[4]
	local code = tb_result[8]
	if code == "1" then
		--lualib:LogDetailWithId(lualib:Name(player), )
		local code_index = player:GetString("BonusExchangeCode")
		local Gift = PrefixTable[code_index]
		if code_index == "" or Gift == nil then
			sLuaApp:NotifyTipsMsg(player,"ERROR  = " .. code_index)
			return
		else
			if type(Gift) == 'table' then
				local code_index = player:GetString("BonusExchangeCode")
				local con1 = PrefixTable[code_index]
				if not con1 or type(con1) ~= "table" then
					sLuaApp:NotifyTipsMsg(player, "ERROR CODE 0")
					return
				end
				local con = con1.Condition
				if not con or type(con) ~= "table" then
					sLuaApp:NotifyTipsMsg(player, "ERROR CODE 1")
					return
				end
				local itemData = ItemConfig.GetByKeyName(con1.Item)
				if itemData then
					sMailSystem:SendMail(0, "系统邮件", player:GetGUID(), 1, "奖品兑换", "您使用兑换码兑换了以下奖励，祝您游戏愉快！", {}, {itemData.Id,1,1})
					player:SetInt("EXCHANGESYSTEM_" .. code_index, 1)
				end
				--lualib:SendMail("系统", lualib:Name(player), "奖品兑换", "您使用兑换码兑换了以下奖励，祝您游戏愉快！", 0, 0, {con1.Item,1,1})
			else
				local itemData = ItemConfig.GetByKeyName(Gift)
				if itemData then
					sMailSystem:SendMail(0, "系统邮件", player:GetGUID(), 1, "奖品兑换", "您使用兑换码兑换了以下奖励，祝您游戏愉快！", {}, {itemData.Id,1,1})
					player:SetInt("EXCHANGESYSTEM_" .. code_index, 1)
				end
				player:SetInt("EXCHANGESYSTEM_" .. code_index, 1)
			end
		end
	else
		if code == '9010' then
			sLuaApp:NotifyTipsMsg(player,"该兑换码已经被使用过了")
		else
			sLuaApp:NotifyTipsMsg(player,"ERROR CODE RETURN "..code)
			sLuaApp:NotifyTipsMsg(player,"ERROR CODE RETURN MSG = "..msg)
		end
	end
end
--[[
function FormBonusExchange.GetBillinByTimes(bResult,dwError,strError,iResultNum,tRecordSets,player)
	if bResult == false then
		sLuaApp:NotifyTipsMsg(player, "查询玩家充值数据失败")
		return
	end
	local bill_all = 0
	for k,v in ipairs(tRecordSets) do
		bill_all = bill_all + v[2]
	end
	local code_index = player:GetString("BonusExchangeCode")
	if not ExchangeTable[code_index] or type(ExchangeTable[code_index]) ~= "table" then
		sLuaApp:NotifyTipsMsg(player, "激活码操作过于频繁，已终止")
		return
	end
	local re_val = ExchangeTable[code_index]['Condition'].RechargeVal
	if re_val * (RMBtoIngot or 10) > bill_all then
		sLuaApp:NotifyTipsMsg(player, "充值额度达到"..re_val.."才能领取该礼包哦！（当前充值额度"..math.floor(bill_all/(RMBtoIngot or 10)).."）")
		return
	end
	local accountid = lualib:Player_GetAccountID(player)
	local unixtime = lualib:GetAllTime()
	local code = player:GetString("BonusExchangeActivationCode")
	if not FormBonusExchange.BonusExchage_serverid then
		FormBonusExchange.BonusExchage_serverid = lualib:GetZoneId()
	end
	local md5 = string.lower(lualib:MD5(""..accountid..FormBonusExchange.BonusExchage_serverid..code..unixtime..lualib:GetZoneKey()))
	if sLuaApp:GetURL("http://api.hzyotoy.com/api/codeverify.do?".."accountid="..accountid.."&serverid="..FormBonusExchange.BonusExchage_serverid.."&code="..code.."&unixtime="..unixtime.."&sign="..md5, "FormBonusExchange:URLCallBack", ""..player:GetGUID(), 30) == false then
		sLuaApp:NotifyTipsMsg(player,"兑换码无效")
	end
end]]