--宠物洗练
PetRefining = {}

--洗练消耗
PetRefining.Consume = {
	--基础洗练消耗
	["RefiningItem"] = {"普通洗练符", 1},
	--高级洗练消耗
	["RefiningItemEx"] = {"高级洗练符", 1},
	--洗练锁定消耗 锁定1-5个资质，改变消耗数量
	["LockItemKeyname"] = "洗练锁定符",
	["LockItemNum"] = {1,2,4,8,16},
}

--洗练属性变化范围 {min, max}   
-- min>max时，随机数值前会互换位置 --随机得到的值不会大于attr属性值上限
-- NowAttrVal 当前attr属性值 -- MaxAttrVal attr属性值上限（需在PetUpStarConfig.IntConfig表中配置） 
--Diff = MaxAttrVal - NowAttrVal
PetRefining.AttrChange = {
	["血量资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
	["物攻资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
	["法攻资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
	["物防资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
	["法防资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
	["速度资质"] = {"math.max(-190, -0.1 * NowAttrVal + 0.01 * Diff)", "math.min(200,  0.1 * NowAttrVal + 0.01 * Diff)"},
}
-- 高级·洗练属性变化范围
PetRefining.AttrChangeEx = {
	["血量资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
	["物攻资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
	["法攻资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
	["物防资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
	["法防资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
	["速度资质"] = {"math.max(-150, -0.1 * NowAttrVal + 0.02 * Diff)", "math.min(240,  0.1 * NowAttrVal + 0.02 * Diff)"},
}


--属性变化颜色 
--洗练增加的属性值 < 当前值的万分比时 显示字体颜色和进度条图片id
PetRefining.AttrColor = {
	[0] = {"#FF0000ff", 1800408120}, --红色
	[50] = {"#46DC5Fff", 1800408160}, --绿色
	[115] = {"#42B1F0ff", 1800408130}, --蓝色
	[180] = {"#f08bffff", 1800408150}, --紫色
	[99999] = {"#FF8700ff", 1800408140}, --橙色
}

PetRefining.TalentFunc = {
	["血量资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetHpTalent()
		elseif mod == "Add" then
			return pet:AddPetHpTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetHpTalent(value)
		end
		return false
	end,
	["法术资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetMpTalent()
		elseif mod == "Add" then
			return pet:AddPetMpTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetMpTalent(value)
		end
		return false
	end,
	["速度资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetSpeedTalent()
		elseif mod == "Add" then
			return pet:AddPetSpeedTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetSpeedTalent(value)
		end
		return false
	end,
	["物攻资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetPhyAtkTalent()
		elseif mod == "Add" then
			return pet:AddPetPhyAtkTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetPhyAtkTalent(value)
		end
		return false
	end,
	["物防资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetPhyDefTalent()
		elseif mod == "Add" then
			return pet:AddPetPhyDefTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetPhyDefTalent(value)
		end
		return false
	end,
	["法攻资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetMagAtkTalent()
		elseif mod == "Add" then
			return pet:AddPetMagAtkTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetMagAtkTalent(value)
		end
		return false
	end,
	["法防资质"] = function(pet, mod, value)
		if mod == "Get" then
			return pet:GetPetMagDefTalent()
		elseif mod == "Add" then
			return pet:AddPetMagDefTalent(value)
		elseif mod == "Sub" then
			return pet:SubPetMagDefTalent(value)
		end
		return false
	end,
}

function PetRefining.GetData(player)
	local str = [[
		if PetUI then
			PetUI.PetRefiningConsume = ]]..Lua_tools.serialize(PetRefining.Consume)..[[
			PetUI.PetRefiningAttrColor = ]]..Lua_tools.serialize(PetRefining.AttrColor)..[[
			PetUI.Refresh()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetRefining.GetAttrChange(player, pet_guid)
	if not pet_guid then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not PetRefining.CheckPet(player, pet) then return end
	local attr_change_tb = {}
	for k,_ in pairs(PetRefining.AttrMaxIntKey) do
		local change_num = pet:GetInt("PetRefining_AttrChange_"..k)
		attr_change_tb[k] = change_num
	end
	local str = [[
		if PetUI then
			PetUI.PetAttrChange = ]]..Lua_tools.serialize(attr_change_tb)..[[
			PetUI.RefreshClearPanel()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--洗练 -- is_major 0 普通洗练 1 高级洗练  -- lock_str  "1,3,4" 表示选择锁定第1、3、4条资质  @newinter PetRefining.StartRefining(player, 432733182686986242, 1, "")
function PetRefining.StartRefining(player, pet_guid, is_major, lock_str)
	if not pet_guid or not is_major or not lock_str then return end
	--判断参数
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not PetRefining.CheckPet(player, pet) then return end
	
	local lock_tb = sLuaApp:StrSplit(lock_str, ",") 
	if #lock_tb >= #PetUpStarConfig.IntConfig then
		sLuaApp:NotifyTipsMsg(player, "最多锁定"..(#PetUpStarConfig.IntConfig-1).."条属性！")
		return
	end
	
	local attr_change_config = {}
	local attr_lock_tb = {}
	--判断消耗
	local consume_tb = Lua_tools.DupTable(PetRefining.Consume["RefiningItem"])
	is_major = tonumber(is_major)
	if is_major == 0 then
		attr_change_config = PetRefining.AttrChange
	elseif is_major == 1 then
		for _,v in ipairs(PetRefining.Consume["RefiningItemEx"]) do
			table.insert(consume_tb, v)
		end
		attr_change_config = PetRefining.AttrChangeEx
	else
		sLuaApp:LuaErr("PetRefining.StartRefining is_major错误"..is_major)
		return
	end
	if next(lock_tb) then
		table.insert(consume_tb, PetRefining.Consume["LockItemKeyname"])
		table.insert(consume_tb, PetRefining.Consume["LockItemNum"][#lock_tb])
		
		for _,v in ipairs(lock_tb) do
			local int_config = PetUpStarConfig.IntConfig[tonumber(v)]
			if int_config then
				attr_lock_tb[int_config[4]] = true
			end
		end
	end
	--sLuaApp:LuaErr("consume_tb  "..Lua_tools.serialize(consume_tb))
	--sLuaApp:LuaErr("attr_lock_tb  "..Lua_tools.serialize(attr_lock_tb))
	
	if not Lua_tools.IsItemEnough(player, consume_tb) then
		--快速购买
		if OneKeyBuy then
			local defect_consume_tb = Lua_tools.GetDefectList(player, consume_tb)
			if OneKeyBuy.Main(player, defect_consume_tb) then
				return
			end
		end
		sLuaApp:NotifyTipsMsg(player, "您的洗练材料不足！")
		return
	end
	
	-- 扣消耗
	if not Lua_tools.SubItem(player, consume_tb, "system", "宠物洗练", "洗练消耗") then
		sLuaApp:LuaErr("PetRefining.StartRefining SubItem失败")
	end
	
	-- 洗练属性 存起来
	if next(attr_change_config) then
		for k,v in pairs(attr_change_config) do
			-- local attr_data = AttrConfig.GetByKeyName(k)
			-- if not attr_data then
				-- sLuaApp:LuaErr("PetRefining  AttrConfig缺少"..k)
				-- return
			-- end
			-- local attr_id = attr_data.Id
			if attr_lock_tb[k] then
				pet:SetInt("PetRefining_AttrChange_"..k, 0)
			else
				local res_num = PetRefining.RewardConfigToNmber(pet, k, v)
				--sLuaApp:LuaErr("attr ".. k.."  res_num"..res_num)
				pet:SetInt("PetRefining_AttrChange_"..k, res_num)
			end
		end
	end
	
	PetRefining.GetAttrChange(player, pet_guid)
end


-- 保存洗出来的属性 @newinter PetRefining.SeveAttr(player, 432733154626371585)
function PetRefining.SeveAttr(player, pet_guid)
	if not pet_guid then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not PetRefining.CheckPet(player, pet) then return end
	--local mark = PetAttrClassify['PetRefining'] or 41
	for k,_ in pairs(PetRefining.AttrMaxIntKey) do
		local change_num = pet:GetInt("PetRefining_AttrChange_"..k)
		--local now_attr_val = pet:GetDynAttr(mark, k)
		if change_num > 0 then
			if not PetRefining.TalentFunc[k](pet, "Add", change_num) then
				sLuaApp:LuaErr("PetRefining.SeveAttr TalentFunc Add错误 "..k)
			end
		elseif change_num < 0 then
			if not PetRefining.TalentFunc[k](pet, "Sub", math.abs(change_num)) then
				sLuaApp:LuaErr("PetRefining.SeveAttr TalentFunc Sub错误 "..k)
			end
		end
		--pet:SetDynAttr(mark, k, now_attr_val + change_num)
		pet:SetInt("PetRefining_AttrChange_"..k, 0)
	end
	pet:RecalcAttr()

	local str = [[
		if PetUI then
			PetUI.RefreshSavePetAttr()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetRefining.CheckPet(player, pet)
	if not pet then
		sLuaApp:LuaErr("PetRefining 不存在宠物 ")
		return false
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetRefining "..pet:GetGUID().." 不属于 "..player:GetName())
		return false
	end
	return true
end

--配置转数字
function PetRefining.RewardConfigToNmber(pet, attr_keyname, add_num)
	local res_num = 0
	local NowAttrVal = PetRefining.TalentFunc[attr_keyname](pet, "Get")
	local MaxAttrVal = pet:GetInt(PetRefining.AttrMaxIntKey[attr_keyname])
	local Diff = MaxAttrVal - NowAttrVal
	local str_factor = [[
		local NowAttrVal = ]]..NowAttrVal..[[
		local MaxAttrVal = ]]..MaxAttrVal..[[
		local Diff = ]]..Diff..[[
	]]
	if type(add_num) == "table" then
		local min_num = add_num[1]
		local max_num = add_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	else
		sLuaApp:LuaErr("PetRefining.RewardConfigToNmber  ")
		return 0
	end
	if res_num > Diff then
		res_num = Diff
	end
	return math.floor(res_num)
end


function PetRefining.Initialization()
	if not PetUpStarConfig then
		require("pet/PetUpStarConfig")
	end
	if not PetUpStarConfig.IntConfig then
		sLuaApp:LuaErr("PetRefining.Initialization() 缺少 PetUpStarConfig.IntConfig")
		return
	end
	PetRefining.AttrMaxIntKey = {}
	for _,v in ipairs(PetUpStarConfig.IntConfig) do
		PetRefining.AttrMaxIntKey[v[4]] = v[1]
	end
	--sLuaApp:LuaErr("PetRefining.AttrMaxIntKey  "..Lua_tools.serialize(PetRefining.AttrMaxIntKey))
end
PetRefining.Initialization()