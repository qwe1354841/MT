--特技特效
EquipSpecialEffect = {}
require("item/EquipSpecialEffectConfig")

function EquipSpecialEffect.Initialization()
	EquipSpecialEffect.ItemKey2SkillId = {}
	for a,b in pairs(EquipSpecialEffectConfig.Config) do
		for k,v in pairs(b) do
			EquipSpecialEffect.ItemKey2SkillId[''..v['Artifice_Item_KeyName']] = v['Skill_Id']
		end
	end
end

function EquipSpecialEffect.artifice(player,equip_guid,skill_ID,mod,item_guid)
	local skillID = skill_ID
	local is_bound = true
	if not item_guid then
		item_guid = 0 
	end
	local item =  sItemSystem:GetItemByGUID(tonumber(item_guid))  
	if item then
		if tostring(item:GetOwnerGUID()) ~= tostring(player:GetGUID()) then
			sLuaApp:NotifyTipsMsg(player, "装备炼化出错，休想骗我，道具不是你的")	
			return
		end	
		is_bound = item:IsBound()
		skillID = EquipSpecialEffect.ItemKey2SkillId[''..item:GetKeyName()]
	end
	
	local equip =  sItemSystem:GetItemByGUID(tonumber(equip_guid))
	if not equip then
		return
	end
	if tostring(equip:GetOwnerGUID()) ~= tostring(player:GetGUID()) then
		sLuaApp:NotifyTipsMsg(player, "装备炼化出错，休想骗我，装备不是你的")	
		return
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中无法进行装备炼化！")
		return
	end
	
	if EquipSpecialEffectConfig.Config[""..mod][skillID] then
		--判断是否有相同的技能
		if equip:GetInt("Equip_"..mod) == skillID then
			sLuaApp:NotifyTipsMsg(player, "已经有相同技能！")
			return
		end
		if item then
			if sItemSystem:ConsumeItem(item,1,"系统","装备炼化",""..item:GetName().."  "..player:GetName()) ~= 0 then
				sLuaApp:NotifyTipsMsg(player, "装备炼化出错，扣除道具失败")
				return
			end
			if is_bound then
				equip:SetBound()
			end
		else
			--扣除道具
			if not Lua_tools.SubItem(player, {EquipSpecialEffectConfig.Config[""..mod][skillID]['Artifice_Item_KeyName'],1}, "EquipSpecialEffect.artifice", ""..mod, "") then
				sLuaApp:NotifyTipsMsg(player, "装备炼化出错，扣除道具失败")
				return
			end
		end
		--判断道具够不够
		--if not Lua_tools.IsItemEnough(player, {EquipSpecialEffectConfig.Config[""..mod][skillID]['Artifice_Item_KeyName'],1}) then
		--	sLuaApp:NotifyTipsMsg(player, "道具不足！")
		--	--这里可以添加一键购买
		--	return
		--end
		--扣除道具
		--if not Lua_tools.SubItem(player, {EquipSpecialEffectConfig.Config[""..mod][skillID]['Artifice_Item_KeyName'],1}, "EquipSpecialEffect.artifice", ""..mod, "") then
		--	sLuaApp:NotifyTipsMsg(player, "装备炼化出错，扣除道具失败")
		--	return
		--end
		
		--判断是否穿在身上
		local last_skillID = equip:GetInt("Equip_"..mod)
		local item_container = equip:GetItemContainer()
		if item_container:GetContainerType() == ITEM_CONTAINER_EQUIP then
			--判断装备之前是否有特技特效
			local skill_container = player:GetSkillContainer()
			if last_skillID ~= 0 then
				--判断其余穿着的装备是否有相同特技特效
				local equit_tb = item_container:GetItemList()
				local is_same_skill = 0
				for k,v in pairs(equit_tb) do
					if v:GetGUID() ~= equip:GetGUID() then
						if v:GetInt("Equip_"..mod) == last_skillID then
							is_same_skill = 1
							break
						end
					end
				end
				--如果没有相同的特技特效，删除之前的特技特效
				if is_same_skill == 0 then
					local skillData = skill_container:GetSkill(last_skillID)
					if skillData then
						skill_container:DestroySkill(skillData, true)
						
						--日志
						sLogServerSystem:LogToServer(0,player,"特技特效技能",last_skillID,0,"特技特效","对穿着的装备添加新技能前，删除老的技能")
						
					end
				end
			end
			--创建新技能
			if not skill_container:GetSkill(skillID) then
				local new_skill = skill_container:CreateSkill(skillID, 1, 1, true)
				
				--日志
				sLogServerSystem:LogToServer(0,player,"特技特效技能",0,skillID,"特技特效","对穿着的装备添加新技能")
				
				if not new_skill then
					sLuaApp:NotifyTipsMsg(player, "装备炼化出错，添加技能失败")
					return
				end
			end
			player:RecalcAttr()
		end
		
		local str = "炼化成功"
		
		if last_skillID ~= 0 then
			equip:DelSpecialSkill(tonumber(last_skillID))
			if tostring(mod) == "Stunt" then
				str = str.."  特技"
			elseif tostring(mod) == "SpecialEffect" then
				str = str.."  特效"
			end
			local name1 = SkillConfig.GetById(last_skillID).Name
			local name2 = SkillConfig.GetById(skillID).Name
			str = str..name1.."被替换为"..name2
		end
		equip:AddSpecialSkill(tonumber(skillID))
		equip:SetInt("Equip_"..mod,skillID)
		
		--日志
		sLogServerSystem:LogItemToServer(0,player,equip,"特技特效技能",0,skillID,"特技特效","添加新技能")
		
		sLuaApp:NotifyTipsMsg(player, str)
		
		if Achievement then
			Achievement.Equip_Other(player,1)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "装备炼化出错，配置不存在")
		return
	end
	--sLuaApp:NotifyTipsMsg(player, "炼化成功")
