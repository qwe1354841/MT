--宠物/角色加点

AddPoint = {}

--1：将剩余所有点数按照方案加完  2：剩下的不到4点由玩家自己分配
AddPoint.Auto_Mode = 0

--宠物到到x级时，关闭 未经玩家设置的自动加点
AddPoint.StopAutoPetLevel = 50

--宠物免费使用洗点次数
AddPoint.PetFreeNum = 0

--point1 = 力量，point2 = 法力，point3 = 体制，point4 = 耐力，point5 = 敏捷
function AddPoint.Player_AddPoint(player,point1,point2,point3,point4,point5)
	point1 = tonumber(point1)
	point2 = tonumber(point2)
	point3 = tonumber(point3)
	point4 = tonumber(point4)
	point5 = tonumber(point5)
	sLuaApp:LuaDbg("point1 = "..point1)
	sLuaApp:LuaDbg("point2 = "..point2)
	sLuaApp:LuaDbg("point3 = "..point3)
	sLuaApp:LuaDbg("point4 = "..point4)
	sLuaApp:LuaDbg("point5 = "..point5)
	if point1 and point2 and point3 and point4 and point5 then
		local AllUse = point1+point2+point3+point4+point5
		if player:GetAttr(ROLE_ATTR_REMAIN_POINT) >= AllUse and AllUse>0 then
			if player:AddPoint(point3,point2,point1,point5,point4) then
				sLuaApp:NotifyTipsMsg(player, "加点成功")
				player:SetInt("PLAYER_PointsUsed", player:GetInt("PLAYER_PointsUsed")+AllUse)
			end
		end
	end
end

function AddPoint.Pet_AddPoint(player,pet_guid,point1,point2,point3,point4,point5)
	pet_guid = tostring(pet_guid)
	point1 = tonumber(point1)
	point2 = tonumber(point2)
	point3 = tonumber(point3)
	point4 = tonumber(point4)
	point5 = tonumber(point5)
	if point1 and point2 and point3 and point4 and point5 then
		local pet_container  = player:GetPetContainer(1)
		local pet = pet_container:GetPetByGUID(pet_guid)
		if pet:GetOwner() ~= player then
			sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
			return ""
		end
		if pet then
			local AllUse = point1+point2+point3+point4+point5
			if pet:GetAttr(ROLE_ATTR_REMAIN_POINT)>= AllUse and AllUse>0 then
				if pet:AddPoint(point3,point2,point1,point5,point4) then
					sLuaApp:NotifyTipsMsg(player, "加点成功")
					pet:SetInt("PET_PointsUsed", pet:GetInt("PET_PointsUsed")+AllUse)
				end
			end
		end
	end
end

--function AddPoint.Guard_AddPoint(player,guard_guid,point1,point2,point3,point4,point5)
--	guard_guid = tostring(guard_guid)
--	point1 = tonumber(point1)
--	point2 = tonumber(point2)
--	point3 = tonumber(point3)
--	point4 = tonumber(point4)
--	point5 = tonumber(point5)
--	if point1 and point2 and point3 and point4 and point5 then
--		local guard = sGuardSystem:GetGuard(guard_guid)
--		if guard then
--			if guard:GetMaster() ~= player then
--				sLuaApp:GetMaster(player, "并非侍从拥有者，无法操作")
--				return ""
--			end
--			local AllUse = point1+point2+point3+point4+point5
--			if guard:GetAttr(ROLE_ATTR_REMAIN_POINT)>= AllUse and AllUse>0 then
--				if not guard:AddPoint(point1,point2,point3,point4,point5) then
--					--sLuaApp:LuaDbg("侍从加点失败")
--				else
--					sLuaApp:NotifyTipsMsg(player, "加点成功")
--					guard:SetInt("GUARD_PointsUsed", guard:GetInt("GUARD_PointsUsed")+AllUse)
--				end
--			end
--		end
--	end
--end

