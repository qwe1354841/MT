PetEgg = {}

--遍历背包道具
function PetEgg.GetData(player)
	sLuaApp:LuaDbg("PetEgg.GetData")
	local itemCon = player:GetItemContainer(1) 
	if itemCon then
		local pet_list = itemCon:GetItemList()
		if pet_list then
			for k, v in pairs(pet_list) do
				sLuaApp:LuaDbg("itemGUID:"..v:GetGUID())
				sLuaApp:LuaDbg("item_Id:"..v:GetId())
			end
		end
	end
end

--获取宠物蛋数据
function PetEgg.on_player_login(player)
	--sLuaApp:LuaDbg("获取宠物蛋数据登录回调")
	if PetEggConfig.PetEggKind then
		local str = [[UIDefine.PetEggData = ]]..Lua_tools.serialize(PetEggConfig.PetEggKind)
		--sLuaApp:LuaDbg(str)
		sLuaApp:ShowForm(player, "脚本表单", str)
		return ""
	else
		sLuaApp:LuaErr("PetEggConfig.PetEggKind缺失")
		return ""
	end

end

--@newinter PetEgg.HatchPet(player, 360675745989459969, 360675745989459971)
--宠物孵化
function PetEgg.HatchPet(player, petEgg_guid, culture_guid)
	
	if petEgg_guid == nil then
		sLuaApp:NotifyTipsMsg(player, "您尚未选择宠物蛋，无法孵化！")
		return ""
	end
	if culture_guid == nil then
		sLuaApp:NotifyTipsMsg(player, "您尚未使用培养剂，无法孵化！")
		return ""
	end
	sLuaApp:LuaDbg("petEgg_guid:"..petEgg_guid)	
	sLuaApp:LuaDbg("culture_guid:"..culture_guid)
	local petEgg = sItemSystem:GetItemByGUID(petEgg_guid)
	local culture = sItemSystem:GetItemByGUID(culture_guid)
	local petEggData = ItemConfig.GetById(petEgg:GetId())
	local cultureData = ItemConfig.GetById(culture:GetId())
	sLuaApp:LuaDbg("petEggData.Type:"..petEggData.Type)
	sLuaApp:LuaDbg("petEggData.Subtype:"..petEggData.Subtype)
	if petEgg:GetOwnerGUID() ~= player:GetGUID() then
		return ""
	end
	if culture:GetOwnerGUID() ~= player:GetGUID() then
		return ""
	end
	
	if petEggData.Type ~= 3 or petEggData.Subtype ~= 15 then
		sLuaApp:NotifyTipsMsg(player, "宠物蛋道具错误")
		return ""
	end
	if cultureData.Type ~= 3 or cultureData.Subtype ~= 20 then
		sLuaApp:NotifyTipsMsg(player, "培养液道具错误")
		return ""
	end
	if PetEggConfig.PetEggKind then
		if PetEggConfig.PetEggKind[petEggData.KeyName] ~= nil then
			if PetEggConfig.HatchData[cultureData.KeyName] ~= nil then
				local petKeyName = PetEggConfig.PetEggKind[petEggData.KeyName]
				local petData = PetConfig.GetByKeyName(petKeyName)
				local pet_id = petData.Id
				local growthRate = PetEggConfig.HatchData[cultureData.KeyName]["growthRate"]/100
				local is_bind = false
				--sLuaApp:LuaDbg("culture:"..tostring(culture:IsBound()))
				--sLuaApp:LuaDbg("petEgg:"..tostring(petEgg:IsBound()))
				if culture:IsBound() or petEgg:IsBound() then
					is_bind = true
				end
				--sLuaApp:LuaDbg("is_bind:"..tostring(is_bind))
				--sLuaApp:LuaDbg("petKeyName:"..petKeyName)
				--sLuaApp:LuaDbg("pet_id:"..pet_id)
				--sLuaApp:LuaDbg("growthRate:"..growthRate)
				--Min + (Max - Min) * growthRate
				if Lua_tools then
					if Lua_tools.GetPetBagFree(player) > 0 then
						if sItemSystem:ConsumeItem(petEgg, 1, "宠物蛋系统", "宠物蛋孵化", "宠物蛋孵化扣除宠物蛋") == 0 and sItemSystem:ConsumeItem(culture, 1, "宠物蛋系统", "宠物蛋孵化", "宠物蛋孵化扣除培养液") then
							local pet = sPetSystem:AddPetEx(player, pet_id, 0, is_bind, "宠物蛋系统", "宠物蛋孵化", "宠物蛋孵化给予宠物")
							if pet == nil then
								sLuaApp:LuaErr("给予玩家宠物失败")
								return ""
							end
							
							for k, v in pairs(PetUpStarConfig.IntConfig) do
							--最终资质=最大资质*提升百分比+程序随机得到资质*（1-提升百分比）
								local lastTalent = petData[v[1]]*growthRate + PetRefining.TalentFunc[v[4]](pet, "Get") * (1-growthRate)
								--sLuaApp:LuaDbg("lastTalent:"..lastTalent)
								local addTalent = math.ceil(lastTalent - PetRefining.TalentFunc[v[4]](pet, "Get"))
								--sLuaApp:LuaDbg("addTalent:"..addTalent)
								if addTalent > 0 then
									if not PetRefining.TalentFunc[v[4]](pet, "Add", addTalent) then
										sLuaApp:LuaErr("增加宠物资质失败")
										return ""
									end
								elseif addTalent < 0 then
									if not PetRefining.TalentFunc[v[4]](pet, "Sub", -addTalent) then
										sLuaApp:LuaErr("降低宠物资质失败")
										return ""
									end
								end
							end
							if PetEggConfig.HatchData[cultureData.KeyName]["isHigh"] == 1 then
								sLuaApp:LuaDbg("增加技能")
								PetSystem.HighHatchBornGetSkill(pet)
							end
							--sLuaApp:LuaDbg("Name:"..petData.Name)
							local str = [[
								if PetHatchUI then
									PetHatchUI.Refresh()
									PetHatchUI.OnExit()
								end 
							]]
							sLuaApp:NotifyTipsMsg(player, "孵化成功, 您获得了宠物"..petData.Name)
							sLuaApp:ShowForm(player, "脚本表单", str)
							return ""
						else
							sLuaApp:NotifyTipsMsg(player, "道具扣除失败")
							return ""
						end
					else
						sLuaApp:NotifyTipsMsg(player, "您的宠物栏已满，无法孵化")
						return ""
					end
				else
					sLuaApp:LuaErr("缺少Lua_tools")
					return ""
				end
			else
				sLuaApp:NotifyTipsMsg(player,"培养液道具错误")
				return ""
			end
		else
			sLuaApp:NotifyTipsMsg(player,"该宠物蛋暂时未开放孵化")
			return ""
		end
	else
		sLuaApp:LuaErr("不存在配置PetEggConfig.PetEggKind")
		return ""
	end
end


