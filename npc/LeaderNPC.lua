LeaderNPC = {}
LeaderNPC.master_list = {
	["master_31"] = "师门-师傅-斗战胜佛-实例",
	["master_32"] = "师门-师傅-八部天龙-实例",
	["master_33"] = "师门-师傅-旃檀功德佛-实例",
	["master_34"] = "师门-师傅-金身罗汉-实例",
	["master_35"] = "师门-师傅-净坛使者-实例",
	["master_36"] = "师门-师傅-鬼师无常-实例",
}
--1	花果山
--2	西海龙宫
--3	慈恩寺
--4	流沙界
--5	净坛禅院
--6	酆都

function LeaderNPC.main(npc,player)
	local job = player:GetAttr(ROLE_ATTR_JOB_1)
	local keyname = npc:GetKeyName()
	if keyname == LeaderNPC.master_list["master_"..job] then
		player:AddNpcOption(npc, 0, "学习技能", "option1", "")
		player:AddNpcOption(npc, 0, "师门任务说明", "option2", "")
	end
	return "0"
end

function LeaderNPC.option1(npc,player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if SwitchOnAward then
		local tb = SwitchOnAward.BeStrongInitData()
		local UnlockLevel = tonumber(tb["技能"]["UnlockLevel"])
		if level >= UnlockLevel then
			sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('RoleSkillUI',1)")
			return ""
		else
			return "门派技能"..UnlockLevel.."级开启"
		end
	else
		sLuaApp:LuaErr("缺失SwitchOnAward")
	end
end

function LeaderNPC.option2(npc,player)
	return "1.门派任务需要满足等级34级。\r\n2.门派任务需要满足角色自己为本门派。\r\n"
end