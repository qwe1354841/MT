--飞升脚本（大话）
FlyUp = {}

FlyUp.Desc = [[
	飞升需要达到3转180级；
	飞升后等级回到140级，等级上限开放至200级；
	飞升后开放飞升特效；
	飞升后属性点重置，赠送40点属性点作为奖励。
]]

FlyUp.Config = {
	['NPCID'] = 20092,
	['FlyUpEffect'] = {
		[1] = '3000001447',
	},
	['FlyUp'] = {
		['FlyUpTo1'] = {
			['ToLevel'] = 140,
			['AddRemainPoint'] = 40,
		},
	},
	['FlyUpLevel_Config'] = {
		['Race1'] = {
			['FlyUp0'] = {
				['FlyUp'] = 0,
				['Level'] = 180,
				['Reincarnation'] = 3,
			},
			['FlyUp1'] = {
				['FlyUp'] = 1,
				['Level'] = 200,
				['Reincarnation'] = 3,
			},
		},
		['Race2'] = {
			['FlyUp0'] = {
				['FlyUp'] = 0,
				['Level'] = 180,
				['Reincarnation'] = 3,
			},
			['FlyUp1'] = {
				['FlyUp'] = 1,
				['Level'] = 200,
				['Reincarnation'] = 3,
			},
		},
		['Race3'] = {
			['FlyUp0'] = {
				['FlyUp'] = 0,
				['Level'] = 180,
				['Reincarnation'] = 3,
			},
			['FlyUp1'] = {
				['FlyUp'] = 1,
				['Level'] = 200,
				['Reincarnation'] = 3,
			},
		},
		['Race4'] = {
			['FlyUp0'] = {
				['FlyUp'] = 0,
				['Level'] = 180,
				['Reincarnation'] = 3,
			},
			['FlyUp1'] = {
				['FlyUp'] = 1,
				['Level'] = 200,
				['Reincarnation'] = 3,
			},
		},
		['Race5'] = {
			['FlyUp0'] = {
				['FlyUp'] = 0,
				['Level'] = 180,
				['Reincarnation'] = 3,
			},
			['FlyUp1'] = {
				['FlyUp'] = 1,
				['Level'] = 200,
				['Reincarnation'] = 3,
			},
		},
	},
}

function FlyUp.Initialization()
	local race_tb = RaceConfig.GetTableData()
	for k,v in pairs(race_tb) do
		if FlyUp.Config['FlyUpLevel_Config']['Race'..(v.Id)] then
			for a,b in pairs(FlyUp.Config['FlyUpLevel_Config']['Race'..(v.Id)]) do
				if b['FlyUp'] ~= nil then
					if a == "FlyUp"..b['FlyUp'] then
						if b['Reincarnation'] ~= nil and b['Level'] ~= nil then
							sLuaConfigSystem:SetFlyUpConfig(v.Id,b['FlyUp'],b['Reincarnation'],b['Level'])
						else
							sLuaApp:LuaErr("FlyUp.Initialization is err , Race = "..v.Id)
						end
					else
						sLuaApp:LuaErr("FlyUp.Initialization is err , "..a.." ~= Race"..v.Id)
					end
				else
					sLuaApp:LuaErr("FlyUp.Initialization is err , b['FlyUp'] is nil ,a = "..a)
				end
			end
		end
	end
end