end

function EquipSpecialEffect.extract(player,equip_guid,mod,type_mod)
	if not type_mod then
		type_mod = 0
	end
	mod = tostring(mod)
	--sLuaApp:LuaDbg("mod = "..mod)
	local equip =  sItemSystem:GetItemByGUID(equip_guid)
	if not equip then
		sLuaApp:NotifyTipsMsg(player, "装备提炼出错，道具不存在")	
		return
	end
	if tostring(equip:GetOwnerGUID()) ~= tostring(player:GetGUID()) then
		sLuaApp:NotifyTipsMsg(player, "装备提炼出错，休想骗我，道具不是你的")	
		return
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中无法进行装备炼化！")
		return
	end
	if not EquipGem.CheckRemoveAllGem(player, equip_guid) then
		sLuaApp:NotifyTipsMsg(player, "宝石背包已满，请清理后再进行装备炼化。")	
		return
	end
	
	local skillID = equip:GetInt("Equip_"..mod)
	if EquipSpecialEffectConfig.Config[""..mod][skillID] then
		local tb = EquipSpecialEffectConfig.Config[""..mod][skillID]
		--判断钱够不够
		if not Lua_tools.IsMoneyEnough(player,tb['MoneyType'] , tb['Extract_Money']) then
			if MoneyChange then
			 	local f_name = [[EquipSpecialEffect.extract(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),"]]..equip_guid..[[","]]..mod..[[")]]
				MoneyChange.LackMoney(player, tb['MoneyType'], tb['Extract_Money'], f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(tb['MoneyType']).."不足，无法进行锻造")
			end
			return
		end
		--判断道具够不够
		if not Lua_tools.IsItemEnough(player, {tb['Extract_Item_KeyName'],tb['Extract_Item_Num']}) then
			--sLuaApp:NotifyTipsMsg(player, "道具不足！")
			--这里可以添加一键购买
			local tbale = sItemSystem:GetItemList(player, ItemConfig.GetByKeyName(tb['Extract_Item_KeyName']).Id, 3)
			local num = 0 
			for k,v in pairs(tbale) do
				num = num + v:GetAmount()
			end
			
			--local num = #sItemSystem:GetItemList(player, ItemConfig.GetByKeyName(tb['Extract_Item_KeyName']).Id, 3)
			OneKeyBuy.Main(player,{tb['Extract_Item_KeyName'], tb['Extract_Item_Num']-num})
			return
		end
		
		--拆宝石
		if EquipGem then
			if not EquipGem.RemoveAllGem(player, equip:GetGUID()) then
				return
			end
		end
		--扣钱
		if not Lua_tools.SubMoney(player, tb['MoneyType'], tb['Extract_Money'], "EquipSpecialEffect.extract",""..mod, "moneytype = "..tb['MoneyType'].."  v = "..tb['Extract_Money']) then
			sLuaApp:NotifyTipsMsg(player, "装备提炼出错，扣钱失败")	
			return
		end
		--扣道具
		local bound = 1
		if type_mod == 0 then
			if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), 2) >= tb['Extract_Item_Num'] then
				if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), tb['Extract_Item_Num'] , 2, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
					return false
				end
			else
				if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), 2) == 0 then
					if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), tb['Extract_Item_Num'] , 1, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
						return false
					end
					if not equip:IsBound() then
						bound = 0
					end
				else
					local num_a = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), 2)
					local num_b = tb['Extract_Item_Num']-num_a
					if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), num_a , 2, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
						return false
					end
					if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), num_b , 1, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
						return false
					end
				end
			end
		elseif type_mod == 1 then
			if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), 1) >= tb['Extract_Item_Num'] then
				if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), tb['Extract_Item_Num'] , 1, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
					return false
				end
				if not equip:IsBound() then
					bound = 0
				end
			else
				local num_a = sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), 1)
				local num_b = tb['Extract_Item_Num']-num_a
				if num_a > 0 then
					if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), num_a , 1, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
						return false
					end
				end
				if sItemSystem:ConsumeItemWithId(player, sItemSystem:GetItemIdByKeyname(tb['Extract_Item_KeyName']), num_b , 2, "EquipSpecialEffect", "extract", ""..mod) ~= 0 then
					return false
				end
			end
		end
		
		--销毁装备
		if sItemSystem:DestroyItem(equip,"EquipSpecialEffect","extract","success") ~= 0 then
			sLuaApp:NotifyTipsMsg(player, "装备提炼出错，销毁道具失败")	
			return
		end
		
		--发道具
		if not Lua_tools.AddItem(player, {tb['Artifice_Item_KeyName'],1,bound}, "EquipSpecialEffect.extract", ""..mod , ""..skillID) then
			sLuaApp:NotifyTipsMsg(player, "装备提炼出错，发道具失败")	
			return
		end
	else
		sLuaApp:NotifyTipsMsg(player, "装备提炼失败，请选中要提取的技能")
		return
	end
	sLuaApp:NotifyTipsMsg(player, "恭喜！提炼成功！")
