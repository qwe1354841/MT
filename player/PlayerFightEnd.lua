--装备相关表单

PlayerFightEnd = {}


function PlayerFightEnd.Main(player,types,is_win,custom,group_id,enemy_dieds,enemy_died_evils)
	--暗雷时custom为怪物组id，任务战斗时custom为任务id
	--types = 0 无类别		
	--types = 1 一般PVE
	--types = 2 一般PVP
	--types = 3 切磋（PVP）
	--types = 4 PK
	--types = 5 暗雷战斗
	--types = 6 明雷战斗
	--types = 7 任务战斗
	--types = 8 天梯
	--types = 9 自定义PVP

	-- group_id	1:玩家为相对发起者的友方 2:玩家为相对发起者的敌方
	-- enemy_dieds 敌方死亡玩家人数,仅pvp战斗中有效
	-- enemy_died_evils 敌方死亡玩家中pk小于0的人数,仅pvp战斗中有效

	sLuaApp:LuaDbg("PlayerFightEnd")

	if types == 9 then
		if tonumber(custom) == TianXiaHuiWu.FightTag then
			TianXiaHuiWu.FightCallBack(player, is_win)
		end
		if tonumber(custom) == TianXiaDiYiConfig.FightTag then
			TianXiaDiYi.FightCallBack(player, is_win)
		end
		if tonumber(custom) == Act_BangZhan.FightTag then
			Act_BangZhan.FightCallBack(player, is_win)
		end
		if tonumber(custom) == Act_WuDaoHui.FightTag then
			Act_WuDaoHui.FightCallBack(player,is_win)
		end
		if tonumber(custom) == FightTagClassify.Act_CrossServer then
			Act_CrossServer.PVPFightEnd(player,is_win)
		end
		if Data['ACTIVITY_GuildBattle_PVPTag'] then
			if Data['ACTIVITY_GuildBattle_PVPTag']['Tag_'..custom] == 1 then
				GuildBattle.PVPAttackOver(player, is_win)
			end
		end
		-- 任意 对 善方 10009
		if tonumber(custom) == PkRule_GoodAndEvil.FightGoodTag then
			-- 当是发起方敌方时，为其添加最后的PK时间记录，防止恶意PK
			if group_id == 2 then
				local cur_time = sLuaApp:SecondSinceEpoch(0)
				player:SetInt('PkRule_GoodAndEvil_last_pk_time',cur_time)
			end
			PkRule_GoodAndEvil.OnTargetGoodTag(player, is_win,enemy_dieds,enemy_died_evils,group_id)
		end
		-- 善 对 恶 10010
		if tonumber(custom) == PkRule_GoodAndEvil.FightEvilTag then
			-- 当是发起方敌方时，为其添加最后的PK时间记录，防止恶意PK
			if group_id == 2 then
				local cur_time = sLuaApp:SecondSinceEpoch(0)
				player:SetInt('PkRule_GoodAndEvil_last_pk_time',cur_time)
			end
			PkRule_GoodAndEvil.OnTargetEvilTag(player, is_win,enemy_dieds,enemy_died_evils,group_id)
		end
		-- 恶 对 恶 10011
		if tonumber(custom) == PkRule_GoodAndEvil.FightTag then
			-- 当是发起方敌方时，为其添加最后的PK时间记录，防止恶意PK
			if group_id == 2 then
				local cur_time = sLuaApp:SecondSinceEpoch(0)
				player:SetInt('PkRule_GoodAndEvil_last_pk_time',cur_time)
			end
			PkRule_GoodAndEvil.OnTargetTag(player, is_win)
		end
		--鸡王争霸
		if tonumber(custom) == Act_Chikings.FightTag then
			Act_Chikings.FightCallBack(player, is_win)
		end
		--积分爬塔
		if tonumber(custom) == IntegralTower.FightTag then
			IntegralTower.PVPFightEnd(player,is_win)
		end
		--帮派密谋
		if tonumber(custom) == FightTagClassify["GuildConspire"]  then
			GuildConspire.PVPFightEnd(player,is_win)
		end
	elseif types == 2 then
		PlayerFightEnd.DuelEnd(player,types,is_win,custom)
	elseif types == 5 then
		if is_win == 1 then
			PlayerFightEnd.FightLose(player, custom)
		end
	end
	if RepairSystem then
		--sLuaApp:LuaDbg("战斗结束扣除装备耐久")
		RepairSystem.SubEquipDurable(player)
	end
	if PetEquipRepair then
		PetEquipRepair.TakeOffLineupDurable(player, 1, 1)
	end
	if MountsSystem then
		MountsSystem.FightEnd(player,is_win)
	end

	--大月卡任务
	if is_win == 2 then
		if SeasonPassQuestFunc then
			SeasonPassQuestFunc.UpdateQuestProgress(player, 11)
			SeasonPassQuestFunc.UpdateQuestProgress(player, 57)
		end
	end
	--测试内容，将玩家和宠物的血量蓝量补满
	PlayerFightEnd.Ceshi(player,types,is_win,custom)

	if PetSystem then
		sLuaTimerSystem:AddTimerEx(player, 100 ,1,"PetSystem.FightEndRecalcAttr", "")
		-- PetSystem.FightEndRecalcAttr(player)
	end

	if Guard then
		sLuaTimerSystem:AddTimerEx(player, 100 ,1,"Guard.FightEndRecalcAttr", "")
		--Guard.FightEndRecalcAttr(player)
	end
	if ActivityGambleConfig then
		if custom == ActivityGambleConfig.FightTag then
			if ActivityGamble then
				ActivityGamble.FightCallBack(player,is_win)
			end
		end
	end

	if PetLineup then
		PetLineup.ClearSummonNum(player)
	end
