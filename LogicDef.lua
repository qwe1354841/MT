-- 物品容器
ITEM_CONTAINER_NULL         =   0
ITEM_CONTAINER_BAG          =   1       -- 背包
ITEM_CONTAINER_TEMP_BAG     =   2       -- 临时背包
ITEM_CONTAINER_GEM_BAG      =   3       -- 宝石背包
ITEM_CONTAINER_GUARD_BAG    =   4       -- 信物背包
ITEM_CONTAINER_EQUIP        =   5       -- 装备
ITEM_CONTAINER_PET_EQUIP    =   6       -- 宠物装备
ITEM_CONTAINER_WAREHOUSE_ITEMS  = 7     -- 物品仓库
ITEM_CONTAINER_GUARD_EQUIP  = 8         -- 侍从装备
ITEM_CONTAINER_LINGBAO_BAG  = 9         -- 灵宝背包
ITEM_CONTAINER_LINGBAG_EQUIP    = 10    -- 灵宝装备

-- 物品类型
ITEM_TYPE_NULL              =   0
ITEM_TYPE_EQUIP             =   1       -- 装备
ITEM_TYPE_CONSUMABLE        =   2       -- 消耗品
ITEM_TYPE_MATERIAL          =   3       -- 材料
ITEM_TYPE_TREASURE_MAP      =   4       -- 藏宝图
ITEM_TYPE_QUEST             =   5       -- 任务
ITEM_TYPE_GUARD_TOKEN       =   6       -- 侍从信物
ITEM_TYPE_PET               =   7       -- 宠物
ITEM_TYPE_GUARD             =   8       -- 侍从
ITEM_TYPE_LINGBAO           =   9       -- 灵宝

-- 装备子类型
EQUIP_NULL                  =   0
EQUIP_WEAPON                =   1       -- 武器
EQUIP_ARMOR                 =   2       -- 防具
EQUIP_ACCESSORIES           =   3       -- 饰品
EQUIP_AMULET                =   4       -- 法宝
EQUIP_MOUNT                 =   5       -- 坐骑
EQUIP_FASHION               =   6       -- 时装
EQUIP_PET_EQUIP             =   7       -- 宠物装备

-- [装备]武器
WEAPON_NULL                 =   0
WEAPON_EPEE                 =   1       -- 重剑
WEAPON_FAN                  =   2       -- 扇子
WEAPON_FLUTE                =   3       -- 笛子
WEAPON_BROADSWORD           =   4       -- 阔刀
WEAPON_WRITING_BRUSH        =   5       -- 毛笔
WEAPON_SPEAR                =   6       -- 长枪
WEAPON_CLAW_KNIFE           =   7       -- 爪刺
WEAPON_UMBRELLA             =   8       -- 秀伞
WEAPON_SHORT_STAFF          =   9       -- 短杖
WEAPON_BOW                  =   10      -- 弓箭
WEAPON_DOUBLE_SWORDS        =   11      -- 双剑
WEAPON_WHIP                 =   12      -- 长鞭

-- [装备]防具
ARMOR_NULL                  =   0
ARMOR_HAT                   =   1       -- 帽子
ARMOR_CLOTH                 =   2       -- 衣服
ARMOR_BELT                  =   3       -- 腰带
ARMOR_PENDANT               =   5       -- 挂坠

-- [装备]饰品
ACCESSORIES_NULL            =   0
ACCESSORIES_RING            =   1       -- 戒指
ACCESSORIES_NECKLACE        =   2       -- 项链
ACCESSORIES_WRIST	        =   3       -- 护腕
ACCESSORIES_SHOES           =   4       -- 鞋子

-- [装备]宠物装备
PET_EQUIP_NULL              =   0
PET_EQUIP_COLLOR            =   1       -- 宠物项圈
PET_EQUIP_ARMOR             =   2       -- 宠物盔甲
PET_EQUIP_AMULET            =   3       -- 宠物护符
PET_EQUIP_ACCESSORY         =   4       -- 宠物饰品

