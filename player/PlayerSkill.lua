--人物门派技能
PlayerSkill = {}

-- 人物职业对应可学心法 
--每个职业第一个心法为主心法
-- 主心法等级要<=玩家等级
-- 心法等级要<=主心法等级
-- 技能等级=对应心法等级
-- 正式运营期间不要修改
PlayerSkill.JobHeartMethod = {
	["Job_31"] = {"花心法主", "花心法1", "花心法2", "花心法3", "花心法4", "花心法5"},
	["Job_32"] = {"龙心法主", "龙心法1", "龙心法2", "龙心法3", "龙心法4", "龙心法5"},
	["Job_33"] = {"僧心法主", "僧心法1", "僧心法2", "僧心法3", "僧心法4", "僧心法5"},
	["Job_34"] = {"沙心法主", "沙心法1", "沙心法2", "沙心法3", "沙心法4", "沙心法5"},
	["Job_35"] = {"猪心法主", "猪心法1", "猪心法2", "猪心法3", "猪心法4", "猪心法5"},
	["Job_36"] = {"鬼心法主", "鬼心法1", "鬼心法2", "鬼心法3", "鬼心法4", "鬼心法5"},
}                                     

--学技能消耗 --数值要求每一级分开配置 必须每一级都配置 消耗配置的数量要大于人物等级最大值
--界面上 一键升级 消耗不显示 如果要加显示 通过提示框显示
--一键升级时 如果将使用多种货币 目前不加提示，直接消耗
-- Exp 配置全部为0时 界面不显示经验消耗
PlayerSkill.Consume = {
	[1] = {Exp = 0, MoneyType = 5, MoneyVal = 20}, -- 从一级升到二级所需
	[2] = {Exp = 0, MoneyType = 5, MoneyVal = 30},
	[3] = {Exp = 0, MoneyType = 5, MoneyVal = 40},
	[4] = {Exp = 0, MoneyType = 5, MoneyVal = 50},
	[5] = {Exp = 0, MoneyType = 5, MoneyVal = 75},
	[6] = {Exp = 0, MoneyType = 5, MoneyVal = 100},
	[7] = {Exp = 0, MoneyType = 5, MoneyVal = 125},
	[8] = {Exp = 0, MoneyType = 5, MoneyVal = 150},
	[9] = {Exp = 0, MoneyType = 5, MoneyVal = 175},
	[10] = {Exp = 0, MoneyType = 5, MoneyVal = 200},
	[11] = {Exp = 0, MoneyType = 5, MoneyVal = 225},
	[12] = {Exp = 0, MoneyType = 5, MoneyVal = 250},
	[13] = {Exp = 0, MoneyType = 5, MoneyVal = 300},
	[14] = {Exp = 0, MoneyType = 5, MoneyVal = 350},
	[15] = {Exp = 0, MoneyType = 5, MoneyVal = 400},
	[16] = {Exp = 0, MoneyType = 5, MoneyVal = 450},
	[17] = {Exp = 0, MoneyType = 5, MoneyVal = 500},
	[18] = {Exp = 0, MoneyType = 5, MoneyVal = 625},
	[19] = {Exp = 0, MoneyType = 5, MoneyVal = 750},
	[20] = {Exp = 0, MoneyType = 5, MoneyVal = 1750},
	[21] = {Exp = 0, MoneyType = 5, MoneyVal = 2000},
	[22] = {Exp = 0, MoneyType = 5, MoneyVal = 2500},
	[23] = {Exp = 0, MoneyType = 5, MoneyVal = 3000},
	[24] = {Exp = 0, MoneyType = 5, MoneyVal = 3500},
	[25] = {Exp = 0, MoneyType = 5, MoneyVal = 4000},
	[26] = {Exp = 0, MoneyType = 5, MoneyVal = 4500},
	[27] = {Exp = 0, MoneyType = 5, MoneyVal = 5000},
	[28] = {Exp = 0, MoneyType = 5, MoneyVal = 6000},
	[29] = {Exp = 0, MoneyType = 5, MoneyVal = 7000},
	[30] = {Exp = 0, MoneyType = 5, MoneyVal = 8000},
	[31] = {Exp = 0, MoneyType = 5, MoneyVal = 9900},
	[32] = {Exp = 0, MoneyType = 5, MoneyVal = 11000},
	[33] = {Exp = 0, MoneyType = 5, MoneyVal = 12276},
	[34] = {Exp = 0, MoneyType = 5, MoneyVal = 14080},
	[35] = {Exp = 0, MoneyType = 5, MoneyVal = 15972},
	[36] = {Exp = 0, MoneyType = 5, MoneyVal = 17952},
	[37] = {Exp = 0, MoneyType = 5, MoneyVal = 20020},
	[38] = {Exp = 0, MoneyType = 5, MoneyVal = 22176},
	[39] = {Exp = 0, MoneyType = 5, MoneyVal = 24420},
	[40] = {Exp = 0, MoneyType = 5, MoneyVal = 26752},
	[41] = {Exp = 0, MoneyType = 5, MoneyVal = 37128},
	[42] = {Exp = 0, MoneyType = 5, MoneyVal = 40320},
	[43] = {Exp = 0, MoneyType = 5, MoneyVal = 43624},
	[44] = {Exp = 0, MoneyType = 5, MoneyVal = 47040},
	[45] = {Exp = 0, MoneyType = 5, MoneyVal = 50568},
	[46] = {Exp = 0, MoneyType = 5, MoneyVal = 54208},
	[47] = {Exp = 0, MoneyType = 5, MoneyVal = 57960},
	[48] = {Exp = 0, MoneyType = 5, MoneyVal = 61824},
	[49] = {Exp = 0, MoneyType = 5, MoneyVal = 65800},
	[50] = {Exp = 0, MoneyType = 5, MoneyVal = 69888},
	[51] = {Exp = 0, MoneyType = 5, MoneyVal = 95256},
	[52] = {Exp = 0, MoneyType = 5, MoneyVal = 100800},
	[53] = {Exp = 0, MoneyType = 5, MoneyVal = 106488},
	[54] = {Exp = 0, MoneyType = 5, MoneyVal = 112320},
	[55] = {Exp = 0, MoneyType = 5, MoneyVal = 118296},
	[56] = {Exp = 0, MoneyType = 5, MoneyVal = 124416},
	[57] = {Exp = 0, MoneyType = 5, MoneyVal = 130680},
	[58] = {Exp = 0, MoneyType = 5, MoneyVal = 137088},
	[59] = {Exp = 0, MoneyType = 5, MoneyVal = 143640},
	[60] = {Exp = 0, MoneyType = 5, MoneyVal = 150336},
	[61] = {Exp = 0, MoneyType = 5, MoneyVal = 218300},
	[62] = {Exp = 0, MoneyType = 5, MoneyVal = 240000},
	[63] = {Exp = 0, MoneyType = 5, MoneyVal = 256200},
	[64] = {Exp = 0, MoneyType = 5, MoneyVal = 272800},
	[65] = {Exp = 0, MoneyType = 5, MoneyVal = 289800},
	[66] = {Exp = 0, MoneyType = 5, MoneyVal = 307200},
	[67] = {Exp = 0, MoneyType = 5, MoneyVal = 325000},
	[68] = {Exp = 0, MoneyType = 5, MoneyVal = 343200},
	[69] = {Exp = 0, MoneyType = 5, MoneyVal = 361800},
	[70] = {Exp = 0, MoneyType = 5, MoneyVal = 380800},
	[71] = {Exp = 0, MoneyType = 5, MoneyVal = 480240},
	[72] = {Exp = 0, MoneyType = 5, MoneyVal = 504000},
	[73] = {Exp = 0, MoneyType = 5, MoneyVal = 528240},
	[74] = {Exp = 0, MoneyType = 5, MoneyVal = 552960},
	[75] = {Exp = 0, MoneyType = 5, MoneyVal = 578160},
	[76] = {Exp = 0, MoneyType = 5, MoneyVal = 603840},
	[77] = {Exp = 0, MoneyType = 5, MoneyVal = 630000},
	[78] = {Exp = 0, MoneyType = 5, MoneyVal = 656640},
	[79] = {Exp = 0, MoneyType = 5, MoneyVal = 683760},
	[80] = {Exp = 0, MoneyType = 5, MoneyVal = 711360},
	[81] = {Exp = 0, MoneyType = 5, MoneyVal = 739440},
	[82] = {Exp = 0, MoneyType = 5, MoneyVal = 768000},
	[83] = {Exp = 0, MoneyType = 5, MoneyVal = 797040},
	[84] = {Exp = 0, MoneyType = 5, MoneyVal = 826560},
	[85] = {Exp = 0, MoneyType = 5, MoneyVal = 856560},
	[86] = {Exp = 0, MoneyType = 5, MoneyVal = 887040},
	[87] = {Exp = 0, MoneyType = 5, MoneyVal = 918000},
	[88] = {Exp = 0, MoneyType = 5, MoneyVal = 949440},
	[89] = {Exp = 0, MoneyType = 5, MoneyVal = 981360},
	[90] = {Exp = 0, MoneyType = 5, MoneyVal = 1013760},
	[91] = {Exp = 0, MoneyType = 5, MoneyVal = 1046640},
	[92] = {Exp = 0, MoneyType = 5, MoneyVal = 1080000},
	[93] = {Exp = 0, MoneyType = 5, MoneyVal = 1113840},
	[94] = {Exp = 0, MoneyType = 5, MoneyVal = 1148160},
	[95] = {Exp = 0, MoneyType = 5, MoneyVal = 1182960},
	[96] = {Exp = 0, MoneyType = 5, MoneyVal = 1218240},
	[97] = {Exp = 0, MoneyType = 5, MoneyVal = 1254000},
	[98] = {Exp = 0, MoneyType = 5, MoneyVal = 1290240},
	[99] = {Exp = 0, MoneyType = 5, MoneyVal = 1326960},
	[100] = {Exp = 0, MoneyType = 5, MoneyVal = 1363680},
	[101] = {Exp = 0, MoneyType = 5, MoneyVal = 1400160},
	[102] = {Exp = 0, MoneyType = 5, MoneyVal = 1436760},
	[103] = {Exp = 0, MoneyType = 5, MoneyVal = 1473330},
	[104] = {Exp = 0, MoneyType = 5, MoneyVal = 1509900},
	[105] = {Exp = 0, MoneyType = 5, MoneyVal = 1546470},
	[106] = {Exp = 0, MoneyType = 5, MoneyVal = 1583040},
	[107] = {Exp = 0, MoneyType = 5, MoneyVal = 1619640},
	[108] = {Exp = 0, MoneyType = 5, MoneyVal = 1656210},
	[109] = {Exp = 0, MoneyType = 5, MoneyVal = 1692780},
	[110] = {Exp = 0, MoneyType = 5, MoneyVal = 1729350},
	[111] = {Exp = 0, MoneyType = 5, MoneyVal = 1765920},
	[112] = {Exp = 0, MoneyType = 5, MoneyVal = 1802520},
	[113] = {Exp = 0, MoneyType = 5, MoneyVal = 1839090},
	[114] = {Exp = 0, MoneyType = 5, MoneyVal = 1875660},
	[115] = {Exp = 0, MoneyType = 5, MoneyVal = 1912230},
	[116] = {Exp = 0, MoneyType = 5, MoneyVal = 1948800},
	[117] = {Exp = 0, MoneyType = 5, MoneyVal = 1985400},
	[118] = {Exp = 0, MoneyType = 5, MoneyVal = 2021970},
	[119] = {Exp = 0, MoneyType = 5, MoneyVal = 2058540},
	[120] = {Exp = 0, MoneyType = 5, MoneyVal = 2095110},
	[121] = {Exp = 0, MoneyType = 5, MoneyVal = 2131680},
}


