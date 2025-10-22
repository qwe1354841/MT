PlayerEquip = {}

function PlayerEquip.on_pre_equip(player, equip)
	if equip == nil then
        return
    end
	--判断战斗中
	if not PlayerEquip.CheckFight(player) then
		return false 
	end
	return true
end

function PlayerEquip.on_pre_unequip(player, equip)
	if equip == nil then
        return
    end

	--判断战斗中
	if not PlayerEquip.CheckFight(player) then
		return false 
	end
	return true
end


function PlayerEquip.on_post_equip(player, equip)
    if equip == nil then
        return
    end
	
	if not equip:IsBound() then
		equip:SetBound()
	end
	
	--sLuaApp:LuaDbg("穿装备")
	--穿装备任务判断
	if sQuestSystem:GetQuestState(player,5) == 3 then
		sQuestSystem:ForceReady(player,5)
	end
	if FunctionSwitch then
		if FunctionSwitch.AllFuncitonConfig['Suit'] then
			if FunctionSwitch.AllFuncitonConfig['Suit'] == "on" then
				if SuitSys then
					SuitSys.on_post_equip(player,equip)
				end
			end
			if FunctionSwitch.AllFuncitonConfig['EquipSpecialEffect'] == "on" then
				if EquipSpecialEffect then
					EquipSpecialEffect.on_post_equip(player,equip)
				end
			end
		end
		if AttributeEnhance then
			AttributeEnhance.Equip_Strengthen_level(player)
			--AttributeEnhance.Gem_Strengthen_level(player)
		end
		--灵宝
		if SpiritualEquipConfig and SpiritualEquipConfig.Switch and SpiritualEquipConfig.Switch == "on" then
			if SpiritualEquip then
				local keyname = equip:GetKeyName()
				local itemdata = ItemConfig.GetByKeyName(keyname)
				local type = itemdata.Type
				local subtype = itemdata.Subtype
				if type == 9 and subtype == 0 then
					SpiritualEquip.on_post_equip(player, equip)
				end
			end
		end

		--心法技能Attr
		if PlayerSkill then
			PlayerSkill.RecalcSkillAttr(player)
		end
	end
end

function PlayerEquip.on_post_unequip(player, equip)
    if equip == nil then
        return
    end
    

    
	--sLuaApp:LuaDbg("脱装备")
	if FunctionSwitch then
		if FunctionSwitch.AllFuncitonConfig['Suit'] then
			if FunctionSwitch.AllFuncitonConfig['Suit'] == "on" then
				if SuitSys then
					SuitSys.on_post_unequip(player,equip)
				end
			end
			if FunctionSwitch.AllFuncitonConfig['EquipSpecialEffect'] == "on" then
				if EquipSpecialEffect then
					EquipSpecialEffect.on_post_unequip(player,equip)
				end
			end
		end
		if AttributeEnhance then
			AttributeEnhance.Equip_Strengthen_level(player)
			--AttributeEnhance.Gem_Strengthen_level(player)
		end
		--灵宝
		if SpiritualEquipConfig and SpiritualEquipConfig.Switch and SpiritualEquipConfig.Switch == "on" then
			if SpiritualEquip then
				local keyname = equip:GetKeyName()
				local itemdata = ItemConfig.GetByKeyName(keyname)
				local type = itemdata.Type
				local subtype = itemdata.Subtype
				if type == 9 and subtype == 0 then
					SpiritualEquip.on_post_unequip(player, equip)
				end
			end
		end
		--心法技能Attr
		if PlayerSkill then
			PlayerSkill.RecalcSkillAttr(player)
		end
	end
end

function PlayerEquip.CheckFight(player)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	return true
end