--交易所 拍卖功能
AuctionSystem = {}

local AuctionConfig = {
	['Fee'] = "math.floor(1.5*math.pow(Seconds,0.7))",
	['Tax'] = 10,
	['MinPrice_1'] = 10,
	['MinPrice_2'] = 10,
	['MinPrice_4'] = 1000,
	['MinPrice_5'] = 1000,
	['MinPrice_13'] = 10,
	['MinPrice_14'] = 10,
	['Seconds'] = {3600*24*1,3600*24*3,3600*24*5},
	['NumPerPage'] = 8,
	['FeeBy1'] = 5,
	['FeeBy2'] = 5,
	['FeeBy4'] = 5,
	['FeeBy5'] = 5,
	['FeeBy13'] = 5,
	['FeeBy14'] = 5,
	['FirstMoneyType'] = 1,
	['SecondMoneyType'] = 0,
	['PriceBeta'] = "BuyGoldBind",
	['PetPriceBeta'] = "Type",
	['PriceMin'] = "*10",
	['PriceMax'] = "*200",
	['Price2_1'] = "/1000",
	['Price2_2'] = "/1000",
	['Price2_4'] = "/1.8",
	['Price2_5'] = "",
	['Price2_13'] = "/1000",
	['Price2_14'] = "",
	['MaxCollectionNum'] = 8,
	['MaxItemSelling'] = 10,
	['MaxPetSelling'] = 5,
	['AdderItemSelling'] = 10,
	['AdderPetSelling'] = 10,
	['MaxPrice'] = 200000000,
	['ReadMe'] = "1.手续费：与上架时间和上架物品数量有关\n2.交易税：玩家售价*10%\n3.初始上架格子：道具*10、宠物*5\n   最大上架格子：道具*20、宠物*10\n   可以通过解锁获得更多的格子。\n4.交易行中下架道具仅保留一个月，过期删除",
}

--宠物拍卖价格
local AuctionPetConfig = {
	['Grade1'] = {
		[1] = {Min = 1, Max = 200},
		[2] = {Min = 2, Max = 200},
		[3] = {Min = 3, Max = 200},
		[4] = {Min = 4, Max = 200},
		[5] = {Min = 5, Max = 200},
		[6] = {Min = 6, Max = 200},
	},
	['Grade2'] = {
		[1] = {Min = 11, Max = 200},
		[2] = {Min = 12, Max = 200},
		[3] = {Min = 13, Max = 200},
		[4] = {Min = 14, Max = 200},
		[5] = {Min = 15, Max = 200},
		[6] = {Min = 16, Max = 200},
	},
	['Grade3'] = {
		[1] = {Min = 21, Max = 200},
		[2] = {Min = 22, Max = 200},
		[3] = {Min = 23, Max = 200},
		[4] = {Min = 24, Max = 200},
		[5] = {Min = 25, Max = 200},
		[6] = {Min = 26, Max = 200},
	},
	['Grade4'] = {
		[1] = {Min = 31, Max = 200},
		[2] = {Min = 32, Max = 200},
		[3] = {Min = 33, Max = 200},
		[4] = {Min = 34, Max = 200},
		[5] = {Min = 35, Max = 200},
		[6] = {Min = 36, Max = 200},
	},
	['Grade5'] = {
		[1] = {Min = 41, Max = 200},
		[2] = {Min = 42, Max = 200},
		[3] = {Min = 43, Max = 200},
		[4] = {Min = 44, Max = 200},
		[5] = {Min = 45, Max = 200},
		[6] = {Min = 46, Max = 200},
	},
}

--Fee 上架手续费(公式)
--Tax 交易税(百分比)
--MinPrice_1 最低金元
--MinPrice_1 最低金元
--MinPrice_2 最低银元
--MinPrice_4 最低金币
--MinPrice_5 最低银币
--Seconds 上架时间
--NumPerPage 每页物品数量
--（货币类型 1金元宝 2银元宝 4金币 5银币）
--FeeBy1 金元宝商城手续费扣减的货币类型
--FeeBy2 银元宝商城手续费扣减的货币类型
--FeeBy4 金币商城手续费扣减的货币类型
--FeeBy5 银币商城手续费扣减的货币类型
--FirstMoneyType 第一拍卖行的货币类型
--SecondMoneyType 第二拍卖行的货币类型
--PriceBeta 基础价格
--PetPriceBeta 宠物的基础价格
--PriceMin 最低指导价（基于基础价格）
--PriceMax 最高指导价（基于基础价格）
--Price2_1 价格变成金元时的价格变化
--Price2_2 价格变成银元时的价格变化
--Price2_4 价格变成金币时的价格变化
--Price2_5 价格变成银币时的价格变化
--MaxItemSelling 初始最大道具栏位
--MaxPetSelling 初始最大宠物栏位
--AdderItemSelling 额外最大道具栏位
--AdderPetSelling 额外最大宠物栏位

