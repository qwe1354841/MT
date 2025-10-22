--开关 Shadow_Yong
FunctionSwitch = {}

FunctionSwitch.AllFuncitonConfig = {
	["Guidance"] = "on",					--引导开关
	['Function_Switch_HostActor'] = "rr",	--虚假繁荣
	
	['DailyOnline'] = "on",					--每日在线
	['LevelPackage'] = "on",				--等级礼包
	['DailySign'] = "on",					--每日登陆
	['Discount'] = "on",					--限时折扣
	['FriendInvitation'] = "on",            --好友邀请
	['FriendInvited'] = "on",               --被邀请奖励

	['GuildGuardian'] = "on",				--帮派守护

	['Pray'] = "on",						--祈福

	['Exchange'] = "on",				    --商会
	["ExchangeAllServerLimit"] = "on",		--商会全服限购

	['EquipCreat'] = "on",					--装备打造
	['EquipIntensify'] = "on",				--装备强化
	['EquipArtifice'] = "on",				--装备炼化
	['EquipGem'] = "on",					--装备宝石玩法

	['PetEquip'] = "on",					--宠物装备
	['PetEquipArtifice'] = "on",			--宠物装备洗练
	['PetEquipIntensify'] = "on",			--宠物装备强化
	['PetFlyUp'] = "on",					--宠物飞升
	['PetUpStar'] = "on",					--宠物突破
	
	['GodAnimal'] = "on",					--异兽录
	['ChanYiDaFuWeng'] = "on",				--禅意大富翁
	['XianShouFuYuan'] = "on",				--仙兽福缘
	
	['FirstRecharge'] = "on",				--首充	
	['VIP'] = "on",							--VIP
	['SevenDay'] = "on",					--七日庆典
	
	['ServerLevel'] = 'on',					--服务器等级
	['PlayerExpCorrect'] = 'on',			--玩家经验获取修正，请配合服务器等级使用
	['PetExpCorrect'] = 'on',				--宠物经验获取修正，请配合服务器等级使用
	
	['DiscountShop'] = 'on',				--特惠商店
	['Suit'] = "on"		,					--套装
	['HangUp'] = "on"		,				--挂机
	['Repair'] =  "on",						--修理
	['RepairAll'] =  "on",					--全部修理，配合修理开关使用，修理关闭时，修理无论开启还是关闭都不生效
	['EquipSpecialEffect'] =  "on",			--装备特技装备特效
	['VipIngotTrace'] = 'on',				--VIP每日活动元宝追踪
	
	['TeamHost'] = 'on',					--组队机器人
	['ExchangeShopTimeLimit'] = 'on',		--兑换商店限时
	
	['IntegralPK'] = 'on',					--战力大比拼

	['GuardIsShowed'] = 'on',				--场景侍从显示
	['Act_RankList'] = 'off'	,			--开服冲榜
	
	['Trade'] = 'off',						--贸易活动

	['BinGo'] = 'on',						--五星连珠活动
	['ActivityCollect'] = 'off',            --集印章赢大奖活动

	['QuestionsAnswersElfSwitch'] = 'on',	--游戏Q&A小精灵

	['GuardMingHun'] = 'on',				--侍从命魂玩法
	
	['GemExchange'] = 'off',				--宝石兑换玩法

	['FaceDeal'] = 'off',					--面对面交易
	
	['ChatRoll'] = 'on',					--聊天频道ROLL点
	
	['AutomaticCasting'] = 'on',			--自动战斗功能
	
	['WarehouseClassify'] = 'on',			--仓库分页

	['Mount'] = 'on',						--坐骑

	['ChatBlacklist'] = 'on',				--加入黑名单后聊天界面不显示

	['EquipPlan'] = 'off',					--装备方案

	['MallFree'] = 'off',					--商城免单
	
	['Act_CrossServer'] = 'on',				--跨服战

	['Stall'] = 'on',						--摆摊

	['EquipSoulReforge'] = 'on',			--洗灵

	["ClientUpdate"] = 'off',				--客户端版本检查更新
}

function FunctionSwitch.PlayerLoginData(player)
	local str = [[
			UIDefine.FunctionSwitch = ]]..Lua_tools.serialize(FunctionSwitch.AllFuncitonConfig)..[[
			MainSysOpen.SetBtnTimer()
		]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end