--宠物自动加点
function AddPoint.Pet_Auto_AddPoint(player,pet_guid,point1,point2,point3,point4,point5,flag)
    --sLuaApp:LuaDbg(""..pet_guid..point1..point2..point3..point4.."。。。"..flag)
	pet_guid = tostring(pet_guid)
	point1 = tonumber(point1)
	point2 = tonumber(point2)
	point3 = tonumber(point3)
	point4 = tonumber(point4)
	point5 = tonumber(point5)
	--判断自动加点的预设是否符合规则
	if point1 <= 5 and point1 >= 0 and point2 <= 5 and point2 >= 0 and point3 <= 5 and point3 >= 0 and point4 <= 5 and  point4 >= 0 and point5 <= 5 and  point5 >= 0 then
		if point1+point2+point3+point4+point5 ~= 5 then
			sLuaApp:NotifyTipsMsg(player, "必须分配5点")
			return
		end
		local str = ""..point1..","..point2..","..point3..","..point4..","..point5
		local pet_container  = player:GetPetContainer(1)
		local pet = pet_container:GetPetByGUID(pet_guid)
		if not pet then
			sLuaApp:LuaErr("AddPoint.Pet_Auto_AddPoint找不到pet对象")
			return
		end
		pet:SetString("ADDPOINT_Method",str)
	
		flag = tonumber(flag)
	--判断宠物是否开启自动加点
		pet:SetInt("ADDPOINT_Auto",flag)

		--sLuaApp:LuaDbg(""..pet:GetInt("ADDPOINT_Auto"))
	
		if flag == 1 then 
			AddPoint.Auto_AddPoint(player,pet)
			sLuaApp:NotifyTipsMsg(player, "设置成功！")
			if pet:GetInt("AddPoint_IsPlayerSetted") == 0 then
				pet:SetInt("AddPoint_IsPlayerSetted", 1)
			end
		else
			sLuaApp:NotifyTipsMsg(player, "加点方案已保存，但自动加点未开启")
		end
		sLuaApp:ShowForm(player, "脚本表单", "if AddPointUI then AddPointUI.OnAutoPointFinish() end")
	else
		sLuaApp:NotifyTipsMsg(player, "每个属性分配的属性点必须在0和5之间")
	end
end

--玩家自动加点
function AddPoint.Player_Auto_AddPoint(player,point1,point2,point3,point4,point5,flag)
	point1 = tonumber(point1)
	point2 = tonumber(point2)
	point3 = tonumber(point3)
	point4 = tonumber(point4)
	point5 = tonumber(point5)
	--sLuaApp:LuaDbg(point1..","..point2..","..point3..","..point4)
	if point1 <= 5 and point1 >= 0 and point2 <= 5 and point2 >= 0 and point3 <= 5 and point3 >= 0 and point4 <= 5 and  point4 >= 0 and point5 <= 5 and  point5 >= 0 then
		if point1+point2+point3+point4+point5 ~= 5 then
			sLuaApp:NotifyTipsMsg(player, "必须分配5点")
			return
		end
		local str = ""..point1..","..point2..","..point3..","..point4..","..point5
		player:SetString("ADDPOINT_Method",str)
	
		flag = tonumber(flag)
		player:SetInt("ADDPOINT_Auto",flag)
		--判断玩家是否开启自动加点
		if flag == 1 then
			AddPoint.Auto_AddPoint(player,player)
			sLuaApp:NotifyTipsMsg(player, "设置成功！")
			if player:GetInt("AddPoint_IsPlayerSetted") == 0 then
				player:SetInt("AddPoint_IsPlayerSetted", 1)
			end
		else
			sLuaApp:NotifyTipsMsg(player, "加点方案已保存，但自动加点未开启")
		end
		sLuaApp:ShowForm(player, "脚本表单", "if AddPointUI then AddPointUI.OnAutoPointFinish() end")
	else
		sLuaApp:NotifyTipsMsg(player, "每个属性分配的属性点必须在0和5之间")
	end
end

--玩家升级判断
function AddPoint.Player_LevelUpJudge(player,newlevel)
	if player == nil or newlevel == nil then
		return
	end
	if newlevel == (AddPoint.StopAutoPetLevel+1 or 50) then
		if player:GetInt("AddPoint_IsPlayerSetted") == 0 then
			player:SetInt("ADDPOINT_Auto",0)
		end
	elseif newlevel <= (AddPoint.StopAutoPetLevel or 50) then
		--if player:GetInt("ADDPOINT_Auto") == 0 then
		--	player:SetInt("ADDPOINT_Auto",1)
		--end
		AddPoint.Auto_AddPoint(player,player)
	elseif newlevel > (AddPoint.StopAutoPetLevel+1 or 50) then
		--自动加点
		if player:GetInt("ADDPOINT_Auto") == 1 then		
			AddPoint.Auto_AddPoint(player,player)
		end
	end
end

local ROLE_tb = {
				[3] = "PLAYER",
				[6] = "PET",
				[7] = "GUARD",
			}

