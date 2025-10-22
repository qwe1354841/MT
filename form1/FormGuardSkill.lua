-- 侍从技能表单
FormGuardSkill = {}

--获取技能数据
function FormGuardSkill.GetSkillData(player, guard_id)
	if not MainUISwitch.CheckOpenLevel(player,"侍从") then
		return ""
	end
	GuardSkill.GetSkillData(player, guard_id)
	return ""
end

--侍从升星技能升级
function FormGuardSkill.GuardStarUP(player, guard_guid, guard_star)	
	if not MainUISwitch.CheckOpenLevel(player,"侍从","升星") then
		return ""
	end
	GuardSkill.GuardStarUP(player, guard_guid, guard_star)
	return ""
end

--情缘技能升级
function FormGuardSkill.GuardLoveStarUP(player, guard_guid, love, love_star)	
	if not MainUISwitch.CheckOpenLevel(player,"侍从","情缘") then
		return ""
	end
	GuardSkill.GuardLoveStarUP(player, guard_guid, love, love_star)
	return ""
end
