--引导脚本
Guidance = {}
Guidance.JobToSkillID = {
	[31] = 1120,
	[32] = 1210,
	[33] = 1340,
	[34] = 1420,
	[35] = 1570,
	[36] = 1610,
}
Guidance.SerConfig = {	
	--Type类型,Level_Up升级触发,QuestFight任务战斗触发,Connect为关联触发,QuestEnd任务完成触发(自己去任务脚本里面调用)
	
	--第一次登录,引导点击主线
	['First_Login'] = {GuideName = "First_Login",Type = 'Login',parm = "",Next = "",LevelUpper = 1,},
		
	--203号任务战斗,指引使用法术相关
	['QuestFight203'] = {GuideName = "QuestFight203",Type = 'QuestFight',parm = "203",Next = "",LevelUpper = 10,},
	
	--升到2级,狂送大礼相关
	--问题:有些按钮有时候会按了没效果
	['LevelUp2'] = {GuideName = "LevelUp2",Type = 'Level_Up',parm = "2",Next = "LevelUp2-1",LevelUpper = 2,},
	['LevelUp2-1'] = {GuideName = "LevelUp2-1",Type = 'Connect',parm = "",Next = "LevelUp2-2",LevelUpper = 2,},
	['LevelUp2-2'] = {GuideName = "LevelUp2-2",Type = 'Connect',parm = "",Next = "LevelUp2-3",LevelUpper = 2,},
	['LevelUp2-3'] = {GuideName = "LevelUp2-3",Type = 'Connect',parm = "",Next = "LevelUp2-4",LevelUpper = 2,},
	['LevelUp2-4'] = {GuideName = "LevelUp2-4",Type = 'Connect',parm = "",Next = "",LevelUpper = 2,},
	
	--升到5级,狂送大礼相关
	['LevelUp5'] = {GuideName = "LevelUp5",Type = 'Level_Up',parm = "5",Next = "",LevelUpper = 5,},
		
	--升到12级,技能升级相关
	--问题:升级后的按钮不是马上出现在指定位置
	['LevelUp12'] = {GuideName = "LevelUp12",Type = 'Level_Up',parm = "12",Next = "LevelUp12-1",LevelUpper = 12,},
	['LevelUp12-1'] = {GuideName = "LevelUp12-1",Type = 'Connect',parm = "",Next = "LevelUp12-2",LevelUpper = 12,},
	['LevelUp12-2'] = {GuideName = "LevelUp12-2",Type = 'Connect',parm = "",Next = "",LevelUpper = 12,},
	
	--205号任务战斗,指引使用宠物法术相关,
	--问题:不知道宠物技能
	['QuestFight205'] = {GuideName = "QuestFight205",Type = 'QuestFight',parm = "205",Next = "",LevelUpper = 10,},
	
	--升到10级,升级奖励糊脸,现在没有
	['LevelUp10'] = {GuideName = "LevelUp10",Type = 'Level_Up',parm = "10",Next = "",LevelUpper = 10,StartOver = 1},
	
	--升到13级,十连抽+侍从激活
	--问题:十连抽没有送侍从碎片
	['LevelUp13'] = {GuideName = "LevelUp13",Type = 'Level_Up',parm = "13",Next = "LevelUp13-1",LevelUpper = 13,},
	['LevelUp13-1'] = {GuideName = "LevelUp13-1",Type = 'Connect',parm = "",Next = "LevelUp13-2",LevelUpper = 13,},
	['LevelUp13-2'] = {GuideName = "LevelUp13-2",Type = 'Connect',parm = "",Next = "",LevelUpper = 13,},
	--任务245结束,vip卡相关
	--VIP卡不弹出快速使用,需要后续添加
	['QuestEnd245'] = {GuideName = "QuestEnd245",Type = 'QuestEnd',parm = "",Next = "",LevelUpper = 25,StartOver = 1},
	
	--升到27级,狂送大礼相关
	['LevelUp27'] = {GuideName = "LevelUp27",Type = 'Level_Up',parm = "27",Next = "",LevelUpper = 27,},
	
	--升到26级,好友推送
	['LevelUp26'] = {GuideName = "LevelUp26",Type = 'Level_Up',parm = "26",Next = "",LevelUpper = 26,StartOver = 1},
	
	--升到28级,帮派相关
	--问题:升级后的按钮不是马上出现在指定位置
	['LevelUp28'] = {GuideName = "LevelUp28",Type = 'Level_Up',parm = "28",Next = "",LevelUpper = 28},
	
	--升到32级,强化相关,新功能不支持特定显示,现在没有
	['LevelUp32'] = {GuideName = "LevelUp32",Type = 'Level_Up',parm = "32",Next = "LevelUp32-1",LevelUpper = 32},
	['LevelUp32-1'] = {GuideName = "LevelUp32-1",Type = 'Connect',parm = "",Next = "",LevelUpper = 32},
	
	--升到34级,辅助相关
	--问题:升级后的按钮不是马上出现在指定位置
	['LevelUp34'] = {GuideName = "LevelUp34",Type = 'Level_Up',parm = "34",Next = "",LevelUpper = 34},

	--升到35级,宠物出战相关
	--问题:道具配置是小银币袋,引导无法继续
	['LevelUp35'] = {GuideName = "LevelUp35",Type = 'Level_Up',parm = "35",Next = "LevelUp35-1",LevelUpper = 35},
	['LevelUp35-1'] = {GuideName = "LevelUp35-1",Type = 'Connect',parm = "35",Next = "",LevelUpper = 35},
	
	--任务290结束触发,辅助内容变多相关
	['QuestEnd290'] = {GuideName = "QuestEnd290",Type = 'QuestEnd',parm = "",Next = "",LevelUpper = 39},
	
	--升到41级,打造相关,新功能不支持特定显示,现在没有
	['LevelUp41'] = {GuideName = "LevelUp41",Type = 'Level_Up',parm = "41",Next = "",LevelUpper = 41},
	
	--升到51级,洗点相关,现在没有洗点功能
	['LevelUp51'] = {GuideName = "LevelUp51",Type = 'Level_Up',parm = "51",Next = "",LevelUpper = 51},
	
	--207任务战斗,自动相关
	['QuestFight207'] = {GuideName = "QuestFight207",Type = 'QuestFight',parm = "207",Next = "",LevelUpper = 10,},
}
Guidance.CilentConfig = {
	['First_Login'] = {
		{type = 1,ali = 6,x = -125,y = -64,w = 250,h = 100,str = "点击主线任务开始寻路",time = 5,ui = {},parm = "First_Login"},
	},
	['QuestFight203'] = {
		{type = 1,ali = 9,x = -53,y = -482,w = 100,h = 100,str = "点击选择法术",time = 5,ui = {},parm = "QuestFight203"},
		{type = 1,ali = 5,x = 161,y = -158,w = 100,h = 100,str = "点击选择技能",time = 5,ui = {},parm = "QuestFight203"},
		{type = 1,ali = 5,x = -290,y = -70,w = 100,h = 100,str = "点击选择要攻击的目标",time = 5,ui = {},parm = "QuestFight203"},
	},
	['LevelUp2'] = {
		{type = 1,ali = 5,x = 30,y = 250,w = 200,h = 70,str = "恭喜您升到了2级，点击领取豪华装备！",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp2"},
	},
	['LevelUp2-1'] = {
		{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击一键换装",time = 5,ui = {"QuickUseUI"},parm = "LevelUp2-1"},
	},	
	['LevelUp2-2'] = {
		{type = 1,ali = 3,x = -346,y = 134,w = 90,h = 90,str = "点击查看下次奖励",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp2-2"},
	},
	['LevelUp2-3'] = {
		{type = 1,ali = 5,x = 0,y = -70,w = 500,h = 500,str = "升到5级就可以带你的神兽宝宝回家啦！努力升级吧~",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp2-3"},
	},
	['LevelUp2-4'] = {
		{type = 1,ali = 5,x = 268,y = -253,w = 55,h = 55,str = "点击关闭界面",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp2-4"},
	},
	['LevelUp5'] = {
		{type = 1,ali = 5,x = 30,y = 250,w = 200,h = 70,str = "恭喜您升到了5级，点击领取你的专属神兽吧！",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp5"},
	},
	['LevelUp10'] = {
		{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "恭喜您升到了10级，快去看看有啥福利吧！",time = 5,ui = {"SignInAndLevelGiftUI"},parm = "LevelUp10"},
		{type = 1,ali = 5,x = 423,y = 21,w = 120,h = 45,str = "点击领取精美大礼",time = 5,ui = {"SignInAndLevelGiftUI","WelfareUI"},parm = "LevelUp10"},
	},
	
	['LevelUp12'] = {
		{type = 1,ali = 9,x = -115,y = -60,w = 70,h = 70,str = "点击【技能】按钮~",time = 5,ui = {},parm = "LevelUp12"},
	},
	['LevelUp12-1'] = {
		{type = 1,ali = 5,x = 444,y = 279,w = 145,h = 40,str = "学习技能提升实力，点击一键升级",time = 5,ui = {"RoleSkillUI"},parm = "LevelUp12-1"},
	},
	['LevelUp12-2'] = {
		{type = 1,ali = 5,x =550,y = -270,w = 65,h = 65,str = "点击关闭界面",time = 5,ui = {"RoleSkillUI"},parm = "LevelUp12-2"},
	},
	['LevelUp13'] = {
		{type = 1,ali = 1,x = 51,y = 144,w = 85,h = 85,str = "恭喜您解锁了祈福功能，点击【新功能】按钮",time = 5,ui = {""},parm = "LevelUp13"},
		{type = 1,ali = 5,x = 0,y = 175,w = 120,h = 45,str = "点击领取祈福材料，可用于抽取神秘大礼",time = 5,ui = {"FunctionPreviewUI"},parm = "LevelUp13"},
	},
	['LevelUp13-1'] = {
		--12不同模式 以后可以往下配置 默认为1版本 具体搜PrayConfig.Mode
		[1] = {
			{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击使用按钮，打开祈福界面",time = 5,ui = {"QuickUseUI","PrayUI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = -255,y = 255,w = 150,h = 85,str = "点击【祈福十次】",time = 5,ui = {"PrayUI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = 0,y = 0,w = 500,h = 250,str = "这里是获得的奖励",time = 3,ui = {"PrayUI","GetRewardUI","SignInAndLevelGiftUI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = 118,y = 114,w = 140,h = 48,str = "点击知道了关闭窗口",time = 5,ui = {"PrayUI","GetRewardUI","SignInAndLevelGiftUI"},parm = "LevelUp13-1"},
		},
		[2] = {
			{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击使用按钮，打开祈福界面",time = 5,ui = {"QuickUseUI","Pray_2UI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = -255,y = 255,w = 150,h = 85,str = "点击【祈福十次】",time = 5,ui = {"Pray_2UI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = 0,y = 0,w = 500,h = 250,str = "这里是获得的奖励",time = 5,ui = {"Pray_2UI","GetRewardUI","SignInAndLevelGiftUI"},parm = "LevelUp13-1"},
			{type = 1,ali = 5,x = 118,y = 114,w = 140,h = 48,str = "点击知道了关闭窗口",time = 5,ui = {"Pray_2UI","GetRewardUI","SignInAndLevelGiftUI"},parm = "LevelUp13-1"},		
		}
	},
	['LevelUp13-2'] = {
		{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击一键激活",time = 5,ui = {"SignInAndLevelGiftUI"},parm = "LevelUp13-2"},
		{type = 1,ali = 5,x = 350,y = 300,w = 92,h = 38,str = "点击是获得侍从敖丙",time = 5,ui = {"GuardUI","SignInAndLevelGiftUI"},parm = "LevelUp13-2"},
	},
	['QuestFight205'] = {
		{type = 1,ali = 9,x = -53,y = -482,w = 100,h = 100,str = "点击选择法术",time = 5,ui = {},parm = "QuestFight205"},
		{type = 1,ali = 5,x = 161,y = -158,w = 100,h = 100,str = "点击选择技能",time = 5,ui = {},parm = "QuestFight205"},
		{type = 1,ali = 5,x = -290,y = -70,w = 100,h = 100,str = "点击选择要攻击的目标",time = 5,ui = {},parm = "QuestFight205"},
		{type = 1,ali = 9,x = -53,y = -372,w = 100,h = 100,str = "点击选择宠物法术",time = 5,ui = {},parm = "QuestFight205"},
		{type = 1,ali = 5,x = 161,y = -158,w = 100,h = 100,str = "点击选择宠物技能",time = 5,ui = {},parm = "QuestFight205"},
		{type = 1,ali = 5,x = -290,y = -70,w = 100,h = 100,str = "点击选择宠物要攻击的目标",time = 5,ui = {},parm = "QuestFight205"},
	},
	['QuestEnd245'] = {
		{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击使用VIP经验卡，可升级VIP等级",time = 5,ui = {"QuickUseUI"},parm = "QuestEnd245"},
	},
	['LevelUp27'] = {
		{type = 1,ali = 5,x = 30,y = 250,w = 200,h = 70,str = "恭喜您升到了27级，点击领取观音",time = 5,ui = {"GradeGiftUI"},parm = "LevelUp27"},
	},
	['LevelUp26'] = {
		{type = 1,ali = 5,x = 425,y = 295,w = 160,h = 45,str = "试试你的新功能一键加好友，点击全部添加",time = 5,ui = {"FriendShipRecommend"},parm = "LevelUp26"},
	},
	['LevelUp28'] = {
		{type = 1,ali = 9,x = -185,y = -60,w = 70,h = 70,str = "点击【帮派】按钮~",time = 5,ui = {},parm = "LevelUp28"},
		{type = 0,ali = 5,x = -150,y = -150,w = 500,h = 200,str = "这里是帮派列表，找到自己喜欢的帮派申请加入吧~",time = 5,ui = {"FactionCreateUI"},parm = "LevelUp28"},
	},
	['LevelUp32'] = {
		{type = 1,ali = 1,x = 51,y = 144,w = 85,h = 85,str = "恭喜您解锁了强化功能，点击【新功能】按钮",time = 5,ui = {""},parm = "LevelUp32"},
		{type = 1,ali = 5,x = 0,y = 175,w = 120,h = 45,str = "点击领取强化材料，可用于强化装备",time = 5,ui = {"FunctionPreviewUI"},parm = "LevelUp32"},
	},
	['LevelUp32-1'] = {
		{type = 1,ali = 9,x = -115,y = -60,w = 70,h = 70,str = "点击【装备】按钮~",time = 5,ui = {"EquipUI"},parm = "LevelUp32-1"},
		{type = 1,ali = 5,x = -367,y = -145,w = 280,h = 110,str = "这里是自身的装备区域，可选择要强化的装备",time = 5,ui = {"EquipUI"},parm = "LevelUp32-1"},
		{type = 1,ali = 5,x = 175,y = 0,w = 685,h = 255,str = "强化区域可看到强化后的属性",time = 5,ui = {"EquipUI"},parm = "LevelUp32-1"},
		{type = 1,ali = 5,x = 175,y = 200,w = 380,h = 120,str = "这里是材料消耗的地方，拥有足够的材料才可以强化哦~",time = 5,ui = {"EquipUI"},parm = "LevelUp32-1"},
		{type = 1,ali = 5,x = 175,y = 300,w = 70,h = 70,str = "这里可以看到当前强化的成功率，快去试试吧！",time = 5,ui = {"EquipUI"},parm = "LevelUp32-1"},
	},
	['LevelUp34'] = {
		{type = 1,ali = 9,x = -117,y = -144,w = 70,h = 70,str = "点击【辅助】按钮~",time = 5,ui = {},parm = "LevelUp34"},
		{type = 0,ali = 5,x = -356,y = -130,w = 100,h = 100,str = "选择你想要自动的任务",time = 5,ui = {"PlugSystemUI"},parm = "LevelUp34"},
		{type = 0,ali = 5,x = 400,y = 270,w = 70,h = 70,str = "点击【开始辅助】",time = 5,ui = {"PlugSystemUI"},parm = "LevelUp34"},
	},
	['LevelUp35'] = {
		{type = 1,ali = 1,x = 51,y = 144,w = 85,h = 85,str = "点击【新功能】按钮",time = 5,ui = {""},parm = "LevelUp35"},
		{type = 1,ali = 5,x = 0,y = 175,w = 120,h = 45,str = "点击获取新宠物~",time = 5,ui = {"FunctionPreviewUI"},parm = "LevelUp35"},
		{type = 1,ali = 5,x = 154,y = -210,w = 41,h = 43,str = "点击关闭功能预告",time = 5,ui = {"FunctionPreviewUI"},parm = "LevelUp35"},
	},
	['LevelUp35-1'] = {
		{type = 1,ali = 3,x = -220,y = 35,w = 80,h = 80,str = "点击打开宠物面板",time = 5,ui = {"PetUI"},parm = "LevelUp35-1"},
		{type = 1,ali = 5,x = 563,y = 252,w = 59,h = 95,str = "点击阵容按钮",time = 5,ui = {"PetUI"},parm = "LevelUp35-1"},
		{type = 1,ali = 5,x = -351,y = -148,w = 332,h = 102,str = "选择一个宠物",time = 5,ui = {"PetUI"},parm = "LevelUp35-1"},
		{type = 1,ali = 5,x = 234,y = -40,w = 80,h = 80,str = "在这里选择一个上阵位置，快去试试吧！",time = 5,ui = {"PetUI"},parm = "LevelUp35-1"},
	},
	['LevelUp41'] = {
		{type = 1,ali = 1,x = 51,y = 144,w = 85,h = 85,str = "恭喜您解锁了打造功能，点击【新功能】按钮",time = 5,ui = {""},parm = "LevelUp41"},
		{type = 1,ali = 5,x = 0,y = 175,w = 120,h = 45,str = "点击领取材料礼包，材料可用于打造装备",time = 5,ui = {"FunctionPreviewUI"},parm = "LevelUp41"},
		{type = 1,ali = 9,x = -220,y = -170,w = 120,h = 50,str = "点击使用按钮，获取材料",time = 5,ui = {"QuickUseUI","FunctionPreviewUI"},parm = "LevelUp41"},
		{type = 1,ali = 9,x = -115,y = -60,w = 70,h = 70,str = "点击【装备】按钮~",time = 5,ui = {"EquipUI"},parm = "LevelUp41"},
		{type = 1,ali = 5,x = 275,y = -215,w = 150,h = 45,str = "点击【打造】按钮~",time = 5,ui = {"EquipUI"},parm = "LevelUp41"},
		{type = 1,ali = 5,x = -367,y = -145,w = 280,h = 110,str = "在这里选择一个想要打造的物品，快去试试吧",time = 5,ui = {"EquipUI"},parm = "LevelUp41"},
	},
	['LevelUp51'] = {
		{type = 1,ali = 3,x = -50,y = 50,w = 100,h = 100,str = "点击头像打开属性面板",time = 5,ui = {"RoleAttributeUI"},parm = "LevelUp51"},
		{type = 1,ali = 5,x = 410,y = 227,w = 80,h = 40,str = "点击加点按钮，查看自身可分配属性点",time = 5,ui = {"RoleAttributeUI","AddPointUI"},parm = "LevelUp51"},
		{type = 1,ali = 5,x = -250,y = 185,w = 135,h = 50,str = "点击推荐加点，合理的运用属性点",time = 5,ui = {"RoleAttributeUI","AddPointUI"},parm = "LevelUp51"},
		{type = 1,ali = 5,x = -55,y = 185,w = 135,h = 50,str = "点击确认加点",time = 5,ui = {"RoleAttributeUI","AddPointUI"},parm = "LevelUp51"},
	},
	
	['QuestEnd290'] = {
		{type = 1,ali = 9,x = -117,y = -144,w = 70,h = 70,str = "点击【辅助】按钮~",time = 5,ui = {},parm = "QuestEnd290"},
		{type = 0,ali = 5,x = -356,y = -174,w = 100,h = 100,str = "随着等级的提高可以解锁更多辅助功能哦~",time = 5,ui = {"PlugSystemUI"},parm = "QuestEnd290"},
	},
	['QuestFight207'] = {
		{type = 1,ali = 9,x = -55,y = -65,w = 100,h = 100,str = "点击自动战斗",time = 5,ui = {},parm = "QuestFight207"},
	},
}
--主方法,处理各种触发,处理登录,str为""时是登录,str有值是正常触发
function Guidance.main(player,str)
	--sLuaApp:LuaWrn("==============Guidance.main   str = "..str)
	if not Guidance.Check(player) then
		return
	end
	if player:GetInt("Guidance_"..str) ~= 0 then
		return
	end
	local Now_Guidance = player:GetString("Now_Guidance")
	local form_str = ""
	if str == "" then
		if Now_Guidance == "0" then
			return
		else
			if not Guidance.SerConfig[''..Now_Guidance] then
				return
			end
			local level = player:GetAttr(ROLE_ATTR_LEVEL)
			if level > Guidance.SerConfig[''..Now_Guidance]['LevelUpper'] then
				player:SetInt("Guidance_"..Now_Guidance,1)
				player:SetString("Now_Guidance","0")
				return
			end
			if Guidance.SerConfig[''..Now_Guidance]['Type'] == "QuestFight" then
				player:SetString("Now_Guidance","0")
				return
			end
			if Guidance.SerConfig[''..Now_Guidance]['Type'] == "Connect" then
				if Now_Guidance == "" then
					
				else
					player:SetInt("Guidance_"..Now_Guidance,1)
					player:SetString("Now_Guidance","0")
					return
				end
			end
		end
	else
		if str == "QuestFight205" then
			if tonumber(PetLineup.GetNowLineup(player)[0]) == -1 then
				player:SetInt("Guidance_"..str,1)
				player:SetString("Now_Guidance","0")
				return
			end
		elseif str == "LevelUp26" then
			form_str = [[
				GUI.OpenWnd("FriendShipRecommend",1)
			]]
		elseif str == "LevelUp13" then
			form_str = [[
				UIDefine.FunctionPreviewUI_ShowTitle = "祈福"
			]]
		elseif str == "LevelUp32" then
			form_str = [[
				UIDefine.FunctionPreviewUI_ShowTitle = "装备强化"
			]]
		elseif str == "LevelUp35" then
			form_str = [[
				UIDefine.FunctionPreviewUI_ShowTitle = "侍宠出战"
			]]
		elseif str == "LevelUp41" then
			form_str = [[
				UIDefine.FunctionPreviewUI_ShowTitle = "装备打造"
			]]
		elseif str == "LevelUp10" then
			form_str = [[
				GUI.OpenWnd('SignInAndLevelGiftUI','28105_2')
			]]
		elseif str == "LevelUp35-1" then
			if sPetSystem:GetGuardPet(player,1) then
				return
			end
		end
		
		if Now_Guidance ~= "0" then
			player:SetInt("Guidance_"..Now_Guidance,1)
		end
		Now_Guidance = str
		player:SetString("Now_Guidance",str)
	end
	if Guidance.CilentConfig[''..Now_Guidance] then
		if Guidance.CilentConfig[''..Now_Guidance]['StartOver'] then
			player:SetInt("Guidance_"..Now_Guidance,1)
			player:SetString("Now_Guidance","0")
		end
		local team = player:GetTeam()
		if team then
			if not sTeamSystem:IsTeamLeader(team,player) and not sTeamSystem:IsTempLeave(player) then
				return
			end
		end
		--if player:GetInt("Guidance_Running") == 1 then
		--	return
		--end
		--player:SetInt("Guidance_Running",1)
		if str == "LevelUp13-1" then
			form_str = form_str..[[
				GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.CilentConfig[''..Now_Guidance][PrayConfig.Mode or 1])..[[
			]]
		
		else
			form_str = form_str..[[
				GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.CilentConfig[''..Now_Guidance])..[[
			]]
		end
		if str == "LevelUp41" or str == "LevelUp35" or str == "LevelUp32" or str == "LevelUp13" then
			form_str = form_str..[[
				MainDynamicUI.RefreshLeftDynamicUIVisible()
				local index = MainDynamicUI.GetDynamicBtnListIndex('functionPreviewGroup')
				GuideData.ServerData[1]['y'] = GuideData.ServerData[1]['y'] + (index-1)*85
			]]
		end
		form_str = form_str..[[
			CL.StopMove()
			MainUI.OnTryOpenGuideUI()
		]]
		--关闭辅助
		if Assist then
			Assist.CheckEnd(player)
		end
		
		sLuaApp:ShowForm(player, "脚本表单", form_str)
	end
end
--任务用
function Guidance.GetGuidanceStr(player,str)
	if not Guidance.Check(player) then
		return
	end
	if player and str then
		local tb_param = sLuaApp:StrSplit(str, ",")
		if tb_param then
			local Guidance_Name = tb_param[1]
			if Guidance_Name and Guidance.CilentConfig[''..Guidance_Name] then
				local str1 = [[
					GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.CilentConfig[''..Guidance_Name])..[[
					MainUI.OnTryOpenGuideUI()
				]]
				sLuaApp:ShowForm(player, "脚本表单", str1)
			end
		end
	end
end
--引导完成或者去他妈的超时处理
function Guidance.FinishOrOverTime(player,str,index,is_overtime)
	--sLuaApp:LuaWrn("==============Guidance.FinishOrOverTime   str = "..str.."  index = "..index.."  is_overtime = "..is_overtime)
	if not Guidance.Check(player) then
		return
	end
	--sLuaApp:LuaWrn("==============Guidance.FinishOrOverTime111")
	if str ~= player:GetString("Now_Guidance") then
		return
	end
	--sLuaApp:LuaWrn("==============Guidance.FinishOrOverTime222")
	if tonumber(is_overtime) == 1 then
		--这里是穷举
		local form = ""
		if str == "First_Login" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
					TrackUI.OnManualClickQuest(]].. 200 ..[[)
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "QuestFight203" then
			if index == 1 then
				form = [[
					FightUI.OnMagicClick()
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				local job = player:GetAttr(3)
				local skillID = Guidance.JobToSkillID[job]
				form = [[
					FightUI.ClickSkillBtnBySkillID(]]..skillID..[[)
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					FightUI.ClickRoleByPos(101)
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp2" or str == "LevelUp5" or str == "LevelUp27" then
			form = [[
				if GuideUI then
					GuideUI.OnExit()
				end
				if GradeGiftUI then
					GradeGiftUI.GetTheGift()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp2-1" then
			form = [[
				if GuideUI then
					GuideUI.OnExit()
				end
				if QuickUseUI then
					QuickUseUI.OnUseBtnClick()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp2-2" then
			form = [[
				if GuideUI then
					GuideUI.OnExit()
				end
				if GradeGiftBtn then
					GradeGiftBtn.ShowGradeGiftBtnClick()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp2-3" then
			form = [[
				if GuideUI then
					GuideUI.OnExit()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp2-4" then
			form = [[
				if GuideUI then
					GuideUI.OnExit()
				end
				if GradeGiftUI then
					GradeGiftUI.OnExit()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "QuestFight205" then
			if index == 1 then
				form = [[
					FightUI.OnMagicClick()
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				local job = player:GetAttr(3)
				local skillID = Guidance.JobToSkillID[job]
				form = [[
					FightUI.ClickSkillBtnBySkillID(]]..skillID..[[)
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					FightUI.ClickRoleByPos(101)
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp12" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
					GUI.OpenWnd("RoleSkillUI")
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp12-1" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
					if RoleSkillUI then
						RoleSkillUI.OnLearnSkillBtn_AllClick()
					end
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp12-2" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
					GUI.CloseWnd("RoleSkillUI")
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "QuestEnd245" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp26" then
			form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
					if FriendShipRecommend then
						FriendShipRecommend.OnSureActionBtnClick()
					end
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp28" then
			if index == 1 then
				form = [[
					if MainUI then
						MainUI.OnFactionClick()
					end
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp34" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("PlugSystemUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "QuestEnd290" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("PlugSystemUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "QuestFight207" then
			form = [[
					FightUI.OnAutoFightClick()
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp13" then
			if index == 1 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = "祈福"
					GUI.OpenWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = nil
					if FunctionPreviewUI then
						FunctionPreviewUI.OnClickGetReward()
					end
					GUI.CloseWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp13-1" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("PrayUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					CL.SendNotify(NOTIFY.SubmitForm, "FormPray", "StartDraw", 1, 2)
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					GUI.CloseWnd("GetRewardUI")
					GUI.CloseWnd("PrayUI")
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str][PrayConfig.Mode or 1] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp32" then
			if index == 1 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = "装备强化"
					GUI.OpenWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = nil
					if FunctionPreviewUI then
						FunctionPreviewUI.OnClickGetReward()
					end
					GUI.CloseWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end	
		elseif str == "LevelUp32-1" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("EquipUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 5 then
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.Next()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp35" then
			if index == 1 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = "侍宠出战"
					GUI.OpenWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = nil
					if FunctionPreviewUI then
						FunctionPreviewUI.OnClickGetReward()
					end
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					GUI.CloseWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp35-1" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("PetUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					PetUI.OnJoinBattleBtnClick()
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 4 then
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp51" then
			if index == 1 then
				form = [[
					GUI.OpenWnd("RoleAttributeUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					GUI.OpenWnd("AddPointUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					if AddPointUI then
						AddPointUI.OnSuggestBtnClick()
					end
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp41" then	
			if index == 1 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = "装备打造"
					GUI.OpenWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					UIDefine.FunctionPreviewUI_ShowTitle = nil
					if FunctionPreviewUI then
						FunctionPreviewUI.OnClickGetReward()
					end
					GUI.CloseWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 3 then
				form = [[
					if QuickUseUI then
						QuickUseUI.OnUseBtnClick()
					end
					GUI.CloseWnd("FunctionPreviewUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 4 then
				form = [[
					GUI.OpenWnd("EquipUI")
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 5 then
				form = [[
					EquipUI.tabSubIndex = 2
                    EquipUI.Refresh()
					if GuideUI then
						GuideUI.Next()
					end
				]]
			else
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp10" then
			if index == 1 then
				form = [[
					if SignInAndLevelGiftUI then
						SignInAndLevelGiftUI.on_click_btn()
					end
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		elseif str == "LevelUp13-2" then
			if index == 1 then
				form = [[
					if SignInAndLevelGiftUI then
						SignInAndLevelGiftUI.on_click_btn()
					end
					if GuideUI then
						GuideUI.Next()
					end
				]]
			elseif index == 2 then
				form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
			end
			sLuaApp:ShowForm(player, "脚本表单", form)
			if index == #Guidance.CilentConfig[''..str] then
				Guidance.Finish(player,str)
			end
		end
	else
		Guidance.Finish(player,str)
	end
end

function Guidance.Finish(player,str)
	--sLuaApp:LuaWrn("==============Guidance.Finish   str = "..str)
	if not Guidance.Check(player) then
		return
	end
	if player:GetInt("Guidance_"..str) == 0 then
		player:SetString("Now_Guidance","0")
		player:SetInt("Guidance_"..str,1)
		--player:SetInt("Guidance_Running",0)
		local form = [[
					if GuideUI then
						GuideUI.OnExit()
					end
				]]
		if str == "LevelUp13" or str == "LevelUp32" or str == "LevelUp41" then
			form = form..[[
				UIDefine.FunctionPreviewUI_ShowTitle = nil
				GUI.CloseWnd("FunctionPreviewUI")
			]]
		end
		sLuaApp:ShowForm(player, "脚本表单", form)
		if Guidance.SerConfig[''..str] then
			if Guidance.SerConfig[''..str]['Next']then
				if Guidance.SerConfig[''..str]['Next']  ~= "" then
					if Guidance.SerConfig[''..Guidance.SerConfig[''..str]['Next']] then
						Guidance.main(player,Guidance.SerConfig[''..Guidance.SerConfig[''..str]['Next']].GuideName)
					end
				end
			end
		end
	end	
end
--登录的时候判断
function Guidance.Login(player)
	--sLuaApp:LuaWrn("==============Guidance.Login")
	if not Guidance.Check(player) then
		return
	end
	--player:SetInt("Guidance_Running",0)
	--用""和"0"来区分是否第一次登录
	if player:GetString("Now_Guidance") == "" then	
		player:SetString("Now_Guidance","First_Login")
		return
	end
	Guidance.main(player,"")
end
--检查
function Guidance.Check(player)
	--if player:GetInt("GuidanceFunciton") ~= 0 then
		if not Guidance.SerConfig then
			return false
		end
		if not Guidance.CilentConfig then
			return false
		end
		if FunctionSwitch.AllFuncitonConfig['Guidance'] ~= "on" then
			return false
		end
		return true
	--end
	--return false
end
--升级触发
function Guidance.OnLevelUp(player, level)
	--sLuaApp:LuaWrn("==============Guidance.OnLevelUp")
	if not Guidance.Check(player) then
		return
	end
	for k,v in pairs(Guidance.SerConfig) do
		if level > v.LevelUpper then
			player:SetInt("Guidance_"..v.GuideName,1)
		end
		if v.Type == 'Level_Up' then
			if level == tonumber(v.parm) then
				Guidance.main(player,""..v.GuideName)
			end
		end
	end
end
--剧情播放结束
function Guidance.MovieEnd(player, tinmer, p)
	--sLuaApp:LuaWrn("==============Guidance.MovieEnd")
	if not Guidance.Check(player) then
		return
	end
	if p == "First_Login" then
		Guidance.main(player,"")
	end
end
--战斗开始触发
function Guidance.OnFightBegin(fighters,quest_id)
	--sLuaApp:LuaWrn("==============Guidance.OnFightBegin   quest_id = "..quest_id)
	for k,v in pairs(Guidance.SerConfig) do
		--sLuaApp:LuaWrn("==============Guidance.OnFightBegin   parm = "..v.parm)
		if v.Type == "QuestFight" and quest_id == tonumber(v.parm) then
			local player = sPlayerSystem:GetPlayerByGUID(fighters[1]:GetGUID())
			Guidance.main(player,""..v.GuideName)
			break
		end
	end
end