end

function PlayerFightEnd.DuelEnd(player,types,victory,custom)
	local d_value = player:GetDayInt("duel_value")
	if d_value >= DuelConfig.DayLimit then
		if victory == 2 then
			sLuaApp:NotifyTipsMsgEx(player, "恭喜你战胜了其他玩家.")
		else
			sLuaApp:NotifyTipsMsgEx(player, "很遗憾,你惜败给其他玩家.")
		end
		return 
	end
	
	local value = victory and DuelConfig.Victory or DuelConfig.Defeat
	if d_value + value > DuelConfig.DayLimit then
		value = d_value + value - DuelConfig.DayLimit
	end
	
	player:SetDayInt("duel_value", d_value + value)
	player:AddDuel(value, "切蹉表单", "切蹉战斗结算", "切蹉战斗中"..(victory and "胜利" or "失败"))
	
	local datarow = AttrConfig.GetById(ROLE_ATTR_DUEL)
	if value > 0 then
		if victory == 2 then
			sLuaApp:NotifyTipsMsgEx(player, "恭喜你战胜了其他玩家,得到了"..value..datarow.ChinaName..".")
		else
			sLuaApp:NotifyTipsMsgEx(player, "很遗憾你败给了其他玩家,补偿"..value..datarow.ChinaName..".")
		end
	end
end

function PlayerFightEnd.Ceshi(player,types,is_win,custom)
	if player:GetType() == GUID_ROBOT then
		--sLuaApp:LuaDbg(" 机器人 " .. player:GetName() .. " 补全生命值")
		player:AddHp(player:GetAttr(ROLE_ATTR_HP_LIMIT),"机器人战斗结束", "TeamHost", "System")
		player:AddMp(player:GetAttr(ROLE_ATTR_MP_LIMIT),"机器人战斗结束", "TeamHost", "System")
		local pet = sPetSystem:GetMainPet(player)
		if pet then
			--sLuaApp:LuaDbg(" 机器人宠物 " .. pet:GetName() .. " 补全生命值")
			pet:AddHp(pet:GetAttr(ROLE_ATTR_HP_LIMIT),"机器人战斗结束", "TeamHost", "System")
			pet:AddMp(pet:GetAttr(ROLE_ATTR_MP_LIMIT),"机器人战斗结束", "TeamHost", "System")
			if pet:GetPetLoyalty() < 50 then
				pet:AddPetLoyalty(100)
			end
		end
		--sLuaApp:LuaDbg("机器人恢复血蓝成功！")
	end
end

function PlayerFightEnd.FightLose(player, monster_gid)
	monster_gid = tonumber(monster_gid)
	if monster_gid then
		local GroupData = MonsterGenConfig.GetById(monster_gid)
		if GroupData then
			PlayerFightEnd.combatPunishment(player,GroupData.Punish)
		end
	end
end