function AddPoint.Auto_AddPoint(player,role)
	if role:GetInt("ADDPOINT_Auto") == 0 then
		return
	end
	local method = role:GetString("ADDPOINT_Method")
	if method then
		local list = sLuaApp:StrSplit  ( method, ",")
		if #list ~= 5 then
			role:SetInt("ADDPOINT_Auto",0)
			return
		end
		--拿出要加的点数
		local point1 = tonumber(list[1])
		local point2 = tonumber(list[2])
		local point3 = tonumber(list[3])
		local point4 = tonumber(list[4])
		local point5 = tonumber(list[5])
		local proportion1 = point1/5
		local proportion2 = point2/5
		local proportion3 = point3/5
		local proportion4 = point4/5
		local proportion5 = point5/5
		
		--判断剩余点数是否大于5，如果大于5   将会按照玩家加点方案加点
	    local have = role:GetAttr(ROLE_ATTR_REMAIN_POINT)
		local surplus = 0
		if have >= 5 then
			if have%5 == 0 then
				--按玩家方案将剩余点数加完
				role:AddPoint(have*proportion3, have*proportion2, have*proportion1, have*proportion5,have*proportion4)
			else
				surplus = have%5
				local add = have-surplus
				role:AddPoint(add*proportion3, add*proportion2, add*proportion1, add*proportion5,add*proportion4)
			end
			local role_type = role:GetType()
			
			role:SetInt(ROLE_tb[role_type].."_PointsUsed", have-surplus+ role:GetInt(ROLE_tb[role_type].."_PointsUsed"))
		end

		if surplus > 0 then
			sLuaApp:NotifyTipsMsg(player, "还有不够自动分配的点数残留，请手动加点。")
		end
	end
end

--侍从自动加点
--function AddPoint.Guard_Auto_AddPoint(player,guard_guid,point1,point2,point3,point4,flag)
--    --sLuaApp:LuaDbg(""..guard_guid..point1..point2..point3..point4.."。。。"..flag)
--	--guard_guid = tostring(guard_guid)
--	point1 = tonumber(point1)
--	point2 = tonumber(point2)
--	point3 = tonumber(point3)
--	point4 = tonumber(point4)
--	if point1 <= 4 and point1 >= 0 and point2 <= 4 and point2 >= 0 and point3 <= 4 and point3 >= 0 and point4 <= 4 and  point4 >= 0 then
--		if point1+point2+point3+point4 ~= 4 then
--			sLuaApp:NotifyTipsMsg(player, "必须分配4点")
--			return
--		end
--		local str = ""..point1..","..point2..","..point3..","..point4
--		local guard = sGuardSystem:GetGuard(guard_guid)
--		guard:SetString("ADDPOINT_Method",str)
--	
--		flag = tonumber(flag)
--			--判断侍从是否开启自动加点
--		guard:SetInt("ADDPOINT_Auto",flag)
--
--		--sLuaApp:LuaDbg(""..guard:GetInt("ADDPOINT_Auto"))
--	
--		if flag == 1 then 
--			AddPoint.Auto_AddPoint(player,guard,point1,point2,point3,point4)
--		else
--			sLuaApp:NotifyTipsMsg(player, "加点方案已保存，但自动加点未开启")
--		end
--		sLuaApp:ShowForm(player, "脚本表单", "if AddPointUI then AddPointUI.OnAutoPointFinish() end")
--	else
--		sLuaApp:NotifyTipsMsg(player, "每个属性分配的属性点必须在0和4之间")
--	end
--end

function AddPoint.Pet_ResetPoint(player,pet_guid)
	pet_guid = tostring(pet_guid)
	--sLuaApp:LuaDbg(pet_guid.."............")
	local itemKey = "重洗髓丹"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	--sLuaApp:LuaDbg(tostring(itemData.Name).."...............")
	local pet_container  = player:GetPetContainer(1)
	local pet = pet_container:GetPetByGUID(pet_guid)
	
	--判断战斗中
	if not pet then return "" end
	if not PetDevelop.CheckFight(pet) then return "" end
	
	local points_used = pet:GetInt("PET_PointsUsed")
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	if pet then
		if points_used ~= 0 then
			
			local use_free_num = pet:GetInt("AddPoint_FreeNum")
			if use_free_num < AddPoint.PetFreeNum then
				local str = [[GlobalUtils.ShowServerBoxMessage("本次洗点免费，剩余免费次数：]]..(AddPoint.PetFreeNum-use_free_num)..[[")]]
				player:SetString("SYSTEM_ConfirmBox_Function", "AddPoint.Pet_ResetPointConfirm("..player:GetGUID()..","..pet_guid..",0,'"..itemKey.."')")
				sLuaApp:ShowForm(player, "脚本表单", str)
				return ""
			end

			local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>重置宠物属性点？")]]
							player:SetString("SYSTEM_ConfirmBox_Function", "AddPoint.Pet_ResetPointConfirm("..player:GetGUID()..","..pet_guid..","..itemData.Id..",'"..itemKey.."')")
							sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		else
			sLuaApp:NotifyTipsMsg(player, "宠物没有加过点，无法操作")
		end
	end