--人物出生
function PlayerSkill.FirstLogin(player)
	--PlayerSkill.SetHeartMethod(player)
	--sLuaApp:LuaErr("PlayerSkill.HeartMethodNum"..PlayerSkill.HeartMethodNum)
	--设置心法等级为 1
	for i = 1, PlayerSkill.HeartMethodNum do
		player:SetInt("PlayerSkill_HeartMethodLevel_"..i, 1)
		PlayerSkill.AddSkill(player, i, 1)
	end
	
end
--根据心法表 添加技能 --（心法序号，等级） --记录技能id
function PlayerSkill.AddSkill(player, heart_method_index, skill_level)
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local heart_method_keyname = PlayerSkill.JobHeartMethod["Job_"..job_id][heart_method_index]
	--local heart_method_keyname = player:GetString("PlayerSkill_HeartMethod_"..heart_method_index)
	local skill_spell_data = SkillSpellConfig.GetByKeyName(heart_method_keyname)
	if not skill_spell_data then
		sLuaApp:LuaErr(" PlayerSkill.AddSkill 不存在"..heart_method_keyname)
		return
	end
	
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	for i = 1, 5 do
		if skill_spell_data["Skill"..i] ~= 0 then
			local has_skill_id = player:GetInt("PlayerSkill_Sect_"..heart_method_index.."_"..i)
			if has_skill_id == 0 and skill_spell_data["Level"..i] <= level then
				PlayerSkill.SkillCreate(player, skill_spell_data["Skill"..i], skill_level,heart_method_index,  i)
			end
		else
			break
		end
	end
