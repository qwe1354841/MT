--装备相关表单

PetManual = {}

--Show 显示优先级，小的在前面
--MoneyType、CustomCurrency 货币类型或兑换物ID，二者只能有一个，优先显示货币
--MoneyVal、ItemNum 需要的钱币值或兑换物数量
--MapList 在哪些地图可以获取
--Desc 备注文字

PetManual.Config = {
	['无根草'] = {Show = 1, MoneyType = 5, MoneyVal = 1440, MapList = {"东海海湾","大雁塔一层"}},
	['小绵羊'] = {Show = 2, MoneyType = 5, MoneyVal = 1440, MapList = {"东海海湾","傲来村野","大雁塔一层"}},
	['蟹将军'] = {Show = 3, MoneyType = 5, MoneyVal = 1440, MapList = {"江南野外","傲来村野","大雁塔二层"}},
	['野猪妖'] = {Show = 4, MoneyType = 5, MoneyVal = 1440, MapList = {"傲来村野","大雁塔一层","大雁塔二层","大雁塔三层"}},
	['行者游魂'] = {Show = 5, MoneyType = 5, MoneyVal = 1440, MapList = {"大雁塔二层","大雁塔三层","大雁塔四层"}},
	['浣灵熊'] = {Show = 6, MoneyType = 5, MoneyVal = 1440, MapList = {"江南野外","大唐国境","大雁塔四层"}},
	['小虎妖'] = {Show = 7, MoneyType = 5, MoneyVal = 1440, MapList = {"江南野外","大雁塔四层","大雁塔五层"}},
	['旋龟'] = {Show = 8, MoneyType = 5, MoneyVal = 1440, MapList = {"大雁塔五层"}},
	['岩穴鳄'] = {Show = 9, MoneyType = 5, MoneyVal = 1440, MapList = {"大雁塔五层","大雁塔六层"}},
	['山贼斥候'] = {Show = 11, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐国境","大雁塔六层","大雁塔七层"}},
	['瑞兽幼崽'] = {Show = 12, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐国境","大雁塔六层","大雁塔七层"}},
	['雪坊主'] = {Show = 13, MoneyType = 5, MoneyVal = 1440, MapList = {"大雁塔六层","大雁塔七层"}},
	['女尸怨灵'] = {Show = 14, MoneyType = 5, MoneyVal = 1440, MapList = {"大雁塔七层"}},
	['水判官'] = {Show = 15, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐境外","砂城遗址"}},
	['青冥灯'] = {Show = 16, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐境外","砂城遗址","遗址地宫一层","遗址地宫二层"}},
	['灵木怪'] = {Show = 17, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐境外","砂城遗址"}},	
	['幻灵鹿'] = {Show = 18, MoneyType = 5, MoneyVal = 1440, MapList = {"大唐境外","遗址地宫二层","遗址地宫三层","遗址地宫五层"}},
	['剧毒蜘蛛'] = {Show = 19, MoneyType = 5, MoneyVal = 1440, MapList = {"遗址地宫一层","遗址地宫二层"}},
	['魅音狐'] = {Show = 20, MoneyType = 5, MoneyVal = 1440, MapList = {"两界山","遗址地宫三层","遗址地宫四层","遗址地宫五层"}},
	['赤炎狼'] = {Show = 21, MoneyType = 5, MoneyVal = 1440, MapList = {"两界山","遗址地宫四层","遗址地宫五层"}},
	['土灵熊'] = {Show = 22, MoneyType = 5, MoneyVal = 1440, MapList = {"两界山","遗址地宫四层","遗址地宫六层"}},
	['裂天兕'] = {Show = 23, MoneyType = 5, MoneyVal = 1440, MapList = {"遗址地宫六层"}},
	['天神石像'] = {Show = 24, MoneyType = 5, MoneyVal = 1440, MapList = {"遗址地宫六层"}},
	['洞花妖'] = {Show = 25, MoneyType = 5, MoneyVal = 1440, MapList = {"玄阴池","水帘洞窟一层","水帘洞窟二层","水帘洞窟三层"}},
	['玄阴蝎'] = {Show = 26, MoneyType = 5, MoneyVal = 1440, MapList = {"玄阴池","水帘洞窟一层","水帘洞窟二层","水帘洞窟三层"}},
	['玄阴霜豹'] = {Show = 27, MoneyType = 5, MoneyVal = 1440, MapList = {"玄阴池","水帘洞窟三层","水帘洞窟四层"}},
	['素尾白狐'] = {Show = 28, MoneyType = 5, MoneyVal = 1440, MapList = {"解阳山","水帘洞窟五层","水帘洞窟七层"}},
	['冰魄剑灵'] = {Show = 29, MoneyType = 5, MoneyVal = 1440, MapList = {"解阳山","水帘洞窟五层","水帘洞窟七层"}},
	['踏火神犀'] = {Show = 30, MoneyType = 5, MoneyVal = 1440, MapList = {"解阳山","水帘洞窟六层"}},
	['水帘妖'] = {Show = 31, MoneyType = 5, MoneyVal = 1440, MapList = {"解阳山","水帘洞窟六层","水帘洞窟七层"}},
	['巨灵神'] = {Show = 32, MoneyType = 5, MoneyVal = 1440, MapList = {"天界"}},
	['云中仙'] = {Show = 33, MoneyType = 5, MoneyVal = 1440, MapList = {"天界"}},
	['迦楼纳什'] = {Show = 34, MoneyType = 5, MoneyVal = 1440, MapList = {"天界"}},
	['邪毅将军'] = {Show = 35, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫一层","丹炉地宫四层"}},
	['冥焰火凤'] = {Show = 36, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫二层","丹炉地宫四层","丹炉地宫七层"}},
	['熔火石灵'] = {Show = 37, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫一层","丹炉地宫三层","丹炉地宫五层","丹炉地宫六层"}},
	['器灵'] = {Show = 38, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫一层","丹炉地宫三层","丹炉地宫五层","丹炉地宫六层","丹炉地宫七层"}},
	['怨灵鬼'] = {Show = 39, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫二层","丹炉地宫三层","丹炉地宫五层","丹炉地宫六层"}},
	['药童子'] = {Show = 40, MoneyType = 5, MoneyVal = 1440, MapList = {"丹炉地宫二层","丹炉地宫四层","丹炉地宫七层"}},
	['小花仙'] = {Show = 41, MoneyType = 5, MoneyVal = 1440, MapList = {"蟠桃园"}},
	['千年树灵'] = {Show = 42, MoneyType = 5, MoneyVal = 1440, MapList = {"蟠桃园"}},
	['七仙女'] = {Show = 43, MoneyType = 5, MoneyVal = 1440, MapList = {"蟠桃园"}},
	--品质2
	['代理七仙女'] = {Show = 44,CustomCurrency = 21802, ItemNum = 30, MapList = {"蟠桃园"}},
	['代理小花仙'] = {Show = 45, MapList = {"蟠桃园"}},
	['代理冥焰火凤'] = {Show = 46, MapList = {"丹炉地宫二层","丹炉地宫四层","丹炉地宫七层"}},
	['代理巨灵神'] = {Show = 47, MapList = {"天界"}},
	['代理天神石像'] = {Show = 48, MapList = {"遗址地宫六层"}},
	['代理水帘妖'] = {Show = 49, MapList = {"解阳山","水帘洞窟六层","水帘洞窟七层"}},
	['代理水判官'] = {Show = 50, MapList = {"大唐境外","砂城遗址"}},
	--品质3
	['代理虎力大仙'] = {Show = 51, CustomCurrency = 30510, ItemNum = 1, Desc = "天书合成，大雁塔副本"},
	['代理黄风怪'] = {Show = 52, CustomCurrency = 30510, ItemNum = 1, Desc = "天书合成，大雁塔副本"},
	['代理黑风怪'] = {Show = 53, CustomCurrency = 30510, ItemNum = 1, Desc = "天书合成，大雁塔副本"},
	['代理春十三娘'] = {Show = 54, CustomCurrency = 30510, ItemNum = 1, Desc = "天书合成，大雁塔副本"},
	['代理地涌夫人'] = {Show = 55, CustomCurrency = 30510, ItemNum = 1, Desc = "天书合成，大雁塔副本"},
	--品质4
	['代理如意真仙'] = {Show = 56, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理罗刹女'] = {Show = 57, CustomCurrency = 30520, ItemNum = 99, Desc = "充值活动奖励"},	--
	['代理程咬金'] = {Show = 58, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理鹿力大仙'] = {Show = 59, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理混世魔王'] = {Show = 60, CustomCurrency = 30520, ItemNum = 99, Desc = "登录奖励"},--
	['代理羊力大仙'] = {Show = 61, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理白无常'] = {Show = 62, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理黑无常'] = {Show = 63, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理李靖'] = {Show = 64, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	['代理金池长老'] = {Show = 65, CustomCurrency = 30520, ItemNum = 99, Desc = "神兽碎片合成，商城购买"},
	--品质5
	['代理敖丙'] = {Show = 66, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理唐僧'] = {Show = 67, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理红孩儿'] = {Show = 68, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理龙王'] = {Show = 69, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理九尾狐狸'] = {Show = 70, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理沙和尚'] = {Show = 71, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	['代理猪八戒'] = {Show = 72, CustomCurrency = 30521, ItemNum = 60, Desc = "秒杀获得"},
	
	['代理喵呜咪'] = {Show = 73, CustomCurrency = 30521, ItemNum = 60, Desc = "充值积分抽奖"},
	['代理小麒麟'] = {Show = 74, CustomCurrency = 30521, ItemNum = 30, Desc = "商城购买"},
	['代理碧浪公主'] = {Show = 75, CustomCurrency = 30521, ItemNum = 60, Desc = "充值积分抽奖"},
	['代理丹熏鼠'] = {Show = 76, CustomCurrency = 30521, ItemNum = 60, Desc = "充值积分抽奖"},
	['代理火纹麟'] = {Show = 77, CustomCurrency = 30521, ItemNum = 30, Desc = "商城购买"},
	['代理三生蝶'] = {Show = 78, CustomCurrency = 30521, ItemNum = 60, Desc = "充值积分抽奖"},
	['代理森林贤者'] = {Show = 79, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理天行卫'] = {Show = 80, CustomCurrency = 30521, ItemNum = 30, Desc = "商城购买"},
	['代理无极熊猫'] = {Show = 81, CustomCurrency = 30521, ItemNum = 30, Desc = "商城购买"},
	['代理凝月童子'] = {Show = 82, CustomCurrency = 30521, ItemNum = 50, Desc = "商城购买"},
	['代理白泽'] = {Show = 83, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理至尊宝'] = {Show = 84, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理灵吉菩萨'] = {Show = 85, CustomCurrency = 30521, ItemNum = 50, Desc = "商城购买"},
	['代理九灵元圣'] = {Show = 86, CustomCurrency = 30521, ItemNum = 50, Desc = "商城购买"},
	['代理孟婆'] = {Show = 87, CustomCurrency = 30521, ItemNum = 50, Desc = "商城购买"},
	['代理白骨夫人'] = {Show = 88, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理灵感大王'] = {Show = 89, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理银角大王'] = {Show = 90, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理牛魔王'] = {Show = 91, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理杨戬'] = {Show = 92, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理水德真君'] = {Show = 93, CustomCurrency = 30521, ItemNum = 60, Desc = "商城购买"},
	['代理观音菩萨'] = {Show = 94, CustomCurrency = 21804, ItemNum = 30, Desc = "银流光宝鉴"},
	['代理镇元子'] = {Show = 95, CustomCurrency = 21804, ItemNum = 30, Desc = "银流光宝鉴"},
	['代理太上老君'] = {Show = 96, CustomCurrency = 21804, ItemNum = 30, Desc = "银流光宝鉴"},
	['代理哪吒'] = {Show = 97, CustomCurrency = 21804, ItemNum = 15, Desc = "银流光宝鉴"},
	['代理金角大王'] = {Show = 98, CustomCurrency = 21804, ItemNum = 30, Desc = "银流光宝鉴"},
	['代理金翅大鹏王'] = {Show = 99, CustomCurrency = 21805, ItemNum = 50, Desc = "充值活动奖励"},
	['代理刑天'] = {Show = 100, CustomCurrency = 21805, ItemNum = 50, Desc = "充值活动奖励"},
	['代理天玄仙'] = {Show = 101, CustomCurrency = 21805, ItemNum = 50, Desc = "充值活动奖励"},
	['代理孙悟空'] = {Show = 102, CustomCurrency = 21805, ItemNum = 50, Desc = "充值活动奖励"},
	['代理神兽猪'] = {Show = 103, CustomCurrency = 30521, ItemNum = 60, Desc = "充值活动奖励"},
	['代理神兽狗'] = {Show = 104, CustomCurrency = 30521, ItemNum = 60, Desc = "充值活动奖励"},
	['代理神兽牛'] = {Show = 105, CustomCurrency = 30521, ItemNum = 60, Desc = "充值活动奖励"},
	['代理神兽羊'] = {Show = 106, CustomCurrency = 30521, ItemNum = 60, Desc = "充值活动奖励"},
	['代理神兽虎'] = {Show = 107, CustomCurrency = 30521, ItemNum = 60, Desc = "充值活动奖励"},

--	['KEYNAME'] = {Show = 5, CustomCurrency = 21801, ItemNum = 30},
}

function PetManual.GetConfig(player)
	if not PetManual.Processed then
		PetManual.Initialization()
		PetManual.Processed = 1
	end
	if PetManual.Config then
		if Lua_tools then
			--sLuaApp:LuaDbg("表单回馈")
			local str = [[ if PetBookUI then
					PetBookUI.GetConfig(]] .. Lua_tools.serialize(PetManual.Config) .. [[)
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function PetManual.Purchase(player, petKey)
	local tb_Buy = PetManual.Config[petKey]
	if not tb_Buy then
		sLuaApp:NotifyTipsMsg(player, "没有指定的购买对象")
		return
	end
	if Lua_tools.GetPetBagFree(player) <= 0 then
		sLuaApp:NotifyTipsMsg(player, "你没有更多的宠物栏位了")
		return
	end
	if tb_Buy.MoneyType and tb_Buy.MoneyVal then
		if Lua_tools.SubMoney(player, tb_Buy.MoneyType, tb_Buy.MoneyVal, "system", "宠物图鉴", "购买宠物 "..petKey) == true then
			Lua_tools.GiveGoods(player, {PetList = {petKey,0}}, "system", "宠物图鉴", "购买宠物 "..petKey)
			sLuaApp:NotifyTipsMsg(player, "购买成功！")
			return
		else
			sLuaApp:NotifyTipsMsg(player, "钱币不足，购买失败！")
			return
		end
	elseif tb_Buy.CustomCurrency and tb_Buy.ItemNum then		
		if sItemSystem:ConsumeItemWithId(player, tb_Buy.CustomCurrency, tb_Buy.ItemNum, 3, "system", "宠物图鉴", "购买宠物 "..petKey) == 0 then
			Lua_tools.GiveGoods(player, {PetList = {petKey,0}}, "system", "宠物图鉴", "购买宠物 "..petKey)
			sLuaApp:NotifyTipsMsg(player, "购买成功！")
			return
		else
			sLuaApp:NotifyTipsMsg(player, "钱币不足，购买失败！")
			return
		end
	end
	sLuaApp:NotifyTipsMsg(player, "无法购买该宠物！")
end



function PetManual.Initialization()
	for k,v in pairs(PetManual.Config) do
		local petData = PetConfig.GetByKeyName(k)
		if petData then
			local petID = petData.Id
			if NpcPathfinding.petList[petID] then
				v.Pathfinding = NpcPathfinding.petList[petID]
			end
		end
	end
end