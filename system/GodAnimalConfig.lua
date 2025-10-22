--神兽图鉴配置
GodAnimalConfig = {}

--GodAnimalConfig.SystemTips = "异兽录：通过收集不同异兽信物激活人物属性及被动技能"

--品阶系数
GodAnimalConfig.Grade = {
	["Grade_2"] = {["ItemNumPara_1"] = 1, ["ItemNumPara_2"] = 2, ["ItemNumPara_3"] = 4, ["ItemNumPara_4"] = 8, ["ItemNumPara_5"] = 16, ["ItemNumPara_6"] = 32,  ["AttrPara_1"] = 1, ["AttrPara_2"] = 1.5, ["AttrPara_3"] = 2.5, ["AttrPara_4"] = 4, ["AttrPara_5"] = 6, ["AttrPara_6"] = 10,},
	["Grade_3"] = {["ItemNumPara_1"] = 1, ["ItemNumPara_2"] = 2, ["ItemNumPara_3"] = 4, ["ItemNumPara_4"] = 8, ["ItemNumPara_5"] = 16, ["ItemNumPara_6"] = 32,  ["AttrPara_1"] = 1, ["AttrPara_2"] = 1.5, ["AttrPara_3"] = 2.5, ["AttrPara_4"] = 4, ["AttrPara_5"] = 6, ["AttrPara_6"] = 10,},
	["Grade_4"] = {["ItemNumPara_1"] = 1, ["ItemNumPara_2"] = 2, ["ItemNumPara_3"] = 4, ["ItemNumPara_4"] = 8, ["ItemNumPara_5"] = 16, ["ItemNumPara_6"] = 32,  ["AttrPara_1"] = 1, ["AttrPara_2"] = 1.5, ["AttrPara_3"] = 2.5, ["AttrPara_4"] = 4, ["AttrPara_5"] = 6, ["AttrPara_6"] = 10,},
	["Grade_5"] = {["ItemNumPara_1"] = 1, ["ItemNumPara_2"] = 2, ["ItemNumPara_3"] = 4, ["ItemNumPara_4"] = 8, ["ItemNumPara_5"] = 16, ["ItemNumPara_6"] = 32,  ["AttrPara_1"] = 1, ["AttrPara_2"] = 1.5, ["AttrPara_3"] = 2.5, ["AttrPara_4"] = 4, ["AttrPara_5"] = 6, ["AttrPara_6"] = 10,},
}