end

function PlayerSkill.SkillCreate(player, skill_id, skill_level,heart_method_index, skill_index) -- skill_index 在skill_spell表中的几号技能
	--sLuaApp:LuaErr("PlayerSkill.SkillCreate"..skill_id)
	local skill_container = player:GetSkillContainer()
	local new_skill = skill_container:CreateSkill(skill_id, skill_level, skill_level, true)
	--sLuaApp:LuaErr("new_skillnew_skillnew_skillnew_skillGetId"..new_skill:GetId())
	if new_skill then
		player:SetInt("PlayerSkill_Sect_"..heart_method_index.."_"..skill_index, skill_id) -- PlayerSkill_Sect_1_1
	else
		sLuaApp:LuaErr("PlayerSkill.AddSkill 创建技能失败"..skill_id)
	end
	--如果界面打开 刷新界面 XX 但是界面怎么可能打开
end

-- --在人物身上记录 可学心法 --人物出生 以及转职XXXXXXXXXXXXXXXXXXXXXXXXXXX时
-- function PlayerSkill.SetHeartMethod(player)
	-- local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	-- --sLuaApp:LuaErr("job_id"..job_id)
	-- local heart_method_config = PlayerSkill.JobHeartMethod["Job_"..job_id]
	-- if not heart_method_config then
		-- sLuaApp:LuaErr("PlayerSkill.SetHeartMethod 错误 不存在PlayerSkill.JobHeartMethod job_"..job_id)
		-- return
	-- end
	-- for k,v in ipairs(heart_method_config) do
		-- player:SetString("PlayerSkill_HeartMethod_"..k, v)
	-- end
