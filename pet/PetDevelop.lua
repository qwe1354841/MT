--宠物养成 
PetDevelop = {}

function PetDevelop.MedicineGetData(player)
	sLuaApp:ShowForm(player, "脚本表单", PetDevelopConfig.MedicineGetDataStr)
end
function PetDevelop.SkillStudyGetData(player)
	sLuaApp:ShowForm(player, "脚本表单", PetDevelopConfig.SkillStudyGetDataStr)
end
function PetDevelop.RestoreGetData(player)
	sLuaApp:ShowForm(player, "脚本表单", PetDevelopConfig.RestoreGetDataStr)
end
function PetDevelop.SkillExtractGetData(player)
	sLuaApp:ShowForm(player, "脚本表单", PetDevelopConfig.SkillExtractGetDataStr)
end
function PetDevelop.SkillBindGetData(player)
	sLuaApp:ShowForm(player, "脚本表单", PetDevelopConfig.SkillBindGetDataStr)
end

--判断版本
function PetDevelop.CheckVersion(player, version)
	if version then
		if version == PetDevelopConfig.Version then
			return true
		end
	end
	PetDevelop.MedicineGetData(player)
	PetDevelop.SkillStudyGetData(player)
	PetDevelop.RestoreGetData(player)
	PetDevelop.SkillExtractGetData(player)
	PetDevelop.SkillBindGetData(player)
	sLuaApp:NotifyTipsMsg(player, "宠物养成数据已更新，请重试！")
	return false
end

---- 宠物培养 ---- 使用物品
function PetDevelop.MedicineUseItem(player, pet_guid, item_keyname, use_num, version, check_mod) -- check_mod 判断是否已经确认过
	if not pet_guid or not item_keyname or not use_num then return end
	use_num = tonumber(use_num)
	if use_num < 0 then return end
	
	--判断版本
	if not PetDevelop.CheckVersion(player, version) then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	--判断战斗中
	if not PetDevelop.CheckFight(pet) then return end
	local pet_data = PetConfig.GetById(pet:GetId())
	if not PetDevelopConfig.MedicinePetTypeEx[pet_data.Type] then
		sLuaApp:LuaErr("PetDevelop.MedicineUseItem  宠物type不符 "..pet_guid)
		return
	end
	--判断物品
	local medicine_config = PetDevelop.MedicineItem[item_keyname]
	if not medicine_config then
		sLuaApp:LuaErr("PetDevelop.MedicineItem 不存在 "..item_keyname)
		return
	end
	
	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not item_data then
		sLuaApp:LuaErr("PetDevelop  ItemConfig 不存在 ".. item_keyname)
		return
	end
	local item_id = item_data.Id

	local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3)
	if has_item_num < use_num then
		sLuaApp:NotifyTipsMsg(player, "物品数量不足！")
		return
	end
	--判断单次使用上限
	local once_use_max_num = medicine_config["OnceMaxNum"] or 1
	if use_num > once_use_max_num then
		sLuaApp:NotifyTipsMsg(player, item_data.Name.."一次最多使用"..once_use_max_num.."个")
		return 
	end
	
	--判断是否到使用次数上限
	local max_limit =  medicine_config["MaxLimit"]
	if max_limit ~= -1 then
		local used_item_num = pet:GetInt("PetDevelop_MedicineItemUsedNum_"..item_id)
		if used_item_num >= max_limit then
			sLuaApp:NotifyTipsMsg(player, PetDevelop.GetColor(item_data.Name,"Red").."已达使用上限！")
			return
		end
		if used_item_num + use_num > max_limit then
			local surplus_num = max_limit - used_item_num
			local msg = PetDevelop.GetColor(item_data.Name,"Red").."的剩余使用次数为"..PetDevelop.GetColor(surplus_num,"Red").."，是否使用？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.MedicineUseItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..",'"..item_keyname.."',"..surplus_num..",'"..version.."',0)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
	end

	--判断使用后是否超属性上限 
	local effect_config = medicine_config["Effect"]
	for k,v in ipairs(effect_config) do
		if type(v) == "string" then
			local effect_value = effect_config[k+1]
			if PetDevelop.MedicineItemCheckMaxFunc[v] then
				if type(effect_value) ~= "number" then -- 随机数值 上限难以判断
					sLuaApp:LuaErr("PetDevelop.MedicineUseItem  "..v.." 配置不支持 非数字")
					return
				end
				if not PetDevelop.MedicineItemCheckMaxFunc[v](player, pet, item_keyname, use_num, check_mod or 0, math.floor(effect_value), version) then
					return
				end
			elseif PetRefining.AttrMaxIntKey[v] then --资质相关
				if not PetDevelop.MedicineItemCheckMaxFunc["当前资质"](player, pet, item_keyname, use_num, check_mod or 0, v, effect_value, version) then
					return
				end
			else
				if not PetDevelop.MedicineItemCheckMaxFunc["Attr"](player, pet, item_keyname, use_num, check_mod or 0, v, effect_value, version) then
					return
				end
			end
		end
	end
	
	--消耗物品
	if sItemSystem:ConsumeItemWithPriority(player, item_id, use_num, true, "system", "宠物培养", pet_guid.."使用"..item_keyname)["code"] ~= 0 then
		sLuaApp:LuaErr("PetDevelop.MedicineUseItem  ConsumeItemWithPriority 错误")
		return
	end
	
	--产生具体效果
	for k,v in ipairs(effect_config) do
		if type(v) == "string" then
			local effect_value = effect_config[k+1]
			if PetDevelop.MedicineItemUseFunc[v] then
				if not PetDevelop.MedicineItemUseFunc[v](pet, use_num, math.floor(effect_value)) then
					return
				end
			elseif PetRefining.AttrMaxIntKey[v] then --资质相关
				if not PetDevelop.MedicineItemUseFunc["当前资质"](pet, use_num, v, effect_value) then
					return
				end
			else
				if not PetDevelop.MedicineItemUseFunc["Attr"](pet, use_num, v, effect_value) then
					sLuaApp:LuaErr("PetDevelop.MedicineUseItem  MedicineItemUseFunc 失败 pet_guid"..pet_guid.."  effect" ..k)
					return
				end
			end
		end
	end
	--记录使用物品次数
	pet:SetInt("PetDevelop_MedicineItemUsedNum_"..item_id, pet:GetInt("PetDevelop_MedicineItemUsedNum_"..item_id) + use_num)
	--重计算
	pet:RecalcAttr()
	--通知刷新
	-- local str = [[
		-- if PetUI then
			-- PetUI.RefreshTrainingTab()
		-- end
	-- ]]
	-- sLuaApp:ShowForm(player, "脚本表单", str)
