--七日庆典
SevenDay = {}

--七日持续天数
SevenDay.DayNum = 14

--七日开启等级
SevenDay.OpenLevel = 15

--奖励列表
SevenDay.Award = {
    ScoreAward = {
        [25] = {ButtonState = 3 , item = {"装备强化石",30}},
        [50] = {ButtonState = 3 , item = {"中银币袋",1}},
        [75] = {ButtonState = 3 , item = {"50打造礼包",1}},
        [100] ={ButtonState = 3 , item = {"SSR礼包",2}},
    },

    SignInAward = {--ButtonState 登陆奖励按钮状态 3-未达到  2-已过期  1-奖励可领取  4奖励已领取
        [1] = {ButtonState = 3 ,isguard = 0 , item = {"祈福卷轴3",10}},
        [2] = {ButtonState = 3 ,isguard = 0 , item = {"祈福卷轴3",10}},
        [3] = {ButtonState = 3 ,isguard = 0 , item = {"45级橙戒指",1}},
        [4] = {ButtonState = 3 ,isguard = 0 , item = {"50辅助系法宝",1}},
        [5] = {ButtonState = 3 ,isguard = 134 , item = {"侍从展示-银角大王",1}},
        [6] = {ButtonState = 3 ,isguard = 0 , item = {"50级橙护腰",1}},
        [7] = {ButtonState = 3 ,isguard = 111 , item = {"侍从展示-哪吒",1}},
    },
--[[
    Icon  任务图标
    type  任务类型
    Name  任务名称
    ButtonState  任务按钮状态 3-任务未开启  2-任务未完成  1-奖励可领取  4奖励已领取（统一为3，发送至客户端前会根据任务状态更新）
    Score  任务积分
    key  前往按钮的回调类型
        1:打开UI（param1为UI名，param2、param3为页签index ，switchname为判断UI打开等级所需要的名称，对应MainUISwitch脚本）
        2:寻路至指定NPC（param1为NPC_Id）
        3:前往指定Map（param1为Map_Id、param2为x坐标、param3为y坐标）
        4:回调服务端表单（param1为表单名、param2为函数名、param3为参数）
        7:宠物UI跳转专用
    Max_Extent  任务进度条最大值
    Now_Extent  任务进度条当前值（统一为0，发送至客户端前会根据任务进度更新）
    Moneytype  奖励货币类型
    MoneyValue  奖励货币数值
    item  奖励物品表（表里的货币只做显示用）
    ]]--
    TaskAward ={
        [1] = {
            [1] = {Icon = '1801109110' , type = "Level" , Name = "等级达到20级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} ,Max_Extent = 20 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"魔池2" , 1 , "面板展示-银币" , 30000} },
            [2] = {Icon = '1801109110' , type = "FightValue" , Name = "角色战力达到500" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 500 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"血池2" , 1 , "面板展示-银币" , 30000} },
            [3] = {Icon = '1801109110' , type = "Skill" , Name = "将任意门派技能提升至15级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "RoleSkillUI" , switchname= {"技能","门派"} , Max_Extent = 15 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"阵法礼包" , 1 , "面板展示-银币" , 30000} },
            [4] = {Icon = '1801109110' , type = "Equip" , Name = "将任意一件装备强化至1级" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 30000} },
            [5] = {Icon = '1801109110' , type = "Quest" , Name = "累计完成10次师门任务" , ButtonState = 3 , Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 10 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"双倍经验点" , 2 , "面板展示-银币" , 30000} },
            [6] = {Icon = '1801109110' , type = "Pet" , Name = "获得1只宠物" , ButtonState = 3 , Score = 2 , key  = 7 , param1 = "PetUI" , param2 = 1 , param3 = 1 , switchname= {"宠物"} , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"15级项圈" , 1 , "面板展示-银币" , 30000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" , Name = "累计消费500金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 500 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 30000 , item = {"解锁背包栏位" , 1 , "面板展示-银币" , 30000} },
        },
        [2] = {
            [1] = {Icon = '1801109250' , type = "Level" , Name = "等级达到30级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2, param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 30 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 35000} },
            [2] = {Icon = '1801109100' , type = "FightValue" , Name = "角色战力达到1000" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI", param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 1000 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"VIP2卡" , 1 , "面板展示-银币" , 35000} },
            [3] = {Icon = '1801109150' , type = "Skill" , Name = "将任意门派技能提升至20级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "RoleSkillUI", switchname= {"技能","门派"} , Max_Extent = 20 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"普通宠物秘籍包" , 2 , "面板展示-银币" , 35000} },
            [4] = {Icon = '1801109230' , type = "Equip" , Name = "将任意一件装备强化至2级" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 2 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"宠物经验丹" , 2 , "面板展示-银币" , 35000} },
            [5] = {Icon = '1801109080' , type = "Quest" , Name = "累计完成20次师门任务" , ButtonState = 3 , Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 20 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"N礼包" , 4 , "面板展示-银币" , 35000} },
            [6] = {Icon = '1801109110' , type = "Teacher" , Name = "进行1次师徒登记" , ButtonState = 3 , Score = 2 , key = 2 , param1 = "20038" , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"15级盔甲物防" , 1 , "面板展示-银币" , 35000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费600金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 600 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 35000 , item = {"解锁宠物栏位" , 1 , "面板展示-银币" , 35000} },
        },
        [3] = {
            [1] = {Icon = '1801109320' , type = "Level" , Name = "等级达到35级" , ButtonState = 3 , Score = 3 ,key = 1 , param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 35 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"小白龙信物" , 4 , "面板展示-银币" , 50000} },
            [2] = {Icon = '1801109350' , type = "FightValue" , Name = "角色战力达到1500" , ButtonState = 3 , Score = 3 ,key = 1 , param1 = "BeStrongUI", param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 1500 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"双倍经验点" , 1 , "面板展示-银币" , 50000} },
            [3] = {Icon = '1801109340' , type = "Skill" , Name = "将任意门派技能提升至25级" , ButtonState = 3 , Score = 3 ,key = 1 , param1 = "RoleSkillUI", switchname= {"技能","门派"} , Max_Extent = 25 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"宠物经验丹" , 4 , "面板展示-银币" , 50000} },
            [4] = {Icon = '1801109330' , type = "Equip" , Name = "将任意一件装备强化至3级" , ButtonState = 3 , Score = 2 ,key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 3 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"R礼包" , 4 , "面板展示-银币" , 50000} },
            [5] = {Icon = '1801109310' , type = "Quest" , Name = "累计完成30次师门任务" , ButtonState = 3 , Score = 2 ,key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 30 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"藏宝图" , 3 , "面板展示-银币" , 50000} },
            [6] = {Icon = '1801109110' , type = "Talent" , Name = "学习1个天赋" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "RoleSkillUI" , param2 = 2 , switchname= {"技能","天赋"} ,Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"N礼包" , 4 , "面板展示-银币" , 50000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费700金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 700 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 50000 , item = {"解锁仓库栏位" , 1 , "面板展示-银币" , 50000} },
        },
        [4] = {
            [1] = {Icon = '1801109090' , type = "Level" , Name = "等级达到40级" , ButtonState = 3 , Score = 3 , key = 1 ,param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 40 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 55000 , item = {"装备强化石" , 2 , "面板展示-银币" , 55000} },
            [2] = {Icon = '1801109360' , type = "FightValue" , Name = "角色战力达到2000" , ButtonState = 3 , Score = 3 , key = 1 ,param1 = "BeStrongUI", param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 2000 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 55000 , item = {"双倍经验点" , 1 , "面板展示-银币" , 55000} },
            [3] = {Icon = '1801109120' , type = "Skill" , Name = "将任意门派技能提升至30级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = 'RoleSkillUI' , switchname= {"技能","门派"} , Max_Extent = 30 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 55000 , item = {"小白龙信物" , 6 , "面板展示-银币" , 55000} },
            [4] = {Icon = '1801109090' , type = "Equip" , Name = "将任意一件装备强化至4级" , ButtonState = 3 , Score = 2 , key = 1 ,param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 4 , Moneytype = 5 , MoneyValue = 55000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 55000} },
            [5] = {Icon = '1801109090' , type = "Quest" , Name = "累计完成40次师门任务" , ButtonState = 3 , Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 40 , Moneytype = 5 , MoneyValue = 55000 , item = {"藏宝图" , 3 , "面板展示-银币" , 55000} },
            [6] = {Icon = '1801109110' , type = "Guild" , Name = "加入1个帮派" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "FactionCreateUI" , switchname= {"帮派"} , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 55000 , item = {"宠物经验丹" , 2 , "面板展示-银币" , 55000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费800金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 800 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 55000 , item = {"解锁宠物仓库栏位" , 1 , "面板展示-银币" , 55000} },
        },
        [5] = {
            [1] = {Icon = '1801109410' , type = "Level" , Name = "等级达到44级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 44 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"装备强化石" , 4 , "面板展示-银币" , 70000} },
            [2] = {Icon = '1801109070' , type = "FightValue" , Name = "角色战力达到2500" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 2500 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"双倍经验点" , 1 , "面板展示-银币" , 70000} },
            [3] = {Icon = '1801109160' , type = "Skill" , Name = "将任意门派技能提升至35级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "RoleSkillUI", switchname= {"技能","门派"} , Max_Extent = 35 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"装备强化石" , 6 , "面板展示-银币" , 70000} },
            [4] = {Icon = '1801109290' , type = "Equip" , Name = "将任意一件装备强化至5级" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 5 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 70000} },
            [5] = {Icon = '1801109560' , type = "Quest" , Name = "累计完成50次师门任务" , ButtonState = 3 , Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 50 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"藏宝图" , 3 , "面板展示-银币" , 70000} },
            [6] = {Icon = '1801109110' , type = "Guard" , Name = "将任意侍从升星至2星" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "GuardUI" , param2 = 2 , switchname= {"侍从"} , Max_Extent = 2 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 70000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费900金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 900 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 70000 , item = {"宝石福袋" , 5 , "面板展示-银币" , 70000} },
        },
        [6] = {
            [1] = {Icon = '1801109070' , type = "Level" , Name = "等级达到47级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 47 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"装备强化石" , 6 , "面板展示-银币" , 75000} },
            [2] = {Icon = '1801109420' , type = "FightValue" , Name = "角色战力达到3000" , ButtonState = 3 , Score = 3 , key = 1 , param1 = 'BeStrongUI' , param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 3000 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"双倍经验点" , 1 , "面板展示-银币" , 75000} },
            [3] = {Icon = '1801109180' , type = "Skill" , Name = "将任意门派技能提升至40级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = 'RoleSkillUI' , switchname= {"技能","门派"} , Max_Extent = 40 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"小白龙信物" , 3 , "面板展示-银币" , 75000} },
            [4] = {Icon = '1801109550' , type = "Equip" , Name = "将任意一件装备强化至6级" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 6 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"小白龙信物" , 5 , "面板展示-银币" , 75000} },
            [5] = {Icon = '1801109550' , type = "Quest" , Name = "累计完成60次师门任务" , ButtonState = 3, Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 60 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"宝石福袋" , 3 , "面板展示-银币" , 75000} },
            [6] = {Icon = '1801109110' , type = "Cook" , Name = "在生产界面制造1道菜肴" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "ProduceUI" , param2 = 1 , switchname= {"生产","烹饪"} , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"强化保固石" , 4 , "面板展示-银币" , 75000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费1000金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 1000 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 75000 , item = {"宝石福袋" , 10 , "面板展示-银币" , 75000} },
        },
        [7] = {
            [1] = {Icon = '1801109400' , type = "Level" , Name = "等级达到50级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , param3 = 1 , switchname= {"变强","变强"} , Max_Extent = 50 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"小白龙信物" , 8 , "面板展示-银币" , 90000} },
            [2] = {Icon = '1801109140' , type = "FightValue" , Name = "角色战力达到3500" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "BeStrongUI" , param2 = 2 , switchname= {"变强","变强"} , Max_Extent = 3500 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"双倍经验点" , 1 , "面板展示-银币" , 90000} },
            [3] = {Icon = '1801109140' , type = "Skill" , Name = "将任意门派技能提升至45级" , ButtonState = 3 , Score = 3 , key = 1 , param1 = "RoleSkillUI" , switchname= {"技能","门派"} , Max_Extent = 45 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"装备强化石" , 6 , "面板展示-银币" , 90000} },
            [4] = {Icon = '1801109140' , type = "Equip" , Name = "将任意一件装备强化至7级" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "EquipUI" , param2 = 1 , param3 = 3 , switchname= {"装备","强化"} , Max_Extent = 7 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"SR礼包" , 2 , "面板展示-银币" , 90000} },
            [5] = {Icon = '1801109140' , type = "Quest" , Name = "累计完成70次师门任务" , ButtonState = 3 , Score = 2 , key = 4 , param1 = "FormSevenDay", param2 = "ShiMenQuest" , Max_Extent = 70 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"高级藏宝图" , 4 , "面板展示-银币" , 90000}},
            [6] = {Icon = '1801109110' , type = "Wing" , Name = "将羽翼品阶提升至1阶" , ButtonState = 3 , Score = 2 , key = 1 , param1 = "BagUI" , param2 = 4 , param3 = 2 , switchname= {"包裹","羽翼"} , Max_Extent = 1 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"VIP3卡" , 1 , "面板展示-银币" , 90000} },
            [7] = {Icon = '1801109110' , type = "Expenditure" ,Name = "累计消费1100金元宝" , ButtonState = 3 , Score = 5 , key = 1 , param1 = "MallUI" , param2 = 1 , param3 = 1 , switchname= {"商城"} , Max_Extent = 1100 , Now_Extent = 0 , Moneytype = 5 , MoneyValue = 90000 , item = {"宝石福袋" , 15 , "面板展示-银币" , 90000} },
        }
    }
}

