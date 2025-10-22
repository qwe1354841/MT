--VIP配置
--[[
	配置说明
	lvup_exp 		--当前等级下，攒够多少经验能提升至下一级
	gift_lvup		--提升到当前等级后，玩家可领取的宝箱奖励内容（内容规则为道具keyname序列，复数道具在序列的后一位补上该道具的数量）
		-	Item_list	--每次可领取的奖励内容（道具keyname,数量,是否绑定）-1表示绑定
		-	MoneyType	--购买礼包货币类型 （MoneyType或MoneyVal缺失或MoneyVal <= 0时，表示礼包免费）
		-	MoneyVal	--购买价格
		-	ShowMoneyVal--显示价格
	gift_Periodic	--该等级每日/每周/每月 礼包配置
		-	Item_list	--每次可领取的奖励内容（内容规则为道具keyname序列，复数道具在序列的后一位补上该道具的数量）
		-	Payment		--领取周期，可选择Daily,Weekly或Monthly
		-	MoneyType	--购买礼包货币类型 （MoneyType或MoneyVal缺失或MoneyVal <= 0时，表示礼包免费）
		-	MoneyVal	--购买价格
		-	ShowMoneyVal--显示价格
	add_buff		--VIP 加属性buff
		-	attr_name	--attr表KeyName
		-	attr_val	--attr数值 凡百分比都是万分比
	welfare			--VIP等级福利
		-	name		--福利名称，无作用，便于配置人员分辨功能
		-	describe	--在客户端VIP界面中显示的福利文字
		-	camp		--当填string值时，为活动标识，匹配指定的类型活动；当填int值时，为活动编号，匹配指定的活动ID。
		-	tar			--福利类型， times 为可参与次数调整；reward 为活动奖励数值调整
		-	mod			--福利模式， add 为在原有基础上增加，	multiply 为在原有基础上乘倍
		-	param		--增加的数值或乘倍的倍数

	VipConfig.send_tb	--发送给客户端显示用
]]
VipConfig={}
VipConfig.Version="0825_00"--版本号


