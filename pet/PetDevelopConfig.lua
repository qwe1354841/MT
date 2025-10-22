--宠物养成配置
PetDevelopConfig = {}

--版本号，服务器开启时修改数据 需修改版本号
PetDevelopConfig.Version = "0806.1"

---- 宠物培养 ----
--什么类型的宠物可进行该操作
PetDevelopConfig.MedicinePetType = {1,2,3,4,5,6,7,8,9,10}

--培养物品表	--表配置顺序做为客户端显示顺序 
-- ["Show"]	客户端是否剪影显示 0否 1是
-- ["MaxLimit"]	最大使用个数上限 -1无限制
-- ["Effect"] 物品使用后效果  {效果KeyName, 效果影响数值} --按顺序生效
-- ["OnceMaxNum"] 单次使用最大数量 -- 物品使用效果为 增加随机值且增加的属性有上限 时，一般设置最大数量为1

-- AttrKeyName,AttrValue - 比如 {物理攻击,1} 表示加物理攻击1点 --此处值可负数--此处值可{最小值, 最大值}
-- 复活	 -复活并增加宠物寿命（只有寿命为0可用）
-- 洗点	 - 宠物洗点（后面数值无效）
-- 属性转换 - 与脚本 AttrTransform 属性转换道具对应
PetDevelopConfig.MedicineItem = {
	{["ItemKeyName"] = "初级物攻丹", ["Effect"] = {"物理攻击",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级物攻丹", ["Effect"] = {"物理攻击",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "高级物攻丹", ["Effect"] = {"物理攻击",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "物攻仙丹", ["Effect"] = {"物理攻击",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "物攻神丹", ["Effect"] = {"物理攻击",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级法攻丹", ["Effect"] = {"法术攻击",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级法攻丹", ["Effect"] = {"法术攻击",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级法攻丹", ["Effect"] = {"法术攻击",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "法攻仙丹", ["Effect"] = {"法术攻击",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "法攻神丹", ["Effect"] = {"法术攻击",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "初级物防丹", ["Effect"] = {"物理防御",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级物防丹", ["Effect"] = {"物理防御",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "高级物防丹", ["Effect"] = {"物理防御",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "物防仙丹", ["Effect"] = {"物理防御",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "物防神丹", ["Effect"] = {"物理防御",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级法防丹", ["Effect"] = {"法术防御",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级法防丹", ["Effect"] = {"法术防御",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级法防丹", ["Effect"] = {"法术防御",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "法防仙丹", ["Effect"] = {"法术防御",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "法防神丹", ["Effect"] = {"法术防御",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "初级血量上限丹", ["Effect"] = {"血量上限",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级血量上限丹", ["Effect"] = {"血量上限",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "高级血量上限丹", ["Effect"] = {"血量上限",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "血量上限仙丹", ["Effect"] = {"血量上限",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "血量上限神丹", ["Effect"] = {"血量上限",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级速度丹", ["Effect"] = {"战斗速度",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级速度丹", ["Effect"] = {"战斗速度",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级速度丹", ["Effect"] = {"战斗速度",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "速度仙丹", ["Effect"] = {"战斗速度",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "速度神丹", ["Effect"] = {"战斗速度",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "初级物攻资质丹", ["Effect"] = {"物攻资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级物攻资质丹", ["Effect"] = {"物攻资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},			
	{["ItemKeyName"] = "高级物攻资质丹", ["Effect"] = {"物攻资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "物攻资质仙丹", ["Effect"] = {"物攻资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "物攻资质神丹", ["Effect"] = {"物攻资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级法攻资质丹", ["Effect"] = {"法攻资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级法攻资质丹", ["Effect"] = {"法攻资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级法攻资质丹", ["Effect"] = {"法攻资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "法攻资质仙丹", ["Effect"] = {"法攻资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "法攻资质神丹", ["Effect"] = {"法攻资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "初级物防资质丹", ["Effect"] = {"物防资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级物防资质丹", ["Effect"] = {"物防资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "高级物防资质丹", ["Effect"] = {"物防资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "物防资质仙丹", ["Effect"] = {"物防资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "物防资质神丹", ["Effect"] = {"物防资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级法防资质丹", ["Effect"] = {"法防资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级法防资质丹", ["Effect"] = {"法防资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级法防资质丹", ["Effect"] = {"法防资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "法防资质仙丹", ["Effect"] = {"法防资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "法防资质神丹", ["Effect"] = {"法防资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "初级血量上限资质丹", ["Effect"] = {"血量资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "中级血量上限资质丹", ["Effect"] = {"血量资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "高级血量上限资质丹", ["Effect"] = {"血量资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "血量上限资质仙丹", ["Effect"] = {"血量资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "血量上限资质神丹", ["Effect"] = {"血量资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "初级速度资质丹", ["Effect"] = {"速度资质",1}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "中级速度资质丹", ["Effect"] = {"速度资质",3}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "高级速度资质丹", ["Effect"] = {"速度资质",5}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "速度资质仙丹", ["Effect"] = {"速度资质",{0,4}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},	
	{["ItemKeyName"] = "速度资质神丹", ["Effect"] = {"速度资质",{0,7}}, ["MaxLimit"] = 20, ["Show"] = 0, ["OnceMaxNum"] = 1},		

	{["ItemKeyName"] = "宠物经验丹", ["Effect"] = {"经验",10000}, ["MaxLimit"] = -1, ["Show"] = 1, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "宠物经验丹2", ["Effect"] = {"经验",20000}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "宠物经验丹3", ["Effect"] = {"经验",30000}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "忠诚度1", ["Effect"] = {"宠物忠诚度",10}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "忠诚度2", ["Effect"] = {"宠物忠诚度",30}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "忠诚度3", ["Effect"] = {"宠物忠诚度",50}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "忠诚度4", ["Effect"] = {"宠物忠诚度",100}, ["MaxLimit"] = -1, ["Show"] = 1, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "寿命丹1", ["Effect"] = {"宠物寿命",200}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},		
	{["ItemKeyName"] = "寿命丹2", ["Effect"] = {"宠物寿命",2000}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},	
	{["ItemKeyName"] = "寿命丹3", ["Effect"] = {"宠物寿命",3000}, ["MaxLimit"] = -1, ["Show"] = 1, ["OnceMaxNum"] = 10},		

	{["ItemKeyName"] = "宠物复活药", ["Effect"] = {"复活",3000}, ["MaxLimit"] = -1, ["Show"] = 1, ["OnceMaxNum"] = 1},		
	{["ItemKeyName"] = "宠物大经验丹", ["Effect"] = {"经验",1000000}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 10},		

	{["ItemKeyName"] = "重洗髓丹", ["Effect"] = {"洗点",0}, ["MaxLimit"] = -1, ["Show"] = 1, ["OnceMaxNum"] = 1},

	{["ItemKeyName"] = "宠物洗点1", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点2", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点3", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点4", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点5", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点6", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点7", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点8", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点9", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点10", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点11", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点12", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点13", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点14", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点15", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点16", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点17", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点18", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点19", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	{["ItemKeyName"] = "宠物洗点20", ["Effect"] = {"属性转换",0}, ["MaxLimit"] = -1, ["Show"] = 0, ["OnceMaxNum"] = 1},
	--测试
	--{["ItemKeyName"] = "中级物攻资质丹", ["Effect"] = {"法术攻击",-100,"物理攻击",10}, ["MaxLimit"] = 20, ["Show"] = 1,},
}



--=============================================================

---- 技能学习 ----
--什么类型的宠物可进行该操作
PetDevelopConfig.SkillStudyPetType = {1,2,3,4,5,6,7,8,9,10}
--排除的技能id --技能修炼给的技能，与宠物自身技能无关 -- 脚本 CultivationSkill{宠物攻击, 宠物防御, 封印修炼, 抗封修炼}
PetDevelopConfig.SkillStudyExcept = {6003, 6004, 6007, 6008}
-- 显示技能书剪影 --客户端按顺序显示
PetDevelopConfig.SkillStudyShowItem = {
	"宠物技能6加1",
	"宠物技能8加1",
	"宠物技能10加2",
	"宠物技能13加2",
	"宠物技能16加2",
	"宠物技能18加2",
--	"宠物技能16加3",
--	"宠物技能20加3",
--	"宠物技能24加3",
--	"宠物技能28加3",
--	"宠物技能32加3",
	"迟钝秘籍",
	"追击秘籍",
	"隐身秘籍",
	"鬼魂秘籍",
	"魅惑秘籍",
	"震慑秘籍",
	"破防秘籍",
	"断筋秘籍",
	"剧毒秘籍",
	"舍身一击秘籍",
	"剑气四射秘籍",
	"焚烧秘籍",
	"毁魄秘籍",
	"碎灵秘籍",
	"驱鬼秘籍",
	"烈焰风暴秘籍",
	"雷动九天秘籍",
	"冰封万里秘籍",
	"连击术秘籍",
	"善恶有报秘籍",
	"超级必杀秘籍",
	"超级连击秘籍",
	"超级吸血秘籍",
	"超级蛮力秘籍",
	"超级突击秘籍",
	"超级反弹秘籍",
	"超级复仇秘籍",
	"超级飞行秘籍",
	"超级坚韧秘籍",
	"超级法伤秘籍",
	"超级闪避秘籍",
	"超级凝神秘籍",
	"超级冥思秘籍",
	"超级再生秘籍",
	"超级金睛秘籍",
	"超级迅捷秘籍",
	"超级神佑秘籍",
	"超级命中秘籍",
	"高级必杀秘籍",
	"高级连击秘籍",
	"高级吸血秘籍",
	"高级蛮力秘籍",
	"高级突击秘籍",
	"高级反弹秘籍",
	"高级复仇秘籍",
	"高级飞行秘籍",
	"高级坚韧秘籍",
	"高级法伤秘籍",
	"高级闪避秘籍",
	"高级凝神秘籍",
	"高级冥思秘籍",
	"高级再生秘籍",
	"高级金睛秘籍",
	"高级迅捷秘籍",
	"高级神佑秘籍",
	"高级命中秘籍",
	"必杀秘籍",
	"连击秘籍",
	"吸血秘籍",
	"蛮力秘籍",
	"突击秘籍",
	"反弹秘籍",
	"复仇秘籍",
	"飞行秘籍",
	"坚韧秘籍",
	"法伤秘籍",
	"闪避秘籍",
	"凝神秘籍",
	"冥思秘籍",
	"再生秘籍",
	"金睛秘籍",
	"迅捷秘籍",
	"神佑秘籍",
	"命中秘籍",

}
-- 替换技能的概率 --拥有技能数量 = 百分比 
PetDevelopConfig.SkillStudyReplace = {
	[0] = 0,
	[1] = 0,
	[2] = 20,
	[3] = 50,
	[4] = 60,
	[5] = 70,
	[6] = 75,
	[7] = 76,
	[8] = 80,
	[9] = 85,
	[10] = 90,
	[11] = 95,
}
-- 不同品阶技能书 减少 技能被替换的概率 XXXX(周师傅表示不想要)


--================================================================

---- 宠物还原 ---- 
--宠物还原为pet表中 同一宠物组的宠物 --宠物还原后会提升至原宠物星级，当前资质为一星资质
--什么类型的宠物可进行该操作
PetDevelopConfig.RestorePetType = {1,2,3,}

--宠物还原成同一宠物组下 不同Type的宠物 的概率 --pet表中 同一宠物组 且 可被还原 的宠物
PetDevelopConfig.RestoreProbability = {
	["还原丹"] = {
		-- type为1的宠物 
		["FromType_1"] = {
			{GetType = 1, Rand = 5800},
			{GetType = 2, Rand = 4000},
			{GetType = 3, Rand = 200},
		},
		["FromType_2"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 9800},
			{GetType = 3, Rand = 200},
		},
		["FromType_3"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 0},
			{GetType = 3, Rand = 10000},
		},
	},
	["高级还原丹"] = {
		-- type为1的宠物 
		["FromType_1"] = {
			{GetType = 1, Rand = 2000},
			{GetType = 2, Rand = 6000},
			{GetType = 3, Rand = 2000},
		},
		["FromType_2"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 8000},
			{GetType = 3, Rand = 2000},
		},
		["FromType_3"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 0},
			{GetType = 3, Rand = 10000},
		},
	},
	["超级还原丹"] = {
		-- type为1的宠物 
		["FromType_1"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 5000},
			{GetType = 3, Rand = 5000},
		},
		["FromType_2"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 2000},
			{GetType = 3, Rand = 8000},
		},
		["FromType_3"] = {
			{GetType = 1, Rand = 0},
			{GetType = 2, Rand = 0},
			{GetType = 3, Rand = 10000},
		},
	},
}
-- 还原后 提升资质的百分比 --最终资质=最大资质*提升百分比+程序随机得到资质*（1-提升百分比）
PetDevelopConfig.RestoreTalentUp = {
	["还原丹"] = 0,
	["高级还原丹"] = 50,
	["超级还原丹"] = 75,
}

--还原消耗  --只影响消耗数量 -StarLevel 宠物星级 -CarryLevel pet表中配置
PetDevelopConfig.RestoreConsume = "math.max(CarryLevel / 30, 1)"

--客户端显示 --按顺序
PetDevelopConfig.RestoreShowOrder = {"还原丹", "高级还原丹", "超级还原丹"}

--================================================================

---- 技能提取 ----
-- 技能书是否绑定 = 宠物是否绑定 or 提取卡是否绑定
--什么类型的宠物可进行该操作
PetDevelopConfig.SkillExtractPetType = {1,2,3}
--不能被提取的宠物技能SubType -- [SubType] = "tips_msg"
PetDevelopConfig.SkillExtractNoSubType = {[4] = "宠物特殊技能",} --宠物特殊技能不能提取
--技能提取概率 -- 每张提取卡 提取不同UpSkill的技能 的比重
PetDevelopConfig.SkillExtractProbability = {
	["技能提取卡1"] = {
		["UpSkill_1"] = 9000,
		["UpSkill_2"] = 900,
		["UpSkill_3"] = 100,
	},
	["技能提取卡2"] = {
		["UpSkill_1"] = 900,
		["UpSkill_2"] = 9000,
		["UpSkill_3"] = 100,
	},
	["技能提取卡3"] = {
		["UpSkill_1"] = 500,
		["UpSkill_2"] = 8500,
		["UpSkill_3"] = 1000,
	},
}
-- 不同UpSkill的技能的名字 --宠物没有可提取技能时tips用 
PetDevelopConfig.SkillExtractUpSkillName = {
	[1] = "低级技能",
	[2] = "高级技能",
	[3] = "超级技能",
	[4] = "特殊技能",
}
--客户端显示 --按顺序
PetDevelopConfig.SkillExtractShowOrder = {"技能提取卡1", "技能提取卡2", "技能提取卡3"}

--================================================================

---- 技能绑定 ----
--什么类型的宠物可进行该操作
PetDevelopConfig.SkillBindPetType = {1,2,3,}
--绑定技能消耗道具
PetDevelopConfig.SkillBindItem = "技能绑定符"
--解绑技能消耗道具
PetDevelopConfig.SkillUnbindItem = "技能解绑符"
--宠物身上最多拥有几个绑定技能 --周师傅说超过绑定上限 随机解绑一个
PetDevelopConfig.SkillBindMaxNum = 2 --小于1时逻辑错误


--================================================================
-------- 技能书-技能id 对应表 --技能学习和提取技能用
PetDevelopConfig.BooksSkillId = {
	["必杀秘籍"] = 3001,
	["连击秘籍"] = 3002,
	["吸血秘籍"] = 3003,
	["蛮力秘籍"] = 3004,
	["突击秘籍"] = 3005,
	["反弹秘籍"] = 3006,
	["复仇秘籍"] = 3007,
	["飞行秘籍"] = 3008,
	["坚韧秘籍"] = 3009,
	["法伤秘籍"] = 3010,
	["闪避秘籍"] = 3011,
	["凝神秘籍"] = 3012,
	["冥思秘籍"] = 3013,
	["再生秘籍"] = 3014,
	["金睛秘籍"] = 3015,
	["迅捷秘籍"] = 3016,
	["神佑秘籍"] = 3017,
	["命中秘籍"] = 3018,
	["高级必杀秘籍"] = 3201,
	["高级连击秘籍"] = 3202,
	["高级吸血秘籍"] = 3203,
	["高级蛮力秘籍"] = 3204,
	["高级突击秘籍"] = 3205,
	["高级反弹秘籍"] = 3206,
	["高级复仇秘籍"] = 3207,
	["高级飞行秘籍"] = 3208,
	["高级坚韧秘籍"] = 3209,
	["高级法伤秘籍"] = 3210,
	["高级闪避秘籍"] = 3211,
	["高级凝神秘籍"] = 3212,
	["高级冥思秘籍"] = 3213,
	["高级再生秘籍"] = 3214,
	["高级金睛秘籍"] = 3215,
	["高级迅捷秘籍"] = 3216,
	["高级神佑秘籍"] = 3217,
	["高级命中秘籍"] = 3218,
	["超级必杀秘籍"] = 3401,
	["超级连击秘籍"] = 3402,
	["超级吸血秘籍"] = 3403,
	["超级蛮力秘籍"] = 3404,
	["超级突击秘籍"] = 3405,
	["超级反弹秘籍"] = 3406,
	["超级复仇秘籍"] = 3407,
	["超级飞行秘籍"] = 3408,
	["超级坚韧秘籍"] = 3409,
	["超级法伤秘籍"] = 3410,
	["超级闪避秘籍"] = 3411,
	["超级凝神秘籍"] = 3412,
	["超级冥思秘籍"] = 3413,
	["超级再生秘籍"] = 3414,
	["超级金睛秘籍"] = 3415,
	["超级迅捷秘籍"] = 3416,
	["超级神佑秘籍"] = 3417,
	["超级命中秘籍"] = 3418,
	
	["迟钝秘籍"] = 3601,
	["追击秘籍"] = 3602,
	["隐身秘籍"] = 3603,
	["鬼魂秘籍"] = 3604,
	["魅惑秘籍"] = 3605,
	["震慑秘籍"] = 3606,
	["破防秘籍"] = 3607,
	["断筋秘籍"] = 3608,
	["剧毒秘籍"] = 3609,
	["舍身一击秘籍"] = 3610,
	["剑气四射秘籍"] = 3611,
	["焚烧秘籍"] = 3612,
	["毁魄秘籍"] = 3613,
	["碎灵秘籍"] = 3614,
	["驱鬼秘籍"] = 3615,
	["烈焰风暴秘籍"] = 3616,
	["雷动九天秘籍"] = 3617,
	["冰封万里秘籍"] = 3618,
	["连击术秘籍"] = 3634,
	["善恶有报秘籍"] = 3631,
}

function PetDevelopConfig.Initialization()
	PetDevelopConfig.MedicinePetTypeEx = {}
	for _,v in ipairs(PetDevelopConfig.MedicinePetType) do
		PetDevelopConfig.MedicinePetTypeEx[v] = true
	end
	PetDevelopConfig.SkillStudyPetTypeEx = {}
	for _,v in ipairs(PetDevelopConfig.SkillStudyPetType) do
		PetDevelopConfig.SkillStudyPetTypeEx[v] = true
	end
	PetDevelopConfig.SkillStudyExceptEx = {}
	for _,v in ipairs(PetDevelopConfig.SkillStudyExcept) do
		PetDevelopConfig.SkillStudyExceptEx[v] = true
	end
	
	PetDevelopConfig.RestorePetTypeEx = {}
	for _,v in ipairs(PetDevelopConfig.RestorePetType) do
		PetDevelopConfig.RestorePetTypeEx[v] = true
	end
	PetDevelopConfig.SkillExtractPetTypeEx = {}
	for _,v in ipairs(PetDevelopConfig.SkillExtractPetType) do
		PetDevelopConfig.SkillExtractPetTypeEx[v] = true
	end
	PetDevelopConfig.SkillBindPetTypeEx = {}
	for _,v in ipairs(PetDevelopConfig.SkillBindPetType) do
		PetDevelopConfig.SkillBindPetTypeEx[v] = true
	end
	
	PetDevelopConfig.SkillIdBooks = {}
	for k,v in pairs(PetDevelopConfig.BooksSkillId) do
		PetDevelopConfig.SkillIdBooks[v] = k
	end
	
	
	if not AttrTransform then
		require("item/AttrTransform")
	end
	for _,v in ipairs(PetDevelopConfig.MedicineItem) do
		if v["MaxLimit"] ~= -1 then
			local item_data = ItemConfig.GetByKeyName(v["ItemKeyName"])
			if not item_data then
				sLuaApp:LuaErr("PetDevelopConfig.Initialization()  ItemConfig 不存在 "..v["ItemKeyName"])
				return 
			end
			sCustomVarSystem:SetBroadcastScope(1, "PetDevelop_MedicineItemUsedNum_".. item_data.Id, 1)--注册自定义变量
		end
		local attr_trans_config = AttrTransform.ItemConfig[v["ItemKeyName"]]
		if attr_trans_config then
			v["AddPoint"] = attr_trans_config["AddPoint"]
			v["SubPoint"] = attr_trans_config["SubPoint"]
		end
	end
	
	-- 发给客户端用
	PetDevelopConfig.MedicineGetDataStr = [[
		if GlobalProcessing then
			GlobalProcessing.MedicinePetType = ]]..Lua_tools.serialize(PetDevelopConfig.MedicinePetTypeEx)..[[
			GlobalProcessing.MedicineItem = ]]..Lua_tools.serialize(PetDevelopConfig.MedicineItem)..[[
			GlobalProcessing.PetDevelopVersion = ']]..PetDevelopConfig.Version..[['
			GlobalProcessing.SetPetEduData()
		end
	]]
	--sLuaApp:LuaErr(PetDevelopConfig.MedicineGetDataStr)
	PetDevelopConfig.SkillStudyGetDataStr = [[
		if GlobalProcessing then
			GlobalProcessing.SkillStudyPetType = ]]..Lua_tools.serialize(PetDevelopConfig.SkillStudyPetTypeEx)..[[
			GlobalProcessing.SkillStudyShowItem = ]]..Lua_tools.serialize(PetDevelopConfig.SkillStudyShowItem)..[[
			GlobalProcessing.SetPetEduData()
		end
	]]
	PetDevelopConfig.RestoreGetDataStr = [[
		if GlobalProcessing then
			GlobalProcessing.RestorePetType = ]]..Lua_tools.serialize(PetDevelopConfig.RestorePetTypeEx)..[[
			GlobalProcessing.RestoreConsume = ]]..Lua_tools.serialize(PetDevelopConfig.RestoreConsume)..[[
			GlobalProcessing.RestoreShowOrder = ]]..Lua_tools.serialize(PetDevelopConfig.RestoreShowOrder)..[[
		end
		if PetUI then
			PetUI.Refresh()
		end
	]]
	PetDevelopConfig.SkillExtractGetDataStr = [[
		if GlobalProcessing then
			GlobalProcessing.SkillExtractPetType = ]]..Lua_tools.serialize(PetDevelopConfig.SkillExtractPetTypeEx)..[[
			GlobalProcessing.SkillExtractShowOrder = ]]..Lua_tools.serialize(PetDevelopConfig.SkillExtractShowOrder)..[[
		end
		if PetUI then
			PetUI.Refresh()
		end
	]]
	PetDevelopConfig.SkillBindGetDataStr = [[
		if GlobalProcessing then
			GlobalProcessing.SkillBindPetType = ]]..Lua_tools.serialize(PetDevelopConfig.SkillBindPetTypeEx)..[[
			GlobalProcessing.SkillBindItem = "]]..PetDevelopConfig.SkillBindItem..[["
			GlobalProcessing.SkillUnbindItem = "]]..PetDevelopConfig.SkillUnbindItem..[["
		end
		if PetUI then
			PetUI.Refresh()
		end
	]]
	
end
PetDevelopConfig.Initialization()