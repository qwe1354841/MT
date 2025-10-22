--变强以及成就系统
-- Id -> 编号
-- Type -> 类型
-- SubType -> 子类型
-- Name -> 名称
-- Info -> 介绍信息
-- Icon -> 图标编号
-- AchPoints -> 成就点
-- attr -> 货币属性ID
-- BindIngot -> 货币数量
-- ItemId -> 物品ID
-- ItemCount -> 物品数量
-- Goal -> 目标
-- CoefType1 -> 参数类型1
-- Coef1 -> 参数1
-- CoefType2 -> 参数类型2
-- Coef2 -> 参数2
-- FunType -> 前往类型
-- FunctionCoef -> 功能参数
-- Job -> 门派

-- TipsDuration  完成后提示，提示界面持续时间（秒）
Achievement = {}

Achievement.PromotionConfig = {}

Achievement.AchievementConfig = {
  {Id = 1, Type = 2, SubType = 201, 
    Name = "主线剧情", Info = "完成主线-重新启程", 
    Icon = 1801109120, 
    AchPoints = 2, 
    attr = 300, 
    BindGold = 200000, 
    ItemId = 0, 
    ItemCount = 0, 
    Goal = 10, 
    CoefType1 = 1,
    Coef1 = "223", 
    CoefType2 = 2, 
    Coef2 = 1, 
    FunType = 1, 
    FunctionCoef = "QuestDlgUI,1", 
    Job = 33, 
    Now_Extent = 0, 
    Max_Extent = 1, 
    ButtonState = 0, 
  },
  {Id = 2, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-重新启程", Icon = 1801109120, AchPoints = 2, attr = 300, BindGold = 200000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "224", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 31, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, TipsDuration = 2},
  {Id = 3, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-重新启程", Icon = 1801109120, AchPoints = 2, attr = 300, BindGold = 200000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "222", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 35, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, TipsDuration = 2},
  {Id = 4, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-重新启程", Icon = 1801109120, AchPoints = 2, attr = 300, BindGold = 200000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "225", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 34, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, TipsDuration = 2},
  {Id = 5, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-重新启程", Icon = 1801109120, AchPoints = 2, attr = 300, BindGold = 200000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "226", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 32, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, TipsDuration = 2},
  {Id = 6, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-重新启程", Icon = 1801109120, AchPoints = 2, attr = 300, BindGold = 200000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "227", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 36, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, TipsDuration = 2},
  {Id = 7, Type = 5, SubType = 0, Name = "宠物成长", Info = "获得1个宠物", Icon = 1801109320, AchPoints = 2, attr = 300, BindGold = 1000, ItemId = 0, ItemCount = 0, Goal = 0, CoefType1 = 1, Coef1 = "0", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "20026", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 8, Type = 7, SubType = 0, Name = "道具获得", Info = "购买五色花", Icon = 1801109480, AchPoints = 2, attr = 300, BindGold = 1000, ItemId = 0, ItemCount = 0, Goal = 2, CoefType1 = 1, Coef1 = "32419", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "20014", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 9, Type = 3, SubType = 305, Name = "参与战斗", Info = "傲来村战斗2次", Icon = 1801109290, AchPoints = 2, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 12, CoefType1 = 4, Coef1 = "201", CoefType2 = 2, Coef2 = 2, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 10, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到10点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 1000, ItemId = 31001, ItemCount = 5, Goal = 25, CoefType1 = 2, Coef1 = "4", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 10, ButtonState = 0, },
 {Id = 11, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-神机妙算", Icon = 1801109120, AchPoints = 0, attr = 300, BindGold = 50000, ItemId = 28146, ItemCount = 1, Goal = 10, CoefType1 = 1, Coef1 = "246", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 12, Type = 3, SubType = 309, Name = "侍从成长", Info = "获得侍从水德真君", Icon = 1801109400, AchPoints = 2, attr = 300, BindGold = 1500, ItemId = 0, ItemCount = 0, Goal = 1, CoefType1 = 1, Coef1 = "110", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 13, Type = 3, SubType = 309, Name = "侍从成长", Info = "获得侍从地涌夫人", Icon = 1801109400, AchPoints = 2, attr = 300, BindGold = 1500, ItemId = 0, ItemCount = 0, Goal = 1, CoefType1 = 1, Coef1 = "116", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 14, Type = 7, SubType = 0, Name = "祈福", Info = "完成1次祈福", Icon = 1801109520, AchPoints = 2, attr = 300, BindGold = 10, ItemId = 0, ItemCount = 0, Goal = 26, CoefType1 = 7, Coef1 = "1", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "PrayUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 15, Type = 3, SubType = 302, Name = "技能成长", Info = "1个门派技能到15级", Icon = 1801109090, AchPoints = 2, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 1, Coef1 = "0", CoefType2 = 1, Coef2 = 15, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 21, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有5个好友", Icon = 1801109110, AchPoints = 2, attr = 300, BindGold = 1500, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "5", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
 {Id = 22, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到50点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 5000, ItemId = 31001, ItemCount = 5, Goal = 25, CoefType1 = 2, Coef1 = "6", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 50, ButtonState = 0, },
 {Id = 23, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-传旨玄奘", Icon = 1801109120, AchPoints = 4, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "267", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 24, Type = 2, SubType = 205, Name = "活跃奖励", Info = "获得50点活跃奖励礼包", Icon = 1801109480, AchPoints = 4, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 2, CoefType1 = 1, Coef1 = "28100", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "ActivityPanelUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 25, Type = 4, SubType = 402, Name = "师徒关系", Info = "找到一个师傅并拜师", Icon = 1801109490, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 15, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendShipRecommend,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 26, Type = 3, SubType = 309, Name = "侍从成长", Info = "同时拥有4个侍从", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 2000, ItemId = 0, ItemCount = 0, Goal = 1, CoefType1 = 2, Coef1 = "4", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 4, ButtonState = 0, },
 {Id = 27, Type = 3, SubType = 304, Name = "阵法学习", Info = "学会任意阵法", Icon = 1801109470, AchPoints = 4, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 3, CoefType1 = 1, Coef1 = "0", CoefType2 = 1, Coef2 = 1, FunType = 1, FunctionCoef = "BattleSeatUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 28, Type = 4, SubType = 404, Name = "组队", Info = "加入其它玩家的队伍", Icon = 1801109560, AchPoints = 4, attr = 300, BindGold = 5000, ItemId = 0, ItemCount = 0, Goal = 20, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "TeamPlatformPersonalUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 29, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到100点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 10000, ItemId = 31001, ItemCount = 10, Goal = 25, CoefType1 = 2, Coef1 = "6", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 100, ButtonState = 0, },
 {Id = 30, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-取经真相", Icon = 1801109120, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "295", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 31, Type = 2, SubType = 202, Name = "每日活动", Info = "完成5次护卫银子任务", Icon = 1801109180, AchPoints = 4, attr = 300, BindGold = 20, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "122", CoefType2 = 2, Coef2 = 5, FunType = 2, FunctionCoef = "21069", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
-- {Id = 32, Type = 2, SubType = 202, Name = "每日活动", Info = "完成5次宝图任务", Icon = 1801109240, AchPoints = 4, attr = 300, BindGold = 20, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "70", CoefType2 = 2, Coef2 = 5, FunType = 2, FunctionCoef = "50001", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
-- {Id = 33, Type = 2, SubType = 202, Name = "每日活动", Info = "", Icon = 1801109130, AchPoints = 4, attr = 300, BindGold = 20, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "31", CoefType2 = 2, Coef2 = 10, FunType = 2, FunctionCoef = "10009", Job = 0, Now_Extent = 0, Max_Extent = 10, ButtonState = 0, },
 --{Id = 39, Type = 2, SubType = 203, Name = "挑战秘境", Info = "参与【秘境】大雁塔", Icon = 1801109140, AchPoints = 4, attr = 300, BindGold = 25, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "401", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "40101", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 40, Type = 2, SubType = 202, Name = "每日活动", Info = "完成降妖任务20次", Icon = 1801109130, AchPoints = 4, attr = 300, BindGold = 20, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "10", CoefType2 = 2, Coef2 = 20, FunType = 2, FunctionCoef = "10014", Job = 0, Now_Extent = 0, Max_Extent = 20, ButtonState = 0, },
 {Id = 41, Type = 4, SubType = 403, Name = "加入帮派", Info = "加入一个帮派", Icon = 1801109410, AchPoints = 4, attr = 300, BindGold = 5000, ItemId = 0, ItemCount = 0, Goal = 14, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FactionUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 42, Type = 3, SubType = 303, Name = "装备强化", Info = "全身1件装备强化到+4", Icon = 1801109100, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 5, CoefType1 = 1, Coef1 = "0", CoefType2 = 3, Coef2 = 4, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 43, Type = 3, SubType = 303, Name = "宝石镶嵌（需要装备）", Info = "全身镶嵌3颗3级以上宝石", Icon = 1801109260, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 7, CoefType1 = 2, Coef1 = "3", CoefType2 = 1, Coef2 = 3, FunType = 1, FunctionCoef = "EquipUI,2", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
 {Id = 44, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到150点", Icon = 1801109070, AchPoints = 4, attr = 300, BindGold = 15000, ItemId = 31001, ItemCount = 12, Goal = 25, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 150, ButtonState = 0, },
 {Id = 45, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-赐名八戒", Icon = 1801109120, AchPoints = 4, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "325", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 46, Type = 3, SubType = 302, Name = "技能成长", Info = "3个门派技能升到45级", Icon = 1801109090, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "3", CoefType2 = 1, Coef2 = 45, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
-- {Id = 52, Type = 5, SubType = 0, Name = "宠物成长（放生不算）", Info = "突破并拥有1个2星宠物", Icon = 1801109330, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 28, CoefType1 = 2, Coef1 = "1", CoefType2 = 4, Coef2 = 2, FunType = 1, FunctionCoef = "PetUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 53, Type = 3, SubType = 307, Name = "官职成长", Info = "获得九品官职称号", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 38, CoefType1 = 1, Coef1 = "537", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleAttributeUI,101", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 54, Type = 2, SubType = 203, Name = "挑战秘境", Info = "参与【秘境】沙城遗址", Icon = 1801109140, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "408", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "40102", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 55, Type = 2, SubType = 204, Name = "乡试", Info = "参加1次乡试", Icon = 1801109420, AchPoints = 4, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 17, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 2, FunctionCoef = "10217", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 56, Type = 3, SubType = 303, Name = "装备炼化", Info = "完成1次装备炼化", Icon = 1801109250, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 27, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "EquipUI,3", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 --{Id = 57, Type = 3, SubType = 303, Name = "装备打造", Info = "打造一件装备", Icon = 1801109250, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 6, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 58, Type = 3, SubType = 309, Name = "侍从成长", Info = "将1个侍从升到2星", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 24, CoefType1 = 2, Coef1 = "1", CoefType2 = 4, Coef2 = 2, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 59, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到200点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 20000, ItemId = 31001, ItemCount = 14, Goal = 25, CoefType1 = 2, Coef1 = "9", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 200, ButtonState = 0, },
 {Id = 60, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-托骨转世", Icon = 1801109120, AchPoints = 4, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "355", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 61, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】傲来秘宝", Icon = 1801109140, AchPoints = 4, attr = 300, BindGold = 35, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 62, Type = 5, SubType = 0, Name = "宠物成长（放生不算）", Info = "突破并拥有2个2星宠物", Icon = 1801109330, AchPoints = 4, attr = 300, BindGold = 35, ItemId = 0, ItemCount = 0, Goal = 28, CoefType1 = 2, Coef1 = "2", CoefType2 = 4, Coef2 = 2, FunType = 1, FunctionCoef = "PetUI,0", Job = 0, Now_Extent = 0, Max_Extent = 2, ButtonState = 0, },
 {Id = 63, Type = 3, SubType = 303, Name = "装备强化（出售不算）", Info = "全身9件装备强化到+4", Icon = 1801109100, AchPoints = 4, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 5, CoefType1 = 2, Coef1 = "9", CoefType2 = 3, Coef2 = 4, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
 {Id = 64, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到55级", Icon = 1801109090, AchPoints = 4, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 55, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 70, Type = 3, SubType = 303, Name = "宝石镶嵌（需要装备）", Info = "全身镶嵌27颗3级以上宝石", Icon = 1801109260, AchPoints = 4, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 7, CoefType1 = 2, Coef1 = "27", CoefType2 = 1, Coef2 = 3, FunType = 1, FunctionCoef = "EquipUI,2", Job = 0, Now_Extent = 0, Max_Extent = 27, ButtonState = 0, },
 {Id = 71, Type = 3, SubType = 302, Name = "技能修炼", Info = "任意修炼技能升到10级", Icon = 1801109410, AchPoints = 4, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 29, CoefType1 = 2, Coef1 = "0", CoefType2 = 1, Coef2 = 10, FunType = 1, FunctionCoef = "RoleSkillUI,3", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 72, Type = 3, SubType = 302, Name = "技能天赋", Info = "装备3个天赋技能", Icon = 1801109410, AchPoints = 4, attr = 300, BindGold = 30, ItemId = 0, ItemCount = 0, Goal = 31, CoefType1 = 2, Coef1 = "3", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleSkillUI,2", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
-- {Id = 78, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼升到3级", Icon = 1801109480, AchPoints = 4, attr = 300, BindGold = 35, ItemId = 0, ItemCount = 0, Goal = 32, CoefType1 = 1, Coef1 = "0", CoefType2 = 1, Coef2 = 3, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
 {Id = 79, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到250点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 25000, ItemId = 31001, ItemCount = 16, Goal = 25, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 250, ButtonState = 0, },
 {Id = 80, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-流沙来讯", Icon = 1801109120, AchPoints = 4, attr = 300, BindGold = 80000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "385", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 81, Type = 2, SubType = 203, Name = "挑战秘境", Info = "参与【秘境】水帘洞", Icon = 1801109140, AchPoints = 4, attr = 300, BindGold = 40, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "415", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "40103", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
-- {Id = 82, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】梦回千古", Icon = 1801109140, AchPoints = 4, attr = 300, BindGold = 40, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "422", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "10072", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 --{Id = 83, Type = 5, SubType = 0, Name = "宠物成长（放生不算）", Info = "突破并拥有4个2星宠物", Icon = 1801109330, AchPoints = 4, attr = 300, BindGold = 40, ItemId = 0, ItemCount = 0, Goal = 28, CoefType1 = 2, Coef1 = "4", CoefType2 = 4, Coef2 = 2, FunType = 1, FunctionCoef = "PetUI,0", Job = 0, Now_Extent = 0, Max_Extent = 4, ButtonState = 0, },
-- {Id = 84, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼提升至7级", Icon = 1801109480, AchPoints = 4, attr = 300, BindGold = 40, ItemId = 0, ItemCount = 0, Goal = 32, CoefType1 = 1, Coef1 = "0", CoefType2 = 1, Coef2 = 7, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 7, ButtonState = 0, },
 {Id = 85, Type = 3, SubType = 304, Name = "阵法学习", Info = "习得3个不同的阵法", Icon = 1801109470, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 3, CoefType1 = 2, Coef1 = "3", CoefType2 = 1, Coef2 = 1, FunType = 1, FunctionCoef = "BattleSeatUI,0", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
 {Id = 86, Type = 4, SubType = 402, Name = "师徒关系", Info = "收徒,获得一个徒弟", Icon = 1801109490, AchPoints = 4, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 16, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendShipRecommend,2", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 87, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到65级", Icon = 1801109090, AchPoints = 4, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 65, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
 {Id = 93, Type = 5, SubType = 0, Name = "宠物成长", Info = "完成1次宠物染色", Icon = 1801109340, AchPoints = 0, attr = 300, BindGold = 4000, ItemId = 41003, ItemCount = 10, Goal = 34, CoefType1 = 1, Coef1 = "0", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "20037", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 94, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到300点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 30000, ItemId = 31001, ItemCount = 18, Goal = 25, CoefType1 = 2, Coef1 = "9", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 300, ButtonState = 0, },
 {Id = 95, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-西行取经", Icon = 1801109120, AchPoints = 6, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "415", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
 {Id = 96, Type = 3, SubType = 302, Name = "技能修炼", Info = "4个修炼技能升到10级", Icon = 1801109410, AchPoints = 4, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 29, CoefType1 = 2, Coef1 = "4", CoefType2 = 1, Coef2 = 10, FunType = 1, FunctionCoef = "RoleSkillUI,3", Job = 0, Now_Extent = 0, Max_Extent = 4, ButtonState = 0, },
 {Id = 97, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到75级", Icon = 1801109090, AchPoints = 6, attr = 300, BindGold = 80000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 75, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
--  {Id = 103, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】洞窟伏魔", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 45, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "424", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30227", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 104, Type = 3, SubType = 303, Name = "装备强化（出售不算）", Info = "全身9件装备强化到+8以上", Icon = 1801109100, AchPoints = 6, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 5, CoefType1 = 2, Coef1 = "9", CoefType2 = 3, Coef2 = 8, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
  {Id = 105, Type = 3, SubType = 303, Name = "宝石镶嵌（需要装备）", Info = "全身镶嵌27颗5级以上的宝石", Icon = 1801109260, AchPoints = 4, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 7, CoefType1 = 2, Coef1 = "27", CoefType2 = 1, Coef2 = 5, FunType = 1, FunctionCoef = "EquipUI,2", Job = 0, Now_Extent = 0, Max_Extent = 27, ButtonState = 0, },
  --{Id = 106, Type = 3, SubType = 302, Name = "技能天赋", Info = "装备5个天赋技能", Icon = 1801109410, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 31, CoefType1 = 2, Coef1 = "5", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleSkillUI,2", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
  {Id = 112, Type = 3, SubType = 309, Name = "侍从成长", Info = "激活1个侍从的所有情缘", Icon = 1801109400, AchPoints = 6, attr = 300, BindGold = 4500, ItemId = 0, ItemCount = 0, Goal = 36, CoefType1 = 2, Coef1 = "1", CoefType2 = 1, Coef2 = 1, FunType = 1, FunctionCoef = "GuardUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 113, Type = 5, SubType = 0, Name = "宠物成长", Info = "完成一次宠物合成", Icon = 1801109350, AchPoints = 0, attr = 300, BindGold = 4000, ItemId = 30911, ItemCount = 1, Goal = 37, CoefType1 = 2, Coef1 = "1", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "PetUI,4", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 114, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到350点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 35000, ItemId = 31001, ItemCount = 20, Goal = 25, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 350, ButtonState = 0, },
  {Id = 115, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-再见,大圣", Icon = 1801109120, AchPoints = 6, attr = 300, BindGold = 120000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "448", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 116, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】人鬼绝恋", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "433", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30239", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 117, Type = 2, SubType = 203, Name = "挑战秘境", Info = "参与【秘境】巅峰试炼", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "426", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "2518", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 118, Type = 3, SubType = 307, Name = "官职成长", Info = "获得五品官职称号", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 38, CoefType1 = 1, Coef1 = "541", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleAttributeUI,101", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 119, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到85级", Icon = 1801109090, AchPoints = 8, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 85, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
--  {Id = 125, Type = 5, SubType = 0, Name = "宠物成长（放生不算）", Info = "突破并拥有5个3星宠物", Icon = 1801109330, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 28, CoefType1 = 2, Coef1 = "5", CoefType2 = 4, Coef2 = 3, FunType = 1, FunctionCoef = "PetUI,0", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
--  {Id = 126, Type = 3, SubType = 309, Name = "侍从成长", Info = "拥有4个3星以上侍从", Icon = 1801109400, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 24, CoefType1 = 2, Coef1 = "4", CoefType2 = 4, Coef2 = 3, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 4, ButtonState = 0, },
--  {Id = 127, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼提升至1阶以上", Icon = 1801109480, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 33, CoefType1 = 1, Coef1 = "0", CoefType2 = 5, Coef2 = 1, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 128, Type = 3, SubType = 304, Name = "阵法成长", Info = "将一个阵法提升至2级", Icon = 1801109470, AchPoints = 6, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 3, CoefType1 = 2, Coef1 = "1", CoefType2 = 1, Coef2 = 2, FunType = 1, FunctionCoef = "BattleSeatUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 129, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到400点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 25, CoefType1 = 2, Coef1 = "9", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 400, ButtonState = 0, },
  {Id = 130, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-拜别丹炉", Icon = 1801109120, AchPoints = 6, attr = 300, BindGold = 140000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "477", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 131, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到95级", Icon = 1801109090, AchPoints = 8, attr = 300, BindGold = 120000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 95, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
--  {Id = 137, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼提升至3阶以上", Icon = 1801109480, AchPoints = 6, attr = 300, BindGold = 55, ItemId = 0, ItemCount = 0, Goal = 33, CoefType1 = 1, Coef1 = "0", CoefType2 = 5, Coef2 = 3, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 3, ButtonState = 0, },
--  {Id = 138, Type = 3, SubType = 303, Name = "装备强化（出售不算）", Info = "全身9件装备强化到+12以上", Icon = 1801109100, AchPoints = 6, attr = 30000, BindGold = 55, ItemId = 0, ItemCount = 0, Goal = 5, CoefType1 = 2, Coef1 = "9", CoefType2 = 3, Coef2 = 12, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
  {Id = 139, Type = 3, SubType = 303, Name = "宝石镶嵌（需要装备）", Info = "全身镶嵌27颗7级以上的宝石", Icon = 1801109260, AchPoints = 6, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 7, CoefType1 = 2, Coef1 = "27", CoefType2 = 1, Coef2 = 7, FunType = 1, FunctionCoef = "EquipUI,2", Job = 0, Now_Extent = 0, Max_Extent = 27, ButtonState = 0, },
--  {Id = 140, Type = 3, SubType = 302, Name = "技能天赋", Info = "装备7个天赋技能", Icon = 1801109410, AchPoints = 8, attr = 300, BindGold = 70, ItemId = 0, ItemCount = 0, Goal = 31, CoefType1 = 2, Coef1 = "7", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleSkillUI,2", Job = 0, Now_Extent = 0, Max_Extent = 7, ButtonState = 0, },
  {Id = 146, Type = 3, SubType = 302, Name = "技能修炼", Info = "所有修炼技能升到10级", Icon = 1801109410, AchPoints = 6, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 29, CoefType1 = 2, Coef1 = "8", CoefType2 = 1, Coef2 = 10, FunType = 1, FunctionCoef = "RoleSkillUI,3", Job = 0, Now_Extent = 0, Max_Extent = 8, ButtonState = 0, },
  {Id = 147, Type = 3, SubType = 303, Name = "装备获取", Info = "穿戴9件紫色以上的装备", Icon = 1801109250, AchPoints = 6, attr = 300, BindGold = 5500, ItemId = 0, ItemCount = 0, Goal = 39, CoefType1 = 3, Coef1 = "4", CoefType2 = 2, Coef2 = 9, FunType = 1, FunctionCoef = "BagUI,0", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
  {Id = 148, Type = 3, SubType = 304, Name = "阵法学习", Info = "习得7个不同的阵法", Icon = 1801109470, AchPoints = 6, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 3, CoefType1 = 2, Coef1 = "7", CoefType2 = 1, Coef2 = 1, FunType = 1, FunctionCoef = "BattleSeatUI,0", Job = 0, Now_Extent = 0, Max_Extent = 7, ButtonState = 0, },
--  {Id = 149, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到450点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 45000, ItemId = 0, ItemCount = 0, Goal = 25, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 450, ButtonState = 0, },
  {Id = 150, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-商量对策", Icon = 1801109120, AchPoints = 8, attr = 300, BindGold = 160000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "507", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 151, Type = 2, SubType = 202, Name = "每日活动", Info = "完成40次伏魔任务", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "44", CoefType2 = 2, Coef2 = 40, FunType = 2, FunctionCoef = "10014", Job = 0, Now_Extent = 0, Max_Extent = 40, ButtonState = 0, },
--  {Id = 152, Type = 3, SubType = 302, Name = "技能天赋", Info = "装备8个天赋技能", Icon = 1801109410, AchPoints = 10, attr = 300, BindGold = 80, ItemId = 0, ItemCount = 0, Goal = 31, CoefType1 = 2, Coef1 = "8", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleSkillUI,2", Job = 0, Now_Extent = 0, Max_Extent = 8, ButtonState = 0, },
  {Id = 158, Type = 3, SubType = 307, Name = "官职成长", Info = "获得三品官职称号", Icon = 1801109400, AchPoints = 6, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 38, CoefType1 = 1, Coef1 = "543", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleAttributeUI,101", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 159, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到105级", Icon = 1801109090, AchPoints = 10, attr = 300, BindGold = 140000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 105, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
--  {Id = 165, Type = 5, SubType = 0, Name = "宠物成长（放生不算）", Info = "突破并拥有5个5星宠物", Icon = 1801109330, AchPoints = 8, attr = 300, BindGold = 60, ItemId = 0, ItemCount = 0, Goal = 28, CoefType1 = 2, Coef1 = "5", CoefType2 = 4, Coef2 = 5, FunType = 1, FunctionCoef = "PetUI,0", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
 -- {Id = 166, Type = 3, SubType = 309, Name = "侍从成长", Info = "拥有4个5星以上侍从", Icon = 1801109400, AchPoints = 8, attr = 300, BindGold = 60, ItemId = 0, ItemCount = 0, Goal = 24, CoefType1 = 2, Coef1 = "4", CoefType2 = 4, Coef2 = 5, FunType = 1, FunctionCoef = "GuardUI,0", Job = 0, Now_Extent = 0, Max_Extent = 4, ButtonState = 0, },
 -- {Id = 167, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼提升至5阶以上", Icon = 1801109480, AchPoints = 8, attr = 300, BindGold = 60, ItemId = 0, ItemCount = 0, Goal = 33, CoefType1 = 1, Coef1 = "0", CoefType2 = 5, Coef2 = 5, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 5, ButtonState = 0, },
  {Id = 168, Type = 3, SubType = 304, Name = "阵法成长", Info = "将一个阵法提升至5级", Icon = 1801109470, AchPoints = 8, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 3, CoefType1 = 2, Coef1 = "1", CoefType2 = 1, Coef2 = 5, FunType = 1, FunctionCoef = "BattleSeatUI,0", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 169, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到500点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 25, CoefType1 = 2, Coef1 = "9", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 500, ButtonState = 0, },
  {Id = 170, Type = 2, SubType = 201, Name = "主线剧情", Info = "完成主线-三界祥和", Icon = 1801109120, AchPoints = 8, attr = 300, BindGold = 180000, ItemId = 0, ItemCount = 0, Goal = 10, CoefType1 = 1, Coef1 = "536", CoefType2 = 2, Coef2 = 1, FunType = 1, FunctionCoef = "QuestDlgUI,1", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
  {Id = 171, Type = 3, SubType = 302, Name = "技能成长", Info = "所有门派技能升到115级", Icon = 1801109090, AchPoints = 10, attr = 300, BindGold = 160000, ItemId = 0, ItemCount = 0, Goal = 4, CoefType1 = 2, Coef1 = "6", CoefType2 = 1, Coef2 = 115, FunType = 1, FunctionCoef = "RoleSkillUI,0", Job = 0, Now_Extent = 0, Max_Extent = 6, ButtonState = 0, },
  {Id = 177, Type = 3, SubType = 307, Name = "官职成长", Info = "获得一品官职称号", Icon = 1801109400, AchPoints = 8, attr = 300, BindGold = 80000, ItemId = 0, ItemCount = 0, Goal = 38, CoefType1 = 1, Coef1 = "545", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleAttributeUI,101", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 178, Type = 3, SubType = 303, Name = "装备强化（出售不算）", Info = "全身9件装备强化到+16以上", Icon = 1801109100, AchPoints = 8, attr = 300, BindGold = 7000, ItemId = 0, ItemCount = 0, Goal = 5, CoefType1 = 2, Coef1 = "9", CoefType2 = 3, Coef2 = 16, FunType = 1, FunctionCoef = "EquipUI,1", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
  {Id = 179, Type = 3, SubType = 303, Name = "宝石镶嵌（需要装备）", Info = "全身镶嵌27颗9级以上的宝石", Icon = 1801109260, AchPoints = 8, attr = 300, BindGold = 100000, ItemId = 0, ItemCount = 0, Goal = 7, CoefType1 = 2, Coef1 = "27", CoefType2 = 1, Coef2 = 9, FunType = 1, FunctionCoef = "EquipUI,2", Job = 0, Now_Extent = 0, Max_Extent = 27, ButtonState = 0, },
 -- {Id = 180, Type = 3, SubType = 302, Name = "技能天赋", Info = "装备9个天赋技能", Icon = 1801109410, AchPoints = 10, attr = 300, BindGold = 90, ItemId = 0, ItemCount = 0, Goal = 31, CoefType1 = 2, Coef1 = "9", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "RoleSkillUI,2", Job = 0, Now_Extent = 0, Max_Extent = 9, ButtonState = 0, },
  {Id = 186, Type = 3, SubType = 302, Name = "技能修炼", Info = "所有修炼技能升到15级", Icon = 1801109410, AchPoints = 8, attr = 300, BindGold = 80000, ItemId = 0, ItemCount = 0, Goal = 29, CoefType1 = 2, Coef1 = "8", CoefType2 = 1, Coef2 = 15, FunType = 1, FunctionCoef = "RoleSkillUI,3", Job = 0, Now_Extent = 0, Max_Extent = 8, ButtonState = 0, },
  {Id = 187, Type = 3, SubType = 303, Name = "装备获取", Info = "同时穿戴10件橙色装备", Icon = 1801109250, AchPoints = 8, attr = 300, BindGold = 7000, ItemId = 0, ItemCount = 0, Goal = 39, CoefType1 = 3, Coef1 = "5", CoefType2 = 2, Coef2 = 10, FunType = 1, FunctionCoef = "BagUI,0", Job = 0, Now_Extent = 0, Max_Extent = 10, ButtonState = 0, },
--  {Id = 188, Type = 3, SubType = 306, Name = "羽翼成长", Info = "将羽翼提升至8阶", Icon = 1801109480, AchPoints = 8, attr = 300, BindGold = 70, ItemId = 0, ItemCount = 0, Goal = 33, CoefType1 = 1, Coef1 = "0", CoefType2 = 5, Coef2 = 8, FunType = 1, FunctionCoef = "BagUI,4", Job = 0, Now_Extent = 0, Max_Extent = 8, ButtonState = 0, },
--  {Id = 189, Type = 1, SubType = 0, Name = "阶段目标", Info = "成就点达到580点", Icon = 1801109070, AchPoints = 0, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 25, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 580, ButtonState = 0, },
  {Id = 190, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有10个好友", Icon = 1801109110, AchPoints = 4, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "10", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 10, ButtonState = 0, },
  {Id = 191, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有15个好友", Icon = 1801109110, AchPoints = 4, attr = 300, BindGold = 15000, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "15", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 15, ButtonState = 0, },
  {Id = 192, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有20个好友", Icon = 1801109110, AchPoints = 6, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "20", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 20, ButtonState = 0, },
  {Id = 193, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有25个好友", Icon = 1801109110, AchPoints = 6, attr = 300, BindGold = 25000, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "25", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 25, ButtonState = 0, },
  {Id = 194, Type = 4, SubType = 401, Name = "添加好友", Info = "同时拥有30个好友", Icon = 1801109110, AchPoints = 8, attr = 300, BindGold = 30000, ItemId = 0, ItemCount = 0, Goal = 9, CoefType1 = 2, Coef1 = "30", CoefType2 = 0, Coef2 = 0, FunType = 1, FunctionCoef = "FriendUI,0", Job = 0, Now_Extent = 0, Max_Extent = 30, ButtonState = 0, },
  {Id = 201, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到30级", Icon = 1801109400, AchPoints = 2, attr = 300, BindGold = 10000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 30, ButtonState = 0, TipsDuration = 2},
  {Id = 202, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到50级", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 20000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 50, ButtonState = 0, TipsDuration = 2},
  {Id = 203, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到60级", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 30000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 60, ButtonState = 0, TipsDuration = 2},
  {Id = 204, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到70级", Icon = 1801109400, AchPoints = 4, attr = 300, BindGold = 40000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 70, ButtonState = 0, TipsDuration = 2},
  {Id = 205, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到80级", Icon = 1801109400, AchPoints = 6, attr = 300, BindGold = 50000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 80, ButtonState = 0, TipsDuration = 2},
  {Id = 206, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到90级", Icon = 1801109400, AchPoints = 8, attr = 300, BindGold = 60000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 90, ButtonState = 0, TipsDuration = 2},
  {Id = 207, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到100级", Icon = 1801109400, AchPoints = 8, attr = 300, BindGold = 70000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 100, ButtonState = 0, TipsDuration = 2},
  {Id = 208, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到110级", Icon = 1801109400, AchPoints = 10, attr = 300, BindGold = 80000, ItemId = 0, ItemCount = 0, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 110, ButtonState = 0, TipsDuration = 2},
  {Id = 209, Type = 3, SubType = 301, Name = "等级成长", Info = "升级到120级", Icon = 1801109400, AchPoints = 0, attr = 300, BindGold = 90000, ItemId = 28147, ItemCount = 1, Goal = 41, CoefType1 = 0, Coef1 = "0", CoefType2 = 1, Coef2 = 20, FunType = 0, FunctionCoef = "0", Job = 0, Now_Extent = 0, Max_Extent = 120, ButtonState = 0, TipsDuration = 5},
--  {Id = 210, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】大雁塔（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 211, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】沙城遗址（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 212, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】水帘洞（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 213, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】巅峰试炼（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 214, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】傲来秘宝（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 215, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】梦回千古（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 216, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】洞窟伏魔（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },
--  {Id = 217, Type = 2, SubType = 203, Name = "挑战副本", Info = "参与【副本】人鬼绝恋（困难）", Icon = 1801109140, AchPoints = 6, attr = 300, BindGold = 50, ItemId = 0, ItemCount = 0, Goal = 13, CoefType1 = 1, Coef1 = "423", CoefType2 = 2, Coef2 = 1, FunType = 2, FunctionCoef = "30210", Job = 0, Now_Extent = 0, Max_Extent = 1, ButtonState = 0, },

}

Achievement.GemID_KeyName = {
    [5001] = "1级攻击石", [5002] = "2级攻击石", [5003] = "3级攻击石", [5004] = "4级攻击石", [5005] = "5级攻击石", [5006] = "6级攻击石", [5007] = "7级攻击石",[5008] = "8级攻击石", [5009] = "9级攻击石", [5010] = "10级攻击石", [5011] = "11级攻击石", [5012] = "12级攻击石", [5013] = "13级攻击石", [5014] = "14级攻击石", [5015] = "15级攻击石",
    [5101] = "1级魔攻石", [5102] = "2级魔攻石", [5103] = "3级魔攻石", [5104] = "4级魔攻石", [5105] = "5级魔攻石", [5106] = "6级魔攻石", [5107] = "7级魔攻石",[5108] = "8级魔攻石", [5109] = "9级魔攻石", [5110] = "10级魔攻石", [5111] = "11级魔攻石", [5112] = "12级魔攻石", [5113] = "13级魔攻石", [5114] = "14级魔攻石", [5115] = "15级魔攻石",
    [5201] = "1级物抗石", [5202] = "2级物抗石", [5203] = "3级物抗石", [5204] = "4级物抗石", [5205] = "5级物抗石", [5206] = "6级物抗石", [5207] = "7级物抗石",[5208] = "8级物抗石", [5209] = "9级物抗石", [5210] = "10级物抗石", [5211] = "11级物抗石", [5212] = "12级物抗石", [5213] = "13级物抗石", [5214] = "14级物抗石", [5215] = "15级物抗石",
    [5301] = "1级生命石", [5302] = "2级生命石", [5303] = "3级生命石", [5304] = "4级生命石", [5305] = "5级生命石", [5306] = "6级生命石", [5307] = "7级生命石",[5308] = "8级生命石", [5309] = "9级生命石", [5310] = "10级生命石", [5311] = "11级生命石", [5312] = "12级生命石", [5313] = "13级生命石", [5314] = "14级生命石", [5315] = "15级生命石",
    [5401] = "1级速度石", [5402] = "2级速度石", [5403] = "3级速度石", [5404] = "4级速度石", [5405] = "5级速度石", [5406] = "6级速度石", [5407] = "7级速度石",[5408] = "8级速度石", [5409] = "9级速度石", [5410] = "10级速度石", [5411] = "11级速度石", [5412] = "12级速度石", [5413] = "13级速度石", [5414] = "14级速度石", [5415] = "15级速度石",
    [5501] = "1级封印石", [5502] = "2级封印石", [5503] = "3级封印石", [5504] = "4级封印石", [5505] = "5级封印石", [5506] = "6级封印石", [5507] = "7级封印石",[5508] = "8级封印石", [5509] = "9级封印石", [5510] = "10级封印石", [5511] = "11级封印石", [5512] = "12级封印石", [5513] = "13级封印石", [5514] = "14级封印石", [5515] = "15级封印石",
    [5601] = "1级魔抗石", [5602] = "2级魔抗石", [5603] = "3级魔抗石", [5604] = "4级魔抗石", [5605] = "5级魔抗石", [5606] = "6级魔抗石", [5607] = "7级魔抗石",
    [5701] = "1级暴击石", [5702] = "2级暴击石", [5703] = "3级暴击石", [5704] = "4级暴击石", [5705] = "5级暴击石", [5706] = "6级暴击石", [5707] = "7级暴击石",
    [5608] = "8级魔抗石", [5609] = "9级魔抗石", [5610] = "10级魔抗石", [5611] = "11级魔抗石", [5612] = "12级魔抗石", [5613] = "13级魔抗石", [5614] = "14级魔抗石", [5615] = "15级魔抗石",
    [5708] = "8级暴击石", [5709] = "9级暴击石", [5710] = "10级暴击石", [5711] = "11级暴击石", [5712] = "12级暴击石", [5713] = "13级暴击石", [5714] = "14级暴击石", [5715] = "15级暴击石",
}
local SkillSubType = { School = 6, Talent = 13, Practice = 14, Faction = 11 }

function Achievement.GetPromotionConfig(player)
    if not player then return end

    if SwitchOnAward then
        local cfg = Achievement.PromotionConfig
        if not next(cfg) then
            cfg = SwitchOnAward.BeStrongInitData()
        end

        assert(next(cfg), "Achievement.PromotionConfig must be not nil")

        local str = [[
        if BeStrongUI then
        BeStrongUI.PromotionConfig = ]]..Lua_tools.serialize(cfg)..[[
                BeStrongUI.SkillScore = ]]..Achievement.GetRoleSkillScore(player)..[[
                BeStrongUI.PetScore = ]]..Achievement.GetPetScore(player)..[[
                BeStrongUI.GuardScore = ]]..Achievement.GetGuardScore(player)..[[
                BeStrongUI.EquipScore = ]]..Achievement.GetEquipScore(player)..[[
                BeStrongUI.WingScore = ]]..Achievement.GetWingScore(player)..[[
                BeStrongUI.Refresh()
        end
	    ]]
        --sLuaApp:NotifyTipsMsg(player, str)
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    return ""
end

-- 获取宠物前五战力评分
function Achievement.GetPetScore(player)
    return player:RecalcTop5PetFightValue()
end

-- 获取侍从前五战力评分
function Achievement.GetGuardScore(player)
    return player:RecalcTop4GuardFightValue()
end

-- 获取装备评分
function Achievement.GetEquipScore(player)
    local equip_score = 0
    local itemContainer = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
    local equip_list = itemContainer:GetItemList()
    for i = 1, #equip_list do
        equip_score = equip_score + equip_list[i]:GetScore()
    end
    return equip_score
end

-- 获取羽翼评分
function Achievement.GetWingScore(player)
    local wing_score = 0

    -- 获取拥有的羽翼id列表(illusion.xml)
    local wind_id_list = WingSystem.Get_HaveWingId(player)
    for i = 1, #wind_id_list do
        if wind_id_list[i] == 49 then
            wing_score = wing_score + 10
        else
            wing_score = wing_score + 50
        end
    end
    local wind_Attr_list = WingSystem.Get_HaveAttrList(player)
    local PhyAtk = tonumber(wind_Attr_list[43])  --物攻
    local PhyDef = tonumber(wind_Attr_list[44])  --物防
    local MagAtk = tonumber(wind_Attr_list[45])  --法攻
    local MagDef = tonumber(wind_Attr_list[46])  --法防
    local PhyBurstRate = tonumber(wind_Attr_list[68])  --物爆
    local MagBurstRate = tonumber(wind_Attr_list[71])  --法爆
    local MissRate = tonumber(wind_Attr_list[50])  --闪避
    local HitRate = tonumber(wind_Attr_list[49])  --命中
    local FightSpeed = tonumber(wind_Attr_list[51])  --速度
    wing_score = PhyAtk + MagAtk + PhyDef*0.5 + MagDef*0.5 + PhyBurstRate*0.2 + MagBurstRate*0.2 + MissRate*0.13 + HitRate*0.13 + FightSpeed
    return wing_score
end

-- 获取人物已学习的技能评分
function Achievement.GetRoleSkillScore(player)
    local skill_score = 0
    local skill_container = player:GetSkillContainer()
    local skills = skill_container:GetSkills()
    local skill_school_nr = 0
    local skill_faction_nr = 0
    local skill_practice_nr = 0
    local skill_talent_nr = 0
    for i = 1, #skills do
        local skill = skills[i]
        local skill_level = skill:GetPerformance()
        local skill_id = skill:GetId()
        local skill_data = SkillConfig.GetById(skill_id)
        if skill_data.SubType == SkillSubType.School then
            skill_school_nr = skill_school_nr + skill_level
        elseif skill_data.SubType == SkillSubType.Faction then
            skill_faction_nr = skill_faction_nr + skill_level
        elseif skill_data.SubType == SkillSubType.Practice then
            skill_practice_nr = skill_practice_nr + skill_level
        elseif skill_data.SubType == SkillSubType.Talent then
            skill_talent_nr = skill_talent_nr + skill_level
        end
    end

    skill_score = skill_school_nr * 10 + skill_faction_nr * 10 + skill_practice_nr * 10 + skill_talent_nr * 60
    return skill_score
end

--增加成就点
function Achievement.SetAchievement_point(player,data)
    local Achievement_point_id_list = {
        [1] = {id = 10,Max = 10},
        [2] = {id = 22,Max = 50},
        [3] = {id = 29,Max = 100},
        [4] = {id = 44,Max = 300},
        [5] = {id = 59,Max = 400},
        [6] = {id = 79,Max = 500},
        [7] = {id = 94,Max = 600},
        [8] = {id = 114,Max = 700},
        [9] = {id = 129,Max = 800},
        [10] = {id = 149,Max = 900},
        [11] = {id = 169,Max = 1000},
        [12] = {id = 189,Max = 1100},
    }
    local AchievementPoint = player:GetInt("Achievement_Point")
    AchievementPoint = AchievementPoint + data
    player:SetInt("Achievement_Point",AchievementPoint)
    for i = 1 ,#Achievement_point_id_list do
        local id = Achievement_point_id_list[i].id
        local step = player:GetInt("Achievement_"..id)
        local AchievementPoint_list = {}
        if step ~= -1 then
            player:SetInt("Achievement_"..id,AchievementPoint)
        end
    end
    Achievement.AchievementPoint_Refresh(player,Achievement_point_id_list)
end

function Achievement.AchievementPoint_Refresh(player,point_list)
    local Table = {}
    local position = -1
    local list = {}
    for i = 1,#point_list do
        local point_listId = point_list[i].id
        for x = i,#Achievement.AchievementConfig do
            if Achievement.AchievementConfig[x].Id == point_listId then
                list = Achievement.AchievementConfig[x]
            end
        end
        local count = player:GetInt("Achievement_"..point_listId)
        if count >= list.Max_Extent  then
            list.Now_Extent = list.Max_Extent
            list.ButtonState = 1
            table.insert(Table,1,list)
        elseif count < list.Max_Extent and count ~= -1 then
            list.Now_Extent = count
            list.ButtonState = 0
            table.insert(Table,#Table - position,list)
        elseif count == -1 then
            list.Now_Extent = list.Max_Extent
            list.ButtonState = 2
            table.insert(Table,list)
            position = position + 1
        end
    end
    --sLuaApp:LuaDbg(Lua_tools.serialize(Table))
    local str = [[
    if BeStrongUI then
        BeStrongUI.AchievementPoint_list = ]]..Lua_tools.serialize(Table)..[[
        BeStrongUI.RefreshAchievementPoint_list()
        end
	    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end
--任务完成进度
function Achievement.Mind_line_complete(player,quest_id,ring_num)
    sLuaApp:LuaDbg("任务id........."..quest_id)
    --sLuaApp:LuaDbg("quest_id.."..quest_id.."....ring_num.."..ring_num)
    local Mind_line_list = {
        --[任务ID] = 成就id
        [205] = 9,
        [224] = 2,
        [226] = 5,
        [223] = 1,
        [225] = 4,
        [222] = 3,
        [221] = 6,
        [246] = 11,
        [267] = 23,
        [295] = 30,
        [325] = 45,
        [355] = 60,
        [385] = 80,
        [415] = 95,
        [441] = 115,
        [477] = 130,
        [507] = 150,
        [536] = 170,
        [123] = 31,             --押镖
        [71] = 32,              --宝图
        [33] = 33, [34] = 33,  [35] = 33,[37] = 33,  --师门任务
        [97] = 33, [98] = 33, [99] = 33,[100] = 33,
        [83] = 33,[84] = 33,[85] = 33,[101] = 33,
        [87] = 33,[88] = 33,[89] = 33,[90] = 33,
        [164] = 33,[165] = 33,[166] = 33,[167] = 33,
        [92] = 33,[93] = 33,[94] = 33,[95] = 33,
        [11] = 40,[12] = 40,[13] = 40,[14] = 40,[16] = 40,    --小鬼
        [45] = 151,[46] = 151,[47] = 151,[48] = 151,[49] = 151,    --修罗
    }
    if Mind_line_list[quest_id] ~= nil then
        local count = player:GetInt("Achievement_"..Mind_line_list[quest_id])
        if count ~= -1 then
            player:SetInt("Achievement_"..Mind_line_list[quest_id],count + 1)
            Achievement.Achievement_Reach_RedPoint(player,Mind_line_list[quest_id])
        end
    end

    Achievement.ShowTips(player, Mind_line_list[quest_id])
end
--门派技能成就
function Achievement.AchievementSkill(player,skill,level)
    --sLuaApp:LuaDbg(skill..".............."..level)
    local job = tonumber(player:GetAttr(ROLE_ATTR_JOB_1))
    --sLuaApp:LuaDbg(job)
    player:SetInt("skill_"..skill.."_level",level)
    local level_15 = 0
    local level_45 = 0
    local level_55 = 0
    local level_65 = 0
    local level_75 = 0
    local level_85 = 0
    local level_95 = 0
    local level_105 = 0
    local level_115 = 0
    for i = 1,6 do
        local SkillLevel = player:GetInt("skill_"..i.."_level")
        if SkillLevel >= 115 then
            --sLuaApp:LuaDbg("115")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
            level_75 = level_75 + 1
            level_85 = level_85 + 1
            level_95 = level_95 + 1
            level_105 = level_105 + 1
            level_115 = level_115 + 1
        elseif SkillLevel >= 105 then
            --sLuaApp:LuaDbg("105")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
            level_75 = level_75 + 1
            level_85 = level_85 + 1
            level_95 = level_95 + 1
            level_105 = level_105 + 1
        elseif SkillLevel >= 95 then
            --sLuaApp:LuaDbg("95")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
            level_75 = level_75 + 1
            level_85 = level_85 + 1
            level_95 = level_95 + 1
        elseif SkillLevel >= 85 then
            --sLuaApp:LuaDbg("85")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
            level_75 = level_75 + 1
            level_85 = level_85 + 1
        elseif SkillLevel >= 75 then
            --sLuaApp:LuaDbg("75")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
            level_75 = level_75 + 1
        elseif SkillLevel >= 65 then
            --sLuaApp:LuaDbg("65")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
            level_65 = level_65 + 1
        elseif SkillLevel >= 55 then
            --sLuaApp:LuaDbg("55")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
            level_55 = level_55 + 1
        elseif SkillLevel >= 45 then
            --sLuaApp:LuaDbg("45")
            level_15 = level_15 + 1
            level_45 = level_45 + 1
        elseif SkillLevel >= 15 then
            --sLuaApp:LuaDbg("15")
            level_15 = level_15 + 1
        end

        local id = 15
        local count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_15)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 46
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_45)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 64
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_55)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 87
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_65)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 97
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_75)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 119
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_85)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 131
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_95)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 159
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_105)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
        id = 171
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,level_115)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
    end
end
--修炼技能成就
function Achievement.Achievement_Practice_Skill(player,skill_id,level)
    local skill_Tb = assert(load("return"..player:GetString("Achievement_PracticeSkill")))()
    if player and skill_id and level then
        if not skill_Tb or skill_Tb == "" then
            skill_Tb = {}
        end
        if not skill_Tb[skill_id.."Count"] then
            skill_Tb[skill_id.."_Count"] = level
        end
    end
    local Count10 = 0
    local Count15 = 0
    for k,v in pairs(skill_Tb) do
        if v >= 10 then
            Count10 = Count10 + 1
        end
        if v >= 15 then
            Count15 = Count15 + 1
        end
    end
        local id1 = 71
        local id2 = 96
        local id3 = 146
        local count = player:GetInt("Achievement_"..id1)
        if count ~= -1 then
            player:SetInt("Achievement_"..id1,Count10)
            Achievement.Achievement_Reach_RedPoint(player,id1)
        end

        count = player:GetInt("Achievement_"..id2)
        if count ~= -1 then
            player:SetInt("Achievement_"..id2,Count10)
            Achievement.Achievement_Reach_RedPoint(player,id2)
        end

        count = player:GetInt("Achievement_"..id3)
        if count ~= -1 then
            player:SetInt("Achievement_"..id3,Count10)
            Achievement.Achievement_Reach_RedPoint(player,id3)
        end

        local id = 186
        count = player:GetInt("Achievement_"..id)
        if count ~= -1 then
            player:SetInt("Achievement_"..id,Count15)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
    player:SetString("Achievement_PracticeSkill",Lua_tools.serialize(skill_Tb))
end
--天赋技能成就
function Achievement.Achievement_Talent_Skill(player)
    local job = tonumber(player:GetAttr(ROLE_ATTR_JOB_1))
    local id_list = {
        [1] = 72,
        [2] = 106,
        [3] = 140,
        [4] = 152,
        [5] = 180
    }
    local count = 0
    local Talent_Skill = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
    local ISkill_list = Talent_Skill['Job_'..tostring(job)]
    for k,v in pairs(ISkill_list) do
        if v == 2 then
            count = count + 1
        end
    end
    for i = 1, 5 do
        local id = id_list[i]
        local Num = player:GetInt("Achievement_"..id)
        if Num ~= -1 then
            player:SetInt("Achievement_"..id,count)
            Achievement.Achievement_Reach_RedPoint(player,id)
        end
    end
end
--升级成就
function Achievement.Level_Up(player,level)
    for i = 201, 209 do
        local count = player:GetInt("Achievement_"..i)
        if count ~= -1 then
            --sLuaApp:LuaDbg(i)
            player:SetInt("Achievement_"..i,level)

            local config = Achievement.AchievementConfigEx[i]
            local check_level = config["Max_Extent"]
            if count <= check_level and check_level <= level then
                Achievement.Achievement_Reach_RedPoint(player,i)
                Achievement.ShowTips(player, i)
            end
        end
    end
end
--装备成就
function Achievement.Equip_Achievement(player)
    --sLuaApp:LuaDbg("装备成就重新评判1")
    local container = player:GetEquipContainer()
    local equips = container:GetItemList()
    local EquipLevel_4 = 0
    local EquipLevel_8 = 0
    local EquipLevel_12 = 0
    local EquipLevel_16 = 0
    local GemLevel_3 = 0
    local GemLevel_5 = 0
    local GemLevel_7 = 0
    local GemLevel_9 = 0
    local EquipGrade_4 = 0
    local EquipGrade_5 = 0
    for k, item in ipairs(equips) do
        --获取装备强化等级
        local EQUIP_IntensifyLevel = tonumber(item:GetInt("EQUIP_IntensifyLevel"))
        if EQUIP_IntensifyLevel >= 16 then
            EquipLevel_4 = EquipLevel_4 + 1
            EquipLevel_8 = EquipLevel_8 + 1
            EquipLevel_12 = EquipLevel_12 + 1
            EquipLevel_16 = EquipLevel_16 + 1
        elseif EQUIP_IntensifyLevel >= 12 then
            EquipLevel_4 = EquipLevel_4 + 1
            EquipLevel_8 = EquipLevel_8 + 1
            EquipLevel_12 = EquipLevel_12 + 1
        elseif EQUIP_IntensifyLevel >= 8 then
            EquipLevel_4 = EquipLevel_4 + 1
            EquipLevel_8 = EquipLevel_8 + 1
        elseif EQUIP_IntensifyLevel >= 4 then
            EquipLevel_4 = EquipLevel_4 + 1
        end
        --获取装备品质
        local Grade = tonumber(ItemConfig.GetByKeyName(item:GetKeyName()).Grade)
        if Grade == 5 then
            EquipGrade_5 = EquipGrade_5 + 1
            EquipGrade_4 = EquipGrade_4 + 1
        elseif Grade == 4 then
            EquipGrade_4 = EquipGrade_4 + 1
        end
        --获取宝石等级
--[[        local Gem1 = tonumber(item:GetInt("ITEM_GemId_1"))
        local Gem2 = tonumber(item:GetInt("ITEM_GemId_2"))
        local Gem3 = tonumber(item:GetInt("ITEM_GemId_3"))]]
        for i = 1,3 do
            local GemLevel = tonumber(item:GetInt("ITEM_GemId_"..i))%100
            --sLuaApp:LuaDbg(GemLevel)
            if GemLevel >= 9 then
                GemLevel_3 = GemLevel_3 + 1
                GemLevel_5 = GemLevel_5 + 1
                GemLevel_7 = GemLevel_7 + 1
                GemLevel_9 = GemLevel_9 + 1
            elseif GemLevel >= 7 then
                GemLevel_3 = GemLevel_3 + 1
                GemLevel_5 = GemLevel_5 + 1
                GemLevel_7 = GemLevel_7 + 1
            elseif GemLevel >= 5 then
                GemLevel_3 = GemLevel_3 + 1
                GemLevel_5 = GemLevel_5 + 1
            elseif GemLevel >= 3 then
                GemLevel_3 = GemLevel_3 + 1
            end
        end
    end
    local Count = player:GetInt("Achievement_42")
    if Count ~= -1 then
        player:SetInt("Achievement_42",EquipLevel_4)
        Achievement.Achievement_Reach_RedPoint(player,42)
    end
    Count = player:GetInt("Achievement_63")
    if Count ~= -1 then
        player:SetInt("Achievement_63",EquipLevel_4)
        Achievement.Achievement_Reach_RedPoint(player,63)
    end
    Count = player:GetInt("Achievement_104")
    if Count ~= -1 then
        player:SetInt("Achievement_104",EquipLevel_8)
        Achievement.Achievement_Reach_RedPoint(player,104)
    end
    Count = player:GetInt("Achievement_138")
    if Count ~= -1 then
        player:SetInt("Achievement_138",EquipLevel_12)
        Achievement.Achievement_Reach_RedPoint(player,138)
    end
    Count = player:GetInt("Achievement_178")
    if Count ~= -1 then
        player:SetInt("Achievement_178",EquipLevel_16)
        Achievement.Achievement_Reach_RedPoint(player,178)
    end
    Count = player:GetInt("Achievement_43")
    if Count ~= -1 then
        player:SetInt("Achievement_43",GemLevel_3)
        Achievement.Achievement_Reach_RedPoint(player,43)
    end
    Count = player:GetInt("Achievement_70")
    if Count ~= -1 then
        player:SetInt("Achievement_70",GemLevel_3)
        Achievement.Achievement_Reach_RedPoint(player,70)
    end
    Count = player:GetInt("Achievement_105")
    if Count ~= -1 then
        player:SetInt("Achievement_105",GemLevel_5)
        Achievement.Achievement_Reach_RedPoint(player,105)
    end
    Count = player:GetInt("Achievement_139")
    if Count ~= -1 then
        player:SetInt("Achievement_139",GemLevel_7)
        Achievement.Achievement_Reach_RedPoint(player,139)
    end
    Count = player:GetInt("Achievement_179")
    if Count ~= -1 then
        player:SetInt("Achievement_179",GemLevel_9)
        Achievement.Achievement_Reach_RedPoint(player,179)
    end
    Count = player:GetInt("Achievement_147")
    if Count ~= -1 then
        player:SetInt("Achievement_147",EquipGrade_4)
        Achievement.Achievement_Reach_RedPoint(player,147)
    end
    Count = player:GetInt("Achievement_187")
    if Count ~= -1 then
        player:SetInt("Achievement_187",EquipGrade_5)
        Achievement.Achievement_Reach_RedPoint(player,187)
    end
end
--装备打造和炼化
function Achievement.Equip_Other(player,type)
    --type == 1 炼化 2 打造
    if type == 1 then
        local Count = player:GetInt("Achievement_56")
        if Count ~= -1 then
            player:SetInt("Achievement_56",1)
            Achievement.Achievement_Reach_RedPoint(player,56)
        end

    elseif type == 2 then
        local Count = player:GetInt("Achievement_57")
        if Count ~= -1 then
            player:SetInt("Achievement_57",1)
            Achievement.Achievement_Reach_RedPoint(player,57)
        end
    end
end
--添加好友成就
function Achievement.Add_Friend_Achievement(player,Type)
    local Add_or_Delete = 0
    if Type == 1 then
        Add_or_Delete = 1
    elseif Type == 0 then
        Add_or_Delete = -1
    end
    local count = player:GetInt("Achievement_21")
    if count ~= -1 then
        player:SetInt("Achievement_21",count + Add_or_Delete)
        Achievement.Achievement_Reach_RedPoint(player,21)
    end
    for i = 190, 194 do
        local count = player:GetInt("Achievement_"..i)
        if count ~= -1 then
            player:SetInt("Achievement_"..i,count + Add_or_Delete)
            Achievement.Achievement_Reach_RedPoint(player,i)
        end
    end
end
--宠物突破
function Achievement.Achievement_Pet_Breach(player,Rank,guid) --player,星级,获得/失去
    --sLuaApp:LuaDbg("Rank........"..Rank..".....guid......."..guid)
    if Rank == 2 then
        local Num = player:GetInt("Achievement_83")
        local Flag = true
        if Num ~= -1 then
            local count = 1
            while player:GetInt("Achievement2Pet"..count) ~= 0 do
                if player:GetInt("Achievement2Pet"..count) == tonumber(guid) then
                    Flag = false
                    break
                end
                count = count + 1
            end
            if Flag == true then
                player:SetInt("Achievement2Pet"..count,tonumber(guid))
                Num = Num + 1
                if Num <= 1 then
                    player:SetInt("Achievement_52",Num)
                    player:SetInt("Achievement_62",Num)
                    player:SetInt("Achievement_83",Num)
                    Achievement.Achievement_Reach_RedPoint(player,52)
                    Achievement.Achievement_Reach_RedPoint(player,62)
                    Achievement.Achievement_Reach_RedPoint(player,83)
                elseif Num <= 2 then
                    player:SetInt("Achievement_62",Num)
                    player:SetInt("Achievement_83",Num)
                    Achievement.Achievement_Reach_RedPoint(player,62)
                    Achievement.Achievement_Reach_RedPoint(player,83)
                elseif Num <= 4 then
                    player:SetInt("Achievement_83",Num)
                    Achievement.Achievement_Reach_RedPoint(player,83)
                end
            end
        end
    elseif Rank == 3 then
        local Num = player:GetInt("Achievement_125")
        local Flag = true
        if Num ~= -1 then
            local count = 1
            while player:GetInt("Achievement3Pet"..count) ~= 0 do
                if player:GetInt("Achievement3Pet"..count) == tonumber(guid) then
                    Flag = false
                    break
                end
                count = count + 1
            end
            if Flag == true then
                player:SetInt("Achievement3Pet"..count,tonumber(guid))
                Num = Num + 1
                player:SetInt("Achievement_125",Num)
                Achievement.Achievement_Reach_RedPoint(player,125)
            end
        end
    elseif Rank == 5 then
        local Num = player:GetInt("Achievement_165")
        local Flag = true
        if Num ~= -1 then
            local count = 1
            while player:GetInt("Achievement5Pet"..count) ~= 0 do
                if player:GetInt("Achievement5Pet"..count) == tonumber(guid) then
                    Flag = false
                    break
                end
                count = count + 1
            end
            if Flag == true then
                player:SetInt("Achievement5Pet"..count,tonumber(guid))
                Num = Num + 1
                player:SetInt("Achievement_165",Num)
                Achievement.Achievement_Reach_RedPoint(player,165)
            end
        end
    end
end
--宠物杂项
function Achievement.Achievement_Pet_Other(player) --player
    local count = player:GetInt("Achievement_113")
    if count ~= -1 then
        player:SetInt("Achievement_113",1)
        Achievement.Achievement_Reach_RedPoint(player,113)
    end
end
--宠物染色
function Achievement.Achievement_Pet_ChangeColor(player)
    local count = player:GetInt("Achievement_93")
    if count ~= -1 then
        player:SetInt("Achievement_93",1)
        Achievement.Achievement_Reach_RedPoint(player,93)
    end
end
--宠物获得
function Achievement.Achievement_GetPet(player)
    --sLuaApp:LuaDbg("宠物获得成就")
    local count = player:GetInt("Achievement_7")
    --sLuaApp:LuaDbg(type(count))
    if count ~= -1 then
        player:SetInt("Achievement_7",1)
        Achievement.Achievement_Reach_RedPoint(player,7)
        if count == 0 then
            Achievement.ShowTips(player, 7)
        end
    end
end
--乡试成就
function Achievement.Achievement_XiangShi(player)
    local count = player:GetInt("Achievement_55")
    if count ~= -1 then
        player:SetInt("Achievement_55",1)
        Achievement.Achievement_Reach_RedPoint(player,55)
    end
end
--副本秘境成就
function Achievement.Achievement_Mysterious_Place(player,DungeonName)
    --sLuaApp:LuaDbg("DungeonName........"..DungeonName)
    local Mysterious_Place_IDList = {
        [1] = {Name ="大雁塔", id = 39},
        [2] = {Name ="砂城遗址",id = 54},
        [3] = {Name ="傲来秘宝",id = 61},
        [4] = {Name ="水帘洞",id = 81},
        [5] = {Name ="梦回千古",id = 82},
        [6] = {Name ="洞窟伏魔",id = 103},
        [7] = {Name ="人鬼绝恋",id = 116},
        [8] = {Name ="巅峰试炼",id = 117},
        [9] = {Name = "大雁塔(困难)",id = 210},
        [10] = {Name = "沙城遗址(困难)",id = 211},
        [11] = {Name = "水帘洞(困难)",id = 212},
        [12] = {Name = "巅峰试炼(困难)",id = 213},
        [13] = {Name = "傲来秘宝(困难)",id = 214},
        [14] = {Name = "梦回千古(困难)",id = 215},
        [15] = {Name = "洞窟伏魔(困难)",id = 216},
        [16] = {Name = "人鬼绝恋(困难)",id = 217},

    }
    local id = nil
    for i = 1,#Mysterious_Place_IDList do
        local Mysterious_Place_Data = Mysterious_Place_IDList[i]
        if DungeonName == Mysterious_Place_Data.Name then
            id = Mysterious_Place_Data.id
            local count = player:GetInt("Achievement_"..id)
            if count ~= -1 and id then
                player:SetInt("Achievement_"..id,1)
                Achievement.Achievement_Reach_RedPoint(player,id)
                break
            end
        end
    end
end

--阵法成就
function Achievement.Achievement_Battle_Array(player,level)
    if level == 1 then
        local count = player:GetInt("Achievement_27")
        if count ~= -1 then
            player:SetInt("Achievement_27",count + 1)
            Achievement.Achievement_Reach_RedPoint(player,27)
        end

        count = player:GetInt("Achievement_85")
        if count ~= -1 then
            player:SetInt("Achievement_85",count + 1)
            Achievement.Achievement_Reach_RedPoint(player,85)
        end

        count = player:GetInt("Achievement_148")
        if count ~= -1 then
            player:SetInt("Achievement_148",count + 1)
            Achievement.Achievement_Reach_RedPoint(player,148)
        end
    elseif level == 2 then
        local count = player:GetInt("Achievement_128")
        if count ~= -1 then
            player:SetInt("Achievement_128",1)
            Achievement.Achievement_Reach_RedPoint(player,128)
        end
    elseif level == 5 then
        local count = player:GetInt("Achievement_168")
        if count ~= -1 then
            player:SetInt("Achievement_168",1)
            Achievement.Achievement_Reach_RedPoint(player,168)
        end
    end
end
--完成1次祈福
function Achievement.Achievement_Prayer(player)
    local count = player:GetInt("Achievement_14")
    if count ~= -1 then
        player:SetInt("Achievement_14",1)
        Achievement.Achievement_Reach_RedPoint(player,14)
    end
end

--侍从获得成就
function Achievement.Achievement_Guard(player,guard,guard_rank)
    local Achievement_guard_list = {
        [12] = "水德真君",
        [13] = "地涌夫人",
    }
    if guard_rank == 1 then
        for k,v in pairs(Achievement_guard_list) do
            if guard == v then
                player:SetInt("Achievement_"..k,1)
                Achievement.Achievement_Reach_RedPoint(player,k)
                break
            end
        end
        local all = player:GetInt("Achievement_26")
        if all == -1 then
            return
        else
            all = all + 1
            player:SetInt("Achievement_26",all)
            Achievement.Achievement_Reach_RedPoint(player,26)
        end
    elseif guard_rank == 2 then
        local all = player:GetInt("Achievement_58")
        if all == -1 then
            return
        else
            player:SetInt("Achievement_58",1)
            Achievement.Achievement_Reach_RedPoint(player,58)
        end
    elseif guard_rank == 3 then
        local all = player:GetInt("Achievement_126")
        if all == -1 then
            return
        else
            all = all + 1
            player:SetInt("Achievement_126",all)
            Achievement.Achievement_Reach_RedPoint(player,126)
        end
    elseif guard_rank == 5 then
        local all = player:GetInt("Achievement_166")
        if all == -1 then
            return
        else
            all = all + 1
            player:SetInt("Achievement_166",all)
            Achievement.Achievement_Reach_RedPoint(player,166)
        end
    end
end

--侍从情缘成就
function Achievement.Achievement_Guard_Friendship(player)
    local all = player:GetInt("Achievement_112")
    if all == -1 then
        return
    else
        all = all + 1
        player:SetInt("Achievement_112",all)
        Achievement.Achievement_Reach_RedPoint(player,112)
    end
end

--活跃度奖励成就
function Achievement.Achievement_Active(player)
    local count = player:GetInt("Achievement_24")
    if count ~= -1 then
        player:SetInt("Achievement_24",1)
        Achievement.Achievement_Reach_RedPoint(player,24)
    end
end
--加入帮派成就
function Achievement.Achievement_Faction(player)
    local count = player:GetInt("Achievement_41")
    if count ~= -1 then
        player:SetInt("Achievement_41",1)
        Achievement.Achievement_Reach_RedPoint(player,41)
    end
end
--加入队伍成就
function Achievement.Achievement_Team(player)
    local count = player:GetInt("Achievement_28")
    if count ~= -1 then
        player:SetInt("Achievement_28",1)
        Achievement.Achievement_Reach_RedPoint(player,28)
    end
end
--师徒成就
function Achievement.Achievement_Master(player,Type)
    if Type == 0 then
        --拜师
        local count = player:GetInt("Achievement_25")
        if count ~= -1 then
            Achievement.Achievement_Reach_RedPoint(player,25)
            player:SetInt("Achievement_25",1)
        end
    elseif Type == 1 then
        --收徒
        local count = player:GetInt("Achievement_86")
        if count ~= -1 then
            Achievement.Achievement_Reach_RedPoint(player,86)
            player:SetInt("Achievement_86",1)
        end
    end
end
--官职成就
function Achievement.Achievement_Position(player)
    local Rank = player:GetInt("NowPosition")
    if Rank >= 2 then
        local count = player:GetInt("Achievement_53")
        if count ~= -1 then
            player:SetInt("Achievement_53",1)
            Achievement.Achievement_Reach_RedPoint(player,53)
        end
    else
        return
    end
    if Rank >= 6 then
        local count = player:GetInt("Achievement_118")
        if count ~= -1 then
            player:SetInt("Achievement_118",1)
            Achievement.Achievement_Reach_RedPoint(player,118)
        end
    else
        return 
    end
    if Rank >= 8 then
        local count = player:GetInt("Achievement_158")
        if count ~= -1 then
            player:SetInt("Achievement_158",1)
            Achievement.Achievement_Reach_RedPoint(player,158)
        end
    else
        return 
    end
    if Rank >= 10 then
        local count = player:GetInt("Achievement_177")
        if count ~= -1 then
            player:SetInt("Achievement_177",1)
            Achievement.Achievement_Reach_RedPoint(player,177)
        end
    else
        return 
    end
end
--羽翼成长成就
function Achievement.Achievement_wing(player)
    local level = player:GetInt("WingGrow_Level")
    local Stage = player:GetInt("WingGrow_Stage")
    --sLuaApp:LuaDbg(level)
    --sLuaApp:LuaDbg(Stage)
    local count = player:GetInt("Achievement_78")
    if count ~= -1 then
        player:SetInt("Achievement_78",level)
        Achievement.Achievement_Reach_RedPoint(player,78)
    end
    count = player:GetInt("Achievement_84")
    if count ~= -1 then
        player:SetInt("Achievement_84",level)
        Achievement.Achievement_Reach_RedPoint(player,84)
    end
    count = player:GetInt("Achievement_127")
    if count ~= -1 then
        player:SetInt("Achievement_127",Stage)
        Achievement.Achievement_Reach_RedPoint(player,127)
    end
    count = player:GetInt("Achievement_137")
    if count ~= -1 then
        player:SetInt("Achievement_137",Stage)
        Achievement.Achievement_Reach_RedPoint(player,137)
    end
    count = player:GetInt("Achievement_167")
    if count ~= -1 then
        player:SetInt("Achievement_167",Stage)
        Achievement.Achievement_Reach_RedPoint(player,167)
    end
    count = player:GetInt("Achievement_188")
    if count ~= -1 then
        player:SetInt("Achievement_188",Stage)
        Achievement.Achievement_Reach_RedPoint(player,188)
    end
end
--商店购买道具
function Achievement.Achievement_shop_buy(player,item_id)
    --购买一个五色花
    if tonumber(item_id) == 32419 then
        local count = player:GetInt("Achievement_8")
        if count ~= -1 then
            player:SetInt("Achievement_8",1)
            Achievement.Achievement_Reach_RedPoint(player,8)
        end
    end
end
--成就达成显示小红点判断
function Achievement.Achievement_Reach_RedPoint(player,id)
    local Extent = tonumber(player:GetInt("Achievement_"..id))
    local Count = 0
    local flag = nil
    for i = 1,#Achievement.AchievementConfig do
        if id == Achievement.AchievementConfig[i].Id then
            Count = i
        end
    end
  	--因为成就表内数据被删除导致找不到索引 2023/3/7 HY
    if Count == 0 then
        return
    end
    --因为成就表内数据被删除导致找不到索引END
    if not Achievement.AchievementConfig[Count].Max_Extent then
        return
    end
    if Extent >= Achievement.AchievementConfig[Count].Max_Extent then
        flag = 1
    end
    --sLuaApp:LuaDbg("1flag:"..flag)
    if flag ~= nil then
        local str = [[
        if GlobalProcessing then
            GlobalProcessing.BeStrongData = ]]..Lua_tools.serialize(flag)..[[
            GlobalProcessing.BeStrong_Red_Point()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    return ""
end
--发送成就数据
function Achievement.GetAchievement(player)
    local Achievement_list = {}
    local RedPointList = {}
    local position = -1
    for i = 1, #Achievement.AchievementConfig do
        local List = Achievement.AchievementConfig[i]
        local id = List.Id
        local count = player:GetInt("Achievement_"..id)
        if count >= List.Max_Extent  then
            List.Now_Extent = List.Max_Extent
            List.ButtonState = 1
            table.insert(Achievement_list,1,List)
            table.insert(RedPointList,List.Type..","..List.SubType)
        elseif count < List.Max_Extent and count ~= -1 then
            List.Now_Extent = count
            List.ButtonState = 0
            table.insert(Achievement_list,#Achievement_list - position,List)
        elseif count == -1 then
            List.Now_Extent = List.Max_Extent
            List.ButtonState = 2
            table.insert(Achievement_list,List)
            position = position + 1
        end
        if i == 7 then
            --sLuaApp:LuaDbg(Lua_tools.serialize(List))
        end
    end
    local str = [[
    if BeStrongUI then
        BeStrongUI.GrowupTable_Id = ]]..Lua_tools.serialize(Achievement_list)..[[
        BeStrongUI.AchievementPoint = ]]..Achievement.GetAchievementPoint(player)..[[
        BeStrongUI.RedPointList = ]]..Lua_tools.serialize(RedPointList)..[[
        BeStrongUI.CreateAchievement()
        end
	    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end
--领取奖励
function Achievement.GetReward(player,data)
    local id = nil
    local Num = 0
    for i = 1 ,#Achievement.AchievementConfig do
        Num = Num + 1
        if Achievement.AchievementConfig[i].Id == tonumber(data) then
            id = Achievement.AchievementConfig[i].Id
            break
        end
    end
    --sLuaApp:LuaDbg(id)
    local step = player:GetInt("Achievement_"..id)

    if step >= Achievement.AchievementConfig[Num].Max_Extent then
        local ItemContainer = player:GetItemContainer(1)
        if ItemContainer:GetFreeSiteCount() < 1 and Achievement.AchievementConfig[Num].ItemId ~= 0 then
            sLuaApp:NotifyTipsMsg(player,"背包已满，请整理后再来")
        else
            sItemSystem:MergeItemEx(player,Achievement.AchievementConfig[Num].ItemId,Achievement.AchievementConfig[Num].ItemCount, false,"system","成就达成奖励","成就"..id.."完成")
            player:AddBindGold(Achievement.AchievementConfig[Num].BindGold,"system","成就达成奖励","成就"..Achievement.AchievementConfig[Num].Id.."完成")
            player:SetInt("Achievement_"..id,-1)
            local AchPoints =Achievement.AchievementConfig[Num].AchPoints
            Achievement.SetAchievement_point(player,AchPoints)
            Achievement.RefreshAchievement(player,Num)
            sLuaApp:NotifyTipsMsg(player, "恭喜达成成就，您获得了".."#OFFSET<X:0,Y:-8#IMAGE1800408280#OFFSETEND>#"..Achievement.AchievementConfig[Num].BindGold)
            Achievement.Refresh_red_point(player)
        end
    end
end

function Achievement.GetAchievementPoint(player)
    local AchievementPoint = player:GetInt("Achievement_Point")
    return AchievementPoint
end

function Achievement.RefreshAchievement(player,Num)
    local Data = Achievement.AchievementConfig[Num]
    Data.ButtonState = 2
    Data.Now_Extent = Data.Max_Extent
    local str = [[
        if BeStrongUI then
        BeStrongUI.RefreshData = ]]..Lua_tools.serialize(Data)..[[
        BeStrongUI.AchievementPoint = ]]..Achievement.GetAchievementPoint(player)..[[
        BeStrongUI.RefreshAchievement()
        end]]
    --sLuaApp:LuaDbg(str)
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

function Achievement.Red_Point_Main(player)
    if player == nil then

    end
end
--奖励领取判断主红点是否消失
function Achievement.Refresh_red_point(player)
    local flag = nil
    for i = 1,#Achievement.AchievementConfig do
        local count = player:GetInt("Achievement_"..Achievement.AchievementConfig[i].Id)
        if count >= Achievement.AchievementConfig[i].Max_Extent then
            flag = 1
            --sLuaApp:LuaDbg(i)
            break
        else
            flag = 0
        end

    end
    if flag ~= nil then
        sLuaApp:LuaDbg("2flag:"..flag)
        local str = [[
        if GlobalProcessing then
            GlobalProcessing.BeStrongData = ]]..Lua_tools.serialize(flag)..[[
            GlobalProcessing.BeStrong_Red_Point()
        end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end
    return ""
end

function Achievement.CreateRemainPoint(player)
    Achievement.Refresh_red_point(player)
    local str = [[
    if GlobalProcessing then
        GlobalProcessing.AchievementListen()
    end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

function Achievement.ReFinishQuest(player)
    if player:GetInt("AchievementQuestReQuery") ~= 0 then
        return
    end
    --sLuaApp:LuaDbg("开始重新判断主线任务完成情况")
        local Quest_List = {
    [205] = 9,
    [224] = 2,
    [226] = 5,
    [223] = 1,
    [225] = 4,
    [222] = 3,
    [221] = 6,
    [246] = 11,
    [267] = 23,
    [295] = 30,
    [325] = 45,
    [355] = 60,
    [385] = 80,
    [415] = 95,
    [441] = 115,
    [477] = 130,
    [507] = 150,
    [536] = 170,}
    for k,v in pairs(Quest_List) do
        if sQuestSystem:IsFinished(player, k) then
            --sLuaApp:LuaDbg("任务ID："..k..".......完成")
            if player:GetInt("Achievement_"..v) ~= -1 then
                player:SetInt("Achievement_"..v,1)
                Achievement.Achievement_Reach_RedPoint(player,v)
            else
                --sLuaApp:LuaDbg("成就奖励已领取")
            end
        end
    end
    player:SetInt("AchievementQuestReQuery",1)
end

--提示成就完成
function Achievement.ShowTips(player, id)
    local config = Achievement.AchievementConfigEx[id]
    if not config then
        return
    end
    local duration = config["TipsDuration"]
    if not duration or duration <= 0 then
        return
    end
    local info = config["Info"]
    local icon = config["Icon"]
    --同时触发多个

    local str = [[
        if GUI.GetWnd("AchievementPopupUI") then
            AchievementPopupUI.OnExit()
        end
        GUI.OpenWnd("AchievementPopupUI")
        AchievementPopupUI.Info = "]]..info..[["
        AchievementPopupUI.Icon = "]]..icon..[["
        AchievementPopupUI.Duration = ]]..duration..[[
        if AchievementPopupUI then
            AchievementPopupUI.RefreshAllData()
        end
        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    -- sLuaApp:LuaErr(str)
end

function Achievement.Initialization()
    Achievement.AchievementConfigEx = {}
    for k, v in ipairs(Achievement.AchievementConfig) do
        Achievement.AchievementConfigEx[v["Id"]] = v
    end
end
Achievement.Initialization()