end

function AddPoint.Pet_ResetPointConfirm(player_guid,pet_guid,itemId,itemKey)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local pet_container  = player:GetPetContainer(1)
	local pet = pet_container:GetPetByGUID(pet_guid)
	if itemId == 0 then
		pet:SetInt("AddPoint_FreeNum", pet:GetInt("AddPoint_FreeNum") + 1)
		pet:ClearPoint()
		pet:SetInt("PET_PointsUsed", 0)
	else
		local item = sItemSystem:GetItemList(player, itemId, 3)[1]
		if not item then
			sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemId).Name)
			OneKeyBuy.Main(player,{itemKey,1})
			return ""
		end
		PetItem.UseItem(player, pet_guid, item:GetGUID(), 0)
	end
	
	pet:SetInt("ADDPOINT_Auto",0)
	sLuaApp:NotifyTipsMsg(player, "宠物自动加点已关闭")
	player:SetString("SYSTEM_ConfirmBox_Function", "")
	pet:AddRemainPoint(pet:GetInt("Pet_AddRemainPoint"))
	pet:RecalcAttr()
end

function AddPoint.Player_ResetPoint(player)
	local itemKey = "重洗灵丹"
	local itemData = ItemConfig.GetByKeyName(itemKey)
	local points_used = player:GetInt("PLAYER_PointsUsed")
	if points_used ~= 0 then
		--local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>重置人物属性点？")]]
		--				player:SetString("SYSTEM_ConfirmBox_Function", "AddPoint.player_ResetPointConfirm('"..player:GetGUID().."',"..itemData.Id..")")
		--				sLuaApp:ShowForm(player, "脚本表单", str)
		--return ""
		AddPoint.player_ResetPointConfirm(player:GetGUID(),itemData.Id)
	else
		sLuaApp:NotifyTipsMsg(player, "您没有加过点，无法操作")
	end
end

function AddPoint.player_ResetPointConfirm(player_guid,itemId)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local item = sItemSystem:GetItemList(player, itemId, 3)[1]
	local itemKey = ItemConfig.GetById(itemId).KeyName
	if not item then
		sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemId).Name)
		OneKeyBuy.Main(player,{itemKey,1})
		return ""
	end
	sItemSystem:UseItem(player,item)
	--if sItemSystem:UseItem(player,item) == 0 then
	--	sLuaApp:LuaErr("洗点成功")
	--	player:ClearPoint()
	--	player:SetInt("ADDPOINT_Auto",0)
	--	sLuaApp:NotifyTipsMsg(player, "玩家自动加点已关闭")
	--	player:SetString("SYSTEM_ConfirmBox_Function", "")
	--	player:RecalcAttr()
	--end
end

-- function AddPoint.Guard_ResetPoint(player,Guard_guid)
-- 	local itemKey = "侍从洗点丹"
-- 	local itemData = ItemConfig.GetByKeyName(itemKey)
-- 	local Guard = sGuardSystem:GetGuard(Guard_guid)
-- 	local points_used = Guard:GetInt("GUARD_PointsUsed")
-- 	if Guard then
-- 		if Guard:GetMaster() ~= player then
-- 			sLuaApp:GetMaster(player, "并非侍从拥有者，无法操作")
-- 			return ""
-- 		end
-- 		if points_used ~= 0 then
-- 			local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>重置侍从属性点？")]]
-- 							player:SetString("SYSTEM_ConfirmBox_Function", "AddPoint.Guard_ResetPoinConfirm('"..player:GetGUID().."',"..itemData.Id..",'"..itemKey.."',"..Guard_guid..")")
-- 							sLuaApp:ShowForm(player, "脚本表单", str)
-- 			return ""
-- 		else
-- 			sLuaApp:NotifyTipsMsg(player, "侍从没有加过点，无法操作")
-- 		end
-- 	end
-- end

