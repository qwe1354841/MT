--宠物图鉴
PetGuide = {}

--获取途径按钮显示文字  map-地图名， shop-商店购买， Mall-兑换商店页签名 func-前往获取  -- 需要修改去改PetGuide.ShowConfig  --shop只能填一个商店

PetGuide.Config = {
--[[	{
		{["PetKeyname"] = "小绵羊",			["Map"] = {"大雁塔一层",100,100, "大雁塔二层",100,100},	 ["Shop"] = {"长安城-宠物商店", "长安城宠物店"}, 	["ExchangeShop"] = {"仙兽商店"}, 	["Func"] = {"祈福"},},
		{["PetKeyname"] = "小绵羊宝宝", 	["Map"] = {"大雁塔一层",100,100, "大雁塔二层",100,100},},
		{["PetKeyname"] = "变异小绵羊宝宝", ["IsUpStar"] = 1, ["Map"] = {"大雁塔一层",1,1, "大雁塔二层",1,1},},
	},

	{
		{["PetKeyname"] = "蟹将军",			["Map"] = {"大雁塔一层",1,1, "大雁塔二层",1,1},	 ["Shop"] = {"长安城-宠物商店", "长安城宠物店"}, 	["ExchangeShop"] = {"仙兽商店"}, 	["Func"] = {"祈福"},},
		{["PetKeyname"] = "蟹将军宝宝", 	["Map"] = {"大雁塔一层",1,1, "大雁塔二层",1,1},},
		{["PetKeyname"] = "变异蟹将军宝宝", ["IsUpStar"] = 1, ["Map"] = {"大雁塔一层",1,1, "大雁塔二层",1,1},},
	},]]--
	{
		{["PetKeyname"] = "无根草",   ["Map"] = {"大雁塔一层",62,94},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "无根草宝宝",   ["Map"] = {"大雁塔一层",62,94},},
		{["PetKeyname"] = "变异无根草宝宝",   ["Map"] = {"大雁塔一层",62,94},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "小绵羊",   ["Map"] = {"大雁塔一层",62,94,"大雁塔二层",126,90},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "小绵羊宝宝",   ["Map"] = {"大雁塔一层",62,94,"大雁塔二层",126,90},},
		{["PetKeyname"] = "变异小绵羊宝宝",   ["Map"] = {"大雁塔一层",62,94,"大雁塔二层",126,90},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "蟹将军",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "蟹将军宝宝",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},},
		{["PetKeyname"] = "变异蟹将军宝宝",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "野猪妖",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "野猪妖宝宝",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},},
		{["PetKeyname"] = "变异野猪妖宝宝",   ["Map"] = {"大雁塔二层",126,90,"大雁塔三层",167,59},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "行者游魂",   ["Map"] = {"大雁塔三层",167,59,"大雁塔四层",51,65},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "行者游魂宝宝",   ["Map"] = {"大雁塔三层",167,59,"大雁塔四层",51,65},},
		{["PetKeyname"] = "变异行者游魂宝宝",   ["Map"] = {"大雁塔三层",167,59,"大雁塔四层",51,65},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "浣灵熊",   ["Map"] = {"大雁塔四层",51,65},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "浣灵熊宝宝",   ["Map"] = {"大雁塔四层",51,65},},
		{["PetKeyname"] = "变异浣灵熊宝宝",   ["Map"] = {"大雁塔四层",51,65},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "小虎妖",   ["Map"] = {"大雁塔四层",51,65,"大雁塔五层",74,48},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "小虎妖宝宝",   ["Map"] = {"大雁塔四层",51,65,"大雁塔五层",74,48},},
		{["PetKeyname"] = "变异小虎妖宝宝",   ["Map"] = {"大雁塔四层",51,65,"大雁塔五层",74,48},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "旋龟",   ["Map"] = {"大雁塔五层",74,48},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "旋龟宝宝",   ["Map"] = {"大雁塔五层",74,48},},
		{["PetKeyname"] = "变异旋龟宝宝",   ["Map"] = {"大雁塔五层",74,48},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "岩穴鳄",   ["Map"] = {"大雁塔五层",74,48},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "岩穴鳄宝宝",   ["Map"] = {"大雁塔五层",74,48},},
		{["PetKeyname"] = "变异岩穴鳄宝宝",   ["Map"] = {"大雁塔五层",74,48},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "山贼斥候",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "山贼斥候宝宝",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},},
		{["PetKeyname"] = "变异山贼斥候宝宝",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "瑞兽幼崽",   ["Map"] = {"大雁塔六层",76,86},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "瑞兽幼崽宝宝",   ["Map"] = {"大雁塔六层",76,86},},
		{["PetKeyname"] = "变异瑞兽幼崽宝宝",   ["Map"] = {"大雁塔六层",76,86},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "雪坊主",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "雪坊主宝宝",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},},
		{["PetKeyname"] = "变异雪坊主宝宝",   ["Map"] = {"大雁塔六层",76,86,"大雁塔七层",53,40},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "女尸怨灵",   ["Map"] = {"大雁塔七层",53,40},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "女尸怨灵宝宝",   ["Map"] = {"大雁塔七层",53,40},},
		{["PetKeyname"] = "变异女尸怨灵宝宝",   ["Map"] = {"大雁塔七层",53,40},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "水判官",   ["Map"] = {"遗址地宫一层",41,85},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "水判官宝宝",   ["Map"] = {"遗址地宫一层",41,85},},
		{["PetKeyname"] = "变异水判官宝宝",   ["Map"] = {"遗址地宫一层",41,85},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "青冥灯",   ["Map"] = {"砂城遗址",142,101,"遗址地宫一层",41,85},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "青冥灯宝宝",   ["Map"] = {"砂城遗址",142,101,"遗址地宫一层",41,85},},
		{["PetKeyname"] = "变异青冥灯宝宝",   ["Map"] = {"砂城遗址",142,101,"遗址地宫一层",41,85},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "灵木怪",   ["Map"] = {"遗址地宫一层",41,85},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "灵木怪宝宝",   ["Map"] = {"遗址地宫一层",41,85},},
		{["PetKeyname"] = "变异灵木怪宝宝",   ["Map"] = {"遗址地宫一层",41,85},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "幻灵鹿",   ["Map"] = {"遗址地宫二层",62,24,"遗址地宫三层",29,52},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "幻灵鹿宝宝",   ["Map"] = {"遗址地宫二层",62,24,"遗址地宫三层",29,52},},
		{["PetKeyname"] = "变异幻灵鹿宝宝",   ["Map"] = {"遗址地宫二层",62,24,"遗址地宫三层",29,52},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "剧毒蜘蛛",   ["Map"] = {"砂城遗址",142,101,"遗址地宫二层",62,24},  ["Shop"] = {"长安城-宠物商店","长安城宠物店"},},
		{["PetKeyname"] = "剧毒蜘蛛宝宝",   ["Map"] = {"砂城遗址",142,101,"遗址地宫二层",62,24},},
		{["PetKeyname"] = "变异剧毒蜘蛛宝宝",   ["Map"] = {"砂城遗址",142,101,"遗址地宫二层",62,24},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "魅音狐",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "魅音狐宝宝",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},},
		{["PetKeyname"] = "变异魅音狐宝宝",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "赤炎狼",   ["Map"] = {"遗址地宫四层",115,115,"遗址地宫五层",69,109},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "赤炎狼宝宝",   ["Map"] = {"遗址地宫四层",115,115,"遗址地宫五层",69,109},},
		{["PetKeyname"] = "变异赤炎狼宝宝",   ["Map"] = {"遗址地宫四层",115,115,"遗址地宫五层",69,109},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "土灵熊",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "土灵熊宝宝",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},},
		{["PetKeyname"] = "变异土灵熊宝宝",   ["Map"] = {"遗址地宫三层",29,52,"遗址地宫四层",115,115},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "裂天兕",   ["Map"] = {"遗址地宫六层",17,32},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "裂天兕宝宝",   ["Map"] = {"遗址地宫六层",17,32},},
		{["PetKeyname"] = "变异裂天兕宝宝",   ["Map"] = {"遗址地宫六层",17,32},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "天神石像",   ["Map"] = {"遗址地宫六层",17,32},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "天神石像宝宝",   ["Map"] = {"遗址地宫六层",17,32},},
		{["PetKeyname"] = "变异天神石像宝宝",   ["Map"] = {"遗址地宫六层",17,32},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "洞花妖",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "洞花妖宝宝",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},},
		{["PetKeyname"] = "变异洞花妖宝宝",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "玄阴蝎",   ["Map"] = {"水帘洞窟二层",18,50,"水帘洞窟三层",14,42},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "玄阴蝎宝宝",   ["Map"] = {"水帘洞窟二层",18,50,"水帘洞窟三层",14,42},},
		{["PetKeyname"] = "变异玄阴蝎宝宝",   ["Map"] = {"水帘洞窟二层",18,50,"水帘洞窟三层",14,42},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "玄阴霜豹",   ["Map"] = {"水帘洞窟三层",14,42,"水帘洞窟四层",168,46},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "玄阴霜豹宝宝",   ["Map"] = {"水帘洞窟三层",14,42,"水帘洞窟四层",168,46},},
		{["PetKeyname"] = "变异玄阴霜豹宝宝",   ["Map"] = {"水帘洞窟三层",14,42,"水帘洞窟四层",168,46},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "素尾白狐",   ["Map"] = {"水帘洞窟四层",168,46,"水帘洞窟五层",18,44},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "素尾白狐宝宝",   ["Map"] = {"水帘洞窟四层",168,46,"水帘洞窟五层",18,44},},
		{["PetKeyname"] = "变异素尾白狐宝宝",   ["Map"] = {"水帘洞窟四层",168,46,"水帘洞窟五层",18,44},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "冰魄剑灵",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟七层",131,93},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "冰魄剑灵宝宝",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟七层",131,93},},
		{["PetKeyname"] = "变异冰魄剑灵宝宝",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟七层",131,93},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "踏火神犀",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟六层",44,103},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "踏火神犀宝宝",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟六层",44,103},},
		{["PetKeyname"] = "变异踏火神犀宝宝",   ["Map"] = {"水帘洞窟五层",18,44,"水帘洞窟六层",44,103},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "水帘妖",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},},
		{["PetKeyname"] = "水帘妖宝宝",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},},
		{["PetKeyname"] = "变异水帘妖宝宝",   ["Map"] = {"水帘洞窟一层",34,97,"水帘洞窟二层",18,50},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "巨灵神",   ["Map"] = {"丹炉地宫二层",93,82},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "巨灵神宝宝",   ["Map"] = {"丹炉地宫二层",93,82},	},
		{["PetKeyname"] = "变异巨灵神宝宝",   ["Map"] = {"丹炉地宫二层",93,82},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "云中仙",   ["Map"] = {"丹炉地宫三层",46,24},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "云中仙宝宝",   ["Map"] = {"丹炉地宫三层",46,24},	},
		{["PetKeyname"] = "变异云中仙宝宝",   ["Map"] = {"丹炉地宫三层",46,24},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "迦楼纳什",   ["Map"] = {"丹炉地宫四层",119,99},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "迦楼纳什宝宝",   ["Map"] = {"丹炉地宫四层",119,99},	},
		{["PetKeyname"] = "变异迦楼纳什宝宝",   ["Map"] = {"丹炉地宫四层",119,99},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "邪毅将军",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫四层",119,99},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "邪毅将军宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫四层",119,99},	},
		{["PetKeyname"] = "变异邪毅将军宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫四层",119,99},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "冥焰火凤",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "冥焰火凤宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},	},
		{["PetKeyname"] = "变异冥焰火凤宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "熔火石灵",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫五层",35,20},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "熔火石灵宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫五层",35,20},	},
		{["PetKeyname"] = "变异熔火石灵宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫五层",35,20},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "器灵",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫三层",46,24},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "器灵宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫三层",46,24},	},
		{["PetKeyname"] = "变异器灵宝宝",   ["Map"] = {"丹炉地宫一层",93,82,"丹炉地宫三层",46,24},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "怨灵鬼",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫六层",81,67},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "怨灵鬼宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫六层",81,67},	},
		{["PetKeyname"] = "变异怨灵鬼宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫六层",81,67},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "药童子",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "药童子宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},	},
		{["PetKeyname"] = "变异药童子宝宝",   ["Map"] = {"丹炉地宫二层",93,82,"丹炉地宫七层",48,27},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "小花仙",   ["Map"] = {"丹炉地宫五层",35,20},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "小花仙宝宝",   ["Map"] = {"丹炉地宫五层",35,20},	},
		{["PetKeyname"] = "变异小花仙宝宝",   ["Map"] = {"丹炉地宫五层",35,20},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "千年树灵",   ["Map"] = {"丹炉地宫六层",81,67},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "千年树灵宝宝",   ["Map"] = {"丹炉地宫六层",81,67},	},
		{["PetKeyname"] = "变异千年树灵宝宝",   ["Map"] = {"丹炉地宫六层",81,67},["IsUpStar"] = 1,},
	},
	{
		{["PetKeyname"] = "七仙女",   ["Map"] = {"丹炉地宫七层",48,27},  ["Shop"] = {"西梁女国-宠物商店","西梁女国宠物店"},	},
		{["PetKeyname"] = "七仙女宝宝",   ["Map"] = {"丹炉地宫七层",48,27},	},
		{["PetKeyname"] = "变异七仙女宝宝",   ["Map"] = {"丹炉地宫七层",48,27},["IsUpStar"] = 1,},
	},
	{{["PetKeyname"] = "圣麒麟",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},--维护礼包
	{{["PetKeyname"] = "伪神兽宝宝", ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},   ["Func"] = {"祈福"},},},--限时购
	{{["PetKeyname"] = "伪玄影猫", ["IsUpStar"] = 1, ["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},--连续充值
	{{["PetKeyname"] = "艾小米宝宝", ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},   ["Func"] = {"祈福"},},},--七日
	{{["PetKeyname"] = "碧浪公主", ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},   ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "丹熏鼠",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "火纹麟",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "三生蝶",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "森林贤者",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "天行卫",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "无极熊猫",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "凝月童子",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "天玄仙", ["IsUpStar"] = 1, ["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "白泽",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "至尊宝",  ["IsUpStar"] = 1,["ExchangeShop"] = {"仙兽商店"},  ["Func"] = {"祈福"},},},
	{{["PetKeyname"] = "神兽猪",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},--神兽均可靠神兽拼图获得
	{{["PetKeyname"] = "神兽鸡",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽狗",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽牛",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽马",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽虎",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽兔",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},
	{{["PetKeyname"] = "神兽羊",   ["IsUpStar"] = 1,["Func"] = {"祈福"}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},--限时购
	--{{["PetKeyname"] = "神兽羊",   ["IsUpStar"] = 1,["Func"] = {"祈福", {"提示", "前往获取", "通过活动获取"}}, ["NPC"] = {"长安拜访-英国公", "神兽拼图兑换"},},},--限时购
	{{["PetKeyname"] = "魔兽刑天",  ["IsUpStar"] = 1,["Func"] = {{"刑天降世","刑天降世"}}, },},--开服排行活动 --["Func"] = {{服务端逻辑用,界面显示}},
}


PetGuide.WayFunc = {
	["Map"] = function(player, get_way_config)
		local map_id = get_way_config["MapID"]
		local map = sMapSystem:GetMapById(map_id)
		if not map then
			sLuaApp:LuaErr("PetGuide.WayFunc  map 不存在 "..map_id)
			return false
		end
		if not Lua_tools.Jump(player, map, get_way_config["X"], get_way_config["Y"], 5) then
			sLuaApp:LuaErr("PetGuide.WayFunc  Enter 错误")
			return false
		end
	end,
	["Shop"] = function(player, get_way_config)
		--打开npc商店
		local npc_id = get_way_config["NPCID"]
		local pet_id = get_way_config["PetId"]
		local str = [[
			CL.StartMove(]]..npc_id..[[,false,eRoleHeadFlag.None,MoveEndAction.OpenShop,]]..pet_id..[[)
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end,
	["ExchangeShop"] = function(player, get_way_config)
		if not ExchangeShop.OpenExchangeShop(player, get_way_config["ShopName"], get_way_config["PetId"]) then
			sLuaApp:NotifyTipsMsg(player, "打开兑换商店失败。")
		end
	end,
	["NPC"] = function(player, get_way_config)
		local npc_id = get_way_config["NPCID"]
		local str = [[
			CL.StartMove(]]..npc_id..[[)
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end,
	["祈福"] = function(player, get_way_config)
		local str = [[
			GUI.OpenWnd("PrayUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end,
	["提示"] = function(player, get_way_config)
		local msg = get_way_config["Msg"]
		sLuaApp:NotifyTipsMsg(player, msg)
	end,
	["刑天降世"] = function(player, get_way_config)
		local now_sec = sLuaApp:SecondSinceEpoch(0)
		local check_time_tb = IntegralPK.Config[1]["CheckTime"]
		if now_sec >= check_time_tb[1] and now_sec < check_time_tb[3] then
			local str = [[
				GUI.OpenWnd("FightValueRankUI")
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		else
			sLuaApp:NotifyTipsMsg(player, "该活动已结束，请多关注其他游戏活动")
		end
	end,
}


function PetGuide.GetData(player)
	local str = [[
		if UIDefine then
			UIDefine.PetHandbookData = ]].. PetGuide.ShowConfigStr ..[[
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end


function PetGuide.PetGetWay(player, GuideIndex, PetIndex, GetWayIndex)
	if not GuideIndex or not PetIndex or not GetWayIndex then return end 
	local guide_config = PetGuide.ConfigEx[GuideIndex]
	if not guide_config then return end
	local pet_config = guide_config[PetIndex]
	if not pet_config then return end
	local get_way_config = pet_config["GetWay"][GetWayIndex]
	if not get_way_config then return end
	
	local get_way_type = get_way_config["Type"]
	if PetGuide.WayFunc[get_way_type] then
		if not PetGuide.WayFunc[get_way_type](player, get_way_config) then
			return
		end
	end
end

function PetGuide.GetMaxTalentTb(pet_keyname)
	local pet_data = PetConfig.GetByKeyName(pet_keyname)
	if not pet_data then
		sLuaApp:LuaErr("PetGuide.GetMaxTalentTb PetConfig不存在 "..pet_keyname)
		return false
	end
	local talent_max_tb = {}
	
	for _,v in ipairs(PetUpStarConfig.IntConfig) do
		talent_max_tb[v[1]] = pet_data[v[1]]
	end
	local up_star_config = PetUpStarConfig.Attr["Type_"..pet_data.Type]
	if not up_star_config then
		sLuaApp:LuaErr("PetGuide.GetMaxTalentTb PetUpStarConfig.Attr不存在 Type_"..pet_data.Type)
		return false
	end
	local max_star = Lua_tools.tablecount(up_star_config)
	for i = 1, max_star do
		local attr_config = up_star_config["Star_"..i]
		if attr_config then
			for _,v in ipairs(attr_config) do
				if v["IntKey"] then
					if v["Ratio"] and v["Ratio"] ~= 0 then
						talent_max_tb[v["IntKey"]] = math.ceil(talent_max_tb[v["IntKey"]] * (10000 + v["Ratio"]*100)/10000)
					elseif v["Value"] and v["Value"] ~= 0 then
						talent_max_tb[v["IntKey"]] = math.ceil(talent_max_tb[v["IntKey"]] + v["Value"])
					end
				else
					sLuaApp:LuaErr("PetUpStarConfig.Attr[Type_"..pet_data.Type.."][Star_"..i.."]  配置错误")
					return false
				end
			end
		else
			sLuaApp:LuaErr("PetUpStarConfig.Attr 缺少 Type_"..pet_data.Type.."  Star_"..i)
		end
	end
	return talent_max_tb 
end

function PetGuide.Initialization()
	if not PetUpStarConfig then
		require("pet/PetUpStarConfig")
	end
	PetGuide.ShowConfig = {} --发给客户端
	PetGuide.ConfigEx = {} --服务端
	for k,v in ipairs(PetGuide.Config) do
		PetGuide.ShowConfig[k] = {}
		PetGuide.ConfigEx[k] = {}
		for a,b in ipairs(v) do
			local pet_keyname = b["PetKeyname"]
			
			PetGuide.ShowConfig[k][a] = {}
			PetGuide.ShowConfig[k][a]["PetKeyname"] = pet_keyname
			PetGuide.ShowConfig[k][a]["GetWay"] = {}
			
			PetGuide.ConfigEx[k][a] = {}
			PetGuide.ConfigEx[k][a]["PetKeyname"] = pet_keyname
			PetGuide.ConfigEx[k][a]["GetWay"] = {}

			if b["Map"] and next(b["Map"]) then
				for i,j in ipairs(b["Map"]) do
					if type(j) == "string" then
						local map_data = MapConfig.GetByKeyName(j)
						if not map_data then
							sLuaApp:LuaErr("PetGuide.Initialization  MapConfig 不存在"..j)
							return
						end
						table.insert(PetGuide.ShowConfig[k][a]["GetWay"], map_data.Name)
						
						if type(b["Map"][i+1]) ~= "number" or type(b["Map"][i+2]) ~= "number" then
							sLuaApp:LuaErr("PetGuide.Initialization  Map配置错误 图鉴序号 "..k)
							return
						end
						table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = "Map", ["MapID"] = map_data.Id, ["X"] = b["Map"][i+1], ["Y"] = b["Map"][i+2]})
					end
				end
			end
			if b["Shop"] and next(b["Shop"]) then
				table.insert(PetGuide.ShowConfig[k][a]["GetWay"], "商店购买")
				local npc_data = NpcConfig.GetByKeyName(b["Shop"][1])
				if not npc_data then
					sLuaApp:LuaErr("PetGuide.Initialization  NpcConfig 不存在 "..b["Shop"][1])
				end
				local pet_data = PetConfig.GetByKeyName(b["PetKeyname"])
				if not pet_data then
					sLuaApp:LuaErr("PetGuide.Initialization  PetConfig不存在"..b["PetKeyname"])
					return 
				end
				table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = "Shop", ["NPCID"] = npc_data.Id, ["ShopName"] = b["Shop"][2], ["PetId"] = pet_data.Id})
			end
			if b["ExchangeShop"] and next(b["ExchangeShop"]) then
				for _,j in ipairs(b["ExchangeShop"]) do
					local pet_data = PetConfig.GetByKeyName(b["PetKeyname"])
					if not pet_data then
						sLuaApp:LuaErr("PetGuide.Initialization  PetConfig不存在"..b["PetKeyname"])
						return 
					end
					table.insert(PetGuide.ShowConfig[k][a]["GetWay"], j)
					table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = "ExchangeShop", ["ShopName"] = j, ["PetId"] = pet_data.Id})
				end
			end
			if b["NPC"] and next(b["NPC"]) then
				for i = 1, #b["NPC"], 2 do
					table.insert(PetGuide.ShowConfig[k][a]["GetWay"], b["NPC"][i+1])
					local npc_data = NpcConfig.GetByKeyName(b["NPC"][i])
					if not npc_data then
						sLuaApp:LuaErr("PetGuide.Initialization  NpcConfig 不存在 "..b["NPC"][i])
					end
					table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = "NPC", ["NPCID"] = npc_data.Id})
				end
			end
			if b["Func"] and next(b["Func"]) then
				for _,j in ipairs(b["Func"]) do
					if type(j) == "table" then
						table.insert(PetGuide.ShowConfig[k][a]["GetWay"], j[2])
						table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = j[1],["Msg"] = j[3] or ""})
					else
						table.insert(PetGuide.ShowConfig[k][a]["GetWay"], "前往获取")
						table.insert(PetGuide.ConfigEx[k][a]["GetWay"], {["Type"] = j})
					end
				end
			end
			

			if b["IsUpStar"] and b["IsUpStar"] == 1 then
				PetGuide.ShowConfig[k][a]["IsUpStar"] = 1
			
				local up_star_skill = PetUpStarConfig.StarSkill[pet_keyname]
				if up_star_skill then
					PetGuide.ShowConfig[k][a]["UpStarSkill"] = {}
					local tmp_up_star_skill = {}
					for k,v in pairs(up_star_skill) do
						local key_tb = sLuaApp:StrSplit(k, "_")
						tmp_up_star_skill[tonumber(key_tb[2])] = v
					end
					for i = 1, 6 do
						if tmp_up_star_skill[i] then
							table.insert(PetGuide.ShowConfig[k][a]["UpStarSkill"], tmp_up_star_skill[i])
						end
					end
					
					--PetGuide.ShowConfig[k][a]["UpStarSkill"] = up_star_skill
				else
					sLuaApp:LuaErr("PetGuide.Initialization  PetUpStarConfig.StarSkill 不存在 "..pet_keyname)
				end
				local talent_max_tb = PetGuide.GetMaxTalentTb(pet_keyname)
				if not talent_max_tb then
					return
				end
				PetGuide.ShowConfig[k][a]["TalentMax"] = talent_max_tb
			end
		end
	end
	
	--sLuaApp:LuaErr("PetGuide.ShowConfig"..Lua_tools.serialize(PetGuide.ShowConfig))
	--sLuaApp:LuaErr("PetGuide.ConfigEx"..Lua_tools.serialize(PetGuide.ConfigEx))
	
	PetGuide.ShowConfigStr = Lua_tools.serialize(PetGuide.ShowConfig)
	PetGuide.ShowConfig = nil
end
PetGuide.Initialization()