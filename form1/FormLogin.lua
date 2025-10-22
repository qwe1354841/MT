--玩家登录后调用
FormLogin = {}

FormLogin.Func = {
	function(player)
		if sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID") ~= 0 then
			if TianXiaHuiWu then
				TianXiaHuiWu.SyncSignState(player)
			end
		end
		if sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID") ~= 0 then
			if TianXiaDiYi then
				TianXiaDiYi.SyncSignState(player)
			end
		end
	end,
	function(player)
		if EquipIntensify then
			EquipIntensify.GetConfig(player)
		end

		if sQuestionSystem:HasQuestion(0) then
			local str = [[
				ChatUI.WorldQuestion('唐王遇到一些难题，请得知答案的少侠发送在世界频道，唐王将会给予回答正确答案的玩家奖励。此次的题目是：]]..sDBVarSystem:GetString("QuestionWord_Ask")..[[')
			]]
			sLuaApp:ShowForm(player,"脚本表单", str)	
		end
	end,
	function(player)
		if SuitSys then
			SuitSys.on_login(player)
		end
	end,
	function(player)
		if FunctionSwitch.AllFuncitonConfig['Repair'] == "on" then
			if RepairSystem then
				RepairSystem.on_login(player)
			end
		end

		if FunctionSwitch.AllFuncitonConfig['EquipSpecialEffect'] == "on" then
			if EquipSpecialEffect then
				EquipSpecialEffect.on_login(player)
			end
		end
	end,
	function(player)
		if PlayerSkillSpell then
			PlayerSkillSpell.On_Login(player)
		end

		if WingSystem then
			WingSystem.SetWingStageData(player)
		end

		if Act_BangZhan then
			Act_BangZhan.On_Login(player)
		end
	end,
	function(player)
		if PetGuide then
			PetGuide.GetData(player)
		end

		if PetLineup then
			PetLineup.GetData(player)
		end

		if GradePresent then
			GradePresent.on_player_login(player)
		end
	end,
	function(player)
		if PetEgg then
			PetEgg.on_player_login(player)
		end
		
		if OfficialPosition then
			OfficialPosition.GetOPConfig(player)
		end

		if DonateEquipAndPet then
			DonateEquipAndPet.GetTypeData(player)
		end
	end,
	function(player)
		if Assist then
			Assist.CheckEnd(player)
		end

		-- 发送侍从升星数据
		if FormGuard then
			FormGuard.get_guard_up_star_data(player)
		end

		-- 发送修炼技能等级
		if FormCultivationSkill then
			FormCultivationSkill.get_skill_Level_limit(player)
		end
	end,

	function(player)
		if RedPointSystem then
			RedPointSystem.OnLogin(player)
		end
			
		if SwitchOnAward then
			SwitchOnAward.OnLogin(player)
		end
		
		if DailyOnline then
			DailyOnline.On_Login(player)
		end
	end,
	function(player)
		if LevelPackage then
			LevelPackage.On_Login(player)
		end
	
		--系统开启整合
		if MainUISwitch then
			MainUISwitch.GetMainUISwitchData(player)
		end
	
		--七日战力
		if SevenDay then
			SevenDay.GetFightValueConfig(player)
		end
	end,
	function(player)
		--阵法
		if SeatSystem then
			SeatSystem.on_player_login(player)
		end

		--羽翼
		if WingSystem then
			WingSystem.SetWingTable(player)
		end
		
		--战力大比拼
		if IntegralPK then
			IntegralPK.GetData(player)
		end
		
		--秘境副本信息
		if DungeonSystem then
			DungeonSystem.GetInitializeData(player)
		end
	end,
	function(player)
		if FormGuild then
			FormGuild.OnLogin_FactionRedPoint(player)
		end
		
		if Act_RankList then
			Act_RankList.get_act_ranklist_when_player_login(player)
		end
		
		if SeasonPass then
			SeasonPass.Login(player)
		end
	
		--命魂数据
		if MingHun_SuitConfig then
			MingHun_SuitConfig.on_login(player)
		end
	end,
	function(player)
		if PetEquipIntensify then
			PetEquipIntensify.LoginGetData(player)
		end
	end,
	function(player)
		--灵宝
		if SpiritualEquip then
			SpiritualEquip.Login(player)
		end
	end,
	function(player)
		--七日
		if SevenDay then
			SevenDay.player_on_login(player)
		end
	
		--天河牧场
		if TianHeMuChang then
			TianHeMuChang.player_on_login(player)
		end
	end,
	function(player)
		--爬塔活动
		if IntegralTower then
			IntegralTower.OnLogin(player)
		end
	end,
	function(player)
		-- PK值
		if FormPkRule then
			FormPkRule.getIsFastPk(player)
		end
	end,
	function(player)
		-- 面对面交易
		if FaceDeal then
			FaceDeal.OnLogin(player)
		end
	end,
	function(player)
		-- 聊天频道ROLL点
		if ChatRoll then
			ChatRoll.OnLogin(player)
		end
	end,
	function(player)
		-- 自动切换技能方案
		if AutomaticCasting then
			AutomaticCasting.OnLogin(player)
		end
	end,
	function(player)
		-- 仓库分类
		if WarehouseClassify then
			WarehouseClassify.OnLogin(player)
		end
		--包裹分类
		if BagClassify then
			BagClassify.OnLogin(player)
		end
	end,
	function(player)
		--聊天频道黑名单
		if FormContact then
			FormContact.OnLogin(player)
		end
	end,
	function(player)
		--坐骑
		if MountsSystem then
			MountsSystem.Login(player)
		end
		--帮派密谋
		if GuildConspire then
			GuildConspire.OnLogin(player)
		end
	end,
	function(player)
		--商城免单
		if MallFree then
			MallFree.OnLogin(player)
		end
	end,
	function(player)
		--跨服战断线重连
		if Act_CrossServer then
			Act_CrossServer.OnLogin(player)
		end
		--摆摊
		if Stall then
			Stall.OnLogin(player)
		end
		--装备洗灵
		if EquipSoulReforge then
			EquipSoulReforge.OnLogin(player)
		end
		--弹客户端更新
		if ClientUpdate then
			ClientUpdate.OnLogin(player)
		end
	end,
	function(player)
		--装备强化
		if EquipIntensify then
			EquipIntensify.player_on_login(player)
		end
	end,
	function(player)
		--角色染色
		if PlayerColor then
			PlayerColor.Login(player)
		end
	end,
	function(player)
		--宠物染色
		if PetColor then
			PetColor.Login(player)
		end
	end,
	function(player)
		--注册讨伐活动连线特效
		if RegionTask then
			RegionTask.Login(player)
		end
	end,
}

function FormLogin.DoFunc(player, timer, index)
	FormLogin.Func[tonumber(index)](player)
end

--登录同步
function FormLogin.SyncSignState(player)
	if FunctionSwitch then
		FunctionSwitch.PlayerLoginData(player)
	end
	for k in ipairs(FormLogin.Func) do
		sLuaTimerSystem:AddTimerEx(player, 10,1,"FormLogin.DoFunc", ""..k)
	end

	--if DiscountSystem then
	--	DiscountSystem.on_login(player)
	--end

	--if FlyUp then
	--	FlyUp.GetData(player)
	--end

	return ""
end