-- end



--打开界面 传心法等级表 升级消耗
function PlayerSkill.GetData(player)
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	if not PlayerSkill.JobHeartMethod["Job_"..job_id] then
		return 
	end
	
	local serverData = {}
	serverData["IsShowExpConsume"] = PlayerSkill.IsShowExpConsume
	serverData["HeartMethod"] = PlayerSkill.JobHeartMethod["Job_"..job_id]
	serverData["HeartLevel"] = {}
	serverData["Consume"] = {}
	for i = 1, PlayerSkill.HeartMethodNum do
		--心法等级
		local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..i)
		if heart_level == 0 then
			sLuaApp:LuaErr("PlayerSkill.GetData  player"..player:GetName().." PlayerSkill_HeartMethodLevel_"..i.."== 0")
			return
		end
		table.insert(serverData["HeartLevel"], heart_level)
		
		--升级消耗
		local level_consume = PlayerSkill.Consume[heart_level] or {Exp = -1, MoneyType = -1, MoneyVal = -1}
		table.insert(serverData["Consume"], level_consume)
	end

	local str = [[
		if RoleSkillUI then
			RoleSkillUI.serverData = ]]..Lua_tools.serialize(serverData)..[[
			RoleSkillUI.RefreshSchoolSkillPage()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end


--btn学习技能 --（心法序号） 
function PlayerSkill.ClkStudySkill(player, heart_method_index)
	if not heart_method_index then return end
	heart_method_index = tonumber(heart_method_index)
	--判断等级 
	local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index)
	if heart_level == 0 then
		sLuaApp:LuaErr(" PlayerSkill.ClkStudySkill player"..player:GetGUID().." heart_method_index"..heart_method_index.. " 为0")
		return false
	end
	if heart_method_index == 1 then
		local level = player:GetAttr(ROLE_ATTR_LEVEL)
		if heart_level >= level then
			sLuaApp:NotifyTipsMsg(player, "当前心法等级已达上限！")
			return false
		end
	else
		local major_heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_1")
		if heart_level >= major_heart_level then
			sLuaApp:NotifyTipsMsg(player, "普通心法等级不能高于主心法等级")
			return false
		end
	end
	--判断消耗
	local consume_config = PlayerSkill.Consume[heart_level]
	if consume_config == nil or not next(consume_config) then
		sLuaApp:LuaErr("PlayerSkill.ClkStudySkill consume_config 为空")
		return false
	end
	if consume_config["MoneyType"] and consume_config["MoneyVal"] then
		if not Lua_tools.IsMoneyEnough(player, consume_config["MoneyType"], consume_config["MoneyVal"]) then
			if MoneyChange then
				local f_name = [[PlayerSkill.ClkStudySkill(player,]]..heart_method_index..[[)]]
				MoneyChange.LackMoney(player, consume_config["MoneyType"], consume_config["MoneyVal"], f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "升级所需"..Lua_tools.GetMoneyName(consume_config["MoneyType"]).."不足！")
			end
			return false
		end
	end
	if consume_config["Exp"] and consume_config["Exp"] > 0 then
		local role_exp = player:GetAttr(ROLE_ATTR_EXP)
		if role_exp < consume_config["Exp"] then
			sLuaApp:NotifyTipsMsg(player, "升级所需经验不足！")
			return false
		end
	end
	
	--扣除消耗
	if consume_config["Exp"] and consume_config["Exp"] > 0 then
		if not player:SubExp(consume_config["Exp"], "system", "心法升级", "升级") then
			sLuaApp:LuaErr("PlayerSkill.ClkStudySkill 扣除Exp失败")
			return false
		end
	end
	if consume_config["MoneyType"] and consume_config["MoneyVal"] then
		if not Lua_tools.SubMoney(player, consume_config["MoneyType"], consume_config["MoneyVal"] , "system", "心法升级", "升级") then
			sLuaApp:LuaErr("PlayerSkill.ClkStudySkill 扣钱失败")
			return false
		end
	end
	--升一级
	local now_heart_level = heart_level + 1
	player:SetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index, now_heart_level)
	PlayerSkill.SkillLevelUp(player, heart_method_index, now_heart_level)
	
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local heart_method_config = PlayerSkill.JobHeartMethod["Job_"..job_id]
	local heart_keyname = heart_method_config[heart_method_index]
	local heart_name = SkillSpellConfig.GetByKeyName(heart_keyname).Name
	sLuaApp:NotifyTipsMsg(player, "心法"..heart_name.."升至"..now_heart_level.."级")
	
	local consume_tb = PlayerSkill.Consume[now_heart_level] or {Exp = -1, MoneyType = -1, MoneyVal = -1}
	local str = [[
		if RoleSkillUI then
			RoleSkillUI.serverData["HeartLevel"][]]..heart_method_index..[[] = ]]..now_heart_level..[[
			RoleSkillUI.serverData["Consume"][]]..heart_method_index..[[] = ]]..Lua_tools.serialize(consume_tb)..[[
			RoleSkillUI.RefreshServerData()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	if SevenDayCallBack then
		SevenDayCallBack.Skill(player)
	end
	return true
end


--btn一键升级 --跟升一级的功能分开 怕以后改
-- mod == -1 表示选中 所有技能CheckBox --否则表示心法序号
function PlayerSkill.ClkOneKeyStudySkill(player, mod)
	mod = tonumber(mod)
	if mod == -1 then
		local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
		local max_heart_level = player:GetAttr(ROLE_ATTR_LEVEL)
		
		local consume_level_tb = {}--计算消耗用 {{heart_method_index,heart_level},{heart_method_index,heart_level}}
		for i = 1, PlayerSkill.HeartMethodNum do 
			if not PlayerSkill.JobHeartMethod["Job_"..job_id][i] then
				sLuaApp:LuaErr("PlayerSkill.ClkOneKeyStudySkill 不存在i "..i)
				return
			end
			
			local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..i)
			for j = heart_level, max_heart_level -1 do
				table.insert(consume_level_tb, {i, j})
			end
		end
		
		--if max_heart_level <= consume_level_tb[1][2] then
		if not next(consume_level_tb) then
			sLuaApp:NotifyTipsMsg(player, "所有心法已达最大等级，无法提升心法等级")
			return
		end
		
		--sLuaApp:LuaErr("consume_level_tbconsume_level_tb111"..Lua_tools.serialize(consume_level_tb))
		table.sort(consume_level_tb,
			function(x,y)
				if x[2] == y[2] then
					return	x[1] < y[1]
				else
					return  x[2] < y[2]
				end
			end)
		--sLuaApp:LuaErr("consume_level_tbconsume_level_tb222"..Lua_tools.serialize(consume_level_tb))
		
		if PlayerSkill.CheckConsume(player, consume_level_tb[1][2], consume_level_tb, mod) then
			PlayerSkill.EnoughHeartLevelUp(player, consume_level_tb, mod)
		end
		if SevenDayCallBack then
			SevenDayCallBack.Skill(player)
		end

	else
		local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
		if not PlayerSkill.JobHeartMethod["Job_"..job_id][mod] then
			sLuaApp:LuaErr("PlayerSkill.ClkOneKeyStudySkill 不存在mod "..mod)
			return
		end
		
		local max_heart_level = 0
		if mod == 1 then
			max_heart_level = player:GetAttr(ROLE_ATTR_LEVEL)
		else
			max_heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_1")		
		end
		
		local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..mod)
		if max_heart_level <= heart_level then
			if mod == 1 then
				sLuaApp:NotifyTipsMsg(player, "当前心法等级已达上限！")
			else
				sLuaApp:NotifyTipsMsg(player, "普通心法等级不能高于主心法等级")
			end
			return
		end
		local now_heart_level_tb = {}
		now_heart_level_tb[mod] = heart_level
		local consume_level_tb = {}
		for j = heart_level, max_heart_level - 1 do
			table.insert(consume_level_tb, {mod, j})
		end
		--sLuaApp:LuaErr("consume_level_tbconsume_level_tb"..Lua_tools.serialize(consume_level_tb))
		if PlayerSkill.CheckConsume(player, heart_level, consume_level_tb, mod) then
			PlayerSkill.EnoughHeartLevelUp(player, consume_level_tb, mod)
		end
		if SevenDayCallBack then
			SevenDayCallBack.Skill(player)
		end
	end