-- 消耗品子类型
CONSUMABLE_NULL             =   0
CONSUMABLE_ATTR_PROMOTION   =   1       -- 影响属性
CONSUMABLE_STATE_PROMOTION  =   2       -- 影响状态
CONSUMABLE_GET_ITEM         =   3       -- 获得物品
CONSUMABLE_GET_PET          =   4       -- 获得宠物
CONSUMABLE_GET_TITLE        =   5       -- 获得称号
CONSUMABLE_ACTIVE_SKILL     =   6       -- 激活技能
CONSUMABLE_ACTIVE_TASK      =   7       -- 激活任务
CONSUMABLE_ACTIVE_MANUAL    =   8       -- 激活图鉴
CONSUMABLE_ACTIVE_SEAT      =   9       -- 激活阵法
CONSUMABLE_MAP_TRANSFER     =   10      -- 地图传送
CONSUMABLE_TASK_TRANSFER    =   11      -- 任务传送
CONSUMABLE_PET_TRANSFORMER  =   12      -- 宠物变身
CONSUMABLE_CLEAR_ATTR_POINT =   13      -- 洗灵丹
CONSUMABLE_EXPAND_SITE      =   14      -- 栏位扩充
CONSUMABLE_GIFT_PACKAGE     =   15      -- 礼包
CONSUMABLE_TREASURE_SLICE   =   16      -- 藏宝图碎片
CONSUMABLE_ADD_PRIMARY_ATTR =   17      -- 增加以及属性
CONSUMABLE_TRANSFER_PRIMARY_ATTR = 18   -- 转移一级属性
CONSUMABLE_ENCHANT          =   19      -- 附魔
CONSUMABLE_PICKUP_AND_USE   =   20      -- 结婚礼包
CONSUMABLE_FIREWORK         =   21      -- 礼花
CONSUMABLE_TALENT_BOOK      =   22      -- 天赋秘籍
CONSUMABLE_NOCOMBAT_BUFF    =   23      -- 非战斗BUFF
CONSUMABLE_EMOJI            =   24      -- 表情包
CONSUMABLE_HP_STORE         =   25      -- 血池
CONSUMABLE_MP_STORE         =   26      -- 魔池
CONSUMABLE_TRANSFER_TO_TEAMLEADER = 27  -- 传送至队长身边
CONSUMABLE_WALLET           =   28      -- 钱包
CONSUMABLE_PRODUCT          =   29      -- 生产
CONSUMABLE_MONEY_TREE       =   30      -- 摇钱树
CONSUMABLE_CATCH_PET        =   31      -- 宠物抓取
CONSUMABLE_ACTIVE_GUARD     =   32      -- 侍从激活道具
CONSUMABLE_DOUBLE_EXP_POINT =   33      -- 双倍经验点数
CONSUMABLE_NO_PRODUCT       =   34      -- 从商店购买的生产物品
CONSUMABLE_FLIGHT_FLAG      =   35      -- 飞行棋道具
CONSUMABLE_FLIGHT_SUPPLEMENT =  36      -- 飞行棋补充包
CONSUMABLE_GUILD_CONTRB     =   37      -- 帮贡
CONSUMABLE_OFFLINE_STALL_TIME = 38      -- 离线摆摊时间
CONSUMABLE_AMULET_SLICE     =   39      -- 法宝碎片
CONSUMABLE_ASSIST_POINT     =   40      -- 辅助点数
CONSUMABLE_ACTIVE_LIMIT_GUARD = 41      -- 限时侍从激活道具
CONSUMABLE_PET_LEGEND_SLICE =   42      -- 神兽碎片
CONSUMABLE_PLAYER_EXP       =   43      -- 人物经验丹
CONSUMABLE_ACTIVE_CLOTHES   =   44      -- 时装解锁
CONSUMABLE_ACTIVE_WING      =   45      -- 羽翼解锁 

