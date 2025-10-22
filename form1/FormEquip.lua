--装备相关表单

FormEquip = {}

function FormEquip.EquipBuild_GetData(player, Version)
	sLuaApp:LuaDbg("FormEquipGet!")
	--EquipBuild.Initialization(0)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","打造") then
		return ""
	end
	if EquipBuild then
		EquipBuild.GetData(player, Version)
	end
	return ""
end

function FormEquip.GetLevelData(player,level)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","打造") then
		return ""
	end
	if EquipBuild then
		EquipBuild.GetLevelData(player,level)
	end
	return ""
end

function FormEquip.EquipBuild_GetEquipData(player, classify, index)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","打造") then
		return ""
	end
	if EquipBuild then
		EquipBuild.GetEquipData(player, classify, index)
	end
	return ""
end

function FormEquip.EquipBuild_StartBuilding(player, classify, index, issuper, UseUnbind)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","打造") then
		return ""
	end
	if EquipBuild then
		EquipBuild.StartBuilding(player, classify, index, issuper, UseUnbind)
	end
	return ""
end

function FormEquip.EquipArtifice_GetData(player)
	if FunctionSwitch.AllFuncitonConfig.EquipArtifice ~= "on" then
		return ''
	end
	if EquipBuild then
		EquipArtifice.GetData(player)
	end
	return ""
end

