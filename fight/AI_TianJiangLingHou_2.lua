--天降灵猴 灵猴 每次攻击后
AI_TianJiangLingHou_2 = {}

function AI_TianJiangLingHou_2.OnAI(fighter)
	if not TianJiangLingHouConfig and TianJiangLingHouConfig.StealMoney then
		sLuaApp:LuaErr("缺少TianJiangLingHouConfig.StealMoney")
		return
	end

	local custom = sFightSystem:GetTagCustom(fighter)
	local player = sPlayerSystem:GetPlayerByGUID(tonumber(custom))
	if not player then
		sLuaApp:LuaErr("AI_TianJiangLingHou_2.OnAI 不存在player")
		return
	end
	
	local attack_num = player:GetInt("TianJiangLingHouAttackNum") + 1
	for i = attack_num, 1, -1 do
		if TianJiangLingHouConfig.StealMoney["AttackNum_"..i] then
			local attack_steal = TianJiangLingHouConfig.StealMoney["AttackNum_"..i]
			local index = TianJiangLingHou.GetRandIndex(attack_steal, "AttackNum_"..i, 1)[1]
			local steal_list = attack_steal[index]
			local money_type = steal_list["MoneyType"]
			local money_val = sLuaApp:RandInteger(steal_list["MoneyVal"][1], steal_list["MoneyVal"][2])
			
			local msg = ""
			local attr_data = AttrConfig.GetById(Lua_tools.GetMoneyAttrs(money_type))
			if not attr_data then
				sLuaApp:LuaErr("AI_TianJiangLingHou_2.OnAI 不存在money_type"..money_type)
				return
			end
			local money_name = attr_data.KeyName
			if not Lua_tools.IsMoneyEnough(player, money_type, money_val) then
				if money_type == 1 then
					money_val = player:GetIngot()
				elseif money_type == 2 then
					money_val = player:GetBindIngot()
				elseif money_type == 4 then
					money_val = player:GetGold()
				elseif money_type == 5 then
					money_val = player:GetBindGold()
				end
				if money_val <= 0 then
					msg = "真是穷鬼！身无分文,本猴去也！"
				else
					msg = "真是穷鬼！身上只有".."#OFFSET<X:0,Y:-8#IMAGE"..TianJiangLingHou.MoneyIcon[money_type].."#OFFSETEND># "..money_val..",本猴尽数拿走，去也！"
				end
				fighter:SendPaoPao(msg)
				sFightSystem:CreateFightBuff(fighter, 108)
			else
				if steal_list["Msg"] then
					msg = string.gsub(steal_list["Msg"], "$money", "#OFFSET<X:0,Y:-8#IMAGE"..TianJiangLingHou.MoneyIcon[money_type].."#OFFSETEND># "..money_val) 
				else
					msg = "嘿嘿！我偷取了你" .. "#OFFSET<X:0,Y:-8#IMAGE"..TianJiangLingHou.MoneyIcon[money_type].."#OFFSETEND># "..money_val
				end
				fighter:SendPaoPao(msg)	
			end
			--sLuaApp:LuaErr(msg)
			 
			--扣钱
			player:SetInt("TianJiangLingHouStealMoneyVal", money_val)
			player:SetInt("TianJiangLingHouStealMoneyType", money_type)
			Lua_tools.SubMoney(player, money_type, money_val, "system", "天降灵猴", "灵猴偷取")
			break
		end
	end

	player:SetInt("TianJiangLingHouAttackNum", attack_num)
end