--装备发光特效
EquipLight = {}

-- 配置中的特效ID为初始itemlevel为0级的ID,具体的特效ID根据道具的模型ID在EquipLight.ModelInEffect中的配置进行计算
-- 例：10级重剑的模型ID为 9002 强化等级为8级-12级，则其模型ID为 9002 对应的值 + Config中的 50012，最终结果为 50022

EquipLight.Config = {	--强化次数，对应装备的等级/品阶
			-- 1级装备强化4级-8级， 8级-12级， 12级-16级， 16级-20级， 20级-40级
	["重剑"] = {50010, 50012, 50015, 50018, 50019},
	["扇子"] = {100010, 100012, 100015, 100018, 100019},
	["笛子"] = {40010, 40012, 40015, 40018, 40019},
	["阔刀"] = {80010, 80012, 80015, 80018, 80019},
	["毛笔"] = {90010, 90012, 90015, 90018, 90019},
	["长枪"] = {10010, 10012, 10015, 10018, 10019},
	["爪刺"] = {20010, 20012, 20015, 20018, 20019},
	["绣伞"] = {110010, 110012, 110015, 110018, 110019},
	["短杖"] = {60010, 60012, 60015, 60018, 60019},
	["弓箭"] = {70010, 70012, 70015, 70018, 70019},
	["双剑"] = {30010, 30012, 30015, 30018, 30019},
	["长鞭"] = {120010, 120012, 120015, 120018, 120019},
}

EquipLight.ModelInEffect = {
--模型ID对应特效ID的加值  -- 重剑 扇子 笛子 阔刀 毛笔 长枪 爪刺 绣伞 短杖 弓箭 双剑 长鞭
	["0"]   = {9001, 9036, 9057, 9008, 9071, 9043, 9050, 9564, 9029, 9578, 9022, 9515},
	["10"]  = {9002, 9037, 9058, 9009, 9072, 9044, 9051, 9565, 9030, 9579, 9023, 9516},
	["20"]  = {9003, 9038, 9059, 9010, 9073, 9045, 9052, 9566, 9031, 9580, 9024, 9517},
	["30"]  = {9004, 9039, 9060, 9011, 9074, 9046, 9053, 9567, 9032, 9581, 9025, 9518},
	["40"]  = {9005, 9040, 9061, 9012, 9075, 9047, 9054, 9568, 9033, 9582, 9026, 9519},
	["50"]  = {9006, 9041, 9062, 9013, 9076, 9048, 9055, 9569, 9034, 9583, 9027, 9520},
	["60"]  = {9007, 9042, 9063, 9014, 9077, 9049, 9056, 9570, 9035, 9584, 9028, 9521},
	["70"]  = {9085, 9097, 9101, 9087, 9105, 9095, 9099, 9603, 9093, 9607, 9091, 9589},
	["80"]  = {9086, 9098, 9102, 9088, 9106, 9096, 9100, 9604, 9094, 9608, 9092, 9590},
	["90"]  = {9121, 9145, 9153, 9125, 9161, 9141, 9149, 9657, 9137, 9665, 9133, 9629},
	["100"] = {9122, 9146, 9154, 9126, 9162, 9142, 9150, 9658, 9138, 9666, 9134, 9630},
	["110"] = {9123, 9147, 9155, 9127, 9163, 9143, 9151, 9659, 9139, 9667, 9135, 9631},
	["120"] = {9124, 9148, 9156, 9128, 9164, 9144, 9152, 9660, 9140, 9668, 9136, 9632},
	["130"] = {9201, 9211, 9221, 9231, 9241, 9251, 9261, 9771, 9281, 9791, 9301, 9811},
}

--增加特效等级配置需在最终特效等级后面额外配一个更高的等级
EquipLight.Effects = {4,8,12,16,20,40}

EquipLight.Mapping = {
	[1] = "重剑",
	[2] = "扇子",
	[3] = "笛子",
	[4] = "阔刀",
	[5] = "毛笔",
	[6] = "长枪",
	[7] = "爪刺",
	[8] = "绣伞",
	[9] = "短杖",
	[10] = "弓箭",
	[11] = "双剑",
	[12] = "长鞭",
}

EquipLight.ModelInEffectMapping = {}

function EquipLight.GetConfig(player)
	if Lua_tools then
		sLuaApp:LuaDbg("表单回馈")
		str = [[ if EquipQuenchUI then
				EquipQuenchUI.serverData = ]] .. Lua_tools.serialize(EquipLight.Consume) .. [[
				EquipQuenchUI.Refresh()
			end
		]]

		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function EquipLight.IntensifyLVLight(player, item)
	--sLuaApp:LuaDbg("装备强化发光特效Pro")
	local itemData = ItemConfig.GetById(item:GetId())
	if itemData.Type == 1 and itemData.Subtype == 1 then
		local level = item:GetInt("EQUIP_IntensifyLevel")
		local index = 0
		local effects = EquipLight.Effects
		--sLuaApp:LuaDbg(#effects)
		if #effects > 1 then
			for i = 1, (#effects - 1) do
				--sLuaApp:LuaDbg("level = "..level)
				--sLuaApp:LuaDbg("effects[i] = "..effects[i].."  effects[i+1] = "..effects[i+1])
				if level >= effects[i] and level < effects[i+1] then
					index = i
					--sLuaApp:LuaDbg("index"..index)
				end
			end
		end
		if index == 0 then
			return false
		end
		local weapon_kind =  EquipLight.Mapping[itemData.Subtype2]
		--sLuaApp:LuaDbg(weapon_kind.." "..type(weapon_kind))
		
		local light_attr = EquipLight.Config[weapon_kind][index]
		--sLuaApp:LuaDbg(light_attr.." light_attr "..type(light_attr))
		--sLuaApp:LuaDbg("itemData.ModelRole1:"..itemData.ModelRole1)
		local AddNum = EquipLight.ModelInEffectMapping[tostring(itemData.ModelRole1)] or itemData.Itemlevel
		--sLuaApp:LuaDbg(" AddNum: "..AddNum)
		light_attr = light_attr + AddNum
		--sLuaApp:LuaDbg("特效ID"..light_attr)
		if light_attr and weapon_kind then
			item:SetDynAttr(EquipAttrClassify.EquipLight,327,light_attr)
		end
	else
		sLuaApp:LuaDbg("该道具不是武器，无法发光")
		return false
	end
end

function EquipLight.Init()
	for k,v in pairs(EquipLight.ModelInEffect) do
		for a, b in pairs(v) do
			EquipLight.ModelInEffectMapping[tostring(b)] = tonumber(k)
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(EquipLight.ModelInEffectMapping))
	return ""
end
EquipLight.Init()
