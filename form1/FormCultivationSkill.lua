FormCultivationSkill = {}

--获取数据
function FormCultivationSkill.GetCulSKillData(player, version)
	sLuaApp:LuaDbg("FormCultivationSkill.GetCulSKillData")
	if CultivationSkill then
		CultivationSkill.GetCulSKillData(player, version)
		return ""
	end
	return ""
end

--修炼技能（使用银币）
function FormCultivationSkill.LearnTime(player, skill_id, count)
	sLuaApp:LuaDbg("count:"..count)
	sLuaApp:LuaDbg("skill_id:"..skill_id)
	if CultivationSkill then
		CultivationSkill.LearnTime(player, skill_id, count)

		-- 更新技能小红点数据
		if FormPlayerSkill then
			FormPlayerSkill.get_role_skill_red_data(player)
		end

		return ""
	end
	return ""
end

--修炼技能（使用修炼丹）
function FormCultivationSkill.UseElixir(player, skill_id, param, show_exp)
	if CultivationSkill then
		CultivationSkill.UseElixir(player, skill_id, param, show_exp)

		-- 更新技能小红点数据
		if FormPlayerSkill then
			FormPlayerSkill.get_role_skill_red_data(player)
		end

		return ""
	end
	return ""
end

-- ’修炼‘技能等级数据
function FormCultivationSkill.get_skill_Level_limit(player)
	if CultivationSkill then
		local str = [[
			UIDefine.SkillLevelLimit = ]] .. Lua_tools.serialize(CultivationSkill.SkillLevelLimit) ..[[
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	return ''
end