GodAnimalConfig.MainList = {
    ["神兽憨脑虎"]= {["Index"] =1, ["Grade"] =4, ["Icon"] =1900359900, ["Model"] =5990, ["UpItem"] ="橙色神兽碎片1", ["Tips"] ="头双蓝，二双红，三双紫落成。", ["UpItemNum"] =10, ["AttrName_1"] ="抵抗所有伤害万分比", ["AttrVal_1"] =100,  ["AttrName_2"] ="血量上限", ["AttrVal_2"] =5,  ["AddSkill_1"] = "加血上限1", ["AddSkill_2"] = "加血上限1", ["AddSkill_3"] = "加血上限1", ["AddSkill_4"] = "加血上限1", ["AddSkill_5"] = "加血上限1", ["AddSkill_6"] = "加血上限1",},
    ["神兽春阳马"]= {["Index"] =2, ["Grade"] =4, ["Icon"] =1900359940, ["Model"] =5994, ["UpItem"] ="橙色神兽碎片2", ["Tips"] ="可以对敌人造成恐怖的精神污染。", ["UpItemNum"] =10, ["AttrName_1"] ="造成所有伤害万分比", ["AttrVal_1"] =100,  ["AttrName_2"] ="物攻", ["AttrVal_2"] =2,  ["AddSkill_1"] = "加血上限1", ["AddSkill_2"] = "加血上限1", ["AddSkill_3"] = "加血上限1", ["AddSkill_4"] = "加血上限1", ["AddSkill_5"] = "加血上限1", ["AddSkill_6"] = "加血上限1",},
    ["神兽百灵羊"]= {["Index"] =3, ["Grade"] =4, ["Icon"] =1900359950, ["Model"] =05995, ["UpItem"] ="橙色神兽碎片3", ["Tips"] ="羊中泰斗，喜欢假装可爱来伪装自己的实力。", ["UpItemNum"] =10, ["AttrName_1"] ="法术暴击", ["AttrVal_1"] =100,  ["AttrName_2"] ="物理狂暴率", ["AttrVal_2"] =100,  ["AddSkill_1"] = "加血上限1", ["AddSkill_2"] = "加血上限1", ["AddSkill_3"] = "加血上限1", ["AddSkill_4"] = "加血上限1", ["AddSkill_5"] = "加血上限1", ["AddSkill_6"] = "加血上限1",},
    ["神兽福气牛"]= {["Index"] =4, ["Grade"] =4, ["Icon"] =1900359890, ["Model"] =05989, ["UpItem"] ="橙色神兽碎片4", ["Tips"] ="勇猛和运气兼具的福牛，且因来自于潮汕，更具传奇色彩。因为：没有一头牛能活着走出潮汕。", ["UpItemNum"] =10, ["AttrName_1"] ="每回合恢复血量", ["AttrVal_1"] =10,  ["AttrName_2"] ="血量上限", ["AttrVal_2"] =5,  ["AddSkill_1"] = "加血上限1", ["AddSkill_2"] = "加血上限1", ["AddSkill_3"] = "加血上限1", ["AddSkill_4"] = "加血上限1", ["AddSkill_5"] = "加血上限1", ["AddSkill_6"] = "加血上限1",},
    ["碧浪公主"]= {["Index"] =5, ["Grade"] =3, ["Icon"] =1900351630, ["Model"] =5163, ["UpItem"] ="紫色神兽碎片1", ["Tips"] ="人鱼族第一美女，万圣龙王的女儿，长的花容月貌。", ["UpItemNum"] =10, ["AttrName_1"] ="反震率", ["AttrVal_1"] =100,  ["AttrName_2"] ="反震伤害比分比", ["AttrVal_2"] =100,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["丹熏鼠"]= {["Index"] =6, ["Grade"] =3, ["Icon"] =1900352500, ["Model"] =5250, ["UpItem"] ="紫色神兽碎片2", ["Tips"] ="其状如鼠，而菟首麋身，其音如獋犬，以其尾飞，行动迅捷。", ["UpItemNum"] =10, ["AttrName_1"] ="反击概率", ["AttrVal_1"] =100,  ["AttrName_2"] ="物攻", ["AttrVal_2"] =1,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["火纹麟"]= {["Index"] =7, ["Grade"] =3, ["Icon"] =1900352490, ["Model"] =5249, ["UpItem"] ="紫色神兽碎片3", ["Tips"] ="上古麒麟异种，其磷甲刀枪不入，且身体自带烈火符文，能散发极高温的火焰。", ["UpItemNum"] =10, ["AttrName_1"] ="连击概率", ["AttrVal_1"] =100,  ["AttrName_2"] ="物攻", ["AttrVal_2"] =1,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["三生蝶"]= {["Index"] =8, ["Grade"] =3, ["Icon"] =1900352530, ["Model"] =5253, ["UpItem"] ="紫色神兽碎片4", ["Tips"] ="三生蝶化南华梦，世事沉浮一场空。", ["UpItemNum"] =10, ["AttrName_1"] ="物理分裂概率", ["AttrVal_1"] =100,  ["AttrName_2"] ="物攻", ["AttrVal_2"] =1,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["无极熊猫"]= {["Index"] =9, ["Grade"] =3, ["Icon"] =1900352540, ["Model"] =5254, ["UpItem"] ="紫色神兽碎片5", ["Tips"] ="阴阳无极，无穷无尽，擅长快速连击术。", ["UpItemNum"] =10, ["AttrName_1"] ="灵性", ["AttrVal_1"] =1,  ["AttrName_2"] ="血量上限", ["AttrVal_2"] =2,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["白泽"]= {["Index"] =10, ["Grade"] =3, ["Icon"] =1900352620, ["Model"] =5262, ["UpItem"] ="紫色神兽碎片6", ["Tips"] ="上古神兽，通万物之情，是可使人逢凶化吉的吉祥之兽。", ["UpItemNum"] =10, ["AttrName_1"] ="力量", ["AttrVal_1"] =1,  ["AttrName_2"] ="血量上限", ["AttrVal_2"] =2,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["至尊宝"]= {["Index"] =11, ["Grade"] =3, ["Icon"] =1900352660, ["Model"] =5266, ["UpItem"] ="紫色神兽碎片7", ["Tips"] ="曾经有一份真挚的爱情摆在我的面前…", ["UpItemNum"] =10, ["AttrName_1"] ="根骨", ["AttrVal_1"] =1,  ["AttrName_2"] ="血量上限", ["AttrVal_2"] =2,  ["AddSkill_1"] = "加血上限2", ["AddSkill_2"] = "加血上限2", ["AddSkill_3"] = "加血上限2", ["AddSkill_4"] = "加血上限2", ["AddSkill_5"] = "加血上限2", ["AddSkill_6"] = "加血上限2",},
    ["迦楼纳什"]= {["Index"] =12, ["Grade"] =2, ["Icon"] =1900353180, ["Model"] =05318, ["UpItem"] ="蓝色神兽碎片1", ["Tips"] ="六魔将之一——迦楼纳什在此。", ["UpItemNum"] =10, ["AttrName_1"] ="血量上限", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["邪毅将军"]= {["Index"] =13, ["Grade"] =2, ["Icon"] =1900353040, ["Model"] =05304, ["UpItem"] ="蓝色神兽碎片2", ["Tips"] ="六魔将之一——邪毅将军在此。", ["UpItemNum"] =10, ["AttrName_1"] ="物防", ["AttrVal_1"] =4,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["冥焰火凤"]= {["Index"] =14, ["Grade"] =2, ["Icon"] =1900352920, ["Model"] =05292, ["UpItem"] ="蓝色神兽碎片3", ["Tips"] ="六魔将之一——冥焰火凤在此。", ["UpItemNum"] =10, ["AttrName_1"] ="战斗速度", ["AttrVal_1"] =2,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["熔火石灵"]= {["Index"] =15, ["Grade"] =2, ["Icon"] =1900353070, ["Model"] =05307, ["UpItem"] ="蓝色神兽碎片4", ["Tips"] ="六魔将之一——熔火石灵在此。", ["UpItemNum"] =10, ["AttrName_1"] ="抗物攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["器灵"]= {["Index"] =16, ["Grade"] =2, ["Icon"] =1900353030, ["Model"] =05303, ["UpItem"] ="蓝色神兽碎片5", ["Tips"] ="不知道是何种物品生出了灵智，成为修道之人追捧的物件。", ["UpItemNum"] =10, ["AttrName_1"] ="抗风攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["怨灵鬼"]= {["Index"] =17, ["Grade"] =2, ["Icon"] =1900353000, ["Model"] =05300, ["UpItem"] ="蓝色神兽碎片6", ["Tips"] ="怨气冲天的恶鬼，十分不好驾驭。", ["UpItemNum"] =10, ["AttrName_1"] ="抗火攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["千年树灵"]= {["Index"] =18, ["Grade"] =2, ["Icon"] =1900352970, ["Model"] =05297, ["UpItem"] ="蓝色神兽碎片7", ["Tips"] ="得到千年的树灵，守卫着这一方林木。", ["UpItemNum"] =10, ["AttrName_1"] ="抗雷攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["素尾白狐"]= {["Index"] =19, ["Grade"] =2, ["Icon"] =1900351300, ["Model"] =05130, ["UpItem"] ="蓝色神兽碎片8", ["Tips"] ="九尾后裔，毛皮洁白如雪，无半根杂毛。", ["UpItemNum"] =10, ["AttrName_1"] ="抗水攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["冰魄剑灵"]= {["Index"] =20, ["Grade"] =2, ["Icon"] =1900351370, ["Model"] =05137, ["UpItem"] ="蓝色神兽碎片9", ["Tips"] ="玄阴池的寒气和剑仙剑气融合所化的精怪，受了共工神力的影响。", ["UpItemNum"] =10, ["AttrName_1"] ="抗鬼火攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["踏火神犀"]= {["Index"] =21, ["Grade"] =2, ["Icon"] =1900351400, ["Model"] =05140, ["UpItem"] ="蓝色神兽碎片10", ["Tips"] ="刚刚逃出火场的大犀牛，被人当成神一样供养。", ["UpItemNum"] =10, ["AttrName_1"] ="抗吸血攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["水帘妖"]= {["Index"] =22, ["Grade"] =2, ["Icon"] =1900351380, ["Model"] =05138, ["UpItem"] ="蓝色神兽碎片11", ["Tips"] ="水帘洞出身的小妖，是妖界中的名门望族。", ["UpItemNum"] =10, ["AttrName_1"] ="抗震摄攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["洞花妖"]= {["Index"] =23, ["Grade"] =2, ["Icon"] =1900351120, ["Model"] =05112, ["UpItem"] ="蓝色神兽碎片12", ["Tips"] ="普普通通的花妖，因为住在洞里，自姓为洞。", ["UpItemNum"] =10, ["AttrName_1"] ="物攻", ["AttrVal_1"] =4,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["玄阴蝎"]= {["Index"] =24, ["Grade"] =2, ["Icon"] =1900351340, ["Model"] =05134, ["UpItem"] ="蓝色神兽碎片13", ["Tips"] ="玄阴池的寒气所化的蝎子精怪，受了共工神力的影响。", ["UpItemNum"] =10, ["AttrName_1"] ="命中", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["玄阴霜豹"]= {["Index"] =25, ["Grade"] =2, ["Icon"] =1900351360, ["Model"] =05136, ["UpItem"] ="蓝色神兽碎片14", ["Tips"] ="来自极北之地的雪豹亚种，被称为霜豹的猛兽。", ["UpItemNum"] =10, ["AttrName_1"] ="闪避", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["赤炎狼"]= {["Index"] =26, ["Grade"] =1, ["Icon"] =1900351250, ["Model"] =05125, ["UpItem"] ="绿色神兽碎片1", ["Tips"] ="赤色火焰熊熊燃烧，把狼烫得嗷嗷叫。", ["UpItemNum"] =10, ["AttrName_1"] ="血量上限", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["土灵熊"]= {["Index"] =27, ["Grade"] =1, ["Icon"] =1900351260, ["Model"] =05126, ["UpItem"] ="绿色神兽碎片2", ["Tips"] ="冬眠苏醒的大熊，钻出洞穴的时候简直就是大地之灵。", ["UpItemNum"] =10, ["AttrName_1"] ="物防", ["AttrVal_1"] =4,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["裂天兕"]= {["Index"] =28, ["Grade"] =1, ["Icon"] =1900351150, ["Model"] =05115, ["UpItem"] ="绿色神兽碎片3", ["Tips"] ="声音巨大的犀牛，叫声震耳欲聋。", ["UpItemNum"] =10, ["AttrName_1"] ="战斗速度", ["AttrVal_1"] =2,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["剧毒蜘蛛"]= {["Index"] =29, ["Grade"] =1, ["Icon"] =1900351530, ["Model"] =05153, ["UpItem"] ="绿色神兽碎片4", ["Tips"] ="布满毒牙的狰狞蜘蛛，一不小心咬破嘴巴，自己都害怕。", ["UpItemNum"] =10, ["AttrName_1"] ="抗物攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["魅音狐"]= {["Index"] =30, ["Grade"] =1, ["Icon"] =1900351160, ["Model"] =05116, ["UpItem"] ="绿色神兽碎片5", ["Tips"] ="狐狸一族的摇滚歌手，人类因为听不懂，将其称为魅音狐。", ["UpItemNum"] =10, ["AttrName_1"] ="抗风攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["瑞兽幼崽"]= {["Index"] =31, ["Grade"] =1, ["Icon"] =1900351550, ["Model"] =05155, ["UpItem"] ="绿色神兽碎片6", ["Tips"] ="号称福气之兽的幼崽，其实根本没人能作证。", ["UpItemNum"] =10, ["AttrName_1"] ="抗火攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["水判官"]= {["Index"] =32, ["Grade"] =1, ["Icon"] =1900351070, ["Model"] =05107, ["UpItem"] ="绿色神兽碎片7", ["Tips"] ="水族判官，据说是花十万白银买来的大官。", ["UpItemNum"] =10, ["AttrName_1"] ="抗雷攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["青冥灯"]= {["Index"] =33, ["Grade"] =1, ["Icon"] =1900351460, ["Model"] =05146, ["UpItem"] ="绿色神兽碎片8", ["Tips"] ="能够在天空中自由飞荡的灯笼，传说是冥界之物，让人不寒而栗。", ["UpItemNum"] =10, ["AttrName_1"] ="抗水攻固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["灵木怪"]= {["Index"] =34, ["Grade"] =1, ["Icon"] =1900351620, ["Model"] =05162, ["UpItem"] ="绿色神兽碎片9", ["Tips"] ="百年大树生了灵智，必将是建房造屋的好木材。", ["UpItemNum"] =10, ["AttrName_1"] ="抗鬼火攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["幻灵鹿"]= {["Index"] =35, ["Grade"] =1, ["Icon"] =1900351310, ["Model"] =05131, ["UpItem"] ="绿色神兽碎片10", ["Tips"] ="在野外狂奔的小鹿，因为速度极快，仿佛产生了幻影一般。", ["UpItemNum"] =10, ["AttrName_1"] ="抗吸血攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["浣灵熊"]= {["Index"] =36, ["Grade"] =1, ["Icon"] =1900351220, ["Model"] =05122, ["UpItem"] ="绿色神兽碎片11", ["Tips"] ="看似可爱的小东西，实际上是小动物们的天敌。", ["UpItemNum"] =10, ["AttrName_1"] ="抗震摄攻击固定值", ["AttrVal_1"] =20,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["小虎妖"]= {["Index"] =37, ["Grade"] =1, ["Icon"] =1900351180, ["Model"] =05118, ["UpItem"] ="绿色神兽碎片12", ["Tips"] ="笑傲山林的万兽之王，只不过才只有几个月大而已，假以时日，或将成为下一位虎力大仙。", ["UpItemNum"] =10, ["AttrName_1"] ="物攻", ["AttrVal_1"] =4,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["旋龟"]= {["Index"] =38, ["Grade"] =1, ["Icon"] =1900351110, ["Model"] =05111, ["UpItem"] ="绿色神兽碎片13", ["Tips"] ="《山海经》中所记载的鸟嘴蛇尾的古代生物，如今叫做鹰嘴龟。", ["UpItemNum"] =10, ["AttrName_1"] ="命中", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},
    ["岩穴鳄"]= {["Index"] =39, ["Grade"] =1, ["Icon"] =1900351610, ["Model"] =05161, ["UpItem"] ="绿色神兽碎片14", ["Tips"] ="挖岩而居的鳄鱼，生性懒惰，每日张大嘴巴吓走附近的小鱼小鹿。", ["UpItemNum"] =10, ["AttrName_1"] ="闪避", ["AttrVal_1"] =10,  ["AttrName_2"] = "", ["AttrVal_2"] =0,  ["AddSkill_1"] = "", ["AddSkill_2"] = "", ["AddSkill_3"] = "", ["AddSkill_4"] = "", ["AddSkill_5"] = "", ["AddSkill_6"] = "",},

}

function GodAnimalConfig.Initialization()
	if not GodAnimalConfig.MainList or not GodAnimalConfig.Grade then
		sLuaApp:LuaErr("GodAnimalConfig配置缺少MainList/Grade")
		return
	end
	GodAnimalConfig.Main = {}
	GodAnimalConfig.UseItem = {}
	for k,v in pairs(GodAnimalConfig.MainList) do
		GodAnimalConfig.Main[k] = {}
		GodAnimalConfig.Main[k]["Index"] = v["Index"]
		GodAnimalConfig.Main[k]["Grade"] = v["Grade"] + 1
		GodAnimalConfig.Main[k]["Icon"] = v["Icon"]
		GodAnimalConfig.Main[k]["Model"] = v["Model"]
		GodAnimalConfig.Main[k]["UpItem"] = v["UpItem"]
		GodAnimalConfig.Main[k]["Tips"] = v["Tips"]
		
		local up_item = v["UpItem"]
		if not up_item then
			sLuaApp:LuaErr("GodAnimalConfig.MainList UpItem 配置错误")
			return
		end
		GodAnimalConfig.UseItem[up_item] = {}
		GodAnimalConfig.UseItem[up_item]["AnimalName"] = k
		GodAnimalConfig.UseItem[up_item]["MaxNum"] = 0
		--碎片/信物 点数变量注册
		local item_data = ItemConfig.GetByKeyName(up_item)
		if item_data then
			sCustomVarSystem:SetBroadcastScope(0, "GodAnimalItem_"..item_data.Id, 1)
		else
			sLuaApp:LuaErr("GodAnimalConfig.Initialization 不存在"..up_item)
		end
		
		local grade_list = GodAnimalConfig.Grade["Grade_"..v["Grade"]+1]
		if not grade_list then
			sLuaApp:LuaErr("GodAnimalConfig.Grade缺少配置")
			return
		end
		
		local level = 1
		while grade_list["ItemNumPara_"..level] do
			GodAnimalConfig.Main[k]["Level_"..level] = {}
			GodAnimalConfig.Main[k]["Level_"..level]["Score"] = 0 -- 每一阶的评分
			local up_item_num = math.floor(v["UpItemNum"] * grade_list["ItemNumPara_"..level])
			GodAnimalConfig.Main[k]["Level_"..level]["UpItemNum"] = up_item_num
			GodAnimalConfig.UseItem[up_item]["MaxNum"] = GodAnimalConfig.UseItem[up_item]["MaxNum"] + up_item_num --最大需求物品数量
			
			if not v["AttrName_1"] then
				sLuaApp:LuaErr("GodAnimalConfig.MainList缺少配置AttrName_1")
				return
			end
			GodAnimalConfig.Main[k]["Level_"..level]["AddBuff"] = {}
			local i = 1
			while v["AttrName_"..i] do
				if v["AttrName_"..i] ~= "" and v["AttrName_"..i] ~= 0 and v["AttrVal_"..i] ~="" and v["AttrVal_"..i] ~= 0 then
					local attr_name = v["AttrName_"..i]
					local attr_val = math.floor(v["AttrVal_"..i] * grade_list["AttrPara_"..level])
					if type(attr_name) == "string" and type(attr_val) == "number" and AttrConfig.GetByKeyName(attr_name) then
						table.insert(GodAnimalConfig.Main[k]["Level_"..level]["AddBuff"], {["AttrName"] = attr_name, ["AttrVal"] = attr_val})
						local score = math.floor(AttrConfig.GetByKeyName(attr_name).Score * attr_val / 10000)
						GodAnimalConfig.Main[k]["Level_"..level]["Score"] = GodAnimalConfig.Main[k]["Level_"..level]["Score"] + score
					else
						sLuaApp:LuaErr("GodAnimalConfig.MainList"..k.." AddBuff 配置错误")
						return
					end
				end
				i = i + 1
			end
			if v["AddSkill_"..level] and v["AddSkill_"..level] ~= "" then
				GodAnimalConfig.Main[k]["Level_"..level]["AddSkill"] = v["AddSkill_"..level]
			end
			level = level + 1
		end
		GodAnimalConfig.Main[k]["MaxLevel"] = level - 1
	end
	--sLuaApp:LuaErr("GodAnimalConfig.Main"..Lua_tools.serialize(GodAnimalConfig.Main))
	--sLuaApp:LuaErr("GodAnimalConfig.UseItem"..Lua_tools.serialize(GodAnimalConfig.UseItem))

	sCustomVarSystem:SetBroadcastScope(0, "GodAnimalOverallScore", 1)--总评分变量
	sCustomVarSystem:SetBroadcastScope(0, "GodAnimalAutoLevelUp", 1)--自动升级变量
end
--GodAnimalConfig.Initialization()
----------最终格式 ----------------
-- GodAnimalConfig.Main= {
    -- ["冥焰火凤"]={
		-- ["Index"]=14,
        -- ["Icon"]=1900352920,
		-- ["Model"]=5292,
		-- ["MaxLevel"]=6,
        -- ["UpItem"]="蓝色神兽碎片3",
        -- ["Grade"]=2,
		-- ["Tips"]="六魔将之一——冥焰火凤在此。",
		-- ["Level_1"]={
            -- ["AddBuff"]={
                -- {["AttrName"]="战斗速度",["AttrVal"]=2,},
            -- },
            -- ["Score"]=20,
            -- ["UpItemNum"]=10,
        -- },
		-- ["Level_2"]={
            -- ["AddBuff"]={
				-- {["AttrName"]="战斗速度",["AttrVal"]=3,},
            -- },
            -- ["Score"]=30,
            -- ["UpItemNum"]=20,
        -- },
		-- ["Level_3"]={
            -- ["AddBuff"]={
				-- {["AttrName"]="战斗速度",["AttrVal"]=5,},
            -- },
            -- ["Score"]=50,
            -- ["UpItemNum"]=40,
        -- },
		-- ["Level_4"]={
            -- ["AddBuff"]={
                -- {["AttrName"]="战斗速度",["AttrVal"]=8,},
            -- },
            -- ["Score"]=80,
            -- ["UpItemNum"]=80,
        -- },
		-- ["Level_5"]={
            -- ["AddBuff"]={
                -- {["AttrName"]="战斗速度",["AttrVal"]=12,},
            -- },
            -- ["Score"]=120,
            -- ["UpItemNum"]=160,
        -- },
        -- ["Level_6"]={
            -- ["AddBuff"]={
                -- {["AttrName"]="战斗速度",["AttrVal"]=20,},
            -- },
            -- ["Score"]=200,
            -- ["UpItemNum"]=320,
        -- },
    -- },
-- }
-- GodAnimalConfig.UseItem = {
	-- ["绿色神兽碎片5"]={
		-- ["AnimalName"]="魅音狐",
		-- ["MaxNum"]=630,
	-- },
-- },