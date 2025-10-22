--鸡王争霸赛脚本
Act_Chikings = {}


Act_Chikings.MapID = 299	
--------------------------------------------
-----------------资格赛配置-----------------

Act_Chikings.MatchSec = 90				--创建地图后继续匹配的时间（秒）
Act_Chikings.ReadySec = 9				--匹配完成后锁定玩家的时间（秒）
Act_Chikings.BornSec = 20				--开始游戏后选择出生点的时间（秒）
Act_Chikings.LowerPlayers = 10			--活动最低开启人数（单地图）
Act_Chikings.MaxPlayers = 20			--活动最多开启人数（单地图）
Act_Chikings.JoinNum = 10               --每天最多参加活动次数(无限次数可以去掉本条配置或者填0)

--------------------------------------------
------------------出生地配置----------------
Act_Chikings.BornPoint = {
	['紫宸广场'] = {PosX = 38, PosY = 41, Range = 30},
	['玄武门']   = {PosX = 115, PosY = 76, Range = 30},
	['西长廊']   = {PosX = 29, PosY = 133, Range = 30},
	['东长廊']   = {PosX = 202, PosY = 42, Range = 30},
	['玄武大道'] = {PosX = 231, PosY = 153, Range = 30},
	['比武场']   = {PosX = 149, PosY = 174, Range = 30},
	['北集市']   = {PosX = 319, PosY = 132, Range = 30},
	['考场'] 	 = {PosX = 257, PosY = 108, Range = 30},
	['大明山庄'] = {PosX = 321, PosY = 34, Range = 30},
	['大雁塔']   = {PosX = 421, PosY = 63, Range = 30},
	['东市']     = {PosX = 387, PosY = 92, Range = 30},
	['西市']     = {PosX = 216, PosY = 198, Range = 30},
	['安定府']   = {PosX = 71, PosY = 233, Range = 30},
	['金光门']   = {PosX = 46, PosY = 315, Range = 30},
	['金光大道'] = {PosX = 141, PosY = 271, Range = 30},
	['南集市'] 	 = {PosX = 358, PosY = 183, Range = 30},
	['兴庆宫'] 	 = {PosX = 503, PosY = 87, Range = 30},
	['龙首聚'] 	 = {PosX = 589, PosY = 49, Range = 30},
	['义宁府'] 	 = {PosX = 236, PosY = 275, Range = 30},
	['丰乐门'] 	 = {PosX = 384, PosY = 229, Range = 30},
	['延兴大道'] = {PosX = 470, PosY = 164, Range = 30},
	['和平坊']   = {PosX = 314, PosY = 341, Range = 30},
	['永安坊']   = {PosX = 389, PosY = 296, Range = 30},
	['明德大道'] = {PosX = 489, PosY = 287, Range = 30},
	['永乐坊']   = {PosX = 517, PosY = 226, Range = 30},
	['昭国坊']   = {PosX = 611, PosY = 165, Range = 30},
	['明德门']   = {PosX = 572, PosY = 333, Range = 30},
}

Act_Chikings.BuffCD = 30	--石头人给BUFF的CD（秒）


