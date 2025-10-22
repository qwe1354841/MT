--组队机器人功能
TeamHost = {}

--得到玩家队伍中假人的数量
function TeamHost.GetTeamHostNum(player)
	local DummyNum=0
	local playerList = player:GetTeam():GetTeamMembers(false)
	for k,v in ipairs(playerList) do
		if v:GetType() == GUID_ROBOT then
			DummyNum=DummyNum+1
		end
	end
	return DummyNum
end

--创建机器人
function TeamHost.HostCreate(player)
	sLuaApp:LuaDbg("创建机器人逻辑！")
	local MapKey = player:GetMapKeyName()
	local map = player:GetMap()
	
	local minLevel = Lua_tools.GetTeamLowestlevel(player)
	
	local team = player:GetTeam()
	
	if not team then
		sLuaApp:LuaDbg("TeamHost 玩家没有组队")
		return false
	end
	
	if team:GetTeamLeader() ~= player then
		sLuaApp:LuaDbg("只有队长才能招募机器人")
		return false
	end
	
	if TeamHost.SheildMaps then
		if TeamHost.SheildMaps[MapKey] then
			return false
		end
	end

	if not player:GetTeam() then
		sLuaApp:LuaDbg("玩家没有组队不能招募机器人")
		return false
	end
	
	--if not lualib:CanOperateTeam(playerguid,true) then
	--	sLuaApp:LuaDbg("暂时不能和其他玩家组队")
	--	return false
	--end
	
	local flag = FunctionSwitch.AllFuncitonConfig.TeamHost
	if flag=="on" then
		--sLuaApp:LuaDbg("机器人功能开了----")
	else
		sLuaApp:LuaDbg("机器人功能未打开----")
		return false
	end
	
	
	--sLuaApp:LuaDbg("param----"..param)
	minLevel = tonumber(minLevel)
	--sLuaApp:LuaDbg("player----"..player)
	local dummynum= TeamHost.GetTeamHostNum(player)
	local teamnumber= team:GetTeamMemberCount()
	if dummynum>=TeamHostConfig.MaxNum then
		sLuaApp:LuaDbg("添加机器人失败，人数已满")
		return false
	end
	if teamnumber>=5 then
		return false
	end
	
	--设置机器人等级
	local playerein = player:GetAttr(ROLE_ATTR_REINCARNATION) -- 玩家转生
	local playerlevel = player:GetAttr(ROLE_ATTR_LEVEL)	-- 玩家等级
	local serverrein = ServerLevel.get_serverlv_now().server_rei -- 获取服务器转生
	local severlevel = ServerLevel.get_serverlv_now().server_lv -- 获取服务器等级
	sLuaApp:LuaDbg("playerlevel---"..playerlevel)
	sLuaApp:LuaDbg("severlevel---"..severlevel)
	sLuaApp:LuaDbg("minLevel---"..minLevel)
	local randlevel=minLevel
	--	if playerlevel>=severlevel then        --如果玩家等级超过服务器等级  机器人等级范围为 服务器等级-5以内
	--		if minLevel<=severlevel-5 then
	--			randlevel = sLuaApp:RandInteger(severlevel-5,severlevel)
	--		elseif minLevel>severlevel-5 and minLevel<severlevel then
	--			randlevel = sLuaApp:RandInteger(minLevel,severlevel)
	--		else
	--			randlevel = severlevel
	--		end
	--	else
	--		if minLevel<=playerlevel-5 then
	--			randlevel = sLuaApp:RandInteger(playerlevel-5,playerlevel+5)  --如果玩家等级未超过服务器等级  机器人等级范围为 玩家等级+-5
	--		else
	--			randlevel = sLuaApp:RandInteger(minLevel,playerlevel+5)
	--		end
	--	end
	--	if randlevel>=severlevel and playerlevel <= severlevel then
	--		randlevel=severlevel
	--	end
	--	sLuaApp:LuaDbg("当前地图最低等级---"..lualib:Map_GetLevelMin(currmap))
	--	sLuaApp:LuaDbg("当前地图最高等级---"..lualib:Map_GetLevelMax(currmap))
	--	sLuaApp:LuaDbg("当前地图类型---"..lualib:Map_Type(currmap))
	--	--if lualib:Map_Type(currmap)==mapleveltype then
	--	--	if  randlevel<lualib:Map_GetLevelMin(currmap) then
	--	--		randlevel=lualib:Map_GetLevelMin(currmap)
	--	--	end
	--	--	if  randlevel>lualib:Map_GetLevelMax(currmap) then
	--	--		randlevel=lualib:Map_GetLevelMax(currmap)
	--	--	end
	--	--end
	--	if randlevel<minLevel then
	--		randlevel=minLevel
	--	end
	
	
	local jobrandom = TeamHostConfig.Jobs[sLuaApp:RandInteger(1,#TeamHostConfig.Jobs)]  --随机一个职业
	local posX = sMapSystem:GetPosX(player)
	local posY = sMapSystem:GetPosY(player)
	local host = sRobotSystem:CreateRobot(jobrandom, randlevel, playerein, map, sLuaApp:RandInteger( posX-5, posX + 5), sLuaApp:RandInteger( posY-5, posY + 5))
	if not sTeamSystem:AddTeamMember(team, host) then
		sLuaApp:LuaDbg("机器人组队失败")
		sRobotSystem:DestroyRobot(host)
		return
	end


	--设置机器人装备系数
	--local EquipCoefflag = lualib:SetDummyEquipCoef(Dummyguid,EquipCoefConfig)
	--if not EquipCoefflag then
	--	sLuaApp:LuaDbg("设置机器人装备系数失败")
	--	return false
	--end
	--设置假人的战斗属性增益系数
	local levelrange = 0
	--if Dummylevel>=1 and Dummylevel<=49 then
	--	levelrange=1
	--elseif Dummylevel>=50 and Dummylevel<=79 then
	--	levelrange=2
	--elseif Dummylevel>=80 and Dummylevel<=120 then
	--	levelrange=3
	--end
	--local attconfig = DummyAttConfig["level_"..tostring(levelrange)] or DummyAttConfig["Error"]
	--for k,v in pairs(attconfig) do
	--	local setflag = lualib:SetDummyFightAttrCoef(Dummyguid,k,v[1],v[2])
	--	if not setflag then
	--		sLuaApp:LuaDbg("设置假人的战斗属性增益系数失败,k="..tostring(k)..",参数1="..tostring(v[1])..",参数2="..tostring(v[2]))
	--		return false
	--	end
	--end
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

	--设置修炼等级
	--[[
	if Dummylevel>=40 then
		local Practiceflag = setpractice(Dummyguid)
		if Practiceflag then
			--sLuaApp:LuaDbg("机器人修炼设置成功")
		else
			sLuaApp:LuaDbg("机器人修炼设置失败")
		end
	else
		sLuaApp:LuaDbg("机器人等级低于40，不设置修炼")
	end
	]]
	--激活天赋技能
	--[[
	local TalentSkillflag = settalentskill(Dummyguid)
	if TalentSkillflag then
		--sLuaApp:LuaDbg("机器人天赋设置成功")
	else
		sLuaApp:LuaDbg("机器人天赋设置失败")
	end
	]]
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
	
	host:SetInt("IAmTeamHost",1)

	return ""
end

function TeamHost.AddEquip(host)
	local level = host:GetAttr(ROLE_ATTR_LEVEL)
	local ArmorLevel = 0
	if TeamHostConfig.Equips then
		local newLevel = 0
		for k,v in pairs(TeamHostConfig.Equips) do
			newLevel = 0
			newlevel = tonumber(string.sub(k,7,-1))
			if newlevel then
				if newLevel > ArmorLevel then
					if newLevel <= level then
						ArmorLevel = newLevel
					end
				end
			end
		end
		sLuaApp:LuaDbg("ArmorLevel = " .. (ArmorLevel or 'nil'))
		if ArmorLevel then
			for a,b in pairs(TeamHostConfig.Equips['level_'..ArmorLevel]) do
				local RoleID = host:GetAttr(ROLE_ATTR_ROLE)
				sLuaApp:LuaDbg("RoleID = " .. RoleID)
				local equips = b['Role_'..RoleID]
				if not equips then
					equips = b['Sex_' .. host:GetAttr(ROLE_ATTR_GENDER)]
				end
				if equips then
					local equip_Key = equips[sLuaApp:RandInteger(1,#equips)]
					local equipData = ItemConfig.GetByKeyName(equip_Key)
					if equipData then
						local equip = sItemSystem:AddItemEx( host, equipData.Id, 1, true, "system", "发放机器人装备", "nil")[1]
						if equip then
							sLuaApp:LuaDbg("机器人"..host:GetName().." 穿戴装备 "..equip_Key)
							sItemSystem:PutOnEquip(host, equip)
							--强化
							if EquipIntensify then
								EquipIntensify.SetEquipIntensifyLevel(host, equip, sLuaApp:RandInteger(3,12))
							end
							--加宝石部分
							if b['Gem'] then	
								local itemTb = {}
								for i = 1,3 do
									local GemKey = sLuaApp:RandInteger(3,7).."级"..b['Gem'][sLuaApp:RandInteger(1,#b['Gem'])]
									local GemData = ItemConfig.GetByKeyName(GemKey)
									if GemData then
										table.insert(itemTb, sItemSystem:AddItemEx( host, GemData.Id, 1, true, "system", "发放机器人宝石", "nil")[1])
									end
								end
								for k,v in ipairs(itemTb) do
									if EquipGem then
										EquipGem.EmbedGem(host, equip:GetGUID(), k, v:GetGUID())
									end
								end
							end
						end
					else
						sLuaApp:LuaDbg("不存在道具 " .. equip_Key .. " ！")
					end
				end
			end
		end
		return true
	end
	return false
end

function TeamHost.AddPet(host)
	local level = host:GetAttr(ROLE_ATTR_LEVEL)
	local petLevel = 0
	if TeamHostConfig.Pets then
		local newLevel = 0
		for k,v in pairs(TeamHostConfig.Pets) do
			newLevel = 0
			newLevel = tonumber(string.sub(k,7,-1))
			--sLuaApp:LuaDbg('S    newLevel = ' .. newLevel .. "   petLevel = ".. petLevel .. "    level = ".. level .. "     k = " .. k .. "    string = " ..string.sub(k,7,-1) .. "   num = " .. tonumber(string.sub(k,7,-1)))
			if newLevel then
				if newLevel > petLevel then
					if newLevel <= level then
						petLevel = newLevel
					end
				end
			end
			--sLuaApp:LuaDbg('E    newLevel = ' .. newLevel .. "   petLevel = ".. petLevel .. "    level = ".. level)
		end
		if petLevel then
			--sLuaApp:LuaDbg('petLevel ====================== ' .. petLevel)
			local RandomPet = TeamHostConfig.Pets['level_'..petLevel][sLuaApp:RandInteger(1,#TeamHostConfig.Pets['level_'..petLevel])]
			local PetData = PetConfig.GetByKeyName(RandomPet)
			if PetData then
				local Pet = sPetSystem:AddPetEx(host, PetData.Id, level, true, "system", "组队机器人", "为组队机器人添加宠物【"..RandomPet.."】")
				sPetSystem:SetLineup(Pet,0)
				if Pet then
					local Dyes = TeamHostConfig.PetDyes[RandomPet]
					if Dyes then
						host:DyeingColor(Dyes[sLuaApp:RandInteger(1, #Dyes)], 0)
					end
				end
				return true
			end
		end
	end
	return false
end

function TeamHost.GetAppLevel(host)
	
end

function TeamHost.Dyeing(host)
	local DysConfig = TeamHostConfig.Dyes
	if DysConfig then
		if sLuaApp:RandInteger(1,100) > 75 then
			local RoleID = host:GetAttr(ROLE_ATTR_ROLE)
			local dyerandom = sLuaApp:RandInteger(1,8) --随机一种染色
			local color1 = TeamHostConfig.Dyes[RoleID][dyerandom][1]
			local color2 = TeamHostConfig.Dyes[RoleID][dyerandom][2]
			if not host:DyeingColor(color1, color2) then
				sLuaApp:Warn("机器人染色失败！")
			end
		end
	end
end	

function TeamHost.Initialization()
	TeamHost.MapSheild_Initialization()
end

function TeamHost.MapSheild_Initialization()
	if TeamHostConfig.SheildMaps then
		TeamHost.SheildMaps = {}
		for k,v in ipairs(TeamHostConfig.SheildMaps) do	
			TeamHost.SheildMaps[v] = 1
		end	
	end
end

function TeamHost.Addpoint(host, level, rein)
	return true
end

function TeamHost.on_leave_team(host)
	sRobotSystem:DestroyRobot(host)
end

function TeamHost.ApplyTeamer(player)
	local NowSec = sLuaApp:SecondSinceEpoch(0)
	local LastGetTime = player:GetInt('TeamHostSec')
	if NowSec - LastGetTime < 3 then
		sLuaApp:LuaWrn("玩家 " .. player:GetName() .. " 频繁访问ApplyTeamer")
		return
	end
	
	local team = player:GetTeam()
	if team == nil then
		sLuaApp:NotifyTipsMsg(player, "您不在队伍中，无法招募队友")
		return
	end
	
	if team:GetTeamLeader() ~= player then
		sLuaApp:NotifyTipsMsg(player, "您不是队长，无法招募队友")
	end
	
	local CanAdd = 5 - team:GetTeamMemberCount()
	if CanAdd > TeamHostConfig.MaxNum then
		CanAdd = TeamHostConfig.MaxNum
	end
	CanAdd = CanAdd - TeamHost.GetTeamHostNum(player)
	
	
	
	for i = 1,CanAdd do
		sLuaTimerSystem:AddTimerEx(player, i * 1000 + sLuaApp:RandInteger(1,999) ,1,"TeamHost.HostCreate", "")
	end
	player:SetInt("TeamHostSec", NowSec)
end