--天赋
require("player/PlayerSkillSpellConfig")	 
PlayerSkillSpell = {}
PlayerSkillSpell.Config_By_Job = {}
PlayerSkillSpell.Item_For_Spell = {}
function PlayerSkillSpell.Initialization()
	for k,v in pairs(PlayerSkillSpellConfig.SpellConfig) do
		if not PlayerSkillSpell.Config_By_Job['Job_'..v['Job']] then
			PlayerSkillSpell.Config_By_Job['Job_'..v['Job']] = {}
		end
		if not PlayerSkillSpell.Config_By_Job['Job_'..v['Job']]['TalentGroup_'..v['TalentGroup']] then
			PlayerSkillSpell.Config_By_Job['Job_'..v['Job']]['TalentGroup_'..v['TalentGroup']] = {}
		end
		PlayerSkillSpell.Config_By_Job['Job_'..v['Job']]['TalentGroup_'..v['TalentGroup']]['TalentColumn_'..v['TalentColumn']] = v
		PlayerSkillSpell.Item_For_Spell[v['TalentItem']] = v['Id']
	end
end
function PlayerSkillSpell.On_Login(player)
	--检查
	PlayerSkillSpell.Check(player)
	--发数据
	local form = [[
		if UIDefine then
			if not UIDefine.PlayerSkillSpell then
				UIDefine.PlayerSkillSpell = {}
			end
			UIDefine.PlayerSkillSpell.Spell_Config = ]]..Lua_tools.serialize(PlayerSkillSpell.Config_By_Job)..[[
			UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
			UIDefine.PlayerSkillSpell.Edition = ']]..PlayerSkillSpellConfig.Edition..[['
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form)
end
function PlayerSkillSpell.Check(player)
	--如果没有版本号，相当于新号
	if player:GetString('PlayerSkillSpell_Edition') == "" then
		--初始化身上的天赋状态表
		PlayerSkillSpell.Initialization_Player_State_Config(player)
		--初始化身上天赋技能表
		PlayerSkillSpell.Initialization_Player_All_Skill_Config(player)
		--修改玩家身上的版本号
		player:SetString("PlayerSkillSpell_Edition",PlayerSkillSpellConfig.Edition)
		return 1
	--如果身上的天赋技能版本号和服务器的不一样
	elseif PlayerSkillSpellConfig.Edition ~= player:GetString('PlayerSkillSpell_Edition') then
		--删除原先身上通过天赋加的技能
		PlayerSkillSpell.Del_Skill_Spell_All(player)
		--重置玩家身上天赋状态
		PlayerSkillSpell.Reset_Player_State_Config(player)
		--修改玩家身上的版本号
		player:SetString("PlayerSkillSpell_Edition",PlayerSkillSpellConfig.Edition)
		return 2
	end
	return 0
end
function PlayerSkillSpell.Del_Skill_Spell_All(player)
	local all_skill = assert(load("return " .. player:GetString("PlayerSkillSpell_All_Skill")))()
	local skill_container = player:GetSkillContainer()
	local job = player:GetAttr(3)
	--删除和门派技能无关的技能
	if all_skill['Passive'] then
		for k,v in pairs(all_skill['Passive']) do
			local skillData = skill_container:GetSkill(k)
			if skillData then
				skill_container:DestroySkill(skillData, true)
				
				--日志
				sLogServerSystem:LogToServer(0,player,"天赋删除全部",tonumber(k),0,"天赋","删除所有和门派无关的技能")
				
			else
				sLuaApp:LuaWrn("PlayerSkillSpell.del_Skill_Spell_all is erro ,skillData is nil , player:"..player:GetName()..",skill_id:"..k)
			end
		end
	end
	--删除门派技能相关技能，同时还原最初始的门派技能
	if all_skill['Initiative'] then
		for k,v in pairs(all_skill['Initiative']) do
			if PlayerSkillSpellConfig.SkillGroupConfig[k] then
				local skill_id = 0
				local str = ""
				table.sort(v)
				for i = 1 ,#v do
					str = str..v[i]
				end
				if PlayerSkillSpellConfig.SkillGroupConfig[k][str] then
					skill_id = PlayerSkillSpellConfig.SkillGroupConfig[k][str]				
				end
				local skillData = skill_container:GetSkill(skill_id)				
				local skill_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..PlayerSkill.JobHeartMethod["Job_"..job][PlayerSkillSpellConfig.SkillGroupConfig[k]['heart_method_index']])
				if skillData then
					skill_level = skillData:GetPerformance()
					skill_container:DestroySkill(skillData, true)
					
					--日志
					sLogServerSystem:LogToServer(0,player,"天赋删除全部",skill_id,0,"天赋","删除所有和门派相关的技能")
					
				else
					sLuaApp:LuaWrn("PlayerSkillSpell.del_Skill_Spell_all is erro ,skillData is nil , player:"..player:GetName()..",skill_id:"..skill_id)
				end
				local new_skill = skill_container:CreateSkill(PlayerSkillSpellConfig.SkillGroupConfig[k]['0'], skill_level, skill_level, true)
				if not new_skill then
					sLuaApp:LuaWrn("PlayerSkillSpell.del_Skill_Spell_all is erro ,new_skill is nil , player:"..player:GetName()..",skill_id:"..PlayerSkillSpellConfig.SkillGroupConfig[k]['0'])
				else
					player:SetInt("PlayerSkill_Sect_"..PlayerSkillSpellConfig.SkillGroupConfig[k]['heart_method_index'].."_"..PlayerSkillSpellConfig.SkillGroupConfig[k]['skill_index'],PlayerSkillSpellConfig.SkillGroupConfig[k]['0'])
					
					--日志
					sLogServerSystem:LogToServer(0,player,"天赋删除全部",0,PlayerSkillSpellConfig.SkillGroupConfig[k]['0'],"天赋","根据删除的门派技能，添加对应的初始门派技能")
					
				end
			else
				sLuaApp:LuaWrn("PlayerSkillSpell.del_Skill_Spell_all is erro ,PlayerSkillSpellConfig.SkillGroupConfig."..k.." is nil , player:"..player:GetName())
			end
		end
	end
	PlayerSkillSpell.Initialization_Player_All_Skill_Config(player)