local CategoryList = {

  ["银币"] = {
  
		[1] =  {Name = "银币袋子100万", Icon = "1900015490", ItemList = {1}},
		[2] =  {Name = "银币袋子200万", Icon = "1900015490", ItemList = {2}},
		[3] =  {Name = "银币袋子500万", Icon = "1900015490", ItemList = {3}},
		[4] =  {Name = "银币袋子1000万", Icon = "1900015490", ItemList = {4}},
		[5] =  {Name = "银币袋子2000万", Icon = "1900015490", ItemList = {5}},
		[6] =  {Name = "银币袋子5000万", Icon = "1900015490", ItemList = {6}}
  
  
  },












	["装备"] = {
		[1] =  {Name = "重剑", Icon = "1900292030", Item_Type = 1, Sec_Type = 1, Sec_SubType = 1, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[2] =  {Name = "扇子", Icon = "1900292070", Item_Type = 1, Sec_Type = 1, Sec_SubType = 2, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[3] =  {Name = "笛子", Icon = "1900291010", Item_Type = 1, Sec_Type = 1, Sec_SubType = 3, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[4] =  {Name = "阔刀", Icon = "1900292150", Item_Type = 1, Sec_Type = 1, Sec_SubType = 4, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[5] =  {Name = "毛笔", Icon = "1900292190", Item_Type = 1, Sec_Type = 1, Sec_SubType = 5, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[6] =  {Name = "长枪", Icon = "1900292230", Item_Type = 1, Sec_Type = 1, Sec_SubType = 6, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[7] =  {Name = "爪刺", Icon = "1900292270", Item_Type = 1, Sec_Type = 1, Sec_SubType = 7, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[8] =  {Name = "绣伞", Icon = "1900292310", Item_Type = 1, Sec_Type = 1, Sec_SubType = 8, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[9] =  {Name = "短杖", Icon = "1900292350", Item_Type = 1, Sec_Type = 1, Sec_SubType = 9, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[10] = {Name = "弓箭", Icon = "1900292390", Item_Type = 1, Sec_Type = 1, Sec_SubType = 10, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[11] = {Name = "双剑", Icon = "1900292430", Item_Type = 1, Sec_Type = 1, Sec_SubType = 11, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[12] = {Name = "长鞭", Icon = "1900292470", Item_Type = 1, Sec_Type = 1, Sec_SubType = 12, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[13] = {Name = "头盔", Icon = "1900292500", Item_Type = 1, Sec_Type = 2, Sec_SubType = 1, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 1},
		[14] = {Name = "护甲", Icon = "1900292580", Item_Type = 1, Sec_Type = 2, Sec_SubType = 2, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 1},
		[15] = {Name = "护腰", Icon = "1900292660", Item_Type = 1, Sec_Type = 2, Sec_SubType = 3, minGrade = 3, maxGrade = 5, LevelType = 1, SexType = 0},
		[16] = {Name = "靴子", Icon = "1900292730", Item_Type = 1, Sec_Type = 3, Sec_SubType = 4, minGrade = 3, maxGrade = 5, LevelType = 1, SexType = 0},
		[17] = {Name = "护腕", Icon = "1900292760", Item_Type = 1, Sec_Type = 3, Sec_SubType = 3, minGrade = 3, maxGrade = 5, LevelType = 1, SexType = 0},
		[18] = {Name = "戒指", Icon = "1900292790", Item_Type = 1, Sec_Type = 3, Sec_SubType = 1, minGrade = 3, maxGrade = 5, LevelType = 1, SexType = 0},
		[19] = {Name = "项链", Icon = "1900292820", Item_Type = 1, Sec_Type = 3, Sec_SubType = 2, minGrade = 3, maxGrade = 5, LevelType = 1, SexType = 0},
		[20] = {Name = "挂坠", Icon = "1900292700", Item_Type = 1, Sec_Type = 2, Sec_SubType = 5, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
		[21] = {Name = "法宝", Icon = "1900001320", Item_Type = 1, Sec_Type = 4, Sec_SubType = 0, minGrade = 3, maxGrade = 5, LevelType = 2, SexType = 0},
	},
	["制造书"] = {
		--[1] =  {Name = "制造书·珍品", Icon = "1900001000", Item_Type = 3, Sec_Type = 7, Sec_SubType = 0, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[1] =  {Name = "制造书·重剑", Icon = "1900000790", Item_Type = 3, Sec_Type = 7, Sec_SubType = 1, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[2] =  {Name = "制造书·扇子", Icon = "1900000800", Item_Type = 3, Sec_Type = 7, Sec_SubType = 2, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[3] =  {Name = "制造书·笛子", Icon = "1900000810", Item_Type = 3, Sec_Type = 7, Sec_SubType = 3, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[4] =  {Name = "制造书·阔刀", Icon = "1900000820", Item_Type = 3, Sec_Type = 7, Sec_SubType = 4, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[5] =  {Name = "制造书·毛笔", Icon = "1900000830", Item_Type = 3, Sec_Type = 7, Sec_SubType = 5, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[6] =  {Name = "制造书·长枪", Icon = "1900000840", Item_Type = 3, Sec_Type = 7, Sec_SubType = 6, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[7] =  {Name = "制造书·爪刺", Icon = "1900000850", Item_Type = 3, Sec_Type = 7, Sec_SubType = 7, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[8] =  {Name = "制造书·绣伞", Icon = "1900000860", Item_Type = 3, Sec_Type = 7, Sec_SubType = 8, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[9] =  {Name = "制造书·短杖", Icon = "1900000870", Item_Type = 3, Sec_Type = 7, Sec_SubType = 9, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[10] = {Name = "制造书·弓箭", Icon = "1900000880", Item_Type = 3, Sec_Type = 7, Sec_SubType = 10, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[11] = {Name = "制造书·双剑", Icon = "1900000890", Item_Type = 3, Sec_Type = 7, Sec_SubType = 11, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[12] = {Name = "制造书·长鞭", Icon = "1900000900", Item_Type = 3, Sec_Type = 7, Sec_SubType = 12, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[13] = {Name = "制造书·男衣", Icon = "1900000910", Item_Type = 3, Sec_Type = 7, Sec_SubType = 13, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[14] = {Name = "制造书·女衣", Icon = "1900000920", Item_Type = 3, Sec_Type = 7, Sec_SubType = 14, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[15] = {Name = "制造书·男帽", Icon = "1900000930", Item_Type = 3, Sec_Type = 7, Sec_SubType = 15, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[16] = {Name = "制造书·女帽", Icon = "1900000940", Item_Type = 3, Sec_Type = 7, Sec_SubType = 16, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[17] = {Name = "制造书·护腰", Icon = "1900000950", Item_Type = 3, Sec_Type = 7, Sec_SubType = 17, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[18] = {Name = "制造书·挂坠", Icon = "1900000960", Item_Type = 3, Sec_Type = 7, Sec_SubType = 18, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[19] = {Name = "制造书·鞋子", Icon = "1900000970", Item_Type = 3, Sec_Type = 7, Sec_SubType = 19, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[20] = {Name = "制造书·护腕", Icon = "1900000980", Item_Type = 3, Sec_Type = 7, Sec_SubType = 20, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[21] = {Name = "制造书·戒指", Icon = "1900000990", Item_Type = 3, Sec_Type = 7, Sec_SubType = 21, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},
		[22] = {Name = "制造书·项链", Icon = "1900001000", Item_Type = 3, Sec_Type = 7, Sec_SubType = 22, minLevel = 60, maxLevel = 120, LevelType = 2, SexType = 0},	
	},
	 ["宝石"] = {
		 [1] =  {Name = "1级宝石", Icon = "1900910110", Item_Type = 3, Sec_Type = 9, Sec_SubType = 1, LevelType = 0, SexType = 0},
		 [2] =  {Name = "2级宝石", Icon = "1900910220", Item_Type = 3, Sec_Type = 9, Sec_SubType = 2, LevelType = 0, SexType = 0},
		 [3] =  {Name = "3级宝石", Icon = "1900910330", Item_Type = 3, Sec_Type = 9, Sec_SubType = 3, LevelType = 0, SexType = 0},
		 [4] =  {Name = "4级宝石", Icon = "1900910440", Item_Type = 3, Sec_Type = 9, Sec_SubType = 4, LevelType = 0, SexType = 0},
		 [5] =  {Name = "5级宝石", Icon = "1900910550", Item_Type = 3, Sec_Type = 9, Sec_SubType = 5, LevelType = 0, SexType = 0},
		 [6] =  {Name = "6级宝石", Icon = "1900910660", Item_Type = 3, Sec_Type = 9, Sec_SubType = 6, LevelType = 0, SexType = 0},
		 [7] =  {Name = "7级宝石", Icon = "1900910770", Item_Type = 3, Sec_Type = 9, Sec_SubType = 7, LevelType = 0, SexType = 0},
		 [8] =  {Name = "8级宝石", Icon = "1900910180", Item_Type = 3, Sec_Type = 9, Sec_SubType = 8, LevelType = 0, SexType = 0},
		 [9] =  {Name = "9级宝石", Icon = "1900910290", Item_Type = 3, Sec_Type = 9, Sec_SubType = 9, LevelType = 0, SexType = 0},
		 [10] = {Name = "10级宝石", Icon = "1900920710", Item_Type = 3, Sec_Type = 9, Sec_SubType = 10, LevelType = 0, SexType = 0},
		[11] = {Name = "11级宝石", Icon = "1900920820", Item_Type = 3, Sec_Type = 9, Sec_SubType = 11, LevelType = 0, SexType = 0},
		[12] = {Name = "12级宝石", Icon = "1900920130", Item_Type = 3, Sec_Type = 9, Sec_SubType = 12, LevelType = 0, SexType = 0},
		[13] = {Name = "13级宝石", Icon = "1900920240", Item_Type = 3, Sec_Type = 9, Sec_SubType = 13, LevelType = 0, SexType = 0},
		[14] = {Name = "14级宝石", Icon = "1900920350", Item_Type = 3, Sec_Type = 9, Sec_SubType = 14, LevelType = 0, SexType = 0},
		[15] = {Name = "15级宝石", Icon = "1900920460", Item_Type = 3, Sec_Type = 9, Sec_SubType = 15, LevelType = 0, SexType = 0},
	 },
	["打造强化"] = {
		[1] =  {Name = "打造符", Icon = "1900014730", ItemList = {31051}},
		[2] =  {Name = "缝纫符", Icon = "1900014740", ItemList = {31052}},
		[3] =  {Name = "炼金符", Icon = "1900014750", ItemList = {31053}},
		[4] =  {Name = "60级寒铁", Icon = "1900000630", ItemList = {31036}},
		[5] =  {Name = "70级寒铁", Icon = "1900000630", ItemList = {31037}},
		[6] =  {Name = "80级寒铁", Icon = "1900000630", ItemList = {31038}},
		[7] =  {Name = "90级寒铁", Icon = "1900000630", ItemList = {31501}},
		[8] =  {Name = "100级寒铁", Icon = "1900000630", ItemList = {31502}},
		[9] =  {Name = "110级寒铁", Icon = "1900000630", ItemList = {31503}},
		[10] =  {Name = "120级寒铁", Icon = "1900000630", ItemList = {31504}},
		
		
		-- [11] =  {Name = "10级寒铁", Icon = "1900000630", ItemList = {31031}},
		-- [12] =  {Name = "20级寒铁", Icon = "1900000630", ItemList = {31032}},
		-- [13] =  {Name = "30级寒铁", Icon = "1900000630", ItemList = {31033}},
		-- [14] =  {Name = "40级寒铁", Icon = "1900000630", ItemList = {31034}},
		-- [15] =  {Name = "50级寒铁", Icon = "1900000630", ItemList = {31035}},
		-- [16] =  {Name = "凡品强化石", Icon = "1900013640", Item_Type = 7, Sec_Type = 7, Sec_SubType = 23, LevelType = 0, SexType = 0},
		-- [17] =  {Name = "强化保固石", Icon = "1900001430", Item_Type = 7, Sec_Type = 7, Sec_SubType = 24, LevelType = 0, SexType = 0},
		-- [18] =  {Name = "女娲石", Icon = "1900000600", Item_Type = 7, Sec_Type = 7, Sec_SubType = 25, LevelType = 0, SexType = 0},
		-- [19] =  {Name = "混元石", Icon = "1900013390", ItemList = {31003}},

    },
	["特技卷轴"] = {
		[1] =  {Name = "绿色卷轴", Icon = "1900000340", Item_Type = 3, Sec_Type = 27, Sec_SubType = 0, Grade_Type = 2, LevelType = 0, SexType = 0},
		[2] =  {Name = "蓝色卷轴", Icon = "1900000340", Item_Type = 3, Sec_Type = 27, Sec_SubType = 0, Grade_Type = 3, LevelType = 0, SexType = 0},
		[3] =  {Name = "紫色卷轴", Icon = "1900000340", Item_Type = 3, Sec_Type = 27, Sec_SubType = 0, Grade_Type = 4, LevelType = 0, SexType = 0},
		[4] =  {Name = "橙色卷轴", Icon = "1900000340", Item_Type = 3, Sec_Type = 27, Sec_SubType = 0, Grade_Type = 5, LevelType = 0, SexType = 0},
	},
	["特效卷轴"] = {
		[1] =  {Name = "白色卷轴", Icon = "1900000470", Item_Type = 3, Sec_Type = 28, Sec_SubType = 0, Grade_Type = 1, LevelType = 0, SexType = 0},
		[2] =  {Name = "绿色卷轴", Icon = "1900000470", Item_Type = 3, Sec_Type = 28, Sec_SubType = 0, Grade_Type = 2, LevelType = 0, SexType = 0},
		[3] =  {Name = "蓝色卷轴", Icon = "1900000470", Item_Type = 3, Sec_Type = 28, Sec_SubType = 0, Grade_Type = 3, LevelType = 0, SexType = 0},
		[4] =  {Name = "紫色卷轴", Icon = "1900000470", Item_Type = 3, Sec_Type = 28, Sec_SubType = 0, Grade_Type = 4, LevelType = 0, SexType = 0},
		[5] =  {Name = "橙色卷轴", Icon = "1900000470", Item_Type = 3, Sec_Type = 28, Sec_SubType = 0, Grade_Type = 5, LevelType = 0, SexType = 0},
	},
	["角色培养"] = {
	    [1] =  {Name = "人物经验丹", Icon = "1900000200", ItemList = {20601,20021,20730}},
		[2] =  {Name = "羽翼升级", Icon = "1900014650", ItemList = {24200,24201,24202,21005,21006,21007}},
		[3] =  {Name = "洗点药丸", Icon = "1900015900", ItemList = {20907}},
		[4] =  {Name = "修炼丹", Icon = "1900000220", Item_Type = 3, Sec_Type = 19, Sec_SubType = 0, LevelType = 0, SexType = 0},
		[5] =  {Name = "阵法书", Icon = "1900015060", ItemList = {20961,31101,31102,31103,31104,31105,31106,31107,31108,31109,31110}},
		[6] =  {Name = "属性丹", Icon = "1900014240", Item_Type = 2, Sec_Type = 17, Sec_SubType = 0, LevelType = 0, SexType = 0},
		-- [7] =  {Name = "时装", Icon = "1901000000", Item_Type = 2, Sec_Type = 44, Sec_SubType = 0, LevelType = 0, SexType = 0},
		-- [8] =  {Name = "羽翼", Icon = "1901020000", Item_Type = 2, Sec_Type = 45, Sec_SubType = 0, LevelType = 0, SexType = 0},
	},
	["宠物"] = {
		[1] = {Name = "神兽", Icon = "1900359990", Pet_Type = {4,5}, CarryLevel = 0},
		[2] = {Name = "0级宠物", Icon = "1900351030", Pet_Type = {1,2,3}, CarryLevel = 0},
		[3] = {Name = "5级宠物", Icon = "1900351010", Pet_Type = {1,2,3}, CarryLevel = 5},
		[4] = {Name = "15级宠物", Icon = "1900351220", Pet_Type = {1,2,3}, CarryLevel = 15},
		[5] = {Name = "25级宠物", Icon = "1900351110", Pet_Type = {1,2,3}, CarryLevel = 25},
		[6] = {Name = "35级宠物", Icon = "1900351550", Pet_Type = {1,2,3}, CarryLevel = 35},
		[7] = {Name = "45级宠物", Icon = "1900351070", Pet_Type = {1,2,3}, CarryLevel = 45},
		[8] = {Name = "55级宠物", Icon = "1900351160", Pet_Type = {1,2,3}, CarryLevel = 55},
		[9] = {Name = "65级宠物", Icon = "1900351190", Pet_Type = {1,2,3}, CarryLevel = 65},
		[10] = {Name = "75级宠物", Icon = "1900351300", Pet_Type = {1,2,3}, CarryLevel = 75},
		[11] = {Name = "85级宠物", Icon = "1900353120", Pet_Type = {1,2,3}, CarryLevel = 85},
		[12] = {Name = "95级宠物", Icon = "1900352920", Pet_Type = {1,2,3}, CarryLevel = 95},
		[13] = {Name = "105级宠物", Icon = "1900353030", Pet_Type = {1,2,3}, CarryLevel = 105},
		[14] = {Name = "115级宠物", Icon = "1900352970", Pet_Type = {1,2,3}, CarryLevel = 115},
	},
	["宠物秘籍"] = {
		[1] =  {Name = "普通宠物秘籍", Icon = "1900000480", Item_Type = 3, Sec_Type = 13, Sec_SubType = 9, Grade_Type = 2, LevelType = 0, SexType = 0},
		[2] =  {Name = "高级宠物秘籍", Icon = "1900000490", Item_Type = 3, Sec_Type = 13, Sec_SubType = 9, Grade_Type = 3, LevelType = 0, SexType = 0},
		[3] =  {Name = "超级宠物秘籍", Icon = "1900000500", Item_Type = 3, Sec_Type = 13, Sec_SubType = 9, Grade_Type = 4, LevelType = 0, SexType = 0},
		[4] =  {Name = "特殊宠物秘籍", Icon = "1900015020", Item_Type = 3, Sec_Type = 13, Sec_SubType = 9, Grade_Type = 5, LevelType = 0, SexType = 0},		
	},
	["宠物装备"] = {
		[1] =  {Name = "项圈", Icon = "1900100180", Item_Type = 1, Sec_Type = 7, Sec_SubType = 1, LevelType = 1, SexType = 0},
		[2] =  {Name = "战甲", Icon = "1900100240", Item_Type = 1, Sec_Type = 7, Sec_SubType = 2, LevelType = 1, SexType = 0},
		[3] =  {Name = "护符", Icon = "1900100300", Item_Type = 1, Sec_Type = 7, Sec_SubType = 3, LevelType = 1, SexType = 0},
		-- [4] =  {Name = "饰品", Icon = "1900000770", Item_Type = 1, Sec_Type = 7, Sec_SubType = 4, LevelType = 0, SexType = 0},		
	},
	["宠物培养"] = {
		[1] =  {Name = "寿命", Icon = "1900014640", Item_Type = 3, Sec_Type = 13, Sec_SubType = 17, LevelType = 0, SexType = 0},
		[2] =  {Name = "复活", Icon = "1900000570", Item_Type = 3, Sec_Type = 13, Sec_SubType = 4, LevelType = 0, SexType = 0},
        [3] =  {Name = "经验丹", Icon = "1900000580", ItemList = {30909,20792,20793}},
		[4] =  {Name = "忠诚", Icon = "1900014200", Item_Type = 3, Sec_Type = 13, Sec_SubType = 12, LevelType = 0, SexType = 0},
		[5] =  {Name = "属性", Icon = "1900014630", Item_Type = 3, Sec_Type = 13, Sec_SubType = 11, LevelType = 0, SexType = 0},
		[6] =  {Name = "还原", Icon = "1900000790", Item_Type = 3, Sec_Type = 13, Sec_SubType = 1, LevelType = 0, SexType = 0},
		[7] =  {Name = "技能提取", Icon = "1900014680", Item_Type = 3, Sec_Type = 13, Sec_SubType = 8, LevelType = 0, SexType = 0},
		[8] =  {Name = "技能绑定", Icon = "1900014720", Item_Type = 3, Sec_Type = 13, Sec_SubType = 6, LevelType = 0, SexType = 0},
		[9] =  {Name = "技能解绑", Icon = "1900014710", Item_Type = 3, Sec_Type = 13, Sec_SubType = 7, LevelType = 0, SexType = 0},
		[10] = {Name = "资质丹", Icon = "1900014360", Item_Type = 3, Sec_Type = 13, Sec_SubType = 13, LevelType = 0, SexType = 0},
		[11] = {Name = "合宠", Icon = "1900000460", Item_Type = 3, Sec_Type = 13, Sec_SubType = 5, LevelType = 0, SexType = 0},
		[12] =  {Name = "培养液", Icon = "1900014180", ItemList = {30006}},
		[13] =  {Name = "洗点", Icon = "1900014180", ItemList = {24006}},
		[14] = {Name = "洗炼", Icon = "1900000450", ItemList = {30074,30913,35508,35509,35510}},
		[15] = {Name = "装备洗炼", Icon = "1900015510", ItemList = {29820,29821}},
		-- [16] = {Name = "培养液", Icon = "1900014180", Item_Type = 3, Sec_Type = 20, Sec_SubType = 0, LevelType = 0, SexType = 0},
		-- [17] =  {Name = "洗点丹", Icon = "1900000200", Item_Type = 3, Sec_Type = 13, Sec_SubType = 5, LevelType = 0, SexType = 0},
		},
	["侍从"] = {
		[1] =  {Name = "N级侍从信物", Icon = "1900040240", Item_Type = 6, Sec_Type = 0, Sec_SubType = 0, Grade_Type = 2, LevelType = 0, SexType = 0},
		[2] =  {Name = "R级侍从信物", Icon = "1900040390", Item_Type = 6, Sec_Type = 0, Sec_SubType = 0, Grade_Type = 3, LevelType = 0, SexType = 0},
		[3] =  {Name = "SR级侍从信物", Icon = "1900040410", Item_Type = 6, Sec_Type = 0, Sec_SubType = 0, Grade_Type = 4, LevelType = 0, SexType = 0},
		[4] =  {Name = "SSR级侍从信物", Icon = "1900040380", Item_Type = 6, Sec_Type = 0, Sec_SubType = 0, Grade_Type = 5, LevelType = 0, SexType = 0},
	    -- [5] =  {Name = "侍从物品", Icon = "1900000210", ItemList = {31300}},
	},
	["天赋"] = {
		[1] =  {Name = "花果山",   Icon = "1900014840", Item_Type = 2, Sec_Type = 22, Sec_SubType = 31, LevelType = 2, SexType = 0},
		[2] =  {Name = "西海龙宫", Icon = "1900014870", Item_Type = 2, Sec_Type = 22, Sec_SubType = 32, LevelType = 2, SexType = 0},
		[3] =  {Name = "慈恩寺",   Icon = "1900014900", Item_Type = 2, Sec_Type = 22, Sec_SubType = 33, LevelType = 2, SexType = 0},
		[4] =  {Name = "流沙界",   Icon = "1900014930", Item_Type = 2, Sec_Type = 22, Sec_SubType = 34, LevelType = 2, SexType = 0},
		[5] =  {Name = "净坛禅院", Icon = "1900014960", Item_Type = 2, Sec_Type = 22, Sec_SubType = 35, LevelType = 2, SexType = 0},
		[6] =  {Name = "酆都",     Icon = "1900014990", Item_Type = 2, Sec_Type = 22, Sec_SubType = 36, LevelType = 2, SexType = 0},
	},
	-- ["消耗品"] = {
	    -- [1] =  {Name = "烹饪", Icon = "1900001180", ItemList = {32408,32409,32410,32411,32412,32413,32414,32415}},
		-- [2] =  {Name = "烹饪食材", Icon = "1900001260", ItemList = {32421,32422,32423}},
		-- [3] =  {Name = "烹饪佐料", Icon = "1900001310", ItemList = {32424,32425,32426}},
		-- [4] =  {Name = "复活药", Icon = "1900000050", ItemList = {32405,32406,32435,32436}},
		-- [5] =  {Name = "加血药", Icon = "1900000010", ItemList = {32401,32402,32501,32502,32507}},
		-- [6] =  {Name = "回魔药", Icon = "1900000030", ItemList = {32403,32404,32503,32504,32508}},
		-- [7] =  {Name = "血池", Icon = "1900014100", ItemList = {20401,20402,20403}},
		-- [8] =  {Name = "魔池", Icon = "1900014130", ItemList = {20501,20502,20503}},
		-- [9] =  {Name = "解除异常药", Icon = "1900000070", ItemList = {32407,32506}},
		-- [10] =  {Name = "制药材料", Icon = "1900000080", ItemList = {32416,32417,32418,32419,32420}},
		-- [11] =  {Name = "活力药", Icon = "1900014150", ItemList = {20331,20332,20333}},
		-- [12] =  {Name = "解毒药", Icon = "1900000070", ItemList = {20901}},
		-- [13] =  {Name = "赎罪券", Icon = "1900001450", ItemList = {20908,20909}},
		-- [14] =  {Name = "侠义值", Icon = "1900099980", ItemList = {20794,20377}},
		-- [15] =  {Name = "双倍经验", Icon = "1900000190", ItemList = {20374}},
		-- [16] =  {Name = "宠物栏位", Icon = "1900015610", ItemList = {20903}},
		-- [17] =  {Name = "宠物仓库", Icon = "1900015620", ItemList = {20904}},
		-- [18] =  {Name = "人物背包", Icon = "1900001390", ItemList = {20905}},
		-- [19] =  {Name = "人物仓库", Icon = "1900001400", ItemList = {20906}},
	-- },
	["杂货"] = {
	    [1] =  {Name = "烹饪", Icon = "1900001180", ItemList = {32408,32409,32410,32411,32412,32413,32414,32415}},
	--	[2] =  {Name = "飞行旗补充包", Icon = "1900030740", Item_Type = 2, Sec_Type = 36, Sec_SubType = 0, LevelType = 0, SexType = 0},
		[2] =  {Name = "喇叭", Icon = "1900001380", ItemList = {30912}},
		[3] =  {Name = "遇敌", Icon = "1900014170", ItemList = {20371,20373,20375,20376,20378,20379,20380}},
		[4] =  {Name = "礼花", Icon = "1900001370", Item_Type = 2, Sec_Type = 21, Sec_SubType = 0, LevelType = 0, SexType = 0},
	    -- [6] =  {Name = "宠物变身药", Icon = "1900000320", ItemList = {21301,21302,21303,21304,21305,21306,21307,21308,21309,21310,21311,21312,21313,21314,21315,21316,21317,21318,21319,21320,21321,21322,21323,21324,21325,21326,21327,21328,21329,21330,21331,21332,21333,21334,21335,21336,21337,21338,21339,21340,21341,21342,21343,21344,21345,21346,21347,21348,21349}},
		-- [7] =  {Name = "神兽变身药", Icon = "1900000320", ItemList = {21350,21351,21352,21353}},
		-- [8] =  {Name = "侍从变身卡", Icon = "1900014710", ItemList = {21601,21602,21603,21604,21605,21606,21607,21608,21609,21610,21611,21612,21613,21614,21615,21616,21617,21618,21619,21620,21621,21622,21623,21624,21625,21626,21627,21628,21629,21630,21631,21632,21633,21634,21635,21636,21637,21638,21639,21640,21641}},
		-- [9] =  {Name = "飞行旗", Icon = "1900030730", Item_Type = 2, Sec_Type = 35, Sec_SubType = 0, LevelType = 0, SexType = 0},
		-- [10] =  {Name = "角色更名卡", Icon = "1900013950", ItemList = {24004}},
		-- [11] =  {Name = "帮派更名卡", Icon = "1900013950", ItemList = {24005}},
		-- [12] =  {Name = "傀儡娃娃", Icon = "1900015600", ItemList = {31020,31021}},
		-- [13] =  {Name = "矿石水", Icon = "1900001090", ItemList = {41001}},
		-- [14] =  {Name = "草木汁液", Icon = "1900001100", ItemList = {41002}},
		-- [15] =  {Name = "七色虫", Icon = "1900001110", ItemList = {41003}},
		-- [16] =  {Name = "五彩膏", Icon = "1900001120", ItemList = {41004}},
		-- [17] =  {Name = "好感度", Icon = "1900001490", ItemList = {41005,41008}},
		-- [18] =  {Name = "祈福", Icon = "1900015870", ItemList = {20789,20790,20791}},	    
		-- [19] =  {Name = "藏宝图·金", Icon = "1900015160", Item_Type = 2, Sec_Type = 16, Sec_SubType = 1, LevelType = 0, SexType = 0},
		-- [20] =  {Name = "藏宝图·木", Icon = "1900015170", Item_Type = 2, Sec_Type = 16, Sec_SubType = 2, LevelType = 0, SexType = 0},
		-- [21] =  {Name = "藏宝图·水", Icon = "1900015180", Item_Type = 2, Sec_Type = 16, Sec_SubType = 3, LevelType = 0, SexType = 0},
		-- [22] =  {Name = "藏宝图·火", Icon = "1900015190", Item_Type = 2, Sec_Type = 16, Sec_SubType = 4, LevelType = 0, SexType = 0},
		-- [23] =  {Name = "藏宝图·土", Icon = "1900015200", Item_Type = 2, Sec_Type = 16, Sec_SubType = 5, LevelType = 0, SexType = 0},
		-- [24] =  {Name = "天宫秘藏图·金", Icon = "1900001040", Item_Type = 2, Sec_Type = 16, Sec_SubType = 6, LevelType = 0, SexType = 0},
		-- [25] =  {Name = "天宫秘藏图·木", Icon = "1900001050", Item_Type = 2, Sec_Type = 16, Sec_SubType = 7, LevelType = 0, SexType = 0},
		-- [26] =  {Name = "天宫秘藏图·水", Icon = "1900001060", Item_Type = 2, Sec_Type = 16, Sec_SubType = 8, LevelType = 0, SexType = 0},
		-- [27] =  {Name = "天宫秘藏图·火", Icon = "1900001070", Item_Type = 2, Sec_Type = 16, Sec_SubType = 9, LevelType = 0, SexType = 0},
		-- [28] =  {Name = "天宫秘藏图·土", Icon = "1900001080", Item_Type = 2, Sec_Type = 16, Sec_SubType = 10, LevelType = 0, SexType = 0},
        -- [29] =  {Name = "摆摊", Icon = "1900015050", ItemList = {20918}},
	},
}

--屏蔽列表，内填KeyName或Id都行
local ShieldingItemList = {214,215,216,217,218,219,220,221,222,223,224,225,226}

local LevelTypes = {
	[1] = {15,25,35,45,55,65,75,85,95,105,115},
	[2] = {1,10,20,30,40,50,60,70,80,90,100,110,120},
}

local TypeTable = {
	['Type_1'] = {xml = "DB.Get_item_equip", fun = "EquipDataRow", Sec_Type = "Type", Sec_SubType = "SubType"},
	['Type_2'] = {xml = "DB.Get_item_consumable", fun = "ConsumableDataRow", Sec_Type = "Type", Sec_SubType = "TalentSchoo"},
	['Type_3'] = {xml = "DB.Get_item_material", fun = "MaterialDataRow", Sec_Type = "Type", Sec_SubType = "SubType"},
}

local Grades = {1,2,3,4,5}

local MoneyTypes = {
	[1] = "ingot",
	[2] = "bind_ingot",
	[4] = "gold",
	[5] = "bind_gold",
}

local TotalCatalog = {
    [1] = "银币",
    [2] = "装备",
    [3] = "制造书",
    [4] = "打造强化",
    [5] = "特技卷轴",
    [6] = "特效卷轴",
    [7] = "角色培养",
    [8] = "宠物",
    [9] = "宠物秘籍",
    [10] = "宠物装备",
    [11] = "宠物培养",
    [12] = "侍从",
    [13] = "天赋",
    [14] = "杂货",
    [15] = "消耗品",
    [16] = "宝石",
}

--[[
local TotalCatalog = {
	[1] = "装备",
	[2] = "制造书",
	[3] = "打造强化",
	[4] = "特技卷轴",
	[5] = "特效卷轴",
	[6] = "角色培养",
	[7] = "宠物",
	[8] = "宠物秘籍",
	[9] = "宠物装备",
	[10] = "宠物培养",
	[11] = "侍从",
	[12] = "天赋",
	[13] = "杂货",
	[14] = "消耗品",
	[15] = "宝石",
}
--]]

---------------------------逻辑部分
--大概交易行时的数据
function AuctionSystem.GetConfig(player)
	if not AuctionSystem.AuctionConfig_Str then
		AuctionSystem.AuctionConfig_Str = Lua_tools.serialize(AuctionConfig)
	end
	if not AuctionSystem.LevelTypes_Str then
		AuctionSystem.LevelTypes_Str = Lua_tools.serialize(LevelTypes)
	end
	if not AuctionSystem.CategoryList_Str then
		AuctionSystem.CategoryList_Str = Lua_tools.serialize(CategoryList)
	end
	if not AuctionSystem.ItemShieldList_Str then
		AuctionSystem.ItemShieldList_Str = Lua_tools.serialize(AuctionSystem.Aucttion_ItemShieldList)
	end
	if not AuctionSystem.TotalCatalog_Str then
		AuctionSystem.TotalCatalog_Str = Lua_tools.serialize(TotalCatalog)
	end
	local str = [[
			if BourseUI then
				BourseUI.GetConfig(]].."[["..AuctionSystem.AuctionConfig_Str.."]]"..[[)
				BourseUI.GetLevelConfig(]].."[["..AuctionSystem.LevelTypes_Str.."]]"..[[)
				BourseUI.GetCatalogList(]].."[["..AuctionSystem.CategoryList_Str.."]]"..[[)
                BourseUI.GetShieldingItemList(]].."[["..AuctionSystem.ItemShieldList_Str.."]]"..[[)
				BourseUI.GetCatalog(]].."[["..AuctionSystem.TotalCatalog_Str.."]]"..[[)
				BourseUI.AuctionPetConfig = ]]..Lua_tools.serialize(AuctionPetConfig)..[[
				BourseUI.DataDownloaded()
			end
		]]
		--sLuaApp:LuaDbg(" AuctionSystem.GetConfig")
		--因为要在包裹中调用，所以提出至OnPlayerLoginOver
		--BourseUI.GetTypes(]].."[["..serialize(TypeTable).."]]"..[[)
		--BourseUI.GetCatalogList(]].."[["..serialize(CategoryList).."]]"..[[)
		--BourseUI.ShieldingItemList = ]]..serialize(Aucttion_ItemShieldList)..[[
		--BourseUI.GetCatalog(]].."[["..serialize(TotalCatalog).."]]"..[[)
		sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--查询订单具体信息
function AuctionSystem.NotifyDetail(player, item_guid)
	--sLuaApp:LuaDbg(" item_guid = " .. item_guid)
	sAuctionSystem:NotifyDetail(player, item_guid)
end

--登陆时告知玩家
--function AuctionSystem.OnPlayerLoginOver(player)
--	local str = [[
--			if GlobalProcessing then
--				GlobalProcessing.BourseUI_GetCatalog(]].."[["..Lua_tools.serialize(TotalCatalog).."]]"..[[)
--				GlobalProcessing.BourseUI_GetCatalogList(]].."[["..Lua_tools.serialize(CategoryList).."]]"..[[)
--				GlobalProcessing.BourseUI_ShieldingItemList = ]]..Lua_tools.serialize(Aucttion_ItemShieldList)..[[
--				GlobalProcessing.BourseUI_DataDownloaded()
--			end
--		]]
--	sLuaApp:ShowForm(player, "脚本表单", str)
--	return ""
--end

--进行分类数据获取
function AuctionSystem.GetAuctionData(player, Page, Data_type, Sub_type, Tiny_type, Money_type, Level, Job, Gender, Word)
	local Page = tonumber(Page)
	local Data_type = tonumber(Data_type)
	local Sub_type = tonumber(Sub_type)
	local Tiny_type = tonumber(Tiny_type)
	local Money_type = tonumber(Money_type)
	local Level = tonumber(Level)
	local Job = tonumber(Job)
	local Gender = tonumber(Gender)
	local Word = tostring(Word)
	local Money_Attr = Lua_tools.GetMoneyAttrs(Money_type)
	local tb_AuctionData = sAuctionSystem:QueryItem(Page,1,Money_type,Sub_type,Tiny_type,Money_Attr,Level,Job,Gender, Word);
	for k,v in ipairs(tb_AuctionData) do
		if v.guid then
			local SpecialBuyer = sAuctionSystem:GetDataStr(v.guid, "SpecialBuyer")
			if SpecialBuyer ~= "" and SpecialBuyer ~= "无" then
				v.SpecialBuyer = "1"
			end
		end
	end
	--lualib:NotifyTipsMsg(player, "查询" .. Money_type ..", " ..Sub_type ..", ".. Tiny_type)
	--@newinter sAuctionSystem:QueryItem(1, 1, 1, 1, 12, 341, 0, 0, 0, "")
	local form = [[
		if BourseUI then
			BourseUI.RefreshDataEx(]].."[["..json.encode(tb_AuctionData).."]]"..[[)
		end
	]]
	sLuaApp:LuaDbg(" AuctionSystem.GetAuctionData")
	--sLuaApp:LuaDbg("玩家："..lualib:Name(player).."获取到的列表为"..serialize(tb_AuctionData))
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--大分类数量获取
function AuctionSystem.GetGoodCount(player, coin_type, index)
	local coin_type = tonumber(coin_type)
	local index = tonumber(index)
	local good_type = 0
	if TotalCatalog[index] then
		local tb_Auction = CategoryList[TotalCatalog[index]]
		local str_count = ""
		if tb_Auction then
			for k,v in ipairs(tb_Auction) do
				if v.Pet_Type then
					good_type = 2
				else
					good_type = 1
				end
				str_count = str_count .. sAuctionSystem:QueryCount(good_type, 1, coin_type, index, k, Lua_tools.GetMoneyAttrs(coin_type)) .. ","
			end
		end
		--@newinter sAuctionSystem:QueryCount(1, 1, 1, 1, 12, 341)
		local form = [[
			if BourseUI then
				BourseUI.RefreshAuctionCounts(]]..coin_type..","..index..",'"..str_count.."'"..[[)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", form)
	end
	return ""
end

--进行指定道具搜索
--function AuctionSystem.GetAuctionDataById(player, Page, Id, Money_type)
--	local Page = tonumber(Page)
--	local Id = tonumber(Id)
--	local Money_type = tonumber(Money_type)
--	--local tb_AuctionData = lualib:Auction_QueryItemById(Page,1,Id,Money_type);
--	local form = [[
--		if BourseUI then
--			BourseUI.RefreshData(]].."[["..Lua_tools.serialize(tb_AuctionData).."]]"..[[)
--		end
--	]]
--	sLuaApp:ShowForm(player, "脚本表单", form)
--	return ""
--end

--进行宠物搜索
function AuctionSystem.GetAuctionPetData(player, Page, Types_1, Types_2, Types_3, Money_type, Word)
	local Page = tonumber(Page)
	local Types_1 = tonumber(Types_1)
	local Types_2 = tonumber(Types_2)
	local Types_3 = tonumber(Types_3)
	local Money_type = tonumber(Money_type)
	local Word = tostring(Word)
	local Money_Attr = Lua_tools.GetMoneyAttrs(Money_type)
	local tb_AuctionData = sAuctionSystem:QueryPet(Page,1,Money_type,Types_2,Types_3,Money_Attr,Word);
	for k,v in ipairs(tb_AuctionData) do
		if v.guid then
			v.star_lv = sAuctionSystem:GetDataInt(v.guid, "PetStarLevel")
			local SpecialBuyer = sAuctionSystem:GetDataStr(v.guid, "SpecialBuyer")
			if SpecialBuyer ~= "" and SpecialBuyer ~= "无" then
				v.SpecialBuyer = "1"
			end
		end
	end
	local form = [[
		if BourseUI then
			BourseUI.RefreshDataEx(]].."[["..json.encode(tb_AuctionData).."]]"..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--获取我的商品列表
function AuctionSystem.GetMySellList(player)
	local sellList = sAuctionSystem:QueryPlayer(player)
	for k,v in ipairs(sellList) do
		if v.guid then
			local SpecialBuyer = sAuctionSystem:GetDataStr(v.guid, "SpecialBuyer")
			if SpecialBuyer ~= "" and SpecialBuyer ~= "无" then
				v.SpecialBuyer = "1"
			end
		end
		if v.level then
			v.star_lv = sAuctionSystem:GetDataInt(v.guid, "PetStarLevel")
		end
	end
	local form = [[
		if BourseUI then
			BourseUI.RefreshSellDataEx(']]..json.encode(sellList)..[[')
		end
	]]
	--sLuaApp:LuaDbg(form)
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--将商品加入收藏夹
function AuctionSystem.SetCollection(player, guid)
	local tb_Collection = sAuctionSystem:QueryFavorites(player)
	guid = tonumber(guid)
	if #tb_Collection >= AuctionConfig['MaxCollectionNum'] then
		return "您的收藏夹已经满了"
	end
	if sAuctionSystem:FavoriteObject(player, guid, true) == false then
		return "你已经收藏过该商品了"
	end
	return "收藏成功"
end

--将商品移出收藏夹
function AuctionSystem.RemoveCollection(player, guid)
	if sAuctionSystem:FavoriteObject(player, guid, false) then
		--GetCollection(player,1)
	end
	return "取消收藏"
end

--查询玩家的收藏夹
function AuctionSystem.GetCollection(player)
	local tb_Collection = sAuctionSystem:QueryFavorites(player)
	for k,v in ipairs(tb_Collection) do
		if v.type == 2 then
			if v.guid then
				v.star_lv = sAuctionSystem:GetDataInt(v.guid, "PetStarLevel")
			end
		end
	end
	local form = [[
		if BourseUI then
			BourseUI.RefreshCollectionEx(']]..json.encode(tb_Collection)..[[')
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--取消拍卖
function AuctionSystem.Withdraw(player,good_guid)
	local Object_Tb = sAuctionSystem:GetData(good_guid)
	local Object_Type = Object_Tb.type
	if Object_Type == 2 then
		if Lua_tools.GetPetBagFree(player) == 0 then
			return "你的宠物栏位满了，请清理后再来"
		end
	elseif Object_Type == 1 then
		local itemData = ItemConfig.GetById(Object_Tb.id)
		--信物包裹进行特殊处理（依据为item表Type属性为6）
		if itemData.Type == 6 then
			if Lua_tools.GetTokenBagFree(player) == 0 then
				return "你的信物包裹满了，请清理后再进行尝试"
			end
		elseif itemData.Type == 3 and itemData.Subtype == 9 then --宝石包裹进行特殊处理（拍卖暂时无宝石,依据为item表Type属性为3，Subtype为9）
			if Lua_tools.GetGemBagFree(player) == 0 then
				return "你的宝石包裹满了，请清理后再进行尝试"
			end	
		else
			if Lua_tools.GetBagFree(player) == 0 then
				return "你的包裹满了，请清理后再进行尝试"
			end
		end
	end
	if Object_Tb.seller_guid ~= player:GetGUID() then
		return "你不是该道具的售卖者，无法下架"
	end
	if sAuctionSystem:PulloffObject(good_guid) then
		--GetMySellList(player)
		AuctionSystem.TakeOut(player, good_guid)				--下架后直接进入背包
		return "成功下架！"
	end
	return ""
end

--取出下架物品
function AuctionSystem.TakeOut(player, good_guid)
	--lualib:NotifyTipsMsg(player, "取出的对象类型为"..lualib:Type(item))
	local Object_Tb = sAuctionSystem:GetData(good_guid)
	local Object_Type = Object_Tb.type
	if Object_Type == 2 then
		if Lua_tools.GetPetBagFree(player) == 0 then
			return "你的宠物栏位满了，请清理后再来"
		end
	elseif Object_Type == 1 then
		local itemData = ItemConfig.GetById(Object_Tb.id)
		--信物包裹进行特殊处理（依据为item表Type属性为6）
		if itemData.Type == 6 then
			if Lua_tools.GetTokenBagFree(player) == 0 then
				return "你的信物包裹满了，请清理后再进行尝试"
			end
		elseif itemData.Type == 3 and itemData.Subtype == 9 then --宝石包裹进行特殊处理（拍卖暂时无宝石,依据为item表Type属性为3，Subtype为9）
			if Lua_tools.GetGemBagFree(player) == 0 then
				return "你的宝石包裹满了，请清理后再进行尝试"
			end	
		else
			if Lua_tools.GetBagFree(player) == 0 then
				return "你的包裹满了，请清理后再进行尝试"
			end
		end
	end
	if sAuctionSystem:TakeoffObject(player, good_guid) then		--这边要确认物品的拥有者
		AuctionSystem.GetMySellList(player)
		return ""
	end
	return ""
end

--重新上架
function AuctionSystem.SellAgain(player, good_guid, money_type, money_value, types)
	local good_guid = tonumber(good_guid)
	local money_type = tonumber(money_type)
	local money_value = tonumber(money_value)
	local types = tonumber(types)
	local seconds = AuctionConfig['Seconds'][types or 1]
	--sLuaApp:LuaDbg("Seconds = " .. seconds)
	--sLuaApp:LuaDbg("types = " .. types)
	local num = 1
	local SellList = sAuctionSystem:QueryPlayer(player)
	local Object_Tb = sAuctionSystem:GetData(good_guid)
	
	if Object_Tb.seller_guid ~= player:GetGUID() then
		return "你不是该道具的售卖者，无法上架"
	end
	if Object_Tb.type == 1 then
		for k,v in ipairs(SellList) do
			if v.guid == good_guid then
				num = v.amount or 1
			end
		end
	end
	
	local FeeType = AuctionConfig['FeeBy'..money_type]
	local FeeValue = load("local Seconds = "..seconds.." local Num = " .. num .. " return " .. AuctionConfig.Fee)()
	if player:GetType() == 3 then
		if type(FeeType) ~= "number" then
			return "手续费配置异常！"
		end
		if Lua_tools.IsMoneyEnough(player, FeeType, FeeValue) == false then
			--exchange_start(player, "拍卖行表单","SellAgain", FeeType, FeeValue, goodsData)
			return "手续费不够，无法上架"
		end
	end
	--sLuaApp:LuaDbg("Seconds = " .. seconds)
	if sAuctionSystem:PutonObject(good_guid, Lua_tools.GetMoneyAttrs(money_type), money_value, seconds) then
		if Lua_tools.SubMoney(player, FeeType, FeeValue, "交易行手续费") == false then
			sLuaApp:Dbg("玩家：" .. player:GetName() .. " 拍卖过程中手续费扣除失败")
		end
		AuctionSystem.GetMySellList(player)
		return "上架成功！"
	else
		return "上架失败！"
	end
	
	return ""
end

--拍卖道具
function AuctionSystem.StartSellItem(player, item_guid, num, money_type, money_value, time_type, SpecialBuyer)
	local item_guid = tonumber(item_guid)
	
	local num = tonumber(num)
	local money_type = tonumber(money_type)
	local money_value = tonumber(money_value)
	local time_type = tonumber(time_type)
	if num < 1 then
		return ""
	end
	
	local item = sItemSystem:GetItemByGUID(item_guid)
	local playerType = player:GetType()
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "道具拥有者数据异常，无法上架")
		return
	end
	
	if math.floor(num) ~= num or math.floor(money_type) ~= money_type or math.floor(money_value) ~= money_value then
		return ""
	end
	local seconds = AuctionConfig['Seconds'][time_type or 1]
	sLuaApp:LuaDbg("647     所有值为" .. item_guid..","..num..","..money_type..","..money_value..","..seconds)
	local answer = GUIDChecking(item)
	local nowSell = 0
	if money_value > AuctionConfig.MaxPrice/(num or 1) then
		return "你的定价过高，请重新定价！"
	end
	if playerType == GUID_PLAYER then
		local SellList = sAuctionSystem:QueryPlayer(player)
		for k,v in ipairs(SellList) do
			if v.amount then
				if v.coin_type == Lua_tools.MoneyAttrs[money_type] then
					nowSell = nowSell + 1
				end
			end
		end
		sLuaApp:LuaDbg("玩家："..player:GetName().."   售卖的当前道具数量为" .. nowSell .. "  AuctionConfig.MaxItemSelling = " .. AuctionConfig.MaxItemSelling .. "   +  ".. player:GetInt("AuctionSystem_AdderItemSelling"))
		if nowSell >= AuctionConfig.MaxItemSelling + player:GetInt("AuctionSystem_AdderItemSelling") then
			return "你能上架的道具数量已经达到上限"
		end
	end
	if type(answer) == "table" then
		if #answer ~= 2 then
			return "上架失败！该道具无法出售"
		end
		sLuaApp:LuaDbg("宠物上架的序列为" .. answer[1]..","..answer[2])
	else
		if answer == "NoMsg" then
			return "上架失败！该道具无法出售"
		else
			return answer
		end
	end
	if AuctionConfig['PriceBeta'] and AuctionConfig["Price2_"..money_type] then
		if playerType == GUID_PLAYER then
			--print("玩家进入金钱判断")	
			local autoPrice = assert(load("return ItemConfig.GetById("..item:GetId()..")['" .. AuctionConfig['PriceBeta'] .. "']" .. AuctionConfig["Price2_"..money_type]))()
			if type(autoPrice) == 'number' then
				local maxprice = load("return "..autoPrice..AuctionConfig.PriceMax)()
				local minprice = load("return "..autoPrice..AuctionConfig.PriceMin)()
				print("服务器核算后最终价格范围为"..minprice.."~"..maxprice..Lua_tools.GetMoneyName(money_type))
				if maxprice < AuctionConfig['MinPrice_'..money_type] then
					maxprice = AuctionConfig['MinPrice_'..money_type]
				end
				if money_value < minprice or money_value > maxprice then
					return "超过了该商品的拍卖范围，请重新定价！"
				end
			end
		end
	end
	if money_value*num < AuctionConfig['MinPrice_'..money_type] then
		return "您的标价过低，无法出售！"
	end
	if item_guid and num > 0 and money_type > 0 and money_value > 0 and seconds > 0 then
		local FeeType = AuctionConfig['FeeBy'..money_type]
		local FeeValue = load("local Seconds = "..seconds.." local Num = " .. num .. " return " .. AuctionConfig.Fee)()
		if playerType == GUID_PLAYER then
			if type(FeeType) ~= "number" then
				return "手续费配置异常！"
			end
			if Lua_tools.IsMoneyEnough(player, FeeType, FeeValue) == false then
				--exchange_start(player, "拍卖行表单","StartSellItem", FeeType, FeeValue, itemData)
				if MoneyChange then
					local f_name = [[AuctionSystem.StartSellItem(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..item_guid..[[,]]..num..[[,]]..money_type..[[,]]..money_value..[[,]]..time_type..[[)]]
					MoneyChange.LackMoney(player, FeeType, FeeValue, f_name)
					return ""
				else
					return "手续费不足"
				end
			end
		end
		if playerType ~= GUID_PLAYER then
			if AuctionSystemSell.Times > 0 then
				seconds = AuctionSystemSell.Times
			end
		end
		--sLuaApp:LuaErr("SpecialBuyer = "..tostring(SpecialBuyer))
		if SpecialBuyer and (SpecialBuyer ~= "无" and SpecialBuyer ~= "") then
			item:SetString("SpecialBuyer", SpecialBuyer)
		else
			item:SetString("SpecialBuyer", "")
		end
		local item_sell = sAuctionSystem:PutonItem(item, money_type, answer[1], answer[2], num, Lua_tools.GetMoneyAttrs(money_type), money_value, seconds)
		sLuaApp:LuaDbg("分类为" .. answer[1] .. "," .. answer[2])
		sLuaApp:LuaDbg("money_type = "..money_type)
		sLuaApp:LuaDbg("num = "..num)
		sLuaApp:LuaDbg("money_value = "..money_value)
		sLuaApp:LuaDbg("seconds = "..seconds)
		if item_sell ~= 0 then
			if playerType == GUID_PLAYER then
				if Lua_tools.SubMoney(player, FeeType, FeeValue, "交易行手续费") == false then
					sLuaApp:LuaDbg("玩家：" .. player:GetName() .. " 拍卖过程中手续费扣除失败")
				end
				sLuaApp:LuaDbg("玩家上架道具成功！")				
				AuctionSystem.GetMySellList(player)
			end
			return "成功上架！"
		else
			if playerType ~= GUID_PLAYER then
				sLuaApp:LuaDbg("机器人上架道具失败！")
			end
			if SpecialBuyer and (SpecialBuyer ~= "无" and SpecialBuyer ~= "") then
				item:SetString("SpecialBuyer", "")
			end
			return "上架失败！"
		end
	end
	return ""
end

--拍卖宠物
function AuctionSystem.StartSellPet(player, pet_guid, money_type, money_value, time_type, SpecialBuyer)
	
	local pet_guid = tonumber(pet_guid)
	--lualib:Debug("上架道具："..lualib:KeyName(pet))
	local money_type = tonumber(money_type)
	local money_value = tonumber(money_value)
	local time_type = tonumber(time_type)
	if math.floor(money_type) ~= money_type or math.floor(money_value) ~= money_value then
		return ""
	end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	if pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "宠物正在上阵中，无法拍卖")
		return ""
	end
	if pet:IsPasture() then
		sLuaApp:NotifyTipsMsg(player, "宠物正在牧场中，无法拍卖")
		return ""
	end
	local equipCon = pet:GetEquipContainer()
	if #equipCon:GetItemList() > 0 then
		sLuaApp:NotifyTipsMsg(player, "宠物正携带着装备，无法拍卖")
		return ""
	end

	if MountsSystem then
		if pet:GetInt("Rest_MountId") ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "宠物正在被坐骑统驭，无法拍卖")
			return ""
		end
	end
	
	local playerType = player:GetType()
	
	local seconds = AuctionConfig['Seconds'][time_type or 1]
	--lualib:Debug("所有值为" .. pet..","..num..","..money_type..","..money_value..","..seconds)
	local answer = GUIDChecking(pet)
	local nowSell = 0
	if money_value > AuctionConfig.MaxPrice then
		return "你的定价过高，请重新定价！"
	end
	if playerType == GUID_PLAYER then
		local SellList = sAuctionSystem:QueryPlayer(player)
		for k,v in ipairs(SellList) do
			if v.level then
				if v.coin_type == Lua_tools.MoneyAttrs[money_type] then
					nowSell = nowSell + 1
				end
			end
		end
		if nowSell >= AuctionConfig.MaxPetSelling + player:GetInt("AuctionSystem_AdderPetSelling") then
			return "你能上架的道具数量已经达到上限"
		end
	end
	if type(answer) == "table" then
		if #answer ~= 2 then
			return "上架失败！该道具无法出售"
		end
	else
		if answer == "NoMsg" then
			return "上架失败！该道具无法出售"
		else
			return answer
		end
	end
	if money_value < AuctionConfig['MinPrice_'..money_type] then
		return "您的标价过低，无法出售！"
	end
	if pet and money_type > 0 and money_value > 0 and seconds > 0 then
		local FeeType = AuctionConfig['FeeBy'..money_type]
		local FeeValue = load("local Seconds = "..seconds.." local Num = 1 return " .. AuctionConfig.Fee)()
		if playerType == GUID_PLAYER then
			if type(FeeType) ~= "number" then
				return "手续费配置异常！"
			end
			if Lua_tools.IsMoneyEnough(player, FeeType, FeeValue) == false then
				--exchange_start(player, "拍卖行表单","StartSellPet", FeeType, FeeValue, petData)
				if MoneyChange then
				
					local f_name = [[AuctionSystem.StartSellPet(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..pet_guid..[[,]]..money_type..[[,]]..money_value..[[,]]..time_type..[[)]]
					MoneyChange.LackMoney(player, FeeType, FeeValue, f_name)
					return ""
				else
					return "手续费不足"
				end
			end
		end
		if SpecialBuyer and (SpecialBuyer ~= "无" and SpecialBuyer ~= "") then
			pet:SetString("SpecialBuyer", SpecialBuyer)
		else
			pet:SetString("SpecialBuyer", "")
		end
		local pet_sell = sAuctionSystem:PutonPet(pet, money_type, answer[1], answer[2], Lua_tools.GetMoneyAttrs(money_type), money_value, seconds)
		if pet_sell ~= "" then
			sLuaApp:LuaDbg("分类为" .. answer[1] .. "," .. answer[2])
			if playerType == GUID_PLAYER then
				if Lua_tools.SubMoney(player, FeeType, FeeValue, "交易行手续费") == false then
					sLuaApp:LuaDbg("玩家：" .. lualib:Name(player) .. " 拍卖过程中手续费扣除失败")
				end
				AuctionSystem.GetMySellList(player)
			end
			return "成功上架！"
		else
			if SpecialBuyer and (SpecialBuyer ~= "无" and SpecialBuyer ~= "") then
				pet:SetString("SpecialBuyer", "")
			end
			return "上架失败！"
		end
	end
	return ""
end

--购买商品
function AuctionSystem.Aucting(player, good_guid, num, Password)
	--sLuaApp:NotifyTipsMsg(player, "尝试购买")
	local Object_Tb = sAuctionSystem:GetData(good_guid)
	local seller = Object_Tb.seller_guid
	if seller == player:GetGUID() then
		return "不能购买自己上架的道具"
	end
	local Object_Type = Object_Tb.type
	if Object_Type == 2 then
		local SpecialBuyer = sAuctionSystem:GetDataStr(good_guid, "SpecialBuyer")
		--sLuaApp:LuaErr("2 Aucting  SpecialBuyer = "..tostring(SpecialBuyer))
		if SpecialBuyer ~= "" and SpecialBuyer ~= "无" then
			if Password then
				if Password ~= SpecialBuyer then
					return "密码错误，购买失败"
				end
			else
				return "密码错误，购买失败"
			end
		end
		if Lua_tools.GetPetBagFree(player) == 0 then
			return "你的宠物栏位满了，请清理后再来"
		end
	elseif Object_Type == 1 then
		local SpecialBuyer = sAuctionSystem:GetDataStr(good_guid, "SpecialBuyer")
		--sLuaApp:LuaErr("1 Aucting  SpecialBuyer = "..tostring(SpecialBuyer))
		if SpecialBuyer ~= "" and SpecialBuyer ~= "无" then
			if Password then
				if Password ~= SpecialBuyer then
					return "密码错误，购买失败"
				end
			else
				return "密码错误，购买失败"
			end
		end
		local itemData = ItemConfig.GetById(Object_Tb.id)
		--信物包裹进行特殊处理（依据为item表Type属性为6）
		if itemData.Type == 6 then
			if Lua_tools.GetTokenBagFree(player) == 0 then
				return "你的信物包裹满了，请清理后再进行尝试"
			end
		elseif itemData.Type == 3 and itemData.Subtype == 9 then --宝石包裹进行特殊处理（拍卖暂时无宝石,依据为item表Type属性为3，Subtype为9）
			if Lua_tools.GetGemBagFree(player) == 0 then
				return "你的宝石包裹满了，请清理后再进行尝试"
			end	
		else		
			if Lua_tools.GetBagFree(player) == 0 then
				return "你的包裹满了，请清理后再进行尝试"
			end
		end
	end

	local money_type = Lua_tools.GetMoneyId(Object_Tb['coin_type'])
	local once_value = Object_Tb['coin_value']
	num = tonumber(num)
	if num > (Object_Tb['amount'] or 1) then
		return "存货好像不够了，请您刷新再试~"
	end
	sLuaApp:LuaDbg("money_type = " .. money_type)
	if Lua_tools.IsMoneyEnough(player, money_type, once_value*num) == false then
		--lualib:NotifyTipsMsg(player, "进入脚本的货币补足")
		--exchange_start(player, "拍卖行表单","Aucting", money_type, once_value*num, itemData)
		return ""..Lua_tools.GetMoneyName(money_type).."不足，无法购买"
	end
	if num > 0 then
		if sAuctionSystem:BuyObject(player,good_guid,num) then
			local form = [[
				if BourseUI then
					BourseUI.RefreshNowPage()
					BourseUI.OnPopupClose()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			--seller要用于小红点刷新
			--if seller:GetPlayerByGUID() then
			--	if seller:GetType() == 3 then
			--		sLuaApp:ShowForm(seller, "脚本表单", "if MainUI then MainUI.SetBourseBtnRedPoint(1) end")						
			--	end
			--else
			--	lualib:SetDBNum("AuctionSystem_PlyaerRedPoint_"..seller, 1)
			--end
			--if Object_Type == 2 then
			--	local pet = sPetSystem:GetPetByGUID(good_guid)
			--	pet:SetString("SpecialBuyer", "")
			--elseif Object_Type == 1 then
			--	local item = sItemSystem:GetItemByGUID(good_guid)
			--	item:SetString("SpecialBuyer", "")
			--end
			sLuaApp:NotifyTipsMsg(player,"购买成功！")
			--密藏目标统计
			if SeasonPassConfig and SeasonPassConfig.Switch and SeasonPassConfig.Switch == "on" then
				if SeasonPassQuestFunc then
					SeasonPassQuestFunc.SpendMoney(player, money_type, once_value * num)
				end
			end
			return ""
		end
	end
	return "系统错误"
end

--显示小红点
function AuctionSystem.ShowRedPoint(player)
	if player:GetPlayerByGUID() then
		if player:GetType() == GUID_PLAYER then
			sLuaApp:ShowForm(player, "脚本表单", "if MainUI then MainUI.SetBourseBtnRedPoint(1) end")	
			--if lualib:GetDBNum("AuctionSystem_PlyaerRedPoint_"..player) == 1 then
			--	lualib:SetDBNum("AuctionSystem_PlyaerRedPoint_"..player, 0)
			--end
		end
	else
		--lualib:SetDBNum("AuctionSystem_PlyaerRedPoint_"..player, 1)
	end
	return ""
end

--查询拍卖行存款
function AuctionSystem.QuetyCoin(player, money_type)
	local money_type = tonumber(money_type)
	local tb_Money = sAuctionSystem:QueryCoins(player)
	local money = 0
	if MoneyTypes[money_type] then
		money = tb_Money[MoneyTypes[money_type]]
	end
	local form = [[
		if BourseUI then
			BourseUI.RefreshMoneyData(]]..money_type..[[,]]..(money or 0)..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--查询交易记录
function AuctionSystem.QueryRecords(player)
	local tb_Records = sAuctionSystem:QueryRecords(player)
	local form = [[
		--unfilter
		if BourseUI then
			BourseUI.RefreshRecords(]].."[["..Lua_tools.serialize(tb_Records).."]]"..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
	return ""
end

--提取拍卖行存款
function AuctionSystem.TakeOffCoin(player, money_type)
	local money_type = tonumber(money_type)
	local tb_Money = sAuctionSystem:QueryCoins(player)
	local money = 0
	if MoneyTypes[money_type] then
		money = tb_Money[MoneyTypes[money_type]]
	end
	-- sLuaApp:LuaDbg("money = " .. money)
	if money then
		if money > 0 then
			local surplus_money = 0
			local takeoff_max_num = 4000000000
			if money > takeoff_max_num then
				surplus_money = money - takeoff_max_num
				money = takeoff_max_num
			end
			if sAuctionSystem:TakeoffCoin(player, Lua_tools.GetMoneyAttrs(money_type), (money or 0)) == true then
				local form = [[
					if BourseUI then
						BourseUI.RefreshMoneyData(]]..money_type..[[,]]..surplus_money..[[)
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", form)
				return "提款成功！"
			end
		else
			return "没有可领取的存款！"
		end
	end
	return "没有可领取的存款！"
end

--扩展可拍卖格子		1 = 道具   2 = 宠物
local ItemUnlockKey = "解锁道具交易栏位"
local PetUnlockKey = "解锁宠物交易栏位"

function AuctionSystem.UnlockField(player, types)
	types = tonumber(types)
	if types == 1 then
		local Adder = player:GetInt("AuctionSystem_AdderItemSelling")
		if Adder >= sVarSystem:GetInt("AuctionSystem_AdderItemSelling") then
			return "可解锁的道具交易栏位已达到上限"
		end
	else
		local Adder = player:GetInt("AuctionSystem_AdderPetSelling")
		if Adder >= sVarSystem:GetInt("AuctionSystem_AdderPetSelling") then
			return "可解锁的宠物交易栏位已达到上限"
		end
	end
	--local Desc = "是否消耗consum@个<color=#%s>%s</color>扩展一个"..(types == 1 and "道具" or "宠物").."售卖栏位？（当前共有count@个）"
	--OneKeyUse(player, types == 1 and "解锁道具交易栏位" or "解锁宠物交易栏位", 1, Desc, "拍卖行表单", "Unlock"..(types == 1 and "Item" or "Pet").."Field")
	
	local Name = ""
	local Function = "UnlockItemField"
	local Field = "道具"
	
	if types == 1 then
		if not AuctionSystem.ItemUnlockId then
			AuctionSystem.ItemUnlockName = ItemConfig.GetByKeyName(ItemUnlockKey).Name
		end
		Name = AuctionSystem.ItemUnlockName
	else
		if not AuctionSystem.PetUnlockName then
			AuctionSystem.PetUnlockName = ItemConfig.GetByKeyName(PetUnlockKey).Name
		end
		Name = AuctionSystem.PetUnlockName
		Function = "UnlockPetField"
		Field = "宠物"
	end
	
	local str = [[GlobalUtils.ShowServerBoxMessage("是否消耗1个]]..Name..[[扩展一个]]..Field..[[售卖栏位？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "AuctionSystem."..Function.."("..player:GetGUID()..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	return ""
end

function AuctionSystem.UnlockItemField(player_guid)
	player_guid = tonumber(player_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	if player then
		if not AuctionSystem.ItemUnlockId then
			AuctionSystem.ItemUnlockId = ItemConfig.GetByKeyName(ItemUnlockKey).Id
		end
		local item = sItemSystem:GetItemList(player, AuctionSystem.ItemUnlockId, 3)[1]
		if not item then
			if OneKeyBuy.Main(player,{ItemUnlockKey, 1}) then
				return ""
			end
			sLuaApp:NotifyTipsMsg(player,"您的 ".. AuctionSystem.ItemUnlockName .. " 不足！")
			return ""
		end
		--写Apply道具
		if sItemSystem:UseItem(player, item) then
			sLuaApp:NotifyTipsMsg(player,"你成功的解锁了一个道具交易栏位")
		end
	end
end

function AuctionSystem.UnlockPetField(player_guid)
	player_guid = tonumber(player_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	if player then
		if not AuctionSystem.PetUnlockId then
			AuctionSystem.PetUnlockId = ItemConfig.GetByKeyName(PetUnlockKey).Id
		end
		local item = sItemSystem:GetItemList(player, AuctionSystem.PetUnlockId, 3)[1]
		if not item then
			if OneKeyBuy.Main(player,{PetUnlockKey, 1}) then
				return ""
			end
			sLuaApp:NotifyTipsMsg(player,"您的 ".. AuctionSystem.PetUnlockName .. " 不足！")
			return ""
		end
		--写Apply道具
		if sItemSystem:UseItem(player, item) then
			sLuaApp:NotifyTipsMsg(player,"你成功的解锁了一个宠物交易栏位")
		end
	end
end

--道具可上架权限检查
function GUIDChecking(object)
	local Aucttion_AllowList = AuctionSystem.Aucttion_AllowList
	if object:GetType() == 5 then
		--道具
		local Id = object:GetId()
		if AuctionSystem.Aucttion_ItemShieldList['Id_'..Id] == 1 then
			return false
		end
		if Aucttion_AllowList then
			local keyName = object:GetKeyName()
			--if not TypeTable then
			--	sLuaApp:LuaDbg("缺少配置 TypeTable")
			--	return "NoMsg"
			--end
			local tb_BasicInfo = ItemConfig.GetById(Id)
			local itemType = tb_BasicInfo.Type
			local secType = tb_BasicInfo.Subtype
			local secsubType = tb_BasicInfo.Subtype2
			--local TypeInfo = TypeTable['Type_'..itemType]
			local itemGrade = tb_BasicInfo.Grade
			local itemLv = tb_BasicInfo.Itemlevel
			local tb_Screen = Aucttion_AllowList["ItemID_"..Id]
			if tb_Screen == nil then
				--local tb_Types = Item
				--local secType = tb_Types[TypeInfo.Sec_Type]
				--local secsubType = tb_Types[TypeInfo.Sec_SubType]
				if Aucttion_AllowList['ItemType_'..itemType] then
					if Aucttion_AllowList['ItemType_'..itemType]['Sec_Type_'..secType] then
						if Aucttion_AllowList['ItemType_'..itemType]['Sec_Type_'..secType]['Sec_SubType_'..secsubType] then
							tb_Screen = Aucttion_AllowList['ItemType_'..itemType]['Sec_Type_'..secType]['Sec_SubType_'..secsubType]['Grade_'..itemGrade]
							if not tb_Screen then
								tb_Screen = Aucttion_AllowList['ItemType_'..itemType]['Sec_Type_'..secType]['Sec_SubType_'..secsubType]['Grade_0']
							end
						end
					end
				end
			end
			if tb_Screen then
				if type(tb_Screen) == "table" then
					if tb_Screen.minLevel then
						if itemLv < tb_Screen.minLevel then
							return "道具等级低于可售卖等级！"
						end
					end
					if tb_Screen.maxLevel then
						if itemLv > tb_Screen.maxLevel then
							return "道具等级高于可售卖等级！"
						end
					end
					if tb_Screen.minGrade then
						if itemGrade < tb_Screen.minGrade then
							return "道具品质高于可售卖品质！"
						end
					end
					if tb_Screen.maxGrade then
						if itemGrade > tb_Screen.maxGrade then
							return "道具品质高于可售卖品质！"
						end
					end
					return {tb_Screen.Class, tb_Screen.Team}
				end
			else
				return "该品质的道具无法售卖！"
			end
		else
			sLuaApp:LuaDbg("无效的Aucttion_AllowList")
			return "NoMsg"
		end
	elseif object:GetType() == 6 then
		--宠物
		if Aucttion_AllowList then
			local keyName = object:GetKeyName()
			local Id = object:GetId()
			--if not TypeTable then
			--	lualib:Debug("缺少配置 TypeTable")
			--	return "NoMsg"
			--end
			local petType = PetConfig.GetById(Id).Type
			local petLv = PetConfig.GetById(Id).CarryLevel
			if Aucttion_AllowList['PetType_'..petType] then
				local tb_Screen = Aucttion_AllowList['PetType_'..petType]['CarryLevel_'..petLv]
				--local tb_Screen = Aucttion_AllowList['PetType_'..petType]
				if tb_Screen then
					return {tb_Screen.Class, tb_Screen.Team}
				end
			end
		end
	end
	return "NoMsg"
end

function AuctionSystem.on_system_start()
	sVarSystem:SetInt("AuctionSystem_AdderItemSelling", AuctionConfig.AdderItemSelling or 0)
	sVarSystem:SetInt("AuctionSystem_AdderPetSelling", AuctionConfig.AdderPetSelling or 0)
	sAuctionSystem:SetPageDisplayCount(AuctionConfig.NumPerPage)
	sAuctionSystem:SetPayTaxes(AuctionConfig.Tax*100)
	--print("AuctionSystem_AdderItemSelling SetOver  = " .. lualib:GetInt("0", "AuctionSystem_AdderItemSelling"))
end


function AuctionSystem.Initialization()
	AuctionSystem.AdderItemSelling = AuctionConfig.AdderItemSelling
	AuctionSystem.AdderPetSelling = AuctionConfig.AdderPetSelling
	AuctionSystem.Aucttion_AllowList = {}
	if not Grades then
		Grades = {1,2,3,4,5}
	end
	if not CategoryList then
		sLuaApp:LuaDbg("服务器缺少CategoryList！")
		return
	end
	if not TotalCatalog then
		sLuaApp:LuaDbg("服务器缺少TotalCatalog！")
		return
	end
	for a,b in ipairs(TotalCatalog) do
		if CategoryList[b] then
			for k,v in pairs(CategoryList[b]) do
				if v.ItemID then
					AuctionSystem.Aucttion_AllowList["ItemID_"..v.ItemID] = v
					AuctionSystem.Aucttion_AllowList["ItemID_"..v.ItemID]["Class"] = a
					AuctionSystem.Aucttion_AllowList["ItemID_"..v.ItemID]["Team"] = k
				elseif v.ItemList then
					for c,d in ipairs(v.ItemList) do
						AuctionSystem.Aucttion_AllowList["ItemID_"..d] = v
						AuctionSystem.Aucttion_AllowList["ItemID_"..d]["Class"] = a
						AuctionSystem.Aucttion_AllowList["ItemID_"..d]["Team"] = k
					end
				elseif v.Item_Type then
					if not AuctionSystem.Aucttion_AllowList['ItemType_'..v.Item_Type] then
						AuctionSystem.Aucttion_AllowList['ItemType_'..v.Item_Type] = {}
					end
					if v.Item_Type == 1 then
						if v.Sec_Type then
							if not AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type] then
								AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type] = {}
							end
							if v.Sec_SubType then
								if not AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] then
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] = {}
								end
								if v.Grade_Type then
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type] = v
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Team"] = k
								else
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"] = v
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_1']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Team"] = k
								end
							end
						end
					elseif v.Item_Type == 2 then
						if v.Sec_Type then
							if not AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type] then
								AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type] = {}
							end
							if v.Sec_SubType then
								if not AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] then
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] = {}
								end
								if v.Grade_Type then
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type] = v
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Team"] = k
								else
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"] = v
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_2']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Team"] = k
								end
							end
						end
					elseif v.Item_Type == 3 then
						if v.Sec_Type then
							if not AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type] then
								AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type] = {}
							end
							if v.Sec_SubType then
								if not AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] then
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] = {}
								end
								if v.Grade_Type then
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type] = v
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Team"] = k
								else
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"] = v
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_3']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Team"] = k
								end
							end
						end
					elseif v.Item_Type == 6 then
						if v.Sec_Type then
							if not AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type] then
								AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type] = {}
							end
							if v.Sec_SubType then
								if not AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] then
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] = {}
								end
								if v.Grade_Type then
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type] = v
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Team"] = k
								else
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"] = v
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_6']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Team"] = k
								end
							end
						end
					elseif v.Item_Type == 7 then
						if v.Sec_Type then
							if not AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type] then
								AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type] = {}
							end
							if v.Sec_SubType then
								if not AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] then
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType] = {}
								end
								if v.Grade_Type then
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type] = v
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_"..v.Grade_Type]["Team"] = k
								else
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"] = v
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Class"] = a
									AuctionSystem.Aucttion_AllowList['ItemType_7']['Sec_Type_'..v.Sec_Type]['Sec_SubType_'..v.Sec_SubType]["Grade_0"]["Team"] = k
								end
							end
						end
					end
				elseif v.Pet_Type then
					if type(v.Pet_Type) == "table" then
						for s,d in ipairs(v.Pet_Type) do
							if not AuctionSystem.Aucttion_AllowList['PetType_'..d] then
								AuctionSystem.Aucttion_AllowList['PetType_'..d] = {}
								AuctionSystem.Aucttion_AllowList['PetType_'..d]['Class'] = a
								AuctionSystem.Aucttion_AllowList['PetType_'..d]['Team'] = k
							end
							if v.CarryLevel then
								AuctionSystem.Aucttion_AllowList['PetType_'..d]['CarryLevel_'..v.CarryLevel] = v
								AuctionSystem.Aucttion_AllowList['PetType_'..d]['CarryLevel_'..v.CarryLevel]['Class'] = a
								AuctionSystem.Aucttion_AllowList['PetType_'..d]['CarryLevel_'..v.CarryLevel]['Team'] = k
							end
						end
					elseif type(v.Pet_Type) == "number" then
						AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type] = v
						AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type]['Class'] = a
						AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type]['Team'] = k
						if v.CarryLevel then
							AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type]['CarryLevel_'..v.CarryLevel] = v
							AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type]['CarryLevel_'..v.CarryLevel]['Class'] = a
							AuctionSystem.Aucttion_AllowList['PetType_'..v.Pet_Type]['CarryLevel_'..v.CarryLevel]['Team'] = k
						end
					end
				end
			end
		end
	end
	AuctionSystem.Aucttion_ItemShieldList = {}
	for k,v in ipairs(ShieldingItemList) do
		local item_id = v
		if type(item_id) == "string" then
			item_id = ItemConfig.GetByKeyName(item_id).Id
		end
		if type(item_id) == "number" then
			AuctionSystem.Aucttion_ItemShieldList['Id_'..item_id] = 1
		end
	end
	--lualib:AddTimer("0", lualib:GenTimerId("0"), 5000, 1, "StartSystemSell")
end

function AuctionSystem.StartSystemSell()
	if AuctionSystemSell.Vision == sDBVarSystem:GetString("AuctionSystem_SystemSell_Vision") then
		return
	end
	if AuctionSystemSell.Config then
		--local Robot = lualib:Map_GenDummy(lualib:Map_GetMapGuid("长安城"), 0, 0, 1000, 70, 0)
		local Robot = sRobotSystem:CreateRobot(sLuaApp:RandInteger(1,10), 101, 0, sMapSystem:GetMapByKey("长安城"), 0, 0)
		if Robot then
			for k,v in ipairs(AuctionSystemSell.Config) do
				if v.Item then
					local item_id = sItemSystem:GetItemIdByKeyname(v.Item)
					if item_id and item_id ~= 0 then
						local item = sItemSystem:AddItemEx(Robot, item_id, v.Num or 1, false, "system", "交易行", "系统售卖")[1]
						if item ~= "" then
							sLuaApp:LuaDbg("试图上架道具  "..v.Item)
							sLuaTimerSystem:AddTimerEx(Robot, k*10, 1, "AuctionSystem.RobotSellItem", ""..item:GetGUID().."#"..v.Num.."#"..v.Money_type.."#"..v.Money_value.."#3")
						else
							sLuaApp:LuaDbg("创建道具失败")
						end
					end
				elseif v.Pet then
					local petData = PetConfig.GetByKeyName(v.Pet)
					if petData then
						local pet = sPetSystem:AddPetEx(Robot, petData.Id, 1, false, "system", "交易行", "系统售卖")
						if pet ~= "" then
							sLuaApp:LuaDbg("试图上架宠物  "..v.Pet)
							sLuaTimerSystem:AddTimerEx(Robot, k*10, 1, "AuctionSystem.RobotSellPet", ""..pet:GetGUID().."#"..v.Money_type.."#"..v.Money_value.."#3")			
						else
							sLuaApp:LuaDbg("创建宠物失败")
						end
					end
				end
				if k == #AuctionSystemSell.Config then
					sLuaTimerSystem:AddTimerEx(Robot, k*10 + 2000, 1, "AuctionSystem.RemoveSellRobot", "")
				end
			end
		end
	end
	sDBVarSystem:SetString("AuctionSystem_SystemSell_Vision", AuctionSystemSell.Vision, 0)
end

function AuctionSystem.RobotSellItem(Robot, timer_guid, item_guid, num, money_type, money_value, time_type)
	AuctionSystem.StartSellItem(Robot, item_guid, num, money_type, money_value, time_type)
end

function AuctionSystem.RobotSellPet(Robot, timer_guid, pet_guid, money_type, money_value, time_type)
	AuctionSystem.StartSellPet(Robot, pet_guid, money_type, money_value, time_type)
end

function AuctionSystem.RemoveSellRobot(Robot)
	sRobotSystem:DestroyRobot(Robot)
end

AuctionSystem.Initialization()