--服务器等级
ServerLevel = {}

ServerLevel.Config = {
	--显示等级
	['ShowLevel'] = 50,
	--Day天数 ServerLv服务器等级 ServerReincarnation服务器转生等级   -- 服务器天数 <= Day天数 时，开启ServerLv服务器等级
	['ServerLevel'] = {
		{['Day'] = 0,	['ServerLv'] = 40 ,['ServerReincarnation'] = 0},
		{['Day'] = 1,	['ServerLv'] = 45 , ['ServerReincarnation'] = 0},
		{['Day'] = 2,	['ServerLv'] = 50 ,['ServerReincarnation'] = 0},
		{['Day'] = 4,	['ServerLv'] = 55 ,['ServerReincarnation'] = 0},
		{['Day'] = 7,	['ServerLv'] = 60 , ['ServerReincarnation'] = 0},
		{['Day'] = 11,	['ServerLv'] = 65 , ['ServerReincarnation'] = 0},
		{['Day'] = 16,	['ServerLv'] = 70 ,['ServerReincarnation'] = 0},
		{['Day'] = 23,	['ServerLv'] = 75 ,['ServerReincarnation'] = 0},
		{['Day'] = 32,	['ServerLv'] = 80 ,['ServerReincarnation'] = 0},
		{['Day'] = 44,	['ServerLv'] = 85, ['ServerReincarnation'] = 0},
		{['Day'] = 58,	['ServerLv'] = 90, ['ServerReincarnation'] = 0},
		{['Day'] = 74,	['ServerLv'] = 95, ['ServerReincarnation'] = 0},
		{['Day'] = 92,	['ServerLv'] = 100, ['ServerReincarnation'] = 0},
		{['Day'] = 112,	['ServerLv'] = 105,  ['ServerReincarnation'] = 0},
		{['Day'] = 134,	['ServerLv'] = 110,  ['ServerReincarnation'] = 0},
		{['Day'] = 158,	['ServerLv'] = 115,  ['ServerReincarnation'] = 0},
		{['Day'] = 184,	['ServerLv'] = 120,  ['ServerReincarnation'] = 0},
		{['Day'] = 99999,	['ServerLv'] = 120,  ['ServerReincarnation'] = 0},
		},
	['PlayerEXP'] = {
	--服务器转生-我的转生=-3
		[-3] = {
	--服务器等级-我的等级  Lower下限   Upper上限   ExpCoef经验修正  修正公式value*(ExpCoef/10000)
    --例：当前服务器等级100，我的等级85， 100 - 85  = 15， 命中 Lower=10  Upper=20， 如果配置 ExpCoef=20000，在此区间内角色获得经验翻倍
    --    当前服务器等级100，我的等级115，100 - 115 = -15，命中 Lower=-20 Upper=-10，如果配置 ExpCoef=5000， 在此区间内角色获得经验减半
    --	  当前服务器等级100，我的等级100，100 - 100 = 0，  命中 Lower=0 Upper=1，    如果配置 ExpCoef=0，    在此区间内角色不会获得经验
    --	 （等级差大于等于Lower且小于Upper时命中，上下限区间请勿重合，如果所有条件都不命中，则经验倍率调整为默认值100%）
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[-2] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[-1] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[0] = {
      		--梦幻版本无转生功能，生效配置皆以0表为准，其他表复制0表即可
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 11000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 12000,},
			{['Lower'] = 3,['Upper'] = 5,['ExpCoef'] = 13000,},
			{['Lower'] = 5,['Upper'] = 10,['ExpCoef'] = 15000,},
			{['Lower'] = 10,['Upper'] = 999,['ExpCoef'] = 20000,},
		},
		[1] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 20000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 20000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 20000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 20000,},
			{['Lower'] = 0,['Upper'] = 10,['ExpCoef'] = 20000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 20000,},
			{['Lower'] = 20,['Upper'] = 30,['ExpCoef'] = 20000,},
			{['Lower'] = 30,['Upper'] = 40,['ExpCoef'] = 20000,},
			{['Lower'] = 40,['Upper'] = 50,['ExpCoef'] = 20000,},
			{['Lower'] = 50,['Upper'] = 999,['ExpCoef'] = 20000,},
		},
		[2] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 25000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 25000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 25000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 25000,},
			{['Lower'] = 0,['Upper'] = 10,['ExpCoef'] = 25000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 26000,},
			{['Lower'] = 20,['Upper'] = 30,['ExpCoef'] = 26000,},
			{['Lower'] = 30,['Upper'] = 40,['ExpCoef'] = 26000,},
			{['Lower'] = 40,['Upper'] = 50,['ExpCoef'] = 26000,},
			{['Lower'] = 50,['Upper'] = 999,['ExpCoef'] = 27000,},
		},
		[3] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 45000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 45000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 45000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 45000,},
			{['Lower'] = 0,['Upper'] = 10,['ExpCoef'] = 45000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 46000,},
			{['Lower'] = 20,['Upper'] = 30,['ExpCoef'] = 46000,},
			{['Lower'] = 30,['Upper'] = 40,['ExpCoef'] = 46000,},
			{['Lower'] = 40,['Upper'] = 50,['ExpCoef'] = 46000,},
			{['Lower'] = 50,['Upper'] = 999,['ExpCoef'] = 47000,},
		},
	},
	['PetEXP'] = {
    	--宠物经验修正
		[-3] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[-2] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[-1] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 10000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 10000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 10000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 10000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 10000,},
		},
		[0] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 10000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 10000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 10000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 10000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 10000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 11000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 12000,},
			{['Lower'] = 3,['Upper'] = 5,['ExpCoef'] = 13000,},
			{['Lower'] = 5,['Upper'] = 10,['ExpCoef'] = 15000,},
			{['Lower'] = 10,['Upper'] = 999,['ExpCoef'] = 20000,},
		},
		[1] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 20000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 20000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 20000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 20000,},
			{['Lower'] = 0,['Upper'] = 1,['ExpCoef'] = 20000,},
			{['Lower'] = 1,['Upper'] = 2,['ExpCoef'] = 20000,},
			{['Lower'] = 2,['Upper'] = 3,['ExpCoef'] = 20000,},
			{['Lower'] = 3,['Upper'] = 10,['ExpCoef'] = 20000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 20000,},
			{['Lower'] = 20,['Upper'] = 999,['ExpCoef'] = 20000,},
		},
		[2] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 25000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 25000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 25000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 25000,},
			{['Lower'] = 0,['Upper'] = 10,['ExpCoef'] = 25000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 26000,},
			{['Lower'] = 20,['Upper'] = 30,['ExpCoef'] = 26000,},
			{['Lower'] = 30,['Upper'] = 40,['ExpCoef'] = 26000,},
			{['Lower'] = 40,['Upper'] = 50,['ExpCoef'] = 26000,},
			{['Lower'] = 50,['Upper'] = 999,['ExpCoef'] = 27000,},
		},
		[3] = {
			{['Lower'] = -999,['Upper'] = -50,['ExpCoef'] = 45000,},
			{['Lower'] = -50,['Upper'] = -20,['ExpCoef'] = 45000,},
			{['Lower'] = -20,['Upper'] = -10,['ExpCoef'] = 45000,},
			{['Lower'] = -10,['Upper'] = 0,['ExpCoef'] = 45000,},
			{['Lower'] = 0,['Upper'] = 10,['ExpCoef'] = 45000,},
			{['Lower'] = 10,['Upper'] = 20,['ExpCoef'] = 46000,},
			{['Lower'] = 20,['Upper'] = 30,['ExpCoef'] = 46000,},
			{['Lower'] = 30,['Upper'] = 40,['ExpCoef'] = 46000,},
			{['Lower'] = 40,['Upper'] = 50,['ExpCoef'] = 46000,},
			{['Lower'] = 50,['Upper'] = 999,['ExpCoef'] = 47000,},
		},
	},
}

