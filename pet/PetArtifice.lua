--装备相关表单

PetArtifice = {}

PetArtifice.Config = {
	ArtificeTimes = {
		[0] = 5,
		[1] = 8,
		[2] = 11,
		[3] = 11,
		[4] = 11,
		[999] = 11
		},
	ArtificeAttr = {
		--Lines = 在第几行显示，每一行最多有两个属性值
		{attr = "吸收物理伤害结果的百分比", Max = 7500, Lines = 1},
		{attr = "风系伤害抵抗百分比", Max = 7500, Lines = 2},
		{attr = "火系伤害抵抗百分比", Max = 7500, Lines = 2},
		{attr = "雷系伤害抵抗百分比", Max = 7500, Lines = 3},
		{attr = "水系伤害抵抗百分比", Max = 7500, Lines = 3},
		{attr = "混乱抵抗概率", Max = 7500, Lines = 4},
		{attr = "毒系抵抗中毒概率", Max = 7500, Lines = 4},
		{attr = "昏睡抵抗概率", Max = 7500, Lines = 5},
		{attr = "封印抵抗概率", Max = 7500, Lines = 5},
		{attr = "遗忘抵抗概率", Max = 7500, Lines = 6},
		{attr = "鬼火系伤害抵抗百分比", Max = 7500, Lines = 6},
	},
}

function PetArtifice.GetConfig(player)
	if PetArtifice.Config then
		if Lua_tools then
			--sLuaApp:LuaDbg("表单回馈")
			local str = [[ if PetEduUI then
					PetEduUI.ArtificeConfig = ]] .. Lua_tools.serialize(PetArtifice.Config) .. [[
					PetEduUI.ArtificeMark = ]]..(PetAttrClassify.PetArtifice or 11)..[[
					PetEduUI.GetConfightAck()
				end
			]]
	
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function PetArtifice.GetData(player, pet_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local str = [[ if PetEduUI then
					if not PetEduUI.ArtificeTimesList then
						PetEduUI.ArtificeTimesList = {}
					end
					PetEduUI.ArtificeTimesList]].."['"..pet_guid.."'] = "..pet:GetInt("PET_ArtificeTimes")..[[
					PetEduUI.Refresh()
				end
			]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function PetArtifice.Artifice(player, pet_guid, item_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local ArtTimes = pet:GetInt("PET_ArtificeTimes")
	local RebTimes = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	local ArtMax = 0
	if PetArtifice.Config then
		if PetArtifice.Config.ArtificeTimes then
			ArtMax = PetArtifice.Config.ArtificeTimes[RebTimes]
		end
	end
	if not ArtMax then
		sLuaApp:LuaDbg("服务器配置ArtificeTimes出错，未出现"..RebTimes.."转的相关配置")
		return
	end
	if ArtTimes >= ArtMax then
		sLuaApp:NotifyTipsMsg(player, "你的宠物已经达到可炼妖的上限了哦！")
		return ""
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
		return ""
	end
	local AttrList = item:GetDynAttrsByMark(0)
	local ArtMark = PetAttrClassify.PetArtifice or 11
	local canAdd = 0
	if PetArtifice.AttrIndex then
		for k,v in ipairs(AttrList) do
			local attrAdd = v.attr
			local valOri = 0
			local valMax = PetArtifice.AttrIndex[attrAdd]
			if valMax then
				if valMax > pet:GetDynAttr(ArtMark, attrAdd) then
					canAdd = canAdd + 1
				end
			else
				sLuaApp:NotifyTipsMsg(player, "道具中有非系统属性，炼妖失败！")
				return
			end
		end
	end
	if canAdd == 0 then
		sLuaApp:NotifyTipsMsg(player, "要炼妖的属性已抵达上限，炼妖失败")
		return
	end
	if sItemSystem:DestroyItem(item, "system", "炼妖", "宠物对象："..pet:GetName()) == 0 then
		pet:SetInt("PET_ArtificeTimes", ArtTimes + 1)
		if PetArtifice.AttrIndex then
			for k,v in ipairs(AttrList) do
				local attrAdd = v.attr
				local valOri = 0
				local valMax = PetArtifice.AttrIndex[attrAdd]
				local valNow = pet:GetDynAttr(ArtMark, attrAdd)
				if valMax then
					valNow = valNow + v.value
					if valNow > valMax then
						valNow = valMax
					end
					pet:SetDynAttr(ArtMark, attrAdd, valNow)
				end
			end
		end
		PetArtifice.GetData(player, pet_guid)
		sLuaApp:NotifyTipsMsg(player, "炼妖成功")
		return
	end
end

function PetArtifice.ResetArtifice(player, pet)
	pet:SetInt("PET_ArtificeTimes",0)
	pet:SetDynAttrsByMark(PetAttrClassify.PetArtifice or 11, 0)
	return true
end

function PetArtifice.Initialization()
	PetArtifice.AttrIndex = {}
	if PetArtifice.Config then
		if PetArtifice.Config['ArtificeAttr'] then
			for k,v in ipairs(PetArtifice.Config['ArtificeAttr']) do
				if v.attr then
					local attrData = AttrConfig.GetByKeyName(v.attr)
					if attrData then
						v.attrId = attrData.Id
						PetArtifice.AttrIndex[v.attrId] = v.Max
					end
				end
			end
		end
	end
end

--PetArtifice.Initialization()