function FlyUp.main(player)
	local player_flylevel = player:GetAttr(ROLE_ATTR_FLY_UP)
	local player_nextflylevel = player_flylevel+1
	local player_race = player:GetAttr(ROLE_ATTR_RACE)
	if not FlyUp.Config['FlyUpLevel_Config'] then
		sLuaApp:NotifyTipsMsg(player, "配置错误，FlyUpLevel_Config不存在")
		return
	end
	if not FlyUp.Config['FlyUpLevel_Config']['Race'..player_race] then
		sLuaApp:NotifyTipsMsg(player, "配置错误，FlyUpLevel_Config.RACE"..player_race.."不存在")
		return
	end
	if not FlyUp.Config['FlyUpLevel_Config']['Race'..player_race]['FlyUp'..player_flylevel]then
		sLuaApp:NotifyTipsMsg(player, "配置错误，当前飞升等级"..player_flylevel.."的配置不存在")
		return
	end
	if not FlyUp.Config['FlyUpLevel_Config']['Race'..player_race]['FlyUp'..player_nextflylevel] then
		sLuaApp:NotifyTipsMsg(player, "您已达到飞升等级上限，无法飞升")
		return
	end
	local tb = FlyUp.Config['FlyUpLevel_Config']['Race'..player_race]['FlyUp'..player_flylevel]
	if tb['Level'] == nil or tb['Reincarnation'] == nil then
		sLuaApp:NotifyTipsMsg(player, "配置错误，当前飞升等级"..player_flylevel.."的配置子项不存在")
		return
	end
	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	local player_reincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
	
	if player_reincarnation ~= tb['Reincarnation'] then 
		if player_reincarnation > tb['Reincarnation'] then
			sLuaApp:NotifyTipsMsg(player, "玩家转生等级大于配置转生等级，玩家转生等级.."..player_reincarnation.."，配置转生等级"..tb['Reincarnation'])
			sLuaApp:LuaErr("飞升失败，玩家转生等级大于配置等级，玩家转生等级.."..player_reincarnation.."，配置转生等级"..tb['Reincarnation'])
			return
		else
			sLuaApp:NotifyTipsMsg(player, "下一次飞升需要"..tb['Level'].."级"..tb['Reincarnation'].."转，您不满足飞升条件，请加油哦！")
			return
		end
	end
	if player_level ~= tb['Level'] then 
		if player_level > tb['Level'] then
			sLuaApp:NotifyTipsMsg(player, "玩家等级大于配置等级，玩家等级.."..player_level.."，配置等级"..tb['Level'])
			sLuaApp:LuaErr("飞升失败，玩家等级大于配置等级，玩家等级.."..player_level.."，配置等级"..tb['Level'])
			return
		else
			sLuaApp:NotifyTipsMsg(player, "下一次飞升需要"..tb['Level'].."级"..tb['Reincarnation'].."转，您不满足飞升条件，请加油哦！")
			return
		end
	end
	if not FlyUp.Config['FlyUp'] then
		sLuaApp:NotifyTipsMsg(player, "配置错误，['FlyUp']不存在")
		return
	end
	if not FlyUp.Config['FlyUp']['FlyUpTo'..player_nextflylevel] then
		sLuaApp:NotifyTipsMsg(player, "配置错误，['FlyUpTo"..player_nextflylevel.."']不存在")
		return
	end
	local tb_1 = FlyUp.Config['FlyUp']['FlyUpTo'..player_nextflylevel]
	if tb_1['ToLevel'] == nil or tb_1['AddRemainPoint'] == nil then
		sLuaApp:NotifyTipsMsg(player, "配置错误，['FlyUpTo"..player_nextflylevel.."']子项不存在")
		return
	end
	if player:FlyUp(tb_1['ToLevel']) then
		local add_point = tb_1['AddRemainPoint']
		if player_reincarnation > 0 then
			if not Reincarnation.Config['Reincarnation_'..player_reincarnation] then
				sLuaApp:NotifyTipsMsg(player, "转生配置错误，转生"..player_reincarnation)
				return
			end
			if not Reincarnation.Config['Reincarnation_'..player_reincarnation]['AddRemainPoint'] then
				sLuaApp:NotifyTipsMsg(player, "转生配置错误，转生"..player_reincarnation.."子项额外增加点数不存在")
				return
			end
			add_point = Reincarnation.Config['Reincarnation_'..player_reincarnation]['AddRemainPoint'] + add_point
		end
		
		if not player:AddRemainPoint(add_point) then
			sLuaApp:NotifyTipsMsg(player, "飞升失败")
			sLuaApp:LuaErr("增加潜力点失败，玩家guid = "..player:GetGUID())
			return
		end
		sLuaApp:NotifyTipsMsg(player, "恭喜您，飞升成功！")
	else
		sLuaApp:NotifyTipsMsg(player, "飞升失败")
		sLuaApp:LuaErr("玩家飞升失败，玩家guid = "..player:GetGUID())
		return
	end
end

function FlyUp.GetData(player)
		local tb = {}
		tb['NPCID'] = FlyUp.Config['NPCID']
		tb['FlyUpLevel_Config'] = FlyUp.Config['FlyUpLevel_Config']
		tb['FlyUpEffect'] = FlyUp.Config['FlyUpEffect']
		local str = [[
			MainDynamicUI.FlyUpServerData(]]..Lua_tools.serialize(tb)..[[)
		]]
		sLuaApp:ShowForm(player,"脚本表单", str)	
end