end

--穿装备的时候判断
function EquipSpecialEffect.on_post_equip(player,equip)
	for k,v in pairs(EquipSpecialEffectConfig.Config) do
		local skillID = equip:GetInt("Equip_"..k)
		if skillID ~= 0 then
			--if EquipSpecialEffectConfig.Config[''..k][skillID] then
				local skill_container = player:GetSkillContainer()
				if not skill_container:GetSkill(skillID) then
					local new_skill = skill_container:CreateSkill(skillID, 1, 1, true)
					
					--日志
					sLogServerSystem:LogToServer(0,player,"特技特效技能",0,skillID,"特技特效","穿装备的时候添加新技能")
					
					if not new_skill then
						sLuaApp:NotifyTipsMsg(player, "装备穿戴时出错，添加特技特效失败")
						return
					end
				end
			--end
		end
	end
end

--脱装备的时候判断
function EquipSpecialEffect.on_post_unequip(player,equip)
	for k,v in pairs(EquipSpecialEffectConfig.Config) do
		local skillID = equip:GetInt("Equip_"..k)
		if skillID ~= 0 then
			--if EquipSpecialEffectConfig.Config[''..k][skillID] then
				local item_container = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
				local equit_tb = item_container:GetItemList()
				local is_same_skill = 0
				for a,b in pairs(equit_tb) do
					if b:GetGUID() ~= equip:GetGUID() then
						if b:GetInt("Equip_"..k) == skillID then
							is_same_skill = 1
							break
						end
					end
				end
				--如果没有相同的特技特效，删除之前的特技特效
				if is_same_skill == 0 then
					local skill_container = player:GetSkillContainer()
					local skillData = skill_container:GetSkill(skillID)
					if skillData then
						skill_container:DestroySkill(skillData, true)
						
						--日志
						sLogServerSystem:LogToServer(0,player,"特技特效技能",0,skillID,"特技特效","脱装备的时候，删掉特技特效")
						
					end
				end
			--end
		end
	end
end

function EquipSpecialEffect.test(player)
	local ItemContainer = player:GetItemContainer(ITEM_CONTAINER_EQUIP)
	local equit_tb = ItemContainer:GetItemList()
	for k,v in pairs(equit_tb) do
		v:SetInt("Equip_Stunt",8101)
		v:SetInt("Equip_SpecialEffect",3009)
	end
end

function EquipSpecialEffect.on_login(player)
	local str = [[
			UIDefine.EquipSpecialEffectConfig = ]]..Lua_tools.serialize(EquipSpecialEffectConfig.Config)..[[
		]]
	sLuaApp:ShowForm(player,"脚本表单", str)	