end
function PlayerSkillSpell.Reset_Player_State_Config(player)
	local tb = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
	for k,v in pairs(SchoolConfig.GetTableData())do
		for k1,v1 in pairs(tb['Job_'..v.Id])do
			tb['Job_'..v.Id][k1] = 1
		end
	end
	player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(tb))
	
	--日志
	sLogServerSystem:LogToServer(0,player,"玩家身上天赋变量",1,0,"天赋","重置天赋变成未装备状态"..Lua_tools.serialize(tb))
	
end
function PlayerSkillSpell.Initialization_Player_State_Config(player)
	local tb = {}
	for k,v in pairs(SchoolConfig.GetTableData())do
		tb['Job_'..v.Id] = {}
	end
	player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(tb))
end
function PlayerSkillSpell.Initialization_Player_All_Skill_Config(player)
	local all_skill = {}
	all_skill['Initiative'] = {}
	all_skill['Passive'] = {}
	player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
end
function PlayerSkillSpell.Check_When_Open_Wnd(player,edition)
	PlayerSkillSpell.Check(player)
	local form = ""
	if PlayerSkillSpellConfig.Edition == edition then
		--不用发数据
		form = [[
			if UIDefine then
				if not UIDefine.PlayerSkillSpell then
					UIDefine.PlayerSkillSpell = {}
				end
				UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
			end
			if RoleSkillUI then
				RoleSkillUI.RefreshServerData()
			end
		]]
	else
		--重新发数据
		form = [[
			if UIDefine then
				if not UIDefine.PlayerSkillSpell then
					UIDefine.PlayerSkillSpell = {}
				end
				UIDefine.PlayerSkillSpell.Spell_Config = ]]..Lua_tools.serialize(PlayerSkillSpell.Config_By_Job)..[[
				UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
				UIDefine.PlayerSkillSpell.Edition = ']]..PlayerSkillSpellConfig.Edition..[['
			end
			if RoleSkillUI then
				RoleSkillUI.RefreshServerData()
			end
		]]
	end
	sLuaApp:ShowForm(player, "脚本表单", form)