VipConfig.main = {
	vip0 = {
		lvup_exp = 2000,
		gift_lvup = {
			Item_list = {"更名卡",1,0,"解锁背包栏位",1,0,"解锁仓库栏位",1,0},
			MoneyType = 1,
			MoneyVal = 7000,
			ShowMoneyVal = 29000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",20,1,"血池3",2,1,"魔池3",2,1,"活动辅助丹",2,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 4000,
			ShowMoneyVal = 5000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得12000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 12000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得40次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 0},
	--		{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升10%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.1},
	--	{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升10%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.1},
		}
	},
	vip1 = {
		lvup_exp = 8000,
		gift_lvup = {
			Item_list = {"装备强化石",50,0,"解锁宠物栏位",1,0,"解锁宠物仓库栏位",1,0},
			MoneyType = 1,
			MoneyVal = 7000,
			ShowMoneyVal = 29000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",30,1,"宝石福袋",5,1,"小修炼丹",5,1,"活动辅助丹",3,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 6800,
			ShowMoneyVal = 13600,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得13000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 13000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得55次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 15},
		}
	},
	vip2 = {
		lvup_exp = 10000,
		gift_lvup = {
			Item_list = {"5级暴击石",2,0,"强化打造石1",10,0,"强化保固石",20,0,"装备强化石",50,0,"中银币袋",1,0},
			MoneyType = 1,
			MoneyVal = 9400,
			ShowMoneyVal = 94000,
		},
		gift_Periodic = {
			Item_list = {"金角大王信物",50,1,"宝石福袋",10,1,"65级护符物攻蓝",1,1,"65级护符法攻蓝",1,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 19800,
			ShowMoneyVal = 66000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得14000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 14000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得60次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 20},
		}
	},
	vip3 = {
		lvup_exp = 20000,
		gift_lvup = {
			Item_list = {"金翅大鹏王信物",50,0,"SR礼包",20,0,"高级宝石福袋",10,0,"65级项圈紫",1,0,"高级蛮力秘籍",1,0},
			MoneyType = 1,
			MoneyVal = 16600,
			ShowMoneyVal = 166000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",60,1,"宝石福袋",15,1,"高级还原丹",1,1,"65级盔甲物防蓝",1,1,"65级盔甲法防蓝",1,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 19200,
			ShowMoneyVal = 64000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得15000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 15000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得65次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 25},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升5%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.05},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升5%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.05},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip4 = {
		lvup_exp = 60000,
		gift_lvup = {
			Item_list = {"强化打造石1",20,0,"SSR礼包",10,0,"装备强化石",100,0,"大银币袋",1,0,"高级连击秘籍",1,0},
			MoneyType = 1,
			MoneyVal = 31200,
			ShowMoneyVal = 312000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",80,1,"高级宝石福袋",5,1,"高级还原丹",2,1,"小修炼丹",10,1,"特技卷轴礼盒2",5,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 39980,
			ShowMoneyVal = 146000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得16600银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 16600},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得70次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 30},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升10%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.1},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升10%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.1},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高1次", camp = "天梯次数", tar = "times", mod = "add", param = 1},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip5 = {
		lvup_exp = 100000,
		gift_lvup = {
			Item_list = {"随机神兽碎片",10,0,"普通宠物秘籍包",10,0,"宠物经验丹",10,0,"修炼丹",10,0,"高级宝石福袋",20,0},
			MoneyType = 1,
			MoneyVal = 26000,
			ShowMoneyVal = 260000,
		},
		gift_Periodic = {
			Item_list = {"金角大王信物",100,1,"高级宝石福袋",6,1,"高级还原丹",2,1,"宝宝吞噬宠物",1,1,"特效卷轴礼盒1",5,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 56000,
			ShowMoneyVal = 188000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得18200银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 18200},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得75次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 35},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升10%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.1},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升10%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.1},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高1次", camp = "天梯次数", tar = "times", mod = "add", param = 1},
		--	{name = "提高护送次数", describe = "每日的护送次数提高1次", camp = "护送次数", tar = "times", mod = "add", param = 1},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		}
	},
	vip6 = {
		lvup_exp = 200000,
		gift_lvup = {
			Item_list = {"金翅大鹏王信物",50,0,"装备强化石2",10,0,"强化保固石",20,0,"高级宝石福袋",20,0,"高级神佑秘籍",1,0},
			MoneyType = 1,
			MoneyVal = 27200,
			ShowMoneyVal = 272000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",120,1,"高级宝石福袋",7,1,"高级还原丹",3,1,"宝宝吞噬宠物",2,1,"修炼丹",3,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 56000,
			ShowMoneyVal = 192000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得19800银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 19800},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得80次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 40},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升20%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.2},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升20%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.2},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高1次", camp = "天梯次数", tar = "times", mod = "add", param = 1},
		--	{name = "提高护送次数", describe = "每日的护送次数提高1次", camp = "护送次数", tar = "times", mod = "add", param = 1},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		}
	},
	vip7 = {
		lvup_exp = 600000,
		gift_lvup = {
			Item_list = {"解锁背包栏位",2,0,"普通宠物秘籍包",15,0,"大银币袋",1,0,"修炼丹",25,0,"高级必杀秘籍",1,0},
			MoneyType = 1,
			MoneyVal = 22400,
			ShowMoneyVal = 224000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",140,1,"高级宝石福袋",8,1,"高级还原丹",3,1,"变异吞噬宠物",1,1,"修炼丹",5,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 56000,
			ShowMoneyVal = 208000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得22000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 22000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得80次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 40},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升20%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.2},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升20%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.2},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高2次", camp = "天梯次数", tar = "times", mod = "add", param = 2},
		--	{name = "提高护送次数", describe = "每日的护送次数提高1次", camp = "护送次数", tar = "times", mod = "add", param = 1},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		}
	},
	vip8 = {
		lvup_exp = 1000000,
		gift_lvup = {
			Item_list = {"随机神兽碎片",15,0,"SSR礼包",20,0,"装备强化石2",40,0,"强化打造石1",20,0,"7级生命石",1,0},
			MoneyType = 1,
			MoneyVal = 26800,
			ShowMoneyVal = 268000,
		},
		gift_Periodic = {
			Item_list = {"金角大王信物",150,1,"高级宝石福袋",9,1,"高级还原丹",4,1,"变异吞噬宠物",2,1,"修炼丹",8,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 59980,
			ShowMoneyVal = 294000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得24000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 24000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得80次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 40},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升30%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.3},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升30%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.3},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高2次", camp = "天梯次数", tar = "times", mod = "add", param = 2},
		--	{name = "提高护送次数", describe = "每日的护送次数提高1次", camp = "护送次数", tar = "times", mod = "add", param = 1},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		},
	},
	vip9 = {
		lvup_exp = 2000000,
		gift_lvup = {
			Item_list = {"金翅大鹏王信物",100,0,"高级宠物秘籍包",5,0,"阵法礼包",3,0,"修炼丹",30,0,"7级暴击石",1,0},
			MoneyType = 1,
			MoneyVal = 23400,
			ShowMoneyVal = 234000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",180,1,"高级宝石福袋",10,1,"高级还原丹",4,1,"宝宝吞噬宠物1",1,1,"修炼丹",10,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 56000,
			ShowMoneyVal = 268000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得26000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 26000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得80次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 40},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升30%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.3},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升30%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.3},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高2次", camp = "天梯次数", tar = "times", mod = "add", param = 2},
		--	{name = "提高护送次数", describe = "每日的护送次数提高2次", camp = "护送次数", tar = "times", mod = "add", param = 2},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip10 = {
		lvup_exp = 2000000,
		gift_lvup = {
			Item_list = {"随机神兽碎片",25,0,"极品宝石福袋",1,0,"SSR礼包",30,0,"合成大幸运符",3,0,"超级必杀秘籍",1,0},
			MoneyType = 1,
			MoneyVal = 22800,
			ShowMoneyVal = 228000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",200,1,"高级宝石福袋",12,1,"高级还原丹",5,1,"变异吞噬宠物1",1,1,"修炼丹",12,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 70000,
			ShowMoneyVal = 324000,
		},
		add_buff = {
			--{attr_name = "生命值上限百分比", attr_val = 500}
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得28000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 28000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升50%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.5},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升50%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.5},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高3次", camp = "天梯次数", tar = "times", mod = "add", param = 3},
		--	{name = "提高护送次数", describe = "每日的护送次数提高2次", camp = "护送次数", tar = "times", mod = "add", param = 2},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得2次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 1},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip11 = {
		lvup_exp = 4000000,
		gift_lvup = {
			Item_list = {"装备强化石2",100,0,"祈福卷轴3",30,0,"高级藏宝图",3,0,"特技卷轴礼盒4",5,0,"特效卷轴礼盒3",5,0},
			MoneyType = 1,
			MoneyVal = 20800,
			ShowMoneyVal = 208000,
		},
		gift_Periodic = {
			Item_list = {"金角大王信物",250,1,"高级宝石福袋",14,1,"高级还原丹",5,1,"变异吞噬宠物1",2,1,"修炼丹",15,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 90000,
			ShowMoneyVal = 450000,
		},
		add_buff = {
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得30000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 30000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升50%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.5},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升50%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.5},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高3次", camp = "天梯次数", tar = "times", mod = "add", param = 3},
		--	{name = "提高护送次数", describe = "每日的护送次数提高2次", camp = "护送次数", tar = "times", mod = "add", param = 2},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得3次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 2},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得1.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 1.5},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip12 = {
		lvup_exp = 10000000,
		gift_lvup = {
			Item_list = {"金翅大鹏王信物",150,0,"极品宝石福袋",5,0,"高级宠物秘籍包",10,0,"阵法礼包",10,0,"8级生命石",1,0},
			MoneyType = 1,
			MoneyVal = 99999,
			ShowMoneyVal = 1000000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",240,1,"高级宝石福袋",16,1,"高级还原丹",6,1,"变异吞噬宠物1",3,1,"修炼丹",20,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 80000,
			ShowMoneyVal = 436000,
		},
		add_buff = {
		--	{attr_name = "生命值上限百分比", attr_val = 1000}
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得33000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 33000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升50%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.5},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升50%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.5},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高3次", camp = "天梯次数", tar = "times", mod = "add", param = 3},
		--	{name = "提高护送次数", describe = "每日的护送次数提高2次", camp = "护送次数", tar = "times", mod = "add", param = 2},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得3次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 2},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得2倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 2},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip13 = {
		lvup_exp = 10000000,
		gift_lvup = {
			Item_list = {"特技卷轴礼盒5",5,0,"特效卷轴礼盒5",5,0,"强化打造石1",50,0,"SSR礼包",50,0,"8级暴击石",1,0},
			MoneyType = 1,
			MoneyVal = 79999,
			ShowMoneyVal = 800000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",260,1,"高级宝石福袋",18,1,"高级还原丹",8,1,"变异吞噬宠物2",1,1,"修炼丹",30,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 99999,
			ShowMoneyVal = 544000,
		},
		add_buff={
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得36000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 36000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升50%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 1.5},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升50%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 1.5},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高4次", camp = "天梯次数", tar = "times", mod = "add", param = 4},
		--	{name = "提高护送次数", describe = "每日的护送次数提高2次", camp = "护送次数", tar = "times", mod = "add", param = 2},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得3次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 2},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得2倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 2},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip14 = {
		lvup_exp = 10000000,
		gift_lvup = {
			Item_list = {"强化打造石1",100,0,"高级藏宝图",10,0,"祈福卷轴3",50,0,"随机神兽碎片",40,0,"大银币袋",5,0},
			MoneyType = 1,
			MoneyVal = 174000,
			ShowMoneyVal = 1740000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",280,1,"高级宝石福袋",20,1,"高级还原丹",10,1,"变异吞噬宠物2",2,1,"修炼丹",40,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 120000,
			ShowMoneyVal = 660000,
		},
		add_buff={
		--	{attr_name = "生命值上限百分比", attr_val = 2000}
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得39000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 39000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升100%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 2},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升100%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 2},
		--	{name = "提高天梯次数", describe = "每日的天梯次数提高4次", camp = "天梯次数", tar = "times", mod = "add", param = 4},
		--	{name = "提高护送次数", describe = "每日的护送次数提高3次", camp = "护送次数", tar = "times", mod = "add", param = 3},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得3次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 2},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得2倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 2},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	},
	vip15 = {
		lvup_exp = 0,
		gift_lvup = {
			Item_list = {"金翅大鹏王信物",250,0,"极品宝石福袋",10,0,"特技卷轴礼盒5",10,0,"特效卷轴礼盒5",10,0,"随机神兽碎片",99,0},
			MoneyType = 1,
			MoneyVal = 199999,
			ShowMoneyVal = 2100000,
		},
		gift_Periodic = {
			Item_list = {"筋斗云",300,1,"高级宝石福袋",25,1,"高级还原丹",15,1,"变异吞噬宠物3",1,1,"修炼丹",50,1},
			Payment = "Daily",			--可选择Daily,Weekly或Monthly
			MoneyType = 2,
			MoneyVal = 177760,
			ShowMoneyVal = 891200,
		},
		add_buff={
			
		},
		welfare = {
			{name = "提高每日可获取的活动银元宝", describe = "参与每日活动最多可获得42000银元宝。", camp = "可获得银元宝数量", tar = "value", mod = "add", param = 42000},
			{name = "提高闹事的妖怪奖励次数", describe = "每日可获得100次闹事的妖怪奖励。", camp = "闹事的妖怪奖励次数", tar = "times", mod = "add", param = 60},
			{name = "提高闹事的妖怪经验奖励", describe = "闹事的妖怪奖励经验提升100%。", camp = "闹事的妖怪经验提升", tar = "value", mod = "multiply", param = 2},
			{name = "提高闹事的妖怪银币奖励", describe = "闹事的妖怪奖励银币提升100%。", camp = "闹事的妖怪银币提升", tar = "value", mod = "multiply", param = 2},
			--{name = "提高天梯次数", describe = "每日的天梯次数提高5次", camp = "天梯次数", tar = "times", mod = "add", param = 5},
			--{name = "提高护送次数", describe = "每日的护送次数提高3次", camp = "护送次数", tar = "times", mod = "add", param = 3},
			{name = "提高副本奖励次数", describe = "每日所有副本均可获得3次奖励。", camp = "副本奖励次数", tar = "times", mod = "add", param = 2},
			{name = "提高抓鬼经验", describe = "每日降妖和伏魔可获得2.5倍经验。", camp = "抓鬼经验", tar = "reward", mod = "multiply", param = 2.5},
		--	{name = "提高秘境重置次数", describe = "每日所有秘境均可被重置2次。", camp = "秘境重置次数", tar = "times", mod = "add", param = 1},
		}
	}
}
function VipConfig.Initialization()
	if not Lua_tools then
		require("system/Lua_tools")
	end
	VipConfig.send_tb = {}
	if Lua_tools then
		for i=0,Lua_tools.tablecount(VipConfig.main)-1 ,1 do
			VipConfig.send_tb['vip'..i]={}
			VipConfig.send_tb['vip'..i]['lvup_exp'] = VipConfig.main['vip'..i]['lvup_exp']
			VipConfig.send_tb['vip'..i]['gift_lvup'] = VipConfig.main['vip'..i]['gift_lvup']
			VipConfig.send_tb['vip'..i]['gift_Periodic'] = VipConfig.main['vip'..i]['gift_Periodic']
			VipConfig.send_tb['vip'..i]['describe']={}
			for a=1, #VipConfig.main['vip'..i]['welfare'] do
				VipConfig.send_tb['vip'..i]['describe'][a] = VipConfig.main['vip'..i]['welfare'][a]['describe']
			end	
		end
	end
	VipConfig.MaxVipLevel = Lua_tools.tablecount(VipConfig.main)-1
end


VipConfig.Initialization()