-- 战斗惩罚
function PlayerFightEnd.combatPunishment(player,punishId)
	if player == nil or punishId == nil then
		return
	end

	-- 战斗失败UI
	sLuaApp:ShowForm(player,"脚本表单","GUI.OpenWnd('FightResultUI')")
	-- 获取战斗惩罚表
	local punishTable = FightPunishConfig.GetById(punishId)
	if punishTable == nil then
		sLuaApp:LuaWrn("PlayerFightEnd.combatPunishment 无法通过惩罚id读取到战斗惩罚表 惩罚id："..punishId)
		return	
	end
	
	if punishTable.Exp == 0 and punishTable.GoldBind == 0 and punishTable.Gold == 0 and punishTable.Durable == 0 and punishTable.Jump == 0 and punishTable.Buff == 0 then
		sLuaApp:LuaDbg("死亡ID ".. punishId .." 没有配置任何惩罚。")
		return
	end

	-- 判断生效等级
	if player:GetAttr(ROLE_ATTR_LEVEL) >= punishTable.Level then

		-- 判断背包内是否有傀儡娃娃,如果有就只消耗傀儡娃娃
		local dummyList = {31020,31021}
		-- 31020 高级傀儡娃娃
		-- 31021 傀儡娃娃
		local isUsed = false
		for i=1,#dummyList do
			if sItemSystem:GetItemAmount(player,dummyList[i],3) > 0 then
				-- 消耗一个
				if not sItemSystem:ConsumeItemWithId(player,dummyList[i],1,3,"system","战斗失败消耗傀儡娃娃","战斗失败消耗傀儡娃娃") then
					sLuaApp:LuaDbg("战斗失败，消耗傀儡娃娃失败")
				else
					if dummyList[i] == 31020 then
						sLuaApp:NotifyTipsMsg(player,"消耗一个高级傀儡娃娃")
					end
					if dummyList[i] == 31021 then
						sLuaApp:NotifyTipsMsg(player,"消耗一个傀儡娃娃")

						-- 死亡后是否传送
						if punishTable.Jump == 1 then
							if punishTable.Map and punishTable.X and punishTable.Y then
								local map = sMapSystem:GetMapById(punishTable.Map)
								local range = 5  -- 随机范围
								sMapSystem:Jump(player,map,punishTable.X,punishTable.Y,range)
							end
						end

					end
					isUsed = true
					break
				end
			end
		end

		-- 如果消耗了傀儡娃娃，则不执行下面的战斗惩罚
		if isUsed then
			return
		end

		-- 根据善恶值加上惩罚系数
		local pkValue = player:GetPk()
		local multiple = 1
		if pkValue < 0 then
			multiple = math.min(-(player:GetPk())*0.005 + 1,3)
		else
			multiple = 1
		end

		-- 损失经验值
		if punishTable.Exp and punishTable.Exp > 0 then
			local currentExp = player:GetAttr(ROLE_ATTR_EXP) -- 获取当前经验值
			local nextLevelExp = player:GetAttr(ROLE_ATTR_EXP_LIMIT) -- 升到下一级所需要的经验
			local exp = math.ceil((punishTable.Exp / 10000 ) * nextLevelExp * multiple)  -- 万分比
			-- 如果所扣除的经验大于当前经验 将经验置为0
			if exp > currentExp then
				if currentExp > 0 then
					if not player:SubExp(currentExp,"system","PK战斗失败惩罚","PK战斗失败惩罚所需减少经验不足，减少到0") then
						sLuaApp:LuaDbg("PK战斗失败时扣除经验失败")
					end
				end
			elseif exp > 0 then

				if not player:SubExp(exp,"system","PK战斗失败惩罚","PK战斗失败惩罚减少经验值") then
					sLuaApp:LuaDbg("PK战斗失败时扣除经验失败")
				else
					sLuaApp:NotifyTipsMsg(player,"您损失了经验"..exp)
				end
			end
		end

		-- 损失银币
		if punishTable.GoldBind and punishTable.GoldBind > 0 then
			local currentGoldBind = player:GetAttr(ROLE_ATTR_BIND_GOLD) -- 当前所拥有的银币
			local goldBind = math.ceil((punishTable.GoldBind / 10000) * currentGoldBind * multiple)
			if goldBind > 0 then
				if not player:SubBindGold(goldBind,"system","PK战斗失败惩罚","PK战斗失败惩罚减少银币") then
					sLuaApp:LuaDbg("PK战斗失败时扣除银币失败")
				else
					sLuaApp:NotifyTipsMsg(player,"您损失了银币"..goldBind)
				end
			end
		end

		-- 损失金币
		if punishTable.Gold and punishTable.Gold > 0 then
			local currentGold = player:GetAttr(ROLE_ATTR_GOLD) -- 当前所拥有的金币
			local gold = math.ceil((punishTable.Gold / 10000) * currentGold * multiple)
			if gold > 0 then
				if not player:SubGold(gold,"PK战斗失败惩罚","PK战斗失败惩罚减少金币") then
					sLuaApp:LuaDbg("PK战斗失败时扣除金币失败")
				else
					sLuaApp:NotifyTipsMsg(player,"您损失了金币"..gold)
				end
			end
		end

		-- 损失装备耐久
		if punishTable.Durable and punishTable.Durable > 0 then
			local Durable = math.ceil(tonumber( punishTable.Durable) * multiple)
			if Durable and Durable > 0 and RepairSystem then
				-- fight_type 0=PVE,1=PVP
				if RepairSystem.SubEquipDurable_ByProportion(player,Durable,1) then
					sLuaApp:NotifyTipsMsg(player,"您损失了".. Durable/100 .."%的装备耐久度")
				else
					sLuaApp:LuaDbg("Pk战斗失败时，损失装备耐久度失败")
				end
				if PetEquipRepair then
					PetEquipRepair.TakeOffLineupDurable(player, 2, Durable)
				end
			end
		end

		-- 死亡后是否传送
		if punishTable.Jump == 1 then
			if punishTable.Map and punishTable.X and punishTable.Y then
				local map = sMapSystem:GetMapById(punishTable.Map)
				local range = 5  -- 随机范围
				sMapSystem:Jump(player,map,punishTable.X,punishTable.Y,range)
			end
		end

		-- 添加buffer
		if punishTable.Buff ~= 0 then
			local container = player:GetBuffContainer() -- 获取玩家buff容器
			container:CreateBuff(punishTable.Buff)
		end

	end
end





