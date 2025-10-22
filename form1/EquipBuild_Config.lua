--装备打造配置
EquipBuildConfig = {}

EquipBuildConfig.Version = "0610_1.01"

EquipBuildConfig.Build_Time = 1			--动画播放时间

EquipBuildConfig.Classify_Desc = "阶级分类"

EquipBuildConfig.Classify_Table = {
	"10级",
	"15级",
	"20级",
	"25级",
	"30级",
	"35级",
	"40级",
	"45级",
	"50级",
	"55级",
	"60级",
	"65级",
	"70级",
	"75级",
	"80级",
	"85级",
	"90级",
	"95级",
	"100级",
	"105级",
	"110级",
	"115级",
	"120级",
}

EquipBuildConfig.Synthesis = {
	["10级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书10",1, "打造符",1, "百炼精铁10",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"10级绿重剑",5800,"10级蓝重剑",3200,"10级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"10级蓝重剑",5800,"10级紫重剑",3200,"10级橙重剑",1000,},--强化打造装备和几率
				result_library = "EquipCreate.Config", --属性预览库，默认为EquipCreate.Config，此处为展示
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"扇子书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿扇子",5800,"10级蓝扇子",3200,"10级紫扇子",1000,},
				result_adder = {"10级蓝扇子",5800,"10级紫扇子",3200,"10级橙扇子",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"笛子书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿笛子",5800,"10级蓝笛子",3200,"10级紫笛子",1000,},
				result_adder = {"10级蓝笛子",5800,"10级紫笛子",3200,"10级橙笛子",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"阔刀书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿阔刀",5800,"10级蓝阔刀",3200,"10级紫阔刀",1000,},
				result_adder = {"10级蓝阔刀",5800,"10级紫阔刀",3200,"10级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"毛笔书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿毛笔",5800,"10级蓝毛笔",3200,"10级紫毛笔",1000,},
				result_adder = {"10级蓝毛笔",5800,"10级紫毛笔",3200,"10级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"长枪书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿长枪",5800,"10级蓝长枪",3200,"10级紫长枪",1000,},
				result_adder = {"10级蓝长枪",5800,"10级紫长枪",3200,"10级橙长枪",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"爪刺书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿爪刺",5800,"10级蓝爪刺",3200,"10级紫爪刺",1000,},
				result_adder = {"10级蓝爪刺",5800,"10级紫爪刺",3200,"10级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"绣伞书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿绣伞",5800,"10级蓝绣伞",3200,"10级紫绣伞",1000,},
				result_adder = {"10级蓝绣伞",5800,"10级紫绣伞",3200,"10级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"短杖书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿短杖",5800,"10级蓝短杖",3200,"10级紫短杖",1000,},
				result_adder = {"10级蓝短杖",5800,"10级紫短杖",3200,"10级橙短杖",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"弓箭书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿弓箭",5800,"10级蓝弓箭",3200,"10级紫弓箭",1000,},
				result_adder = {"10级蓝弓箭",5800,"10级紫弓箭",3200,"10级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"双剑书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿双剑",5800,"10级蓝双剑",3200,"10级紫双剑",1000,},
				result_adder = {"10级蓝双剑",5800,"10级紫双剑",3200,"10级橙双剑",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"长鞭书10",1, "打造符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿长鞭",5800,"10级蓝长鞭",3200,"10级紫长鞭",1000,},
				result_adder = {"10级蓝长鞭",5800,"10级紫长鞭",3200,"10级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"男帽书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿男头盔",5800,"10级蓝男头盔",3200,"10级紫男头盔",1000,},
				result_adder = {"10级蓝男头盔",5800,"10级紫男头盔",3200,"10级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"女帽书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿女头盔",5800,"10级蓝女头盔",3200,"10级紫女头盔",1000,},
				result_adder = {"10级蓝女头盔",5800,"10级紫女头盔",3200,"10级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"男衣书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿男护甲",5800,"10级蓝男护甲",3200,"10级紫男护甲",1000,},
				result_adder = {"10级蓝男护甲",5800,"10级紫男护甲",3200,"10级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"女衣书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿女护甲",5800,"10级蓝女护甲",3200,"10级紫女护甲",1000,},
				result_adder = {"10级蓝女护甲",5800,"10级紫女护甲",3200,"10级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"腰带书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿护腰",5800,"10级蓝护腰",3200,"10级紫护腰",1000,},
				result_adder = {"10级蓝护腰",5800,"10级紫护腰",3200,"10级橙护腰",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"挂坠书10",1, "炼金符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"10级绿挂坠",5800,"10级蓝挂坠",3200,"10级紫挂坠",1000,},
				result_adder = {"10级蓝挂坠",5800,"10级紫挂坠",3200,"10级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "10级打造套装物", Rand = 1000},{ItemKey = "10级打造套装法" , Rand = 1000} , {ItemKey = "10级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["15级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"鞋子书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"15级绿靴子",5800,"15级蓝靴子",3200,"15级紫靴子",1000,},
				result_adder = {"15级蓝靴子",5800,"15级紫靴子",3200,"15级橙靴子",1000,},
				SuitRadom = { {ItemKey = "15级打造套装物", Rand = 1000},{ItemKey = "15级打造套装法" , Rand = 1000} , {ItemKey = "15级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"护腕书10",1, "缝纫符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"15级绿护腕",5800,"15级蓝护腕",3200,"15级紫护腕",1000,},
				result_adder = {"15级蓝护腕",5800,"15级紫护腕",3200,"15级橙护腕",1000,},
				SuitRadom = { {ItemKey = "15级打造套装物", Rand = 1000},{ItemKey = "15级打造套装法" , Rand = 1000} , {ItemKey = "15级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"戒指书10",1, "炼金符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"15级绿戒指",5800,"15级蓝戒指",3200,"15级紫戒指",1000,},
				result_adder = {"15级蓝戒指",5800,"15级紫戒指",3200,"15级橙戒指",1000,},
				SuitRadom = { {ItemKey = "15级打造套装物", Rand = 1000},{ItemKey = "15级打造套装法" , Rand = 1000} , {ItemKey = "15级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 5000},
				vitality = 10,
				formula_basic = {"项链书10",1, "炼金符",1, "百炼精铁10",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"15级绿项链",5800,"15级蓝项链",3200,"15级紫项链",1000,},
				result_adder = {"15级蓝项链",5800,"15级紫项链",3200,"15级橙项链",1000,},
				SuitRadom = { {ItemKey = "15级打造套装物", Rand = 1000},{ItemKey = "15级打造套装法" , Rand = 1000} , {ItemKey = "15级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["20级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书20",1, "打造符",1, "百炼精铁20",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"20级绿重剑",5800,"20级蓝重剑",3200,"20级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"20级蓝重剑",5800,"20级紫重剑",3200,"20级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"扇子书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿扇子",5800,"20级蓝扇子",3200,"20级紫扇子",1000,},
				result_adder = {"20级蓝扇子",5800,"20级紫扇子",3200,"20级橙扇子",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"笛子书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿笛子",5800,"20级蓝笛子",3200,"20级紫笛子",1000,},
				result_adder = {"20级蓝笛子",5800,"20级紫笛子",3200,"20级橙笛子",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"阔刀书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿阔刀",5800,"20级蓝阔刀",3200,"20级紫阔刀",1000,},
				result_adder = {"20级蓝阔刀",5800,"20级紫阔刀",3200,"20级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"毛笔书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿毛笔",5800,"20级蓝毛笔",3200,"20级紫毛笔",1000,},
				result_adder = {"20级蓝毛笔",5800,"20级紫毛笔",3200,"20级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"长枪书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿长枪",5800,"20级蓝长枪",3200,"20级紫长枪",1000,},
				result_adder = {"20级蓝长枪",5800,"20级紫长枪",3200,"20级橙长枪",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"爪刺书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿爪刺",5800,"20级蓝爪刺",3200,"20级紫爪刺",1000,},
				result_adder = {"20级蓝爪刺",5800,"20级紫爪刺",3200,"20级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"绣伞书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿绣伞",5800,"20级蓝绣伞",3200,"20级紫绣伞",1000,},
				result_adder = {"20级蓝绣伞",5800,"20级紫绣伞",3200,"20级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"短杖书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿短杖",5800,"20级蓝短杖",3200,"20级紫短杖",1000,},
				result_adder = {"20级蓝短杖",5800,"20级紫短杖",3200,"20级橙短杖",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"弓箭书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿弓箭",5800,"20级蓝弓箭",3200,"20级紫弓箭",1000,},
				result_adder = {"20级蓝弓箭",5800,"20级紫弓箭",3200,"20级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"双剑书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿双剑",5800,"20级蓝双剑",3200,"20级紫双剑",1000,},
				result_adder = {"20级蓝双剑",5800,"20级紫双剑",3200,"20级橙双剑",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"长鞭书20",1, "打造符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿长鞭",5800,"20级蓝长鞭",3200,"20级紫长鞭",1000,},
				result_adder = {"20级蓝长鞭",5800,"20级紫长鞭",3200,"20级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"男帽书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿男头盔",5800,"20级蓝男头盔",3200,"20级紫男头盔",1000,},
				result_adder = {"20级蓝男头盔",5800,"20级紫男头盔",3200,"20级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"女帽书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿女头盔",5800,"20级蓝女头盔",3200,"20级紫女头盔",1000,},
				result_adder = {"20级蓝女头盔",5800,"20级紫女头盔",3200,"20级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"男衣书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿男护甲",5800,"20级蓝男护甲",3200,"20级紫男护甲",1000,},
				result_adder = {"20级蓝男护甲",5800,"20级紫男护甲",3200,"20级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"女衣书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿女护甲",5800,"20级蓝女护甲",3200,"20级紫女护甲",1000,},
				result_adder = {"20级蓝女护甲",5800,"20级紫女护甲",3200,"20级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"腰带书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿护腰",5800,"20级蓝护腰",3200,"20级紫护腰",1000,},
				result_adder = {"20级蓝护腰",5800,"20级紫护腰",3200,"20级橙护腰",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"挂坠书20",1, "炼金符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"20级绿挂坠",5800,"20级蓝挂坠",3200,"20级紫挂坠",1000,},
				result_adder = {"20级蓝挂坠",5800,"20级紫挂坠",3200,"20级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "20级打造套装物", Rand = 1000},{ItemKey = "20级打造套装法" , Rand = 1000} , {ItemKey = "20级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["25级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"鞋子书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"25级绿靴子",5800,"25级蓝靴子",3200,"25级紫靴子",1000,},
				result_adder = {"25级蓝靴子",5800,"25级紫靴子",3200,"25级橙靴子",1000,},
				SuitRadom = { {ItemKey = "45级打造套装物", Rand = 1000},{ItemKey = "45级打造套装法" , Rand = 1000} , {ItemKey = "45级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"护腕书20",1, "缝纫符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"25级绿护腕",5800,"25级蓝护腕",3200,"25级紫护腕",1000,},
				result_adder = {"25级蓝护腕",5800,"25级紫护腕",3200,"25级橙护腕",1000,},
				SuitRadom = { {ItemKey = "25级打造套装物", Rand = 1000},{ItemKey = "25级打造套装法" , Rand = 1000} , {ItemKey = "25级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"戒指书20",1, "炼金符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"25级绿戒指",5800,"25级蓝戒指",3200,"25级紫戒指",1000,},
				result_adder = {"25级蓝戒指",5800,"25级紫戒指",3200,"25级橙戒指",1000,},
				SuitRadom = { {ItemKey = "25级打造套装物", Rand = 1000},{ItemKey = "25级打造套装法" , Rand = 1000} , {ItemKey = "25级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 10000},
				vitality = 10,
				formula_basic = {"项链书20",1, "炼金符",1, "百炼精铁20",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"25级绿项链",5800,"25级蓝项链",3200,"25级紫项链",1000,},
				result_adder = {"25级蓝项链",5800,"25级紫项链",3200,"25级橙项链",1000,},
				SuitRadom = { {ItemKey = "25级打造套装物", Rand = 1000},{ItemKey = "25级打造套装法" , Rand = 1000} , {ItemKey = "25级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["30级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书30",1, "打造符",1, "百炼精铁30",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"30级绿重剑",5800,"30级蓝重剑",3200,"30级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"30级蓝重剑",5800,"30级紫重剑",3200,"30级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"扇子书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿扇子",5800,"30级蓝扇子",3200,"30级紫扇子",1000,},
				result_adder = {"30级蓝扇子",5800,"30级紫扇子",3200,"30级橙扇子",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"笛子书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿笛子",5800,"30级蓝笛子",3200,"30级紫笛子",1000,},
				result_adder = {"30级蓝笛子",5800,"30级紫笛子",3200,"30级橙笛子",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"阔刀书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿阔刀",5800,"30级蓝阔刀",3200,"30级紫阔刀",1000,},
				result_adder = {"30级蓝阔刀",5800,"30级紫阔刀",3200,"30级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"毛笔书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿毛笔",5800,"30级蓝毛笔",3200,"30级紫毛笔",1000,},
				result_adder = {"30级蓝毛笔",5800,"30级紫毛笔",3200,"30级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"长枪书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿长枪",5800,"30级蓝长枪",3200,"30级紫长枪",1000,},
				result_adder = {"30级蓝长枪",5800,"30级紫长枪",3200,"30级橙长枪",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"爪刺书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿爪刺",5800,"30级蓝爪刺",3200,"30级紫爪刺",1000,},
				result_adder = {"30级蓝爪刺",5800,"30级紫爪刺",3200,"30级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"绣伞书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿绣伞",5800,"30级蓝绣伞",3200,"30级紫绣伞",1000,},
				result_adder = {"30级蓝绣伞",5800,"30级紫绣伞",3200,"30级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"短杖书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿短杖",5800,"30级蓝短杖",3200,"30级紫短杖",1000,},
				result_adder = {"30级蓝短杖",5800,"30级紫短杖",3200,"30级橙短杖",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"弓箭书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿弓箭",5800,"30级蓝弓箭",3200,"30级紫弓箭",1000,},
				result_adder = {"30级蓝弓箭",5800,"30级紫弓箭",3200,"30级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"双剑书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿双剑",5800,"30级蓝双剑",3200,"30级紫双剑",1000,},
				result_adder = {"30级蓝双剑",5800,"30级紫双剑",3200,"30级橙双剑",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"长鞭书30",1, "打造符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿长鞭",5800,"30级蓝长鞭",3200,"30级紫长鞭",1000,},
				result_adder = {"30级蓝长鞭",5800,"30级紫长鞭",3200,"30级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"男帽书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿男头盔",5800,"30级蓝男头盔",3200,"30级紫男头盔",1000,},
				result_adder = {"30级蓝男头盔",5800,"30级紫男头盔",3200,"30级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"女帽书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿女头盔",5800,"30级蓝女头盔",3200,"30级紫女头盔",1000,},
				result_adder = {"30级蓝女头盔",5800,"30级紫女头盔",3200,"30级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"男衣书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿男护甲",5800,"30级蓝男护甲",3200,"30级紫男护甲",1000,},
				result_adder = {"30级蓝男护甲",5800,"30级紫男护甲",3200,"30级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"女衣书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿女护甲",5800,"30级蓝女护甲",3200,"30级紫女护甲",1000,},
				result_adder = {"30级蓝女护甲",5800,"30级紫女护甲",3200,"30级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"腰带书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿护腰",5800,"30级蓝护腰",3200,"30级紫护腰",1000,},
				result_adder = {"30级蓝护腰",5800,"30级紫护腰",3200,"30级橙护腰",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"挂坠书30",1, "炼金符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"30级绿挂坠",5800,"30级蓝挂坠",3200,"30级紫挂坠",1000,},
				result_adder = {"30级蓝挂坠",5800,"30级紫挂坠",3200,"30级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "30级打造套装物", Rand = 1000},{ItemKey = "30级打造套装法" , Rand = 1000} , {ItemKey = "30级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["35级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"鞋子书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"35级绿靴子",5800,"35级蓝靴子",3200,"35级紫靴子",1000,},
				result_adder = {"35级蓝靴子",5800,"35级紫靴子",3200,"35级橙靴子",1000,},
				SuitRadom = { {ItemKey = "35级打造套装物", Rand = 1000},{ItemKey = "35级打造套装法" , Rand = 1000} , {ItemKey = "35级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"护腕书30",1, "缝纫符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"35级绿护腕",5800,"35级蓝护腕",3200,"35级紫护腕",1000,},
				result_adder = {"35级蓝护腕",5800,"35级紫护腕",3200,"35级橙护腕",1000,},
				SuitRadom = { {ItemKey = "35级打造套装物", Rand = 1000},{ItemKey = "35级打造套装法" , Rand = 1000} , {ItemKey = "35级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"戒指书30",1, "炼金符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"35级绿戒指",5800,"35级蓝戒指",3200,"35级紫戒指",1000,},
				result_adder = {"35级蓝戒指",5800,"35级紫戒指",3200,"35级橙戒指",1000,},
				SuitRadom = { {ItemKey = "35级打造套装物", Rand = 1000},{ItemKey = "35级打造套装法" , Rand = 1000} , {ItemKey = "35级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 20000},
				vitality = 10,
				formula_basic = {"项链书30",1, "炼金符",1, "百炼精铁30",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"35级绿项链",5800,"35级蓝项链",3200,"35级紫项链",1000,},
				result_adder = {"35级蓝项链",5800,"35级紫项链",3200,"35级橙项链",1000,},
				SuitRadom = { {ItemKey = "35级打造套装物", Rand = 1000},{ItemKey = "35级打造套装法" , Rand = 1000} , {ItemKey = "35级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["40级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书40",1, "打造符",1, "百炼精铁40",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"40级绿重剑",5800,"40级蓝重剑",3200,"40级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"40级蓝重剑",5800,"40级紫重剑",3200,"40级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"扇子书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿扇子",5800,"40级蓝扇子",3200,"40级紫扇子",1000,},
				result_adder = {"40级蓝扇子",5800,"40级紫扇子",3200,"40级橙扇子",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"笛子书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿笛子",5800,"40级蓝笛子",3200,"40级紫笛子",1000,},
				result_adder = {"40级蓝笛子",5800,"40级紫笛子",3200,"40级橙笛子",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"阔刀书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿阔刀",5800,"40级蓝阔刀",3200,"40级紫阔刀",1000,},
				result_adder = {"40级蓝阔刀",5800,"40级紫阔刀",3200,"40级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"毛笔书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿毛笔",5800,"40级蓝毛笔",3200,"40级紫毛笔",1000,},
				result_adder = {"40级蓝毛笔",5800,"40级紫毛笔",3200,"40级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"长枪书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿长枪",5800,"40级蓝长枪",3200,"40级紫长枪",1000,},
				result_adder = {"40级蓝长枪",5800,"40级紫长枪",3200,"40级橙长枪",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"爪刺书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿爪刺",5800,"40级蓝爪刺",3200,"40级紫爪刺",1000,},
				result_adder = {"40级蓝爪刺",5800,"40级紫爪刺",3200,"40级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"绣伞书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿绣伞",5800,"40级蓝绣伞",3200,"40级紫绣伞",1000,},
				result_adder = {"40级蓝绣伞",5800,"40级紫绣伞",3200,"40级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"短杖书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿短杖",5800,"40级蓝短杖",3200,"40级紫短杖",1000,},
				result_adder = {"40级蓝短杖",5800,"40级紫短杖",3200,"40级橙短杖",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"弓箭书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿弓箭",5800,"40级蓝弓箭",3200,"40级紫弓箭",1000,},
				result_adder = {"40级蓝弓箭",5800,"40级紫弓箭",3200,"40级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"双剑书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿双剑",5800,"40级蓝双剑",3200,"40级紫双剑",1000,},
				result_adder = {"40级蓝双剑",5800,"40级紫双剑",3200,"40级橙双剑",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"长鞭书40",1, "打造符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿长鞭",5800,"40级蓝长鞭",3200,"40级紫长鞭",1000,},
				result_adder = {"40级蓝长鞭",5800,"40级紫长鞭",3200,"40级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"男帽书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿男头盔",5800,"40级蓝男头盔",3200,"40级紫男头盔",1000,},
				result_adder = {"40级蓝男头盔",5800,"40级紫男头盔",3200,"40级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"女帽书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿女头盔",5800,"40级蓝女头盔",3200,"40级紫女头盔",1000,},
				result_adder = {"40级蓝女头盔",5800,"40级紫女头盔",3200,"40级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"男衣书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿男护甲",5800,"40级蓝男护甲",3200,"40级紫男护甲",1000,},
				result_adder = {"40级蓝男护甲",5800,"40级紫男护甲",3200,"40级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"女衣书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿女护甲",5800,"40级蓝女护甲",3200,"40级紫女护甲",1000,},
				result_adder = {"40级蓝女护甲",5800,"40级紫女护甲",3200,"40级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"腰带书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿护腰",5800,"40级蓝护腰",3200,"40级紫护腰",1000,},
				result_adder = {"40级蓝护腰",5800,"40级紫护腰",3200,"40级橙护腰",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"挂坠书40",1, "炼金符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"40级绿挂坠",5800,"40级蓝挂坠",3200,"40级紫挂坠",1000,},
				result_adder = {"40级蓝挂坠",5800,"40级紫挂坠",3200,"40级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "40级打造套装物", Rand = 1000},{ItemKey = "40级打造套装法" , Rand = 1000} , {ItemKey = "40级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["45级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"鞋子书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"45级绿靴子",5800,"45级蓝靴子",3200,"45级紫靴子",1000,},
				result_adder = {"45级蓝靴子",5800,"45级紫靴子",3200,"45级橙靴子",1000,},
				SuitRadom = { {ItemKey = "45级打造套装物", Rand = 1000},{ItemKey = "45级打造套装法" , Rand = 1000} , {ItemKey = "45级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"护腕书40",1, "缝纫符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"45级绿护腕",5800,"45级蓝护腕",3200,"45级紫护腕",1000,},
				result_adder = {"45级蓝护腕",5800,"45级紫护腕",3200,"45级橙护腕",1000,},
				SuitRadom = { {ItemKey = "45级打造套装物", Rand = 1000},{ItemKey = "45级打造套装法" , Rand = 1000} , {ItemKey = "45级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"戒指书40",1, "炼金符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"45级绿戒指",5800,"45级蓝戒指",3200,"45级紫戒指",1000,},
				result_adder = {"45级蓝戒指",5800,"45级紫戒指",3200,"45级橙戒指",1000,},
				SuitRadom = { {ItemKey = "45级打造套装物", Rand = 1000},{ItemKey = "45级打造套装法" , Rand = 1000} , {ItemKey = "45级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 30000},
				vitality = 10,
				formula_basic = {"项链书40",1, "炼金符",1, "百炼精铁40",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"45级绿项链",5800,"45级蓝项链",3200,"45级紫项链",1000,},
				result_adder = {"45级蓝项链",5800,"45级紫项链",3200,"45级橙项链",1000,},
				SuitRadom = { {ItemKey = "45级打造套装物", Rand = 1000},{ItemKey = "45级打造套装法" , Rand = 1000} , {ItemKey = "45级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["50级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书50",1, "打造符",1, "百炼精铁50",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"50级绿重剑",5800,"50级蓝重剑",3200,"50级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"50级蓝重剑",5800,"50级紫重剑",3200,"50级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"扇子书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿扇子",5800,"50级蓝扇子",3200,"50级紫扇子",1000,},
				result_adder = {"50级蓝扇子",5800,"50级紫扇子",3200,"50级橙扇子",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"笛子书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿笛子",5800,"50级蓝笛子",3200,"50级紫笛子",1000,},
				result_adder = {"50级蓝笛子",5800,"50级紫笛子",3200,"50级橙笛子",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"阔刀书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿阔刀",5800,"50级蓝阔刀",3200,"50级紫阔刀",1000,},
				result_adder = {"50级蓝阔刀",5800,"50级紫阔刀",3200,"50级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"毛笔书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿毛笔",5800,"50级蓝毛笔",3200,"50级紫毛笔",1000,},
				result_adder = {"50级蓝毛笔",5800,"50级紫毛笔",3200,"50级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"长枪书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿长枪",5800,"50级蓝长枪",3200,"50级紫长枪",1000,},
				result_adder = {"50级蓝长枪",5800,"50级紫长枪",3200,"50级橙长枪",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"爪刺书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿爪刺",5800,"50级蓝爪刺",3200,"50级紫爪刺",1000,},
				result_adder = {"50级蓝爪刺",5800,"50级紫爪刺",3200,"50级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"绣伞书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿绣伞",5800,"50级蓝绣伞",3200,"50级紫绣伞",1000,},
				result_adder = {"50级蓝绣伞",5800,"50级紫绣伞",3200,"50级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"短杖书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿短杖",5800,"50级蓝短杖",3200,"50级紫短杖",1000,},
				result_adder = {"50级蓝短杖",5800,"50级紫短杖",3200,"50级橙短杖",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"弓箭书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿弓箭",5800,"50级蓝弓箭",3200,"50级紫弓箭",1000,},
				result_adder = {"50级蓝弓箭",5800,"50级紫弓箭",3200,"50级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"双剑书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿双剑",5800,"50级蓝双剑",3200,"50级紫双剑",1000,},
				result_adder = {"50级蓝双剑",5800,"50级紫双剑",3200,"50级橙双剑",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"长鞭书50",1, "打造符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿长鞭",5800,"50级蓝长鞭",3200,"50级紫长鞭",1000,},
				result_adder = {"50级蓝长鞭",5800,"50级紫长鞭",3200,"50级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"男帽书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿男头盔",5800,"50级蓝男头盔",3200,"50级紫男头盔",1000,},
				result_adder = {"50级蓝男头盔",5800,"50级紫男头盔",3200,"50级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"女帽书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿女头盔",5800,"50级蓝女头盔",3200,"50级紫女头盔",1000,},
				result_adder = {"50级蓝女头盔",5800,"50级紫女头盔",3200,"50级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"男衣书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿男护甲",5800,"50级蓝男护甲",3200,"50级紫男护甲",1000,},
				result_adder = {"50级蓝男护甲",5800,"50级紫男护甲",3200,"50级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"女衣书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿女护甲",5800,"50级蓝女护甲",3200,"50级紫女护甲",1000,},
				result_adder = {"50级蓝女护甲",5800,"50级紫女护甲",3200,"50级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"腰带书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿护腰",5800,"50级蓝护腰",3200,"50级紫护腰",1000,},
				result_adder = {"50级蓝护腰",5800,"50级紫护腰",3200,"50级橙护腰",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"挂坠书50",1, "炼金符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"50级绿挂坠",5800,"50级蓝挂坠",3200,"50级紫挂坠",1000,},
				result_adder = {"50级蓝挂坠",5800,"50级紫挂坠",3200,"50级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "50级打造套装物", Rand = 1000},{ItemKey = "50级打造套装法" , Rand = 1000} , {ItemKey = "50级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["55级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"鞋子书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"55级绿靴子",5800,"55级蓝靴子",3200,"55级紫靴子",1000,},
				result_adder = {"55级蓝靴子",5800,"55级紫靴子",3200,"55级橙靴子",1000,},
				SuitRadom = { {ItemKey = "55级打造套装物", Rand = 1000},{ItemKey = "55级打造套装法" , Rand = 1000} , {ItemKey = "55级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"护腕书50",1, "缝纫符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"55级绿护腕",5800,"55级蓝护腕",3200,"55级紫护腕",1000,},
				result_adder = {"55级蓝护腕",5800,"55级紫护腕",3200,"55级橙护腕",1000,},
				SuitRadom = { {ItemKey = "55级打造套装物", Rand = 1000},{ItemKey = "55级打造套装法" , Rand = 1000} , {ItemKey = "55级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"戒指书50",1, "炼金符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"55级绿戒指",5800,"55级蓝戒指",3200,"55级紫戒指",1000,},
				result_adder = {"55级蓝戒指",5800,"55级紫戒指",3200,"55级橙戒指",1000,},
				SuitRadom = { {ItemKey = "55级打造套装物", Rand = 1000},{ItemKey = "55级打造套装法" , Rand = 1000} , {ItemKey = "55级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 50000},
				vitality = 10,
				formula_basic = {"项链书50",1, "炼金符",1, "百炼精铁50",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"55级绿项链",5800,"55级蓝项链",3200,"55级紫项链",1000,},
				result_adder = {"55级蓝项链",5800,"55级紫项链",3200,"55级橙项链",1000,},
				SuitRadom = { {ItemKey = "55级打造套装物", Rand = 1000},{ItemKey = "55级打造套装法" , Rand = 1000} , {ItemKey = "55级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["60级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书60",1, "打造符",1, "百炼精铁60",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"60级绿重剑",5800,"60级蓝重剑",3200,"60级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"60级蓝重剑",5800,"60级紫重剑",3200,"60级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"扇子书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿扇子",5800,"60级蓝扇子",3200,"60级紫扇子",1000,},
				result_adder = {"60级蓝扇子",5800,"60级紫扇子",3200,"60级橙扇子",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"笛子书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿笛子",5800,"60级蓝笛子",3200,"60级紫笛子",1000,},
				result_adder = {"60级蓝笛子",5800,"60级紫笛子",3200,"60级橙笛子",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"阔刀书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿阔刀",5800,"60级蓝阔刀",3200,"60级紫阔刀",1000,},
				result_adder = {"60级蓝阔刀",5800,"60级紫阔刀",3200,"60级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"毛笔书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿毛笔",5800,"60级蓝毛笔",3200,"60级紫毛笔",1000,},
				result_adder = {"60级蓝毛笔",5800,"60级紫毛笔",3200,"60级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"长枪书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿长枪",5800,"60级蓝长枪",3200,"60级紫长枪",1000,},
				result_adder = {"60级蓝长枪",5800,"60级紫长枪",3200,"60级橙长枪",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"爪刺书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿爪刺",5800,"60级蓝爪刺",3200,"60级紫爪刺",1000,},
				result_adder = {"60级蓝爪刺",5800,"60级紫爪刺",3200,"60级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"绣伞书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿绣伞",5800,"60级蓝绣伞",3200,"60级紫绣伞",1000,},
				result_adder = {"60级蓝绣伞",5800,"60级紫绣伞",3200,"60级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"短杖书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿短杖",5800,"60级蓝短杖",3200,"60级紫短杖",1000,},
				result_adder = {"60级蓝短杖",5800,"60级紫短杖",3200,"60级橙短杖",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"弓箭书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿弓箭",5800,"60级蓝弓箭",3200,"60级紫弓箭",1000,},
				result_adder = {"60级蓝弓箭",5800,"60级紫弓箭",3200,"60级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"双剑书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿双剑",5800,"60级蓝双剑",3200,"60级紫双剑",1000,},
				result_adder = {"60级蓝双剑",5800,"60级紫双剑",3200,"60级橙双剑",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"长鞭书60",1, "打造符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿长鞭",5800,"60级蓝长鞭",3200,"60级紫长鞭",1000,},
				result_adder = {"60级蓝长鞭",5800,"60级紫长鞭",3200,"60级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"男帽书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿男头盔",5800,"60级蓝男头盔",3200,"60级紫男头盔",1000,},
				result_adder = {"60级蓝男头盔",5800,"60级紫男头盔",3200,"60级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"女帽书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿女头盔",5800,"60级蓝女头盔",3200,"60级紫女头盔",1000,},
				result_adder = {"60级蓝女头盔",5800,"60级紫女头盔",3200,"60级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"男衣书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿男护甲",5800,"60级蓝男护甲",3200,"60级紫男护甲",1000,},
				result_adder = {"60级蓝男护甲",5800,"60级紫男护甲",3200,"60级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"女衣书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿女护甲",5800,"60级蓝女护甲",3200,"60级紫女护甲",1000,},
				result_adder = {"60级蓝女护甲",5800,"60级紫女护甲",3200,"60级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"腰带书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿护腰",5800,"60级蓝护腰",3200,"60级紫护腰",1000,},
				result_adder = {"60级蓝护腰",5800,"60级紫护腰",3200,"60级橙护腰",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"挂坠书60",1, "炼金符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"60级绿挂坠",5800,"60级蓝挂坠",3200,"60级紫挂坠",1000,},
				result_adder = {"60级蓝挂坠",5800,"60级紫挂坠",3200,"60级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "60级打造套装物", Rand = 1000},{ItemKey = "60级打造套装法" , Rand = 1000} , {ItemKey = "60级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["65级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"鞋子书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"65级绿靴子",5800,"65级蓝靴子",3200,"65级紫靴子",1000,},
				result_adder = {"65级蓝靴子",5800,"65级紫靴子",3200,"65级橙靴子",1000,},
				SuitRadom = { {ItemKey = "65级打造套装物", Rand = 1000},{ItemKey = "65级打造套装法" , Rand = 1000} , {ItemKey = "65级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"护腕书60",1, "缝纫符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"65级绿护腕",5800,"65级蓝护腕",3200,"65级紫护腕",1000,},
				result_adder = {"65级蓝护腕",5800,"65级紫护腕",3200,"65级橙护腕",1000,},
				SuitRadom = { {ItemKey = "65级打造套装物", Rand = 1000},{ItemKey = "65级打造套装法" , Rand = 1000} , {ItemKey = "65级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"戒指书60",1, "炼金符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"65级绿戒指",5800,"65级蓝戒指",3200,"65级紫戒指",1000,},
				result_adder = {"65级蓝戒指",5800,"65级紫戒指",3200,"65级橙戒指",1000,},
				SuitRadom = { {ItemKey = "65级打造套装物", Rand = 1000},{ItemKey = "65级打造套装法" , Rand = 1000} , {ItemKey = "65级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 75000},
				vitality = 10,
				formula_basic = {"项链书60",1, "炼金符",1, "百炼精铁60",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"65级绿项链",5800,"65级蓝项链",3200,"65级紫项链",1000,},
				result_adder = {"65级蓝项链",5800,"65级紫项链",3200,"65级橙项链",1000,},
				SuitRadom = { {ItemKey = "65级打造套装物", Rand = 1000},{ItemKey = "65级打造套装法" , Rand = 1000} , {ItemKey = "65级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["70级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书70",1, "打造符",1, "百炼精铁70",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"70级绿重剑",5800,"70级蓝重剑",3200,"70级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"70级蓝重剑",5800,"70级紫重剑",3200,"70级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"扇子书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿扇子",5800,"70级蓝扇子",3200,"70级紫扇子",1000,},
				result_adder = {"70级蓝扇子",5800,"70级紫扇子",3200,"70级橙扇子",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"笛子书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿笛子",5800,"70级蓝笛子",3200,"70级紫笛子",1000,},
				result_adder = {"70级蓝笛子",5800,"70级紫笛子",3200,"70级橙笛子",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"阔刀书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿阔刀",5800,"70级蓝阔刀",3200,"70级紫阔刀",1000,},
				result_adder = {"70级蓝阔刀",5800,"70级紫阔刀",3200,"70级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"毛笔书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿毛笔",5800,"70级蓝毛笔",3200,"70级紫毛笔",1000,},
				result_adder = {"70级蓝毛笔",5800,"70级紫毛笔",3200,"70级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"长枪书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿长枪",5800,"70级蓝长枪",3200,"70级紫长枪",1000,},
				result_adder = {"70级蓝长枪",5800,"70级紫长枪",3200,"70级橙长枪",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"爪刺书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿爪刺",5800,"70级蓝爪刺",3200,"70级紫爪刺",1000,},
				result_adder = {"70级蓝爪刺",5800,"70级紫爪刺",3200,"70级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"绣伞书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿绣伞",5800,"70级蓝绣伞",3200,"70级紫绣伞",1000,},
				result_adder = {"70级蓝绣伞",5800,"70级紫绣伞",3200,"70级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"短杖书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿短杖",5800,"70级蓝短杖",3200,"70级紫短杖",1000,},
				result_adder = {"70级蓝短杖",5800,"70级紫短杖",3200,"70级橙短杖",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"弓箭书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿弓箭",5800,"70级蓝弓箭",3200,"70级紫弓箭",1000,},
				result_adder = {"70级蓝弓箭",5800,"70级紫弓箭",3200,"70级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"双剑书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿双剑",5800,"70级蓝双剑",3200,"70级紫双剑",1000,},
				result_adder = {"70级蓝双剑",5800,"70级紫双剑",3200,"70级橙双剑",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"长鞭书70",1, "打造符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿长鞭",5800,"70级蓝长鞭",3200,"70级紫长鞭",1000,},
				result_adder = {"70级蓝长鞭",5800,"70级紫长鞭",3200,"70级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"男帽书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿男头盔",5800,"70级蓝男头盔",3200,"70级紫男头盔",1000,},
				result_adder = {"70级蓝男头盔",5800,"70级紫男头盔",3200,"70级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"女帽书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿女头盔",5800,"70级蓝女头盔",3200,"70级紫女头盔",1000,},
				result_adder = {"70级蓝女头盔",5800,"70级紫女头盔",3200,"70级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"男衣书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿男护甲",5800,"70级蓝男护甲",3200,"70级紫男护甲",1000,},
				result_adder = {"70级蓝男护甲",5800,"70级紫男护甲",3200,"70级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"女衣书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿女护甲",5800,"70级蓝女护甲",3200,"70级紫女护甲",1000,},
				result_adder = {"70级蓝女护甲",5800,"70级紫女护甲",3200,"70级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"腰带书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿护腰",5800,"70级蓝护腰",3200,"70级紫护腰",1000,},
				result_adder = {"70级蓝护腰",5800,"70级紫护腰",3200,"70级橙护腰",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"挂坠书70",1, "炼金符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"70级绿挂坠",5800,"70级蓝挂坠",3200,"70级紫挂坠",1000,},
				result_adder = {"70级蓝挂坠",5800,"70级紫挂坠",3200,"70级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "70级打造套装物", Rand = 1000},{ItemKey = "70级打造套装法" , Rand = 1000} , {ItemKey = "70级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["75级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"鞋子书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"75级绿靴子",5800,"75级蓝靴子",3200,"75级紫靴子",1000,},
				result_adder = {"75级蓝靴子",5800,"75级紫靴子",3200,"75级橙靴子",1000,},
				SuitRadom = { {ItemKey = "75级打造套装物", Rand = 1000},{ItemKey = "75级打造套装法" , Rand = 1000} , {ItemKey = "75级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"护腕书70",1, "缝纫符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"75级绿护腕",5800,"75级蓝护腕",3200,"75级紫护腕",1000,},
				result_adder = {"75级蓝护腕",5800,"75级紫护腕",3200,"75级橙护腕",1000,},
				SuitRadom = { {ItemKey = "75级打造套装物", Rand = 1000},{ItemKey = "75级打造套装法" , Rand = 1000} , {ItemKey = "75级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"戒指书70",1, "炼金符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"75级绿戒指",5800,"75级蓝戒指",3200,"75级紫戒指",1000,},
				result_adder = {"75级蓝戒指",5800,"75级紫戒指",3200,"75级橙戒指",1000,},
				SuitRadom = { {ItemKey = "75级打造套装物", Rand = 1000},{ItemKey = "75级打造套装法" , Rand = 1000} , {ItemKey = "75级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 100000},
				vitality = 10,
				formula_basic = {"项链书70",1, "炼金符",1, "百炼精铁70",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"75级绿项链",5800,"75级蓝项链",3200,"75级紫项链",1000,},
				result_adder = {"75级蓝项链",5800,"75级紫项链",3200,"75级橙项链",1000,},
				SuitRadom = { {ItemKey = "75级打造套装物", Rand = 1000},{ItemKey = "75级打造套装法" , Rand = 1000} , {ItemKey = "75级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["80级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书80",1, "打造符",1, "百炼精铁80",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"80级绿重剑",5800,"80级蓝重剑",3200,"80级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"80级蓝重剑",5800,"80级紫重剑",3200,"80级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"扇子书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿扇子",5800,"80级蓝扇子",3200,"80级紫扇子",1000,},
				result_adder = {"80级蓝扇子",5800,"80级紫扇子",3200,"80级橙扇子",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"笛子书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿笛子",5800,"80级蓝笛子",3200,"80级紫笛子",1000,},
				result_adder = {"80级蓝笛子",5800,"80级紫笛子",3200,"80级橙笛子",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"阔刀书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿阔刀",5800,"80级蓝阔刀",3200,"80级紫阔刀",1000,},
				result_adder = {"80级蓝阔刀",5800,"80级紫阔刀",3200,"80级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"毛笔书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿毛笔",5800,"80级蓝毛笔",3200,"80级紫毛笔",1000,},
				result_adder = {"80级蓝毛笔",5800,"80级紫毛笔",3200,"80级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"长枪书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿长枪",5800,"80级蓝长枪",3200,"80级紫长枪",1000,},
				result_adder = {"80级蓝长枪",5800,"80级紫长枪",3200,"80级橙长枪",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"爪刺书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿爪刺",5800,"80级蓝爪刺",3200,"80级紫爪刺",1000,},
				result_adder = {"80级蓝爪刺",5800,"80级紫爪刺",3200,"80级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"绣伞书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿绣伞",5800,"80级蓝绣伞",3200,"80级紫绣伞",1000,},
				result_adder = {"80级蓝绣伞",5800,"80级紫绣伞",3200,"80级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"短杖书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿短杖",5800,"80级蓝短杖",3200,"80级紫短杖",1000,},
				result_adder = {"80级蓝短杖",5800,"80级紫短杖",3200,"80级橙短杖",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"弓箭书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿弓箭",5800,"80级蓝弓箭",3200,"80级紫弓箭",1000,},
				result_adder = {"80级蓝弓箭",5800,"80级紫弓箭",3200,"80级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"双剑书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿双剑",5800,"80级蓝双剑",3200,"80级紫双剑",1000,},
				result_adder = {"80级蓝双剑",5800,"80级紫双剑",3200,"80级橙双剑",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"长鞭书80",1, "打造符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿长鞭",5800,"80级蓝长鞭",3200,"80级紫长鞭",1000,},
				result_adder = {"80级蓝长鞭",5800,"80级紫长鞭",3200,"80级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"男帽书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿男头盔",5800,"80级蓝男头盔",3200,"80级紫男头盔",1000,},
				result_adder = {"80级蓝男头盔",5800,"80级紫男头盔",3200,"80级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"女帽书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿女头盔",5800,"80级蓝女头盔",3200,"80级紫女头盔",1000,},
				result_adder = {"80级蓝女头盔",5800,"80级紫女头盔",3200,"80级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"男衣书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿男护甲",5800,"80级蓝男护甲",3200,"80级紫男护甲",1000,},
				result_adder = {"80级蓝男护甲",5800,"80级紫男护甲",3200,"80级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"女衣书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿女护甲",5800,"80级蓝女护甲",3200,"80级紫女护甲",1000,},
				result_adder = {"80级蓝女护甲",5800,"80级紫女护甲",3200,"80级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"腰带书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿护腰",5800,"80级蓝护腰",3200,"80级紫护腰",1000,},
				result_adder = {"80级蓝护腰",5800,"80级紫护腰",3200,"80级橙护腰",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"挂坠书80",1, "炼金符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"80级绿挂坠",5800,"80级蓝挂坠",3200,"80级紫挂坠",1000,},
				result_adder = {"80级蓝挂坠",5800,"80级紫挂坠",3200,"80级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "80级打造套装物", Rand = 1000},{ItemKey = "80级打造套装法" , Rand = 1000} , {ItemKey = "80级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["85级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"鞋子书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"85级绿靴子",5800,"85级蓝靴子",3200,"85级紫靴子",1000,},
				result_adder = {"85级蓝靴子",5800,"85级紫靴子",3200,"85级橙靴子",1000,},
				SuitRadom = { {ItemKey = "85级打造套装物", Rand = 1000},{ItemKey = "85级打造套装法" , Rand = 1000} , {ItemKey = "85级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"护腕书80",1, "缝纫符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"85级绿护腕",5800,"85级蓝护腕",3200,"85级紫护腕",1000,},
				result_adder = {"85级蓝护腕",5800,"85级紫护腕",3200,"85级橙护腕",1000,},
				SuitRadom = { {ItemKey = "85级打造套装物", Rand = 1000},{ItemKey = "85级打造套装法" , Rand = 1000} , {ItemKey = "85级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"戒指书80",1, "炼金符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"85级绿戒指",5800,"85级蓝戒指",3200,"85级紫戒指",1000,},
				result_adder = {"85级蓝戒指",5800,"85级紫戒指",3200,"85级橙戒指",1000,},
				SuitRadom = { {ItemKey = "85级打造套装物", Rand = 1000},{ItemKey = "85级打造套装法" , Rand = 1000} , {ItemKey = "85级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 150000},
				vitality = 10,
				formula_basic = {"项链书80",1, "炼金符",1, "百炼精铁80",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"85级绿项链",5800,"85级蓝项链",3200,"85级紫项链",1000,},
				result_adder = {"85级蓝项链",5800,"85级紫项链",3200,"85级橙项链",1000,},
				SuitRadom = { {ItemKey = "85级打造套装物", Rand = 1000},{ItemKey = "85级打造套装法" , Rand = 1000} , {ItemKey = "85级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["90级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书90",1, "打造符",1, "百炼精铁90",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"90级绿重剑",5800,"90级蓝重剑",3200,"90级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"90级蓝重剑",5800,"90级紫重剑",3200,"90级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"扇子书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿扇子",5800,"90级蓝扇子",3200,"90级紫扇子",1000,},
				result_adder = {"90级蓝扇子",5800,"90级紫扇子",3200,"90级橙扇子",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"笛子书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿笛子",5800,"90级蓝笛子",3200,"90级紫笛子",1000,},
				result_adder = {"90级蓝笛子",5800,"90级紫笛子",3200,"90级橙笛子",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"阔刀书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿阔刀",5800,"90级蓝阔刀",3200,"90级紫阔刀",1000,},
				result_adder = {"90级蓝阔刀",5800,"90级紫阔刀",3200,"90级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"毛笔书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿毛笔",5800,"90级蓝毛笔",3200,"90级紫毛笔",1000,},
				result_adder = {"90级蓝毛笔",5800,"90级紫毛笔",3200,"90级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"长枪书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿长枪",5800,"90级蓝长枪",3200,"90级紫长枪",1000,},
				result_adder = {"90级蓝长枪",5800,"90级紫长枪",3200,"90级橙长枪",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"爪刺书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿爪刺",5800,"90级蓝爪刺",3200,"90级紫爪刺",1000,},
				result_adder = {"90级蓝爪刺",5800,"90级紫爪刺",3200,"90级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"绣伞书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿绣伞",5800,"90级蓝绣伞",3200,"90级紫绣伞",1000,},
				result_adder = {"90级蓝绣伞",5800,"90级紫绣伞",3200,"90级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"短杖书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿短杖",5800,"90级蓝短杖",3200,"90级紫短杖",1000,},
				result_adder = {"90级蓝短杖",5800,"90级紫短杖",3200,"90级橙短杖",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"弓箭书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿弓箭",5800,"90级蓝弓箭",3200,"90级紫弓箭",1000,},
				result_adder = {"90级蓝弓箭",5800,"90级紫弓箭",3200,"90级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"双剑书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿双剑",5800,"90级蓝双剑",3200,"90级紫双剑",1000,},
				result_adder = {"90级蓝双剑",5800,"90级紫双剑",3200,"90级橙双剑",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"长鞭书90",1, "打造符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿长鞭",5800,"90级蓝长鞭",3200,"90级紫长鞭",1000,},
				result_adder = {"90级蓝长鞭",5800,"90级紫长鞭",3200,"90级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"男帽书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿男头盔",5800,"90级蓝男头盔",3200,"90级紫男头盔",1000,},
				result_adder = {"90级蓝男头盔",5800,"90级紫男头盔",3200,"90级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"女帽书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿女头盔",5800,"90级蓝女头盔",3200,"90级紫女头盔",1000,},
				result_adder = {"90级蓝女头盔",5800,"90级紫女头盔",3200,"90级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"男衣书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿男护甲",5800,"90级蓝男护甲",3200,"90级紫男护甲",1000,},
				result_adder = {"90级蓝男护甲",5800,"90级紫男护甲",3200,"90级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"女衣书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿女护甲",5800,"90级蓝女护甲",3200,"90级紫女护甲",1000,},
				result_adder = {"90级蓝女护甲",5800,"90级紫女护甲",3200,"90级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"腰带书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿护腰",5800,"90级蓝护腰",3200,"90级紫护腰",1000,},
				result_adder = {"90级蓝护腰",5800,"90级紫护腰",3200,"90级橙护腰",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"挂坠书90",1, "炼金符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"90级绿挂坠",5800,"90级蓝挂坠",3200,"90级紫挂坠",1000,},
				result_adder = {"90级蓝挂坠",5800,"90级紫挂坠",3200,"90级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "90级打造套装物", Rand = 1000},{ItemKey = "90级打造套装法" , Rand = 1000} , {ItemKey = "90级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["95级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"鞋子书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"95级绿靴子",5800,"95级蓝靴子",3200,"95级紫靴子",1000,},
				result_adder = {"95级蓝靴子",5800,"95级紫靴子",3200,"95级橙靴子",1000,},
				SuitRadom = { {ItemKey = "95级打造套装物", Rand = 1000},{ItemKey = "95级打造套装法" , Rand = 1000} , {ItemKey = "95级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"护腕书90",1, "缝纫符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"95级绿护腕",5800,"95级蓝护腕",3200,"95级紫护腕",1000,},
				result_adder = {"95级蓝护腕",5800,"95级紫护腕",3200,"95级橙护腕",1000,},
				SuitRadom = { {ItemKey = "95级打造套装物", Rand = 1000},{ItemKey = "95级打造套装法" , Rand = 1000} , {ItemKey = "95级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"戒指书90",1, "炼金符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"95级绿戒指",5800,"95级蓝戒指",3200,"95级紫戒指",1000,},
				result_adder = {"95级蓝戒指",5800,"95级紫戒指",3200,"95级橙戒指",1000,},
				SuitRadom = { {ItemKey = "95级打造套装物", Rand = 1000},{ItemKey = "95级打造套装法" , Rand = 1000} , {ItemKey = "95级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 250000},
				vitality = 10,
				formula_basic = {"项链书90",1, "炼金符",1, "百炼精铁90",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"95级绿项链",5800,"95级蓝项链",3200,"95级紫项链",1000,},
				result_adder = {"95级蓝项链",5800,"95级紫项链",3200,"95级橙项链",1000,},
				SuitRadom = { {ItemKey = "95级打造套装物", Rand = 1000},{ItemKey = "95级打造套装法" , Rand = 1000} , {ItemKey = "95级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["100级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书100",1, "打造符",1, "百炼精铁100",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"100级绿重剑",5800,"100级蓝重剑",3200,"100级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"100级蓝重剑",5800,"100级紫重剑",3200,"100级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"扇子书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿扇子",5800,"100级蓝扇子",3200,"100级紫扇子",1000,},
				result_adder = {"100级蓝扇子",5800,"100级紫扇子",3200,"100级橙扇子",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"笛子书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿笛子",5800,"100级蓝笛子",3200,"100级紫笛子",1000,},
				result_adder = {"100级蓝笛子",5800,"100级紫笛子",3200,"100级橙笛子",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"阔刀书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿阔刀",5800,"100级蓝阔刀",3200,"100级紫阔刀",1000,},
				result_adder = {"100级蓝阔刀",5800,"100级紫阔刀",3200,"100级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"毛笔书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿毛笔",5800,"100级蓝毛笔",3200,"100级紫毛笔",1000,},
				result_adder = {"100级蓝毛笔",5800,"100级紫毛笔",3200,"100级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"长枪书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿长枪",5800,"100级蓝长枪",3200,"100级紫长枪",1000,},
				result_adder = {"100级蓝长枪",5800,"100级紫长枪",3200,"100级橙长枪",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"爪刺书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿爪刺",5800,"100级蓝爪刺",3200,"100级紫爪刺",1000,},
				result_adder = {"100级蓝爪刺",5800,"100级紫爪刺",3200,"100级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"绣伞书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿绣伞",5800,"100级蓝绣伞",3200,"100级紫绣伞",1000,},
				result_adder = {"100级蓝绣伞",5800,"100级紫绣伞",3200,"100级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"短杖书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿短杖",5800,"100级蓝短杖",3200,"100级紫短杖",1000,},
				result_adder = {"100级蓝短杖",5800,"100级紫短杖",3200,"100级橙短杖",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"弓箭书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿弓箭",5800,"100级蓝弓箭",3200,"100级紫弓箭",1000,},
				result_adder = {"100级蓝弓箭",5800,"100级紫弓箭",3200,"100级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"双剑书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿双剑",5800,"100级蓝双剑",3200,"100级紫双剑",1000,},
				result_adder = {"100级蓝双剑",5800,"100级紫双剑",3200,"100级橙双剑",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"长鞭书100",1, "打造符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿长鞭",5800,"100级蓝长鞭",3200,"100级紫长鞭",1000,},
				result_adder = {"100级蓝长鞭",5800,"100级紫长鞭",3200,"100级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"男帽书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿男头盔",5800,"100级蓝男头盔",3200,"100级紫男头盔",1000,},
				result_adder = {"100级蓝男头盔",5800,"100级紫男头盔",3200,"100级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"女帽书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿女头盔",5800,"100级蓝女头盔",3200,"100级紫女头盔",1000,},
				result_adder = {"100级蓝女头盔",5800,"100级紫女头盔",3200,"100级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"男衣书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿男护甲",5800,"100级蓝男护甲",3200,"100级紫男护甲",1000,},
				result_adder = {"100级蓝男护甲",5800,"100级紫男护甲",3200,"100级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"女衣书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿女护甲",5800,"100级蓝女护甲",3200,"100级紫女护甲",1000,},
				result_adder = {"100级蓝女护甲",5800,"100级紫女护甲",3200,"100级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"腰带书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿护腰",5800,"100级蓝护腰",3200,"100级紫护腰",1000,},
				result_adder = {"100级蓝护腰",5800,"100级紫护腰",3200,"100级橙护腰",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"挂坠书100",1, "炼金符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"100级绿挂坠",5800,"100级蓝挂坠",3200,"100级紫挂坠",1000,},
				result_adder = {"100级蓝挂坠",5800,"100级紫挂坠",3200,"100级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "100级打造套装物", Rand = 1000},{ItemKey = "100级打造套装法" , Rand = 1000} , {ItemKey = "100级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["105级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"鞋子书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"105级绿靴子",5800,"105级蓝靴子",3200,"105级紫靴子",1000,},
				result_adder = {"105级蓝靴子",5800,"105级紫靴子",3200,"105级橙靴子",1000,},
				SuitRadom = { {ItemKey = "105级打造套装物", Rand = 1000},{ItemKey = "105级打造套装法" , Rand = 1000} , {ItemKey = "105级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"护腕书100",1, "缝纫符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"105级绿护腕",5800,"105级蓝护腕",3200,"105级紫护腕",1000,},
				result_adder = {"105级蓝护腕",5800,"105级紫护腕",3200,"105级橙护腕",1000,},
				SuitRadom = { {ItemKey = "105级打造套装物", Rand = 1000},{ItemKey = "105级打造套装法" , Rand = 1000} , {ItemKey = "105级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"戒指书100",1, "炼金符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"105级绿戒指",5800,"105级蓝戒指",3200,"105级紫戒指",1000,},
				result_adder = {"105级蓝戒指",5800,"105级紫戒指",3200,"105级橙戒指",1000,},
				SuitRadom = { {ItemKey = "105级打造套装物", Rand = 1000},{ItemKey = "105级打造套装法" , Rand = 1000} , {ItemKey = "105级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 400000},
				vitality = 10,
				formula_basic = {"项链书100",1, "炼金符",1, "百炼精铁100",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"105级绿项链",5800,"105级蓝项链",3200,"105级紫项链",1000,},
				result_adder = {"105级蓝项链",5800,"105级紫项链",3200,"105级橙项链",1000,},
				SuitRadom = { {ItemKey = "105级打造套装物", Rand = 1000},{ItemKey = "105级打造套装法" , Rand = 1000} , {ItemKey = "105级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["110级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书110",1, "打造符",1, "百炼精铁110",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"110级绿重剑",5800,"110级蓝重剑",3200,"110级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"110级蓝重剑",5800,"110级紫重剑",3200,"110级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"扇子书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿扇子",5800,"110级蓝扇子",3200,"110级紫扇子",1000,},
				result_adder = {"110级蓝扇子",5800,"110级紫扇子",3200,"110级橙扇子",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"笛子书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿笛子",5800,"110级蓝笛子",3200,"110级紫笛子",1000,},
				result_adder = {"110级蓝笛子",5800,"110级紫笛子",3200,"110级橙笛子",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"阔刀书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿阔刀",5800,"110级蓝阔刀",3200,"110级紫阔刀",1000,},
				result_adder = {"110级蓝阔刀",5800,"110级紫阔刀",3200,"110级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"毛笔书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿毛笔",5800,"110级蓝毛笔",3200,"110级紫毛笔",1000,},
				result_adder = {"110级蓝毛笔",5800,"110级紫毛笔",3200,"110级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"长枪书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿长枪",5800,"110级蓝长枪",3200,"110级紫长枪",1000,},
				result_adder = {"110级蓝长枪",5800,"110级紫长枪",3200,"110级橙长枪",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"爪刺书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿爪刺",5800,"110级蓝爪刺",3200,"110级紫爪刺",1000,},
				result_adder = {"110级蓝爪刺",5800,"110级紫爪刺",3200,"110级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"绣伞书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿绣伞",5800,"110级蓝绣伞",3200,"110级紫绣伞",1000,},
				result_adder = {"110级蓝绣伞",5800,"110级紫绣伞",3200,"110级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"短杖书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿短杖",5800,"110级蓝短杖",3200,"110级紫短杖",1000,},
				result_adder = {"110级蓝短杖",5800,"110级紫短杖",3200,"110级橙短杖",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"弓箭书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿弓箭",5800,"110级蓝弓箭",3200,"110级紫弓箭",1000,},
				result_adder = {"110级蓝弓箭",5800,"110级紫弓箭",3200,"110级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"双剑书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿双剑",5800,"110级蓝双剑",3200,"110级紫双剑",1000,},
				result_adder = {"110级蓝双剑",5800,"110级紫双剑",3200,"110级橙双剑",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"长鞭书110",1, "打造符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿长鞭",5800,"110级蓝长鞭",3200,"110级紫长鞭",1000,},
				result_adder = {"110级蓝长鞭",5800,"110级紫长鞭",3200,"110级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"男帽书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿男头盔",5800,"110级蓝男头盔",3200,"110级紫男头盔",1000,},
				result_adder = {"110级蓝男头盔",5800,"110级紫男头盔",3200,"110级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"女帽书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿女头盔",5800,"110级蓝女头盔",3200,"110级紫女头盔",1000,},
				result_adder = {"110级蓝女头盔",5800,"110级紫女头盔",3200,"110级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"男衣书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿男护甲",5800,"110级蓝男护甲",3200,"110级紫男护甲",1000,},
				result_adder = {"110级蓝男护甲",5800,"110级紫男护甲",3200,"110级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"女衣书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿女护甲",5800,"110级蓝女护甲",3200,"110级紫女护甲",1000,},
				result_adder = {"110级蓝女护甲",5800,"110级紫女护甲",3200,"110级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"腰带书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿护腰",5800,"110级蓝护腰",3200,"110级紫护腰",1000,},
				result_adder = {"110级蓝护腰",5800,"110级紫护腰",3200,"110级橙护腰",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"挂坠书110",1, "炼金符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"110级绿挂坠",5800,"110级蓝挂坠",3200,"110级紫挂坠",1000,},
				result_adder = {"110级蓝挂坠",5800,"110级紫挂坠",3200,"110级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "110级打造套装物", Rand = 1000},{ItemKey = "110级打造套装法" , Rand = 1000} , {ItemKey = "110级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["115级"] = {
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"鞋子书110",1, "缝纫符",1, "百炼精铁110",1},
				formula_adder = {"强化打造石1",1},
				result_basic = {"115级绿靴子",5800,"115级蓝靴子",3200,"115级紫靴子",1000,},
				result_adder = {"115级蓝靴子",5800,"115级紫靴子",3200,"115级橙靴子",1000,},
				SuitRadom = { {ItemKey = "115级打造套装物", Rand = 1000},{ItemKey = "115级打造套装法" , Rand = 1000} , {ItemKey = "115级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"护腕书110",1, "缝纫符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"115级绿护腕",5800,"115级蓝护腕",3200,"115级紫护腕",1000,},
				result_adder = {"115级蓝护腕",5800,"115级紫护腕",3200,"115级橙护腕",1000,},
				SuitRadom = { {ItemKey = "115级打造套装物", Rand = 1000},{ItemKey = "115级打造套装法" , Rand = 1000} , {ItemKey = "115级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"戒指书110",1, "炼金符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"115级绿戒指",5800,"115级蓝戒指",3200,"115级紫戒指",1000,},
				result_adder = {"115级蓝戒指",5800,"115级紫戒指",3200,"115级橙戒指",1000,},
				SuitRadom = { {ItemKey = "115级打造套装物", Rand = 1000},{ItemKey = "115级打造套装法" , Rand = 1000} , {ItemKey = "115级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 600000},
				vitality = 10,
				formula_basic = {"项链书110",1, "炼金符",1, "百炼精铁110",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"115级绿项链",5800,"115级蓝项链",3200,"115级紫项链",1000,},
				result_adder = {"115级蓝项链",5800,"115级紫项链",3200,"115级橙项链",1000,},
				SuitRadom = { {ItemKey = "115级打造套装物", Rand = 1000},{ItemKey = "115级打造套装法" , Rand = 1000} , {ItemKey = "115级打造套装封" , Rand = 1000}},--套装效果
			},
		},
	["120级"] = {
			{
				condition = {Role = {31,35}},--5
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10, --花费活力
				formula_basic = {"重剑书120",1, "打造符",1, "百炼精铁120",1}, --普通打造材料
				formula_adder = {"强化打造石1",1},--强化打造材料
				result_basic = {"120级绿重剑",5800,"120级蓝重剑",3200,"120级紫重剑",1000,},--普通打造装备和几率
				result_adder = {"120级蓝重剑",5800,"120级紫重剑",3200,"120级橙重剑",1000,},--强化打造装备和几率
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"扇子书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿扇子",5800,"120级蓝扇子",3200,"120级紫扇子",1000,},
				result_adder = {"120级蓝扇子",5800,"120级紫扇子",3200,"120级橙扇子",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,34}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"笛子书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿笛子",5800,"120级蓝笛子",3200,"120级紫笛子",1000,},
				result_adder = {"120级蓝笛子",5800,"120级紫笛子",3200,"120级橙笛子",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {31,37}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"阔刀书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿阔刀",5800,"120级蓝阔刀",3200,"120级紫阔刀",1000,},
				result_adder = {"120级蓝阔刀",5800,"120级紫阔刀",3200,"120级橙阔刀",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {33,36}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"毛笔书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿毛笔",5800,"120级蓝毛笔",3200,"120级紫毛笔",1000,},
				result_adder = {"120级蓝毛笔",5800,"120级紫毛笔",3200,"120级橙毛笔",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {37,38}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"长枪书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿长枪",5800,"120级蓝长枪",3200,"120级紫长枪",1000,},
				result_adder = {"120级蓝长枪",5800,"120级紫长枪",3200,"120级橙长枪",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {35,39}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"爪刺书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿爪刺",5800,"120级蓝爪刺",3200,"120级紫爪刺",1000,},
				result_adder = {"120级蓝爪刺",5800,"120级紫爪刺",3200,"120级橙爪刺",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,42}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"绣伞书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿绣伞",5800,"120级蓝绣伞",3200,"120级紫绣伞",1000,},
				result_adder = {"120级蓝绣伞",5800,"120级紫绣伞",3200,"120级橙绣伞",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {34,41}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"短杖书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿短杖",5800,"120级蓝短杖",3200,"120级紫短杖",1000,},
				result_adder = {"120级蓝短杖",5800,"120级紫短杖",3200,"120级橙短杖",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {32,42}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"弓箭书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿弓箭",5800,"120级蓝弓箭",3200,"120级紫弓箭",1000,},
				result_adder = {"120级蓝弓箭",5800,"120级紫弓箭",3200,"120级橙弓箭",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {38,39}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"双剑书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿双剑",5800,"120级蓝双剑",3200,"120级紫双剑",1000,},
				result_adder = {"120级蓝双剑",5800,"120级紫双剑",3200,"120级橙双剑",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = {40,41}},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"长鞭书120",1, "打造符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿长鞭",5800,"120级蓝长鞭",3200,"120级紫长鞭",1000,},
				result_adder = {"120级蓝长鞭",5800,"120级紫长鞭",3200,"120级橙长鞭",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"男帽书120",1, "缝纫符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿男头盔",5800,"120级蓝男头盔",3200,"120级紫男头盔",1000,},
				result_adder = {"120级蓝男头盔",5800,"120级紫男头盔",3200,"120级橙男头盔",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"女帽书120",1, "缝纫符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿女头盔",5800,"120级蓝女头盔",3200,"120级紫女头盔",1000,},
				result_adder = {"120级蓝女头盔",5800,"120级紫女头盔",3200,"120级橙女头盔",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 1},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"男衣书120",1, "缝纫符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿男护甲",5800,"120级蓝男护甲",3200,"120级紫男护甲",1000,},
				result_adder = {"120级蓝男护甲",5800,"120级紫男护甲",3200,"120级橙男护甲",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Sex = 2},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"女衣书120",1, "缝纫符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿女护甲",5800,"120级蓝女护甲",3200,"120级紫女护甲",1000,},
				result_adder = {"120级蓝女护甲",5800,"120级紫女护甲",3200,"120级橙女护甲",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"腰带书120",1, "缝纫符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿护腰",5800,"120级蓝护腰",3200,"120级紫护腰",1000,},
				result_adder = {"120级蓝护腰",5800,"120级紫护腰",3200,"120级橙护腰",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
			{
				condition = {Role = 0},
				consume = {MoneyType = 5 , MoneyVal = 1000000},
				vitality = 10,
				formula_basic = {"挂坠书120",1, "炼金符",1, "百炼精铁120",1}, 
				formula_adder = {"强化打造石1",1},
				result_basic = {"120级绿挂坠",5800,"120级蓝挂坠",3200,"120级紫挂坠",1000,},
				result_adder = {"120级蓝挂坠",5800,"120级紫挂坠",3200,"120级橙挂坠",1000,},
				SuitRadom = { {ItemKey = "120级打造套装物", Rand = 1000},{ItemKey = "120级打造套装法" , Rand = 1000} , {ItemKey = "120级打造套装封" , Rand = 1000}},--套装效果
			},
		},
}