end

function EquipSpecialEffect.get_data(player,edition,mod)
	local script_name = ""
	local tb_name = ""
	mod = tonumber(mod)
	if mod == 1 then
		script_name = "EquipEffectsUI"
		tb_name = "SpecialEffect"
	elseif mod == 2 then
		script_name = "EquipStuntUI"
		tb_name = "Stunt"
	end
	local edition_db = sDBVarSystem:GetString('EquipSpecialEffect_Edition')
	if edition_db ~= EquipSpecialEffectConfig.Edition then
		sLuaApp:LuaDbg("quipSpecialEffect.get_data 1111")
		sDBVarSystem:SetString('EquipSpecialEffect_Edition',EquipSpecialEffectConfig.Edition,0)
		str = [[
			]]..script_name..[[.serverData.EquipSpecialEffectConfig = ]]..Lua_tools.serialize(EquipSpecialEffectConfig.Config[''..tb_name])..[[
			]]..script_name..[[.serverData.Edition = ']]..EquipSpecialEffectConfig.Edition..[['
			]]..script_name..[[.Refresh()
		]]
	else
		
		if edition == EquipSpecialEffectConfig.Edition then
			sLuaApp:LuaDbg("quipSpecialEffect.get_data 2222")
			str = [[
				]]..script_name..[[.Refresh()
			]]
		else
			sLuaApp:LuaDbg("quipSpecialEffect.get_data 3333")
			str = [[
				]]..script_name..[[.serverData.EquipSpecialEffectConfig = ]]..Lua_tools.serialize(EquipSpecialEffectConfig.Config[''..tb_name])..[[
				]]..script_name..[[.serverData.Edition = ']]..EquipSpecialEffectConfig.Edition..[['
				]]..script_name..[[.Refresh()
			]]
		end
	end
	
	sLuaApp:ShowForm(player,"脚本表单", str)	
end

function EquipSpecialEffect.get_all_data(player,edition)
	sLuaApp:LuaDbg("edition = "..edition)
	local script_name = "EquipExtractUI"
	local edition_db = sDBVarSystem:GetString('EquipSpecialEffect_Edition')
	if edition_db ~= EquipSpecialEffectConfig.Edition then
		sLuaApp:LuaDbg("quipSpecialEffect.get_all_data 1111")
		sDBVarSystem:SetString('EquipSpecialEffect_Edition',EquipSpecialEffectConfig.Edition,0)
		str = [[
			]]..script_name..[[.serverData.EquipSpecialEffectConfig = ]]..Lua_tools.serialize(EquipSpecialEffectConfig.Config)..[[
			]]..script_name..[[.serverData.Edition = ']]..EquipSpecialEffectConfig.Edition..[['
			]]..script_name..[[.Refresh()
		]]
	else
		if edition == EquipSpecialEffectConfig.Edition then
			sLuaApp:LuaDbg("quipSpecialEffect.get_all_data 2222")
			str = [[
				]]..script_name..[[.Refresh()
			]]
		else
			sLuaApp:LuaDbg("quipSpecialEffect.get_all_data 3333")
			str = [[
				]]..script_name..[[.serverData.EquipSpecialEffectConfig = ]]..Lua_tools.serialize(EquipSpecialEffectConfig.Config)..[[
				]]..script_name..[[.serverData.Edition = ']]..EquipSpecialEffectConfig.Edition..[['
				]]..script_name..[[.Refresh()
			]]
		end
	end
	
	sLuaApp:ShowForm(player,"脚本表单", str)	