--------------------------------------------
------------------宝箱配置------------------
Act_Chikings.ChestConfig = {
	['Box_Low_Attr'] = {			--属性向小鸡宝箱配置
		RandTimes = 10,				--随机次数
		Nothing = 8000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 100},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道封印', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道抗封', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 100},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 50},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道封印', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道抗封', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 50},
		    {Type = 'FightBuffs', Name = '高级天道生命', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道物攻', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道法攻', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道物防', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道法防', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道物爆', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道法爆', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道封印', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道抗封', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道命中', Rand = 5},
			{Type = 'FightBuffs', Name = '高级天道速度', Rand = 5},
		    {Type = 'FightBuffs', Name = '高级魔道生命', Rand = 5},
			{Type = 'FightBuffs', Name = '高级魔道物攻', Rand = 5},
			{Type = 'FightBuffs', Name = '高级魔道法攻', Rand = 5},
			{Type = 'FightBuffs', Name = '高级魔道物防', Rand = 5},
			{Type = 'FightBuffs', Name = '高级魔道法防', Rand = 5},
			--{Type = 'FightBuffs', Name = '高级魔道物爆', Rand = 5},
			--{Type = 'FightBuffs', Name = '高级魔道法爆', Rand = 5},
			--{Type = 'FightBuffs', Name = '高级魔道双封', Rand = 5},
			--{Type = 'FightBuffs', Name = '高级魔道命中', Rand = 5},
			{Type = 'FightBuffs', Name = '高级魔道速度', Rand = 5},
			{Type = 'Item', Name = '银坷垃', Rand = 300},
			{Type = 'Bag', Name = '铜鱼袋', Rand = 400},
			{Type = 'Bag', Name = '银鱼袋', Rand = 120},
			{Type = 'Shoes', Name = '草鞋', Rand = 300},
		},
	
	},
	['Box_Low_Skill'] = {			--技能向小鸡宝箱配置
		RandTimes = 4,				--随机次数
		Nothing = 5000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道闪避', Rand = 100},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道双封', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道闪避', Rand = 100},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道双封', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道闪避', Rand = 50},
			{Type = 'FightSkills', Name = '一条', Rand = 100},
			{Type = 'FightSkills', Name = '金鸡', Rand = 100},
			{Type = 'FightSkills', Name = '先发制鸡', Rand = 100},
			{Type = 'FightSkills', Name = '僚鸡', Rand = 100},
			{Type = 'FightSkills', Name = '恢鸡', Rand = 100},
			{Type = 'FightSkills', Name = '令箭', Rand = 100},
			{Type = 'FightSkills', Name = '绝地反鸡', Rand = 100},
			{Type = 'FightSkills', Name = '鸡爪功', Rand = 100},
			{Type = 'FightSkills', Name = '后鸡之秀', Rand = 100},
			{Type = 'FightSkills', Name = '神鸡', Rand = 100},
		},                                 
	
	},
	['Box_Low_Othe'] = {			--资源向小鸡宝箱配置
		RandTimes = 7,				--随机次数
		Nothing = 7000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 100},
			{Type = 'FightBuffs', Name = '低级天道闪避', Rand = 100},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道双封', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 100},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 100},
			--{Type = 'FightBuffs', Name = '低级魔道闪避', Rand = 100},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 50},
			{Type = 'FightBuffs', Name = '中级天道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道双封', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 50},
			--{Type = 'FightBuffs', Name = '中级魔道闪避', Rand = 50},
			{Type = 'Item', Name = '银坷垃', Rand = 1500},
			{Type = 'Item', Name = '金坷垃', Rand = 200},
			{Type = 'Item', Name = '遁走符', Rand = 100},
			{Type = 'Item', Name = '鸡王神符', Rand = 60},
			{Type = 'Bag', Name = '铜鱼袋', Rand = 1000},
			{Type = 'Bag', Name = '银鱼袋', Rand = 300},
			{Type = 'Shoes', Name = '草鞋', Rand = 1000},
			{Type = 'Shoes', Name = '跑步靴', Rand = 300},
			--{Type = 'Eye', Name = '凸面镜', Rand = 1000},
			--{Type = 'Eye', Name = '超清凸面镜', Rand = 300},
			{Type = 'Trap', Name = '眩晕小烟花', Rand = 1000},
			{Type = 'Trap', Name = '眩晕大烟花', Rand = 200},
			{Type = 'Trap', Name = '小毒散', Rand = 1000},
			{Type = 'Trap', Name = '大毒散', Rand = 200},
			{Type = 'Trap', Name = '手里剑', Rand = 1000},
			{Type = 'Trap', Name = '夺命飞刀', Rand = 200},
			--{Type = 'Trap', Name = '小盲目符', Rand = 1000},
			--{Type = 'Trap', Name = '大盲目符', Rand = 200},
			
		},
	},
	['Box_Up_Attr'] = {				--属性向巨鸡宝箱配置
	     RandTimes = 10,				--随机次数
		Nothing = 8000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 50},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道双封', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 150},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 150},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道双封', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 150},
		    {Type = 'FightBuffs', Name = '高级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '高级天道速度', Rand = 50},
		    {Type = 'FightBuffs', Name = '超级魔道生命', Rand = 10},
			{Type = 'FightBuffs', Name = '超级魔道物攻', Rand = 10},
			{Type = 'FightBuffs', Name = '超级魔道法攻', Rand = 10},
			{Type = 'FightBuffs', Name = '超级魔道物防', Rand = 10},
			{Type = 'FightBuffs', Name = '超级魔道法防', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道物爆', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道法爆', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道双封', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道命中', Rand = 10},
			{Type = 'FightBuffs', Name = '超级魔道速度', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道生命', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道物攻', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道法攻', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道物防', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道法防', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道物爆', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道法爆', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道封印', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道抗封', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道命中', Rand = 10},
			{Type = 'FightBuffs', Name = '超级天道速度', Rand = 10},
		    --{Type = 'FightBuffs', Name = '超级魔道生命', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道物攻', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道法攻', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道物防', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道法防', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道物爆', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道法爆', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道双封', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道命中', Rand = 10},
			--{Type = 'FightBuffs', Name = '超级魔道速度', Rand = 10},
			{Type = 'Item', Name = '银坷垃', Rand = 300},
			{Type = 'Item', Name = '金坷垃', Rand = 300},
			{Type = 'Bag', Name = '铜鱼袋', Rand = 400},
			{Type = 'Bag', Name = '银鱼袋', Rand = 400},
			{Type = 'Shoes', Name = '草鞋', Rand = 300},
			{Type = 'Shoes', Name = '跑步靴', Rand = 300},
		},                           
	                                
	},                              
	['Box_Up_Skill'] = {             --药品向巨鸡宝箱配置
	    RandTimes = 4,				--随机次数
		Nothing = 5000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道双封', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道闪避', Rand = 150},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道双封', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道闪避', Rand = 150},
			{Type = 'FightSkills', Name = '一条', Rand = 100},
			{Type = 'FightSkills', Name = '金鸡', Rand = 100},
			{Type = 'FightSkills', Name = '先发制鸡', Rand = 100},
			{Type = 'FightSkills', Name = '僚鸡', Rand = 100},
			{Type = 'FightSkills', Name = '恢鸡', Rand = 100},
			{Type = 'FightSkills', Name = '令箭', Rand = 100},
			{Type = 'FightSkills', Name = '绝地反鸡', Rand = 100},
			{Type = 'FightSkills', Name = '鸡爪功', Rand = 100},
			{Type = 'FightSkills', Name = '后鸡之秀', Rand = 100},
			{Type = 'FightSkills', Name = '神鸡', Rand = 100},
			
			{Type = 'FightSkills', Name = '阿瓦达索鸡', Rand = 100},
			{Type = 'FightSkills', Name = '鸡不可失', Rand = 100},
			{Type = 'FightSkills', Name = '北鸣神功', Rand = 100},
			{Type = 'FightSkills', Name = '九阴乌骨爪', Rand = 100},
			{Type = 'FightSkills', Name = '大鸡大利', Rand = 100},
			{Type = 'FightSkills', Name = '闻鸡起舞', Rand = 100},
			{Type = 'FightSkills', Name = '天鸡流星拳', Rand = 100},
			{Type = 'FightSkills', Name = '天鸡将军', Rand = 100},
			{Type = 'FightSkills', Name = '不讲鸡德', Rand = 100},
			{Type = 'FightSkills', Name = '鸡力与你同在', Rand = 100},
		},
	},                              
	['Box_Up_Othe'] = {             --资源向巨鸡宝箱配置
		RandTimes = 7,				--随机次数
		Nothing = 7000,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '低级天道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道物爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道法爆', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道封印', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道抗封', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道速度', Rand = 50},
			{Type = 'FightBuffs', Name = '低级天道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '低级魔道生命', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法攻', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道物防', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道法防', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道物爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道法爆', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道双封', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道命中', Rand = 50},
			{Type = 'FightBuffs', Name = '低级魔道速度', Rand = 50},
			--{Type = 'FightBuffs', Name = '低级魔道闪避', Rand = 50},
		    {Type = 'FightBuffs', Name = '中级天道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道物爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道法爆', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道封印', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道抗封', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道速度', Rand = 150},
			{Type = 'FightBuffs', Name = '中级天道闪避', Rand = 150},
		    {Type = 'FightBuffs', Name = '中级魔道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道法防', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道物爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道法爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道双封', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '中级魔道速度', Rand = 150},
			--{Type = 'FightBuffs', Name = '中级魔道闪避', Rand = 150},
			{Type = 'Item', Name = '银坷垃', Rand = 2000},
			{Type = 'Item', Name = '金坷垃', Rand = 600},
			{Type = 'Item', Name = '遁走符', Rand = 200},
			{Type = 'Item', Name = '鸡王神符', Rand = 120},
			{Type = 'Item', Name = '隐形药水', Rand = 300},
			{Type = 'Bag', Name = '铜鱼袋', Rand = 1000},
			{Type = 'Bag', Name = '银鱼袋', Rand = 750},
			{Type = 'Bag', Name = '金鱼袋', Rand = 250},
			{Type = 'Shoes', Name = '草鞋', Rand = 1000},
			{Type = 'Shoes', Name = '跑步靴', Rand = 750},
			{Type = 'Shoes', Name = '赛筋斗', Rand = 250},
			--{Type = 'Eye', Name = '凸面镜', Rand = 1000},
			--{Type = 'Eye', Name = '超清凸面镜', Rand = 600},
			--{Type = 'Eye', Name = '千里眼', Rand = 150},
			{Type = 'Trap', Name = '眩晕小烟花', Rand = 400},
			{Type = 'Trap', Name = '眩晕大烟花', Rand = 400},
			{Type = 'Trap', Name = '眩晕狗粮', Rand = 400},
			{Type = 'Trap', Name = '小毒散', Rand = 400},
			{Type = 'Trap', Name = '大毒散', Rand = 400},
			{Type = 'Trap', Name = '剧毒散', Rand = 400},
			{Type = 'Trap', Name = '手里剑', Rand = 400},
			{Type = 'Trap', Name = '夺命飞刀', Rand = 400},
			{Type = 'Trap', Name = '血滴子', Rand = 400},
			{Type = 'Trap', Name = '绊马索', Rand = 400},
			--{Type = 'Trap', Name = '小盲目符', Rand = 400},
			--{Type = 'Trap', Name = '大盲目符', Rand = 400},
			--{Type = 'Trap', Name = '超级盲目符', Rand = 400},		
			
		},
	
	},
	['Box_Max'] = {					--鸡王至宝
		RandTimes = 5,				--随机次数
		Nothing = 0,				--单次随机不出道具的几率（第一次随机必定会出某个道具）
		Rands = {
			{Type = 'FightBuffs', Name = '超级天道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道法防', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道物爆', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道法爆', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道封印', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道抗封', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道速度', Rand = 150},
			{Type = 'FightBuffs', Name = '超级天道闪避', Rand = 150},
		    {Type = 'FightBuffs', Name = '超级魔道生命', Rand = 150},
			{Type = 'FightBuffs', Name = '超级魔道物攻', Rand = 150},
			{Type = 'FightBuffs', Name = '超级魔道法攻', Rand = 150},
			{Type = 'FightBuffs', Name = '超级魔道物防', Rand = 150},
			{Type = 'FightBuffs', Name = '超级魔道法防', Rand = 150},
			--{Type = 'FightBuffs', Name = '超级魔道物爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '超级魔道法爆', Rand = 150},
			--{Type = 'FightBuffs', Name = '超级魔道双封', Rand = 150},
			--{Type = 'FightBuffs', Name = '超级魔道命中', Rand = 150},
			{Type = 'FightBuffs', Name = '超级魔道速度', Rand = 150},
			--{Type = 'FightBuffs', Name = '超级魔道闪避', Rand = 150},
		},
		Rands_2 = {
			{Type = 'Item', Name = '遁走符', Rand = 200},
			{Type = 'Item', Name = '金坷垃', Rand = 400},
			{Type = 'Item', Name = '隐形药水', Rand = 300},
			{Type = 'Trap', Name = '眩晕大烟花', Rand = 100},
			{Type = 'Trap', Name = '眩晕狗粮', Rand = 100},
			{Type = 'Trap', Name = '大毒散', Rand = 100},
			{Type = 'Trap', Name = '剧毒散', Rand = 100},
			{Type = 'Trap', Name = '夺命飞刀', Rand = 100},
			{Type = 'Trap', Name = '血滴子', Rand = 100},
			{Type = 'Trap', Name = '绊马索', Rand = 100},
			--{Type = 'Trap', Name = '大盲目符', Rand = 100},
			--{Type = 'Trap', Name = '超级盲目符', Rand = 100},
		},
		Rands_3 = {
			{Type = 'FightSkills', Name = '阿瓦达索鸡', Rand = 100},
			{Type = 'FightSkills', Name = '鸡不可失', Rand = 100},
			{Type = 'FightSkills', Name = '北鸣神功', Rand = 100},
			{Type = 'FightSkills', Name = '九阴乌骨爪', Rand = 100},
			{Type = 'FightSkills', Name = '大鸡大利', Rand = 100},
			{Type = 'FightSkills', Name = '闻鸡起舞', Rand = 100},
			{Type = 'FightSkills', Name = '天鸡流星拳', Rand = 100},
			{Type = 'FightSkills', Name = '天鸡将军', Rand = 100},
			{Type = 'FightSkills', Name = '不讲鸡德', Rand = 100},
			{Type = 'FightSkills', Name = '鸡力与你同在', Rand = 100},
		},
		Rands_4 = {
			{Type = 'Bag', Name = '金鱼袋', Rand = 500},
			{Type = 'Shoes', Name = '赛筋斗', Rand = 250},
			--{Type = 'Eye', Name = '千里眼', Rand = 250},
		},
	
	},











}

Act_Chikings.ChestPoint = {
	--{PosX = 38, PosY = 41, Rot = 0, Chest = 30},		--Chest越大表示越容易刷出好宝箱（0-100）
	--西长廊（普通区） 10个宝箱，中低级6个，中高级4个
	{PosX = 7, PosY = 26, Rot = 3, Chest = 90},
	{PosX = 16, PosY = 34, Rot = 3, Chest = 50},
	{PosX = 6, PosY = 61, Rot = 2, Chest = 40},
	{PosX = 4, PosY = 83, Rot = 7, Chest = 70},
	{PosX = 23, PosY = 71, Rot = 7, Chest = 60},
	{PosX = 36, PosY = 62, Rot = 7, Chest = 50},
	{PosX = 156, PosY = 5, Rot = 7, Chest = 90},
	{PosX = 141, PosY = 12, Rot = 7, Chest = 80},
	{PosX = 117, PosY = 19, Rot = 7, Chest = 60},
	{PosX = 45, PosY = 3, Rot = 3, Chest = 70},
	{PosX = 67, PosY = 2, Rot = 3, Chest = 60},
	{PosX = 97, PosY = 2, Rot = 3, Chest = 80},
	{PosX = 40, PosY = 8, Rot = 3, Chest = 40},
	{PosX = 59, PosY = 58, Rot = 3, Chest = 60},
	{PosX = 102, PosY = 45, Rot = 3, Chest = 60},
	{PosX = 632, PosY = 361, Rot = 7, Chest = 90},
	{PosX = 623, PosY = 339, Rot = 5, Chest = 40},
	{PosX = 615, PosY = 333, Rot = 5, Chest = 50},
	{PosX = 592, PosY = 335, Rot = 5, Chest = 40},
	{PosX = 570, PosY = 346, Rot = 1, Chest = 50},
	{PosX = 582, PosY = 351, Rot = 1, Chest = 60},
	{PosX = 595, PosY = 357, Rot = 1, Chest = 70},
	{PosX = 623, PosY = 362, Rot = 7, Chest = 90},
	{PosX = 620, PosY = 10, Rot = 3, Chest = 80},
	{PosX = 633, PosY = 11, Rot = 5, Chest = 90},
	{PosX = 629, PosY = 25, Rot = 7, Chest = 70},
	{PosX = 630, PosY = 42, Rot = 7, Chest = 60},
	{PosX = 617, PosY = 42, Rot = 7, Chest = 50},
	{PosX = 598, PosY = 30, Rot = 3, Chest = 50},
	{PosX = 556, PosY = 12, Rot = 3, Chest = 80},
	{PosX = 574, PosY = 10, Rot = 3, Chest = 70},
	{PosX = 567, PosY = 16, Rot = 3, Chest = 60},
	{PosX = 578, PosY = 19, Rot = 3, Chest = 40},
	{PosX = 600, PosY = 20, Rot = 3, Chest = 20},
	{PosX = 591, PosY = 45, Rot = 5, Chest = 50},
	{PosX = 5, PosY = 343, Rot = 7, Chest = 90},
	{PosX = 3, PosY = 325, Rot = 3, Chest = 90},
	{PosX = 7, PosY = 313, Rot = 3, Chest = 75},
	{PosX = 16, PosY = 308, Rot = 3, Chest = 70},
	{PosX = 55, PosY = 321, Rot = 7, Chest = 60},
	{PosX = 34, PosY = 329, Rot = 7, Chest = 75},
	{PosX = 45, PosY = 325, Rot = 7, Chest = 82},
	{PosX = 16, PosY = 324, Rot = 1, Chest = 82},
	{PosX = 55, PosY = 295, Rot = 3, Chest = 40},
	{PosX = 64, PosY = 301, Rot = 7, Chest = 40},
	{PosX = 159, PosY = 146, Rot = 5, Chest = 40},
	{PosX = 141, PosY = 148, Rot = 3, Chest = 60},
	{PosX = 134, PosY = 151, Rot = 3, Chest = 70},
	{PosX = 120, PosY = 152, Rot = 3, Chest = 80},
	{PosX = 111, PosY = 163, Rot = 3, Chest = 65},
	{PosX = 101, PosY = 168, Rot = 3, Chest = 55},
	{PosX = 94, PosY = 179, Rot = 1, Chest = 60},
	{PosX = 106, PosY = 184, Rot = 1, Chest = 50},
	{PosX = 123, PosY = 193, Rot = 1, Chest = 75},
	{PosX = 142, PosY = 197, Rot = 7, Chest = 55},
	{PosX = 119, PosY = 181, Rot = 3, Chest = 55},
	{PosX = 194, PosY = 168, Rot = 7, Chest = 45},
	{PosX = 185, PosY = 173, Rot = 7, Chest = 35},
	{PosX = 186, PosY = 153, Rot = 1, Chest = 65},
	{PosX = 155, PosY = 210, Rot = 1, Chest = 85},
	{PosX = 164, PosY = 216, Rot = 1, Chest = 90},
	{PosX = 177, PosY = 230, Rot = 3, Chest = 40},
	{PosX = 173, PosY = 191, Rot = 3, Chest = 55},
	{PosX = 185, PosY = 185, Rot = 3, Chest = 75},
	{PosX = 221, PosY = 176, Rot = 3, Chest = 55},
	{PosX = 217, PosY = 181, Rot = 3, Chest = 65},
	{PosX = 243, PosY = 179, Rot = 3, Chest = 65},
	{PosX = 175, PosY = 210, Rot = 3, Chest = 45},
	{PosX = 191, PosY = 222, Rot = 3, Chest = 55},
	{PosX = 209, PosY = 194, Rot = 3, Chest = 60},
	{PosX = 303, PosY = 16, Rot = 3, Chest = 80},
	{PosX = 350, PosY = 57, Rot = 5, Chest = 60},
	{PosX = 382, PosY = 42, Rot = 5, Chest = 70},
	{PosX = 429, PosY = 86, Rot = 5, Chest = 60},
	{PosX = 438, PosY = 59, Rot = 3, Chest = 70},
	{PosX = 477, PosY = 9, Rot = 5, Chest = 60},
	{PosX = 455, PosY = 24, Rot = 1, Chest = 60},
	{PosX = 339, PosY = 89, Rot = 1, Chest = 85},
	{PosX = 207, PosY = 303, Rot = 1, Chest = 80},
	{PosX = 173, PosY = 289, Rot = 1, Chest = 60},
	{PosX = 42, PosY = 239, Rot = 1, Chest = 70},
	{PosX = 123, PosY = 220, Rot = 5, Chest = 75},
	{PosX = 613, PosY = 352, Rot = 7, Chest = 55},
	{PosX = 552, PosY = 102, Rot = 3, Chest = 55},
	{PosX = 582, PosY = 106, Rot = 7, Chest = 65},
	{PosX = 566, PosY = 52, Rot = 3, Chest = 70},
	{PosX = 577, PosY = 74, Rot = 1, Chest = 50},
	{PosX = 627, PosY = 83, Rot = 7, Chest = 80},
	{PosX = 595, PosY = 124, Rot = 3, Chest = 75},
	{PosX = 625, PosY = 263, Rot = 7, Chest = 60},
	{PosX = 606, PosY = 274, Rot = 7, Chest = 40},
	{PosX = 488, PosY = 217, Rot = 5, Chest = 70},
	{PosX = 463, PosY = 223, Rot = 5, Chest = 50},
	{PosX = 284, PosY = 112, Rot = 5, Chest = 50},
	{PosX = 120, PosY = 170, Rot = 3, Chest = 60},
	{PosX = 130, PosY = 234, Rot = 7, Chest = 70},
	{PosX = 242, PosY = 247, Rot = 5, Chest = 50},
	{PosX = 269, PosY = 276, Rot = 5, Chest = 60},
	
	--西长廊（普通区） 10个宝箱，中低级6个，中高级4个	
	{PosX = 7, PosY = 129, Rot = 1, Chest = 30},
	{PosX = 26, PosY = 107, Rot = 3, Chest = 75},
	{PosX = 51, PosY = 91, Rot = 3, Chest = 40},
	{PosX = 43, PosY = 113, Rot = 7, Chest = 80},
	{PosX = 10, PosY = 149, Rot = 1, Chest = 30},
	{PosX = 27, PosY = 132, Rot = 3, Chest = 50},
	{PosX = 82, PosY = 124, Rot = 7, Chest = 30},
	{PosX = 63, PosY = 138, Rot = 7, Chest = 70},
	{PosX = 42, PosY = 146, Rot = 7, Chest = 50},
	{PosX = 66, PosY = 96, Rot = 7, Chest = 80},
	--安定府（富庶区） 18个宝箱，中低级6个，中高级9个，高级3个
	{PosX = 79, PosY = 195, Rot = 3, Chest = 80},
	{PosX = 56, PosY = 204, Rot = 3, Chest = 80},
	{PosX = 17, PosY = 223, Rot = 3, Chest = 50},
	{PosX = 33, PosY = 220, Rot = 3, Chest = 85},
	{PosX = 76, PosY = 237, Rot = 3, Chest = 90},
	{PosX = 29, PosY = 243, Rot = 1, Chest = 85},
	{PosX = 46, PosY = 252, Rot = 1, Chest = 80},
	{PosX = 62, PosY = 258, Rot = 1, Chest = 20},
	{PosX = 102, PosY = 278, Rot = 3, Chest = 70},
	{PosX = 144, PosY = 282, Rot = 7, Chest = 85},
	{PosX = 150, PosY = 250, Rot = 3, Chest = 70},
	{PosX = 56, PosY = 227, Rot = 4, Chest = 70},
	{PosX = 136, PosY = 227, Rot = 5, Chest = 85},
	{PosX = 116, PosY = 262, Rot = 3, Chest = 90},
	{PosX = 162, PosY = 263, Rot = 7, Chest = 95},
	{PosX = 84, PosY = 201, Rot = 5, Chest = 60},
	{PosX = 98, PosY = 224, Rot = 5, Chest = 80},
	{PosX = 84, PosY = 217, Rot = 5, Chest = 85},
	--文宁府（富庶区） 14个宝箱， 中低级5个，中高级6个，高级3个
	{PosX = 247, PosY = 241, Rot = 5, Chest = 65},
	{PosX = 280, PosY = 266, Rot = 5, Chest = 80},
	{PosX = 254, PosY = 268, Rot = 5, Chest = 40},
	{PosX = 229, PosY = 257, Rot = 3, Chest = 90},
	{PosX = 205, PosY = 258, Rot = 7, Chest = 85},
	{PosX = 188, PosY = 275, Rot = 3, Chest = 85},
	{PosX = 177, PosY = 304, Rot = 5, Chest = 80},
	{PosX = 144, PosY = 306, Rot = 3, Chest = 55},
	{PosX = 174, PosY = 316, Rot = 7, Chest = 70},
	{PosX = 232, PosY = 300, Rot = 7, Chest = 90},
	{PosX = 252, PosY = 290, Rot = 7, Chest = 45},
	{PosX = 209, PosY = 276, Rot = 3, Chest = 90},
	{PosX = 321, PosY = 265, Rot = 1, Chest = 85},
	{PosX = 256, PosY = 314, Rot = 3, Chest = 80},
	--永安坊（贫民区） 17个宝箱， 中低级13个，中高级4个
	{PosX = 340, PosY = 240, Rot = 5, Chest = 10},
	{PosX = 336, PosY = 262, Rot = 1, Chest = 10},
	{PosX = 316, PosY = 283, Rot = 7, Chest = 20},
	{PosX = 280, PosY = 346, Rot = 5, Chest = 20},
	{PosX = 255, PosY = 353, Rot = 1, Chest = 65},
	{PosX = 308, PosY = 360, Rot = 1, Chest = 60},
	{PosX = 331, PosY = 353, Rot = 7, Chest = 70},
	{PosX = 368, PosY = 335, Rot = 0, Chest = 80},
	{PosX = 467, PosY = 346, Rot = 0, Chest = 55},
	{PosX = 422, PosY = 364, Rot = 0, Chest = 20},
	{PosX = 415, PosY = 331, Rot = 5, Chest = 60},
	{PosX = 383, PosY = 348, Rot = 1, Chest = 80},
	{PosX = 391, PosY = 320, Rot = 7, Chest = 50},
	{PosX = 413, PosY = 297, Rot = 0, Chest = 55},
	{PosX = 436, PosY = 279, Rot = 3, Chest = 75},
	{PosX = 373, PosY = 289, Rot = 3, Chest = 10},
	{PosX = 335, PosY = 299, Rot = 5, Chest = 20},
	
	-- 兴庆宫
	{PosX = 537, PosY = 75, Rot = 6, Chest = 80},		
	{PosX = 531, PosY = 66, Rot = 3, Chest = 85},		
	{PosX = 523, PosY = 55, Rot = 5, Chest = 95},		
	{PosX = 519, PosY = 85, Rot = 5, Chest = 75},		
	{PosX = 493, PosY = 89, Rot = 3, Chest = 80},		
	{PosX = 423, PosY = 112, Rot = 3, Chest = 90},		
	{PosX = 463, PosY = 104, Rot = 3, Chest = 80},		
	{PosX = 528, PosY = 105, Rot = 3, Chest = 70},		
	{PosX = 509, PosY = 74, Rot = 5, Chest = 80},		
	{PosX = 472, PosY = 87, Rot = 3, Chest = 90},		
	{PosX = 486, PosY = 91, Rot = 3, Chest = 80},		
	{PosX = 483, PosY = 102, Rot = 7, Chest = 90},		
	{PosX = 524, PosY = 67, Rot = 5, Chest = 90},		
	{PosX = 444, PosY = 95, Rot = 7, Chest = 85},
	-- 考场		
	{PosX = 245, PosY = 122, Rot = 5, Chest = 80},		
	{PosX = 223, PosY = 122, Rot = 5, Chest = 70},		
	{PosX = 218, PosY = 110, Rot = 5, Chest = 80},		
	{PosX = 232, PosY = 98, Rot = 5, Chest = 80},		
	{PosX = 258, PosY = 81, Rot = 5, Chest = 70},		
	{PosX = 268, PosY = 99, Rot = 1, Chest = 90},		
	{PosX = 293, PosY = 96, Rot = 5, Chest = 85},		
	{PosX = 288, PosY = 89, Rot = 5, Chest = 95},		
	{PosX = 277, PosY = 119, Rot = 5, Chest = 85},
	{PosX = 249, PosY = 109, Rot = 5, Chest = 80},		
	{PosX = 244, PosY = 91, Rot = 5, Chest = 90},		
	{PosX = 253, PosY = 75, Rot = 5, Chest = 85},
	-- 北市集		
	{PosX = 282, PosY = 144, Rot = 4, Chest = 70},		
	{PosX = 301, PosY = 139, Rot = 4, Chest = 50},		
	{PosX = 323, PosY = 146, Rot = 5, Chest = 60},		
	{PosX = 317, PosY = 132, Rot = 5, Chest = 79},		
	{PosX = 335, PosY = 219, Rot = 3, Chest = 50},		
	{PosX = 355, PosY = 120, Rot = 5, Chest = 95},
	-- 南市集		
	{PosX = 359, PosY = 155, Rot = 5, Chest = 60},		
	{PosX = 371, PosY = 168, Rot = 5, Chest = 50},		
	{PosX = 352, PosY = 174, Rot = 5, Chest = 60},		
	{PosX = 337, PosY = 167, Rot = 4, Chest = 70},		
	{PosX = 347, PosY = 162, Rot = 4, Chest = 40},		
	{PosX = 370, PosY = 187, Rot = 5, Chest = 70},
	-- 延兴大道		
	{PosX = 426, PosY = 175, Rot = 4, Chest = 50},		
	{PosX = 460, PosY = 179, Rot = 4, Chest = 40},		
	{PosX = 467, PosY = 174, Rot = 4, Chest = 40},		
	{PosX = 464, PosY = 152, Rot = 3, Chest = 30},		
	{PosX = 495, PosY = 148, Rot = 5, Chest = 30},		
	{PosX = 516, PosY = 137, Rot = 5, Chest = 60},		
	{PosX = 547, PosY = 126, Rot = 5, Chest = 70},
	{PosX = 589, PosY = 92, Rot = 5, Chest = 65},
	-- 昭国坊		
	{PosX = 577, PosY = 137, Rot = 3, Chest = 30},		
	{PosX = 599, PosY = 139, Rot = 5, Chest = 40},		
	{PosX = 604, PosY = 153, Rot = 5, Chest = 30},		
	{PosX = 629, PosY = 153, Rot = 5, Chest = 50},		
	{PosX = 603, PosY = 191, Rot = 5, Chest = 80},		
	{PosX = 619, PosY = 174, Rot = 5, Chest = 60},		
	{PosX = 616, PosY = 164, Rot = 5, Chest = 50},
	-- 永乐坊		
	{PosX = 627, PosY = 241, Rot = 7, Chest = 80},		
	{PosX = 610, PosY = 229, Rot = 7, Chest = 70},
	{PosX = 554, PosY = 204, Rot = 7, Chest = 65},		
	{PosX = 534, PosY = 193, Rot = 3, Chest = 30},		
	{PosX = 512, PosY = 176, Rot = 3, Chest = 40},		
	{PosX = 533, PosY = 227, Rot = 5, Chest = 60},
	-- 大明山庄		
	{PosX = 325, PosY = 4, Rot = 5, Chest = 92},		
	{PosX = 308, PosY = 27, Rot = 3, Chest = 50},		
	{PosX = 328, PosY = 40, Rot = 3, Chest = 30},
	-- 大雁塔		
	{PosX = 400, PosY = 57, Rot = 5, Chest = 30},		
	{PosX = 455, PosY = 66, Rot = 3, Chest = 50},		
	{PosX = 451, PosY = 44, Rot = 3, Chest = 40},		
	{PosX = 389, PosY = 90, Rot = 5, Chest = 70},		
	{PosX = 417, PosY = 6, Rot = 4, Chest = 90},
	-- 东长廊
	{PosX = 255, PosY = 20, Rot = 5, Chest = 80},		
	{PosX = 206, PosY = 53, Rot = 5, Chest = 40},		
	{PosX = 176, PosY = 73, Rot = 5, Chest = 40},		
	{PosX = 160, PosY = 51, Rot = 5, Chest = 30},		
	{PosX = 236, PosY = 4, Rot = 5, Chest = 70},		
	{PosX = 167, PosY = 10, Rot = 5, Chest = 75},		
	-- 玄武大道
	{PosX = 325, PosY = 201, Rot = 3, Chest = 30},	
	{PosX = 278, PosY = 171, Rot = 5, Chest = 40},		
	{PosX = 245, PosY = 157, Rot = 3, Chest = 30},		
	{PosX = 217, PosY = 152, Rot = 3, Chest = 60},		
	{PosX = 210, PosY = 131, Rot = 3, Chest = 40},		
	{PosX = 193, PosY = 118, Rot = 3, Chest = 55},		
	{PosX = 156, PosY = 124, Rot = 3, Chest = 60},		
	{PosX = 161, PosY = 112, Rot = 3, Chest = 70},
	-- 丰乐门		
	{PosX = 350, PosY = 202, Rot = 3, Chest = 60},		
	{PosX = 354, PosY = 238, Rot = 4, Chest = 55},		
	{PosX = 384, PosY = 233, Rot = 3, Chest = 55},		
	{PosX = 422, PosY = 222, Rot = 3, Chest = 50},
	-- 明德大道		
	{PosX = 420, PosY = 263, Rot = 3, Chest = 60},		
	{PosX = 477, PosY = 257, Rot = 4, Chest = 55},		
	{PosX = 505, PosY = 271, Rot = 3, Chest = 55},		
	{PosX = 500, PosY = 303, Rot = 3, Chest = 50},		
	{PosX = 526, PosY = 261, Rot = 5, Chest = 70},		
	{PosX = 544, PosY = 242, Rot = 5, Chest = 65},		
	{PosX = 513, PosY = 241, Rot = 5, Chest = 55},

}

Act_Chikings.ChestLevel = {
	['Chest_1'] = {'Box_Low_Attr', 'Box_Low_Skill', 'Box_Low_Othe'},
	['Chest_2'] = {'Box_Up_Attr', 'Box_Up_Skill', 'Box_Up_Othe'},
	['Chest_3'] = {'Box_Max'},
}


Act_Chikings.ChestOpenSec = 1		--包裹打开时间（秒）

--------------------------------------------
------------------属性配置------------------
Act_Chikings.Buffs = {
	











}

Act_Chikings.FightBuffs = {
	['低级天道生命'] = {BuffID = 13001,Type = 1001,Grade = 2, Icon = "1900815282", Desc = "在战斗中，使角色的生命提升10000点"},--10000
	['中级天道生命'] = {BuffID = 13002,Type = 1001,Grade = 3, Icon = "1900815282", Desc = "在战斗中，使角色的生命提升20000点"},--20000
	['高级天道生命'] = {BuffID = 13003,Type = 1001,Grade = 4, Icon = "1900815282", Desc = "在战斗中，使角色的生命提升50000点"},--50000
	['超级天道生命'] = {BuffID = 13004,Type = 1001,Grade = 5, Icon = "1900815282", Desc = "在战斗中，使角色的生命提升80000点"},--80000
	['低级魔道生命'] = {BuffID = 13011,Type = 1001,Grade = 2, Icon = "1900815212", Desc = "在战斗中，使角色的生命提升100%"},--100%
	['中级魔道生命'] = {BuffID = 13012,Type = 1001,Grade = 3, Icon = "1900815212", Desc = "在战斗中，使角色的生命提升300%"},--300%
	['高级魔道生命'] = {BuffID = 13013,Type = 1001,Grade = 4, Icon = "1900815212", Desc = "在战斗中，使角色的生命提升500%"},--500%
	['超级魔道生命'] = {BuffID = 13014,Type = 1001,Grade = 5, Icon = "1900815212", Desc = "在战斗中，使角色的生命提升800%"},--800%
	['低级天道物攻'] = {BuffID = 13021,Type = 1002,Grade = 2, Icon = "1900815252", Desc = "在战斗中，使角色的物攻提升2000点"},--2000
	['中级天道物攻'] = {BuffID = 13022,Type = 1002,Grade = 3, Icon = "1900815252", Desc = "在战斗中，使角色的物攻提升5000点"},--5000
	['高级天道物攻'] = {BuffID = 13023,Type = 1002,Grade = 4, Icon = "1900815252", Desc = "在战斗中，使角色的物攻提升15000点"},--15000
	['超级天道物攻'] = {BuffID = 13024,Type = 1002,Grade = 5, Icon = "1900815252", Desc = "在战斗中，使角色的物攻提升20000点"},--20000
	['低级魔道物攻'] = {BuffID = 13031,Type = 1002,Grade = 2, Icon = "1900815182", Desc = "在战斗中，使角色的物攻提升100%"},--100%
	['中级魔道物攻'] = {BuffID = 13032,Type = 1002,Grade = 3, Icon = "1900815182", Desc = "在战斗中，使角色的物攻提升300%"},--300%
	['高级魔道物攻'] = {BuffID = 13033,Type = 1002,Grade = 4, Icon = "1900815182", Desc = "在战斗中，使角色的物攻提升500%"},--500%
	['超级魔道物攻'] = {BuffID = 13034,Type = 1002,Grade = 5, Icon = "1900815182", Desc = "在战斗中，使角色的物攻提升800%"},--800%
	['低级天道法攻'] = {BuffID = 13041,Type = 1003,Grade = 2, Icon = "1900815252", Desc = "在战斗中，使角色的法攻提升2000点"},--2000
    ['中级天道法攻'] = {BuffID = 13042,Type = 1003,Grade = 3, Icon = "1900815252", Desc = "在战斗中，使角色的法攻提升5000点"},--5000
    ['高级天道法攻'] = {BuffID = 13043,Type = 1003,Grade = 4, Icon = "1900815252", Desc = "在战斗中，使角色的法攻提升15000点"},--15000
    ['超级天道法攻'] = {BuffID = 13044,Type = 1003,Grade = 5, Icon = "1900815252", Desc = "在战斗中，使角色的法攻提升20000点"},--20000
	['低级魔道法攻'] = {BuffID = 13051,Type = 1003,Grade = 2, Icon = "1900815182", Desc = "在战斗中，使角色的法攻提升100%"},--100%
    ['中级魔道法攻'] = {BuffID = 13052,Type = 1003,Grade = 3, Icon = "1900815182", Desc = "在战斗中，使角色的法攻提升300%"},--300%
    ['高级魔道法攻'] = {BuffID = 13053,Type = 1003,Grade = 4, Icon = "1900815182", Desc = "在战斗中，使角色的法攻提升500%"},--500%
    ['超级魔道法攻'] = {BuffID = 13054,Type = 1003,Grade = 5, Icon = "1900815182", Desc = "在战斗中，使角色的法攻提升800%"},--800%
	['低级天道物防'] = {BuffID = 13061,Type = 1004,Grade = 2, Icon = "1900815232", Desc = "在战斗中，使角色的物防提升2000点"},--2000
    ['中级天道物防'] = {BuffID = 13062,Type = 1004,Grade = 3, Icon = "1900815232", Desc = "在战斗中，使角色的物防提升5000点"},--5000
    ['高级天道物防'] = {BuffID = 13063,Type = 1004,Grade = 4, Icon = "1900815232", Desc = "在战斗中，使角色的物防提升15000点"},--15000
    ['超级天道物防'] = {BuffID = 13064,Type = 1004,Grade = 5, Icon = "1900815232", Desc = "在战斗中，使角色的物防提升20000点"},--20000
	['低级魔道物防'] = {BuffID = 13071,Type = 1004,Grade = 2, Icon = "1900815162", Desc = "在战斗中，使角色的物防提升100%"},--100%
    ['中级魔道物防'] = {BuffID = 13072,Type = 1004,Grade = 3, Icon = "1900815162", Desc = "在战斗中，使角色的物防提升300%"},--300%
    ['高级魔道物防'] = {BuffID = 13073,Type = 1004,Grade = 4, Icon = "1900815162", Desc = "在战斗中，使角色的物防提升500%"},--500%
    ['超级魔道物防'] = {BuffID = 13074,Type = 1004,Grade = 5, Icon = "1900815162", Desc = "在战斗中，使角色的物防提升800%"},--800%
	['低级天道法防'] = {BuffID = 13081,Type = 1005,Grade = 2, Icon = "1900815232", Desc = "在战斗中，使角色的法防提升2000点"},--2000
    ['中级天道法防'] = {BuffID = 13082,Type = 1005,Grade = 3, Icon = "1900815232", Desc = "在战斗中，使角色的法防提升5000点"},--5000
    ['高级天道法防'] = {BuffID = 13083,Type = 1005,Grade = 4, Icon = "1900815232", Desc = "在战斗中，使角色的法防提升15000点"},--15000
    ['超级天道法防'] = {BuffID = 13084,Type = 1005,Grade = 5, Icon = "1900815232", Desc = "在战斗中，使角色的法防提升20000点"},--20000
	['低级魔道法防'] = {BuffID = 13091,Type = 1005,Grade = 2, Icon = "1900815162", Desc = "在战斗中，使角色的法防提升100%"},--100%
    ['中级魔道法防'] = {BuffID = 13092,Type = 1005,Grade = 3, Icon = "1900815162", Desc = "在战斗中，使角色的法防提升300%"},--300%
    ['高级魔道法防'] = {BuffID = 13093,Type = 1005,Grade = 4, Icon = "1900815162", Desc = "在战斗中，使角色的法防提升500%"},--500%
    ['超级魔道法防'] = {BuffID = 13094,Type = 1005,Grade = 5, Icon = "1900815162", Desc = "在战斗中，使角色的法防提升800%"},--800%
	['低级天道物爆'] = {BuffID = 13101,Type = 1006,Grade = 2, Icon = "1900815222", Desc = "在战斗中，使角色的物爆提升800点"},--800
    ['中级天道物爆'] = {BuffID = 13102,Type = 1006,Grade = 3, Icon = "1900815222", Desc = "在战斗中，使角色的物爆提升1500点"},--1500
    ['高级天道物爆'] = {BuffID = 13103,Type = 1006,Grade = 4, Icon = "1900815222", Desc = "在战斗中，使角色的物爆提升3000点"},--3000
    ['超级天道物爆'] = {BuffID = 13104,Type = 1006,Grade = 5, Icon = "1900815222", Desc = "在战斗中，使角色的物爆提升4000点"},--4000
	--['低级魔道物爆'] = {BuffID = 1,Type = 1006,Grade = 2, Icon = "", Desc = ""},--50%
    --['中级魔道物爆'] = {BuffID = 2,Type = 1006,Grade = 3, Icon = "", Desc = ""},--100%
    --['高级魔道物爆'] = {BuffID = 3,Type = 1006,Grade = 4, Icon = "", Desc = ""},--125%
    --['超级魔道物爆'] = {BuffID = 4,Type = 1006,Grade = 5, Icon = "", Desc = ""},--150%
	['低级天道法爆'] = {BuffID = 13111,Type = 1007,Grade = 2, Icon = "1900815222", Desc = "在战斗中，使角色的法爆提升800点"},--800
    ['中级天道法爆'] = {BuffID = 13112,Type = 1007,Grade = 3, Icon = "1900815222", Desc = "在战斗中，使角色的法爆提升1500点"},--1500
    ['高级天道法爆'] = {BuffID = 13113,Type = 1007,Grade = 4, Icon = "1900815222", Desc = "在战斗中，使角色的法爆提升3000点"},--3000
    ['超级天道法爆'] = {BuffID = 13114,Type = 1007,Grade = 5, Icon = "1900815222", Desc = "在战斗中，使角色的法爆提升4000点"},--4000
	--['低级魔道法爆'] = {BuffID = 1,Type = 1007,Grade = 2, Icon = "", Desc = ""},--50%
    --['中级魔道法爆'] = {BuffID = 2,Type = 1007,Grade = 3, Icon = "", Desc = ""},--100%
    --['高级魔道法爆'] = {BuffID = 3,Type = 1007,Grade = 4, Icon = "", Desc = ""},--125%
    --['超级魔道法爆'] = {BuffID = 4,Type = 1007,Grade = 5, Icon = "", Desc = ""},--150%
	['低级天道命中'] = {BuffID = 13141,Type = 1008,Grade = 2, Icon = "1900814180", Desc = "在战斗中，使角色的命中提升2000点"},--2000
    ['中级天道命中'] = {BuffID = 13142,Type = 1008,Grade = 3, Icon = "1900814180", Desc = "在战斗中，使角色的命中提升5000点"},--5000
    ['高级天道命中'] = {BuffID = 13143,Type = 1008,Grade = 4, Icon = "1900814180", Desc = "在战斗中，使角色的命中提升15000点"},--15000
    ['超级天道命中'] = {BuffID = 13144,Type = 1008,Grade = 5, Icon = "1900814180", Desc = "在战斗中，使角色的命中提升20000点"},--20000
	--['低级魔道命中'] = {BuffID = 1,Type = 1008,Grade = 2, Icon = "", Desc = ""},--100%
    --['中级魔道命中'] = {BuffID = 2,Type = 1008,Grade = 3, Icon = "", Desc = ""},--300%
    --['高级魔道命中'] = {BuffID = 3,Type = 1008,Grade = 4, Icon = "", Desc = ""},--500%
    --['超级魔道命中'] = {BuffID = 4,Type = 1008,Grade = 5, Icon = "", Desc = ""},--800%
	['低级天道闪避'] = {BuffID = 13151,Type = 1009,Grade = 2, Icon = "1900815262", Desc = "在战斗中，使角色的闪避提升2000点"},--2000
    ['中级天道闪避'] = {BuffID = 13152,Type = 1009,Grade = 3, Icon = "1900815262", Desc = "在战斗中，使角色的闪避提升5000点"},--5000
    ['高级天道闪避'] = {BuffID = 13153,Type = 1009,Grade = 4, Icon = "1900815262", Desc = "在战斗中，使角色的闪避提升15000点"},--15000
    ['超级天道闪避'] = {BuffID = 13154,Type = 1009,Grade = 5, Icon = "1900815262", Desc = "在战斗中，使角色的闪避提升20000点"},--20000
	--['低级魔道闪避'] = {BuffID = 1,Type = 1009,Grade = 2, Icon = "", Desc = ""},--100%
    --['中级魔道闪避'] = {BuffID = 2,Type = 1009,Grade = 3, Icon = "", Desc = ""},--300%
    --['高级魔道闪避'] = {BuffID = 3,Type = 1009,Grade = 4, Icon = "", Desc = ""},--500%
    --['超级魔道闪避'] = {BuffID = 4,Type = 1009,Grade = 5, Icon = "", Desc = ""},--800%
	['低级天道封印'] = {BuffID = 13161,Type = 1010,Grade = 2, Icon = "1900815242", Desc = "在战斗中，使角色的封印提升800点"},--800
    ['中级天道封印'] = {BuffID = 13162,Type = 1010,Grade = 3, Icon = "1900815242", Desc = "在战斗中，使角色的封印提升1500点"},--1500
    ['高级天道封印'] = {BuffID = 13163,Type = 1010,Grade = 4, Icon = "1900815242", Desc = "在战斗中，使角色的封印提升3000点"},--3000
    ['超级天道封印'] = {BuffID = 13164,Type = 1010,Grade = 5, Icon = "1900815242", Desc = "在战斗中，使角色的抗封提升4000点"},--4000
	['低级天道抗封'] = {BuffID = 13171,Type = 1011,Grade = 2, Icon = "1900815650", Desc = "在战斗中，使角色的抗封提升50%"},--50%
    ['中级天道抗封'] = {BuffID = 13172,Type = 1011,Grade = 3, Icon = "1900815650", Desc = "在战斗中，使角色的抗封提升100%"},--100%
    ['高级天道抗封'] = {BuffID = 13173,Type = 1011,Grade = 4, Icon = "1900815650", Desc = "在战斗中，使角色的抗封提升125%"},--125%
    ['超级天道抗封'] = {BuffID = 13174,Type = 1011,Grade = 5, Icon = "1900815650", Desc = "在战斗中，使角色的抗封提升150%"},--150%
	['低级天道速度'] = {BuffID = 13121,Type = 1012,Grade = 2, Icon = "1900815272", Desc = "在战斗中，使角色的速度提升800点"},--800
    ['中级天道速度'] = {BuffID = 13122,Type = 1012,Grade = 3, Icon = "1900815272", Desc = "在战斗中，使角色的速度提升1500点"},--1500
    ['高级天道速度'] = {BuffID = 13123,Type = 1012,Grade = 4, Icon = "1900815272", Desc = "在战斗中，使角色的速度提升3000点"},--3000
    ['超级天道速度'] = {BuffID = 13124,Type = 1012,Grade = 5, Icon = "1900815272", Desc = "在战斗中，使角色的速度提升4000点"},--4000
	['低级魔道速度'] = {BuffID = 13131,Type = 1012,Grade = 2, Icon = "1900815202", Desc = "在战斗中，使角色的速度提升50%"},--50%
    ['中级魔道速度'] = {BuffID = 13132,Type = 1012,Grade = 3, Icon = "1900815202", Desc = "在战斗中，使角色的速度提升100%"},--100%
    ['高级魔道速度'] = {BuffID = 13133,Type = 1012,Grade = 4, Icon = "1900815202", Desc = "在战斗中，使角色的速度提升125%"},--125%
    ['超级魔道速度'] = {BuffID = 13134,Type = 1012,Grade = 5, Icon = "1900815202", Desc = "在战斗中，使角色的速度提升150%"},--150%
}

Act_Chikings.FightSkills = {
	--超强鸡力技能
	['阿瓦达索鸡'] = {BuffID = 202, Grade = 4, Icon = "1900814350", Desc = "战斗开始后，每回合结束时都有几率对敌方玩家造成99点鸡力值伤害。若本回合没有触发，则下回合的触发几率提高。每场战斗只生效一次"},
	['鸡不可失'] = {BuffID = 202, Grade = 4, Icon = "1900815040", Desc = "战斗开始后，可抵挡第一次受到的鸡力值伤害。每场战斗只生效一次"},
	['北鸣神功'] = {BuffID = 202, Grade = 4, Icon = "1900814460", Desc = "在战斗中，每次回合结束时，随机扣取对方0-5点鸡力值，并让自身恢复对应的鸡力值"},
	['九阴乌骨爪'] = {BuffID = 202, Grade = 4, Icon = "1900815790", Desc = "在战斗中，每回合扣取对方玩家5点鸡力值"},
	['大鸡大利'] = {BuffID = 202, Grade = 4, Icon = "1900803060", Desc = "进入战斗时，恢复20点鸡力值"},
	['闻鸡起舞'] = {BuffID = 202, Grade = 4, Icon = "1900817000", Desc = "进入战斗时，如果鸡力值大于80，则主角伤害提高100%"},
	['天鸡流星拳'] = {BuffID = 202, Grade = 4, Icon = "1900816640", Desc = "在战斗的第五回合结束后，对敌方玩家造成60点鸡力值伤害"},
	['天鸡将军'] = {BuffID = 202, Grade = 4, Icon = "1900816830", Desc = "在单数回合结束时，有几率对我方玩家造成30点鸡力值伤害，在双数回合时，有几率对敌方玩家造成30点鸡力值伤害"},
	['不讲鸡德'] = {BuffID = 202, Grade = 4, Icon = "1900816880", Desc = "若在战斗中不幸战败，对敌方玩家造成30点鸡力值伤害"},
	['鸡力与你同在'] = {BuffID = 202, Grade = 4, Icon = "1900817020", Desc = "在战斗中，如果鸡力值降低到1点，则鸡力值恢复至100。每场战斗只生效一次"},
	
	--普通鸡力技能
	['一条'] = {BuffID = 202, Grade = 3, Icon = "1900814490", Desc = "战斗开始后，额外获得一层战鸡祝福"},
	['金鸡'] = {BuffID = 202, Grade = 3, Icon = "1900803030", Desc = "进入战斗时，恢复5点鸡力值"},
	['先发制鸡'] = {BuffID = 202, Grade = 3, Icon = "1900815010", Desc = "在战斗的第一回合开始前，对敌方玩家造成10点鸡力值伤害，若该伤害被抵消，则自己受到10点鸡力值伤害"},
	['僚鸡'] = {BuffID = 202, Grade = 3, Icon = "1900814280", Desc = "在战斗中，你有10%的几率躲避来自敌方的鸡力值伤害。"},
	['恢鸡'] = {BuffID = 202, Grade = 3, Icon = "1900815710", Desc = "每回合开始前，恢复1点鸡力值"},
	['令箭'] = {BuffID = 202, Grade = 3, Icon = "1900816330", Desc = "第六回合开始前，获得一层战鸡祝福"},
	['绝地反鸡'] = {BuffID = 202, Grade = 3, Icon = "1900816830", Desc = "进入战斗时，如果鸡力值低于5点，则主角伤害提高100%"},
	['鸡爪功'] = {BuffID = 202, Grade = 3, Icon = "1900816540", Desc = "在战斗中，每回合扣取对方玩家2点鸡力值"},
	['后鸡之秀'] = {BuffID = 202, Grade = 3, Icon = "1900816570", Desc = "战斗胜利后，额外获得10秒的神鸡祝福时间"},
	['神鸡'] = {BuffID = 202, Grade = 3, Icon = "1900816580", Desc = "战斗胜利后，恢复10点鸡力值"},
}

--背包档位表
Act_Chikings.BagConfig = {
	[0] = 3,
	[1] = 6,
	[2] = 9,
	[3] = 12,
}

Act_Chikings.Bag = {
	['铜鱼袋'] = {BuffID = 202, Grade = 3, ConfigIndex = 1, Icon = "1900013730", Desc = "不大不小的口袋，也许能派上什么用场。额外解锁3格鸡王争霸赛行囊。"},
	['银鱼袋'] = {BuffID = 202, Grade = 4, ConfigIndex = 2, Icon = "1900013750", Desc = "非常实用的口袋，有了它定能在比赛中夺魁。额外解锁6格鸡王争霸赛行囊。"},
	['金鱼袋'] = {BuffID = 202, Grade = 5, ConfigIndex = 3, Icon = "1900013760", Desc = "本朝时尚时尚最时尚的口袋，据说能装下乾坤。额外解锁9格鸡王争霸赛行囊。"},
}

--移速档位表 越大则越慢
Act_Chikings.SpeedConfig = {
	[0] = 100,
	[1] = 85,
	[2] = 70,
	[3] = 60,
}

Act_Chikings.Shoes = {
	['草鞋'] = {BuffID = 202, Grade = 3, ConfigIndex = 1, Icon = "1900110430", Desc = "普普通通的草鞋。穿上它，你觉得走路没那么累了。"},
	['跑步靴'] = {BuffID = 202, Grade = 4, ConfigIndex = 2, Icon = "1900110470", Desc = "做工很好的靴子，一看就是名牌货。穿上它，你健步如飞。"},
	['赛筋斗'] = {BuffID = 202, Grade = 5, ConfigIndex = 3, Icon = "1900110480", Desc = "看起来并不像一双鞋，但格外惹眼，鞋侧面有一行小字：牙买加博某人专用。穿上它，你仿佛置身在奥运会的跑道上。"},
}

--背包档位表
Act_Chikings.ViewConfig = {
	[0] = 40,
	[1] = 60,
	[2] = 80,
	[3] = 100,
}


Act_Chikings.Eye = {
	['凸面镜'] = {BuffID = 202, Grade = 3, ConfigIndex = 1, Icon = "1900099950", Desc = "借助它，你可以稍微看远一点。"},
	['超清凸面镜'] = {BuffID = 202, Grade = 4, ConfigIndex = 2, Icon = "1900099960", Desc = "借助它，你可以看得更远一些。"},
	['千里眼'] = {BuffID = 202, Grade = 5, ConfigIndex = 3, Icon = "1900099970", Desc = "虽然是能令我看得最远的设备，但我显然觉得这还远远不够。"},
}

Act_Chikings.Item = {
	['银坷垃'] = {Grade = 2, Icon = "1900000270", Type = "恢复", UseSec = 5, Val = 20, Desc = "食用后十分清醒，鸡力值恢复20点。只能在战斗外使用。"},
	['金坷垃'] = {Grade = 4, Icon = "1900000290", Type = "恢复", UseSec = 8, Val = 80, Desc = "食用后有如神助，鸡力值恢复80点。只能在战斗外使用。"},
	['鸡王神符'] = {Grade = 5, Icon = "1900000390", Type = "空投", UseSec = 3, Val = 15, Desc = "使用后，将在附近召唤一个鸡王至宝！"},
	['遁走符'] = {Grade = 4, Icon = "1900000410", Type = "复活", Val = 1, Desc = "无法使用，如果你在战斗中不幸被击败。你可以通过遁走符逃至随机区域。生效后遁走符消失。"},
	['隐形药水'] = {Grade = 4, Val = 20, Type = "隐形", UseSec = 2, Icon = "1900000320", Desc = "使用后的10秒内，其他玩家将无法再看到你，显形前你将无法移动，且显形时对周围的玩家造成20点鸡力值伤害！"},
}

--陷阱功能表
Act_Chikings.Trap = {
	['眩晕小烟花'] = {BuffID = 202, Grade = 2, EffectID = 3000001769, Type = "眩晕", Val = 5, Icon = "1900001370", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家眩晕5秒！"},
	['眩晕大烟花'] = {BuffID = 202, Grade = 3, EffectID = 3000001648, Type = "眩晕", Val = 8, Icon = "1900001370", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家眩晕8秒！"},
	['眩晕狗粮'] = {BuffID = 202, Grade = 4, EffectID = 3000001618, Type = "眩晕", Val = 12, Icon = "1900001370", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家眩晕12秒！"},
	['小毒散'] = {BuffID = 202, Grade = 2, EffectID = 3000001526, Type = "中毒", Val = 10, Icon = "1900000020", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到2点鸡力值伤害，持续10秒"},
	['大毒散'] = {BuffID = 202, Grade = 3, EffectID = 3000001549, Type = "中毒", Val = 20, Icon = "1900000020", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到2点鸡力值伤害，持续20秒"},
	['剧毒散'] = {BuffID = 202, Grade = 4, EffectID = 3000001591, Type = "中毒", Val = 30, Icon = "1900000020", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到2点鸡力值伤害，持续30秒"},
	['手里剑'] = {BuffID = 202, Grade = 2, EffectID = 3000001535, Type = "鸡力伤害", Val = 10, Icon = "1900013870", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到10点鸡力值伤害！"},
	['夺命飞刀'] = {BuffID = 202, Grade = 3, EffectID = 3000001683, Type = "鸡力伤害", Val = 20, Icon = "1900013870", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到20点鸡力值伤害！"},
	['血滴子'] = {BuffID = 202, Grade = 4, EffectID = 3000001695, Type = "鸡力伤害", Val = 30, Icon = "1900013870", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家受到50点鸡力值伤害！"},
	['绊马索'] = {BuffID = 202, Grade = 4, EffectID = 0, Type = "缓速", Val = 20, Icon = "1900000150", Desc = "在石像上布置一个陷阱，令下一个接触石像的玩家的移速受损，持续20秒！！"},
}

--Debuff表
Act_Chikings.Debuffs = {
	['眩晕'] = {Icon = "1900816000",EffectID = 3000, Desc = "你被眩晕了，无法进行任何行动————至少看起来无法行动。"},
	['中毒'] = {Icon = "1900816750",EffectID = 3001, Desc = "你中毒了，每秒丢失2点鸡力值！"},
	['缓速'] = {Icon = "1900814310",EffectID = 3002, Desc = "你被缓速了，你现在像乌龟爬得一样慢。"},
}

--地图时间表
Act_Chikings.SecConfig = {
	{0,0,0},		--0秒开始，每秒扣除0鸡力值，本阶段减少0个石像
	{20,0,0, "10秒后进入下一阶段，地图污染值将达到1"},		
	--0秒开始，每秒扣除0鸡力值，本阶段减少0个石像
	{30,1,0, "争霸赛环境恶化，污染值达到1，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！"},
	--30秒开始，每秒扣除1鸡力值，本阶段减少0个石像
	{170,0,0, "10秒后进入下一阶段，将有10座石像被损毁，请大家多加小心！"},
	{180,1,10, "争霸赛环境恶化，有10座石像被损毁了！"},		
	--180秒开始，每秒扣除1鸡力值，本阶段减少10个石像
	{290,1,0, "10秒后进入下一阶段，地图污染值将达到2，且有5座石像将被损毁，请大家多加小心！"},
	{300,2,5, "争霸赛环境恶化，污染值达到2，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！且有5座石像被损毁了！"},		
	--300秒开始，每秒扣除2鸡力值，本阶段减少5个石像
	{410,2,0, "10秒后进入下一阶段，地图污染值将达到4，且有4座石像将被损毁，请大家多加小心！"},
	{420,4,5, "争霸赛环境恶化，污染值达到4，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！且有5座石像被损毁了！"},		
	--420秒开始，每秒扣除4鸡力值，本阶段减少4个石像
	{530,4,0, "10秒后进入下一阶段，地图污染值将达到7，且有4座石像将被损毁，请大家多加小心！"},		
	{540,7,4, "争霸赛环境恶化，污染值达到7，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！且有4座石像被损毁了！"},		
	--540秒开始，每秒扣除7鸡力值，本阶段减少3个石像
	{620,7,0, "10秒后进入下一阶段，地图污染值将达到10，且有2座石像将被损毁，请大家多加小心！"},
	{630,10,2, "争霸赛环境恶化，污染值达到10，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！且有2座石像被损毁了！"},		
	--630秒开始，每秒扣除10鸡力值，本阶段减少2个石像
	{650,10,0, "10秒后进入下一阶段，地图污染值将达到40，且有1座石像将被损毁，请大家多加小心！"},
	{660,40,1, "争霸赛环境恶化，污染值达到40，如果没有神鸡祝福加持，每秒将受到鸡力值伤害！且有1座石像被损毁了！"},		
	--660秒开始，每秒扣除40鸡力值，本阶段减少1个石像
}




--------------------------------------------
------------------奖励预览------------------

Act_Chikings.ShowItem = "20910,20737,28146,31060,20283"

Act_Chikings.Reward = {
	[1]  = {"高级宝石福袋",3,"SSR礼包",3,"7级自选宝石",1,"宠物装备强化石3",5,"变异吞噬宠物",1},
	[2]  = {"高级宝石福袋",2,"SSR礼包",1,"5级自选宝石",1,"宠物装备强化石2",5},
	[3]  = {"高级宝石福袋",1,"SSR礼包",1},
	[4]  = {"高级宝石福袋",1},
	[5]  = {"高级宝石福袋",1},
	[6]  = {"高级宝石福袋",1},
	[7]  = {"4级宝石福袋",1},
	[8]  = {"4级宝石福袋",1},
	[9]  = {"4级宝石福袋",1},
	[10] = {"4级宝石福袋",1},
	[11] = {"宝石福袋",1},
	[12] = {"宝石福袋",1},
	[13] = {"宝石福袋",1},
	[14] = {"宝石福袋",1},
	[15] = {"宝石福袋",1},
	[16] = {"1级宝石包",1},
	[17] = {"1级宝石包",1},
	[18] = {"1级宝石包",1},
	[19] = {"1级宝石包",1},
	[20] = {"1级宝石包",1},
}

--------------------------------------------
------------------非修改项------------------

Act_Chikings.FightTag = 1200000		--实际上占用了1000000 - 1100000


-- 活动开始前回调(半小时)
function Act_Chikings.OnDeclare(id, seconds)
	
end

-- 活动开始回调
function Act_Chikings.OnStart(id, is_normal)
	sLuaApp:LuaDbg("Act_Chikings.OnStart")
	if PersonsActMatch then
		PersonsActMatch.CreateActData(0, 1, id, "Act_Chikings.PlayerAddMatching(player)", 1801720050, 1, "Act_Chikings.PlayerCancelMatching(player)")
	end
	
	sVarSystem:SetInt("ACTIVITY_Act_Chikings_Stage", 1)
end

-- 玩家客户端查询数据回调
function Act_Chikings.OnQuery(id, player)
	local JoinNum = player:GetDayInt("Act_Chikings_JoinNum")
	local MaxJoinNum = Act_Chikings.JoinNum or 0
	local str = JoinNum..[[:]]..MaxJoinNum..[[:0:0:]]..Act_Chikings.ShowItem..[[:1:2,3,5]]
	
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

function Act_Chikings.NoticeToAll()
	
end

function Act_Chikings.NoticeToAllEx(player)
	sLuaApp:NotifyTipsMsg(player, "帮派战场开始在即，10秒后将被传送至复活点！")
end

function Act_Chikings.TenSecStart()
	sVarSystem:SetInt("ACTIVITY_Act_Chikings_SafeZoneState",1)
	for i = 1, 11 do
		if Data['ACTIVITY_Act_Chikings_MapList'] then
			for k,v in pairs(Data['ACTIVITY_Act_Chikings_MapList']) do
				local map = sMapSystem:GetMapByGUID(v)
				sLuaTimerSystem:AddTimerEx(map,1000*i,1,"Act_Chikings.MapCheck",""..(10-i+1))
				if i == 1 then
					sMapSystem:ForeachCall(map, "Act_Chikings", "PlayerReset", "")
				end
				--测试用
				if i == 11 then
					Act_Chikings.OnStart(99, true)
				end
				--测试用结束
			end
		end
	end
end

-- 初始化时间戳
function Act_Chikings.StampIntialization()

end

-- 活动结束回调
function Act_Chikings.OnStop(id)
	--匹配帮会
	sLuaApp:LuaDbg("开始关闭吃鸡活动")
	
	sVarSystem:SetInt("ACTIVITY_Act_Chikings_Stage", 0)
	if PersonsActMatch then
		PersonsActMatch.CleanActData(id)
	end
end

-- 玩家点击参与活动回调
function Act_Chikings.OnJoin(id, player)
	Lua_tools.MoveToNpc(player, 62150)
end

--测试用
function Act_Chikings.ComeInTest()
	
end

--玩家加入匹配
function Act_Chikings.PlayerAddMatching(player)
	sLuaApp:LuaDbg(""..player:GetName().."尝试匹配")
	if not player then
		return
	end
	if Act_Chikings.JoinNum and Act_Chikings.JoinNum ~= 0 then
		if player:GetDayInt("Act_Chikings_JoinNum") >= Act_Chikings.JoinNum then
			PersonsActMatch.EndMatch(player)
			sLuaApp:NotifyTipsMsg(player, "当前参与次数已达上限")
			return
		end	
	end

	if player:GetMapKeyName() == "鸡王争霸赛" then
		PersonsActMatch.EndMatch(player)
		sLuaApp:LuaDbg(""..player:GetName().."在鸡王争霸赛中尝试匹配")
		return
	end
	if player:IsFightState() then
		PersonsActMatch.EndMatch(player)
		return
	end
	if player:IsFightState("Assist_GoOn") == 1 then
		PersonsActMatch.EndMatch(player)
		return
	end
	local CanAddMap = 0
	if not Data.Act_Chikings then
		Data.Act_Chikings = {}
	end
	if not Data.Act_Chikings.MatchingMapList then
		Data.Act_Chikings.MatchingMapList = {}
	end
	if not Data.Act_Chikings.MatchingMapsEx then
		Data.Act_Chikings.MatchingMapsEx = {}
	end
	for k,v in ipairs(Data.Act_Chikings.MatchingMapList) do
		if Data.Act_Chikings.MatchingMaps['Map_'..v] then
			if not Data.Act_Chikings.MatchingMapsEx['Map_'..v] then
				Data.Act_Chikings.MatchingMapsEx['Map_'..v] = 0
			end
			if Data.Act_Chikings.MatchingMapsEx['Map_'..v] + Data.Act_Chikings.MatchingMaps['Map_'..v] < Act_Chikings.MaxPlayers then
				sLuaApp:LuaDbg("检测到当前地图中玩家 = " ..Data.Act_Chikings.MatchingMaps['Map_'..v] .. "  已弹窗玩家 = " .. Data.Act_Chikings.MatchingMapsEx['Map_'..v])
				CanAddMap = v
				break
			end
		end
	end
	if CanAddMap == 0 then
		sLuaApp:LuaDbg(""..player:GetName().."进入空图匹配")
		if not Data.Act_Chikings.WaitingPlayers then
			Data.Act_Chikings.WaitingPlayers = {}
		end
		table.insert(Data.Act_Chikings.WaitingPlayers, player:GetGUID())
		if #Data.Act_Chikings.WaitingPlayers >= Act_Chikings.LowerPlayers then
			Act_Chikings.CreateMap()
			for k,v in ipairs(Data.Act_Chikings.WaitingPlayers) do
				Act_Chikings.PlayerAddMatching(sPlayerSystem:GetPlayerByGUID(v))
			end
			Data.Act_Chikings.WaitingPlayers = {}
		end
	else
		sLuaApp:LuaDbg(""..player:GetName().."进入有图匹配")
		Data.Act_Chikings.MatchingMapsEx['Map_'..CanAddMap] = Data.Act_Chikings.MatchingMapsEx['Map_'..CanAddMap] + 1
		player:SetInt("Act_Chickings_MatchingMap", CanAddMap)
		local msg = "【鸡王争霸赛】匹配成功！立即进入比赛地图吗？"
		local str = [[
			GlobalUtils.ShowServerBoxMessageEx("]]..msg..[[")
			GlobalProcessing.EquipAutoUseState(0)
		]]
		player:SetString("SYSTEM_ConfirmBox_Function", "Act_Chikings.ConfirmJoin(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
		player:SetString("SYSTEM_ConfirmBox_Function_Cancel", "Act_Chikings.CancelJoin(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."))")
		sLuaApp:ShowForm(player, "脚本表单", str)
		PersonsActMatch.MatchSuccess(player)
	end
end

--玩家取消匹配
function Act_Chikings.PlayerCancelMatching(player)
	local playerGUID = player:GetGUID()
	if Data.Act_Chikings.WaitingPlayers then
		for k,v in ipairs(Data.Act_Chikings.WaitingPlayers) do
			if v == playerGUID then
				table.remove(Data.Act_Chikings.WaitingPlayers, k)
				PersonsActMatch.EndMatch(player)
			end
		end
	end
end

--玩家确认进入地图
function Act_Chikings.ConfirmJoin(player)
	local playerGUID = player:GetGUID()
	local MapGUID = player:GetInt("Act_Chickings_MatchingMap")
	local Map = sMapSystem:GetMapByGUID(MapGUID)
	if Map then
		if Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] then
			Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] = Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] - 1
		end
		if Map:GetInt("GameState") >= 2 then
			sLuaApp:NotifyTipsMsg(player, "对战已经开始了，请参加下一次活动")
			PersonsActMatch.EndMatch(player)
			return
		end
		sMapSystem:Jump(player, Map, 150, 167, 60)
	else
		sLuaApp:NotifyTipsMsg(player, "对战已经结束了，请参加下一次活动")
		PersonsActMatch.EndMatch(player)
		return
	end
end

--玩家取消进入地图
function Act_Chikings.CancelJoin(player, isFromMap)
	sLuaApp:LuaDbg(player:GetName().."取消匹配")
	local playerGUID = player:GetGUID()
	local MapGUID = player:GetInt("Act_Chickings_MatchingMap")
	player:SetInt("Act_Chickings_MatchingMap", 0)
	local Map = sMapSystem:GetMapByGUID(MapGUID)
	PersonsActMatch.EndMatch(player)
	if Map then
		sLuaApp:LuaDbg(player:GetName().."从地图离开")
		if not isFromMap then
			if Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] then
				Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] = Data.Act_Chikings.MatchingMapsEx['Map_'..MapGUID] - 1
			end
		end
		if Data.Act_Chikings.WaitingPlayers then
			if #Data.Act_Chikings.WaitingPlayers > 0 then
				local new_add = Data.Act_Chikings.WaitingPlayers[1]
				table.remove(Data.Act_Chikings.WaitingPlayers, 1)
				Act_Chikings.PlayerAddMatching(sPlayerSystem:GetPlayerByGUID(new_add))
				sLuaApp:LuaDbg(sPlayerSystem:GetPlayerByGUID(new_add):GetName().."替补进入")
			end
		end
	end
end

--地图创建
function Act_Chikings.CreateMap()
	sLuaApp:LuaDbg("创建吃鸡地图")
	local Map = sMapSystem:CreateDungeon(Act_Chikings.MapID)
	
	Map:SetInt("GameState",1)
	if Data then
		if not Data.Act_Chikings then
			Data.Act_Chikings = {}			
		end
		if not Data.Act_Chikings.Maps then
			Data.Act_Chikings.Maps = {}
		end
		local GUID = Map:GetGUID()
		
		table.insert(Data.Act_Chikings.Maps, GUID)
		
		if not Data.Act_Chikings.MatchingMaps then
			Data.Act_Chikings.MatchingMaps = {}
		end
		if not Data.Act_Chikings.MatchingMapList then
			Data.Act_Chikings.MatchingMapList = {}
		end
		
		Data.Act_Chikings.MatchingMaps['Map_'..GUID] = 0
		table.insert(Data.Act_Chikings.MatchingMapList, GUID)
		sLuaApp:LuaDbg("创建地图 " .. GUID)
		
		sLuaTimerSystem:AddTimerEx(Map,Act_Chikings.MatchSec*1000,1,"Act_Chikings.MapReady",""..GUID)
		Map:SetInt('NextStateSec', sLuaApp:SecondSinceEpoch(0) + Act_Chikings.MatchSec)
		
		sTriggerSystem:AddTrigger(Map, TRIGGER_ON_PRE_JUMP_MAP, "Act_Chikings", "on_pre_jump_map")
		
		sTriggerSystem:AddTrigger(Map, TRIGGER_ON_ENTER_MAP, "Act_Chikings", "EnterMap")
		sTriggerSystem:AddTrigger(Map, TRIGGER_ON_LEAVE_MAP, "Act_Chikings", "LeaveMap")
		
		Act_Chikings.Testmap = Map
		Data.Testmap = GUID
	end
end

function Act_Chikings.on_pre_jump_map(player, to_map)
	sLuaApp:LuaDbg("玩家尝试退出地图")
	if player:GetInt("Act_Chikings_CanLeave") == 1 then
		player:SetInt("Act_Chikings_CanLeave",0)
		return true
	end
	sLuaApp:LuaDbg("玩家尝试退出地图失败")
	return false
end

function Act_Chikings.LeaveMapByClick(player)
	Act_Chikings.BecomeBox(player, 100)
	Act_Chikings.PlayerOut(player)
end

--数据清理
function Act_Chikings.ClearData()
	if Data.Act_Chikings.MatchingMapList then
		for k,v in ipairs(Data.Act_Chikings.MatchingMapList) do
			Act_Chikings.BreakMap(sMapSystem:GetMapByGUID(v), v)
		end
	end
	if Data.Act_Chikings.WaitingPlayers then
		Data.Act_Chikings.WaitingPlayers = {}
	end
end

--倒计时时间
function Act_Chikings.MapReady(map, timer, GUID)
	if map:GetInt("GameState") ~= 1 then
		return
	end
	map:SetInt("GameState",2)
	if Data.Act_Chikings.MatchingMapList then
		for k,v in ipairs(Data.Act_Chikings.MatchingMapList) do
			if map:GetGUID() == v then
				table.remove(Data.Act_Chikings.MatchingMapList, k)
			end
		end
	end
	local playerList = map:GetAllPlayers()
	if #playerList < Act_Chikings.LowerPlayers then
		Act_Chikings.BreakMap(map, GUID)
		return
	end
	
	
	sLuaTimerSystem:AddTimerEx(map,Act_Chikings.ReadySec*1000,1,"Act_Chikings.BornSelect",""..GUID)
	local NextSecPoint = sLuaApp:SecondSinceEpoch(0) + Act_Chikings.ReadySec
	map:SetInt('NextStateSec', NextSecPoint)
	for k,v in ipairs(playerList) do
		sLuaApp:ShowForm(v, "脚本表单", "TrackUI.SetBattleRoyaleState(2,"..NextSecPoint..")")	
		sLuaApp:NotifyTipsMsg(v, "进入准备阶段！！！！")
	end
	
end

--销毁地图
function Act_Chikings.BreakMap(map, GUID)
	if map then
		sMapSystem:DestroyDungeon(map)
		Data.Act_Chikings.MatchingMaps['Map_'..GUID] = nil
	end
end

--选择出生点阶段
function Act_Chikings.BornSelect(map, timer, GUID)
	if map:GetInt("GameState") ~= 2 then
		return
	end
	map:SetInt("GameState",3)
	local playerList = map:GetAllPlayers()
	local NextSecPoint = sLuaApp:SecondSinceEpoch(0) + Act_Chikings.BornSec
	map:SetInt('NextStateSec', NextSecPoint)
	for k,v in ipairs(playerList) do
		--发送选择地图表单
		v:SetString("Act_Chickings_BornChoose", "")
		sLuaApp:ShowForm(v, "脚本表单", "TrackUI.SetBattleRoyaleState(3,"..NextSecPoint..")")
		sLuaApp:NotifyTipsMsg(v, "进入选择出生点阶段！！！！")
	end
	
	sLuaTimerSystem:AddTimerEx(map,Act_Chikings.BornSec*1000,1,"Act_Chikings.GameStart",""..GUID)
end

function Act_Chikings.ChooseBorn(player, KeyName)
	local map = player:GetMap()
	if map:GetInt("GameState") ~= 3 then
		return
	end
	if player:GetString("Act_Chickings_BornChoose") ~= "" then
		return
	end
	if Act_Chikings.BornPoint[KeyName] then
		player:SetString("Act_Chickings_BornChoose", KeyName)
		--sLuaApp:ShowForm(player, "脚本表单", "if TrackUI then TrackUI.BattleRoyaleBornChoose('"..KeyName.."') end")
	end
end

function Act_Chikings.GameStart(map)
	local AllPlayers = map:GetAllPlayers()
	if #AllPlayers < 2 then
		Act_Chikings.LeaveMap(AllPlayers[1], map)
		sLuaApp:NotifyTipsMsg(AllPlayers[1], "人数不足，无法开始！！！！")
		return
	end
	map:SetInt("GameState",4)
	local GUID = map:GetGUID()
	if not Data.Act_Chikings then
		Data.Act_Chikings = {}			
	end
	if not Data.Act_Chikings.MatchingMaps then
		Data.Act_Chikings.MatchingMaps = {}
	end
	Data.Act_Chikings.MatchingMaps['Map_'..GUID .. '_Npcs'] = {}
	for k,v in pairs(Act_Chikings.BornPoint) do
		--创建石头人
		local NPC = sNpcSystem:CreateNpc(22504, map, v.PosX, v.PosY, 18, 4, 0)
		if not NPC then
			sLuaApp:LuaErr("地图配置出错" .. k)
		end
		table.insert(Data.Act_Chikings.MatchingMaps['Map_'..GUID .. '_Npcs'], NPC:GetGUID())
		NPC:SetString('ZoneName', k)
		--sLuaApp:LuaErr("地图配置成功" .. k)
	end
	for k,v in ipairs(Act_Chikings.ChestPoint) do
		--创建宝箱
		local ChestLv = 1
		if sLuaApp:RandInteger(1,10000) <= v.Chest*v.Chest and sLuaApp:RandInteger(1,100) <= 80 then
			ChestLv = ChestLv + 1
			if sLuaApp:RandInteger(1,1000) < v.Chest and sLuaApp:RandInteger(1,100) <= 50 then
				ChestLv = ChestLv + 1
			end
		end
		local Chest = sNpcSystem:CreateNpc(22500+ChestLv, map, v.PosX, v.PosY, 0, v.Rot, 0)
		if not Chest then
			sLuaApp:LuaErr("宝箱配置出错" .. v.PosX .."," .. v.PosY .."," .. v.Rot)
		end
		local RandTb = Act_Chikings.ChestLevel['Chest_'..ChestLv]
		if #RandTb > 1 then
			Chest:SetString("ChestMark", RandTb[sLuaApp:RandInteger(1,#RandTb)])
		elseif #RandTb == 1 then
			Chest:SetString("ChestMark", RandTb[1])
		else
			sNpcSystem:DestroyNpc(Chest)
		end
	end
	
	
	local AllPlayers = map:GetAllPlayers()
	local BornStr = {}
	for k,v in pairs(Act_Chikings.BornPoint) do
		table.insert(BornStr, k)
	end
	for k,v in ipairs(AllPlayers) do
		v:SetInt("Act_Chickings_Bless", 30)
		Data.Act_Chikings[''..v:GetGUID()..'_Buffs']['神鸡祝福'] = 30
		v:SetInt("Act_Chikings_Damage", 0)
		local bornIndex = v:GetString("Act_Chickings_BornChoose")
		local BornConfig = Act_Chikings.BornPoint[bornIndex]
		if not BornConfig then
			BornConfig = Act_Chikings.BornPoint[BornStr[sLuaApp:RandInteger(1,#BornStr)]]
		end
		sMapSystem:Jump(v, map, BornConfig.PosX, BornConfig.PosY, BornConfig.Range)
		sLuaApp:NotifyTipsMsg(v, "竞赛开始！！！！")
		sLuaApp:ShowForm(v, "脚本表单", "TrackUI.SetBattleRoyaleState(4,0)")	
		--增加参与次数
		if Act_Chikings.JoinNum and Act_Chikings.JoinNum ~= 0 then
			v:SetDayInt("Act_Chikings_JoinNum",v:GetDayInt("Act_Chikings_JoinNum") + 1)
		end
	end
	map:SetInt("StartPlayerNum",#AllPlayers)
	
	if Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Add'] then
		sLuaTimerSystem:DisableTimer(Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Add'])
	end
	Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Add'] = sLuaTimerSystem:AddTimerEx(map, 1000, -1, "Act_Chikings.SecondAdd","0")
	if Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Check'] then
		sLuaTimerSystem:DisableTimer(Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Check'])
	end
	Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Check'] = sLuaTimerSystem:AddTimerEx(map, 1000, -1, "Act_Chikings.TimeCheck","0")
	
	sTriggerSystem:AddTrigger(map, TRIGGER_ON_ENCOUNTER, "Act_Chikings", "on_encounter")
	
	Act_Chikings.RefreshStone(map)
	
	--sLuaTimerSystem:AddTimerEx(player:GetMap(), 1000, -1, "Act_Chikings.SecondAdd","0")
	--sLuaTimerSystem:AddTimerEx(player:GetMap(), 1000, -1, "Act_Chikings.TimeCheck","0")
end

function Act_Chikings.PlayerRelogin(player)	--玩家relogin
	if not Act_Chikings.BornPoint_Str then
		Act_Chikings.BornPoint_Str = Lua_tools.serialize(Act_Chikings.BornPoint)
	end
	if not Act_Chikings.FightBuffs_Str then
		Act_Chikings.FightBuffs_Str = Lua_tools.serialize(Act_Chikings.FightBuffs)
	end
	if not Act_Chikings.FightSkills_Str then
		Act_Chikings.FightSkills_Str = Lua_tools.serialize(Act_Chikings.FightSkills)
	end
	if not Act_Chikings.Bag_Str then
		Act_Chikings.Bag_Str = Lua_tools.serialize(Act_Chikings.Bag)
	end
	if not Act_Chikings.Shoes_Str then
		Act_Chikings.Shoes_Str = Lua_tools.serialize(Act_Chikings.Shoes)
	end
	if not Act_Chikings.Eye_Str then
		Act_Chikings.Eye_Str = Lua_tools.serialize(Act_Chikings.Eye)
	end
	if not Act_Chikings.Item_Str then
		Act_Chikings.Item_Str = Lua_tools.serialize(Act_Chikings.Item)
	end
	if not Act_Chikings.Trap_Str then
		Act_Chikings.Trap_Str = Lua_tools.serialize(Act_Chikings.Trap)
	end
	if not Act_Chikings.Debuff_Str then
		Act_Chikings.Debuff_Str = Lua_tools.serialize(Act_Chikings.Debuffs)
	end
	
	local map = player:GetMap()
	
	local map_state = map:GetInt("GameState")
	local next_sec = map:GetInt("NextStateSec")
	
	local str = [[
		TrackUI.SwitchFightInfo4OrBattleBagNode(false)
		TrackUI.Act_Chickings_Attr = {}
		TrackUI.Act_Chickings_Config = {}
		TrackUI.Act_Chickings_Data = {}
		TrackUI.Act_Chickings_Debuff = {}
		TrackUI.Act_Chickings_Config.BornPoint = ]]..Act_Chikings.BornPoint_Str..[[
		TrackUI.Act_Chickings_Config.FightBuffs = ]]..Act_Chikings.FightBuffs_Str..[[
		TrackUI.Act_Chickings_Config.FightSkills = ]]..Act_Chikings.FightSkills_Str..[[
		TrackUI.Act_Chickings_Config.Bag = ]]..Act_Chikings.Bag_Str..[[
		TrackUI.Act_Chickings_Config.Shoes = ]]..Act_Chikings.Shoes_Str..[[
		TrackUI.Act_Chickings_Config.Eye = ]]..Act_Chikings.Eye_Str..[[
		TrackUI.Act_Chickings_Config.Item = ]]..Act_Chikings.Item_Str..[[
		TrackUI.Act_Chickings_Config.Trap = ]]..Act_Chikings.Trap_Str..[[
		TrackUI.Act_Chickings_Config.Debuff = ]]..Act_Chikings.Debuff_Str..[[
		
		TrackUI.SetBattleRoyaleState(]]..map_state..[[,]]..next_sec..[[)
		TrackUI.UpdateBattleRoyaleInfo()
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	Act_Chikings.Refresh(player)
	
	if player:IsFightState() then
		if player:GetInt("Act_Chikings_InFight") == 1 then
			sLuaApp:ShowForm(player,"脚本表单", "GUI.OpenWnd('BattleRoyaleFightUI') BattleRoyaleFightUI.Refresh("..Data.Act_Chikings[''..player:GetGUID()..'_Buffs']['战鸡祝福']..","..map:GetInt("Act_Chikings_Deduct")..")")
		end
	else
		player:SetInt("Act_Chikings_IsFight", 0)
		player:SetInt("Act_Chikings_InFight", 0)
	end
end

function Act_Chikings.EnterMap(player, map)	--玩家进入地图
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_LOGIN, "Act_Chikings", "PlayerRelogin")
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_RELOGIN, "Act_Chikings", "PlayerRelogin")
	
	player:SetDynAttrsByMark(PlayerAttrClassify.Act_Chickings, 0)
	
	player:SetInt("Act_Chikings_Hp_Max",100)	--鸡力值最大值
	player:SetInt("Act_Chikings_Hp",100)	--初始鸡力值
	player:SetInt("Act_Chikings_Kill",0)	--淘汰数
	player:SetInt("Act_Chikings_Bag",0)		--背包档位
	player:SetInt("Act_Chikings_Speed",0)	--移速档位
	player:SetInt("Act_Chikings_View",0)	--视野档位
	player:SetString("Act_Chikings_BagName","")	--背包名字
	player:SetString("Act_Chikings_ShoesName","")	--移速名字
	player:SetString("Act_Chikings_EyeName","")	--视野名字
	
	player:SetInt("Activity_Effect_1", 0)
	player:SetInt("Activity_Effect_2", 0)
	player:SetInt("Activity_Effect_3", 0)
	player:SetInt("Activity_Effect_4", 0)
	player:SetInt("Activity_Effect_5", 0)
	
	player:SetInt("Act_Chikings_Enemy",0)
	player:SetInt("Act_Chikings_FightEnemy", 0)
	
	Data.Act_Chikings[''..player:GetGUID()..'_Bags'] = {}

	local nowSpeed = player:GetAttr(ROLE_ATTR_MOVE_SPEED)
	local SpeedVal = Act_Chikings.SpeedConfig[0] - nowSpeed
	player:SetInt("Act_Chikings_Slowly", 0)
	player:SetDynAttr(PlayerAttrClassify.Act_Chickings, ROLE_ATTR_MOVE_SPEED, SpeedVal)
	--player:SetViewRange(Act_Chikings.ViewConfig[0])
	player:RecalcAttr()
	--Act_Chikings.RefreshSpeed(player)
	
	local playerGUID = player:GetGUID()
	Data.Act_Chikings[''..playerGUID..'_Bags'] = {}
	Data.Act_Chikings[''..playerGUID..'_Buffs'] = {}
	Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
	
	sLuaApp:LuaDbg("map type =========== " .. type(map))
	local GUID = map:GetGUID()
	sLuaApp:LuaDbg("GUID ========== " .. GUID)
	
	Data.Act_Chikings.MatchingMaps['Map_'..GUID] = Data.Act_Chikings.MatchingMaps['Map_'..GUID] + 1
	
	if not Act_Chikings.BornPoint_Str then
		Act_Chikings.BornPoint_Str = Lua_tools.serialize(Act_Chikings.BornPoint)
	end
	if not Act_Chikings.FightBuffs_Str then
		Act_Chikings.FightBuffs_Str = Lua_tools.serialize(Act_Chikings.FightBuffs)
	end
	if not Act_Chikings.FightSkills_Str then
		Act_Chikings.FightSkills_Str = Lua_tools.serialize(Act_Chikings.FightSkills)
	end
	if not Act_Chikings.Bag_Str then
		Act_Chikings.Bag_Str = Lua_tools.serialize(Act_Chikings.Bag)
	end
	if not Act_Chikings.Shoes_Str then
		Act_Chikings.Shoes_Str = Lua_tools.serialize(Act_Chikings.Shoes)
	end
	if not Act_Chikings.Eye_Str then
		Act_Chikings.Eye_Str = Lua_tools.serialize(Act_Chikings.Eye)
	end
	if not Act_Chikings.Item_Str then
		Act_Chikings.Item_Str = Lua_tools.serialize(Act_Chikings.Item)
	end
	if not Act_Chikings.Trap_Str then
		Act_Chikings.Trap_Str = Lua_tools.serialize(Act_Chikings.Trap)
	end
	if not Act_Chikings.Debuff_Str then
		Act_Chikings.Debuff_Str = Lua_tools.serialize(Act_Chikings.Debuffs)
	end
	
	local map_state = map:GetInt("GameState")
	local next_sec = map:GetInt("NextStateSec")
	local str = [[
		TrackUI.SwitchFightInfo4OrBattleBagNode(false)
		TrackUI.Act_Chickings_Attr = {}
		TrackUI.Act_Chickings_Config = {}
		TrackUI.Act_Chickings_Data = {}
		TrackUI.Act_Chickings_Debuff = {}
		TrackUI.Act_Chickings_Config.BornPoint = ]]..Act_Chikings.BornPoint_Str..[[
		TrackUI.Act_Chickings_Config.FightBuffs = ]]..Act_Chikings.FightBuffs_Str..[[
		TrackUI.Act_Chickings_Config.FightSkills = ]]..Act_Chikings.FightSkills_Str..[[
		TrackUI.Act_Chickings_Config.Bag = ]]..Act_Chikings.Bag_Str..[[
		TrackUI.Act_Chickings_Config.BagConfig = ]]..Lua_tools.serialize(Act_Chikings.BagConfig)..[[
		TrackUI.Act_Chickings_Config.Shoes = ]]..Act_Chikings.Shoes_Str..[[
		TrackUI.Act_Chickings_Config.Eye = ]]..Act_Chikings.Eye_Str..[[
		TrackUI.Act_Chickings_Config.Item = ]]..Act_Chikings.Item_Str..[[
		TrackUI.Act_Chickings_Config.Trap = ]]..Act_Chikings.Trap_Str..[[
		TrackUI.Act_Chickings_Config.Debuff = ]]..Act_Chikings.Debuff_Str..[[
		
		TrackUI.Act_Chickings_Attr.Hp_Max = 100
		TrackUI.Act_Chickings_Attr.Kill = 0
		TrackUI.Act_Chickings_Attr.Bag = 0
		TrackUI.Act_Chickings_Attr.Speed = 0
		TrackUI.Act_Chickings_Attr.View = 0
		TrackUI.Act_Chickings_Attr.Players = ]]..Data.Act_Chikings.MatchingMaps['Map_'..GUID]..[[
		
		TrackUI.UpdateBattleRoyaleItems = ]]..Lua_tools.serialize(Data.Act_Chikings[''..playerGUID..'_Bags'])..[[

		TrackUI.UpdateBattleRoyaleInfo()
		TrackUI.SetBattleRoyaleState(]]..map_state..[[,]]..next_sec..[[)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	for k,v in ipairs(map:GetAllPlayers()) do
		if v ~= player then
			Act_Chikings.Refresh(v)
		end
	end
	if player:GetTeam() then
		sTeamSystem:DestroyTeam(player:GetTeam())
	end
end

function Act_Chikings.LeaveMap(player, map)	--玩家离开地图
	player:Ghost(false)
	player:ForbidMove(false)
	sLuaApp:LuaDbg("离开地图 " .. map:GetName())
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_LOGIN, "Act_Chikings", "PlayerRelogin")
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_RELOGIN, "Act_Chikings", "PlayerRelogin")
	
	
	
	sLuaApp:LuaDbg("map type =========== " .. type(map))
	local GUID = map:GetGUID()
	sLuaApp:LuaDbg("GUID ========== " .. GUID)
	Data.Act_Chikings.MatchingMaps['Map_'..GUID] = Data.Act_Chikings.MatchingMaps['Map_'..GUID] - 1
	
	player:SetInt("Act_Chikings_Hp_Max",0)	--鸡力值最大值
	player:SetInt("Act_Chikings_Hp",0)		--初始鸡力值
	player:SetInt("Act_Chikings_Kill",0)	--淘汰数
	player:SetInt("Act_Chikings_Bag",0)		--背包档位
	player:SetInt("Act_Chikings_Speed",0)	--移速档位
	player:SetInt("Act_Chikings_View",0)	--视野档位
	
	player:SetInt("Act_Chickings_Bless",0)	--祝福时间
	
	
	player:SetString("Act_Chikings_BagName","")	--背包名字
	player:SetString("Act_Chikings_ShoesName","")	--移速名字
	player:SetString("Act_Chikings_EyeName","")	--视野名字
	
	player:SetInt("Act_Chikings_Slowly", 0)
	player:SetInt("Act_Chikings_Enemy",0)
	player:SetInt("Act_Chikings_FightEnemy", 0)
	
	player:SetInt("Act_Chikings_IsFight", 0)
	
	player:SetDynAttr(PlayerAttrClassify.Act_Chickings, ROLE_ATTR_MOVE_SPEED, 0)
	--player:SetViewRange(0)
	player:RecalcAttr()
	
	local str = [[
		TrackUI.SwitchFightInfo4OrBattleBagNode(true)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local AllPlayers = map:GetAllPlayers()
	local MapState = map:GetInt("GameState")
	
	PersonsActMatch.EndMatch(player)
	
	if MapState >= 3 then
		if #AllPlayers == 1 then
			sLuaTimerSystem:AddTimerEx(map, 5000, 1, "Act_Chikings.DelayBreakMap", ""..GUID)
			return
		end
	elseif MapState == 1 then
		sLuaApp:LuaDbg("地图剩余人数 " .. #AllPlayers)
		if #AllPlayers == Act_Chikings.MaxPlayers then
			sLuaApp:LuaDbg(player:GetName().."离开地图并准备激活 CancelJoin")
			Act_Chikings.CancelJoin(player, true)
		end
	end
	
	for k,v in ipairs(AllPlayers) do
		if v ~= player then
			Act_Chikings.Refresh(v)
		end
	end
	
	
end

function Act_Chikings.DelayBreakMap(map, timer_id, GUID)
	Act_Chikings.BreakMap(map, tonumber(GUID))
end

function Act_Chikings.SecondAdd(map, timer_id, sec)
	local GUID = map:GetGUID()
	if map:GetInt("GameState") ~= 4 then
		if Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Add'] then
			sLuaTimerSystem:DisableTimer(Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Add'])
		end
		if Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Check'] then
			sLuaTimerSystem:DisableTimer(Data.Act_Chikings.MatchingMaps['Map_'..GUID..'_Timer_Check'])
		end
	end
	map:SetInt("Act_Chikings_NowSec", 1 + map:GetInt("Act_Chikings_NowSec"))
end

function Act_Chikings.TimeCheck(map)
	--获取当前阶段
	
	local NowStep = map:GetInt("Act_Chikings_NowStep")
	if NowStep == 0 then
		NowStep = 1
	end
	local NextSec = Act_Chikings.SecConfig[NowStep+1]
	local deduct = Act_Chikings.SecConfig[NowStep][2]
	local now_sec = map:GetInt("Act_Chikings_NowSec")
	local deductCh = 0
	local Str = ""
	
	local stepCh = 0 
	if NextSec then
		if now_sec then		
			if now_sec >= NextSec[1] then
				deduct = NextSec[2]
				Str = NextSec[4] or ""
				if deduct ~= map:GetInt("Act_Chikings_Deduct") then
					map:SetInt("Act_Chikings_Deduct", deduct)
					deductCh = 1
				end
				map:SetInt("Act_Chikings_NowStep", NowStep+1)
				Act_Chikings.BreakStone(map, NextSec[3])
				stepCh = 1
			end
		end
	end
	
	local Next_Air = map:GetInt("Airdrop_Sec")
	if Next_Air == 0 then
		Next_Air = sLuaApp:RandInteger(60,120)
		map:SetInt("Airdrop_Sec", Next_Air)
	end
	if Next_Air == now_sec then
		Next_Air = Next_Air + sLuaApp:RandInteger(180,300)
		map:SetInt("Airdrop_Sec", Next_Air)
		Act_Chikings.AirdropEx("world", map)
	end
	
	
	local playerList = map:GetAllPlayers()
	if #playerList > 0 then
		if now_sec%10 == 0 then
			sLuaApp:LuaDbg("当前对局 游戏时间为" .. now_sec)
		end
	end
	local out = ""
	for k,v in ipairs(playerList) do
		local buff = Data.Act_Chikings[''..v:GetGUID()..'_Buffs']
		if not buff then
			buff = {}
		end
		if not v:IsFightState() then
			if buff['神鸡祝福'] == nil or buff['神鸡祝福'] == 0 then 	--125是代指，会更新宁神BUFF的ID
				--扣除鸡力值
				local NowHp = v:GetInt("Act_Chikings_Hp")
				NowHp = NowHp - deduct
				--同步到客户端
				--Act_Chikings.Refresh(v)
				v:SetInt("Act_Chikings_Hp", NowHp)
				if NowHp <= 0 then
					NowHp = 0
					--走死亡逻辑
					local playerNum = #playerList
					for a,b in ipairs(playerList) do
						if v ~= b then
							sLuaApp:NotifyTipsMsg(b, v:GetName() .. " 鸡力值耗尽身亡，当前还剩 " .. (playerNum-1) .. " 人！")
						end
					end
					v:SetInt("Act_Chikings_FightEnemy", 0)
					Act_Chikings.BecomeBox(v, 100)
					Act_Chikings.PlayerOut(v)
				end
			else
				buff['神鸡祝福'] = buff['神鸡祝福'] - 1
				v:SetInt("Act_Chickings_Bless", buff['神鸡祝福'])
				--sLuaApp:NotifyTipsMsg(v, "神鸡祝福 还剩 " .. buff['神鸡祝福'] .. "秒")
			end
			--local attrs = {
			--	{15, 1200},
			--	{16, 1200},
			--	{17, 1200},
			--	{18, 1200},
			--	{19, 1200},
			--	{36, 100000},
			--	{43, 50000},
			--	{45, 50000},
			--}
			--for a,b in ipairs(attrs) do
			--	if v:GetAttr(b[1]) > b[2] then
			--		out = v:GetName()
			--		v:SetInt("Act_Chikings_FightEnemy", 0)
			--		Act_Chikings.BecomeBox(v, 100)
			--		Act_Chikings.PlayerOut(v)
			--		return
			--	end
			--end
		else
			local playerBuff = Data.Act_Chikings[''..v:GetGUID()..'_Buffs']['战鸡祝福']
			if playerBuff then
				sLuaApp:ShowForm(v,"脚本表单", "BattleRoyaleFightUI.Refresh("..playerBuff..", "..deduct..")")
			end
		end
		--if stepCh ~= 0 then
		--	sLuaApp:NotifyTipsMsg(v, "当前进入" .. (NowStep+1).."小阶段~")
		--end
		
		local debuff = Data.Act_Chikings[''..v:GetGUID()..'_Debuffs']
		if not debuff then
			debuff = {}
		end
		if debuff['中毒'] then
			--if debuff['中毒'] > 0 then
				--debuff['中毒'] = debuff['中毒'] - 1
				local NowHp = v:GetInt("Act_Chikings_Hp")
				NowHp = NowHp - 2
				--同步到客户端
				--Act_Chikings.Refresh(v)
				v:SetInt("Act_Chikings_Hp", NowHp)
				local TrapPlayerGUID = v:GetInt("Act_Chikings_PoisonSource")
				if TrapPlayerGUID ~= 0 then
					local TrapPlayer = sPlayerSystem:GetPlayerByGUID(TrapPlayerGUID)
					if TrapPlayer then
						TrapPlayer:SetInt("Act_Chikings_Damage", TrapPlayer:GetInt("Act_Chikings_Damage") + 2)
					end
				end
				if NowHp <= 0 then
					NowHp = 0
					--走死亡逻辑

					local playerNum = #playerList
					for a,b in ipairs(playerList) do
						if v ~= b then
							sLuaApp:NotifyTipsMsg(b, v:GetName() .. " 中毒身亡，当前还剩 " .. (playerNum-1) .. " 人！")
						end
					end
					v:SetInt("Act_Chikings_FightEnemy", 0)
					Act_Chikings.BecomeBox(v, 100)
					Act_Chikings.PlayerOut(v)
				end
			--end
		end
		if stepCh ~= 0 then
			if Str ~= "" then
				sLuaApp:NotifyTopMsg(v, 1, Str)
			end
			--if not v:IsFightState() then
			--	local PetCon = v:GetPetContainer(PET_CONTAINER_PANEL)
			--	for a,b in ipairs(PetCon:GetPetList()) do
			--		if b:GetId() == 403 or b:GetId() == 401 then
			--			sPetSystem:DestroyPet(b,"挂逼", "挂逼", "挂逼")
			--		end
			--	end
			--end
		end
	end
	if out ~= "" then
		for k,v in ipairs(playerList) do
			if v:GetName() ~= out then
				sLuaApp:NotifyTopMsg("可喜可贺，由于 " .. out .. " 开挂，ta已经被踢出游戏啦！")
			end
		end
		
		
	end
end

--刷新客户端内容
function Act_Chikings.Refresh(player)
	local playerGUID = player:GetGUID()
	local str = [[
		TrackUI.Act_Chickings_Attr.Kill = ]]..player:GetInt("Act_Chikings_Kill")..[[
		TrackUI.Act_Chickings_Attr.Bag = ]]..player:GetInt("Act_Chikings_Bag")..[[
		TrackUI.Act_Chickings_Attr.Speed = ]]..player:GetInt("Act_Chikings_Speed")..[[
		TrackUI.Act_Chickings_Attr.View = ]]..player:GetInt("Act_Chikings_View")..[[
		TrackUI.Act_Chickings_Attr.Players = ]]..Data.Act_Chikings.MatchingMaps['Map_'..player:GetMap():GetGUID()]..[[
		
		TrackUI.Act_Chickings_Data = ]]..Lua_tools.serialize(Data.Act_Chikings[''..playerGUID..'_Bags'] or {})..[[
		TrackUI.Act_Chickings_Debuff = ]]..Lua_tools.serialize(Data.Act_Chikings[''..playerGUID..'_Debuffs'] or {})..[[
		TrackUI.UpdateBattleRoyaleInfo()
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--移除石像
function Act_Chikings.BreakStone(map, num)
	if num <= 0 then
		return
	end
	--local npcs = Data.Act_Chikings.MatchingMaps['Map_' .. map:GetGUID() .. '_Npcs']
	local npcs = map:GetNpcByKeyName('神鸡石像')
	local now_num = #npcs
	local OpenZone = ""
	sLuaApp:LuaDbg("本次删除前NPC数量 = " .. #npcs)
	
	
	if npcs then
		if now_num <= num then
			for k,v in ipairs(npcs) do
				--local npc = sNpcSystem:GetNpcByGUID(v)
				--if npc then
					sNpcSystem:DestroyNpc(v)		
				--end
			end
			Data.Act_Chikings.MatchingMaps['Map_' .. map:GetGUID() .. '_Npcs'] = {}
		else
			--for i = 1, num do
			--	local index = sLuaApp:RandInteger(1, #npcs)
			--	sNpcSystem:DestroyNpc(npcs[i])
			--end
			local MiddleNPC = npcs[sLuaApp:RandInteger(1, #npcs)]
			local NpcDiss = {}
			for k,v in ipairs(npcs) do
				table.insert(NpcDiss, {v, Lua_tools.GetDistance(MiddleNPC,v)})
			end
			table.sort(NpcDiss, function(a,b) return a[2]>b[2] end)
			for k,v in ipairs(NpcDiss) do
				sLuaApp:LuaDbg("Distance排序   " .. v[2])
			end
			for i = 1, num do
				sNpcSystem:DestroyNpc(NpcDiss[i][1])
			end
		end
	end
	sLuaApp:LuaDbg("本次删除后NPC数量 = " .. #npcs)
	sLuaApp:LuaDbg("本次删除后NPC数量PLUS = " .. #Data.Act_Chikings.MatchingMaps['Map_' .. map:GetGUID() .. '_Npcs'])
	
	
	--记得全地图播报
	Act_Chikings.RefreshStone(map)
	
	--记得给正在交互的玩家进行关闭对话界面并进行tips提示
	
end

function Act_Chikings.RefreshStone(map)
	local GUID = map:GetGUID()
	local str = ""
	local Npcs = map:GetNpcByKeyName('神鸡石像')
	Data.Act_Chikings.MatchingMaps['Map_' .. GUID .. '_Npcs'] = {}
	for k,v in ipairs(Npcs) do
		--local npc = sNpcSystem:GetNpcByGUID(v)
		str = str .. "'" .. v:GetString('ZoneName') .. "',"
		table.insert(Data.Act_Chikings.MatchingMaps['Map_' .. GUID .. '_Npcs'], v:GetGUID())
	end
	sLuaApp:LuaDbg("RefreshStoneStr =========== " .. str)
	sLuaApp:ShowFormToMap(map, "脚本表单", "if MapUI then MapUI.RefreshChickingAddressPoint({"..str.."}) end")
end

function Act_Chikings.VisitChest(npc, player)
	if npc:GetInt("ChestIsOpening") == 1 then
		sLuaApp:NotifyTipsMsg(player, "你无权搜索该宝箱")
		return false
	end
	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormAct_Chikings", "StopOpenChest", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..(Act_Chikings.ChestOpenSec*1000).."#正在搜索中..."..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, (Act_Chikings.ChestOpenSec*1000),1,"Act_Chikings.OpenChest", ""..npc:GetGUID())
	if t_guid then
		npc:SetInt("ChestIsOpening", 1)
		player:SetInt("ChestOpeningNPC", npc:GetGUID())
		player:SetInt("ChestTimerID", t_guid)
	end
end

function Act_Chikings.StopOpenChest(player)
	local timer_guid = player:GetInt("ChestTimerID")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."TianJiangBaoXiang.StopOpenBox HasTimer错误")
	end
	player:SetInt("ChestTimerID", 0)
	
	local npc_guid = player:GetInt("ChestOpeningNPC")
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		npc:SetInt("ChestIsOpening", 0)
	end
end

function Act_Chikings.OpenChest(player, timer_id, chest_guid)
	if not Data then
		return
	end
	if not Data.Act_Chikings then
		return
	end
	if not Data.Act_Chikings.Chests then
		Data.Act_Chikings.Chests = {}
	end
	chest_guid = tonumber(chest_guid)
	local chest = sNpcSystem:GetNpcByGUID(chest_guid)
	chest:SetInt("ChestIsOpening", 0)
	if player:IsFightState() then
		return
	end
	if not Data.Act_Chikings.Chests['GUID_'..chest_guid] then
		Data.Act_Chikings.Chests['GUID_'..chest_guid] = {}
		--初始化宝箱内容
		local ChestMark = chest:GetString("ChestMark")
		if ChestMark == "" then
			return
		end
		local Configs = Act_Chikings.ChestConfig[ChestMark]
		if not Configs then
			sLuaApp:LuaWrn(""..ChestMark.."不存在！！！")
		end
		local RandTb = Configs.Rands
		local superRand = ""
		for i = 1, Configs.RandTimes do
			local continue = 0
			if i == 1 then
				continue = 1
			elseif sLuaApp:RandInteger(1, 10000) > Configs.Nothing then
				continue = 1
			end
			if Configs['Rands_'..i] then
				superRand = "_"..i
				if continue == 1 then
					local index = Lua_tools.PlayerStartRandom( Configs['Rands_'..i], "Act_Chickings_Chest_"..ChestMark .. superRand, 1, true, true)[1]
					--sLuaApp:NotifyTipsMsg(player, "随机结果 = " .. index)
					table.insert(Data.Act_Chikings.Chests['GUID_'..chest_guid], Configs['Rands_'..i][index])
				end
			else
				if continue == 1 then
					local index = Lua_tools.PlayerStartRandom( RandTb, "Act_Chickings_Chest_"..ChestMark .. superRand, 1, true, true)[1]
					--sLuaApp:NotifyTipsMsg(player, "随机结果 = " .. index)
					table.insert(Data.Act_Chikings.Chests['GUID_'..chest_guid], RandTb[index])
				end
			end
		end
	end
	--local str = ""
	--for k,v in ipairs(Data.Act_Chikings.Chests['GUID_'..chest_guid]) do
	--	if v.Name then
	--		str = str .. v.Name .. ","
	--	end
	--end
	--sLuaApp:NotifyTipsMsg(player, chest:GetString("ChestMark") .. "宝箱内容 = " .. str)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('BattleRoyaleBoxUI') if BattleRoyaleBoxUI then BattleRoyaleBoxUI.ChestOpen("..Lua_tools.serialize(Data.Act_Chikings.Chests['GUID_'..chest_guid])..") end")
	--把Data.Act_Chikings.Chests['GUID_'..GUID]发送到客户端
	player:SetInt("Act_Chickings_ChestGUID", chest_guid)
end

function Act_Chikings.OpenDialog(npc, player)
	if player:GetInt("Activity_Effect_1") ~= 0 then
		return ""
	end
	local Trap = npc:GetString("Trap")
	if Trap ~= "" then
		if player:GetGUID() ~= npc:GetInt("TrapPlayer") then
			Act_Chikings.TrapAttack(player, npc, Trap)
			npc:SetString("Trap" , "")
			return ""
		end
	end
	local lastBuffTime = npc:GetInt("LastBuffTime")
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	local CD_sec = Act_Chikings.BuffCD + lastBuffTime - now_sec
	local GetString = "祈求神鸡祝福"
	if CD_sec > 0 then
		GetString = "#second-"..CD_sec.."-%d秒后可"..GetString.."#"..GetString
	end
	player:AddNpcOption(npc, 0, GetString, "option1", "")
	player:AddNpcOption(npc, 0, "布置陷阱", "option2", "")
	
	return "石像石像"
	--Act_Chikings.BuffCD
end

function Act_Chikings.AddBlessBuff(npc, player)
	local lastBuffTime = npc:GetInt("LastBuffTime")
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	local CD_sec = Act_Chikings.BuffCD + lastBuffTime - now_sec
	if CD_sec > 0 then
		return "时机未到，您现在还不能获得神鸡的祝福哦。"
	else
		npc:SetInt("LastBuffTime", now_sec)
		player:SetInt("Act_Chickings_Bless", 36)
		Data.Act_Chikings[''..player:GetGUID()..'_Buffs']['神鸡祝福'] = 36
		local x = sMapSystem:GetPosX(player)
		local y = sMapSystem:GetPosY(player)
		sLuaApp:ShowAroundForm(player:GetMap(), x, y, "脚本表单", "CL.ShowMapEffect('3000001414', '"..x..", "..y.."', '0, 0, 0', '0, 0, 0', '1, 1, 1', '1.5')")
		return "神鸡赐予了你力量，你又觉得你行了。"
	end
	--Act_Chikings.BuffCD
end

function Act_Chikings.GetTrapList(player)
	local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
	if not bags then
		bags = 3
	end
	local playerGUID = player:GetGUID()
	local Traps = {}
	if not Data.Act_Chikings[''..playerGUID..'_Bags'] then
		return Traps
	end
	for i = 1,bags do
		if Data.Act_Chikings[''..playerGUID..'_Bags'][i] then
			if Data.Act_Chikings[''..playerGUID..'_Bags'][i]['Type'] == 'Trap' then
				Traps[''..Data.Act_Chikings[''..playerGUID..'_Bags'][i]['Item']] = i
			end
		end
	end
	return Traps
	--Act_Chikings.BuffCD
end

function Act_Chikings.TrapAttack(player, npc, trap)
	local TrapConfig = Act_Chikings.Trap[trap]
	if not TrapConfig then
		return
	end
	
	--local trapName = npc:GetString("TrapPlayerName")
	local TrapPlayer = sPlayerSystem:GetPlayerByGUID(npc:GetInt("TrapPlayer"))
	local EffectID = npc:GetString("Trap")
	local effect = TrapConfig.EffectID
	local playerGUID = player:GetGUID()
	if TrapPlayer then
		if TrapPlayer:GetMap() == player:GetMap() then
			sLuaApp:NotifyTipsMsg(TrapPlayer, "黄天不负有心人！你的 "..trap.." 成功命中了玩家 "..player:GetName() .. "！")
		end
	end
	if TrapConfig.Type == "眩晕" then
		--if not Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
		--	Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
		--end
		--local now_sec = sLuaApp:SecondSinceEpoch(0)
		--Data.Act_Chikings[''..playerGUID..'_Debuffs']['眩晕'] = {now_sec, now_sec + TrapConfig.Val}
		--Lua_tools.Player_AddTimerPlus(player, TrapConfig.Val*1000, "Act_Chikings.BuffOver", "眩晕")	
		--player:ForbidMove(true)
		Act_Chikings.SetVertigo(player, TrapConfig.Val)
		--给玩家播报情况
		sLuaApp:NotifyTipsMsg(player, "有人在石像上布置了陷阱，你被击中了！眩晕"..TrapConfig.Val.."秒……")
	elseif TrapConfig.Type == "鸡力伤害" then
		sLuaApp:NotifyTipsMsg(player, "有人在石像上布置了陷阱，你被击中了！受到"..TrapConfig.Val.."点鸡力值伤害……")
		Act_Chikings.HPAtteck(player, TrapConfig.Val, TrapPlayer, "石像陷阱")
	elseif TrapConfig.Type == "盲目" then
		if not Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
			Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
		end
		local now_sec = sLuaApp:SecondSinceEpoch(0)
		Data.Act_Chikings[''..playerGUID..'_Debuffs']['盲目'] = {now_sec, now_sec + TrapConfig.Val}
		Lua_tools.Player_AddTimerPlus(player, TrapConfig.Val*1000, "Act_Chikings.BuffOver", "盲目")
		Act_Chikings.RefreshView(player)
		
		--给玩家播报情况
		sLuaApp:NotifyTipsMsg(player, "有人在石像上布置了陷阱，你被击中了！盲目"..TrapConfig.Val.."秒……")
	elseif TrapConfig.Type == "中毒" then
		sLuaApp:NotifyTipsMsg(player, "有人在石像上布置了陷阱，你被击中了！你中毒啦！")
		Act_Chikings.SetPoison(player, TrapConfig.Val, TrapPlayer)
	elseif TrapConfig.Type == "缓速" then
		sLuaApp:NotifyTipsMsg(player, "有人在石像上布置了陷阱，你被击中了！受到"..TrapConfig.Val.."点鸡力值伤害……")
		Act_Chikings.SetSlowly(player, TrapConfig.Val, TrapPlayer, "石像陷阱")
	end
	
	local x = sMapSystem:GetPosX(npc)
	local y = sMapSystem:GetPosY(npc)
	sLuaApp:ShowAroundForm(player:GetMap(), x, y, "脚本表单", "CL.ShowMapEffect('"..effect.."', '"..x..", "..y.."', '0, 0, 0', '0, 0, 0', '1, 1, 1', '5.5')")
	
end

function Act_Chikings.HPAtteck(player, val, TrapPlayer, attackerName)
	local nowHP = player:GetInt("Act_Chikings_Hp")
	nowHP = nowHP - val 
	TrapPlayer:SetInt("Act_Chikings_Damage", TrapPlayer:GetInt("Act_Chikings_Damage")+val)
	if nowHP <= 0 then
		if TrapPlayer then
			TrapPlayer:SetInt("Act_Chikings_Kill",player:GetInt("Act_Chikings_Kill") + 1)
			
			TrapPlayer:SetInt("Act_Chikings_Damage",player:GetInt("Act_Chikings_Damage") + val)
			
			local map = player:GetMap()
			if map:GetId() ~= Act_Chikings.MapID then
				return
			end
			local players = map:GetAllPlayers()
			local playerNum = #players
			for k,v in ipairs(players) do
				if v ~= player then
					sLuaApp:NotifyTipsMsg(v, TrapPlayer:GetName().." 利用陷阱中击败了 " .. player:GetName() .. "，当前还剩 " .. (playerNum-1) .. " 人！")
				end
			end
		end
		
		Act_Chikings.PlayerOut(player)
	else
		player:SetInt("Act_Chikings_Hp", nowHP)
		TrapPlayer:SetInt("Act_Chikings_Damage",player:GetInt("Act_Chikings_Damage") + val)
	end

end

function Act_Chikings.SetVertigo(player, val, TrapPlayer)
	local playerGUID = player:GetGUID()
	if not Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
		Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
	end
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	Data.Act_Chikings[''..playerGUID..'_Debuffs']['眩晕'] = {now_sec, now_sec + val}
	Lua_tools.Player_AddTimerPlus(player, val*1000, "Act_Chikings.BuffOver", "眩晕")	
	player:ForbidMove(true)
	
	sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('眩晕',"..val..") end")
	player:SetInt("Activity_Effect_1", 3000)
end

function Act_Chikings.SetPoison(player, val, TrapPlayer)
	local playerGUID = player:GetGUID()
	if not Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
		Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
	end
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	Data.Act_Chikings[''..playerGUID..'_Debuffs']['中毒'] = {now_sec, now_sec + val}
	Lua_tools.Player_AddTimerPlus(player, val*1000, "Act_Chikings.BuffOver", "中毒")
	
	if TrapPlayer then
		player:SetInt("Act_Chikings_PoisonSource", TrapPlayer:GetGUID() or 0)
	end
	
	sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('中毒',"..val..") end")
	player:SetInt("Activity_Effect_2", 3001)
end

function Act_Chikings.SetSlowly(player, val)
	local playerGUID = player:GetGUID()
	if not Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
		Data.Act_Chikings[''..playerGUID..'_Debuffs'] = {}
	end
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	Data.Act_Chikings[''..playerGUID..'_Debuffs']['缓速'] = {now_sec, now_sec + val}
	Lua_tools.Player_AddTimerPlus(player, val*1000, "Act_Chikings.BuffOver", "缓速")	
	
	player:SetInt("Act_Chikings_Slowly", 50)
	Act_Chikings.RefreshSpeed(player)
	
	sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('缓速',"..val..") end")
	player:SetInt("Activity_Effect_3", 3002)
end

function Act_Chikings.TrapInstall(player, npc, index)
	local playerGUID = player:GetGUID()
	local trap = Data.Act_Chikings[''..playerGUID..'_Bags'][index]['Item']
	local trapConfig = Act_Chikings.Trap[trap]
	if trapConfig then
		Data.Act_Chikings[''..playerGUID..'_Bags'][index] = {}
		npc:SetString("TrapPlayerName", player:GetName())
		npc:SetInt("TrapPlayer", player:GetGUID())
		npc:SetString("Trap", trap)
		sLuaApp:NotifyTipsMsg(player,"陷阱设置成功！")
		Act_Chikings.DropItem(player, nil, index, false, true)
	end
end

function Act_Chikings.BuffOver(player, timer_id, types)
	sLuaApp:LuaDbg("BUFF尝试清除 types =========== " .. types)
	local playerGUID = player:GetGUID()
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	local DebuffTb = Data.Act_Chikings[''..playerGUID..'_Debuffs'][''..types]
	if DebuffTb then
		if DebuffTb[2] then
			if DebuffTb[2] > now_sec + 1 then
				sLuaApp:LuaDbg("BUFF无法清除 DebuffTime ============ " .. DebuffTb[2] .. "      now_sec =========== " .. now_sec)
				return
			end
		end
	end
	if Data.Act_Chikings[''..playerGUID..'_Debuffs'] then
		if types == "眩晕" then		
			player:ForbidMove(false)
			Data.Act_Chikings[''..playerGUID..'_Debuffs']['眩晕'] = nil
			sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('眩晕',-1) end")
			player:SetInt("Activity_Effect_1", 0)
		elseif types == "盲目" then
			Data.Act_Chikings[''..playerGUID..'_Debuffs']['盲目'] = nil
			Act_Chikings.RefreshView(player)
		elseif types == "中毒" then
			Data.Act_Chikings[''..playerGUID..'_Debuffs']['中毒'] = nil
			sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('中毒',-1) end")
			player:SetInt("Activity_Effect_2", 0)
		elseif types == "缓速" then
			Data.Act_Chikings[''..playerGUID..'_Debuffs']['缓速'] = nil
			player:SetInt("Act_Chikings_Slowly", 0)
			Act_Chikings.RefreshSpeed(player)
			sLuaApp:ShowForm(player,"脚本表单", "if TrackUI then TrackUI.SetBattleRoyaleDebuff('缓速',-1) end")
			player:SetInt("Activity_Effect_3", 0)
		end
	else
		sLuaApp:LuaDbg("BuffOver =  _Debuffs不存在 " .. types)
	end
end

function Act_Chikings.GetItem(player, index, isForce)
	--距离验证
	local npc_guid = player:GetInt("Act_Chickings_ChestGUID")
	local Npc = sNpcSystem:GetNpcByGUID(npc_guid)
	if not Npc then
		sLuaApp:NotifyTipsMsg(player, "宝箱不存在！")
		return
	end
	local PosSquare = Lua_tools.GetDistance(player, Npc)
	if not PosSquare then
		sLuaApp:NotifyTipsMsg(player, "宝箱不在本地图中！")
		return
	end
	if PosSquare > 64 then
		sLuaApp:NotifyTipsMsg(player, "距离过远，无法拾取道具！")
		return
	end
	
	index = tonumber(index)
	local chestItem = Data.Act_Chikings.Chests['GUID_'..npc_guid][index]
	
	local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
	if not bags then
		bags = 3
	end
	local str_re = ""
	local playerGUID = player:GetGUID()
	if chestItem then	
		local item = chestItem.Name
		local types = chestItem.Type
		if types == 'FightBuffs' then
			if Act_Chikings.FightBuffs[item] then
				local buffType = Act_Chikings.FightBuffs[item].Type
				local FreeIndex = 0
				for i = 1,bags do
					local bagInfo = Data.Act_Chikings[''..playerGUID..'_Bags'][i]
					--sLuaApp:LuaDbg("获取背包内容")
					if bagInfo == nil or bagInfo.Type == nil then
						--sLuaApp:LuaDbg("第"..i.."个背包为空")
						if FreeIndex == 0 then
							FreeIndex = i
						end
					elseif bagInfo.Type == "FightBuffs" then
						if item == bagInfo.Item then
							sLuaApp:NotifyTipsMsg(player, "你已经拥有这个道具了！")
							return
						elseif buffType == Act_Chikings.FightBuffs[bagInfo.Item].Type then
							Act_Chikings.DropItem(player, npc_guid, i, true, false)
							FreeIndex = i
							break
						end
					end
				end
				if FreeIndex == 0 then
					sLuaApp:NotifyTipsMsg(player, "活动背包不足，无法收拾取该道具！")
					return
				end
				str_re = Act_Chikings.SetItem(playerGUID, FreeIndex, item, types)
			end
		elseif types == 'FightSkills' then
			if Act_Chikings.FightSkills[item] then
				local FreeIndex = 0
				for i = 1,bags do
					local bagInfo = Data.Act_Chikings[''..playerGUID..'_Bags'][i]
					if bagInfo == nil or bagInfo.Type == nil then
						if FreeIndex == 0 then
							FreeIndex = i
						end
					elseif bagInfo.Type == "FightSkills" then
						if item == bagInfo.Item then
							sLuaApp:NotifyTipsMsg(player, "你已经拥有这个道具了！")
							return
						end
					end
				end
				if FreeIndex == 0 then
					sLuaApp:NotifyTipsMsg(player, "活动背包不足，无法收拾取该道具！")
					return
				end
				str_re = Act_Chikings.SetItem(playerGUID, FreeIndex, item, types)
			end
		elseif types == 'Trap' then
			if Act_Chikings.Trap[item] then
				local FreeIndex = 0
				for i = 1,bags do
					local bagInfo = Data.Act_Chikings[''..playerGUID..'_Bags'][i]
					if bagInfo == nil or bagInfo.Type == nil then
						if FreeIndex == 0 then
							FreeIndex = i
						end
					end
				end
				if FreeIndex == 0 then
					sLuaApp:NotifyTipsMsg(player, "活动背包不足，无法收拾取该道具！")
					return
				end
				str_re = Act_Chikings.SetItem(playerGUID, FreeIndex, item, types)
			end
		elseif types == 'Item' then
			if Act_Chikings.Item[item] then
				local FreeIndex = 0
				for i = 1,bags do
					local bagInfo = Data.Act_Chikings[''..playerGUID..'_Bags'][i]
					if bagInfo == nil or bagInfo.Type == nil then
						if FreeIndex == 0 then
							FreeIndex = i
						end
					end
				end
				if FreeIndex == 0 then
					sLuaApp:NotifyTipsMsg(player, "活动背包不足，无法收拾取该道具！")
					return
				end
				str_re = Act_Chikings.SetItem(playerGUID, FreeIndex, item, types)
			end
		elseif types == 'Bag' then
			local nowindex = player:GetInt("Act_Chikings_Bag")
			local chestindex = Act_Chikings.Bag[item].ConfigIndex
			if chestindex <= nowindex then
				sLuaApp:NotifyTipsMsg(player, "你的背包空间已经超过它了，无法拾取！")
				return
			end
			player:SetString("Act_Chikings_BagName",""..item)	--背包名字
			sLuaApp:NotifyTipsMsg(player, "获得了"..item)
			player:SetInt("Act_Chikings_Bag", chestindex)		
			str_re = str_re .. " TrackUI.Act_Chickings_Attr.Bag = " .. chestindex .. " TrackUI.UpdateBattleRoyaleInfo()"
		elseif types == 'Shoes' then
			local nowindex = player:GetInt("Act_Chikings_Speed")
			local chestindex = Act_Chikings.Shoes[item].ConfigIndex
			if chestindex <= nowindex then
				sLuaApp:NotifyTipsMsg(player, "你的移动速度已经超过它了，无法拾取！")
				return
			end
			player:SetString("Act_Chikings_ShoesName",""..item)	--移速名字
			player:SetInt("Act_Chikings_Speed", chestindex)
			sLuaApp:NotifyTipsMsg(player, "获得了"..item)
			Act_Chikings.RefreshSpeed(player)
			str_re = str_re .. " TrackUI.Act_Chickings_Attr.Speed = " .. chestindex .. " TrackUI.UpdateBattleRoyaleInfo()"
		elseif types == 'Eye' then
			local nowindex = player:GetInt("Act_Chikings_View")
			local chestindex = Act_Chikings.Eye[item].ConfigIndex
			if chestindex <= nowindex then
				sLuaApp:NotifyTipsMsg(player, "你的视野范围已经超过它了，无法拾取！")
				return
			end
			player:SetInt("Act_Chikings_View", chestindex)
			player:SetString("Act_Chikings_EyeName",""..item)	--视野名字
			sLuaApp:NotifyTipsMsg(player, "获得了"..item)
			Act_Chikings.RefreshView(player)
			str_re = str_re .. " TrackUI.Act_Chickings_Attr.View = " .. chestindex .. " TrackUI.UpdateBattleRoyaleInfo()"
		end
		table.remove(Data.Act_Chikings.Chests['GUID_'..npc_guid], index)
		if #Data.Act_Chikings.Chests['GUID_'..npc_guid] == 0 then
			sNpcSystem:DestroyNpc(Npc)
		end
		--通知客户端刷新宝箱内容
		sLuaApp:ShowForm(player, "脚本表单", str_re .." GUI.OpenWnd('BattleRoyaleBoxUI') if BattleRoyaleBoxUI then BattleRoyaleBoxUI.ChestOpen("..Lua_tools.serialize(Data.Act_Chikings.Chests['GUID_'..npc_guid])..") end")
	end
end

function Act_Chikings.SetItem(playerGUID, index, itemName, types)
	if not Data.Act_Chikings[''..playerGUID..'_Bags'] then
		Data.Act_Chikings[''..playerGUID..'_Bags'] = {}
	end
	--sLuaApp:LuaDbg("index ============ " .. index or "nil")
	if not Data.Act_Chikings[''..playerGUID..'_Bags'][index] then
		Data.Act_Chikings[''..playerGUID..'_Bags'][index] = {}
	end
	Data.Act_Chikings[''..playerGUID..'_Bags'][index].Item = itemName
	Data.Act_Chikings[''..playerGUID..'_Bags'][index].Type = types
	return [[if TrackUI then TrackUI.UpdateBattleRoyaleBags(]]..index..[[, ']]..types..[[', ']]..itemName..[[') end]]
end

function Act_Chikings.DropItem(player, npc_guid, index, isFromGet, isSyn)
	local playerGUID = player:GetGUID()
	if npc_guid ~= nil then
		if not isFromGet then
			--距离验证
			local Npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
			if not Npc then
				sLuaApp:NotifyTipsMsg(player, "宝箱不存在！")
				return
			end
			local PosSquare = Lua_tools.GetDistance(player, Npc)
			if not PosSquare then
				sLuaApp:NotifyTipsMsg(player, "宝箱不在本地图中！")
				return
			end
			if PosSquare > 25 then
				sLuaApp:NotifyTipsMsg(player, "距离过远，无法进行交互！")
				return
			end
		end
		
		table.insert(Data.Act_Chikings.Chests['GUID_'..npc_guid], {Type = Data.Act_Chikings[''..playerGUID..'_Bags'][index].Type, Name = Data.Act_Chikings[''..playerGUID..'_Bags'][index].Item})
	end
	
	Data.Act_Chikings[''..playerGUID..'_Bags'][index] = {}
	if isSyn == true then
		--给客户端广播
		local str = [[if TrackUI then TrackUI.UpdateBattleRoyaleBags(]]..index..[[, 'nil', '') end]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function Act_Chikings.UseItem(player, index)
	sLuaApp:LuaDbg("使用道具——————————————————————————"..index)
	local playerGUID = player:GetGUID()
	local bags = Data.Act_Chikings[''..playerGUID..'_Bags']
	if not bags then
		Data.Act_Chikings[''..playerGUID..'_Bags'] = {}
		return
	end
	local bagInfo = bags[index]
	if not bagInfo then
		return
	end
	
	if bagInfo.Type ~= "Item" then
		sLuaApp:NotifyTipsMsg(player, "无法使用该道具")
		return
	end
	local Types = Act_Chikings.Item[bagInfo.Item].Type
	if Types == "复活" then
		sLuaApp:NotifyTipsMsg(player, "无法使用该道具")
		return
	end
	
	sLuaApp:LuaDbg("使用道具——————————————————————————"..bagInfo.Item)
	local UseSec = Act_Chikings.Item[bagInfo.Item].UseSec
	if UseSec then
		if Types == '恢复' then
			local HP_Max = player:GetInt("Act_Chikings_Hp_Max")
			if player:GetInt("Act_Chikings_Hp") >= HP_Max then	
				if HP_Max == 0 then
					return
				end
				sLuaApp:NotifyTipsMsg(player, "你的鸡力值满了！无法使用该道具")
				return
			end
		elseif Types == '隐形' then
			if player:GetInt("Act_Chikings_Invisible") == 1 then
				sLuaApp:NotifyTipsMsg(player, "你正在隐形中！无法使用该道具")
				return
			end
		end
		local str = [[
			local func = function()
				CL.SendNotify(NOTIFY.SubmitForm, "FormAct_Chikings", "StopUseItem", "")
			end
			CL.StopMove()
			GUI.OpenWnd("LoadingTipUI", "]]..(UseSec*1000).."#正在使用中..."..[[")
			LoadingTipUI.SetInterruptFunc(func)
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		local t_guid = sLuaTimerSystem:AddTimerEx(player, (UseSec*1000),1,"Act_Chikings.UseItemOver", ""..index)
		if t_guid then
			player:SetInt("Act_Chickings_Using", index)
			player:SetInt("ItemTimerID", t_guid)
		end
	end
end

function Act_Chikings.StopUseItem(player)
	local timer_guid = player:GetInt("ItemTimerID")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."TianJiangBaoXiang.StopOpenBox HasTimer错误")
	end
	player:SetInt("ItemTimerID", 0)
	player:SetInt("Act_Chickings_Using", 0)
	
	
end

function Act_Chikings.UseItemOver(player, timer_id, index)
	index = tonumber(index)
	local playerGUID = player:GetGUID()
	if not Data.Act_Chikings[''..playerGUID..'_Bags'] then
		Data.Act_Chikings[''..playerGUID..'_Bags'] = {}
	end
	--sLuaApp:LuaDbg("index ============ " .. index or "nil")
	if not Data.Act_Chikings[''..playerGUID..'_Bags'][index] then
		Data.Act_Chikings[''..playerGUID..'_Bags'][index] = {}
	end
	if player:GetInt("Act_Chickings_Using") ~= index then
		sLuaApp:NotifyTipsMsg(player, "使用异常")
		return
	end
	if player:IsFightState() then
		return
	end
	
	local bags = Data.Act_Chikings[''..playerGUID..'_Bags']
	if not bags then
		Data.Act_Chikings[''..playerGUID..'_Bags'] = {}
		return
	end
	local bagInfo = bags[index]
	if not bagInfo then
		return
	end
	
	if bagInfo.Type ~= "Item" then
		sLuaApp:NotifyTipsMsg(player, "无法使用该道具")
		return
	end
	local Types = Act_Chikings.Item[bagInfo.Item].Type
	if Types == "复活" then
		sLuaApp:NotifyTipsMsg(player, "无法使用该道具")
		return
	elseif Types == "恢复" then
		local HP = player:GetInt("Act_Chikings_Hp")
		local HP_MAX = player:GetInt("Act_Chikings_Hp_Max")
		if HP >= HP_MAX then
			sLuaApp:NotifyTipsMsg(player, "你的鸡力值满了！无法使用该道具")
			return
		end
		HP = HP + Act_Chikings.Item[bagInfo.Item].Val
		if HP > HP_MAX then
			HP = HP_MAX
		end
		player:SetInt("Act_Chikings_Hp", HP)
	elseif Types == "隐形" then
		--local IsInvisible = player:GetAttr(ROLE_ATTR_IS_STEALTH)
		local IntInvisible = player:GetInt("Act_Chikings_Invisible")
		if IntInvisible == 0 then
			player:Ghost(true)
			player:SetInt("Act_Chikings_Invisible", 1)
			
			local t_guid = sLuaTimerSystem:AddTimerEx(player, 10000,1,"Act_Chikings.ShowUpFromGhost", "")
			if t_guid then
				player:SetInt("Act_Chickings_GhostTimerID", t_guid)
			end
			
			player:ForbidMove(true)
			--告知客户端显示界面
			sLuaApp:ShowForm(player, "脚本表单", "if TrackUI then TrackUI.ShowBattleRoyaleFightMsgPage(1,10) end")
		end
	elseif Types == "空投" then
		Act_Chikings.AirdropEx("player", player)
	else
		sLuaApp:NotifyTipsMsg(player, "道具类型为  " ..Types)
		return
	end
	
	Act_Chikings.DropItem(player, nil, index, false, true)
	--Data.Act_Chikings[''..playerGUID..'_Bags'][index] = {}
	--if isSyn == true then
	--	--给客户端广播
	--	local str = [[if TrackUI then TrackUI.UpdateBattleRoyaleBags(]]..index..[[, 'nil', '') end]]
	--	sLuaApp:ShowForm(player, "脚本表单", str)
	--end
end

function Act_Chikings.ShowUpFromGhost(player, timer_id)
	local t_guid = player:GetInt("Act_Chickings_GhostTimerID")
	if t_guid ~= timer_id then
		return
	end
	if t_guid == 0 then
		return
	end
	player:SetInt("Act_Chickings_GhostTimerID", 0)
	local x = sMapSystem:GetPosX(player)
	local y = sMapSystem:GetPosY(player)
	local map = player:GetMap()
	sLuaApp:ShowAroundForm(map, x, y, "脚本表单", "CL.ShowMapEffect('3000001555', '"..x..", "..y.."', '0, 0, 0', '0, 0, 0', '1, 1, 1', '5.5')")
	player:SetInt("Act_Chikings_Invisible",0)
	local enemyList = map:GetRegionObjects(x, y, 15, GUID_PLAYER)
	for k,v in ipairs(enemyList) do
		if v ~= player then
			Act_Chikings.HPAtteck(v, 20, player, "隐身药")
			sLuaApp:NotifyTipsMsg(player, "你对 "..v:GetName().." 造成了20点鸡力值伤害")
			
			sLuaApp:NotifyTipsMsg(v, player:GetName().." 对你造成了20点鸡力值伤害")
		end
	end
	player:Ghost(false)
	player:ForbidMove(false)
end

function Act_Chikings.AirdropEx(mode, data)
	local role
	local map
	--local mapGUID
	if mode == "player" then
		if data then
			role = data
		end
		map = role:GetMap()
		--mapGUID = map:GetGUID()
	elseif mode == "world" then
		map = data
		local mapGUID = data:GetGUID()
		local npc = Data.Act_Chikings.MatchingMaps['Map_'..mapGUID .. '_Npcs'][sLuaApp:RandInteger(1,#Data.Act_Chikings.MatchingMaps['Map_'..mapGUID .. '_Npcs'])]
		if npc then
			role = sNpcSystem:GetNpcByGUID(npc)
		end
		if not role then
			return
		end
	end
	if role then
		local PosX = sMapSystem:GetPosX(role)
		local PosY = sMapSystem:GetPosY(role)
		
		--全图广播
		sLuaApp:ShowFormToMap(map, "脚本表单", "if TrackUI then TrackUI.AirdropShow(true, "..PosX..","..PosY..",40) end")
		sLuaTimerSystem:AddTimerEx(map, (15*1000),1,"Act_Chikings.Airdrop", ""..PosX..","..PosY)
		local playerList = map:GetAllPlayers()
		for k,v in ipairs(playerList) do
			sLuaApp:NotifyTopMsg(v, 1, "在"..PosX..","..PosY.."附近发现了鸡王至宝的痕迹，快去看看鸡神又给了大家怎样的恩赐！")
		end
	end
end

function Act_Chikings.Airdrop(map, timer_id, param)
	local tb_pos = sLuaApp:StrSplit(param, ",")
	sLuaApp:ShowFormToMap(map, "脚本表单", "if TrackUI then TrackUI.AirdropShow(false, "..tb_pos[1]..","..tb_pos[2]..") end")
	local Chest = sNpcSystem:CreateNpc(22503, map, tb_pos[1], tb_pos[2], 40, sLuaApp:RandInteger(0,7), 0)
	Chest:SetString("ChestMark", "Box_Max")
end

function Act_Chikings.on_encounter(role,ObjectList)
	if role == nil or ObjectList == nil then
        return
    end
	local map = role:GetMap()
	if map:GetInt("GameState") ~= 4 then
		return
	end
	local enemy = ObjectList[1]
	--鸡王血量判断
	if role:GetInt("Act_Chikings_Hp") <= 0 or enemy:GetInt("Act_Chikings_Hp") <= 0 then
		return 
	end
	if role:GetInt("Activity_Effect_1") ~= 0 then	--眩晕状态
		return ""
	end
	if role:IsGhost() or enemy:IsGhost() then
		return
	end
	sLuaApp:LuaErr("开始吃鸡战斗-------------------------------------！！！！！！！！！！！！！")
	--sTriggerSystem:AddTrigger(role, TRIGGER_ON_FIGHT_BEGIN, "Act_Chikings", "on_startfight")
	role:SetInt("Act_Chikings_IsFight", 1)
	enemy:SetInt("Act_Chikings_IsFight", 1)
	if sFightSystem:StartTagPVP(role,enemy,Act_Chikings.FightTag,"","","") then
		role:SetInt("Act_Chikings_Enemy", enemy:GetGUID())
		enemy:SetInt("Act_Chikings_Enemy", role:GetGUID())
		
		role:SetInt("Act_Chikings_Skills_JiBukeshi", 0)
		enemy:SetInt("Act_Chikings_Skills_JiBukeshi", 0)
		role:SetInt("Act_Chikings_Skills_Avatar", 0)
		enemy:SetInt("Act_Chikings_Skills_Avatar", 0)
		role:SetInt("Act_Chikings_Skills_Chunge", 0)
		enemy:SetInt("Act_Chikings_Skills_Chunge", 0)
		
		role:SetInt("Act_Chikings_FightEnemy", enemy:GetGUID())
		enemy:SetInt("Act_Chikings_FightEnemy", role:GetGUID())
        return true
    end
	--role:SetInt("Act_Chikings_IsFight", 0)
	--enemy:SetInt("Act_Chikings_IsFight", 0)
	--sTriggerSystem:DelTrigger(role, TRIGGER_ON_FIGHT_BEGIN, "Act_Chikings", "on_startfight")
end

function Act_Chikings.on_startfight(fighters)
	--local fighter1 = 
	--sLuaApp:LuaErr("on_startfight")
	local isAddAi = 0
	for k,v in ipairs(fighters) do
		--sLuaApp:LuaErr("fighters_"..k.." = " .. v:GetType())
		if v:GetType() == GUID_PLAYER_FIGHTER then
			--sLuaApp:LuaErr("开始吃鸡战斗BUFF增加-------------------------------------！！！！！！！！！！！！！")
			local GUID = v:GetGUID()
			local player = sPlayerSystem:GetPlayerByGUID(GUID)
			if player:GetInt("Act_Chikings_IsFight") ~= 1 then
				sLuaApp:LuaDbg("不应该进入BUFF逻辑")
				return
			end
			--出现了buff带出活动的bug
			player:SetInt("Act_Chikings_IsFight", 0)
			player:SetInt("Act_Chikings_InFight", 1)
			
			if isAddAi == 0 then
				isAddAi = 1
				sFightSystem:CreateFightBuff(v, 304)
				sFightSystem:CreateFightBuff(v, 305)
			end
			local BuffTimes = player:GetInt("Act_Chickings_Bless")
			local FightChicken = 0
			if not Data.Act_Chikings[''..GUID..'_Buffs'] then
				Data.Act_Chikings[''..GUID..'_Buffs'] = {}
			end
			Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] = math.ceil(BuffTimes/5)
			sLuaApp:NotifyTipsMsg(player, "进入战斗，根据当前神鸡祝福剩余时间，已为您转化了"..Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'].."层战鸡祝福！")
			local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
			if not bags then
				bags = 3
			end
			for i = 1,bags do
				local bagInfo = Data.Act_Chikings[''..GUID..'_Bags'][i]
				if bagInfo then
					if bagInfo.Type == "FightBuffs" then
						local BuffConfig = Act_Chikings.FightBuffs[bagInfo.Item]
						if BuffConfig then
							sFightSystem:CreateFightBuff(v, BuffConfig.BuffID)
							sLuaApp:NotifyTipsMsg(player,"你加持了【"..bagInfo.Item.."】效果")
							if BuffConfig.Type == 1001 then 
								v:SetHp(v:GetAttr(ROLE_ATTR_HP_LIMIT))
							end
						end
					end
					if bagInfo.Type == "FightSkills" then
						if bagInfo.Item == "大鸡大利" then
							local HP = player:GetInt("Act_Chikings_Hp")
							if HP < 100 then
								sLuaApp:NotifyTipsMsg(player, "你使用了 大鸡大利，你的鸡力值得到了回复！")
							end
							HP = HP + 20
							if HP > 100 then
								HP = 100
							end
							player:SetInt("Act_Chikings_Hp", HP)
							
						elseif bagInfo.Item == "金鸡" then
							local HP = player:GetInt("Act_Chikings_Hp")
							if HP < 100 then
								sLuaApp:NotifyTipsMsg(player, "你使用了 金鸡，你的鸡力值得到了回复！")
							end
							HP = HP + 5
							if HP > 100 then
								HP = 100
							end
							player:SetInt("Act_Chikings_Hp", HP)
						elseif bagInfo.Item == "闻鸡起舞" then
							if player:GetInt("Act_Chikings_Hp") > 80 then
								sFightSystem:CreateFightBuff(v, 13201)
								sLuaApp:NotifyTipsMsg(player, "你使用了 闻鸡起舞，你变得异常暴怒了！")
							end		
						elseif bagInfo.Item == "绝地反鸡" then
							if player:GetInt("Act_Chikings_Hp") < 5 then
								sFightSystem:CreateFightBuff(v, 13201)
								sLuaApp:NotifyTipsMsg(player, "你使用了 绝地反鸡，你变得异常暴怒了！")
							end		
						elseif bagInfo.Item == "一条" then
							player:SetInt("Act_Chikings_FightBless", player:GetInt("Act_Chikings_FightBless")+1)
							Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] = Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] + 1
							sLuaApp:NotifyTipsMsg(player, "你使用了 一条，额外获得1层战鸡祝福！")
						elseif bagInfo.Item == "先发制鸡" then
							local other = sPlayerSystem:GetPlayerByGUID(player:GetInt("Act_Chikings_Enemy"))
							local result = Act_Chikings.Attack_byFight(player,other,10,round)
							if result == 3 then
								result = Act_Chikings.Attack_byFight(0,player,10,round)
								sLuaApp:NotifyTipsMsg(player, "你使用了 先发制鸡，但被对方避开了！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 先发制鸡，但被你避开了！")
							else
								sLuaApp:NotifyTipsMsg(player, "你使用了 先发制鸡，对对方造成了10点鸡力值伤害！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 先发制鸡，对你造成了10点鸡力值伤害！")
							end
							--此处应该进入result判断
							if result == 2 then
								--进入玩家败北逻辑
								Act_Chikings.GroupFail(player)
								return
							end
						end
					end
				end
			end
			sLuaApp:ShowForm(player,"脚本表单", "GUI.OpenWnd('BattleRoyaleFightUI') BattleRoyaleFightUI.Refresh("..Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福']..","..player:GetMap():GetInt("Act_Chikings_Deduct")..")")
		end
	end
end

function Act_Chikings.FightCallBack(player, isWin)
	player:SetInt("Act_Chikings_IsFight", 0)
	player:SetInt("Act_Chikings_InFight", 0)
	sLuaApp:ShowForm(player,"脚本表单", "GUI.CloseWnd('BattleRoyaleFightUI')")
	local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
	if not bags then
		bags = 3
	end
	local isDye = 1
	local UseItem = 0
	local OverAdd = 0
	for i = 1,bags do
		local bagInfo = Data.Act_Chikings[''..player:GetGUID()..'_Bags'][i]
		if bagInfo then
			if isWin == 2 then
				--胜利
				if OverAdd == 0 then
					player:SetInt("Act_Chickings_Bless", player:GetInt('Act_Chickings_Bless')+10)
					OverAdd = 1
				end
				if bagInfo.Type == "FightSkills" then
					if bagInfo.Item == "后鸡之秀" then
						player:SetInt("Act_Chickings_Bless", player:GetInt('Act_Chickings_Bless')+10)
						sLuaApp:NotifyTipsMsg(player, "你使用了 后鸡之秀，额外获得10秒的神鸡祝福时间！")
					elseif bagInfo.Item == "神鸡" then
						local HP = player:GetInt("Act_Chikings_Hp")
						if HP < 100 then
							sLuaApp:NotifyTipsMsg(player, "你使用了 神鸡，你的鸡力值得到了回复！")
						end
						HP = HP + 10
						if HP > 100 then
							HP = 100
						end
						player:SetInt("Act_Chikings_Hp", HP)
					end
				end
			else
				if bagInfo.Type == "FightSkills" then
					if bagInfo.Item == "不讲鸡德" then
						local enemy = sPlayerSystem:GetPlayerByGUID(player:GetInt('Act_Chikings_Enemy'))
						local HP = enemy:GetInt("Act_Chikings_Hp")
						HP = HP - 30
						if HP <= 0 then
							HP = 0
						end
						enemy:SetInt("Act_Chikings_Hp", HP)
					end
				elseif bagInfo.Type == "Item" then
					if isDye == 1 then
						if bagInfo.Item == "遁走符" then
							UseItem = i
							isDye = 0
						end
					end
				end
			end
		end
	end
	if isDye == 1 and isWin ~= 2 then
		--死
		player:SetInt("Act_Chikings_Hp", 0)
		Act_Chikings.BecomeBox(player, 100)
		local enemy = sPlayerSystem:GetPlayerByGUID(player:GetInt('Act_Chikings_Enemy'))
		if enemy then
			enemy:SetInt("Act_Chikings_Kill", enemy:GetInt("Act_Chikings_Kill")+1)
		end
		
		
		local map = player:GetMap()
		local players = map:GetAllPlayers()
		local playerNum = #players
		for k,v in ipairs(players) do
			if v ~= player then
				sLuaApp:NotifyTipsMsg(v, enemy:GetName().."在战斗中击败了" .. player:GetName() .. "，当前还剩 " .. (playerNum - 1) .. " 人！")
			end
		end
		
		Act_Chikings.PlayerOut(player)
	end
	
	if isDye == 0 and isWin ~= 2 then
		--活
		Act_Chikings.DropItem(player, nil, UseItem, false, true)
		Act_Chikings.BecomeBox(player, 50)
		sLuaApp:NotifyTipsMsg(player, "你舍弃了一些道具，逃之夭夭了！")
		sMapSystem:Jump(player, player:GetMap(), sMapSystem:GetPosX(player), sMapSystem:GetPosY(player), 200)
	end
end

--每次修改视野范围均需要在此刷新内容
function Act_Chikings.RefreshView(player)
	
end

--每次修改移动速度均需要在此刷新内容
function Act_Chikings.RefreshSpeed(player)
	if player:GetMap():GetInt("GameState") == 0 then return end
	local nowSpeed = player:GetAttr(ROLE_ATTR_MOVE_SPEED)
	local SpeedIndex = player:GetInt("Act_Chikings_Speed")
	local Slowly = player:GetInt("Act_Chikings_Slowly")
	
	local NowVal = player:GetDynAttr(PlayerAttrClassify.Act_Chickings, ROLE_ATTR_MOVE_SPEED)
	local SpeedVal = math.floor(Act_Chikings.SpeedConfig[SpeedIndex]*100/(100-Slowly)) - nowSpeed + NowVal
	player:SetDynAttr(PlayerAttrClassify.Act_Chickings, ROLE_ATTR_MOVE_SPEED, SpeedVal)
	player:RecalcAttr()
	--sLuaApp:NotifyTipsMsg(player, "当前速度为 " .. player:GetAttr(ROLE_ATTR_MOVE_SPEED) .. " 计算负值为 " .. SpeedVal)
	--player:SetViewRange(Act_Chikings.ViewConfig[0])
	
end

function Act_Chikings.BecomeBox(player, rand)
	local playerGUID = player:GetGUID()
	local Bags = Data.Act_Chikings[''..playerGUID..'_Bags']
	local BoxItems = {}
	
	if rand == 100 then
		for k,v in pairs(Bags) do
			table.insert(BoxItems, {Type = v.Type, Name = v.Item})
		end
	else
		for k,v in pairs(Bags) do
			if v.Type then
				if rand >= sLuaApp:RandInteger(1,100) then
					table.insert(BoxItems, {Type = v.Type, Name = v.Item})
					Act_Chikings.DropItem(player, nil, k, false, true)
				end
			end
		end
	end
	if #BoxItems > 0 then
		local map = player:GetMap()
		if map:GetId() ~= Act_Chikings.MapID then
			return
		end
		local Chest = sNpcSystem:CreateNpc(22503, map, sMapSystem:GetPosX(player), sMapSystem:GetPosY(player), 0, 4, 0)
		Chest:SetDisplayName(player:GetName().."的遗产")
		local npc_guid = Chest:GetGUID()
		
		local enemyGUID = player:GetInt("Act_Chikings_FightEnemy")
		if enemyGUID ~= 0 then
			local enemy = sPlayerSystem:GetPlayerByGUID(player:GetInt("Act_Chikings_FightEnemy"))
			if enemy then
				if rand < 100 then
					sLuaApp:NotifyTipsMsg(enemy, ""..player:GetName().." 一溜烟的逃走了，不少宝物在他溜走时掉了出来！")
				else
					sLuaApp:NotifyTipsMsg(enemy, "你击败了"..player:GetName().." ，不少宝物从他口袋里掉了出来！")
					local Shoes = player:GetString("Act_Chikings_ShoesName")
					local Bag = player:GetString("Act_Chikings_BagName")
					local Eye = player:GetString("Act_Chikings_EyeName")
					if Shoes ~= "" then
						table.insert(BoxItems, {Type = "Shoes", Name = Shoes})
					end
					if Shoes ~= "" then
						table.insert(BoxItems, {Type = "Bag", Name = Bag})
					end
					if Shoes ~= "" then
						table.insert(BoxItems, {Type = "Eye", Name = Eye})
					end
				end
				enemy:SetInt("Act_Chikings_FightEnemy", 0)
				player:SetInt("Act_Chikings_FightEnemy", 0)
			end
		end
		Data.Act_Chikings.Chests['GUID_'..npc_guid] = BoxItems
	else
		local enemy = sPlayerSystem:GetPlayerByGUID(player:GetInt("Act_Chikings_FightEnemy"))
		if enemy then
			if rand == 100 then
				sLuaApp:NotifyTipsMsg(enemy, ""..player:GetName().." 太贫穷了，并没有留下任何东西！")
			else
				sLuaApp:NotifyTipsMsg(enemy, ""..player:GetName().." 一溜烟的逃走了，并没有留下任何东西！")
			end
			enemy:SetInt("Act_Chikings_FightEnemy", 0)
			player:SetInt("Act_Chikings_FightEnemy", 0)
		end
	end
	
end

function Act_Chikings.MapCreateTest(player)

	Act_Chikings.CreateMap()
	Act_Chikings.MapEnterTest(player)
	--Act_Chikings.Testmap = sMapSystem:CreateDungeon(299)
	--Data.Testmap = Act_Chikings.Testmap:GetGUID()
	--
	--Act_Chikings.Testmap:SetInt("GameState",1)
	--if Data then
	--	if not Data.Act_Chikings then
	--		Data.Act_Chikings = {}			
	--	end
	--	if not Data.Act_Chikings.Maps then
	--		Data.Act_Chikings.Maps = {}
	--	end
	--	table.insert(Data.Act_Chikings.Maps, Data.Testmap)
	--	
	--	if not Data.Act_Chikings.MatchingMaps then
	--		Data.Act_Chikings.MatchingMaps = {}
	--	end
	--	Data.Act_Chikings.MatchingMaps['Map_'..Data.Testmap] = 0
	--	sLuaApp:LuaDbg("创建地图 " .. Data.Testmap)
	--end
	--
	--
	--Act_Chikings.GameStart(Act_Chikings.Testmap)
	--if Act_Chikings.Testmap then
	--	sMapSystem:Jump(player, Act_Chikings.Testmap, 38, 41, 30)
	--end
end

function Act_Chikings.MapEnterTest(player)
	--if not Act_Chikings.Testmap then
	--	if Data.Testmap then
	--		Act_Chikings.Testmap = sMapSystem:GetMapByGUID(Data.Testmap)
	--	end
	--end
	--local attrs = {
	--	{15, 1200},
	--	{16, 1200},
	--	{17, 1200},
	--	{18, 1200},
	--	{19, 1200},
	--	{36, 100000},
	--	{43, 50000},
	--	{45, 50000},
	--}
	--for k,v in ipairs(attrs) do
	--	if player:GetAttr(v[1]) > v[2] then
	--		return "辣鸡挂逼滚滚滚"
	--	end
	--end
	--if Act_Chikings.Testmap then
	--	if Act_Chikings.Testmap:GetInt("GameState") >= 2 then
	--		return "对战已经开始了，请参加下一次活动"
	--	end
	--	sMapSystem:Jump(player, Act_Chikings.Testmap, 150, 167, 60)
	--	return "成功"
	--else
	--	return "失败"
	--end
end

function Act_Chikings.on_RoundStart(fighter)
	local enemy = nil
	local enemyList = sFightSystem:GetEnemies(fighter)
	for k,v in ipairs(enemyList) do
		if v:GetType() == GUID_PLAYER_FIGHTER then
			enemy = v
			break
		end
	end
	if not enemy then
		sLuaApp:LuaErr("Act_Chikings.on_RoundStart  enemy非玩家 pve战斗 fighter "..fighter:GetName())
		return
	end
	local fighters = {}
	if fighter:GetAttr(ROLE_ATTR_FIGHT_SPEED) >= enemy:GetAttr(ROLE_ATTR_FIGHT_SPEED) then
		fighters = {fighter, enemy}
	else
		fighters = {enemy, fighter}
	end
	local round = fighter:GetSceneRound()
	for k,v in ipairs(fighters) do
		local GUID = v:GetGUID()
		local player = sPlayerSystem:GetPlayerByGUID(GUID)
		local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
		if not bags then
			bags = 3
		end
		--if player:GetInt("Act_Chikings_Wining") == 1 then
		--	Act_Chikings.GroupWin(v)
		--	player:SetInt("Act_Chikings_Wining", 0)
		--	return
		--end
		for i = 1,bags do
			local bagInfo = Data.Act_Chikings[''..GUID..'_Bags'][i]
			if bagInfo then
				if bagInfo.Type == "FightSkills" then
					if bagInfo.Item == "恢鸡" then
						local HP = player:GetInt("Act_Chikings_Hp")
						HP = HP + 1
						if HP > 100 then
							HP = 100
						end
						player:SetInt("Act_Chikings_Hp", HP)
						sLuaApp:NotifyTipsMsg(player, "你使用了 恢鸡，恢复了1点鸡力值！")
					elseif bagInfo.Item == "令箭" then
						if round == 6 then
							Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] = Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] + 1
							sLuaApp:NotifyTipsMsg(player, "你使用了 令箭，获得一层战鸡祝福！")
						end
					end
				end
			end
		end
	end
	for k,v in ipairs(fighters) do
		local GUID = v:GetGUID()
		local player = sPlayerSystem:GetPlayerByGUID(GUID)
		if not Data.Act_Chikings[''..GUID..'_Buffs'] then
			Data.Act_Chikings[''..GUID..'_Buffs'] = {}
		end
		sLuaApp:ShowForm(player,"脚本表单", "BattleRoyaleFightUI.Refresh("..(Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] or 0)..","..player:GetMap():GetInt("Act_Chikings_Deduct")..")")
	end
end

function Act_Chikings.on_RoundOver(fighter)
	local enemy
	local enemyList = sFightSystem:GetEnemies(fighter)
	for k,v in ipairs(enemyList) do
		if v:GetType() == GUID_PLAYER_FIGHTER then
			enemy = v
			break
		end
	end
	local fighters = {}
	if fighter:GetAttr(ROLE_ATTR_FIGHT_SPEED) >= enemy:GetAttr(ROLE_ATTR_FIGHT_SPEED) then
		fighters = {fighter, enemy}
	else
		fighters = {enemy, fighter}
	end
	local round = fighter:GetSceneRound()
	for k,v in ipairs(fighters) do
		local GUID = v:GetGUID()
		local player = sPlayerSystem:GetPlayerByGUID(GUID)
		local other
		if k == 1 then
			other = sPlayerSystem:GetPlayerByGUID(fighters[2]:GetGUID())
		else
			other = sPlayerSystem:GetPlayerByGUID(fighters[1]:GetGUID())
		end
		local bags = Act_Chikings.BagConfig[player:GetInt("Act_Chikings_Bag")]
		if not bags then
			bags = 3
		end
		--if player:GetInt("Act_Chikings_Wining") == 1 then
		--	Act_Chikings.GroupWin(v)
		--	player:SetInt("Act_Chikings_Wining", 0)
		--	return
		--end
		for i = 1,bags do
			local bagInfo = Data.Act_Chikings[''..GUID..'_Bags'][i]
			local result
			if bagInfo then
				if bagInfo.Type == "FightSkills" then
					local v_is_lose = 0
					if bagInfo.Item == "阿瓦达索鸡" then
						if player:GetInt("Act_Chikings_Skills_Avatar") == 0 then
							local rand = sLuaApp:RandInteger(1,10000)
							if rand <= round*500 then
								player:SetInt("Act_Chikings_Skills_Avatar", 1)
								result = Act_Chikings.Attack_byFight(player,other,99,round)
								if result == 3 then
									sLuaApp:NotifyTipsMsg(player, "你使用了 阿瓦达索鸡，但被对方避开了！")
									sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 阿瓦达索鸡，但被你避开了！")
								else
									sLuaApp:NotifyTipsMsg(player, "你使用了 阿瓦达索鸡，对对方造成了99点鸡力值伤害！")
									sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 阿瓦达索鸡，对你造成了99点鸡力值伤害！")
								end
							else
								sLuaApp:NotifyTipsMsg(player, "你使用了 阿瓦达索鸡，但没有击中对方……")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 阿瓦达索鸡，但没有击中你！")
							end
						end	
					elseif bagInfo.Item == "北鸣神功" then
						local rand = sLuaApp:RandInteger(0,5)
						if rand > 0 then
							if result == 3 then
								sLuaApp:NotifyTipsMsg(player, "你使用了 北鸣神功，但被对方避开了！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 北鸣神功，但被你避开了！")
							else
								result = Act_Chikings.Attack_byFight(player,other,rand,round)
								local HP = player:GetInt("Act_Chikings_Hp")
								HP = HP + rand
								if HP > 100 then
									HP = 100
								end
								player:SetInt("Act_Chikings_Hp", HP)
								sLuaApp:NotifyTipsMsg(player, "你使用了 北鸣神功，你吸取了对方"..rand.."点鸡力值！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 北鸣神功，你被吸取了"..rand.."点鸡力值！")
							end
						else
							sLuaApp:NotifyTipsMsg(player, "你使用了 北鸣神功，但没有击中对方……")
							sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 北鸣神功，但没有击中你！")
						end
					elseif bagInfo.Item == "九阴乌骨爪" then
						result = Act_Chikings.Attack_byFight(player,other,5,round)
						if result == 3 then
							sLuaApp:NotifyTipsMsg(player, "你使用了 九阴乌骨爪，但被对方避开了！")
							sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 九阴乌骨爪，但被你避开了！")
						else
							sLuaApp:NotifyTipsMsg(player, "你使用了 九阴乌骨爪，对对方造成了5点鸡力值伤害！")
							sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 九阴乌骨爪，对你造成了5点鸡力值伤害！")
						end
					elseif bagInfo.Item == "鸡爪功" then
						result = Act_Chikings.Attack_byFight(player,other,2,round)
						if result == 3 then
							sLuaApp:NotifyTipsMsg(player, "你使用了 鸡爪功，但被对方避开了！")
							sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 鸡爪功，但被你避开了！")
						else
							sLuaApp:NotifyTipsMsg(player, "你使用了 鸡爪功，对对方造成了2点鸡力值伤害！")
							sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 鸡爪功，对你造成了2点鸡力值伤害！")
						end
					elseif bagInfo.Item == "天鸡流星拳" then
						if round == 5 then
							result = Act_Chikings.Attack_byFight(player,other,60,round)
							if result == 3 then
								sLuaApp:NotifyTipsMsg(player, "你使用了 天鸡流星拳，但被对方避开了！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 天鸡流星拳，但被你避开了！")
							else
								sLuaApp:NotifyTipsMsg(player, "你使用了 天鸡流星拳，对对方造成了60点鸡力值伤害！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."使用了 天鸡流星拳，对你造成了60点鸡力值伤害！")
							end
						end
					elseif bagInfo.Item == "天鸡将军" then
						local rand = sLuaApp:RandInteger(0,10000)
						if round%2 == 1 then
							if rand <= 1000 then
								result = Act_Chikings.Attack_byFight(0,player,30,round)
								v_is_lose = 1
								sLuaApp:NotifyTipsMsg(player, "你召唤的 天鸡将军 对你自己造成了30点鸡力值伤害！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."召唤的 天鸡将军 对他自己造成了30点鸡力值伤害！")
							else
								sLuaApp:NotifyTipsMsg(player, "你召唤的 天鸡将军 似乎未对 你自己 显灵……")
								local Name = player:GetName()
								sLuaApp:NotifyTipsMsg(other, Name.."召唤的 天鸡将军 似乎未对 "..Name.." 显灵……")
							end
						else
							if rand <= 1000 then
								result = Act_Chikings.Attack_byFight(0,other,30,round)
								sLuaApp:NotifyTipsMsg(player, "你召唤的 天鸡将军 对对方造成了30点鸡力值伤害！")
								sLuaApp:NotifyTipsMsg(other, player:GetName().."召唤的 天鸡将军 对你造成了30点鸡力值伤害！")
							else
								local Name = player:GetName()
								sLuaApp:NotifyTipsMsg(player, "你召唤的 天鸡将军 似乎未对 "..Name.." 显灵……")
								sLuaApp:NotifyTipsMsg(other, Name.."召唤的 天鸡将军 似乎未对 你 显灵……")
							end
						end
					end
					if result == 2 then
						--进入玩家败北逻辑
						if v_is_lose == 1 then
							Act_Chikings.GroupFail(v)
						else
							Act_Chikings.GroupWin(v)
						end
						return
					end
				end
			end
		end
	end
	for k,v in ipairs(fighters) do
		local GUID = v:GetGUID()
		local FightBless = Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福']
		if not FightBless then
			FightBless = 0
		end
		local deduct = 10
		local map = sPlayerSystem:GetPlayerByGUID(GUID):GetMap()
		if map then
			deduct = map:GetInt("Act_Chikings_Deduct")
		end
		local player = sPlayerSystem:GetPlayerByGUID(GUID)
		if FightBless > 0 then
			Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] = Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'] - 1		
			sLuaApp:NotifyTipsMsg(player, "回合结束，失去1层战鸡祝福，当前还剩"..Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福'].."层")
		else
			if deduct > 0 then
				sLuaApp:NotifyTipsMsg(player, "由于失去了战鸡祝福的庇佑！你受到了"..deduct.."点鸡力值伤害……")
				if Act_Chikings.Attack_byFight(0,player,deduct,round) == 2 then
					Act_Chikings.GroupFail(v)
					return
				end
			end
		end
		sLuaApp:ShowForm(player,"脚本表单", "BattleRoyaleFightUI.Refresh("..Data.Act_Chikings[''..GUID..'_Buffs']['战鸡祝福']..","..map:GetInt("Act_Chikings_Deduct")..")")
	end
end

function Act_Chikings.GroupFail(fighter)
	local fighters = sFightSystem:GetFriends(fighter)
	for k,v in ipairs(fighters) do
		if v:GetType() == GUID_PLAYER_FIGHTER then
			sFightSystem:CreateFightBuff(v, 3001)
		else
			sFightSystem:CreateFightBuff(v, 71)
		end
	end
	if fighter:GetType() == GUID_PLAYER_FIGHTER then
			sFightSystem:CreateFightBuff(fighter, 3001)
		else
			sFightSystem:CreateFightBuff(fighter, 71)
		end
	--sFightSystem:CreateFightBuff(fighter, 114)
end

function Act_Chikings.GroupWin(fighter)
	local fighters = sFightSystem:GetEnemies(fighter)
	for k,v in ipairs(fighters) do
		if v:GetType() == GUID_PLAYER_FIGHTER then
			sFightSystem:CreateFightBuff(v, 3001)
		else
			sFightSystem:CreateFightBuff(v, 71)
		end
	end
end

function Act_Chikings.Attack_byFight(player_att,player_inj,att_val,round,skill)
	--return 值 1 == 成功   2 == 成功并杀死对方  3 == 本次共计被闪避
	local Chunge = 0
	if not player_inj then
		return
	end
	local bags = Act_Chikings.BagConfig[player_inj:GetInt("Act_Chikings_Bag")]
	if not bags then
		bags = 3
	end
	for i = 1,bags do
		local bagInfo = Data.Act_Chikings[''..player_inj:GetGUID()..'_Bags'][i]
		if bagInfo then
			if bagInfo.Type == "FightSkills" then
				if bagInfo.Item == "僚鸡" then
					if player_att ~= 0 then
						local rand = sLuaApp:RandInteger(1,10000)
						if rand <= 1000 then
							return 3
						end
					end
				end
				if bagInfo.Item == "鸡不可失" then
					if player_inj:GetInt("Act_Chikings_Skills_JiBukeshi") == 0 then
						player_inj:SetInt("Act_Chikings_Skills_JiBukeshi", 1)
						return 3
					end
				end
				if bagInfo.Item == "鸡力与你同在" then
					Chunge = 1
				end	
			end
		end
	end
	local InjHp = player_inj:GetInt("Act_Chikings_Hp")
	InjHp = InjHp - att_val
	player_inj:SetInt("Act_Chikings_Hp", InjHp)
	if type(player_att) ~= "number" then
		player_att:SetInt("Act_Chikings_Damage", player_att:GetInt("Act_Chikings_Damage")+att_val)
	end
	--local attName = "系统"
	--local injName = player_inj:GetName()
	--if player_att then
	--	if player_att ~= 0 then
	--		attName = player_att:GetName()
	--	end
	--end
	--sLuaApp:LuaDbg("在战斗的第"..round.."回合，"..attName.. " 对 "..injName.."造成了"..att_val.."点伤害。")
	if InjHp <= 0 then
		player_inj:SetInt("Act_Chikings_Hp", 0)
		return 2
	elseif InjHp == 1 then
		if Chunge == 1 then
			if player_inj:GetInt("Act_Chikings_Skills_Chunge") == 0 then
				player_inj:SetInt("Act_Chikings_Skills_Chunge", 1)
				player_inj:SetInt("Act_Chikings_Hp", 100)
				sLuaApp:NotifyTipsMsg(player, "你使用了 鸡力与你同在！鸡力值恢复至100！")
			end
		end
	end
	return 1
end

function Act_Chikings.PlayerOut(player)
	--呼出界面
	local map = player:GetMap()
	if map:GetId() ~= Act_Chikings.MapID then
		return
	end
	player:SetInt("Act_Chikings_Hp",0)
	local PlayerNum = #map:GetAllPlayers()
	local Kill = player:GetInt("Act_Chikings_Kill")
	local ChiMoney = (Act_Chikings.MaxPlayers+1-PlayerNum)*2+player:GetInt("Act_Chikings_Kill")*5+map:GetInt("Act_Chikings_NowStep")
	
	player:SetInt("Act_Chikings_Money", player:GetInt("Act_Chikings_Money") + ChiMoney)
	
	local RewardList = Act_Chikings.Reward[PlayerNum]
	if not RewardList then
		RewardList = Act_Chikings.Reward[#Act_Chikings.Reward]
	end
	player:SetInt("Act_Chikings_CanLeave",1)
	sMapSystem:Jump(player, sMapSystem:GetMapByKey('长安城'), 314, 180, 30)
	
	if map:GetInt("GameState") == 4 then
		Lua_tools.AddItem(player,RewardList, "system", "吃鸡", "吃鸡第"..PlayerNum.."名奖励")
		local str = "TrackUI.ShowBattleSettlementPage("..PlayerNum..","..map:GetInt("StartPlayerNum")..","..Lua_tools.serialize(RewardList)..","..ChiMoney..","..Kill..")"
		sLuaApp:ShowForm(player, "脚本表单", str)
		
		local rankstr = "Act_Chikings_Rank_"..PlayerNum
		player:SetInt(rankstr, player:GetInt(rankstr) + 1)
		player:SetInt("Act_Chikings_AllMatch", player:GetInt("Act_Chikings_AllMatch") + 1)
		local AllDemage = player:GetInt("Act_Chikings_Damage")
		if AllDemage > 0 then
			sRanklistSystem:UpdateRanklist( RankingListSystem.Config['鸡力伤害榜'] or 91, player:GetGUID(), AllDemage, player:GetName(), ""..AllDemage)
		end
		local playerList = map:GetAllPlayers()	
		if #playerList == 1 then
			Act_Chikings.PlayerOut(playerList[1])
			local nowRecord = playerList[1]:GetInt("Act_Chikings_ChickenRecord") + 1
			playerList[1]:SetInt("Act_Chikings_ChickenRecord", nowRecord)
			sRanklistSystem:UpdateRanklist( RankingListSystem.Config['吃鸡之王'] or 90, player:GetGUID(), nowRecord, player:GetName(), ""..nowRecord)
			map:SetInt("GameState", 5)
		end
	end
	
end

function Act_Chikings.PreLogout(player)
	Act_Chikings.PlayerOut(player)
end