-- 材料子类型
MATERIAL_NULL               =   0
MATERIAL_ATTR_PROMOTION     =   1       -- 影响属性
MATERIAL_STATE_PROMOTION    =   2       -- 影响状态
MATERIAL_RATE_PROMOTION     =   3       -- 影响概率
MATERIAL_GET_PET            =   4       -- 获得宠物
MATERIAL_GET_PET_SKILL      =   5       -- 获取指定宠物技能
MATERIAL_ACTIVE_SKILL       =   6       -- 激活技能
MATERIAL_EQUIP_DEVELOP      =   7       -- 装备养成
MATERIAL_TASK_ITEM          =   8       -- 任务相关
MATERIAL_GEM_ITEM           =   9       -- 宝石相关
MATERIAL_TASK_TRANSFER      =   10      -- 任务传送
MATERIAL_BAG_EXPAND         =   11      -- 栏位扩充
MATERIAL_DOUBLE_DOLL        =   12      -- 替身娃娃
MATERIAL_PET_TRAIN          =   13      -- 宠物培养
MATERIAL_SUNDRIES           =   14      -- 杂货
MATERIAL_PET_EGG            =   15      -- 宠物蛋
MATERIAL_SEAT               =   16      -- 阵法相关
MATERIAL_GUARD              =   17      -- 侍从物品
MATERIAL_MARRIAGE           =   18      -- 婚姻
MATERIAL_PRACTICE           =   19      -- 修炼道具
MATERIAL_PET_LIQUID         =   20      -- 宠物培养液
MATERIAL_COOK               =   21      -- 烹饪
MATERIAL_MEDICINE           =   22      -- 制药
MATERIAL_LADDER             =   23      -- 竞技场
MATERIAL_HORN               =   24      -- 喇叭
MATERIAL_FRIENDLY           =   25      -- 好感度道具
MATERIAL_COLOR              =   26      -- 染色
MATERIAL_EQUIP_MANUAL_SKILL =   27      -- 装备特技
MATERIAL_EQUIP_PASSIVE_SKILL =  28      -- 装备特效
MATERIAL_WING_TRAIN         =   29      -- 羽翼成长
MATERIAL_WING_GRADE         =   30      -- 羽翼升阶

-- 藏宝图子类型
TREASURE_SLICE_TYPE1        =   1
TREASURE_SLICE_TYPE2        =   2
TREASURE_SLICE_TYPE3        =   3
TREASURE_SLICE_TYPE4        =   4
TREASURE_SLICE_TYPE5        =   5

TREASURE_SLICE_ADVANCED_TYPE1        =   1
TREASURE_SLICE_ADVANCED_TYPE2        =   2
TREASURE_SLICE_ADVANCED_TYPE3        =   3
TREASURE_SLICE_ADVANCED_TYPE4        =   4
TREASURE_SLICE_ADVANCED_TYPE5        =   5

-- 物品品质
ITEM_GRADE_WHITE    =   1
ITEM_GRADE_GREEN    =   2
ITEM_GRADE_BLUE     =   3
ITEM_GRADE_PURPLE   =   4
ITEM_GRADE_ORANGE   =   5

-- 装备位置
EQUIP_SITE_WEAPON   =   0   -- 武器
EQUIP_SITE_HAT      =   1   -- 帽子
EQUIP_SITE_CLOTH    =   2   -- 衣服
EQUIP_SITE_BELT     =   3   -- 腰带
EQUIP_SITE_SHOES    =   4   -- 鞋子
EQUIP_SITE_WRIST    =   5   -- 护腕
EQUIP_SITE_RING     =   6   -- 戒指
EQUIP_SITE_NECKLACE =   7   -- 项链
EQUIP_SITE_HANGINGS =   8   -- 挂坠
EQUIP_SITE_AMULET   =   9   -- 法宝
EQUIP_SITE_MOUNT    =   10  -- 坐骑

-- 宠物装备位置
PET_EQUIP_SITE_COLLAR       =   0       -- 宠物项圈
PET_EQUIP_SITE_ARMOR        =   1       -- 宠物盔甲
PET_EQUIP_SITE_AMULET       =   2       -- 宠物护符
PET_EQUIP_SITE_ACCESSORY    =   3       -- 宠物装饰


-- 无效装备位置
INVALID_SITE                =   -1

-- 绑定选项
BIND_OPTION_NULL            =   0
BIND_OPTION_FALSE           =   1       -- 非绑定的
BIND_OPTION_TRUE            =   2       -- 绑定的
BIND_OPTION_ANY             =   3       -- 任意

