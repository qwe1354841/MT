-- 帮派技能表单
FormGuildSkill = {}

--获取数据
function FormGuildSkill.GetGuildSkillData(player, version)
	if not MainUISwitch.CheckOpenLevel(player,"技能","帮派") then
		return ""
	end
	if GuildSkill then
		GuildSkill.GetGuildSkillData(player, version)
		return ""
	end
	return ""
end

--修炼技能（使用银币）
function FormGuildSkill.LearnTime(player, skill_id, count)
	if not MainUISwitch.CheckOpenLevel(player,"技能","帮派") then
		return ""
	end
	if GuildSkill then
		GuildSkill.LearnTime(player, skill_id, count)

		-- 更新技能小红点数据
		if FormPlayerSkill then
			FormPlayerSkill.get_role_skill_red_data(player)
		end

		return ""
	end
	return ""
end