end

--一键升级时检查下一级能不能升  不能时转到货币兑换（升级全部）
function PlayerSkill.CheckConsume(player, heart_level, consume_level_tb, mod)
	--判断消耗
	local consume_config = PlayerSkill.Consume[heart_level]
	if consume_config == nil or not next(consume_config) then
		sLuaApp:LuaErr("PlayerSkill.ClkOneKeyStudySkill consume_config 为空")
		return false
	end
	if consume_config["Exp"] and consume_config["Exp"] > 0 then
		local role_exp = player:GetAttr(ROLE_ATTR_EXP)
		if role_exp < consume_config["Exp"] then
			sLuaApp:NotifyTipsMsg(player, "升级所需经验不足！")
			return false
		end
	end
	if consume_config["MoneyType"] and consume_config["MoneyVal"] then
		if not Lua_tools.IsMoneyEnough(player, consume_config["MoneyType"], consume_config["MoneyVal"]) then
			if MoneyChange then
				local change_moneyval = PlayerSkill.GetNeedMoney(player, consume_level_tb, consume_config["MoneyType"])
				local f_name = [[PlayerSkill.ClkOneKeyStudySkill(player,]]..mod..[[)]]
				MoneyChange.LackMoney(player, consume_config["MoneyType"], change_moneyval, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "升级所需"..Lua_tools.GetMoneyName(consume_config["MoneyType"]).."不足！")
			end
			
			return false
		end
	end
	return true