-- 邀请类型
INVITE_TEAM_INVITE_JOIN     =   1
INVITE_TEAM_APPLY_JOIN      =   2
INVITE_TEAM_APPLY_LEADER    =   3
INVITE_TEAM_CALL_MEMBER     =   4
INVITE_GUILD_INVITE_JOIN    =   5

-- 触发器类型
-- 物品相关
TRIGGER_ON_CREATE           = 100   -- 创建触发
TRIGGER_ON_DESTROY          = 101   -- 销毁触发
TRIGGER_ON_GET_EQUIP_SITE   = 102   -- （无效）
TRIGGER_ON_POST_EQUIP       = 103   -- 玩家穿戴装备后触发
TRIGGER_ON_POST_UNEQUIP     = 104   -- 玩家脱卸装备后触发
TRIGGER_ON_POST_PET_EQUIP   = 105   -- 宠物穿戴装备后触发
TRIGGER_ON_POST_PET_UNEQUIP = 106   -- 宠物脱卸装备后触发
TRIGGER_ON_USE_ITEM         = 107   -- 使用物品触发
TRIGGER_ON_LEVELUP          = 108   -- 玩家升级触发
TRIGGER_ON_FIRST_LOGIN      = 109   -- 玩家首次登陆触发
TRIGGER_ON_LOGIN            = 110   -- 玩家登陆触发
TRIGGER_ON_RELOGIN          = 111   -- 玩家重登陆触发
TRIGGER_ON_PET_LEVELUP      = 112   -- 宠物升级触发
TRIGGER_ON_FIGHT_RESULT     = 113   -- 战斗结果触发
TRIGGER_ON_ITEM_CREATE      = 114   -- 物品创建触发
TRIGGER_ON_ITEM_DESTROY     = 115   -- 物品销毁触发
TRIGGER_ON_NPC_CREATE       = 116   -- NPC创建触发
TRIGGER_ON_NPC_DESTROY      = 117   -- NPC销毁触发
TRIGGER_ON_PET_CREATE       = 118   -- 宠物创建触发
TRIGGER_ON_PET_DESTROY      = 119   -- 宠物销毁触发
TRIGGER_ON_QUEST_ACCEPT     = 120   -- 任务接取
TRIGGER_ON_QUEST_ABANDON    = 121   -- 任务放弃
TRIGGER_ON_QUEST_FAILED     = 122   -- 任务失败
TRIGGER_ON_QUEST_FINISH     = 123   -- 任务完成
TRIGGER_ON_QUEST_READY      = 124   -- 任务就绪
TRIGGER_ON_GET_QUEST_REWARD_GOLD    = 125   -- 获取任务奖励金币回调
TRIGGER_ON_GET_QUEST_REWARD_BGLOD   = 126   -- 获取任务奖励银币回调
TRIGGER_ON_GET_QUEST_REWARD_EXP     = 127   -- 获取任务奖励经验
TRIGGER_ON_GET_QUEST_REWARD_PET_EXP = 128   -- 获取任务宠物奖励经验
TRIGGER_ON_QUEST_KILL_BOSS          = 129   -- 任务杀死BOSS
TRIGGER_ON_JOIN_GUILD       = 130   -- 加入帮派
TRIGGER_ON_LEAVE_GUILD      = 131   -- 离开帮派
TRIGGER_ON_PRE_USE_ITEM     = 132   -- 使用物品之前回调
TRIGGER_ON_BILLIN           = 133   -- 充值回调
TRIGGER_ON_ADD_INGOT        = 134   -- 增加元宝回调
TRIGGER_ON_SUB_INGOT        = 135   -- 减少元宝回调
TRIGGER_ON_PER_SET_TEAM_LEADER      = 136   -- 设置队长之前回调    
TRIGGER_ON_SET_TEAM_LEADER          = 137   -- 设置队长对调
TRIGGER_ON_MAP_CREATE       = 138   -- 创建地图
TRIGGER_ON_MAP_DESTROY      = 139   -- 销毁地图
TRIGGER_ON_ENTER_MAP        = 140   -- 进入地图
TRIGGER_ON_LEAVE_MAP        = 141   -- 离开地图
TRIGGER_ON_JOIN_TEAM        = 142   -- 加入队伍
TRIGGER_ON_LEAVE_TEAM       = 143   -- 离开队伍
TRIGGER_ON_TEMP_LEAVE       = 144   -- 队伍暂离
TRIGGER_ON_GUILD_JOB_CHANGED        = 145   -- 帮派职位改变
TRIGGER_ON_POST_GUARD_EQUIP        = 146   -- 侍从穿装备
TRIGGER_ON_POST_GUARD_UNEQUIP        = 147   -- 侍从脱装备
TRIGGER_ON_POST_GUARD_CREATE        = 148   -- 侍从创建
TRIGGER_ON_POST_GUARD_DESTROY        = 149   -- 侍从销毁
TRIGGER_ON_LOGOUT        = 150   -- 玩家退出
TRIGGER_ON_GUARD_LEVELUP        = 151   -- 侍从升级
TRIGGER_ON_GUARD_LINEUP     = 152   --侍从上(下)阵
TRIGGER_ON_GUARD_CONTAINER  = 153   --侍从进入容器
TRIGGER_ON_PRE_JUMP_MAP	= 154	--玩家跳转地图前回掉
TRIGGER_ON_ADD_PET          =   155 --玩家添加宠物
TRIGGER_ON_ADD_GUARD        =   156 --玩家添加侍从
TRIGGER_ON_ANSWER_WORLD_QUESTION = 157 --世界答题
TRIGGER_ON_PRE_ADD_EXP      =   158 --角色加经验前触发
TRIGGER_ON_ADD_SKILL        =   159 --获得技能
TRIGGER_ON_PASTURE_PET_TIMEOUT   = 160  --牧场宠物超时回调
TRIGGER_ON_ADD_ITEM         = 161  --添加物品回调
TRIGGER_ON_PRE_DAMAGE       = 162  --受到技能攻击前回调
TRIGGER_ON_USE_ITEM_PASSIVE = 163  --被动使用物品回调
TRIGGER_ON_PRE_LEVELUP      = 164  --玩家升级前回调
TRIGGER_ON_PRE_SWAP_EQUIP   = 165  --角色装备替换前回调
TRIGGER_ON_PRE_SWAP_PET_EQUIP    = 166  --宠物装备替换前回调
TRIGGER_ON_PRE_SWAP_GUARD_EQUIP  = 167  --侍从装备替换前回调
TRIGGER_ON_PET_LINEUP_CHANGED    = 168  --宠物阵容变化回调
TRIGGER_ON_PRE_GEN_MONSTER  = 169  --pve战斗刷怪前回调
TRIGGER_ON_FIGHTER_USE_ITEM = 170  --战斗中使用物品回调
TRIGGER_ON_FIGHTER_USE_ITEM_PASSIVE  = 171 --战斗中被动使用物品回调
TRIGGER_ON_ENCOUNTER        = 172  --地图中遭遇回调
TRIGGER_ON_PK_VALUE_MODIFY  = 173  --角色修改PK值回调
TRIGGER_ON_OPEN_SHOP        = 174  --玩家打开商店回调
TRIGGER_ON_VISIT_NPC        = 175  --访问npc回调
TRIGGER_ON_FIGHT_BEGIN      = 176  --战斗开始时回调
TRIGGER_ON_FIGHT_END        = 177  --战斗结束时回调  *游戏服务端代码中已添加
TRIGGER_ON_FIGHT_PRE_ROUND       = 178  --回合开始时回调  *游戏服务端代码中已添加
TRIGGER_ON_FIGHT_POST_ROUND      = 179  --回合结束时回调  *游戏服务端代码中已添加
TRIGGER_ON_POST_SWAP_EQUIP  = 180  --角色装备替换后回调
TRIGGER_ON_POST_SWAP_PET_EQUIP   = 181  --宠物装备替换后回调  *游戏服务端代码中已添加
TRIGGER_ON_POST_SWAP_GUARD_EQUIP    = 182  --侍从装备替换后回调  *游戏服务端代码中已添加
TRIGGER_ON_PET_FIGHTER_SUMMON_OUT   = 183  --战斗过程中宠物召出时回调
TRIGGER_ON_NPC_SHOP_BUY     = 184  --NPC商店购买回调
TRIGGER_ON_PRE_FIGHTER_USE_ITEM  = 185  --战斗中使用物品之前回调  *游戏服务端代码中已添加
TRIGGER_ON_PRE_FIGHTER_USE_ITEM_PASSIVE  = 186  --战斗中被使用物品之前回调  *游戏服务端代码中已添加
TRIGGER_ON_PICKUP_MAIL      = 187 --拾取邮件
TRIGGER_ON_PRE_EQUIP = 188  --穿装备前回调
TRIGGER_ON_PRE_UNEQUIP = 189  --脱装备前回调
TRIGGER_ON_PRE_PET_EQUIP = 190  --宠物穿装备前回调
TRIGGER_ON_PRE_PET_UNEQUIP = 191  --宠物脱装备前回调
TRIGGER_ON_PRE_GUARD_EQUIP = 192  --侍从穿装备前回调
TRIGGER_ON_PRE_GUARD_UNEQUIP = 193  --侍从脱装备前回调
TRIGGER_ON_PRE_WORLD_CHAT = 194 --世界聊天前回调
TRIGGER_ON_FIGHTBUFF_DYNDATA = 195 --战斗BUFF动态数据回调
TRIGGER_ON_QUEST_FINISH_EX = 196 --任务完成回调(不管有没有挂载脚本)
TRIGGER_ON_WAREHOUSER_ADD_PET = 197   -- 宠物移入仓库
TRIGGER_ON_WAREHOUSER_DEL_PET = 198   -- 宠物移出仓库
TRIGGER_ON_PRE_MAP_DESTROY = 199  --地图销毁钱触发
TRIGGER_ON_PLAYER_ONLINE = 200  --玩家上线触发
TRIGGER_ON_PLAYER_OFFLINE = 201  --玩家离线触发
TRIGGER_ON_WAREHOUSER_ADD_PET_PRE = 202  --宠物移入仓库前触发
TRIGGER_ON_WAREHOUSER_DEL_PET_PRE = 203  --宠物移出仓库前触发
TRIGGER_ON_PRE_WAREHOUSER_MOVEIN = 204 --物品移入仓库前触发
TRIGGER_ON_PRE_WAREHOUSER_MOVEOUT = 205 --物品移出仓库前触发
TRIGGER_ON_PRE_FORCEKICK_OFFLINE_PLAYER = 206 --踢出离线玩家前触发
TRIGGER_ON_GET_QUEST_RANDOM_ITEM = 207 --获取任务提交随机道具前触发
TRIGGER_ON_GET_QUEST_RANDOM_PET = 208 --获取任务提交随机宠物前触发
TRIGGER_ON_GET_QUEST_SPEC_ITEM = 209 --获取任务提交指定道具前触发
TRIGGER_PRE_PET_FIGHTER_SUMMON_OUT = 210--战斗过程中宠物召出前回调
TRIGGER_ON_X7CHECKSTRINGVALIDITY_RESULT = 211--小7平台敏感词检测回调
TRIGGER_ON_X7CHECKSTRINGREPORT_RESULT = 212--敏感词处理结果上报小7平台回调
TRIGGER_ON_FIGHT_DISPLAY_FAIL = 214--回合表演结束异常回调
TRIGGER_ON_APPLY_ITEM_TEST_ATTR_LIMIT = 215--当使用道具添加属性时，发现属性上限溢出时回调
TRIGGER_ON_ATTR_RECALC = 216--属性重计算时触发
TRIGGER_ON_PRE_CROSS_CHAT = 217--跨服聊天以前触发
TRIGGER_ON_PRE_HEALTH = 218--治疗前触发
TRIGGER_ON_PRE_FLUSHMOVE = 219--宠物闪现前触发
TRIGGER_ON_PRE_APPLY_ITEM = 220--使用道具添加属性前触发
TRIGGER_ON_PRE_SEAT_ATTR = 221--填充阵法属性前触发
TRIGGER_ON_PRE_FLUSHMOVE_EX = 222--闪现之前回调(指定闪现宠物)
TRIGGER_ON_PRE_CATCH_PET = 223--捕捉怪物前触发
TRIGGER_ON_PRE_PET_ENTER_FIGHT = 224--上阵宠物进入战斗前触发