function SevenDay.GetData(player)--发送表单数据到客户端
    if player == nil then
        return
    end
    local Award = {}
    Award["SignInAward"] = SevenDay.SignInData(player,SevenDay.Award.SignInAward)
    Award["TaskAward"] = SevenDay.TaskData(player,SevenDay.Award.TaskAward)
    Award["ScoreAward"] = SevenDay.ScoreData(player,SevenDay.Award.ScoreAward)
    if Lua_tools then
        if SevenDay.Award then
            --sLuaApp:LuaDbg("七日庆典表单回馈")
            local str = [[
                if Activity7DaysUI then
                    if Activity7DaysUI.ServerData then
                        Activity7DaysUI.ServerData = ]].. Lua_tools.serialize(Award) ..[[
                        Activity7DaysUI.Refresh()
                    end
                end
                ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
    end
    SevenDay.RedPointRefresh(player)
    --SevenDay.Repair(player)
end

--师门任务寻路
function SevenDay.ShiMenQuest(player)
    if not player then
        return
    end
    local npc = Act_Shimen1.NpcConfig[player:GetAttr(3)]
    Lua_tools.MoveToNpc(player,npc)
end
--登陆奖励表单更新
function SevenDay.SignInData(player,SignInAward)
    --sLuaApp:LuaDbg("登陆奖励表单修改")
    --按钮状态修改
    for i = 1, 7 do
        if i == player:GetInt("SevenDay_Day") then--当天
            if player:GetInt("SevenDaySignIn_"..i) == 1 then --已领取
                SignInAward[i]["ButtonState"] = 4
            else--未领取
                SignInAward[i]["ButtonState"] = 1
            end
        elseif i < player:GetInt("SevenDay_Day") then--过期
            if player:GetInt("SevenDaySignIn_"..i) == 1 then --已领取
                SignInAward[i]["ButtonState"] = 4
            else--未领取
                SignInAward[i]["ButtonState"] = 2
            end
        elseif i > player:GetInt("SevenDay_Day") then--未达到
            SignInAward[i]["ButtonState"] = 3
        end
    end
    return SignInAward
end

--每日任务奖励表单更新
function SevenDay.TaskData(player,TaskAward)
    --sLuaApp:LuaDbg("每日任务奖励表单修改")
    --修改按钮状态
    for k, v in pairs(TaskAward) do
        for n, m in pairs(v) do
            if m.type == "Level" then
                m["Now_Extent"] = player:GetAttr(ROLE_ATTR_LEVEL)
                local Max_Extent = SevenDay.Award.TaskAward[k][n]["Max_Extent"]
                if player:GetAttr(ROLE_ATTR_LEVEL) >= Max_Extent then
                    player:SetInt("day_"..k.."_n",1)
                end
            elseif m.type == "FightValue" then
                m["Now_Extent"] = SevenDay.TaskJudge(player,m.type,k,n)
            elseif m.type == "Wing" then
                m["Now_Extent"] = player:GetInt("WingGrow_Stage")
            else
                m["Now_Extent"] = player:GetInt("SevenDay_"..m.type)
            end
            if k == player:GetInt("SevenDay_Day") then
                if player:GetInt("day_"..k.."_"..n) == 3 then
                    player:SetInt("day_"..k.."_"..n,2)
                end
            end
            m["ButtonState"] = player:GetInt("day_"..k.."_"..n)
        end
    end
    return TaskAward
end

--积分奖励表单更新
function SevenDay.ScoreData(player,ScoreAward)
    --sLuaApp:LuaDbg("积分奖励表单修改")
    for k, v in pairs(ScoreAward) do
        if player:GetInt("SevenDayScore") >= k then
            if player:GetInt("SevenDayScore_"..k) == 1 then
                v["ButtonState"] = 4
            else
                v["ButtonState"] = 1
            end
        else
            v["ButtonState"] = 2
        end
    end
    return ScoreAward
end

--player升级回调
function SevenDay.StartJudge(player,newlevel)
    if FunctionSwitch.AllFuncitonConfig["SevenDay"] == "off" then
        return ""
    end
    if player:GetInt("SevenDaySwitch") ~= 1 then
        if newlevel == SevenDay.OpenLevel then --活动开始判断
            player:SetInt("SevenDaySwitch",1)
            player:SetInt("SevenDay_Day",1)
            player:SetInt("SevenDayScore",0)
            player:SetInt("SevenDay_Last_Day",sLuaApp:DaySinceEpoch(0))
            --七日开始天
            player:SetInt("SevenDay_Start_Day",sLuaApp:DaySinceEpoch(0))
            --七日结束秒
            player:SetInt("SevenDay_Over_time",sLuaApp:GetTimes()+sLuaApp:GetTodayRemain()+((SevenDay.DayNum-1)*24*60*60))
            for d = 1, 7 do
                for i = 1, 7 do
                    player:SetInt("day_"..d.."_"..i,3)--存入
                end
            end
            for i = 25, 100, 25 do
                player:SetInt("SevenDayScore_"..i,3)
            end
            SevenDay.GetFightValueConfig(player)
            SevenDay.RedPointRefresh_Main(player)
            --注册战力监听事件
            local str = [[
                if GlobalProcessing and GlobalProcessing.Set7dayData then
                    GlobalProcessing.Set7dayData()
                end
            ]]
            sLuaApp:ShowForm(player, "脚本表单", str)
        end
    end
    for i = 1, 7 do
        if player:GetInt("day_"..i.."_1") ~= 4 then
            local Max_Extent = SevenDay.Award.TaskAward[i][1]["Max_Extent"]
            if newlevel >= Max_Extent then
                player:SetInt("day_"..i.."_1",1)
                SevenDay.TaskStateChange(player,i,1,1)
                SevenDay.RedPointRefresh_Main(player)
            end
            SevenDay.ExtentChange(player,i,4,newlevel)--更新任务进度
        end
    end
end

function SevenDay.GetFightValueConfig(player)
    if player:GetInt("SevenDaySwitch") ~= 1 then
        return
    end
    local FightValueConfig = {}
    for k, v in pairs(SevenDay.Award.TaskAward) do
        for n, m in pairs(v) do
            if m.type == "FightValue" then
                SevenDay.TaskJudge(player,m.type,k,n)
                FightValueConfig[k] = {}
                FightValueConfig[k][m.Name] = {}
                FightValueConfig[k][m.Name][1] = m.Max_Extent
                FightValueConfig[k][m.Name][2] = player:GetInt("day_"..k.."_"..n)
            end
        end
    end
    local str = [[
        if GlobalProcessing then
            GlobalProcessing.FightingValue = ]]..Lua_tools.serialize(FightValueConfig)..[[
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--登录奖励领取
function SevenDay.GetSignInAward(player,index)
    if player then
        if index <= 0 or index > 7 then
            return""
        end
        if player:GetInt("SevenDaySignIn_"..index) ~= 1 then
            local day = player:GetInt("SevenDay_Day")
            if index <= day then
                local Award = SevenDay.Award["SignInAward"][index]
                if Award["isguard"] ~= 0 then
                    local guarddata = GuardConfig.GetById(Award["isguard"])
                    local GoodsList = {}
                    GoodsList["GuardList"] = {}
                    table.insert(GoodsList["GuardList"],guarddata.KeyName)
                    table.insert(GoodsList["GuardList"],1)
                    Lua_tools.GiveGoods(player,GoodsList, "system", "七日", "七日第"..day.."天奖励")
                    player:SetInt("SevenDaySignIn_"..index,1)
                    SevenDay.SignInChange(player,index,4)
                else
                    Lua_tools.AddItem(player, Award["item"], "system", "七日庆典","第"..index.."天登录奖励")
                    player:SetInt("SevenDaySignIn_"..index,1)
                    SevenDay.SignInChange(player,index,4)
                end
            end
        end
    end
end

--任务奖励领取
function SevenDay.GetTaskAward(player,day,index)
    if player then
        if day <= 0 or day > 7 then
            return""
        end
        if index <= 0 or index > 7 then
            return""
        end

        --判断奖励是否可领取
        if day <= player:GetInt("SevenDay_Day") then
            if player:GetInt("day_"..day.."_"..index) == 1 then
                local awardData = SevenDay.Award["TaskAward"][day][index]
                local itemList = {}
                for k, v in pairs(awardData["item"]) do
                    itemList[k] = v
                end
                local Moneytype = awardData["Moneytype"]
                local MoneyValue = awardData["MoneyValue"]
                for k, v in pairs(itemList) do
                    if v == "面板展示-银币" then
                        table.remove(itemList,k)
                        if type(itemList[k+1]) == "number" then
                            table.remove(itemList,k+1)
                        end
                    end
                end
                player:SetInt("SevenDayScore",player:GetInt("SevenDayScore") + awardData["Score"]) --添加任务积分
                for i = 25, 100, 25 do
                    if player:GetInt("SevenDayScore_"..i) ~= 1 then
                        if player:GetInt("SevenDayScore") >= i then
                            player:SetInt("SevenDayScore_"..i,4)
                            SevenDay.ScoreStateChange(player,i,1)
                        end
                    end
                end
                player:SetInt("day_"..day.."_"..index,4)--将任务状态改为已领取
                SevenDay.TaskStateChange(player,day,index,4) --按钮状态改为已领取
                Lua_tools.AddMoney(player,Moneytype,MoneyValue,"system", "七日庆典","第"..day.."天任务"..index.."奖励")
                sLuaApp:NotifyTipsMsgEx(player ,"您获得了"..MoneyValue.."银币")
                if not Lua_tools.AddItem(player, itemList, "system", "七日庆典","第"..day.."天任务"..index.."奖励") then
                    sLuaApp:LuaDbg("领取物品失败")
                end
            --elseif player:GetInt("day_"..day.."_"..index) == 2 then
            --    SevenDay.TaskGoTo(player,day,index)
            end
        else
            sLuaApp:NotifyTipsMsgEx(player ,"可领取时间未达到，请耐心等待哦")
        end
    end
end

--积分奖励领取
function SevenDay.GetScoreAward(player,score)
    if player then
        if score < 0 or score > 140 then
            return""
        end
        if player:GetInt("SevenDayScore_"..score) ~= 1 then
            if player:GetInt("SevenDayScore") >= score then
                Lua_tools.AddItem(player, SevenDay.Award["ScoreAward"][score]["item"], "system", "七日庆典",""..score.."积分奖励" )
                player:SetInt("SevenDayScore_"..score,1)
                SevenDay.ScoreStateChange(player,score,4)
            end
        end
    end
end

function SevenDay.TaskJudge(player,Task_Type,day,index)
    if player == nil or Task_Type == nil or day == nil or index == nil then
        return
    end
    if Task_Type == "FightValue" then --战力任务判断
        local FightValue = player:GetAttr(ROLE_ATTR_FIGHT_VALUE)
            if player:GetInt("day_"..day.."_"..index) ~= 4 then --如果状态不是已领取
                if FightValue >= SevenDay.Award.TaskAward[day][index].Max_Extent then
                    player:SetInt("day_"..day.."_"..index,1)
                else
                    player:SetInt("day_"..day.."_"..index,2)
                end
            end
        return FightValue
    end
    return ""
end

--任务进度实时更新
function SevenDay.ExtentChange(player,day,index,NewExtent)
    local str = [[
        if Activity7DaysUI then
            if Activity7DaysUI.ServerData then
                if Activity7DaysUI.ServerData["TaskAward"] then
                    Activity7DaysUI.ServerData["TaskAward"][]]..day..[[][]]..index..[[]["Now_Extent"] = ]].. NewExtent ..[[
                    Activity7DaysUI.NotifyData()
                end
            end
        end
        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--任务按钮实时更新
function SevenDay.TaskStateChange(player,day,index,State)
    SevenDay.RedPointRefresh(player)
    local str = [[
        if Activity7DaysUI then
            if Activity7DaysUI.ServerData then
                if Activity7DaysUI.ServerData["TaskAward"] then
                    Activity7DaysUI.ServerData["TaskAward"][]]..day..[[][]]..index..[[]["ButtonState"] = ]].. State ..[[
                    Activity7DaysUI.NotifyData()
                end
            end
        end

        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end
--登录按钮实时更新
function SevenDay.SignInChange(player,index,State)

    local str = [[
        if Activity7DaysUI then
            if Activity7DaysUI.ServerData then
                if Activity7DaysUI.ServerData["TaskAward"] then
                    Activity7DaysUI.ServerData["SignInAward"][]]..index..[[]["ButtonState"] = ]].. State ..[[
                    Activity7DaysUI.NotifyData()
                end
            end
        end
        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end
--积分按钮实时更新
function SevenDay.ScoreStateChange(player,score,State)

    local str = [[
        if Activity7DaysUI then
            if Activity7DaysUI.ServerData then
                if Activity7DaysUI.ServerData["TaskAward"] then
                    Activity7DaysUI.ServerData["ScoreAward"][]]..score..[[]["ButtonState"] = ]].. State ..[[
                    Activity7DaysUI.NotifyData()
                end
            end
        end
        ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

function SevenDay.ShiMenTaskGoTo(player)
    local shimen = player:GetAttr(ROLE_ATTR_RACE)
    if shimen == 3 then
        Lua_tools.MoveToNpc(player, 10010)
    elseif shimen == 1 then
        Lua_tools.MoveToNpc(player, 10008)
    elseif shimen == 2 then
        Lua_tools.MoveToNpc(player, 10012)
    elseif shimen == 4 then
        Lua_tools.MoveToNpc(player, 10013)
    elseif shimen == 5 then
        Lua_tools.MoveToNpc(player, 10011)
    end
end

--帮派任务前往接口
function SevenDay.GuildTaskGoTo(player)
    local guild = player:GetGuild()
    if guild then
        Lua_tools.MoveToNpc(player, 20057)
    else
        sLuaApp:NotifyTipsMsgEx(player ,"您需要先参加一个帮派哦")
    end
end

--七日小红点刷新
function SevenDay.GetRedPointList(player)
	if FunctionSwitch.AllFuncitonConfig.SevenDay ~= "on" then
		return
	end
    local RedPointList = {}
    RedPointList.ScoreAward = {}
    RedPointList.SignInAward = {}
    RedPointList.TaskAward = {}
    for k, v in pairs(SevenDay.Award.ScoreAward) do
        if player:GetInt("SevenDayScore") >= k and player:GetInt("SevenDayScore_"..k) ~= 1 then
            RedPointList.ScoreAward[k] = true
        else
            RedPointList.ScoreAward[k] = false
        end
    end

    for k, v in pairs(SevenDay.Award.SignInAward) do
        if k <= player:GetInt("SevenDay_Day") and player:GetInt("SevenDaySignIn_"..k) ~= 1 then
            RedPointList.SignInAward[k] = true
        else
            RedPointList.SignInAward[k] = false
        end
    end

    for k, v in pairs(SevenDay.Award.TaskAward) do
        RedPointList.TaskAward[k] = {}
        for n, m in pairs(v) do
            if player:GetInt(("day_"..k.."_"..n)) == 1 and k <= player:GetInt("SevenDay_Day") then
                RedPointList.TaskAward[k][m.Name] = true
            else
                RedPointList.TaskAward[k][m.Name] = false
            end
        end
    end
    return RedPointList
end

--小红点刷新
function SevenDay.RedPointRefresh(player)
    if player == nil then
        return
    end
	if FunctionSwitch.AllFuncitonConfig.SevenDay ~= "on" then
		return
	end
    local RedPointList = SevenDay.GetRedPointList(player)
    local str = [[
        if Activity7DaysUI then
            Activity7DaysUI.RedPointTable = ]]..Lua_tools.serialize(RedPointList)..[[
            Activity7DaysUI.RefreshRed7day()
        end
        if GlobalProcessing then
            GlobalProcessing.RedPointTable = ]]..Lua_tools.serialize(RedPointList)..[[
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    SevenDay.GetFightValueConfig(player)
end

--登录小红点刷新
function SevenDay.RedPointRefresh_Main(player)
    if player == nil then
        return
    end
	if FunctionSwitch.AllFuncitonConfig.SevenDay ~= "on" then
		return
	end
    local RedPointList = SevenDay.GetRedPointList(player)
    local str = [[
        if GlobalProcessing then
            GlobalProcessing.RedPointTable = ]]..Lua_tools.serialize(RedPointList)..[[
            GlobalProcessing.InSevenDay = ]]..player:GetInt("SevenDay_Day")..[[
            GlobalProcessing.Acitvity7Day_Loading()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--玩家登陆回调
function SevenDay.player_on_login(player)
    if FunctionSwitch.AllFuncitonConfig.SevenDay ~= "on" then
		return
	end
    local Now_Time = sLuaApp:GetTimes()
    local Over_time = player:GetInt("SevenDay_Over_time")
    if Over_time == 0 then
        return
    end
    if Now_Time > Over_time then
        SevenDay.SevenDayClose(player)
    else
        --刷新小红点
        local LastLoginDay = player:GetInt("SevenDay_Last_Day")
        local NowLoginDay = sLuaApp:DaySinceEpoch(0)
        if Over_time - Now_Time < (24*60*60) then
            sLuaTimerSystem:AddTimerEx(player,(sLuaApp:GetTodayRemain()+1)*1000, 1 ,"SevenDay.SevenDayClose", "")
        end
        if NowLoginDay > LastLoginDay then
            player:SetInt("SevenDay_Last_Day",sLuaApp:DaySinceEpoch(0))
            player:SetInt("SevenDay_Day",player:GetInt("SevenDay_Day") + 1)
        end

        --注册战力监听事件
        local str = [[
            if GlobalProcessing and GlobalProcessing.Set7dayData then
                GlobalProcessing.Set7dayData()
            end
        ]]
        sLuaApp:ShowForm(player, "脚本表单", str)
    end

    --变强七日相关红点判断
    local str = [[
        if GlobalProcessing and GlobalProcessing.SevenDayBeStrongOver then
            GlobalProcessing.SevenDayBeStrongOver()
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
end

--每个新的一天开始，进入回调
function SevenDay.NewDayCallBack()
    if FunctionSwitch.AllFuncitonConfig.SevenDay ~= "on" then
		return
	end
    local playerlist = sPlayerSystem:GetAllPlayers()
    for k, v in pairs(playerlist) do
        SevenDay.player_on_login(v)
    end
end

--七日活动关闭
function SevenDay.SevenDayClose(player)
    local Now_Time = sLuaApp:GetTimes()
    local Over_time = player:GetInt("SevenDay_Over_time")
    if Now_Time >= Over_time then
        --关闭七日活动界面
        player:SetInt("SevenDaySwitch",2)
        --清除相关自定义变量
        player:SetInt("SevenDayScore",0)
        --player:SetInt("SevenDay_Over_time",Over_time)
        player:SetInt("SevenDay_Skill",0)
        player:SetInt("SevenDay_Equip",0)
        player:SetInt("SevenDay_Quest",0)
        player:SetInt("SevenDay_Expenditure",0)
        player:SetInt("SevenDay_Pet",0)
        player:SetInt("SevenDay_Teacher",0)
        player:SetInt("SevenDay_Talent",0)
        player:SetInt("SevenDay_Guild",0)
        player:SetInt("SevenDay_Guard",0)
        player:SetInt("SevenDay_Cook",0)
        for d = 1, 7 do
            for i = 1, 5 do
                player:SetInt("day_"..d.."_"..i,0)
            end
        end
        for i = 1, 7 do
            player:SetInt("SevenDaySignIn_"..i,1)
        end
        for i = 25, 100, 25 do
            player:SetInt("SevenDayScore_"..i,0)
        end
        return 1
    else
        return 0
    end
end

function SevenDay.Repair(player)
    local day = player:GetInt("SevenDay_Day")
    local Now_Time = sLuaApp:GetTimes()
    local Over_time = player:GetInt("SevenDay_Over_time")
    if Now_Time < Over_time and Over_time ~= 0 then
        if player:GetInt("SevenDaySignIn_"..day+1) == 1 then
            for i = 1, 7 do
                player:SetInt("SevenDaySignIn_"..i,0)
            end
        end
    end
end

function SevenDay.GMRepair(player)
    for i = 1, 7 do
        player:SetInt("SevenDaySignIn_"..i,0)
    end
end