end

function PlayerSkill.GetNeedMoney(player, consume_level_tb, check_money_type)
	--获得需要的钱 如果碰到经验不够 或者货币类型变化 则break
	local change_moneyval = 0
	local has_exp = player:GetAttr(ROLE_ATTR_EXP)
	for _,v in ipairs(consume_level_tb) do
		local consume_tb = PlayerSkill.Consume[v[2]]
		local need_exp = consume_tb["Exp"]
		if need_exp and need_exp > 0 then
			has_exp = has_exp - need_exp
			if has_exp < 0 then
				break
			end
		end
		local need_moneytype = consume_tb["MoneyType"]
		local need_moneyval = consume_tb["MoneyVal"]
		if need_moneytype and need_moneyval then
			if check_money_type ~= need_moneytype then
				break
			end
			change_moneyval = change_moneyval + need_moneyval
		end
	end
	return change_moneyval
end

--尽量升级心法  根据{{heart_method_index,heart_level},{heart_method_index,heart_level}}
function PlayerSkill.EnoughHeartLevelUp(player, consume_level_tb,mod)
	local has_exp = player:GetAttr(ROLE_ATTR_EXP)
	local has_money = {}  --{[MoneyType] = MoneyVal}
	local consume_exp = 0 --最终消耗 Exp
	local consume_money = {} --最终消耗 {[MoneyType] = MoneyVal}
	local end_heart_level_tb = {} --最终升到几级{[heart_method_index]=end_heart_level}
	local max_heart_level = 0
	if mod == -1 or mod == 1 then
		max_heart_level = player:GetAttr(ROLE_ATTR_LEVEL)
	else
		max_heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_1")
	end

	for _,v in ipairs(consume_level_tb) do--{heart_method_index,heart_level}
		local heart_index = v[1]
		local heart_level = v[2]
		if not end_heart_level_tb[heart_index] then
			end_heart_level_tb[heart_index] = player:GetInt("PlayerSkill_HeartMethodLevel_"..heart_index)
		end
		
		if end_heart_level_tb[heart_index] + 1 > max_heart_level then
			break
		end
		
		local consume_config = PlayerSkill.Consume[heart_level]
		if not consume_config then
			sLuaApp:LuaErr("PlayerSkill.Consume 缺少end_heart_level"..heart_level)
			break
		end
		
		local need_exp = consume_config["Exp"]
		if need_exp and need_exp > 0 then
			has_exp = has_exp - need_exp
			if has_exp < 0 then
				--sLuaApp:LuaErr("if has_exp < 0 thenif has_exp < 0 then")
				break
			end
		end
		
		local need_moneytype = consume_config["MoneyType"]
		local need_moneyval = consume_config["MoneyVal"]
		if need_moneytype and need_moneyval then
			if not has_money[need_moneytype] then
				has_money[need_moneytype] = PlayerSkill.GetMoneyVal(player, need_moneytype)
				--sLuaApp:LuaErr("has_money[need_moneytype]"..has_money[need_moneytype])
			end
			
			has_money[need_moneytype] = has_money[need_moneytype] - need_moneyval
			if has_money[need_moneytype] < 0 then
				--sLuaApp:LuaErr("if has_money[need_moneytype] < 0 then")
				
				break
			end
		end

		if need_exp and need_exp > 0 then
			consume_exp = consume_exp + need_exp
		end
		if need_moneytype and need_moneyval then
			if not consume_money[need_moneytype] then
				 consume_money[need_moneytype] = need_moneyval
			else
				 consume_money[need_moneytype] =  consume_money[need_moneytype] + need_moneyval
			end
		end
		end_heart_level_tb[heart_index] = end_heart_level_tb[heart_index] + 1
	end

	--sLuaApp:LuaErr("consume_money"..Lua_tools.serialize(consume_money))
	--sLuaApp:LuaErr("consume_exp"..consume_exp)
	--sLuaApp:LuaErr("end_heart_level_tb"..Lua_tools.serialize(end_heart_level_tb))
	--扣除消耗
	if consume_exp and consume_exp > 0 then
		if not player:SubExp(consume_exp, "system", "心法升级", "一键升级") then
			sLuaApp:LuaErr("PlayerSkill.ClkOneKeyStudySkill 扣除Exp失败")
			return
		end
	end
	
	for k,v in pairs(consume_money) do
		if not Lua_tools.SubMoney(player, k, v, "system", "心法升级", "一键升级") then
			sLuaApp:LuaErr("PlayerSkill.ClkOneKeyStudySkill 扣钱失败")
			return
		end
	end
	
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local heart_method_config = PlayerSkill.JobHeartMethod["Job_"..job_id]
	
	local level_up_num = Lua_tools.tablecount(end_heart_level_tb)
	if level_up_num > 1 then
		for k,v in pairs(end_heart_level_tb) do
			--设置心法等级
			player:SetInt("PlayerSkill_HeartMethodLevel_"..k, v)
			PlayerSkill.SkillLevelUp(player, k, v)
			
			local heart_keyname = heart_method_config[k]
			local heart_name = SkillSpellConfig.GetByKeyName(heart_keyname).Name
			sLuaApp:NotifyTipsMsg(player, "心法"..heart_name.."升至"..v.."级")
		end
		PlayerSkill.GetData(player)

	elseif level_up_num == 1 then
		--一个技能升级 就赋值单个
		for k,v in pairs(end_heart_level_tb) do
			--设置心法等级
			player:SetInt("PlayerSkill_HeartMethodLevel_"..k, v)
			PlayerSkill.SkillLevelUp(player, k, v)
			
			local consume_tb = PlayerSkill.Consume[v] or {Exp = -1, MoneyType = -1, MoneyVal = -1}
			local str = [[
				if RoleSkillUI then
					RoleSkillUI.serverData["HeartLevel"][]]..k..[[] = ]]..v..[[
					RoleSkillUI.serverData["Consume"][]]..k..[[] = ]]..Lua_tools.serialize(consume_tb)..[[
					RoleSkillUI.RefreshServerData()
				end
			]]
			--sLuaApp:LuaErr(str)
			sLuaApp:ShowForm(player, "脚本表单", str)
			
			local heart_keyname = heart_method_config[k]
			local heart_name = SkillSpellConfig.GetByKeyName(heart_keyname).Name
			sLuaApp:NotifyTipsMsg(player, "心法"..heart_name.."升至"..v.."级")
		end
	end