-- 宠物容器
PET_CONTAINER_NULL                  =   0
PET_CONTAINER_PANEL                 =   1       -- 宠物面板
PET_CONTAINER_WAREHOUSE_PETS        =   2       -- 宠物仓库

-- GUID类型
GUID_NULL                   =       0   
GUID_GLOBAL                 =       1   -- 全局
GUID_MAP                    =       2   -- 地图
GUID_PLAYER                 =       3   -- 玩家
GUID_NPC                    =       4   -- NPC
GUID_ITEM                   =       5   -- 物品
GUID_PET                    =       6   -- 宠物
GUID_GUARD                  =       7   -- 侍从
GUID_MONSTER                =       8   -- 怪物
GUID_TEAM                   =       9   -- 队伍
GUID_TIMER                  =       10  -- 定时器
GUID_TRIGGER                =       11  -- 触发器
GUID_SHOP                   =       12  -- 商店
GUID_AUCTION                =       13  -- 拍卖
GUID_GUILD                  =       14  -- 门派
GUID_MESSAGE                =       15  -- 已作废
GUID_MAIL                   =       16  -- 邮件
GUID_ROBOT                  =       17  -- 机器人
GUID_PLAYER_FIGHTER         =       18  -- 玩家（战斗中）
GUID_MONSTER_FIGHTER        =       19  -- 怪物（战斗中）
GUID_PET_FIGHTER            =       20  -- 宠物（战斗中）
GUID_GUARD_FIGHTER          =       21  -- 侍从（战斗中）
GUID_ROBOT_FIGHTER          =       22  -- 机器人（战斗中）
GUID_BEAST                  =       23  -- 牧场宠物
GUID_BEAST_FIGHTER          =       24  -- 牧场宠物（战斗中）
GUID_LADDER                 =       25  -- 天梯玩家
GUID_LADDER_FIGHTER         =       26  -- 天梯玩家（战斗中）
GUID_DUMMY_FIGHTER          =       27  -- 假人（战斗中）
GUID_MAX                    =       256