end
function PlayerSkillSpell.Use_Item(player,item)
	local check_id = PlayerSkillSpell.Check(player)
	local item_id = item:GetId()
	local item_keyname = item:GetKeyName()
	if not PlayerSkillSpell.Item_For_Spell[item_id] then
		sLuaApp:NotifyTipsMsg(player, "使用道具学天赋，ID不存在")
		return 0
	end
	local id = PlayerSkillSpell.Item_For_Spell[item_id]
	local job = player:GetAttr(3)
	if not PlayerSkillSpellConfig.SpellConfig['Id_'..id] then
		sLuaApp:NotifyTipsMsg(player, "请选择一个天赋")
		return 0
	end
	if job ~= PlayerSkillSpellConfig.SpellConfig['Id_'..id]['Job'] then
		sLuaApp:NotifyTipsMsg(player, "这不是当前门派的天赋")
		return 0
	end
	if player:GetAttr(2) < PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentLevel'] then
		sLuaApp:NotifyTipsMsg(player, "等级不足")
		return 0
	end
	local player_state = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
	if player_state['Job_'..job][id] then
		if player_state['Job_'..job][id] ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "你已经学习了该天赋")
			return 0
		end
	end
	--if not Lua_tools.SubItem(player,{item_keyname,1}, "PlayerSkillSpell.Activate_Or_Equip", ""..id, "") then
	--	sLuaApp:NotifyTipsMsg(player, "学习天赋出错，扣除道具失败")
	--	return 0
	--end
	--扣了道具先激活
	player_state['Job_'..job][id] = 1
	player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
	
	--日志
	sLogServerSystem:LogToServer(0,player,"玩家身上天赋变量",0,0,"天赋","玩家使用了道具书"..item_keyname.."激活天赋:"..Lua_tools.serialize(Lua_tools.serialize(player_state)))
	
	local all_skill = assert(load("return " .. player:GetString("PlayerSkillSpell_All_Skill")))()
	local skill_container = player:GetSkillContainer()	
	--先对同层其他天赋进行操作
	for k,v in pairs(PlayerSkillSpell.Config_By_Job['Job_'..job]['TalentGroup_'..PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentGroup']]) do
		if id ~= v['Id'] then
			if player_state['Job_'..job][v['Id']] then
				if player_state['Job_'..job][v['Id']] == 2 then
					if v['TalentSkillGroup'] == 0 then
						--删除被动
						local skillData = skill_container:GetSkill(v['Skill'])
						if skillData then
							skill_container:DestroySkill(skillData, true)
							
							--日志
							sLogServerSystem:LogToServer(0,player,"老的被动技能",v['Skill'],0,"天赋","玩家使用了道具书"..item_keyname.."激活天赋，删除同层已激活的被动技能")
							
							player_state['Job_'..job][v['Id']] = 1
							all_skill['Passive'][v['Skill']] = nil
							player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
							player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
						else
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,skillData is nil 111,player:"..player:GetName().."skill:"..v['Skill'])
							PlayerSkillSpell.err(player)
							return 1
						end
					else
						--删除职业技能
						if not all_skill['Initiative'][v['TalentSkillGroup']] then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,all_skill.Initiative.TalentSkillGroup is nil"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup'])
							PlayerSkillSpell.err(player)
							return 1
						end
						if #all_skill['Initiative'][v['TalentSkillGroup']] <= 0 then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,#all_skill.Initiative.TalentSkillGroup <= 0"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup'])
							PlayerSkillSpell.err(player)
							return 1
						end
						table.sort(all_skill['Initiative'][v['TalentSkillGroup']])
						local str = ""
						local t = 0
						for i = 1,#all_skill['Initiative'][v['TalentSkillGroup']] do
							if all_skill['Initiative'][v['TalentSkillGroup']][i] == v['Id'] then
								t = i
							end
							str = str..all_skill['Initiative'][v['TalentSkillGroup']][i]
						end
						if t == 0 then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equipall_skill.Initiative.TalentSkillGroup.id is nil"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",id:"..v['Id'])
							PlayerSkillSpell.err(player)
							return 1
						end
						if not PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str]then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 111"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",str:"..str)
							PlayerSkillSpell.err(player)
							return 1
						end
						local skillData = skill_container:GetSkill(PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
						if not skillData then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,skillData is nil 222,player:"..player:GetName().."skill:"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
							PlayerSkillSpell.err(player)
							return 1
						end
						local skill_level = skillData:GetPerformance()
						skill_container:DestroySkill(skillData, true)
						
						--日志
						sLogServerSystem:LogToServer(0,player,"老的门派技能",PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str],0,"天赋","玩家使用了道具书"..item_keyname.."，删除同层天赋相关的门派技能")
						
						table.remove(all_skill['Initiative'][v['TalentSkillGroup']],t)
						table.sort(all_skill['Initiative'][v['TalentSkillGroup']])
						str = ""
						if #all_skill['Initiative'][v['TalentSkillGroup']] > 0 then
							for i = 1,#all_skill['Initiative'][v['TalentSkillGroup']] do
								str = str..all_skill['Initiative'][v['TalentSkillGroup']][i]
							end
						else
							str = "0"
						end
						if not PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str] then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 222"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",str:"..str)
							PlayerSkillSpell.err(player)
							return 1
						end
						local new_skill = skill_container:CreateSkill(PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str], skill_level, skill_level, true)
						if not new_skill then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 111,player:"..player:GetName().."skill:"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
							PlayerSkillSpell.err(player)
							return 1
						end
						
						--日志
						sLogServerSystem:LogToServer(0,player,"老的门派技能",0,PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str],"天赋","玩家使用了道具书"..item_keyname.."，添加同层删除天赋后的门派技能")
						
						player:SetInt("PlayerSkill_Sect_"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']]['heart_method_index'].."_"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']]['skill_index'],PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
						player_state['Job_'..job][v['Id']] = 1
						player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
						player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
					end
				end
			end
		end
	end
	
	--对要装备的天赋进行操作
	local tb = PlayerSkillSpellConfig.SpellConfig['Id_'..id]
	if tb['TalentSkillGroup'] == 0 then
		new_skill = skill_container:CreateSkill(tb['Skill'], 1, 1, true)
		if not new_skill then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 222,player:"..player:GetName().."skill:"..tb['Skill'])
			PlayerSkillSpell.err(player)
			return  1
		end
		
		--日志
		sLogServerSystem:LogToServer(0,player,"新的被动技能",0,tb['Skill'],"天赋","玩家使用了道具书"..item_keyname.."添加被动技能")
						
		player_state['Job_'..job][id] = 2
		all_skill['Passive'][tb['Skill']] = 1
	else
		local str = ""
		local last_skill_id = 0
		if not all_skill['Initiative'][tb['TalentSkillGroup']] then
			all_skill['Initiative'][tb['TalentSkillGroup']] = {}
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['0']
		elseif #all_skill['Initiative'][tb['TalentSkillGroup']] == 0 then
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['0']
		else
			table.sort(all_skill['Initiative'][tb['TalentSkillGroup']])
			
			for i = 1,#all_skill['Initiative'][tb['TalentSkillGroup']] do
				str = str..all_skill['Initiative'][tb['TalentSkillGroup']][i]
			end
			if not PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]then
				sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 333"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
				PlayerSkillSpell.err(player)
				return 1
			end
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]
		end
		local last_skill_data = skill_container:GetSkill(last_skill_id)
		
		local auto_skillData = SkillConfig.GetById(player:GetAutoSkill())
		--sLuaApp:LuaWrn("============================   id = "..player:GetAutoSkill())
		
		if not last_skill_data then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,last_skill_data is nil,player:"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return 1
		end
		local last_skill_level = last_skill_data:GetPerformance()
		skill_container:DestroySkill(last_skill_data, true)
		
		--日志
		sLogServerSystem:LogToServer(0,player,"老的门派技能",last_skill_id,0,"天赋","玩家使用了道具书"..item_keyname.."，删除天赋相关的门派技能")
						
		table.insert(all_skill['Initiative'][tb['TalentSkillGroup']],id)
		table.sort(all_skill['Initiative'][tb['TalentSkillGroup']])
		str = ""
		for i = 1,#all_skill['Initiative'][tb['TalentSkillGroup']] do
			str = str..all_skill['Initiative'][tb['TalentSkillGroup']][i]
		end
		if not PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 444"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return 1
		end
		new_skill = skill_container:CreateSkill(PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str], last_skill_level, last_skill_level, true)
		if not new_skill then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 333,player:"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return 1
		end
		
		--判断是否和自动技能同组，如果同组并更改
		local skillData = SkillConfig.GetById(PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str])
		
		if auto_skillData and skillData then
			if skillData.SkillGroup == auto_skillData.SkillGroup and skillData.SkillGroup ~= 0 and auto_skillData.SkillGroup ~= 0 then
				player:SetAutoSkill(skillData.Id)
			end
		end
		
		--日志
		sLogServerSystem:LogToServer(0,player,"新的门派技能",0,PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str],"天赋","玩家使用了道具书"..item_keyname.."，添加天赋相关的门派技能")
					
		player:SetInt("PlayerSkill_Sect_"..PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['heart_method_index'].."_"..PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['skill_index'],PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str])
		player_state['Job_'..job][id] = 2
	end
	player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
	player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
	local form = [[
			if UIDefine then
				if not UIDefine.PlayerSkillSpell then
					UIDefine.PlayerSkillSpell = {}
				end
				UIDefine.PlayerSkillSpell.Spell_Config = ]]..Lua_tools.serialize(PlayerSkillSpell.Config_By_Job)..[[
				UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
				UIDefine.PlayerSkillSpell.Edition = ']]..PlayerSkillSpellConfig.Edition..[['
			end
			if not RoleSkillUI then
				GUI.OpenWnd("RoleSkillUI",2)
			else
				local wnd = GUI.GetWnd("RoleSkillUI")
				if GUI.GetVisible(wnd) then
					RoleSkillUI.RefreshServerData()
				else
					GUI.OpenWnd("RoleSkillUI",2)
				end
			end
		]]
	sLuaApp:ShowForm(player, "脚本表单", form)
	sLuaApp:NotifyTipsMsg(player, "装备天赋成功")	
	if Achievement then
		Achievement.Achievement_Talent_Skill(player)
	end
	if SevenDayCallBack then
		SevenDayCallBack.Talent(player)
	end
	return 2