-- function AddPoint.Guard_ResetPoinConfirm(player_guid,itemId,itemKey,Guard_guid)
-- 	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
-- 	local item = sItemSystem:GetItemList(player, itemId, 3)[1]
-- 	if not item then
-- 		sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetById(itemId).Name)
-- 		OneKeyBuy.Main(player,{itemKey,1})
-- 		return ""
-- 	end
	
-- 	local Guard = sGuardSystem:GetGuard(Guard_guid)-------------------
-- 	local points_used = Guard:GetInt("GUARD_PointsUsed")
-- 	local points_now = Guard:GetAttr(ROLE_ATTR_REMAIN_POINT)
-- 	if points_used ~= 0 then
-- 		if sItemSystem:ConsumeItemWithId(player, itemId, 1, 3, "system", "侍从洗点", "侍从洗点消耗") == 0 then
-- 			--sLuaApp:LuaDbg("删除侍从洗点丹成功")
-- 			Guard:ClearPoint()
-- 			Guard:SetInt("GUARD_PointsUsed",0)
-- 			Guard:SetInt("ADDPOINT_Auto",0)
-- 			sLuaApp:NotifyTipsMsg(player, "侍从自动加点已关闭")
-- 			sLuaApp:NotifyTipsMsg(player, "使用成功")
-- 		end
-- 	else
-- 		sLuaApp:NotifyTipsMsg(player, "侍从还没加过点！不能洗点~")
-- 	end
-- end

function AddPoint.Not_Enough_Auto(Role,SurPoints,PlanList)
	if Role == nil or SurPoints == nil or PlanList == nil then
		return
	end
	local pointList = {}
	for i = 1,5 do
		if	SurPoints ~= 0 then
			if PlanList[i] ~= 0 then
				if SurPoints-PlanList[i] > 0 then
					pointList[i] = PlanList[i]
					SurPoints = SurPoints-PlanList[i]
				else
					pointList[i] = SurPoints
					SurPoints = 0
				end
			else
				pointList[i] = 0
			end
		else
			pointList[i] = 0
		end
	end
	Role:AddPoint(pointList[1], pointList[2], pointList[3], pointList[4],pointList[5])
end

--[[function AddPoint.autoAdd(pet)
	local method = pet:GetString("point_Method")
	if  method then
		local list = Split("method", ",")
	else
		return
	end

	--拿出要加的点数
	point1 = tonumber(list[1])
	point2 = tonumber(list[2])
	point3 = tonumber(list[3])
	point4 = tonumber(list[4])

	if point1 and point2 and point3 and point4  then

		if not pet:AddPoint(point1,  point2,  point3,  point4,0)  then
			sLuaApp:LuaDbg("宠物加点失败")
		else
			sLuaApp:NotifyTipsMsg(player, "加点成功")
		end
		
	end
end
]]
function AddPoint.BornSetAutoPoint(player, p1, p2, p3, p4, p5, role_type, role_guid)
	if not p1 or not p2 or not p3 or not p4 or not p5 or not role_type or not role_guid then return end
	p1 = tonumber(p1)
	p2 = tonumber(p2)
	p3 = tonumber(p3)
	p4 = tonumber(p4)
	p5 = tonumber(p5)
	role_type = tonumber(role_type)
	role_guid = tonumber(role_guid)
	if p1 <= 5 and p1 >= 0 and p2 <= 5 and p2 >= 0 and p3 <= 5 and p3 >= 0 and p4 <= 5 and  p4 >= 0 and p5 <= 5 and  p5 >= 0 then
		if p1+p2+p3+p4+p5 ~= 5 then
			--sLuaApp:NotifyTipsMsg(player, "必须分配5点")
			sLuaApp:LuaErr("AddPoint.BornSetAutoPoint  必须分配5点")
			return
		end
	else
		return
	end
	local str = ""..p1..","..p2..","..p3..","..p4..","..p5
	if role_type == 1 then 
		player:SetString("ADDPOINT_Method",str)
		player:SetInt("ADDPOINT_Auto",1)
		AddPoint.Auto_AddPoint(player,player)
	elseif role_type == 2 then
		local pet = sPetSystem:GetPetByGUID(role_guid)
		if not pet then return end
		pet:SetString("ADDPOINT_Method",str)
		pet:SetInt("ADDPOINT_Auto",1)
		AddPoint.Auto_AddPoint(player,pet)
	end
end