FIGHT_TRIGGER_NULL          =       0   --无
FIGHT_TRIGGER_PVE           =       1   --pve
FIGHT_TRIGGER_PVP           =       2   --pvp
FIGHT_TRIGGER_DUEL          =       3   --切蹉
FIGHT_TRIGGER_PK            =       4   --杀人
FIGHT_TRIGGER_MINE          =       5   --暗雷
FIGHT_TRIGGER_BOMB          =       6   --明雷
FIGHT_TRIGGER_QUEST         =       7   --任务
FIGHT_TRIGGER_RANK          =       8   --排行榜
FIGHT_TRIGGER_MAX           =       9


GUILD_OPERATE_NULL                  = 0
-- 帮派界面操作
GUILD_OPERATE_MODIFY_NAME           = 1     -- 修改名称
GUILD_OPERATE_MODIFY_DECLARATION    = 2     -- 修改宣言
GUILD_OPERATE_GET_DIVIDEND          = 3     -- 领取分红
GUILD_OPERATE_JOIN_ACTIVITY         = 4     -- 参与活动
GUILD_OPERATE_DONATE                = 5     -- 帮派捐献
GUILD_OPERATE_SEND_NOTICE           = 6     -- 发送通知
GUILD_OPERATE_GO_BACK               = 7     -- 回到帮派