-- 卡等级配置
 ServerLevel.LockLevel = {
 	--卡级后经验获取倍率
 	["ExpRatio"] = 1,
 	--存经验上限
 	["SaveExpLimit"] = 999999999999,
 	--卡的等级
 	["Level"] = {30,},
 }

function ServerLevel.on_add_exp(role, value, sender, reason, detail)

  --sLuaApp:NotifyTipsMsg(role, "获得了经验了啊")

	value = DoubleExp.on_pre_add_exp(role, value, sender, reason, detail)
	local multiplying = ServerLevel.get_exp_multiplying(role)
	value = math.floor(value * (multiplying/10000))
	if Assist then
		Assist.AddRecordExp(role, value)
	end
	value = ServerLevel.CheckLockLevel(role, value)

	return value
end

function ServerLevel.get_exp_multiplying(role)
	local multiplying = 10000
	if not role then
		return multiplying
	end
	if not ServerLevel.check_up() then
		sLuaApp:LuaErr("ServerLevel.on_add_exp erro check_up")
		return multiplying
	end
	local type_str = ""
	if role:GetType() == GUID_PLAYER then
		if FunctionSwitch.AllFuncitonConfig['PlayerExpCorrect'] ~= 'on' then
			return multiplying
		end
		type_str = "PlayerEXP"
	elseif role:GetType() == GUID_PET then
		if FunctionSwitch.AllFuncitonConfig['PetExpCorrect'] ~= 'on' then
			return multiplying
		end
		type_str = "PetEXP"
	else
		--sLuaApp:LuaErr("ServerLevel.get_exp_multiplying erro role非宠物或玩家")
		return multiplying
	end
	local tb = ServerLevel.get_serverlv_now()
	local server_rei = tb['server_rei']
	local server_level = tb['server_lv']
	local rol_rei = role:GetAttr(ROLE_ATTR_REINCARNATION)
	local role_level = role:GetAttr(ROLE_ATTR_LEVEL)
	local rei_difference = server_rei - rol_rei
	if ServerLevel.Config[''..type_str][rei_difference] then
		local level_difference = server_level - role_level
		for k,v in pairs(ServerLevel.Config[''..type_str][rei_difference]) do
			if not v['Lower'] or not v['Upper'] then
				sLuaApp:LuaErr("ServerLevel.get_exp_multiplying erro not v['Lower'] or not v['Upper']")
				return multiplying
			end
			if level_difference >= v['Lower'] and level_difference < v['Upper'] then 
				if v['ExpCoef'] >= 0 then
					return v['ExpCoef']
				else
					sLuaApp:LuaErr("ServerLevel.get_exp_multiplying erro v['ExpCoef'] <= 0")
					return multiplying
				end
			end
		end
	else
		sLuaApp:LuaErr("ServerLevel.get_exp_multiplying erro 转生差等级配置不存在")
		return multiplying
	end
	
	sLuaApp:LuaErr("ServerLevel.get_exp_multiplying role erro 跳出所有判断")
	return multiplying
