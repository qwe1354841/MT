--人物门派技能表单
FormPlayerSkill = {}
function FormPlayerSkill.GetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"技能","门派") then
        return ""
    end
	if PlayerSkill then
		PlayerSkill.GetData(player)
	end
	return ""
end

function FormPlayerSkill.ClkStudySkill(player, heart_method_index)
	if not MainUISwitch.CheckOpenLevel(player,"技能","门派") then
        return ""
    end
	if PlayerSkill then
		local T_OR_F = PlayerSkill.ClkStudySkill(player, heart_method_index)
		if T_OR_F == true then
			-- 更新技能小红点数据
			if FormPlayerSkill then
				FormPlayerSkill.get_role_skill_red_data(player)
			end
		end
	end
	return ""
end

function FormPlayerSkill.ClkOneKeyStudySkill(player, mod)
	if not MainUISwitch.CheckOpenLevel(player,"技能","门派") then
        return ""
    end
	if PlayerSkill then
		PlayerSkill.ClkOneKeyStudySkill(player, mod)
	end

	-- 更新技能小红点数据
	if FormPlayerSkill then
		FormPlayerSkill.get_role_skill_red_data(player)
	end

	return ""
end


-- 技能小红点
function FormPlayerSkill.get_role_skill_red_data(player)
	-- 获取玩家等级
	local role_level = player:GetAttr(ROLE_ATTR_LEVEL)

	if not MainUISwitch then require 'MainUISwitch' end

	local open_level = 12
	if MainUISwitch and MainUISwitch.Config and MainUISwitch.Config['技能'].OpenLevel then
		open_level = MainUISwitch.Config['技能'].OpenLevel
	end

	-- 如果玩家等级未达标，不提供小红点数
	if role_level >= open_level then
		local data = RoleSkillRedPointSystem.get_role_skill_all_jude(player)
		--sLuaApp:LuaDbg(Lua_tools.serialize(data))
		local str = [[
		GlobalProcessing.role_skill_red_point_data = ]] .. Lua_tools.serialize(data) ..[[
		GlobalProcessing._refresh_role_skill_red_point()
	]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end

	return ''
end