-- 帮派成员界面操作
GUILD_OPERATE_QUIT_GUILD            = 8     -- 退出帮派
GUILD_OPERATE_IMPEACH_LEADER        = 9     -- 弹劾帮主
GUILD_OPERATE_EXPEL_MEMBER          = 10    -- 开除成员
GUILD_OPERATE_FORBID_TALK           = 11    -- 帮派禁言
GUILD_OPERATE_APPOINT_JOB           = 12    -- 更改职位
GUILD_OPERATE_ADD_FRIEND            = 13    -- 添加好友
GUILD_OPERATE_IMPEACH_AGREE         = 14    -- 同意弹劾
GUILD_OPERATE_IMPEACH_DISAGREE      = 15    -- 反对弹劾

-- 申请列表界面操作
GUILD_OPERATE_VERIFY_SET            = 16    -- 开启验证
GUILD_OPERATE_CLEAN_APPLICANT       = 17    -- 清空列表
GUILD_OPERATE_REFRESH_APPLICANT     = 18    -- 刷新列表
GUILD_OPERATE_INVITE_JOIN           = 19    -- 推荐新人
GUILD_OPERATE_REFUSE_APPLICANT      = 20    -- 拒绝申请
GUILD_OPERATE_AGREE_APPLICANT       = 21    -- 加为帮众