end

--根据已有技能 技能升级  --（技能id， 等级） --天赋可能用
function PlayerSkill.SkillLevelUp(player, heart_method_index, skill_level)
	--成就相关
	if Achievement then
		Achievement.AchievementSkill(player, heart_method_index, skill_level)
	end
	sLogServerSystem:LogToServer(0, player, "人物心法".. heart_method_index, 0, skill_level, "心法升级", "记录升级后等级")
	for i = 1, 5 do
		local skill_id = player:GetInt("PlayerSkill_Sect_"..heart_method_index.."_"..i)
		if skill_id ~= 0 then
			local skill_container = player:GetSkillContainer()
			local skill = skill_container:GetSkill(skill_id)
			skill:SetMaxPerformance(skill_level)
			skill:SetPerformance(skill_level)
		end
	end
end

--升级时回调 添加技能
function PlayerSkill.OnLevelUp(player, newlevel)	
	if not PlayerSkill.LevelUpCheck or not next(PlayerSkill.LevelUpCheck) then
		sLuaApp:LuaErr("PlayerSkill.OnLevelUp  PlayerSkill.LevelUpCheck为空")
		return
	end
	
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	if PlayerSkill.LevelUpCheck["Job_"..job_id][newlevel] then
		for _,v in ipairs(PlayerSkill.LevelUpCheck["Job_"..job_id][newlevel]) do
			-- v1心法序号 v2技能id v3技能在skillspell中序号
			local skill_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..v[1])
			PlayerSkill.SkillCreate(player, v[2], skill_level,v[1], v[3])
		end
	end
end


PlayerSkill.SkillAttr = {
	[31] = {496,502},
	[32] = {497,503},
	[33] = {498,503},
	[34] = {499,503},
	[35] = {500,502},
	[36] = {501,502},
}


--检查心法提高等级属性
function PlayerSkill.RecalcSkillAttr(player)
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local attr_id_tb = PlayerSkill.SkillAttr[job_id]
	local attr_val = 0
	for _,attr_id in ipairs(attr_id_tb) do
		attr_val = attr_val + player:GetAttr(attr_id)
	end

	--当前提升等级
	local now_change_level = player:GetInt("PlayerSkill_ChangeAllLevel")
	if attr_val ~= now_change_level then
		local change_num = attr_val - now_change_level
		player:SetInt("PlayerSkill_ChangeAllLevel", attr_val)
		PlayerSkill.ChangeSkillLevel(player, change_num)
	end
end