end

function ServerLevel.check_up()
	if FunctionSwitch.AllFuncitonConfig['ServerLevel'] ~= 'on' then
		return false
	end
	local tb = ServerLevel.get_serverlv_now()
	if tb['server_rei'] == -1 then 
		sLuaApp:LuaErr("ServerLevel.check_up erro ServerLevel.get_server_reincarnation() == -1")
		return false
	end
	if tb['server_lv'] == -1 then 
		sLuaApp:LuaErr("ServerLevel.check_up erro ServerLevel.get_server_level() == -1")
		return false
	end
	if not ServerLevel.Config then
		return false
	end
	if not ServerLevel.Config['ServerLevel'] then
		return false
	end
	if not ServerLevel.Config['PlayerEXP'] then
		return false
	end
	if not ServerLevel.Config['PetEXP'] then
		return false
	end
	
	return true
end

function ServerLevel.get_servertime_day()
	return math.ceil((sLuaApp:GetTimes() - sLuaApp:Str2DateTime(ConstVarConfig["StartServerTime"].Value))/(60*60*24))
end 

function ServerLevel.get_serverlv_now()
	local tb = {}
	local servertime_day = ServerLevel.get_servertime_day()
	local server_rei = -1
	local server_lv = -1
	for k,v in pairs(ServerLevel.Config['ServerLevel']) do 
		if servertime_day <= v['Day'] then
			server_rei = v['ServerReincarnation']
			server_lv = v['ServerLv']
			
			break
		end
	end
	tb['server_rei'] = server_rei
	tb['server_lv'] = server_lv
	return tb
end