-- 帮派建设界面
GUILD_OPERATE_UPGRADE_BUILDING      = 22    -- 建筑升级
GUILD_OPERATE_CREATE_GUILD          = 23    -- 创建帮派
GUILD_OPERATE_APPLY_JOIN_BY_ID      = 24    -- 申请入帮(通过帮派ID)
GUILD_OPERATE_APPLY_JOIN_BY_PLAYER  = 25    -- 申请入帮(通过玩家)
GUILD_OPERATE_APPLY_JOIN_BY_ONE_KEY = 26    -- 申请入帮(一键入帮)

-- 帮派职位
GUILD_JOB_NORMAL                    = 0     --帮众                  -- 普通帮众	  
GUILD_JOB_DRAGON_NORMAL             = 1     --精英                  -- 飞龙堂成员 
GUILD_JOB_TIGER_NORMAL              = 2     --空                    -- 卧虎堂成员 
GUILD_JOB_DRAGON_LEADER             = 3     --玄武堂堂主            -- 飞龙堂堂主 
GUILD_JOB_TIGER_LEADER              = 4     --朱雀堂堂主            -- 卧虎堂堂主 
GUILD_JOB_LEFT_DEACON               = 5     --白虎堂堂主            -- 左护法     
GUILD_JOB_RIGHT_DEACON              = 6     --青龙堂堂主            -- 右护法     
GUILD_JOB_DEPUTY                    = 7     --副帮主                -- 副帮主     
GUILD_JOB_LEADER                    = 8     --帮主                  -- 帮主       

-- 帮派管理权限
GUILD_PERMISSION_INVITE             = (1 << 0)          -- 允许邀请入帮
GUILD_PERMISSION_VERIFY_SET         = (1 << 1)          -- 设置入帮验证
GUILD_PERMISSION_APPLY_ADUIT        = (1 << 2)          -- 入帮申请审核
GUILD_PERMISSION_APPLY_CLEAN        = (1 << 3)          -- 入帮申请清空

GUILD_PERMISSION_APPOINT_JOB        = (1 << 4)          -- 成员职位任免
GUILD_PERMISSION_USE_CHANNEL        = (1 << 5)          -- 使用帮派聊天
GUILD_PERMISSION_SEND_NOTICE        = (1 << 6)          -- 发送帮派通知
GUILD_PERMISSION_IMPEACH_LEADER     = (1 << 7)          -- 弹劾帮主
GUILD_PERMISSION_DECLARATION        = (1 << 8)          -- 编辑帮派宣言
GUILD_PERMISSION_EXPEL_MEMBER       = (1 << 9)          -- 解散成员
GUILD_PERMISSION_FORBID_TALK        = (1 << 10)         -- 帮派禁言

GUILD_PERMISSION_BASE               = (1 << 11)         -- 忠义堂建设管理
GUILD_PERMISSION_WING_ROOM          = (1 << 12)         -- 帮派厢房建设管理
GUILD_PERMISSION_VAULT              = (1 << 13)         -- 帮派金库建设管理
GUILD_PERMISSION_ACADEMY            = (1 << 14)         -- 帮派书院建设管理
GUILD_PERMISSION_PHARMACY           = (1 << 15)         -- 帮派宝阁建设管理


GUILD_CONFIG_VERIFY                 = (1 << 0)          -- 入帮验证

-- 联系人类型
CONTACT_STRANGER                    =   0               -- 陌生人
CONTACT_APPLY                       =   1               -- 好友申请
CONTACT_FRIEND                      =   2               -- 好友
CONTACT_BLACKLIST                   =   3               -- 黑名单