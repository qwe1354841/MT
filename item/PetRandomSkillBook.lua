--宠物随机技能书
PetRandomSkillBook = {}

PetRandomSkillBook.BooksConfig = {
	["宠物随机技能书"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
			{Num = 4, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 12,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	["宠物技能6加1"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 6,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
		},
	},
	["宠物技能8加1"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 8,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
		},
	},
	["宠物技能10加2"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 10,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
		},
	},
	["宠物技能13加2"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 13,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
		},
	},
	["宠物技能16加2"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 16,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
		},
	},
	["宠物技能18加2"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 18,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
		},
	},
	["宠物技能16加3"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 16,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	["宠物技能20加3"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 20,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	["宠物技能24加3"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 24,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	["宠物技能28加3"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 28,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	["宠物技能32加3"] = {
		--可以使用此书的宠物的type
		["PetType"] = {1,2,3,4,5,6,7,8,9},
		--随机到技能数量的权重
		["SkillNumRand"] = {
			{Num = 0, Rand = 100},
			{Num = 1, Rand = 100},
			{Num = 2, Rand = 100},
			{Num = 3, Rand = 100},
		},
		--使用该技能书能获得的最大技能数量
		["SkillMaxNum"] = 32,
		--可获得技能权重
		["SkillList"] = {
			{SkillKeyName = "必杀", Rand = 100},
			{SkillKeyName = "连击", Rand = 100},
			{SkillKeyName = "吸血", Rand = 100},
			{SkillKeyName = "蛮力", Rand = 100},
			{SkillKeyName = "突击", Rand = 100},
			{SkillKeyName = "反弹", Rand = 100},
			{SkillKeyName = "复仇", Rand = 100},
			{SkillKeyName = "飞行", Rand = 100},
			{SkillKeyName = "坚韧", Rand = 100},
			{SkillKeyName = "法伤", Rand = 100},
			{SkillKeyName = "闪避", Rand = 100},
			{SkillKeyName = "凝神", Rand = 100},
			{SkillKeyName = "冥思", Rand = 100},
			{SkillKeyName = "再生", Rand = 100},
			{SkillKeyName = "金睛", Rand = 100},
			{SkillKeyName = "迅捷", Rand = 100},
			{SkillKeyName = "神佑", Rand = 100},
			{SkillKeyName = "命中", Rand = 100},
			{SkillKeyName = "高级必杀", Rand = 100},
			{SkillKeyName = "高级连击", Rand = 100},
			{SkillKeyName = "高级吸血", Rand = 100},
			{SkillKeyName = "高级蛮力", Rand = 100},
			{SkillKeyName = "高级突击", Rand = 100},
			{SkillKeyName = "高级反弹", Rand = 100},
			{SkillKeyName = "高级复仇", Rand = 100},
			{SkillKeyName = "高级飞行", Rand = 100},
			{SkillKeyName = "高级坚韧", Rand = 100},
			{SkillKeyName = "高级法伤", Rand = 100},
			{SkillKeyName = "高级闪避", Rand = 100},
			{SkillKeyName = "高级凝神", Rand = 100},
			{SkillKeyName = "高级冥思", Rand = 100},
			{SkillKeyName = "高级再生", Rand = 100},
			{SkillKeyName = "高级金睛", Rand = 100},
			{SkillKeyName = "高级迅捷", Rand = 100},
			{SkillKeyName = "高级神佑", Rand = 100},
			{SkillKeyName = "高级命中", Rand = 100},
			{SkillKeyName = "超级必杀", Rand = 100},
			{SkillKeyName = "超级连击", Rand = 100},
			{SkillKeyName = "超级吸血", Rand = 100},
			{SkillKeyName = "超级蛮力", Rand = 100},
			{SkillKeyName = "超级突击", Rand = 100},
			{SkillKeyName = "超级反弹", Rand = 100},
			{SkillKeyName = "超级复仇", Rand = 100},
			{SkillKeyName = "超级飞行", Rand = 100},
			{SkillKeyName = "超级坚韧", Rand = 100},
			{SkillKeyName = "超级法伤", Rand = 100},
			{SkillKeyName = "超级闪避", Rand = 100},
			{SkillKeyName = "超级凝神", Rand = 100},
			{SkillKeyName = "超级冥思", Rand = 100},
			{SkillKeyName = "超级再生", Rand = 100},
			{SkillKeyName = "超级金睛", Rand = 100},
			{SkillKeyName = "超级迅捷", Rand = 100},
			{SkillKeyName = "超级神佑", Rand = 100},
			{SkillKeyName = "超级命中", Rand = 100},
		},
	},
	
}


function PetRandomSkillBook.OnUse(player, pet, item, check_mod)-- 保证pet item 正确
	local item_keyname = item:GetKeyName()
	local book_config = PetRandomSkillBook.BooksConfig[item_keyname]
	
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	
	if not PetRandomSkillBook.PetTypeEx[item_keyname][pet_type] then
		sLuaApp:NotifyTipsMsg(player, "宠物品质不足，无法使用此随机技能书！")
		return
	end
	
	local skill_con = pet:GetSkillContainer()
	local has_skill_tb = PetMix.GetSkillTb(pet)
	
	-- --突破技能数量
	-- local up_star_skill_num = 0
	-- local pet_star_level = pet:GetInt("PetStarLevel")
	-- for i = 1, pet_star_level do
		-- if pet:GetInt("PetUpStar_Skill_"..i) ~= 0 then
			-- up_star_skill_num = up_star_skill_num + 1
		-- end
	-- end
	
	local skill_max_num = book_config["SkillMaxNum"]
	local now_skill_num = #has_skill_tb
	if now_skill_num >= skill_max_num then
		sLuaApp:NotifyTipsMsg(player, "这本书只能对"..skill_max_num.."个技能（不含突破技能）内的宠物使用哦！")
		return
	end
	
	local pet_is_bind = pet:IsBind()
	local item_is_bind = item:IsBound()
	
	--消耗物品
	if sItemSystem:ConsumeItem(item, 1, "system", "宠物随机技能学习", "随机技能学习消耗") ~= 0 then
		sLuaApp:LuaErr("PetRandomSkillBook.OnUse  ConsumeItem 错误")
		return
	end
	
	--设置绑定
	if not pet_is_bind and item_is_bind then
		if sPetSystem:BindPet(pet, true) ~= 0 then
			sLuaApp:LuaErr("PetRandomSkillBook.OnUse BindPet 错误")
			return
		end
	end
	
	-- 获得技能的数量
	local num_rand_tb = book_config["SkillNumRand"]
	local num_rand_tb_index = Lua_tools.PlayerStartRandom(num_rand_tb,"PetRandomSkillBook_"..item_keyname,1, true, true)
	local get_skill_num = num_rand_tb[num_rand_tb_index[1]]["Num"]
	
	local diff_skill_num = skill_max_num - now_skill_num --最多可获得技能数量
	if diff_skill_num < get_skill_num then
		get_skill_num = diff_skill_num
	end
	
	-- 已有技能id表
	local has_skill_id_tb = {}
	for _,v in ipairs(has_skill_tb) do
		has_skill_id_tb[v:GetId()] = true
	end
	
	--获得的技能id表
	local get_skill_id_tb = {}
	local skill_rand_tb = PetRandomSkillBook.SkillRandTb[item_keyname]
	local rand_max = skill_rand_tb[#skill_rand_tb][2]
	for i = 1, get_skill_num do 
		local get_skill_id = 0
		for j = 1, 10 do
			local get_rand = sLuaApp:RandInteger(1, rand_max)
			for _,v in ipairs(skill_rand_tb) do
				if get_rand <= v[2] then
					get_skill_id = v[1]
					break
				end
			end
			if not has_skill_id_tb[get_skill_id] and not get_skill_id_tb[get_skill_id] and get_skill_id ~= 0 then
				get_skill_id_tb[get_skill_id] = true
				break
			end
		end
	end
	
	if not next(get_skill_id_tb) then
		local pet_link_str = PetDevelop.GetLinkFunc["Pet"](pet:GetName(), player:GetGUID(), pet:GetGUID(), pet_type)
		sLuaApp:NotifyTipsMsg(player,"您的宠物"..pet_link_str.."未学会技能！")
		local str = [[
			if PetUI then
				PetUI.RefreshLearningTab()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	for new_skill_id in pairs(get_skill_id_tb) do
		local new_skill = skill_con:CreateSkill(new_skill_id,1,1,true)
		if new_skill then
			local pet_link_str = PetDevelop.GetLinkFunc["Pet"](pet:GetName(), player:GetGUID(), pet:GetGUID(), pet_type)
			local new_skill_data = SkillConfig.GetById(new_skill_id)
			local new_skill_name = new_skill_data.Name
			local new_skill_grade = new_skill_data.UpSkill
			local new_skill_link_str = PetDevelop.GetLinkFunc["Skill"](new_skill_name, 0, new_skill_id, new_skill_grade)
			sLuaApp:NotifyTipsMsg(player,"您的宠物"..pet_link_str.."学会了技能"..new_skill_link_str.."！")
		else
			sLuaApp:LuaErr("PetRandomSkillBook.OnUse CreateSkill 失败 "..new_skill_id)
		end
	end
	
	--通知刷新
	
	return
end


function PetRandomSkillBook.Initialization()
	PetRandomSkillBook.PetTypeEx = {}
	for k,v in pairs(PetRandomSkillBook.BooksConfig) do
		PetRandomSkillBook.PetTypeEx[k] = {}
		for _,b in ipairs(v["PetType"]) do
			PetRandomSkillBook.PetTypeEx[k][b] = true
		end
	end
	--sLuaApp:LuaErr("PetRandomSkillBook.PetTypeEx  "..Lua_tools.serialize(PetRandomSkillBook.PetTypeEx))
	
	PetRandomSkillBook.SkillRandTb = {}
	for k,v in pairs(PetRandomSkillBook.BooksConfig) do
		PetRandomSkillBook.SkillRandTb[k] = {} -- {skill_id, rand}
		local rand = 0
		for _,b in ipairs(v["SkillList"]) do
			local skill_data = SkillConfig.GetByKeyName(b["SkillKeyName"])
			if not skill_data then
				sLuaApp:LuaErr("PetRandomSkillBook.Initialization  SkillConfig 不存在"..b["SkillKeyName"])
				return
			end
			rand = rand + b["Rand"]
			table.insert(PetRandomSkillBook.SkillRandTb[k], {skill_data.Id, rand})
		end
	end
	--sLuaApp:LuaErr("PetRandomSkillBook.SkillRandTb  "..Lua_tools.serialize(PetRandomSkillBook.SkillRandTb))
end
PetRandomSkillBook.Initialization()