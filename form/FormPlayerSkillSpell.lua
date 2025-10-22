--特技特效相关表单
FormPlayerSkillSpell = {}

function FormPlayerSkillSpell.Check_When_Open_Wnd(player,edition)
	if PlayerSkillSpell then
		PlayerSkillSpell.Check_When_Open_Wnd(player,edition)
	end
	return ""
end

function FormPlayerSkillSpell.Activate_Or_Equip(player,edition,id)
	if PlayerSkillSpell then
		PlayerSkillSpell.Activate_Or_Equip(player,edition,id)
	end

	-- 更新技能小红点数据
	if FormPlayerSkill then
		FormPlayerSkill.get_role_skill_red_data(player)
	end

	return ""
end