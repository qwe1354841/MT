--天下会武/天下第一创建玩家匹配的随机机器人
TianXiaDiYiCreatRobot = {}

--可随机到的侍从
TianXiaDiYiCreatRobot.Guards = {
	['level_0']={"春十三娘","地涌夫人","黄风怪"},
	['level_5']={"六耳猕猴","黑风怪","虎力大仙"},
	['level_15']={"白无常","黑无常","李靖"},
	['level_25']={"羊力大仙","金池长老","鹿力大仙"},
	['level_35']={"如意真仙","罗刹女","混世魔王"},
	['level_45']={"程咬金","猪八戒","罗刹女","如意真仙"},
	['level_55']={"白骨夫人","沙和尚","九尾狐狸","九灵元圣"},
	['level_65']={"孟婆","灵吉菩萨","唐僧","红孩儿"},
	['level_75']={"银角大王","灵感大王","水德真君","龙王"},
	['level_85']={"敖丙","牛魔王","杨戬","水德真君"},
	['level_95']={"太上老君","敖丙","龙王","杨戬"},
	['level_105']={"镇元子","哪吒","金角大王","药童子"},
	['level_115']={"孙悟空","金翅大鹏王","太乙天尊","太上老君"},
}

--创建基于玩家等级的随机机器人
function TianXiaDiYiCreatRobot.CreatRobot(player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local reincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local map = sMapSystem:GetMapById(1)
	local posX = sMapSystem:GetPosX(player)
	local posY = sMapSystem:GetPosY(player)
	--local tb = ServerLevel.get_serverlv_now()
	--local server_lv = tb['server_lv']
	local level_min = level-3
	local level_max = level+3
	if level_max > 120 then
		level_max = 120
	end
	local host = sRobotSystem:CreateRobot(sLuaApp:RandInteger(31,36), sLuaApp:RandInteger(level_min, level_max), reincarnation, map, sLuaApp:RandInteger( posX-5, posX + 5), sLuaApp:RandInteger( posY-5, posY + 5))
	
	local robot_guid = player:GetInt("TianXiaDiYi_Robote_Match_Timer")
	if sLuaTimerSystem:HasTimer(robot_guid) then
		sLuaTimerSystem:DisableTimer(robot_guid)
	end
	
	local robot_guid = player:GetInt("TianXiaHuiWu_Robote_Match_Timer")
	if sLuaTimerSystem:HasTimer(robot_guid) then
		sLuaTimerSystem:DisableTimer(robot_guid)
	end

	--设置假人宠物的战斗属性增益系数
	local BuffCon = host:GetBuffContainer()
	BuffCon:CreateBuff(51,0)
	BuffCon:CreateBuff(52,0)
	
	--机器人加点
	local SetPointflag = TeamHost.Addpoint(host,randlevel, playerein)
	if SetPointflag then
		--sLuaApp:LuaDbg("机器人加点成功")
	else
		sLuaApp:LuaDbg("机器人加点失败")
	end

	--假人先脱装备(初始身上就有装备)
	local itemCon = host:GetItemContainer(ITEM_CONTAINER_EQUIP)
	for i=0,10 do
		local equip = itemCon:GetItemBySite(i)
		if equip then
			sItemSystem:TakeOffEquip(host,equip)
		end
	end
	--角色染色
	TeamHost.Dyeing(host)
	--人物穿装备
	local addequipflag = TeamHost.AddEquip(host)
	if addequipflag then
		--sLuaApp:LuaDbg("人物穿装备成功")
	else
		sLuaApp:LuaDbg("人物穿装备失败")
	end
	--加宠物
	local PetFightflag = TeamHost.AddPet(host)
	if PetFightflag then
		--sLuaApp:LuaDbg("给机器人宠物出战成功")
	else
		sLuaApp:LuaDbg("给机器人宠物出战失败")
	end
	--加侍从
	local GuardFightflag = TianXiaDiYiCreatRobot.Addguard(host)
	if GuardFightflag then
		--sLuaApp:LuaDbg("给机器人侍从出战成功")
	else
		sLuaApp:LuaDbg("给机器人侍从出战失败")
	end
	
	return host
end

--给机器人添加侍从
function TianXiaDiYiCreatRobot.Addguard(host)
	local level = host:GetAttr(ROLE_ATTR_LEVEL)
	local guardsLevel = 0
	if TianXiaDiYiCreatRobot.Guards then
		local newLevel = 0
		for k,v in pairs(TianXiaDiYiCreatRobot.Guards) do
			newLevel = 0
			newLevel = tonumber(string.sub(k,7,-1))
			if newLevel then
				if newLevel > guardsLevel then
					if newLevel <= level then
						guardsLevel = newLevel
					end
				end
			end
		end
		--sLuaApp:LuaDbg("guardsLevel:"..guardsLevel)
		if guardsLevel then
			local TianXiaDiYi_Guards = TianXiaDiYiCreatRobot.Guards['level_'..guardsLevel]
			local random = sLuaApp:RandInteger(1, #TianXiaDiYi_Guards)
			local RandomGuard = TianXiaDiYi_Guards[random]
			--sLuaApp:LuaDbg("创建侍从:"..RandomGuard)
			local GuardData = GuardConfig.GetByKeyName(RandomGuard)
			if GuardData then
				local Guard = sGuardSystem:AddGuard(host, GuardData.Id, level, "system", "天下第一活动", "为机器人添加侍从【"..RandomGuard.."】")
				local LineupContainer = host:GetLineupContainer()
				--sLuaApp:LuaDbg("侍从上阵")
				if LineupContainer:PushLineup(0, Guard:GetGUID()) then
					return true
				end
			end
		end
	end
	return false
end
