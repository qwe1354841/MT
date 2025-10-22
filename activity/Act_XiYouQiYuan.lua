--西游奇缘活动脚本
Act_XiYouQiYuan = {}
Act_XiYouQiYuan.ShowItem =  "61024,61025,28102,28103"
Act_XiYouQiYuan.Active_Add = 1
Act_XiYouQiYuan.Active_Max = 10
Act_XiYouQiYuan.Active_ID = 78

Act_XiYouQiYuan.Config = {
	--每日答题次数/题目数量
	['DayCount'] = 10,
	--答对几题给额外奖励
	['RewardCount'] = 7,
	--结束时间
	['EndTime'] = "24:00:00",
	--每一题答对给的经验
	['Exp'] = 'return level*500',
	--每一题答对给的银币
	['BindGold'] = 'return level*50',
	--每一题打错奖励的倍率
	['Failed'] = 0.8,
	--额外奖励给的道具
	['ItemList'] = {"西游答题礼包1",1,0},
	--结束奖励
	['ItemList_End'] = {"西游答题礼包2",1,0},
	--题目列表
	['Question'] ={
		 Id_1 = {Id = 1, Ask = "以下哪个角色有可能是西海龙宫的弟子？", Link = 0, Answer1 = "烟云客", AnswerPic1 = 1900400030, Answer2 = "花弄影", AnswerPic2 = 1900400090, Answer3 = "青丘狐", AnswerPic3 = 1900400100, AnswerModel1 = 3, AnswerModel2 = 9, AnswerModel3 = 10, Max = 1,Now = 1},
		 Id_2 = {Id = 2, Ask = "以下哪个角色有可能是旃檀功德佛的弟子？", Link = 0, Answer1 = "冥河使", AnswerPic1 = 1900400040, Answer2 = "谪剑仙", AnswerPic2 = 1900400010, Answer3 = "烟云客", AnswerPic3 = 1900400030, AnswerModel1 = 4, AnswerModel2 = 1, AnswerModel3 = 3, Max = 1,Now = 1},
		 Id_3 = {Id = 3, Ask = "谁曾经大闹天宫？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "虎力大仙", AnswerPic2 = 1900452370, Answer3 = "小白龙", AnswerPic3 = 1900452830, AnswerModel1 = 5279, AnswerModel2 = 5237, AnswerModel3 = 5283, Max = 1,Now = 1},
		 Id_4 = {Id = 4, Ask = "以下哪个是孙悟空的师傅？", Link = 0, Answer1 = "唐僧", AnswerPic1 = 1900452800, Answer2 = "太上老君", AnswerPic2 = 1900452980, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5280, AnswerModel2 = 5298, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_5 = {Id = 5, Ask = "找出2个女性可选角色", Link = 10001, Answer1 = "花弄影", AnswerPic1 = 1900400090, Answer2 = "罗刹女", AnswerPic2 = 1900453010, Answer3 = "地涌夫人", AnswerPic3 = 1900453160, AnswerModel1 = 9, AnswerModel2 = 5301, AnswerModel3 = 5316, Max = 2,Now = 1},
		 Id_6 = {Id = 6, Ask = "以下谁是牛魔王的妻子？", Link = 0, Answer1 = "罗刹女", AnswerPic1 = 1900453010, Answer2 = "地涌夫人", AnswerPic2 = 1900453160, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5301, AnswerModel2 = 5316, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_7 = {Id = 7, Ask = "哪个神仙年幼时和父亲不合？", Link = 0, Answer1 = "哪吒", AnswerPic1 = 1900452960, Answer2 = "如意真仙", AnswerPic2 = 1900451440, Answer3 = "灵吉菩萨", AnswerPic3 = 1900452890, AnswerModel1 = 5296, AnswerModel2 = 5144, AnswerModel3 = 5289, Max = 1,Now = 1},
		 Id_8 = {Id = 8, Ask = "以下谁是李靖的孩子？", Link = 0, Answer1 = "哪吒", AnswerPic1 = 1900452960, Answer2 = "小白龙", AnswerPic2 = 1900452830, Answer3 = "婴灵", AnswerPic3 = 1900451430, AnswerModel1 = 5296, AnswerModel2 = 5283, AnswerModel3 = 5143, Max = 1,Now = 1},
		 Id_9 = {Id = 9, Ask = "哪个是平顶山的妖怪？", Link = 0, Answer1 = "金角大王", AnswerPic1 = 1900453110, Answer2 = "白无常", AnswerPic2 = 1900452950, Answer3 = "辟寒大王", AnswerPic3 = 1900453130, AnswerModel1 = 5311, AnswerModel2 = 5295, AnswerModel3 = 5313, Max = 1,Now = 1},
		 Id_10 = {Id = 10, Ask = "以下谁是金蝉子转世？", Link = 0, Answer1 = "唐僧", AnswerPic1 = 1900452800, Answer2 = "烟云客", AnswerPic2 = 1900400030, Answer3 = "九灵元圣", AnswerPic3 = 1900453260, AnswerModel1 = 5280, AnswerModel2 = 3, AnswerModel3 = 5326, Max = 1,Now = 1},
		 Id_11 = {Id = 11, Ask = "电影大话西游中白晶晶喜欢的人是谁？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "唐僧", AnswerPic2 = 1900452800, Answer3 = "小白龙", AnswerPic3 = 1900452830, AnswerModel1 = 5279, AnswerModel2 = 5280, AnswerModel3 = 5283, Max = 1,Now = 1},
		 Id_12 = {Id = 12, Ask = "以下谁有可能是小白龙的师傅？", Link = 0, Answer1 = "唐僧", AnswerPic1 = 1900452800, Answer2 = "金蝉子", AnswerPic2 = 1900453250, Answer3 = "辟寒大王", AnswerPic3 = 1900453130, AnswerModel1 = 5280, AnswerModel2 = 5325, AnswerModel3 = 5313, Max = 1,Now = 1},
		 Id_13 = {Id = 13, Ask = "猪八戒最有可能吓到谁？", Link = 0, Answer1 = "小孩", AnswerPic1 = 1900451420, Answer2 = "民女", AnswerPic2 = 1900452320, Answer3 = "鬼怪", AnswerPic3 = 1900451410, AnswerModel1 = 5142, AnswerModel2 = 5232, AnswerModel3 = 5141, Max = 1,Now = 1},
		 Id_14 = {Id = 14, Ask = "以下哪个是紫霞仙子的徒弟？", Link = 0, Answer1 = "春十三娘", AnswerPic1 = 1900453200, Answer2 = "地涌夫人", AnswerPic2 = 1900453160, Answer3 = "罗刹女", AnswerPic3 = 1900453010, AnswerModel1 = 5320, AnswerModel2 = 5316, AnswerModel3 = 5301, Max = 1,Now = 1},
		 Id_15 = {Id = 15, Ask = "科举殿试是谁主持进行的？", Link = 0, Answer1 = "房玄龄", AnswerPic1 = 1900452230, Answer2 = "镇元子", AnswerPic2 = 1900452510, Answer3 = "李世民", AnswerPic3 = 1900452560, AnswerModel1 = 5223, AnswerModel2 = 5251, AnswerModel3 = 5256, Max = 1,Now = 1},
		 Id_16 = {Id = 16, Ask = "以下角色谁被观音菩萨套上箍？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "猪八戒", AnswerPic2 = 1900452810, Answer3 = "灵感大王", AnswerPic3 = 1900453090, AnswerModel1 = 5279, AnswerModel2 = 5281, AnswerModel3 = 5309, Max = 1,Now = 1},
		 Id_17 = {Id = 17, Ask = "以下谁有可能是谪剑仙的师傅？", Link = 10003, Answer1 = "斗战胜佛", AnswerPic1 = 1900452730, Answer2 = "旃檀功德佛", AnswerPic2 = 1900452740, Answer3 = "金身罗汉", AnswerPic3 = 1900452760, AnswerModel1 = 5273, AnswerModel2 = 5274, AnswerModel3 = 5276, Max = 2,Now = 1},
		 Id_18 = {Id = 18, Ask = "以下谁有可能是海蛟灵的师傅？", Link = 10004, Answer1 = "净坛使者", AnswerPic1 = 1900452750, Answer2 = "斗战胜佛", AnswerPic2 = 1900452730, Answer3 = "旃檀功德佛", AnswerPic3 = 1900452740, AnswerModel1 = 5275, AnswerModel2 = 5273, AnswerModel3 = 5274, Max = 2,Now = 1},
		 Id_19 = {Id = 19, Ask = "以下谁有可能是飞翼姬的师傅？", Link = 10005, Answer1 = "旃檀功德佛", AnswerPic1 = 1900452740, Answer2 = "斗战胜佛", AnswerPic2 = 1900452730, Answer3 = "金身罗汉", AnswerPic3 = 1900452760, AnswerModel1 = 5274, AnswerModel2 = 5273, AnswerModel3 = 5276, Max = 2,Now = 1},
		 Id_20 = {Id = 20, Ask = "以下谁有可能是冥河使的师傅？", Link = 10006, Answer1 = "旃檀功德佛", AnswerPic1 = 1900452740, Answer2 = "斗战胜佛", AnswerPic2 = 1900452730, Answer3 = "金身罗汉", AnswerPic3 = 1900452760, AnswerModel1 = 5274, AnswerModel2 = 5273, AnswerModel3 = 5276, Max = 2,Now = 1},
		 Id_21 = {Id = 21, Ask = "谁曾经想用八卦炉炼化孙悟空？", Link = 0, Answer1 = "太上老君", AnswerPic1 = 1900452980, Answer2 = "李靖", AnswerPic2 = 1900452940, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5298, AnswerModel2 = 5294, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_22 = {Id = 22, Ask = "找出2个勾魂使者", Link = 10007, Answer1 = "黑无常", AnswerPic1 = 1900452780, Answer2 = "行者游魂", AnswerPic2 = 1900451490, Answer3 = "白骨夫人", AnswerPic3 = 1900451320, AnswerModel1 = 5278, AnswerModel2 = 5149, AnswerModel3 = 5132, Max = 2,Now = 1},
		 Id_23 = {Id = 23, Ask = "以下谁是花果山的门派师傅？", Link = 0, Answer1 = "斗战胜佛", AnswerPic1 = 1900452730, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "李靖", AnswerPic3 = 1900452940, AnswerModel1 = 5273, AnswerModel2 = 5278, AnswerModel3 = 5294, Max = 1,Now = 1},
		 Id_24 = {Id = 24, Ask = "以下谁是流沙界的门派师傅？", Link = 0, Answer1 = "金身罗汉", AnswerPic1 = 1900452760, Answer2 = "镇元子", AnswerPic2 = 1900452510, Answer3 = "春十三娘", AnswerPic3 = 1900453200, AnswerModel1 = 5276, AnswerModel2 = 5251, AnswerModel3 = 5320, Max = 1,Now = 1},
		 Id_25 = {Id = 25, Ask = "以下谁是慈恩寺的门派师傅？", Link = 0, Answer1 = "旃檀功德佛", AnswerPic1 = 1900452740, Answer2 = "金蝉子", AnswerPic2 = 1900453250, Answer3 = "金角大王", AnswerPic3 = 1900453110, AnswerModel1 = 5274, AnswerModel2 = 5325, AnswerModel3 = 5311, Max = 1,Now = 1},
		 Id_26 = {Id = 26, Ask = "电影大话西游中，谁是白晶晶的好姐妹？", Link = 0, Answer1 = "春十三娘", AnswerPic1 = 1900453200, Answer2 = "地涌夫人", AnswerPic2 = 1900453160, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5320, AnswerModel2 = 5316, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_27 = {Id = 27, Ask = "以下谁的武器是斧子？", Link = 0, Answer1 = "程咬金", AnswerPic1 = 1900452990, Answer2 = "金角大王", AnswerPic2 = 1900453110, Answer3 = "金翅大鹏王", AnswerPic3 = 1900453240, AnswerModel1 = 5299, AnswerModel2 = 5311, AnswerModel3 = 5324, Max = 1,Now = 1},
		 Id_28 = {Id = 28, Ask = "以下是谁托塔天王的义女？", Link = 0, Answer1 = "地涌夫人", AnswerPic1 = 1900453160, Answer2 = "白骨夫人", AnswerPic2 = 1900451320, Answer3 = "春十三娘", AnswerPic3 = 1900453200, AnswerModel1 = 5316, AnswerModel2 = 5132, AnswerModel3 = 5320, Max = 1,Now = 1},
		 Id_29 = {Id = 29, Ask = "金箍棒是谁锻造的？", Link = 0, Answer1 = "太上老君", AnswerPic1 = 1900452980, Answer2 = "东海龙王", AnswerPic2 = 1900452580, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5298, AnswerModel2 = 5258, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_30 = {Id = 30, Ask = "以下哪个侍从是物攻型侍从？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "龙王", AnswerPic2 = 1900452580, Answer3 = "金池长老", AnswerPic3 = 1900453250, AnswerModel1 = 5279, AnswerModel2 = 5258, AnswerModel3 = 5325, Max = 1,Now = 1},
		 Id_31 = {Id = 31, Ask = "以下哪个侍从是物攻型侍从？", Link = 0, Answer1 = "六耳猕猴", AnswerPic1 = 1900452790, Answer2 = "如意真仙", AnswerPic2 = 1900451440, Answer3 = "地涌夫人", AnswerPic3 = 1900453160, AnswerModel1 = 5279, AnswerModel2 = 5144, AnswerModel3 = 5316, Max = 1,Now = 1},
		 Id_32 = {Id = 32, Ask = "以下哪个侍从是法攻型侍从？", Link = 0, Answer1 = "罗刹女", AnswerPic1 = 1900453010, Answer2 = "六耳猕猴", AnswerPic2 = 1900452790, Answer3 = "羊力大仙", AnswerPic3 = 1900452390, AnswerModel1 = 5301, AnswerModel2 = 5279, AnswerModel3 = 5239, Max = 1,Now = 1},
		 Id_33 = {Id = 33, Ask = "以下哪个侍从是法攻型侍从？", Link = 0, Answer1 = "龙王", AnswerPic1 = 1900452580, Answer2 = "观音菩萨", AnswerPic2 = 1900453050, Answer3 = "李靖", AnswerPic3 = 1900452940, AnswerModel1 = 5258, AnswerModel2 = 5305, AnswerModel3 = 5294, Max = 1,Now = 1},
		 Id_34 = {Id = 34, Ask = "以下哪个侍从是控制型侍从？", Link = 0, Answer1 = "镇元子", AnswerPic1 = 1900452510, Answer2 = "灵吉菩萨", AnswerPic2 = 1900452890, Answer3 = "太上老君", AnswerPic3 = 1900452980, AnswerModel1 = 5251, AnswerModel2 = 5289, AnswerModel3 = 5298, Max = 1,Now = 1},
		 Id_35 = {Id = 35, Ask = "以下哪个侍从是辅助型侍从？", Link = 0, Answer1 = "白无常", AnswerPic1 = 1900452950, Answer2 = "唐僧", AnswerPic2 = 1900452800, Answer3 = "牛魔王", AnswerPic3 = 1900453210, AnswerModel1 = 5295, AnswerModel2 = 5280, AnswerModel3 = 5321, Max = 1,Now = 1},
		 Id_36 = {Id = 36, Ask = "以下哪个侍从是治疗型侍从？", Link = 0, Answer1 = "观音菩萨", AnswerPic1 = 1900453050, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "混世魔王", AnswerPic3 = 1900451060, AnswerModel1 = 5305, AnswerModel2 = 5278, AnswerModel3 = 5106, Max = 1,Now = 1},
		 Id_37 = {Id = 37, Ask = "以下哪个侍从是治疗型侍从？", Link = 0, Answer1 = "地涌夫人", AnswerPic1 = 1900453160, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "杨戬", AnswerPic3 = 1900452930, AnswerModel1 = 5316, AnswerModel2 = 5278, AnswerModel3 = 5293, Max = 1,Now = 1},
		 Id_38 = {Id = 38, Ask = "以下哪个侍从是辅助型侍从？", Link = 0, Answer1 = "太上老君", AnswerPic1 = 1900452980, Answer2 = "灵吉菩萨", AnswerPic2 = 1900452890, Answer3 = "镇元子", AnswerPic3 = 1900452510, AnswerModel1 = 5298, AnswerModel2 = 5289, AnswerModel3 = 5251, Max = 1,Now = 1},
		 Id_39 = {Id = 39, Ask = "以下哪个侍从是辅助型侍从？", Link = 0, Answer1 = "李靖", AnswerPic1 = 1900452940, Answer2 = "如意真仙", AnswerPic2 = 1900451440, Answer3 = "金角大王", AnswerPic3 = 1900453110, AnswerModel1 = 5294, AnswerModel2 = 5144, AnswerModel3 = 5311, Max = 1,Now = 1},
		 Id_40 = {Id = 40, Ask = "哪个神仙年幼时和父亲不合？", Link = 0, Answer1 = "哪吒", AnswerPic1 = 1900452960, Answer2 = "如意真仙", AnswerPic2 = 1900451440, Answer3 = "灵吉菩萨", AnswerPic3 = 1900452890, AnswerModel1 = 5296, AnswerModel2 = 5144, AnswerModel3 = 5289, Max = 1,Now = 1},
		 Id_41 = {Id = 41, Ask = "谁在奈何桥边熬制孟婆汤？", Link = 0, Answer1 = "孟婆", AnswerPic1 = 1900453060, Answer2 = "白无常", AnswerPic2 = 1900452950, Answer3 = "黑无常", AnswerPic3 = 1900452780, AnswerModel1 = 5306, AnswerModel2 = 5295, AnswerModel3 = 5278, Max = 1,Now = 1},
		 Id_42 = {Id = 42, Ask = "哪个神仙喜欢养狗？", Link = 0, Answer1 = "杨戬", AnswerPic1 = 1900452930, Answer2 = "哪吒", AnswerPic2 = 1900452960, Answer3 = "李靖", AnswerPic3 = 1900452940, AnswerModel1 = 5293, AnswerModel2 = 5296, AnswerModel3 = 5294, Max = 1,Now = 1},
		 Id_43 = {Id = 43, Ask = "找出唐僧的3个徒弟", Link = 10008, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "程咬金", AnswerPic2 = 1900452990, Answer3 = "哪吒", AnswerPic3 = 1900452960, AnswerModel1 = 5279, AnswerModel2 = 5299, AnswerModel3 = 5296, Max = 3,Now = 1},
		 Id_44 = {Id = 44, Ask = "孙悟空请谁来帮忙战胜了九头虫？", Link = 0, Answer1 = "杨戬", AnswerPic1 = 1900452930, Answer2 = "观音菩萨", AnswerPic2 = 1900453050, Answer3 = "灵吉菩萨", AnswerPic3 = 1900452890, AnswerModel1 = 5293, AnswerModel2 = 5305, AnswerModel3 = 5289, Max = 1,Now = 1},
		 Id_45 = {Id = 45, Ask = "找出2个拥有翅膀的主角", Link = 10010, Answer1 = "飞翼姬", AnswerPic1 = 1900400020, Answer2 = "烟云客", AnswerPic2 = 1900400030, Answer3 = "冥河使", AnswerPic3 = 1900400040, AnswerModel1 = 2, AnswerModel2 = 3, AnswerModel3 = 4, Max = 2,Now = 1},
		 Id_46 = {Id = 46, Ask = "以下哪个伙伴拥有翅膀", Link = 0, Answer1 = "金翅大鹏王", AnswerPic1 = 1900453240, Answer2 = "罗刹女", AnswerPic2 = 1900453010, Answer3 = "金池长老", AnswerPic3 = 1900453250, AnswerModel1 = 5324, AnswerModel2 = 5301, AnswerModel3 = 5325, Max = 1,Now = 1},
		 Id_47 = {Id = 47, Ask = "以下谁会72变？", Link = 0, Answer1 = "杨戬", AnswerPic1 = 1900452930, Answer2 = "金翅大鹏王", AnswerPic2 = 1900453240, Answer3 = "猪八戒", AnswerPic3 = 1900452810, AnswerModel1 = 5293, AnswerModel2 = 5324, AnswerModel3 = 5281, Max = 1,Now = 1},
		 Id_48 = {Id = 48, Ask = "以下谁使用扇子？", Link = 0, Answer1 = "雨师君", AnswerPic1 = 1900400060, Answer2 = "神霄卫", AnswerPic2 = 1900400070, Answer3 = "花弄影", AnswerPic3 = 1900400090, AnswerModel1 = 6, AnswerModel2 = 7, AnswerModel3 = 9, Max = 1,Now = 1},
		 Id_49 = {Id = 49, Ask = "以下谁使用剑？", Link = 0, Answer1 = "谪剑仙", AnswerPic1 = 1900400010, Answer2 = "神霄卫", AnswerPic2 = 1900400070, Answer3 = "傲红莲", AnswerPic3 = 1900400080, AnswerModel1 = 1, AnswerModel2 = 7, AnswerModel3 = 8, Max = 1,Now = 1},
		 Id_50 = {Id = 50, Ask = "以下谁使用刀？", Link = 0, Answer1 = "神霄卫", AnswerPic1 = 1900400070, Answer2 = "傲红莲", AnswerPic2 = 1900400080, Answer3 = "烟云客", AnswerPic3 = 1900400030, AnswerModel1 = 7, AnswerModel2 = 8, AnswerModel3 = 3, Max = 1,Now = 1},
		 Id_51 = {Id = 51, Ask = "谁因打碎琉璃盏而被贬下凡间？", Link = 0, Answer1 = "沙和尚", AnswerPic1 = 1900452820, Answer2 = "猪八戒", AnswerPic2 = 1900452810, Answer3 = "杨戬", AnswerPic3 = 1900452930, AnswerModel1 = 5282, AnswerModel2 = 5281, AnswerModel3 = 5293, Max = 1,Now = 1},
		 Id_52 = {Id = 52, Ask = "“幌金绳”原本是谁的法宝？", Link = 0, Answer1 = "太上老君", AnswerPic1 = 1900452980, Answer2 = "观音菩萨", AnswerPic2 = 1900453050, Answer3 = "罗刹女", AnswerPic3 = 1900453010, AnswerModel1 = 5298, AnswerModel2 = 5305, AnswerModel3 = 5301, Max = 1,Now = 1},
		 Id_53 = {Id = 53, Ask = "以下谁是如来佛祖的舅舅？", Link = 0, Answer1 = "金翅大鹏王", AnswerPic1 = 1900453240, Answer2 = "虎力大仙", AnswerPic2 = 1900452370, Answer3 = "灵吉菩萨", AnswerPic3 = 1900452890, AnswerModel1 = 5324, AnswerModel2 = 5237, AnswerModel3 = 5289, Max = 1,Now = 1},
		 Id_54 = {Id = 54, Ask = "以下谁推倒了人参果树？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "哪吒", AnswerPic2 = 1900452960, Answer3 = "黑无常", AnswerPic3 = 1900452780, AnswerModel1 = 5279, AnswerModel2 = 5296, AnswerModel3 = 5278, Max = 1,Now = 1},
		 Id_55 = {Id = 55, Ask = "照妖镜是谁的法宝？", Link = 0, Answer1 = "李靖", AnswerPic1 = 1900452940, Answer2 = "太上老君", AnswerPic2 = 1900452980, Answer3 = "龙王", AnswerPic3 = 1900452580, AnswerModel1 = 5294, AnswerModel2 = 5298, AnswerModel3 = 5258, Max = 1,Now = 1},
		 Id_56 = {Id = 56, Ask = "如来佛祖的二弟子是谁？", Link = 0, Answer1 = "金蝉子", AnswerPic1 = 1900453250, Answer2 = "如意真仙", AnswerPic2 = 1900451440, Answer3 = "镇元子", AnswerPic3 = 1900452510, AnswerModel1 = 5325, AnswerModel2 = 5144, AnswerModel3 = 5251, Max = 1,Now = 1},
		 Id_57 = {Id = 57, Ask = "以下谁居住在翠云山？", Link = 0, Answer1 = "罗刹女", AnswerPic1 = 1900453010, Answer2 = "地涌夫人", AnswerPic2 = 1900453160, Answer3 = "孟婆", AnswerPic3 = 1900453060, AnswerModel1 = 5301, AnswerModel2 = 5316, AnswerModel3 = 5306, Max = 1,Now = 1},
		 Id_58 = {Id = 58, Ask = "太乙救苦天尊的坐骑是什么？", Link = 0, Answer1 = "九灵元圣", AnswerPic1 = 1900453260, Answer2 = "金翅大鹏王", AnswerPic2 = 1900453240, Answer3 = "龙王", AnswerPic3 = 1900452580, AnswerModel1 = 5326, AnswerModel2 = 5324, AnswerModel3 = 5258, Max = 1,Now = 1},
		 Id_59 = {Id = 59, Ask = "“地仙之祖”是谁？", Link = 0, Answer1 = "镇元子", AnswerPic1 = 1900452510, Answer2 = "金池长老", AnswerPic2 = 1900453250, Answer3 = "太上老君", AnswerPic3 = 1900452980, AnswerModel1 = 5251, AnswerModel2 = 5325, AnswerModel3 = 5298, Max = 1,Now = 1},
		 Id_60 = {Id = 60, Ask = "以下谁曾与孙悟空义结金兰？", Link = 0, Answer1 = "镇元子", AnswerPic1 = 1900452510, Answer2 = "龙王", AnswerPic2 = 1900452580, Answer3 = "杨戬", AnswerPic3 = 1900452930, AnswerModel1 = 5251, AnswerModel2 = 5258, AnswerModel3 = 5293, Max = 1,Now = 1},
		 Id_61 = {Id = 61, Ask = "李靖二儿子是谁的弟子？", Link = 0, Answer1 = "观音菩萨", AnswerPic1 = 1900453050, Answer2 = "灵吉菩萨", AnswerPic2 = 1900452890, Answer3 = "太上老君", AnswerPic3 = 1900452980, AnswerModel1 = 5305, AnswerModel2 = 5289, AnswerModel3 = 5298, Max = 1,Now = 1},
		 Id_62 = {Id = 62, Ask = "以下谁的原身是金鱼？", Link = 0, Answer1 = "灵感大王", AnswerPic1 = 1900453090, Answer2 = "九灵元圣", AnswerPic2 = 1900453260, Answer3 = "地涌夫人", AnswerPic3 = 1900453160, AnswerModel1 = 5309, AnswerModel2 = 5326, AnswerModel3 = 5316, Max = 1,Now = 1},
		 Id_63 = {Id = 63, Ask = "以下谁曾居住在鹰愁涧？", Link = 0, Answer1 = "小白龙", AnswerPic1 = 1900452830, Answer2 = "灵感大王", AnswerPic2 = 1900453090, Answer3 = "金翅大鹏王", AnswerPic3 = 1900453240, AnswerModel1 = 5283, AnswerModel2 = 5309, AnswerModel3 = 5324, Max = 1,Now = 1},
		 Id_64 = {Id = 64, Ask = "以下谁曾占据过花果山？", Link = 0, Answer1 = "混世魔王", AnswerPic1 = 1900451060, Answer2 = "银角大王", AnswerPic2 = 1900453990, Answer3 = "罗刹女", AnswerPic3 = 1900453010, AnswerModel1 = 5106, AnswerModel2 = 5399, AnswerModel3 = 5301, Max = 1,Now = 1},
		 Id_65 = {Id = 65, Ask = "以下谁曾在车迟国为妖？", Link = 0, Answer1 = "虎力大仙", AnswerPic1 = 1900452370, Answer2 = "灵感大王", AnswerPic2 = 1900453090, Answer3 = "金翅大鹏王", AnswerPic3 = 1900453240, AnswerModel1 = 5237, AnswerModel2 = 5309, AnswerModel3 = 5324, Max = 1,Now = 1},
		 Id_66 = {Id = 66, Ask = "以下谁曾在天宫任职“弼马温”？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "猪八戒", AnswerPic2 = 1900452810, Answer3 = "牛魔王", AnswerPic3 = 1900453210, AnswerModel1 = 5279, AnswerModel2 = 5281, AnswerModel3 = 5321, Max = 1,Now = 1},
		 Id_67 = {Id = 67, Ask = "以下谁会“袖里乾坤”？", Link = 0, Answer1 = "镇元子", AnswerPic1 = 1900452510, Answer2 = "灵吉菩萨", AnswerPic2 = 1900452890, Answer3 = "太上老君", AnswerPic3 = 1900452980, AnswerModel1 = 5251, AnswerModel2 = 5289, AnswerModel3 = 5298, Max = 1,Now = 1},
		 Id_68 = {Id = 68, Ask = "以下谁号称“平天大圣”？", Link = 0, Answer1 = "牛魔王", AnswerPic1 = 1900453210, Answer2 = "混世魔王", AnswerPic2 = 1900451060, Answer3 = "金翅大鹏王", AnswerPic3 = 1900453240, AnswerModel1 = 5321, AnswerModel2 = 5106, AnswerModel3 = 5324, Max = 1,Now = 1},
		 Id_69 = {Id = 69, Ask = "辟水金睛兽是谁的坐骑？", Link = 0, Answer1 = "牛魔王", AnswerPic1 = 1900453210, Answer2 = "灵吉菩萨", AnswerPic2 = 1900452890, Answer3 = "太上老君", AnswerPic3 = 1900452980, AnswerModel1 = 5321, AnswerModel2 = 5289, AnswerModel3 = 5298, Max = 1,Now = 1},
		 Id_70 = {Id = 70, Ask = "孙悟空从何处获得“定风珠”？", Link = 0, Answer1 = "灵吉菩萨", AnswerPic1 = 1900452890, Answer2 = "龙王", AnswerPic2 = 1900452580, Answer3 = "罗刹女", AnswerPic3 = 1900453010, AnswerModel1 = 5289, AnswerModel2 = 5258, AnswerModel3 = 5301, Max = 1,Now = 1},
		 Id_71 = {Id = 71, Ask = "泾河龙王曾向谁求救？", Link = 0, Answer1 = "李世民", AnswerPic1 = 1900452560, Answer2 = "房玄龄", AnswerPic2 = 1900452230, Answer3 = "东海龙王", AnswerPic3 = 1900452580, AnswerModel1 = 5256, AnswerModel2 = 5223, AnswerModel3 = 5258, Max = 1,Now = 1},
		 Id_72 = {Id = 72, Ask = "以下谁曾火烧花果山？", Link = 0, Answer1 = "杨戬", AnswerPic1 = 1900452930, Answer2 = "哪吒", AnswerPic2 = 1900452960, Answer3 = "牛魔王", AnswerPic3 = 1900453210, AnswerModel1 = 5293, AnswerModel2 = 5296, AnswerModel3 = 5321, Max = 1,Now = 1},
		 Id_73 = {Id = 73, Ask = "谁曾助孙悟空降服牛魔王？", Link = 10011, Answer1 = "哪吒", AnswerPic1 = 1900452960, Answer2 = "杨戬", AnswerPic2 = 1900452930, Answer3 = "镇元子", AnswerPic3 = 1900452510, AnswerModel1 = 5296, AnswerModel2 = 5293, AnswerModel3 = 5251, Max = 2,Now = 1},
		 Id_74 = {Id = 74, Ask = "以下谁收服了红孩儿？", Link = 0, Answer1 = "观音菩萨", AnswerPic1 = 1900453050, Answer2 = "牛魔王", AnswerPic2 = 1900453210, Answer3 = "猪八戒", AnswerPic3 = 1900452810, AnswerModel1 = 5305, AnswerModel2 = 5321, AnswerModel3 = 5281, Max = 1,Now = 1},
		 Id_75 = {Id = 75, Ask = "谁传授给唐僧的紧箍咒？", Link = 0, Answer1 = "观音菩萨", AnswerPic1 = 1900453050, Answer2 = "太上老君", AnswerPic2 = 1900452980, Answer3 = "东海龙王", AnswerPic3 = 1900452580, AnswerModel1 = 5305, AnswerModel2 = 5298, AnswerModel3 = 5258, Max = 1,Now = 1},
		 Id_76 = {Id = 76, Ask = "以下谁曾居住在福陵山？", Link = 0, Answer1 = "猪八戒", AnswerPic1 = 1900452810, Answer2 = "杨戬", AnswerPic2 = 1900452930, Answer3 = "哪吒", AnswerPic3 = 1900452960, AnswerModel1 = 5281, AnswerModel2 = 5293, AnswerModel3 = 5296, Max = 1,Now = 1},
		 Id_77 = {Id = 77, Ask = "以下谁曾化胡为佛？", Link = 0, Answer1 = "太上老君", AnswerPic1 = 1900452980, Answer2 = "金池长老", AnswerPic2 = 1900453250, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5298, AnswerModel2 = 5325, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_78 = {Id = 78, Ask = "太上老君用金刚琢砸了谁？", Link = 0, Answer1 = "孙悟空", AnswerPic1 = 1900452790, Answer2 = "杨戬", AnswerPic2 = 1900452930, Answer3 = "牛魔王", AnswerPic3 = 1900453210, AnswerModel1 = 5279, AnswerModel2 = 5293, AnswerModel3 = 5321, Max = 1,Now = 1},
		 Id_79 = {Id = 79, Ask = "天蓬元帅投胎成为了谁？", Link = 0, Answer1 = "猪八戒", AnswerPic1 = 1900452810, Answer2 = "沙和尚", AnswerPic2 = 1900452820, Answer3 = "白无常", AnswerPic3 = 1900452950, AnswerModel1 = 5281, AnswerModel2 = 5282, AnswerModel3 = 5295, Max = 1,Now = 1},
		 Id_80 = {Id = 80, Ask = "孙悟空曾向何人借芭蕉扇？", Link = 0, Answer1 = "罗刹女", AnswerPic1 = 1900453010, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "观音菩萨", AnswerPic3 = 1900453050, AnswerModel1 = 5301, AnswerModel2 = 5278, AnswerModel3 = 5305, Max = 1,Now = 1},
		 Id_10001 = {Id = 10001, Ask = "找出2个女性可选角色", Link = 0, Answer1 = "青丘狐", AnswerPic1 = 1900400100, Answer2 = "观音菩萨", AnswerPic2 = 1900453050, Answer3 = "孟婆", AnswerPic3 = 1900453060, AnswerModel1 = 10, AnswerModel2 = 5305, AnswerModel3 = 5306, Max = 2,Now = 2},
		 Id_10002 = {Id = 10002, Ask = "找出两个平顶山的妖怪？", Link = 0, Answer1 = "银角大王", AnswerPic1 = 1900453990, Answer2 = "虎力大仙", AnswerPic2 = 1900452370, Answer3 = "龙王", AnswerPic3 = 1900452580, AnswerModel1 = 5399, AnswerModel2 = 5237, AnswerModel3 = 5258, Max = 2,Now = 2},
		 Id_10003 = {Id = 10003, Ask = "以下谁有可能是谪剑仙的师傅？", Link = 0, Answer1 = "净坛使者", AnswerPic1 = 1900452750, Answer2 = "八部天龙", AnswerPic2 = 1900452770, Answer3 = "黑无常", AnswerPic3 = 1900452780, AnswerModel1 = 5275, AnswerModel2 = 5277, AnswerModel3 = 5278, Max = 2,Now = 2},
		 Id_10004 = {Id = 10004, Ask = "以下谁有可能是海蛟灵的师傅？", Link = 0, Answer1 = "八部天龙", AnswerPic1 = 1900452770, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "金身罗汉", AnswerPic3 = 1900452760, AnswerModel1 = 5277, AnswerModel2 = 5278, AnswerModel3 = 5276, Max = 2,Now = 2},
		 Id_10005 = {Id = 10005, Ask = "以下谁有可能是飞翼姬的师傅？", Link = 0, Answer1 = "八部天龙", AnswerPic1 = 1900452770, Answer2 = "净坛使者", AnswerPic2 = 1900452750, Answer3 = "黑无常", AnswerPic3 = 1900452780, AnswerModel1 = 5277, AnswerModel2 = 5275, AnswerModel3 = 5278, Max = 2,Now = 2},
		 Id_10006 = {Id = 10006, Ask = "以下谁有可能是冥河使的师傅？", Link = 0, Answer1 = "黑无常", AnswerPic1 = 1900452780, Answer2 = "八部天龙", AnswerPic2 = 1900452770, Answer3 = "净坛使者", AnswerPic3 = 1900452750, AnswerModel1 = 5278, AnswerModel2 = 5277, AnswerModel3 = 5275, Max = 2,Now = 2},
		 Id_10007 = {Id = 10007, Ask = "找出2个勾魂使者", Link = 0, Answer1 = "白无常", AnswerPic1 = 1900452950, Answer2 = "水帘妖", AnswerPic2 = 1900451230, Answer3 = "野鬼", AnswerPic3 = 1900451500, AnswerModel1 = 5295, AnswerModel2 = 5123, AnswerModel3 = 5150, Max = 2,Now = 2},
		 Id_10008 = {Id = 10008, Ask = "找出唐僧的3个徒弟", Link = 10009, Answer1 = "猪八戒", AnswerPic1 = 1900452810, Answer2 = "黑无常", AnswerPic2 = 1900452780, Answer3 = "青丘狐", AnswerPic3 = 1900400100, AnswerModel1 = 5281, AnswerModel2 = 5278, AnswerModel3 = 10, Max = 3,Now = 2},
		 Id_10009 = {Id = 10009, Ask = "找出唐僧的3个徒弟", Link = 0, Answer1 = "沙和尚", AnswerPic1 = 1900452820, Answer2 = "混世魔王", AnswerPic2 = 1900451060, Answer3 = "金角大王", AnswerPic3 = 1900453110, AnswerModel1 = 5282, AnswerModel2 = 5106, AnswerModel3 = 5311, Max = 3,Now = 3},
		 Id_10010 = {Id = 10010, Ask = "找出2个拥有翅膀的主角", Link = 0, Answer1 = "海蛟灵", AnswerPic1 = 1900400110, Answer2 = "青丘狐", AnswerPic2 = 1900400100, Answer3 = "花弄影", AnswerPic3 = 1900400090, AnswerModel1 = 11, AnswerModel2 = 10, AnswerModel3 = 9, Max = 2,Now = 2},
		 Id_10011 = {Id = 10011, Ask = "谁曾助孙悟空降服牛魔王？", Link = 0, Answer1 = "李靖", AnswerPic1 = 1900452940, Answer2 = "观音菩萨", AnswerPic2 = 1900453050, Answer3 = "白无常", AnswerPic3 = 1900452950, AnswerModel1 = 5294, AnswerModel2 = 5305, AnswerModel3 = 5295, Max = 2,Now = 2},
		},
}


-- 活动开始前回调
function Act_XiYouQiYuan.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_XiYouQiYuan.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Act_XiYouQiYuan.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Act_XiYouQiYuan.OnJoin(id, player)
	if player:GetDayInt("XiYouQiYuan_DayCount") >= Act_XiYouQiYuan.Config['DayCount'] then
		sLuaApp:NotifyTipsMsg(player,"您已经完成了今天的西游奇缘，请明天再来")
		return
	end
	local str = [[
		GUI.DestroyWnd('ActivityPanelUI')
		GUI.OpenWnd("WestJourneyUI")
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- 玩家客户端查询数据回调
function Act_XiYouQiYuan.OnQuery(id, player)
	local str = ""..player:GetDayInt("XiYouQiYuan_DayCount")..":"..Act_XiYouQiYuan.Config['DayCount']..":"..player:GetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID)..":"..Act_XiYouQiYuan.Active_Max..":"..Act_XiYouQiYuan.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_XiYouQiYuan")
	return str
end

function Act_XiYouQiYuan.main(player,act_type,question_id,answer)
	--if Act_XiYouQiYuan.Config['DayCount'] > 80 then
	--	return
	--end
	--sLuaApp:LuaDbg("Act_XiYouQiYuan.main act_type = "..act_type)
	if question_id then
		sLuaApp:LuaDbg("Act_XiYouQiYuan.main question_id = "..question_id)
	end
	if answer then
		sLuaApp:LuaDbg("Act_XiYouQiYuan.main answer = "..answer)
	end
	
	if player:GetDayInt("XiYouQiYuan_DayCount") >= Act_XiYouQiYuan.Config['DayCount'] then
		sLuaApp:NotifyTipsMsg(player,"您已经完成了今天的西游奇缘，请明天再来")
		return
	end
	
	if player:GetDayString("XiYouQiYuan_QuesTab") == "" then
		local tb = {}
		for i = 1 , Act_XiYouQiYuan.Config['DayCount'] + 1 , 1 do
			if i ~= Act_XiYouQiYuan.Config['DayCount'] + 1 then
				local num = Act_XiYouQiYuan.random(tb)
				table.insert(tb,num)
			else
				table.insert(tb,0)
			end
		end
		player:SetDayString("XiYouQiYuan_QuesTab",Lua_tools.serialize(tb))
	end
	
	local ques_tb = assert(load("return " .. player:GetDayString("XiYouQiYuan_QuesTab")))()
	local tb_form = {}
	local state = 0
	local num = player:GetDayInt("XiYouQiYuan_DayCount") + 1
	local qus_id = ques_tb[num]
	if act_type == 0 then
		if Act_XiYouQiYuan.Config['Question']['Id_'..qus_id] then
			qus_id = Act_XiYouQiYuan.checkLink(player,qus_id,tb_form,1)
		end
	elseif act_type == 1 then
		if Act_XiYouQiYuan.Config['Question']['Id_'..qus_id] then
			qus_id = Act_XiYouQiYuan.checkLink(player,qus_id,tb_form,1)
			if qus_id == question_id then
				if Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link'] ~= 0 then
					if answer == Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Answer1'] then
						player:SetDayInt("XiYouQiYuan_Link",Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link'])
						--qus_id = Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link']
						qus_id = Act_XiYouQiYuan.checkLink(player,ques_tb[(player:GetDayInt("XiYouQiYuan_DayCount") + 1)],tb_form,2)
						state = 1
					else
						state = 2
						player:SetDayInt("XiYouQiYuan_DayCount", player:GetDayInt("XiYouQiYuan_DayCount") + 1)
						if SeasonPassQuestFunc then
							SeasonPassQuestFunc.XiYouQiYuan(player)
						end
						Act_XiYouQiYuan.expandbindgold(player,state,tb_form)
						num = player:GetDayInt("XiYouQiYuan_DayCount") + 1
						qus_id = ques_tb[num]
						local active_add = Act_XiYouQiYuan.Active_Add
						local active_max = Act_XiYouQiYuan.Active_Max
						local active = player:GetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID)
						if active < active_max then
							local active_sum = active + active_add
							if active_sum > active_max then
								player:SetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID, active_max)
								ActivitySystem.AddActiveVal(player, active_max - active)
							else
								player:SetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID, active_sum)
								ActivitySystem.AddActiveVal(player, active_add)
							end
						end
					end
				else
					if answer == Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Answer1'] then
						player:SetDayInt("XiYouQiYuan_TrueCount" , player:GetDayInt("XiYouQiYuan_TrueCount") + 1)
						state = 1
						if player:GetDayInt("XiYouQiYuan_RewardState") == 0 then
							if player:GetDayInt("XiYouQiYuan_TrueCount") >= Act_XiYouQiYuan.Config['RewardCount'] then
								player:SetDayInt("XiYouQiYuan_RewardState" , 1)
							end
						end
					else
						state = 2
					end
					Act_XiYouQiYuan.expandbindgold(player,state,tb_form)
					player:SetDayInt("XiYouQiYuan_DayCount", player:GetDayInt("XiYouQiYuan_DayCount") + 1)
					if SeasonPassQuestFunc then
						SeasonPassQuestFunc.XiYouQiYuan(player)
					end
					num = player:GetDayInt("XiYouQiYuan_DayCount") + 1
					qus_id = ques_tb[num]
					local active_add = Act_XiYouQiYuan.Active_Add
					local active_max = Act_XiYouQiYuan.Active_Max
					local active = player:GetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID)
					if active < active_max then
						local active_sum = active + active_add
						if active_sum > active_max then
							player:SetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID, active_max)
							ActivitySystem.AddActiveVal(player, active_max - active)
						else
							player:SetDayInt("Act_XiYouQiYuan_Active_Num"..Act_XiYouQiYuan.Active_ID, active_sum)
							ActivitySystem.AddActiveVal(player, active_add)
						end
					end
				end
			else
				return
			end
		end
	end
	if qus_id == -1 then
		return
	end
	if qus_id ~= 0 then
		tb_form['Question'] = Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]
		tb_form['NowCount'] = player:GetDayInt("XiYouQiYuan_DayCount")
		tb_form['TrueCount'] = player:GetDayInt("XiYouQiYuan_TrueCount")
		tb_form['RewardState'] = player:GetDayInt("XiYouQiYuan_RewardState")
		tb_form['EndTime'] = Act_XiYouQiYuan.Config['EndTime']
		tb_form['Exp'] = player:GetDayInt("XiYouQiYuan_Exp")
		tb_form['BindGold'] = player:GetDayInt("XiYouQiYuan_BindGold")
	else
		Act_XiYouQiYuan.getReward(player, true)
	end
	
	local str = [[
		if WestJourneyUI then
			WestJourneyUI.Refresh(]]..Lua_tools.serialize(tb_form)..[[, ]]..state..[[)
		end
	]]
	
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function Act_XiYouQiYuan.ifhas(num,tb)
	for i = 1 , #tb , 1 do
		if tonumber(tb[i]) == tonumber(num) then
			return true
		end
	end
	return false
end

function Act_XiYouQiYuan.random(tb)
	local num = math.random(1,80)
	if not Act_XiYouQiYuan.ifhas(num,tb) then
		return num
	end
	return Act_XiYouQiYuan.random(tb)
end

function Act_XiYouQiYuan.getReward(player, is_end)
	if player:GetDayInt("XiYouQiYuan_RewardState") == 1 then
		if Lua_tools.AddItem(player, Act_XiYouQiYuan.Config['ItemList'], "Act_XiYouQiYuan", "AddItem", "") then
			player:SetDayInt("XiYouQiYuan_RewardState",2)
		end
	end
	if is_end and player:GetDayInt("XiYouQiYuan_EndRewardState") == 0 then
		player:SetDayInt("XiYouQiYuan_EndRewardState",1)
		Lua_tools.AddItem(player, Act_XiYouQiYuan.Config['ItemList_End'], "Act_XiYouQiYuan", "AddItemEnd", "")
	end
	local str = [[
		if WestJourneyUI then
			WestJourneyUI.Refresh(]]..Lua_tools.serialize({['RewardState'] = player:GetDayInt("XiYouQiYuan_RewardState")})..[[, ]].. 3 ..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function Act_XiYouQiYuan.expandbindgold(player,state,tb_form)
	local a = 1
	if state == 2 then
		a = Act_XiYouQiYuan.Config['Failed']
	end
	local exp = 0 
	local bindgold = 0 
	local GongShi = [[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	exp = math.floor((assert(load(GongShi..Act_XiYouQiYuan.Config['Exp']))())*a)
	bindgold = math.floor((assert(load(GongShi..Act_XiYouQiYuan.Config['BindGold']))())*a)
	tb_form['AddExp'] = exp
	tb_form['AddBindGold'] = bindgold
	tb_form['AnswerForShow'] = {}
	player:AddBindGold(bindgold, "Act_XiYouQiYuan", "Act_XiYouQiYuan", "nil")
	player:AddExp(exp, "Act_XiYouQiYuan", "Act_XiYouQiYuan", "nil")
	
	local pet_list = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_list) do
		if not v:AddExp(exp, "XiuLuo", "accomplish", "pet") then
			sLuaApp:LuaDbg( "Act_XiYouQiYuan.expandbindgold pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	
	player:SetDayInt("XiYouQiYuan_Exp", player:GetDayInt("XiYouQiYuan_Exp") + exp)
	player:SetDayInt("XiYouQiYuan_BindGold", player:GetDayInt("XiYouQiYuan_BindGold") + bindgold)
	player:SetDayInt("XiYouQiYuan_Link",0)

	--五星连珠活动西游奇缘任务回调
	if BinGoQuestCallBack and BinGoQuestCallBack.XiYouQiYuanQuest then
		BinGoQuestCallBack.XiYouQiYuanQuest(player)
	end
end

function Act_XiYouQiYuan.checkLink(player,qus_id,tb_form,type)
	--sLuaApp:LuaDbg("checkLink0 "..qus_id)
	if player:GetDayInt("XiYouQiYuan_Link") == 0 then
		--sLuaApp:LuaDbg("checkLink1")
		return qus_id
	elseif Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link'] == 0 then
		--sLuaApp:LuaDbg("checkLink2")
		return -1
	elseif Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link'] == player:GetDayInt("XiYouQiYuan_Link") then
		--sLuaApp:LuaDbg("checkLink3  "..player:GetDayInt("XiYouQiYuan_Link"))
		if not tb_form['AnswerForShow'] then
			tb_form['AnswerForShow'] = {}
			table.insert(tb_form['AnswerForShow'],Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['AnswerPic1'])
		else
			if type == 2 then
				tb_form['AnswerForShow'] = {}
			end
			table.insert(tb_form['AnswerForShow'],Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['AnswerPic1'])
		end
		return player:GetDayInt("XiYouQiYuan_Link")
	else
		--sLuaApp:LuaDbg("checkLink4")
		if not tb_form['AnswerForShow'] then
			tb_form['AnswerForShow'] = {}
			table.insert(tb_form['AnswerForShow'],Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['AnswerPic1'])
		else
			if type == 2 then
				tb_form['AnswerForShow'] = {}
			end
			table.insert(tb_form['AnswerForShow'],Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['AnswerPic1'])
		end
		return Act_XiYouQiYuan.checkLink(player,Act_XiYouQiYuan.Config['Question']['Id_'..qus_id]['Link'],tb_form,1)
	end
end