--心法等级增减X级
function PlayerSkill.ChangeSkillLevel(player, change_num)
	local skill_container = player:GetSkillContainer()
	for heart_method_index = 1, PlayerSkill.HeartMethodNum do
		-- local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index)
		-- player:SetInt("PlayerSkill_HeartMethodLevel_"..heart_method_index, heart_level + change_num)
		for i = 1, 5 do
			local skill_id = player:GetInt("PlayerSkill_Sect_"..heart_method_index.."_"..i)
			if skill_id ~= 0 then
				local skill_container = player:GetSkillContainer()
				local skill = skill_container:GetSkill(skill_id)
				local skill_level = skill:GetMaxPerformance() + change_num
				skill:SetMaxPerformance(skill_level)
				skill:SetPerformance(skill_level)
			end
		end
	end
end

function PlayerSkill.smts(player)
	local skill_container = player:GetSkillContainer()
	local job_id = player:GetAttr(ROLE_ATTR_JOB_1)
	local heart_method_config = PlayerSkill.JobHeartMethod["Job_"..job_id]
	for i = 1, 6 do
		local heart_name = heart_method_config[i]
		local heart_level = player:GetInt("PlayerSkill_HeartMethodLevel_"..i)
		sLuaApp:LuaErr("heart_name "..heart_name.."   heart_level "..heart_level)
		sLuaApp:NotifyTipsMsg(player, "heart_name "..heart_name.."   heart_level "..heart_level)
		for a= 1, 2 do
			local skill_id = player:GetInt("PlayerSkill_Sect_"..i.."_"..a)
			if skill_id == 0 then
				sLuaApp:LuaErr(i.."_"..a.."  skill_id "..skill_id)
				sLuaApp:NotifyTipsMsg(player, i.."_"..a.."  skill_id "..skill_id)
			else
				local skill = skill_container:GetSkill(skill_id)
				local skill_Performance = skill:GetPerformance()
				local skill_MaxPerformance = skill:GetMaxPerformance()
				
				sLuaApp:LuaErr(i.."_"..a.."  skill_id "..skill_id.." skill_Performance ".. skill_Performance.."  skill_MaxPerformance "..skill_MaxPerformance)
				sLuaApp:NotifyTipsMsg(player, i.."_"..a.."  skill_id "..skill_id.." skill_Performance ".. skill_Performance.."  skill_MaxPerformance "..skill_MaxPerformance)
			end
		end
	end
end

function PlayerSkill.GetMoneyVal(player, money_type)
	if type(money_type) ~= "number" then
		return 0
	end
	if money_type == 1 then
		return player:GetIngot()
	elseif money_type == 2 then
		return player:GetBindIngot()
	elseif money_type == 4 then
		return player:GetGold()
	elseif money_type == 5 then
		return player:GetBindGold()
	end
	return 0
end

function PlayerSkill.Initialization()
	--sLuaApp:LuaErr("PlayerSkill.OnStart()PlayerSkill.OnStart()PlayerSkill.OnStart()")
	--升级时判断是否需要加技能 
	PlayerSkill.LevelUpCheck = {}
	for k,v in pairs(PlayerSkill.JobHeartMethod) do
		PlayerSkill.LevelUpCheck[k] = {}
		for a,b in ipairs(v) do
			local skill_spell_data = SkillSpellConfig.GetByKeyName(b)
			if not skill_spell_data then
				sLuaApp:LuaErr("SkillSpellConfig 不存在"..b)
				return
			end
			for i = 1, 5 do
				if skill_spell_data["Skill"..i] ~= 0 then
					if skill_spell_data["Level"..i] > 1 then
						if not PlayerSkill.LevelUpCheck[k][skill_spell_data["Level"..i]] then
							PlayerSkill.LevelUpCheck[k][skill_spell_data["Level"..i]] = {}
						end
						table.insert(PlayerSkill.LevelUpCheck[k][skill_spell_data["Level"..i]], {a, skill_spell_data["Skill"..i], i})
					end
				end
			end
		end
	end
	--sLuaApp:LuaErr("PlayerSkill.LevelUpCheck"..Lua_tools.serialize(PlayerSkill.LevelUpCheck))
	--心法数量
	PlayerSkill.HeartMethodNum = 0
	for _,v in pairs(PlayerSkill.JobHeartMethod) do
		for a,_ in ipairs(v) do
			--sCustomVarSystem:SetBroadcastScope(0, "PlayerSkill_HeartMethod_"..a, 1)
			PlayerSkill.HeartMethodNum = PlayerSkill.HeartMethodNum + 1
		end
		break
	end
		
	PlayerSkill.IsShowExpConsume= 0
	for _,v in ipairs(PlayerSkill.Consume) do
		if v["Exp"] and v["Exp"] > 0 then
			PlayerSkill.IsShowExpConsume= 1
			break
		end
	end
end
PlayerSkill.Initialization()