end
function PlayerSkillSpell.Activate_Or_Equip(player,edition,id)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "无法在战斗中操作")
		return
	end
	id = tonumber(id)
	local check_id = PlayerSkillSpell.Check(player)
	local job = player:GetAttr(3)
	if not PlayerSkillSpellConfig.SpellConfig['Id_'..id] then
		sLuaApp:NotifyTipsMsg(player, "请选择一个天赋")
		return
	end
	if job ~= PlayerSkillSpellConfig.SpellConfig['Id_'..id]['Job'] then
		sLuaApp:NotifyTipsMsg(player, "这不是当前门派的天赋")
		return
	end
	if player:GetAttr(2) < PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentLevel'] then
		sLuaApp:NotifyTipsMsg(player, "等级不足")
		return
	end
	local item_keyname = ItemConfig.GetById(PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentItem']).KeyName
	local num = 0 
	local player_state = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
	if player_state['Job_'..job][id] then
		if player_state['Job_'..job][id] == 2 then
			sLuaApp:NotifyTipsMsg(player, "当前已经装备了该天赋")
			return
		end
	else
		num = 1
		if not Lua_tools.IsItemEnough(player, {item_keyname,num}) then
			--sLuaApp:NotifyTipsMsg(player, "道具不足！")
			--这里可以添加一键购买
			if not OneKeyBuy.Main(player,{item_keyname, 1}) then
				local form = [[
						if RoleSkillUI then
							RoleSkillUI.TalentSkillBookTips(]]..PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentItem']..[[)
						end
					]]
				sLuaApp:ShowForm(player, "脚本表单", form)
			end
			return
		end
	end
	--扣除道具
	if num > 0 then
		if not Lua_tools.SubItem(player,{item_keyname,num}, "PlayerSkillSpell.Activate_Or_Equip", ""..id, "") then
			sLuaApp:NotifyTipsMsg(player, "学习天赋出错，扣除道具失败")
			return
		end
		--扣了道具先激活
		player_state['Job_'..job][id] = 1
		player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
		
		--日志
		sLogServerSystem:LogToServer(0,player,"玩家身上天赋变量",0,1,"天赋","玩家使用了道具，激活了天赋:"..Lua_tools.serialize(player_state))
		
	end
	local all_skill = assert(load("return " .. player:GetString("PlayerSkillSpell_All_Skill")))()
	local skill_container = player:GetSkillContainer()	
	local erro = false
	--先对同层其他天赋进行操作
	for k,v in pairs(PlayerSkillSpell.Config_By_Job['Job_'..job]['TalentGroup_'..PlayerSkillSpellConfig.SpellConfig['Id_'..id]['TalentGroup']]) do
		if id ~= v['Id'] then
			if player_state['Job_'..job][v['Id']] then
				if player_state['Job_'..job][v['Id']] == 2 then
					if v['TalentSkillGroup'] == 0 then
						--删除被动
						local skillData = skill_container:GetSkill(v['Skill'])
						if skillData then
							skill_container:DestroySkill(skillData, true)
							
							--日志
							sLogServerSystem:LogToServer(0,player,"老的被动技能",v['Skill'],0,"天赋","玩家激活了天赋，删除同层其他的被动技能")
		
							player_state['Job_'..job][v['Id']] = 1
							all_skill['Passive'][v['Skill']] = nil
							player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
							player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
						else
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,skillData is nil 111,player:"..player:GetName().."skill:"..v['Skill'])
							PlayerSkillSpell.err(player)
							return
						end
					else
						--删除职业技能
						if not all_skill['Initiative'][v['TalentSkillGroup']] then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,all_skill.Initiative.TalentSkillGroup is nil"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup'])
							PlayerSkillSpell.err(player)
							return
						end
						if #all_skill['Initiative'][v['TalentSkillGroup']] <= 0 then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,#all_skill.Initiative.TalentSkillGroup <= 0"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup'])
							PlayerSkillSpell.err(player)
							return
						end
						table.sort(all_skill['Initiative'][v['TalentSkillGroup']])
						local str = ""
						local t = 0
						for i = 1,#all_skill['Initiative'][v['TalentSkillGroup']] do
							if all_skill['Initiative'][v['TalentSkillGroup']][i] == v['Id'] then
								t = i
							end
							str = str..all_skill['Initiative'][v['TalentSkillGroup']][i]
						end
						if t == 0 then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equipall_skill.Initiative.TalentSkillGroup.id is nil"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",id:"..v['Id'])
							PlayerSkillSpell.err(player)
							return
						end
						if not PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str]then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 111"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",str:"..str)
							PlayerSkillSpell.err(player)
							return
						end
						local skillData = skill_container:GetSkill(PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
						if not skillData then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,skillData is nil 222,player:"..player:GetName().."skill:"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
							PlayerSkillSpell.err(player)
							return
						end
						local skill_level = skillData:GetPerformance()
						skill_container:DestroySkill(skillData, true)
						
						--日志
						sLogServerSystem:LogToServer(0,player,"老的门派技能",PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str],0,"天赋","玩家激活了天赋，删除同层其他天赋相关的门派技能")
						
						table.remove(all_skill['Initiative'][v['TalentSkillGroup']],t)
						table.sort(all_skill['Initiative'][v['TalentSkillGroup']])
						str = ""
						if #all_skill['Initiative'][v['TalentSkillGroup']] > 0 then
							for i = 1,#all_skill['Initiative'][v['TalentSkillGroup']] do
								str = str..all_skill['Initiative'][v['TalentSkillGroup']][i]
							end
						else
							str = "0"
						end
						if not PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str] then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 222"..player:GetName().."TalentSkillGroup:"..v['TalentSkillGroup']..",str:"..str)
							PlayerSkillSpell.err(player)
							return
						end
						local new_skill = skill_container:CreateSkill(PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str], skill_level, skill_level, true)
						if not new_skill then
							sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 111,player:"..player:GetName().."skill:"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
							PlayerSkillSpell.err(player)
							return
						end
						
						--日志
						sLogServerSystem:LogToServer(0,player,"老的门派技能",0,PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str],"天赋","玩家激活了天赋，添加同层其他天赋删除天赋效果后的相关门派技能")
						
						player:SetInt("PlayerSkill_Sect_"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']]['heart_method_index'].."_"..PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']]['skill_index'],PlayerSkillSpellConfig.SkillGroupConfig[v['TalentSkillGroup']][str])
						player_state['Job_'..job][v['Id']] = 1
						player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
						player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
					end
				end
			end
		end
	end
	
	--对要装备的天赋进行操作
	local tb = PlayerSkillSpellConfig.SpellConfig['Id_'..id]
	if tb['TalentSkillGroup'] == 0 then
		new_skill = skill_container:CreateSkill(tb['Skill'], 1, 1, true)
		if not new_skill then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 222,player:"..player:GetName().."skill:"..tb['Skill'])
			PlayerSkillSpell.err(player)
			return
		end
		
		--日志
		sLogServerSystem:LogToServer(0,player,"新的被动技能",0,tb['Skill'],"天赋","玩家激活了天赋，添加被动技能")				
		
		player_state['Job_'..job][id] = 2
		all_skill['Passive'][tb['Skill']] = 1
	else
		local str = ""
		local last_skill_id = 0
		if not all_skill['Initiative'][tb['TalentSkillGroup']] then
			all_skill['Initiative'][tb['TalentSkillGroup']] = {}
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['0']
		elseif #all_skill['Initiative'][tb['TalentSkillGroup']] == 0 then
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['0']
		else
			table.sort(all_skill['Initiative'][tb['TalentSkillGroup']])
			str = ""
			for i = 1,#all_skill['Initiative'][tb['TalentSkillGroup']] do
				str = str..all_skill['Initiative'][tb['TalentSkillGroup']][i]
			end
			if not PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]then
				sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 333"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
				PlayerSkillSpell.err(player)
				return
			end
			last_skill_id = PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]
		end
		local last_skill_data = skill_container:GetSkill(last_skill_id)
		
		local auto_skillData = SkillConfig.GetById(player:GetAutoSkill())
		--sLuaApp:LuaWrn("============================   id = "..player:GetAutoSkill())
		
		if not last_skill_data then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,last_skill_data is nil,player:"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return
		end
		local last_skill_level = last_skill_data:GetPerformance()
		skill_container:DestroySkill(last_skill_data, true)
		
		--日志
		sLogServerSystem:LogToServer(0,player,"老的门派技能",last_skill_id,0,"天赋","玩家激活了天赋，删除老的门派技能")				
		
		table.insert(all_skill['Initiative'][tb['TalentSkillGroup']],id)
		table.sort(all_skill['Initiative'][tb['TalentSkillGroup']])
		str = ""
		for i = 1,#all_skill['Initiative'][tb['TalentSkillGroup']] do
			str = str..all_skill['Initiative'][tb['TalentSkillGroup']][i]
		end
		if not PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str]then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,PlayerSkillSpellConfig.SkillGroupConfig.TalentSkillGroup.str is nil 444"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return
		end
		new_skill = skill_container:CreateSkill(PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str], last_skill_level, last_skill_level, true)
		if not new_skill then
			sLuaApp:LuaWrn("PlayerSkillSpell.Activate_Or_Equip,new_skill is nil 333,player:"..player:GetName().."TalentSkillGroup:"..tb['TalentSkillGroup']..",str:"..str)
			PlayerSkillSpell.err(player)
			return
		end
		
		--判断是否和自动技能同组，如果同组并更改
		local skillData = SkillConfig.GetById(PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str])
		
		if skillData and auto_skillData then
			if skillData.SkillGroup == auto_skillData.SkillGroup and skillData.SkillGroup ~= 0 and auto_skillData.SkillGroup ~= 0 then
				player:SetAutoSkill(skillData.Id)
			end
		end
		--日志
		sLogServerSystem:LogToServer(0,player,"新的门派技能",0,PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str],"天赋","玩家激活了天赋，添加天赋相关的门派技能")				
		
		player:SetInt("PlayerSkill_Sect_"..PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['heart_method_index'].."_"..PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']]['skill_index'],PlayerSkillSpellConfig.SkillGroupConfig[tb['TalentSkillGroup']][str])
		player_state['Job_'..job][id] = 2
	end
	player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
	player:SetString("PlayerSkillSpell_All_Skill",Lua_tools.serialize(all_skill))
	if check_id == 2 then
		local form = [[
				if UIDefine then
					if not UIDefine.PlayerSkillSpell then
						UIDefine.PlayerSkillSpell = {}
					end
					UIDefine.PlayerSkillSpell.Spell_Config = ]]..Lua_tools.serialize(PlayerSkillSpell.Config_By_Job)..[[
					UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
					UIDefine.PlayerSkillSpell.Edition = ']]..PlayerSkillSpellConfig.Edition..[['
				end
				if RoleSkillUI then
					RoleSkillUI.RefreshServerData()
				end
			]]
		sLuaApp:ShowForm(player, "脚本表单", form)
	elseif check_id == 0 then
		local form = [[
				if UIDefine then
					if not UIDefine.PlayerSkillSpell then
						UIDefine.PlayerSkillSpell = {}
					end
					UIDefine.PlayerSkillSpell.Player_State = ]]..Lua_tools.serialize(assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))())..[[
				end
				if RoleSkillUI then
					RoleSkillUI.RefreshServerData()
				end
			]]
		sLuaApp:ShowForm(player, "脚本表单", form)
	end
	sLuaApp:NotifyTipsMsg(player, "装备天赋成功")	
	if Achievement then
		Achievement.Achievement_Talent_Skill(player)
	end
	if SevenDayCallBack then
		SevenDayCallBack.Talent(player)
	end
end
function PlayerSkillSpell.err(player)
	--重置玩家身上的天赋状态，删掉天赋技能
	PlayerSkillSpell.Reset_Player_State_Config(player)
	PlayerSkillSpell.Del_Skill_Spell_All(player)
	sLuaApp:NotifyTipsMsg(player, "装备天赋失败，出错")
end	
function PlayerSkillSpell.GetSkillSpellByChangeOccu(player)
	local job = player:GetAttr(3)
	local player_state = assert(load("return " .. player:GetString("PlayerSkillSpell_Player_State")))()
	for k,v in pairs(player_state['Job_'..job])do
		if v == 2 then
			player_state['Job_'..job][k] = 1
			player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
			PlayerSkillSpell.Activate_Or_Equip(player,PlayerSkillSpellConfig.Edition,k)
			player_state['Job_'..job][k] = 2
			player:SetString("PlayerSkillSpell_Player_State",Lua_tools.serialize(player_state))
		end
	end
end

PlayerSkillSpell.Initialization()