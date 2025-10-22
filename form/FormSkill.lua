--装备相关表单

FormSkill = {}

function FormSkill.Skill_GetData(player, Version)
	sLuaApp:LuaDbg("FormSkillGet!")
	--EquipBuild.Initialization(0)
	
	if PlayerSkillStudy then
		PlayerSkillStudy.RoleSkill_GetData(player)
	end
	return ""
end

function FormSkill.StudyOnce(player, skillID)
	if PlayerSkillStudy then
		PlayerSkillStudy.Study(player, skillID, 0, 1)
	end
	return ""
end

function FormSkill.StudyMore(player, skillID)
	if PlayerSkillStudy then
		PlayerSkillStudy.StudyMore(player, skillID)
	end
	return ""
end

function FormSkill.StudyAll(player, school)
	if PlayerSkillStudy then
		PlayerSkillStudy.StudyAll(player, school)
	end
	return ""
end

function FormSkill.NewSkillStudy(player, skillID)
	if PlayerSkillStudy then
		PlayerSkillStudy.NewSkillStudy(player, skillID)
	end
	return ""
end