function FormEquip.EquipArtifice_Artificing(player, item_guid, locking, guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipArtifice ~= "on" then
		return ''
	end
	if EquipArtifice then
		EquipArtifice.Artificing(player, item_guid, locking, guard_guid)
	end
	return ""
end

function FormEquip.EquipFairyBuild_GetData(player, Version)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	sLuaApp:LuaDbg("FormFairyGet!")
	--EquipBuild.Initialization(0)
	
	if FairyBuild then
		FairyBuild.GetData(player, Version)
	end
	return ""
end

function FormEquip.EquipFairyBuild_StartBuilding(player, index, dir)
	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
		return ''
	end
	if FairyBuild then
		FairyBuild.StartBuilding(player, index, dir)
	end
	return ""
end

function FormEquip.EquipEnhance_GetData(player, Version)
	--sLuaApp:LuaDbg("进入装备强化getDataFormEnhanceGet!")
	--sLuaApp:LuaDbg("Version:"..Version)
	if FunctionSwitch.AllFuncitonConfig.EquipIntensify ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","强化") then
		return ""
	end
	--sLuaApp:LuaDbg("FormEnhanceGet!")
	--EquipBuild.Initialization(0)
	
	if EquipIntensify then
		EquipIntensify.GetEquipData(player, Version)
	end
	return ""
end

function FormEquip.EquipEnhance_Start(player, item_guid, safeMode, bindMode, guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipIntensify ~= "on" then
		return ''
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","装备","强化") then
		return ""
	end
	if EquipIntensify then
		EquipIntensify.SubItemIntensify(player, item_guid, safeMode, bindMode, guard_guid)
	end
	return ""
end

function FormEquip.EquipReBuild_GetAllowList(player)
	if FunctionSwitch.AllFuncitonConfig.EquipRebuild ~= "on" then
		return ''
	end
	if EquipReBuild then
		EquipReBuild.GetAllowList(player)
	end
	return ""
end

function FormEquip.EquipReBuild_GetData(player, item_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipRebuild ~= "on" then
		return ''
	end
	if EquipReBuild then
		EquipReBuild.GetData(player, item_guid)
	end
	return ""
end

function FormEquip.EquipReBuild_ReBuild(player, item_guid, guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipRebuild ~= "on" then
		return ''
	end
	if EquipReBuild then
		EquipReBuild.ReBuilding(player, item_guid, guard_guid)
	end
	return ""
end

function FormEquip.EquipReBuild_Confirm(player, item_guid, guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipRebuild ~= "on" then
		return ''
	end
	if EquipReBuild then
		EquipReBuild.Confirm(player, item_guid, guard_guid)
	end
	return ""
end

function FormEquip.GrowUp_GetData(player, item_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipLevelUp ~= "on" then
		return ''
	end
	sLuaApp:LuaDbg("GrowUp_GetData")
	if EquipLevelup then
		EquipLevelup.GetData(player, item_guid)
	end
	return ""
end

function FormEquip.GrowUp_Upgrading(player, item_guid,guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipLevelUp ~= "on" then
		return ''
	end
	if EquipLevelup then
		EquipLevelup.Upgrading(player, item_guid,guard_guid)
	end
	return ""
end

function FormEquip.GetEnhanceConfig(player)
	if FunctionSwitch.AllFuncitonConfig.EquipLevelUp ~= "on" then
		return ''
	end
	if EquipIntensify then
		EquipIntensify.GetConfig(player)
	end
	return ""
end

function FormEquip.GetLightConfig(player)
	if FunctionSwitch.AllFuncitonConfig.EquipLight ~= "on" then
		return ''
	end
	if EquipLight then
		EquipLight.GetConfig(player)
	end
	return ""
end

function FormEquip.ChangeLight(player, item_guid, guard_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipLight ~= "on" then
		return ''
	end
	if EquipLight then
		EquipLight.ChangeLight(player, item_guid, guard_guid)
	end
	return ""
end

--function FormEquip.Guard_Upgrading(player, item_guid, guard_guid)
--	if FunctionSwitch.AllFuncitonConfig.EquipLevelUp ~= "on" then
--		return ''
--	end
--	sLuaApp:LuaDbg("FormEquip.Guard_Upgrading")
--	if GuardEquipLevelup then
--		GuardEquipLevelup.Upgrading(player, item_guid, guard_guid)
--	end
--	return ""
--end
--function FormEquip.GuardFairyBuild_GetData(player, guard_guid , Version)
--	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
--		return ''
--	end
--	sLuaApp:LuaDbg("GuardFairyBuildGet!")
--	if GuardFairyBuild then
--		GuardFairyBuild.GetData(player, guard_guid , Version)
--	end
--	return ""
--end
--
--function FormEquip.GuardFairyBuild_StartBuilding(player, index, dir ,guard_guid)
--	if FunctionSwitch.AllFuncitonConfig.EquipCreat ~= "on" then
--		return ''
--	end
--	if GuardFairyBuild then
--		GuardFairyBuild.StartBuilding(player, index, dir, guard_guid)
--	end
--	return ""
--end

--获取宝石镶嵌位置信息
function FormEquip.EquipGem_GetStoneData(player)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.GetStoneData(player)
	end
	return ""
end

--快捷合成
function FormEquip.EquipGem_QuickCompound(player, gem_Type, gem_id, targetgem_id, itemMode)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.QuickCompound(player, gem_Type, gem_id, targetgem_id, itemMode)
	end
	return ""
end

--快捷合成减少所用宝石
function FormEquip.EquipGem_SubGemNum(player, gem_guid)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.SubGemNum(player, gem_guid)
	end
	return ""
end

--快捷合成消耗宝石
function FormEquip.EquipGem_ConsumeQuickCompound(player, item_guid, slot, gem_id, targetgem_id)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.ConsumeQuickCompound(player, item_guid, slot, gem_id, targetgem_id)
	end
	return ""
end

--获取宝石合成公式
function FormEquip.EquipGem_GetComposeData(player)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.GetComposeData(player)
	end
	return ""
end

function FormEquip.EquipGem_GetRebuildData(player)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		--EquipGem.GetRebuildData(player)
	end
	return ""
end

--宝石拆除
function FormEquip.RemoveGem(player, item_guid, slot)
	--sLuaApp:LuaDbg("宝石拆除")
	--sLuaApp:LuaDbg("item_guid:"..item_guid)
	--sLuaApp:LuaDbg("slot"..slot)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		EquipGem.RemoveGem(player, item_guid, slot, false)
	end
	return ""
end

--宝石镶嵌
function FormEquip.EmbedGem(player, item_guid, slot, gem_guid)
	--sLuaApp:LuaDbg("宝石镶嵌")
	--sLuaApp:LuaDbg("item_guid:"..item_guid)
	--sLuaApp:LuaDbg("slot"..slot)
	--sLuaApp:LuaDbg("gem_guid"..gem_guid)

	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","宝石","镶嵌") then
		return ""
	end

	if EquipGem then
		EquipGem.EmbedGem(player, item_guid, slot, gem_guid)
	end
	return ""
end

function FormEquip.OpenHole(player, item_guid)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	if EquipGem then
		--EquipGem.OpenHole(player, item_guid)
	end
	return ""
end

--快捷购买
function FormEquip.BuyGem(player, gem_idx)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if EquipGem then
		EquipGem.BuyGem(player, gem_idx)
	end
	return ""
end

function FormEquip.GuardRemoveGem(player, guard_guid, item_guid, slot)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	local guard = sGuardSystem:GetGuard(guard_guid)
	if guard == nil then
		sLuaApp:NotifyTipsMsg(player, "找不到指定侍从：" .. guard_guid)
		return ""
	end

	if EquipGem then
		local ret = EquipGem.RemoveGem(player, guard, item_guid, slot, false)
		if not ret then
			sLuaApp:LuaDbg("拆除宝石失败:" .. player:GetName())
			return ""
		end 
	end
	return ""
end

function FormEquip.GuardEmbedGem(player, guard_guid, item_guid, slot, gem_guid)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end

	local guard = sGuardSystem:GetGuard(guard_guid)
	if guard == nil then
		sLuaApp:NotifyTipsMsg(player, "找不到指定侍从：" .. guard_guid)
		return ""
	end

	if EquipGem then
		local ret = EquipGem.EmbedGem(player, guard, item_guid, slot, gem_guid)
		if not ret then
			sLuaApp:LuaDbg("镶嵌宝石失败" .. player:GetName())
			return ""
		end 
	end
	return ""
end

--宝石合成
function FormEquip.ComposeGem(player, gem_id, bindMode)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","宝石","合成") then
		return ""
	end
	if EquipGem then
		EquipGem.ComposeGem(player, gem_id, bindMode)
	end
	return ""
end

--全部宝石合成
function FormEquip.ComposeGemAll(player, gem_id, bindMode)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if not MainUISwitch.CheckOpenLevel(player,"装备","宝石","合成") then
		return ""
	end
	if EquipGem then
		EquipGem.ComposeGemAll(player, gem_id, bindMode)
	end
	return ""
end

--给予全部宝石
function FormEquip.GiveAllGem(player, gem_id, targetNum, consumeNum, bindMode)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if EquipGem then
		EquipGem.GiveAllGem(player, gem_id, targetNum, consumeNum, bindMode)
	end
	return ""
end

function FormEquip.OpenLight_GetData(player)
	if FunctionSwitch.AllFuncitonConfig.EquipBless ~= "on" then
		return ''
	end
	if EquipOpenLight then
		EquipOpenLight.GetData(player)
	end
	return ""
end

function FormEquip.OpenLight_Start(player,equip_guid)
	if FunctionSwitch.AllFuncitonConfig.EquipBless ~= "on" then
		return ''
	end
	if EquipOpenLight then
		EquipOpenLight.Start(player,equip_guid)
	end
	return ""
end

--function FormEquip.EquipLianQi_GetData(player)
--	if FunctionSwitch.AllFuncitonConfig.EquipBless ~= "on" then
--		return ''
--	end
--	if EquipLianQi then
--		EquipLianQi.GetData(player)
--	end
--	return ""
--end
--
--function FormEquip.EquipLianQi_Start(player,equip_guid,index)
--	if FunctionSwitch.AllFuncitonConfig.EquipBless ~= "on" then
--		return ''
--	end
--	if EquipLianQi then
--		EquipLianQi.Start(player,equip_guid,index)
--	end
--	return ""
--end

function FormEquip.RebuildEquip(player, item_guid, slot)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if EquipGem then
		local ret = EquipGem.RebuildEquip(player, player, item_guid, slot)
		if not ret then
			sLuaApp:LuaDbg("重铸宝石失败" .. player:GetName())
			return ""
		end 
	end
	return ""
end

function FormEquip.GuardRebuildEquip(player, guard_guid, item_guid, slot)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	local guard = sGuardSystem:GetGuard(guard_guid)
	if guard == nil then
		sLuaApp:NotifyTipsMsg(player, "找不到指定侍从：" .. guard_guid)
		return ""
	end

	if EquipGem then
		local ret = EquipGem.RebuildEquip(player, guard, item_guid, slot)
		if not ret then
			sLuaApp:LuaDbg("侍从重铸宝石失败" .. player:GetName())
			return ""
		end 
	end
	return ""
end

function FormEquip.RebuildGem(player, gem_guid)
	if FunctionSwitch.AllFuncitonConfig['EquipGem'] ~= "on" then
		return ""
	end
	if EquipGem then
		EquipGem.RebuildGem(player, gem_guid)
	end
	return ""
end

function FormEquip.Login_Data(player)
	local TB = {}
	if EquipBuild then
		TB[1] = EquipBuild.CheckRedPoint(player)
	end
	if EquipIntensify then
		TB[2] = EquipIntensify.CheckRedPoint(player)
	end
	if EquipGem then
		TB[3] = EquipGem.CheckRedPoint(player)
	end
	
	str = [[
			if GlobalProcessing then
				GlobalProcessing.Equip_DataLoading(]]..Lua_tools.serialize(TB)..[[, true)
			end
			]]
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaDbg("FormEquip  TB  已发送")
	return ""
end