function ServerLevel.get_serverlv_next()
	local tb = {}
	local servertime_day = ServerLevel.get_servertime_day()
	local next_server_rei = -1
	local next_server_lv = -1
	local next_server_sec = -1
	for i = 1 , #ServerLevel.Config['ServerLevel'] ,1 do 
		if servertime_day <= ServerLevel.Config['ServerLevel'][i]['Day'] then
			if ServerLevel.Config['ServerLevel'][i+1] then
				next_server_lv = ServerLevel.Config['ServerLevel'][i+1]['ServerLv']
				next_server_rei = ServerLevel.Config['ServerLevel'][i+1]['ServerReincarnation']
				next_server_sec = (ServerLevel.Config['ServerLevel'][i]['Day'])*24*60*60 - (sLuaApp:GetTimes() - sLuaApp:Str2DateTime(ConstVarConfig["StartServerTime"].Value))
				
				break
			else
				next_server_lv = 0
				next_server_rei = 0
				next_server_sec = 0
				
				break
			end
		end
	end
	tb['next_server_lv'] = next_server_lv
	tb['next_server_rei'] = next_server_rei
	tb['next_server_sec'] = next_server_sec
	return tb
end

function ServerLevel.get_function_switch(player)
	local str = [[
		if NormalBuffUI then
			NormalBuffUI.ServerLevelFunctionState(']]..FunctionSwitch.AllFuncitonConfig['ServerLevel']..[[' , ]]..ServerLevel.Config['ShowLevel']..[[)
		end
	]]
	sLuaApp:ShowForm(player,"脚本表单", str)
end

function ServerLevel.get_level_by_client(player)
	local tb = {}
	local tb_now = ServerLevel.get_serverlv_now()
	local tb_next = ServerLevel.get_serverlv_next()
	tb['server_rei'] = tb_now['server_rei']
	tb['server_lv'] = tb_now['server_lv']
	tb['next_server_lv'] = tb_next['next_server_lv']
	tb['next_server_rei'] = tb_next['next_server_rei']
	tb['next_server_sec'] = tb_next['next_server_sec']
	local str = [[
		if NormalBuffUI then
			NormalBuffUI.RefreshServerLevelData(]]..Lua_tools.serialize(tb)..[[)
		end
	]]
	sLuaApp:ShowForm(player,"脚本表单", str)
end

--设置卡的等级
function ServerLevel.SetLockLevel(player)
	if ServerLevel.LockLevel and ServerLevel.LockLevel["Level"] then
		if player:GetInt("ServerLevel_LockLevel") ~= 0 then
			return
		end
		local now_level = player:GetAttr(ROLE_ATTR_LEVEL)
		for _,v in ipairs(ServerLevel.LockLevel["Level"]) do
			if v >= now_level then
				player:SetInt("ServerLevel_LockLevel", v)
				break
			end
		end
	end
end
--加经验时判断卡等级
function ServerLevel.CheckLockLevel(player, value)
	if not ServerLevel.LockLevel then
		return value
	end
	if player:GetType() ~= GUID_PLAYER then
		return value
	end
	local lock_level = player:GetInt("ServerLevel_LockLevel")

	
	if lock_level ~= 0 then
		local now_level = player:GetAttr(ROLE_ATTR_LEVEL)--获取玩家等级  5级
		if now_level >= lock_level then  --判断是否等于卡等级的级别 
			local save_exp = player:GetInt("ServerLevel_SaveExp") + math.floor(value * ServerLevel.LockLevel["ExpRatio"]) --计算储备经验值
			local now_exp = player:GetAttr(ROLE_ATTR_EXP)--获取玩家当前经验
			if now_exp > 0 then  --如果大于0 
				player:SubExp(now_exp, "system", "卡等级", "扣除当前经验作为存储经验") --扣除当前所有经验
				save_exp = save_exp + math.floor(now_exp * ServerLevel.LockLevel["ExpRatio"]) --变量经验+玩家当前经验
				--sLuaApp:NotifyTipsMsgEx(player, "当前经验已转换为存储经验")
			end
			if ServerLevel.LockLevel["SaveExpLimit"] then   --获取最大经验值
				if save_exp > ServerLevel.LockLevel["SaveExpLimit"] then   --变量储存经验大于服务器最大值
					save_exp = ServerLevel.LockLevel["SaveExpLimit"]  --每次都set为最大值
				end
			end
			player:SetInt("ServerLevel_SaveExp", save_exp) -- 设置经验到变量
			value = 0
		end
	end
	return value
end

--突破成功
function ServerLevel.LevelPromote(player)
	local save_exp = player:GetInt("ServerLevel_SaveExp")
	player:SetInt("ServerLevel_LockLevel", 0)
	player:SetInt("ServerLevel_SaveExp", 0)
	player:AddExp(save_exp, "system", "卡等级", "存储经验")
	sLuaApp:NotifyTipsMsgEx(player, "已提取存储经验")
end