end
--打造随机(非法宝)		1全随机，2随机特技，3随机特效
function EquipSpecialEffect.RandomByBuild(equip,mod)
	if mod == 1 or mod == 2 then
		local probability = math.random(1,10000)
		if probability <= EquipSpecialEffectConfig.StuntProbability then
			local random_num = math.random(1,#EquipSpecialEffectConfig.Random['Stunt'])
			equip:SetInt("Equip_Stunt",EquipSpecialEffectConfig.Random['Stunt'][random_num])
			equip:AddSpecialSkill(tonumber(EquipSpecialEffectConfig.Random['Stunt'][random_num]))
		end
	end
	if mod == 1 or mod == 3 then
		probability = math.random(1,10000)
		if probability <= EquipSpecialEffectConfig.SpecialEffectProbability then
			local random_num = math.random(1,#EquipSpecialEffectConfig.Random['SpecialEffect'])
			equip:SetInt("Equip_SpecialEffect",EquipSpecialEffectConfig.Random['SpecialEffect'][random_num])
			equip:AddSpecialSkill(tonumber(EquipSpecialEffectConfig.Random['SpecialEffect'][random_num]))
		end
	end
end
--指定生成		mod类型：
--1.非法宝，随机特技随机特效，2.非法宝，随机特技，3.非法宝，随机特效，4.法宝，随机特技，
--5.指定特技（不会管你装备类型，也不管技能是否合理）,6.指定特效（不会管你装备类型，也不管技能是否合理）
function EquipSpecialEffect.OnCreate(equip,mod,val)
	local sub_type = equip:GetSubType()
	if mod == 1 then
		if sub_type == EQUIP_WEAPON or sub_type == EQUIP_ARMOR or sub_type== EQUIP_ACCESSORIES then
			EquipSpecialEffect.RandomByCreateNotFaBao(equip,1)
		end
	elseif mod == 2 then
		if sub_type == EQUIP_WEAPON or sub_type == EQUIP_ARMOR or sub_type== EQUIP_ACCESSORIES then
			EquipSpecialEffect.RandomByCreateNotFaBao(equip,2)
		end
	elseif mod == 3 then
		if sub_type == EQUIP_WEAPON or sub_type == EQUIP_ARMOR or sub_type== EQUIP_ACCESSORIES then
			EquipSpecialEffect.RandomByCreateNotFaBao(equip,3)
		end
	elseif mod == 4 then
		if sub_type == EQUIP_AMULET then
			EquipSpecialEffect.RandomByCreateFaBao(equip)
		end
	elseif mod == 5 then
		equip:SetInt("Equip_Stunt",tonumber(val))
	elseif mod == 6 then
		equip:SetInt("Equip_SpecialEffect",tonumber(val))
	end
end

function EquipSpecialEffect.RandomByCreateNotFaBao(equip,mod)
	if mod == 1 or mod == 2 then
		local probability = math.random(1,10000)
		if probability <= EquipSpecialEffectConfig.StuntProbabilityByCreate then
			local random_num = math.random(1,#EquipSpecialEffectConfig.RandomByCreateNotFaBao['Stunt'])
			equip:SetInt("Equip_Stunt",EquipSpecialEffectConfig.RandomByCreateNotFaBao['Stunt'][random_num])
			equip:AddSpecialSkill(tonumber(EquipSpecialEffectConfig.RandomByCreateNotFaBao['Stunt'][random_num]))
		end
	end
	if mod == 1 or mod == 3 then
		probability = math.random(1,10000)
		if probability <= EquipSpecialEffectConfig.SpecialEffectProbabilityByCreate then
			local random_num = math.random(1,#EquipSpecialEffectConfig.RandomByCreateNotFaBao['SpecialEffect'])
			equip:SetInt("Equip_SpecialEffect",EquipSpecialEffectConfig.RandomByCreateNotFaBao['SpecialEffect'][random_num])
			equip:AddSpecialSkill(tonumber(EquipSpecialEffectConfig.RandomByCreateNotFaBao['SpecialEffect'][random_num]))
		end
	end
end

--上线重新注册特技特效 修复战力错误2022-07-20 15:59:11
function EquipSpecialEffect.on_login(player)
	local equip_con = player:GetEquipContainer()
	for site = 0, 10 do
		local equip = equip_con:GetItemBySite(site)
		if equip then
			local special_effect_id = equip:GetInt("Equip_SpecialEffect")
			if special_effect_id ~= 0 then
				equip:AddSpecialSkill(special_effect_id)
			end
			local stunt_id = equip:GetInt("Equip_Stunt")
			if stunt_id ~= 0 then
				equip:AddSpecialSkill(stunt_id)
			end
		end
	end
end

function EquipSpecialEffect.RandomByCreateFaBao(equip)
	local item_id = equip:GetId()
	if not EquipSpecialEffectConfig.ConfigByFaBao[item_id] then
		return
	end
	local random_num = math.random(1,#EquipSpecialEffectConfig.ConfigByFaBao[item_id])
	equip:SetInt("Equip_Stunt",EquipSpecialEffectConfig.ConfigByFaBao[item_id][random_num])
	equip:AddSpecialSkill(tonumber(EquipSpecialEffectConfig.ConfigByFaBao[item_id][random_num]))
end

EquipSpecialEffect.Initialization()