end


-- 判断使用后是否超属性上限 
PetDevelop.MedicineItemCheckMaxFunc = {
	["经验"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		local global_data = GlobalConfig.GetById(1)
		local PetPlayerFightLevel = global_data.PetMaxBattleLvAbove -- 相差X级无法出战
		local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
		local fight_check_level = player_level + PetPlayerFightLevel
		
		local now_level = pet:GetAttr(ROLE_ATTR_LEVEL)
		if now_level >= PetDevelop.PetMaxLevel then
			-- local pet_grade = PetConfig.GetById(pet:GetId()).Type
			-- sLuaApp:NotifyTipsMsg(player, "宠物"..PetDevelop.GetLinkFunc["Pet"](pet:GetName(), player:GetGUID(), pet:GetGUID(), pet_grade).."已达等级上限！")
			sLuaApp:NotifyTipsMsg(player, "宠物已达等级上限！")
			return false
		end
		
		local use_exp = 0
		local level = now_level
		local now_exp = pet:GetAttr(ROLE_ATTR_EXP)		
		local now_level_need_exp = PetLevelConfig.GetByLevelReincarnation(level, 0).UpgradeExp
		effect_value = math.floor(effect_value * ((ServerLevel.get_exp_multiplying(pet) or 10000)/10000))
		-- 由于服务器等级是按加经验之前算的，所以直接使用十次和使用十个一次相同经验丹，最终加的经验可能不同。但是不管，贺振坤说的，2021-11-16 10:51:14
		-- 物品经验丹也走服务器等级，可能会存在，玩家存经验丹，等服务器等级赔率高了之后再吃的情况。但是不管，贺振坤说的，2021-11-16 10:53:21
		local get_exp_val = use_num * effect_value
		local use_exp = now_level_need_exp - now_exp --升完当前等级需要的经验值
		local surplus_exp = get_exp_val - use_exp --升完当前等级剩余的经验量
		if surplus_exp <= 0 then
			return true
		end
		--sLuaApp:LuaErr("get_exp_val "..get_exp_val)
		while surplus_exp > 0 do
			if level >= PetDevelop.PetMaxLevel then
				break
			end
			level = level +1	
			
			local levelup_need_exp = PetLevelConfig.GetByLevelReincarnation(level, 0).UpgradeExp
			surplus_exp = surplus_exp - levelup_need_exp
			if surplus_exp >=  0 then
				use_exp = use_exp + levelup_need_exp
			else
				use_exp = use_exp + surplus_exp + levelup_need_exp				
			end
		end
		
		if level > fight_check_level and check_mod == 0 and now_level <= fight_check_level then			
			local item_data = ItemConfig.GetByKeyName(item_keyname)
			local msg =	PetDevelop.GetColor(item_data.Name,"Red").."使用后，宠物等级将超过您等级"..PetPlayerFightLevel.."级,将无法上阵，您是否确认对宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."使用该道具？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.MedicineUseItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet:GetGUID()..",'"..item_keyname.."',"..use_num..",'"..version.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return false
		end
		
		local can_use_num = math.ceil(use_exp / effect_value)
		--sLuaApp:LuaErr("can_use_num"..can_use_num)
		if level >= PetDevelop.PetMaxLevel and can_use_num ~= use_num then
			PetDevelop.MedicineUseItem(player, pet:GetGUID(), item_keyname, can_use_num, version) --如果用完超等级上限 直接用
			return false
		end
		return true
	end,
	
	["宠物寿命"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		local pet_data = PetConfig.GetById(pet:GetId())
		local max_life = pet_data.Life
		
		if max_life == -1 then
			sLuaApp:NotifyTipsMsg(player, "宠物永生，无需用药！")
			return false
		end
		
		local now_life = pet:GetPetLife()
		if now_life >= max_life then
			sLuaApp:NotifyTipsMsg(player, "宠物寿命已满，无需用药！")
			return false
		end
		if now_life == 0 then
			sLuaApp:NotifyTipsMsg(player, "宠物已亡，请使用复活药！")
			return false
		end
		
		local get_life_val = use_num * effect_value
		local diff_life = max_life - now_life
		if diff_life >= get_life_val then
			return true
		end
		if diff_life % effect_value == 0 then
			PetDevelop.MedicineUseItem(player, pet:GetGUID(), item_keyname, diff_life // effect_value, version)
			return false
		end
		if check_mod == 0 then
			local can_use_num = math.ceil(diff_life / effect_value)
			local item_data = ItemConfig.GetByKeyName(item_keyname)
			local msg =	"当前最多使用"..PetDevelop.GetColor(can_use_num,"Red").."个"..PetDevelop.GetColor(item_data.Name,"Red").."，使用后宠物寿命将超出上限，超出部分不会保留，是否确定对宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."使用？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.MedicineUseItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet:GetGUID()..",'"..item_keyname.."',"..can_use_num..",'"..version.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return false
		end
		return true
	end,
	["复活"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		local pet_data = PetConfig.GetById(pet:GetId())
		local max_life = pet_data.Life
		
		if max_life == -1 then
			sLuaApp:NotifyTipsMsg(player, "宠物永生，无需用药！")
			return false
		end
		local now_life = pet:GetPetLife()
		if now_life ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "宠物未亡，无需用药！")
			return false
		end
		if use_num ~= 1 then
			sLuaApp:NotifyTipsMsg(player, "宠物复活药，起死回生，一次一粒！")
			return false
		end
		return true
	end,
	["宠物忠诚度"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		--local pet_data = PetConfig.GetById(pet:GetId())
		local global_data = GlobalConfig.GetById(1)
		local max_close_point = global_data.PetClosePointsMax

		local now_close_point = pet:GetPetLoyalty()
		if now_close_point >= max_close_point then
			sLuaApp:NotifyTipsMsg(player, "宠物忠诚度已达最大值，无需用药！")
			return false
		end
		
		local get_close_point_val = use_num * effect_value
		local diff_close_point = max_close_point - now_close_point
		if diff_close_point >= get_close_point_val then
			return true
		end
		if diff_close_point % effect_value == 0 then
			PetDevelop.MedicineUseItem(player, pet:GetGUID(), item_keyname, diff_close_point // effect_value, version)
			return false
		end
		if check_mod == 0 then
			local can_use_num = math.ceil(diff_close_point / effect_value)
			local item_data = ItemConfig.GetByKeyName(item_keyname)
			local msg =	"当前最多使用"..PetDevelop.GetColor(can_use_num,"Red").."个"..PetDevelop.GetColor(item_data.Name,"Red").."，使用后宠物忠诚度将超出上限，超出部分不会保留，是否确定对宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."使用？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.MedicineUseItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet:GetGUID()..",'"..item_keyname.."',"..can_use_num..",'"..version.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return false
		end
		return true
	end,
	["洗点"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		if use_num ~= 1 then
			sLuaApp:NotifyTipsMsg(player, "该物品只能一次一粒！")
			return false
		end
		if AddPoint and AddPoint.Pet_ResetPoint then
			AddPoint.Pet_ResetPoint(player, pet:GetGUID())
			return false
		end
		return false
	end,
	["属性转换"] = function(player, pet, item_keyname, use_num, check_mod, effect_value, version)
		if AttrTransform and AttrTransform.Point_Transform then
			return AttrTransform.Point_Transform(pet, item_keyname)
		end
		return false
	end,
	["当前资质"] = function(player, pet, item_keyname, use_num, check_mod, attr_keyname, effect_value, version)
		local talent_max = pet:GetInt(PetRefining.AttrMaxIntKey[attr_keyname])
		local talent_num = PetRefining.TalentFunc[attr_keyname](pet, "Get", 0)
		if talent_num >= talent_max then
			local attr_data = AttrConfig.GetByKeyName(attr_keyname)
			sLuaApp:NotifyTipsMsg(player, "宠物".. attr_data.ChinaName .."已达最大值！")
			return false
		end
		
		local effect_value_type = type(effect_value)
		if use_num > 1 and effect_value_type ~= "number" then
			sLuaApp:NotifyTipsMsg(player, "随机数值物品不可多个使用")
			return false
		end
		--使用多次的按钮 失效需要在客户端判断，部分提示判断在客户端
		local diff_num = talent_max - talent_num
		if effect_value_type == "number" then
			if use_num == 1 then
				return true
			elseif use_num > 1 then
				local can_use_num = math.floor(diff_num / effect_value)
				if use_num <= can_use_num then
					return true
				else
					PetDevelop.MedicineUseItem(player, pet:GetGUID(), item_keyname, can_use_num, version)
					return false
				end
			end
		end
		return true
	end,
	["Attr"] = function(player, pet, item_keyname, use_num, check_mod, attr_keyname, effect_value, version)
		local attr_data = AttrConfig.GetByKeyName(attr_keyname)
		if not attr_data then
			sLuaApp:LuaErr("PetDevelop MedicineItemCheckMaxFunc AttrConfig 不存在"..attr_keyname)
			return false
		end
		return true
	end,
}

PetDevelop.MedicineItemUseFunc = {
	["经验"] = function(pet, use_num, effect_value)
		local add_num = use_num * effect_value
		local show_num = math.floor(add_num * ((ServerLevel.get_exp_multiplying(pet) or 10000)/10000))
		if pet:AddExp(add_num,"system","宠物培养","使用经验丹") then
			local owner = pet:GetOwner()
			sLuaApp:NotifyTipsMsg(owner, "宠物经验增加"..show_num.."点！")
			return true
		end
		return false
	end,
	["宠物寿命"] = function(pet, use_num, effect_value)
		local add_num = PetDevelop.AddLife(pet, use_num * effect_value,"system","宠物培养","使用寿命丹")
		if add_num then
			local owner = pet:GetOwner()
			sLuaApp:NotifyTipsMsg(owner, "提升宠物寿命"..add_num.."点！")
			return true
		end
		return false
	end,
	["复活"] = function(pet, use_num, effect_value)
		local add_num = PetDevelop.AddLife(pet, use_num * effect_value,"system","宠物培养","使用复活药")
		if add_num then
			local owner = pet:GetOwner()
			sLuaApp:NotifyTipsMsg(owner, "复活并提升宠物寿命"..add_num.."点！")
			return true
		end
		return false
	end,
	["宠物忠诚度"] = function(pet, use_num, effect_value)
		local add_num = PetDevelop.AddLoyalty(pet, use_num * effect_value,"system","宠物培养","使用忠诚药")
		if add_num then
			local owner = pet:GetOwner()
			sLuaApp:NotifyTipsMsg(owner, "提升宠物忠诚度"..add_num.."点！")
			return true
		end
		return false
	end,
	["洗点"] = function(pet, use_num, effect_value)
		return true
	end,
	["属性转换"] = function(pet, use_num, effect_value)
		return true
	end,
	["当前资质"] = function(pet, use_num, attr_keyname, effect_value)
		local talent_max = pet:GetInt(PetRefining.AttrMaxIntKey[attr_keyname])
		local talent_num = PetRefining.TalentFunc[attr_keyname](pet, "Get", 0)
		local diff_talent = talent_max - talent_num
		
		local add_num = PetDevelop.GetEffectValue(use_num, effect_value)
		if add_num > diff_talent then
			add_num = diff_talent
		end
		local owner = pet:GetOwner()
		local attr_data = AttrConfig.GetByKeyName(attr_keyname)
		if add_num >= 0 then
			PetRefining.TalentFunc[attr_keyname](pet, "Add", add_num)
			sLuaApp:NotifyTipsMsg(owner, "提升宠物"..attr_data.ChinaName..add_num.."点！")
		else
			add_num = math.abs(add_num)
			PetRefining.TalentFunc[attr_keyname](pet, "Sub", add_num)
			sLuaApp:NotifyTipsMsg(owner, "降低宠物"..attr_data.ChinaName..add_num.."点！")
		end
		return true
	end,

	["剩余属性点"] = function(pet, use_num, effect_value)
		local add_num = PetDevelop.GetEffectValue(use_num, effect_value)
		local owner = pet:GetOwner()
		if pet:AddRemainPoint(add_num) then
			pet:SetInt("Pet_AddRemainPoint", pet:GetInt("Pet_AddRemainPoint") + add_num)
			sLuaApp:NotifyTipsMsg(owner, "提升宠物剩余属性点"..add_num.."点！")
			return true
		else
			sLuaApp:NotifyTipsMsg(owner, "提升宠物剩余属性点失败")
			return false
		end
	end,

	["Attr"] = function(pet, use_num, attr_keyname, effect_value)
		local attr_data = AttrConfig.GetByKeyName(attr_keyname)
		local attr_id = attr_data.Id
		local mark = PetAttrClassify['PetDevelop'] or 41
		local has_attr_val = pet:GetDynAttr(mark, attr_id)
		local add_num = PetDevelop.GetEffectValue(use_num, effect_value)
		pet:SetDynAttr(mark, attr_id, has_attr_val + add_num)
		local owner = pet:GetOwner()
		if add_num >= 0 then
			sLuaApp:NotifyTipsMsg(owner, "提升宠物"..attr_data.ChinaName..add_num.."点！")
		else
			sLuaApp:NotifyTipsMsg(owner, "降低宠物"..attr_data.ChinaName..math.abs(add_num).."点！")
		end
		return true
	end,
}

function PetDevelop.AddLife(pet, add_num, sender, reason, detail)
	local pet_data = PetConfig.GetById(pet:GetId())
	local max_life = pet_data.Life
	local now_life = pet:GetPetLife()
	local add_life = math.min(max_life - now_life, add_num)
	if pet:AddPetLife(add_life, sender, reason, detail) then
		return add_life
	else
		return false
	end
end

function PetDevelop.AddLoyalty(pet, add_num, sender, reason, detail)
	local global_data = GlobalConfig.GetById(1)
	local max_close_point = global_data.PetClosePointsMax
	local now_close_point = pet:GetPetLoyalty()
	local add_close_point = math.min(max_close_point - now_close_point, add_num)
	if pet:AddPetLoyalty(add_close_point, sender, reason, detail) then
		return add_close_point
	else
		return false
	end
end

function PetDevelop.GetEffectValue(use_num, effect_value)
	local value_type = type(effect_value)
	if value_type == "number" then
		return math.floor(effect_value) * use_num
	elseif value_type == "table" then
		local res_value = 0
		local min_value = math.floor(effect_value[1])
		local max_value = math.floor(effect_value[2])
		for i = 1, use_num do
			res_value = res_value + sLuaApp:RandInteger(min_value, max_value)
		end
		return res_value
	else
		sLuaApp:LuaErr("PetDevelop.GetEffectValue  effect_value type 为 "..value_type)
		return 0
	end
end

---- 技能学习 ----
function PetDevelop.SkillStudy(player, pet_guid, item_guid, version, check_mod)
	if not pet_guid or not item_guid or type(item_guid) ~= "number" then return end
	--判断版本
	if not PetDevelop.CheckVersion(player, version) then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	--判断战斗中
	if not PetDevelop.CheckFight(pet) then return end
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	if not PetDevelopConfig.SkillStudyPetTypeEx[pet_type] then
		sLuaApp:LuaErr("PetDevelop.SkillStudy  宠物type不符 "..pet_guid)
		return
	end
	
	-- 判断技能书
	local item = sItemSystem:GetItemByGUID(item_guid)
	if not item then return end
	local player_guid = player:GetGUID() 
	if item:GetOwnerGUID() ~= player_guid then
		sLuaApp:LuaErr("PetDevelop.SkillStudy item " ..item_guid.." 不属于 ".. player:GetName())
		return
	end
	
	--判断是否绑定
	local pet_is_bind = pet:IsBind()
	local item_is_bind = item:IsBound()
	if not pet_is_bind and item_is_bind and (not check_mod or check_mod ~= 1) then
		local msg =	"您使用了绑定的"..PetDevelop.GetColor(item:GetName(),"Red").."，学习后宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."也将被绑定，您是否确定学习？"
		local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.SkillStudy(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..item_guid..",'"..version.."',1)")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	local item_keyname = item:GetKeyName()
	-- 宠物随机技能书 单独功能
	if PetRandomSkillBook and PetRandomSkillBook.BooksConfig[item_keyname] then
		PetRandomSkillBook.OnUse(player, pet, item, check_mod)
		return
	end
	
	-- 正经技能书
	local book_skill_id = PetDevelopConfig.BooksSkillId[item_keyname]
	if not book_skill_id then
		sLuaApp:LuaErr("PetDevelopConfig.BooksSkillId 不存在 "..item_keyname)
		return
	end
	
	local can_replace_skill_tb = {}
	local skill_con = pet:GetSkillContainer()
	--local has_skill_tb = skill_con:GetSkills()
	local has_skill_tb = PetMix.GetSkillTb(pet)
	local has_skill_num = #has_skill_tb
	for _,v in ipairs(has_skill_tb) do
		local skill_id = v:GetId()
		if skill_id == book_skill_id then
			sLuaApp:NotifyTipsMsg(player, "您的宠物已经掌握了该技能，无需学习！")
			return
		end
		if not v:IsBind() then
			table.insert(can_replace_skill_tb, v)
		end
	end

	--替换技能概率
	local replace_rand = PetDevelopConfig.SkillStudyReplace[has_skill_num]
	if not replace_rand then
		replace_rand = 100
	end
	
	if replace_rand == 100 and not next(can_replace_skill_tb) then
		sLuaApp:NotifyTipsMsg(player, "宠物不存在可替换技能，不可学习技能！")
		return
	end
	
	--消耗物品
	if sItemSystem:ConsumeItem(item, 1, "system", "宠物技能学习", "技能学习消耗") ~= 0 then
		sLuaApp:LuaErr("PetDevelop.SkillStudy  ConsumeItem 错误")
		return
	end
	
	--设置绑定
	if not pet_is_bind and item_is_bind then
		if sPetSystem:BindPet(pet, true) ~= 0 then
			sLuaApp:LuaErr("PetDevelop.SkillStudy BindPet 错误")
			return
		end
	end
	--学习技能
	local is_replace = -1
	if sLuaApp:RandInteger(1,100) <= replace_rand then
		local replace_skill = can_replace_skill_tb[sLuaApp:RandInteger(1,#can_replace_skill_tb)]
		is_replace = replace_skill:GetId()
		skill_con:DestroySkill(replace_skill, true)
	end
	
	local new_skill = skill_con:CreateSkill(book_skill_id,1,1,true)
	if new_skill then
		local pet_link_str = PetDevelop.GetLinkFunc["Pet"](pet:GetName(), player_guid, pet_guid, pet_type)
		local new_skill_data = SkillConfig.GetById(book_skill_id)
		local new_skill_name = new_skill_data.Name
		local new_skill_grade = new_skill_data.UpSkill
		local new_skill_link_str = PetDevelop.GetLinkFunc["Skill"](new_skill_name, 0, book_skill_id, new_skill_grade)
		
		if is_replace == -1 then
			sLuaApp:NotifyTipsMsg(player,"您的宠物"..pet_link_str.."学会了技能"..new_skill_link_str.."！")
			sLogServerSystem:LogPetToServer(0, player, pet, "宠物学习技能", 0, book_skill_id, "宠物学会新技能", "")
		else
			local old_skill_data = SkillConfig.GetById(is_replace)
			local old_skill_name = old_skill_data.Name
			local old_skill_grade = old_skill_data.UpSkill
			local old_skill_link_str = PetDevelop.GetLinkFunc["Skill"](old_skill_name, 0, is_replace, old_skill_grade)
			sLuaApp:NotifyTipsMsg(player,"您的宠物"..pet_link_str.."学会了技能"..new_skill_link_str.."，但是遗忘了技能"..old_skill_link_str)
			sLogServerSystem:LogPetToServer(0, player, pet, "宠物学习技能", is_replace, book_skill_id, "宠物学会新技能并替换老技能", "")
		end
	else
		sLuaApp:LuaErr("PetDevelop.SkillStudy CreateSkill 失败 "..book_skill_id)
	end
	
	-- --通知刷新
	-- local str = [[
		-- if PetUI then
			-- PetUI.RefreshLearningTab()
		-- end
	-- ]]
	-- sLuaApp:ShowForm(player, "脚本表单", str)
end

---- 宠物还原 ----
function PetDevelop.Restore(player, pet_guid, item_keyname, version)
	if not pet_guid or not item_keyname then return end
	--判断版本
	if not PetDevelop.CheckVersion(player, version) then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	if not PetDevelopConfig.RestorePetTypeEx[pet_type] then
		sLuaApp:LuaErr("PetDevelop.Restore  宠物type不符 "..pet_guid)
		return
	end
	local reset_group_name = pet_data.ResetGroup
	if not reset_group_name or reset_group_name == "" then
		sLuaApp:LuaErr("PetDevelop.Restore 宠物无法还原 "..pet_guid)
		return
	end
	--判断出战
	if pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "宠物已出战，无法还原！")
		return
	end
	-- 战斗中多次还原宠物会导致 战斗中可召唤的宠物数量溢出
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，无法还原！")
		return
	end
	--判断锁定
	if pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "宠物已锁定，无法还原！")
		return
	end
	
	--判断物品
	local restore_item_config = PetDevelopConfig.RestoreProbability[item_keyname]
	if not restore_item_config then
		sLuaApp:LuaErr("PetDevelopConfig.RestoreProbability 不存在"..item_keyname)
		return
	end
	local restore_probability_config = restore_item_config["FromType_"..pet_type]
	if not restore_probability_config then
		sLuaApp:LuaErr("PetDevelopConfig.RestoreProbability "..item_keyname.." 不存在 FromType_"..pet_type)
		return
	end
	
	local pet_star_level = pet:GetInt("PetStarLevel")
	local str_factor = [[
		local StarLevel = ]].. pet_star_level ..[[
		local CarryLevel = ]].. pet_data.CarryLevel ..[[
	]]
	local need_item_num = math.ceil(assert(load(str_factor .. " return " .. PetDevelopConfig.RestoreConsume))())
	if not need_item_num or need_item_num < 0 then
		sLuaApp:LuaErr("PetDevelopConfig.RestoreConsume  配置错误")
		return
	end
	if need_item_num == 0 then
		need_item_num = 1
	end

	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not item_data then
		sLuaApp:LuaErr("PetDevelop  ItemConfig 不存在 ".. item_keyname)
		return
	end
	local item_id = item_data.Id

	local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3)
	if has_item_num < need_item_num then
		sLuaApp:NotifyTipsMsg(player, "宠物还原消耗物品数量不足！")
		return
	end
	
	-- 得到还原后宠物id
	local res_pet_id = 0
	local res_index = Lua_tools.PlayerStartRandom(restore_probability_config,"PetDevelopRestore_"..item_keyname..pet_type, 1, false, true)[1]
	local res_pet_type = restore_probability_config[res_index]["GetType"]
	--PetDevelop.PetDevelopRestore = {} --{group_name = {type = {petid,petid}}}
	local reset_group_tb = PetDevelop.PetDevelopRestore[reset_group_name]
	if not reset_group_tb or not next(reset_group_tb) then
		--sLuaApp:LuaErr("PetDevelop.Restore  reset_group_tb为空 "..reset_group_name)
		sLuaApp:NotifyTipsMsg(player, "该宠物无法还原！")
		return
	end
	local restore_pet_tb = reset_group_tb[res_pet_type]
	if not restore_pet_tb or not next(restore_pet_tb) then
		sLuaApp:LuaErr("PetDevelop.Restore  restore_pet_tb type "..res_pet_type.." 为空 还原后petID不变")
		res_pet_id = pet_id
	elseif #restore_pet_tb == 1 then
		res_pet_id = restore_pet_tb[1]
	else
		res_pet_id = restore_pet_tb[sLuaApp:RandInteger(1,#restore_pet_tb)]
	end
	
	if res_pet_id == 0 then
		sLuaApp:LuaErr("PetDevelop.Restore  res_pet_id == 0")
		return
	end
	
	--退回宠物装备
	if not PetSystem.ReturnPetEquip(player, {pet}) then return end 
	
	--扣物品
	if sItemSystem:ConsumeItemWithPriority(player, item_id, need_item_num, true, "system", "宠物还原", "还原消耗")["code"] ~= 0  then
		sLuaApp:LuaErr("PetDevelop.Restore   player"..player:GetName().."  ConsumeItemWithPriority错误")
		return
	end
	
	local is_bind = pet:IsBind()
	local new_pet = sPetSystem:ReplaceAndDeletePet(player, res_pet_id, 0, is_bind, pet, "system", "宠物还原", "还原消耗")
	if new_pet then
		--PetUpStar.SetStarLevel(new_pet, pet_star_level, false)
		
		local talent_up_prob = PetDevelopConfig.RestoreTalentUp[item_keyname]/100
		if talent_up_prob and talent_up_prob ~= 0 then
			for _,v in ipairs(PetUpStarConfig.IntConfig) do
				local talent_max = new_pet:GetInt(v[1])
				local talent_num = PetRefining.TalentFunc[v[4]](new_pet, "Get", 0)
				local final_talent = talent_max * talent_up_prob + talent_num * (1 - talent_up_prob)
				if final_talent > talent_max then
					final_talent = talent_max
				end
				local diff_talent = final_talent - talent_num
				if diff_talent > 0 then
					PetRefining.TalentFunc[v[4]](new_pet, "Add", math.floor(diff_talent))
				elseif diff_talent < 0 then
					PetRefining.TalentFunc[v[4]](new_pet, "Sub", math.floor(math.abs(diff_talent)))
				end	
			end
		end
	else
		sLuaApp:LuaErr("PetDevelop.Restore  ReplaceAndDeletePet 错误")
		return
	end
	
	sLuaApp:NotifyTipsMsg(player, "还原成功")
	-- --刷新客户端
	local str = [[
		if PetUI then
			PetUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--显示获得宠物的UI
	PetSystem.on_add_pet(new_pet)
	--宠物还原接口只进了Create触发，没进Add触发
	CultivationSkill.on_add_pet(new_pet)
	SevenDayCallBack.Pet(new_pet)
	System.on_add_pet(new_pet, player)
end

---- 技能提取 ----
function PetDevelop.SkillExtract(player, pet_guid, item_guid, version, check_mod)
	if not pet_guid or not item_guid then return end
	--判断版本
	if not PetDevelop.CheckVersion(player, version) then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	--判断战斗中
	if not PetDevelop.CheckFight(pet) then return end
	
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	if not PetDevelopConfig.SkillExtractPetTypeEx[pet_type] then
		sLuaApp:LuaErr("PetDevelop.SkillExtract  宠物type不符 "..pet_guid)
		return
	end

	--判断出战
	if pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "无法提取出战宠物的技能！")
		return
	end
	--判断锁定
	if pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "无法提取锁定宠物的技能！")
		return
	end
	--判断物品
	local item = sItemSystem:GetItemByGUID(item_guid)
	if not item then return end
	local player_guid = player:GetGUID()
	if item:GetOwnerGUID() ~= player_guid then
		sLuaApp:LuaErr("PetDevelop.SkillExtract item " ..item_guid.." 不属于 ".. player:GetName())
		return
	end
	local item_keyname = item:GetKeyName()
	local extract_probability_config = PetDevelopConfig.SkillExtractProbability[item_keyname]
	if not extract_probability_config then
		sLuaApp:LuaErr("PetDevelop.SkillExtract  PetDevelopConfig.SkillExtractProbability 不存在 "..item_keyname)
		return
	end
	
	local item_id = item:GetId()
	local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3)
	if has_item_num < 1 then
		sLuaApp:NotifyTipsMsg(player, PetDevelop.GetLinkFunc["Item"](item:GetName(), player_guid, item_guid, item:GetGrade()).."数量不足！")
		return
	end
	
	--判断技能是否可提取
	local skill_con = pet:GetSkillContainer()
	--local has_skill_tb = skill_con:GetSkills()
	local has_skill_tb = PetMix.GetSkillTb(pet)
	if not next(has_skill_tb) then
		sLuaApp:NotifyTipsMsg(player, "宠物技能提取失败，宠物无技能提取！")
		return
	end
	
	local cannot_extract_skill_tb = {}
	local can_extract_skill_tb = {}
	for _,v in ipairs(has_skill_tb) do
		local skill_id = v:GetId()
		local skill_data = SkillConfig.GetById(skill_id)
		local skill_subtype = skill_data.SubType
		local cannot_extract_name = PetDevelopConfig.SkillExtractNoSubType[skill_subtype]
		if cannot_extract_name then
			cannot_extract_skill_tb[cannot_extract_name] = true
		else
			table.insert(can_extract_skill_tb, {skill_id, skill_data.UpSkill})
		end
	end
	
	if not next(can_extract_skill_tb) then
		local tip_msg = ""
		for k,_ in pairs(cannot_extract_skill_tb) do
			tip_msg = tip_msg .. k .. "，"
		end
		tip_msg = string.sub(tip_msg, 1, -4)
		sLuaApp:NotifyTipsMsg(player, "宠物技能提取失败，"..tip_msg.."无法提取！")
		return
	end
	
	local rand = 0
	for k,v in ipairs(can_extract_skill_tb) do 
		local prob = extract_probability_config["UpSkill_"..v[2]]
		if prob then
			rand = rand + prob
		end
		v[3] = rand
	end
	
	if rand == 0 then
		sLuaApp:NotifyTipsMsg(player,PetDevelop.CannotExtractTips[item_keyname])
		return
	end
	
	--判断绑定
	local pet_is_bind = pet:IsBind()
	local item_is_bind = item:IsBound()
	local book_is_bind = pet_is_bind or item_is_bind
	if book_is_bind and (not check_mod or check_mod ~= 1) then
		local msg = ""
		if pet_is_bind then
			msg = "您的宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."是绑定的，技能解绑后得到的技能书也将"..PetDevelop.GetColor("绑定","Red").."，是否确定提取？"
		elseif item_is_bind then
			msg = "您使用了绑定的"..PetDevelop.GetColor(item:GetName(),"Red").."，技能解绑后得到的技能书也将"..PetDevelop.GetColor("绑定","Red").."，是否确定提取？"
		end
		local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.SkillExtract(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..item_guid..",'"..version.."',1)")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
		
	--退回宠物装备
	if not PetSystem.ReturnPetEquip(player, {pet}) then return end 

	--消耗物品
	if sItemSystem:ConsumeItem(item, 1, "system", "宠物技能提取", "技能提取消耗") ~= 0 then
		sLuaApp:LuaErr("PetDevelop.SkillExtract  ConsumeItem错误")
		return
	end

	--sLuaApp:LuaErr("can_extract_skill_tb " ..Lua_tools.serialize(can_extract_skill_tb))
	--选书
	local get_rand = sLuaApp:RandInteger(1, can_extract_skill_tb[#can_extract_skill_tb][3])
	sLuaApp:LuaErr("get_rand "..get_rand)
	local book_keyname = ""
	for _,v in ipairs(can_extract_skill_tb) do
		if get_rand <= v[3] then
			book_keyname = PetDevelopConfig.SkillIdBooks[v[1]]
			sLuaApp:LuaErr("book_keyname"..book_keyname)
			if not book_keyname then
				sLuaApp:LuaErr("PetDevelopConfig.SkillIdBooks 不存在 "..v[1])
				return
			end
			break
		end
	end
	if book_keyname == "" then
		sLuaApp:LuaErr("PetDevelop.SkillExtract 错误 book_keyname为空")
		return
	end
	
	--删宠物
	if sPetSystem:DestroyPet(pet, "system", "宠物技能提取", "技能提取消耗") ~= 0 then
		sLuaApp:LuaErr("PetDevelop.SkillExtract  DestroyPet错误")
		return
	end
	--发书
	Lua_tools.AddItem(player, {book_keyname, 1, book_is_bind and 1 or 0}, "system", "宠物技能提取", "技能提取获得")
	
	sLuaApp:NotifyTipsMsg(player, "技能提取成功！")
	
	-- --通知刷新
	-- local str = [[
		-- if PetUI then
			-- PetUI.RefreshExtractTab()
		-- end
	-- ]]
	-- sLuaApp:ShowForm(player, "脚本表单", str)
end


---- 技能绑定 ----
-- 绑定
function PetDevelop.SkillBind(player, pet_guid, skill_id, version, check_mod)
	if not pet_guid or not skill_id then return end
	--判断版本
	if not PetDevelop.CheckVersion(player, version) then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	if not PetDevelopConfig.SkillBindPetTypeEx[pet_type] then
		sLuaApp:LuaErr("PetDevelop.SkillBind  宠物type不符 "..pet_guid)
		return
	end
	
	--判断技能
	local skill_con = pet:GetSkillContainer()
	local skill = skill_con:GetSkill(skill_id)
	if not skill then
		sLuaApp:LuaErr("PetDevelop.SkillBind "..pet_guid.." 不存在 "..skill_id)
		return
	end
	if skill:IsBind() then
		sLuaApp:NotifyTipsMsg(player, "技能已绑定！")
		return
	end
	
	--判断物品
	local item_data = ItemConfig.GetByKeyName(PetDevelopConfig.SkillBindItem)
	if not item_data then
		sLuaApp:LuaErr("PetDevelop.SkillBind  ItemConfig 不存在 ".. PetDevelopConfig.SkillBindItem)
		return
	end
	local item_id = item_data.Id

	local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3)
	if has_item_num < 1 then
		sLuaApp:NotifyTipsMsg(player, item_data.Name.."数量不足！")
		return
	end
	
	-- 绑定技能表
	local up_star_skill_id_tb = {}
	local pet_star_level = pet:GetInt("PetStarLevel")
	for i = 1, pet_star_level do
		local up_star_skill_id = pet:GetInt("PetUpStar_Skill_"..i)
		if up_star_skill_id ~= 0 then
			up_star_skill_id_tb[up_star_skill_id] = true
		end
	end
	
	local bind_skill_tb = {}
	--local has_skill_tb = skill_con:GetSkills()
	local has_skill_tb = PetMix.GetSkillTb(pet)
	for _,v in ipairs(has_skill_tb) do
		if v:IsBind() and not up_star_skill_id_tb[v:GetId()] then
			table.insert(bind_skill_tb, v)
		end
	end
	
	-- 发提示
	if not check_mod or check_mod ~= 1 then
		local new_skill_name = SkillConfig.GetById(skill:GetId()).Name
		if #bind_skill_tb < PetDevelopConfig.SkillBindMaxNum then
			local tip_msg = "您是否要绑定宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."的技能"..PetDevelop.GetColor(new_skill_name,"Red").."？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..tip_msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.SkillBind(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..skill_id..",'"..version.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		else
			local tip_msg = ""
			if PetDevelopConfig.SkillBindMaxNum == 1 then
				for _,v in ipairs(bind_skill_tb) do
					local skill_name = SkillConfig.GetById(v:GetId()).Name
					tip_msg = tip_msg .. PetDevelop.GetColor(skill_name,"Red") .."，"
				end
				tip_msg = string.sub(tip_msg, 1, -4)
				tip_msg = "绑定新的技能会解除技能"..tip_msg.."的绑定效果，您是否要绑定新的技能"..PetDevelop.GetColor(new_skill_name,"Red").."？"
			else
				tip_msg = "绑定新的技能会"..PetDevelop.GetColor("随机","Red").."解除一个技能的绑定效果，您是否要绑定新的技能"..PetDevelop.GetColor(new_skill_name,"Red").."？"
			end
			
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..tip_msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.SkillBind(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..skill_id..",'"..version.."',1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
	end

	--消耗物品
	if sItemSystem:ConsumeItemWithPriority(player, item_id, 1, true, "system", "宠物技能绑定", "技能绑定消耗")["code"] ~= 0 then
		sLuaApp:LuaErr("PetDevelop.SkillBind  ConsumeItemWithPriority 错误")
		return
	end
	
	--绑定 并解绑其他技能
	local other_skill_bind_num = PetDevelopConfig.SkillBindMaxNum - 1
	if #bind_skill_tb > other_skill_bind_num then
		for i = 1, #bind_skill_tb - other_skill_bind_num do
			local pos = sLuaApp:RandInteger(1, #bind_skill_tb)
			local set_unbind_skill = bind_skill_tb[pos]
			set_unbind_skill:SetBind(false)
			table.remove(bind_skill_tb,pos)
		end
	end
	
	skill:SetBind(true)
	
	--通知刷新
	sLuaApp:NotifyTipsMsg(player, "技能绑定成功！")
end

-- 解绑
function PetDevelop.SkillUnbind(player, pet_guid, skill_id, version, check_mod)
	if not pet_guid or not skill_id then return end
	--判断宠物
	local pet = PetDevelop.CheckPet(player, pet_guid)
	if not pet then return end
	local pet_id = pet:GetId()
	local pet_data = PetConfig.GetById(pet_id)
	local pet_type = pet_data.Type
	if not PetDevelopConfig.SkillBindPetTypeEx[pet_type] then
		sLuaApp:LuaErr("PetDevelop.SkillUnbind  宠物type不符 "..pet_guid)
		return
	end
	
	--判断技能
	local pet_star_level = pet:GetInt("PetStarLevel")
	for i = 1, pet_star_level do
		local up_star_skill_id = pet:GetInt("PetUpStar_Skill_"..i)
		if up_star_skill_id == skill_id then
			sLuaApp:NotifyTipsMsg(player, "突破技能无法解绑！")
			return
		end
	end
	
	local skill_con = pet:GetSkillContainer()
	local skill = skill_con:GetSkill(skill_id)
	--local skill = PetMix.GetSkillTb(pet) --可以不用筛选，客户端不显示突破和修炼技能，而且解绑无所谓
	if not skill then
		sLuaApp:LuaErr("PetDevelop.SkillUnbind "..pet_guid.." 不存在 "..skill_id)
		return
	end
	if not skill:IsBind() then
		sLuaApp:NotifyTipsMsg(player, "技能未绑定，无法解绑！")
		return
	end
	
	--判断物品
	local item_data = ItemConfig.GetByKeyName(PetDevelopConfig.SkillUnbindItem)
	if not item_data then
		sLuaApp:LuaErr("PetDevelop.SkillUnbind  ItemConfig 不存在 ".. PetDevelopConfig.SkillUnbindItem)
		return
	end
	local item_id = item_data.Id

	local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3)
	if has_item_num < 1 then
		sLuaApp:NotifyTipsMsg(player, item_data.Name.."数量不足！")
		return
	end
	
	-- 发提示
	if not check_mod or check_mod ~= 1 then
		local skill_name = SkillConfig.GetById(skill:GetId()).Name
		local tip_msg = "您是否要解绑宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."的技能"..PetDevelop.GetColor(skill_name,"Red").."？"
		local str = [[GlobalUtils.ShowServerBoxMessage("]]..tip_msg..[[")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "PetDevelop.SkillUnbind(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..","..skill_id..",'"..version.."',1)")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	--消耗物品
	if sItemSystem:ConsumeItemWithPriority(player, item_id, 1, true, "system", "宠物技能解绑", "技能解绑消耗")["code"] ~= 0 then
		sLuaApp:LuaErr("PetDevelop.SkillUnbind  ConsumeItemWithPriority 错误")
		return
	end
	
	skill:SetBind(false)
	
	--通知刷新
	sLuaApp:NotifyTipsMsg(player, "技能解绑成功！")
end


function PetDevelop.CheckPet(player, pet_guid)
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetDevelop 不存在宠物 ")
		return false
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetDevelop "..pet:GetGUID().." 不属于 "..player:GetName())
		return false
	end
	return pet
end

function PetDevelop.CheckFight(pet)
	if pet:GetAttr(ROLE_ATTR_IS_FIGHT) == 1 then
		local player = pet:GetOwner()
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	return true
end

PetDevelop.Color = {
	--[1] = "#FBDCB7ff",
	[1] = "#FFFFFFff",
	[2] = "#46DC5Fff",
	[3] = "#42B1F0ff",
	[4] = "#E855FFff",
	[5] = "#FF8700ff",
	[6] = "#FF0000ff",
	["Red"] = "#FF0000ff",
	["Grey"] = "#888888ff",
}

function PetDevelop.GetColor(str,grade)
	return "<color="..(PetDevelop.Color[grade] or "#FFFFFFff")..">".. str .."</color>"
end
--暂时不用XXXXXXXXXX
-- function PetDevelop.GetLinkStr(obj)
	-- if not obj then
		-- return
	-- end
	-- local obj_type = obj:GetType()
	
-- end

PetDevelop.GetLinkFunc = {
	["Skill"] = function(str, skill_type, skill_id, skill_grade)
		return "#SKILLLINK<STR:【"..str.."】,SKILLTYPE:"..skill_type..",SKILLID:"..skill_id..",SKILLGRADE:"..skill_grade..">#"
	end,
	["Item"] = function(str, owner_guid, item_guid, item_grade)	
		return "#ITEMLINK<STR:【"..str.."】,OWERGUID:"..owner_guid..",ITEMGUID:"..item_guid..",ITEMGRADE:"..item_grade..">#"
	end,
	["Pet"] = function(str, owner_guid, pet_guid, pet_grade)
		return "#SHOWUI<STR:【"..str.."】,OWERGUID:"..owner_guid..",ITEMGUID:"..pet_guid..",ITEMGRADE:"..pet_grade..">#"
	end,
}

	
function PetDevelop.Initialization()
	if not PetDevelopConfig then
		require("pet/PetDevelopConfig")
	end
	--宠物培养
	PetDevelop.MedicineItem = {}
	for _,v in ipairs(PetDevelopConfig.MedicineItem) do
		PetDevelop.MedicineItem[v["ItemKeyName"]] = {["Effect"] = v["Effect"], ["MaxLimit"] = v["MaxLimit"], ["OnceMaxNum"] = v["OnceMaxNum"]}
	end
	--记录宠物最大等级
	PetDevelop.PetMaxLevel = #PetLevelConfig.GetTableData() - 1
	--sLuaApp:LuaErr("PetDevelop.MedicineItem  "..Lua_tools.serialize(PetDevelop.MedicineItem))
	--sLuaApp:LuaErr("PetDevelop.PetMaxLevel  "..PetDevelop.PetMaxLevel)
	
	
	-- 宠物养成 宠物还原相关 --可还原生成宠物表
	PetDevelop.PetDevelopRestore = {} --{group_name = {type = {petid_1,petid_2}}}
	local pet_config_tb = PetConfig.GetTableData()
	for _,v in ipairs(pet_config_tb) do
		local reset_group_name = v.ResetGroup -- string
		local is_reset_out = v.IsResetOut -- 1 / 0
		if reset_group_name and reset_group_name ~= "0" then
			if is_reset_out == 1 then
				if not PetDevelop.PetDevelopRestore[reset_group_name] then
					PetDevelop.PetDevelopRestore[reset_group_name] = {}
				end
				local pet_type = v.Type
				if not PetDevelop.PetDevelopRestore[reset_group_name][pet_type] then 
					PetDevelop.PetDevelopRestore[reset_group_name][pet_type] = {}
				end
				table.insert(PetDevelop.PetDevelopRestore[reset_group_name][pet_type], v.Id)
			end
		end
	end
	--sLuaApp:LuaErr("PetDevelop.PetDevelopRestore  "..Lua_tools.serialize(PetDevelop.PetDevelopRestore))

	-- 技能提取  宠物没有可提取技能时tips用
	PetDevelop.CannotExtractTips = {}
	for k,v in pairs(PetDevelopConfig.SkillExtractProbability) do
		local item_data = ItemConfig.GetByKeyName(k)
		if not item_data then
			sLuaApp:LuaErr("PetDevelop.Initialization  ItemConfig 不存在 ".. k)
			return
		end
		local tip_msg = "宠物技能提取失败，"..item_data.Name.."只能提取"
		for a,b in ipairs(PetDevelopConfig.SkillExtractUpSkillName) do
			if v["UpSkill_"..a] then
				tip_msg = tip_msg .. b .."，"
			end
		end
		PetDevelop.CannotExtractTips[k] = string.sub(tip_msg, 1, -4) .."！"
	end
	--sLuaApp:LuaErr("PetDevelop.CannotExtractTips  "..Lua_tools.serialize(PetDevelop.CannotExtractTips))
	
end
PetDevelop.Initialization()