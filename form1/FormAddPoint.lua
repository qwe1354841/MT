--宠物/角色加点相关表单

FormAddPoint = {}

function FormAddPoint.Player_AddPoint(player,point1,point2,point3,point4,point5)
	if not MainUISwitch.CheckOpenLevel(player,"角色","属性","加点") then
		return ""
	end
	if AddPoint then
		AddPoint.Player_AddPoint(player,point1,point2,point3,point4,point5)
	end
	
	return ""
end

function FormAddPoint.Pet_AddPoint(player,pet_guid,point1,point2,point3,point4,point5)
	if not MainUISwitch.CheckOpenLevel(player,"宠物","属性","加点") then
		return ""
	end
	--sLuaApp:LuaDbg("222222222222222222222222222222")
	if AddPoint then
		AddPoint.Pet_AddPoint(player,pet_guid,point1,point2,point3,point4,point5)
	end
	
	return ""
end

function FormAddPoint.Pet_Auto_AddPoint(player,pet_guid,point1,point2,point3,point4,point5,flag)
	if AddPoint then
		AddPoint.Pet_Auto_AddPoint(player,pet_guid,point1,point2,point3,point4,point5,flag)
	end
	
	return ""
end

function FormAddPoint.Player_Auto_AddPoint(player,point1,point2,point3,point4,point5,flag)
	if AddPoint then
		AddPoint.Player_Auto_AddPoint(player,point1,point2,point3,point4,point5,flag)
	end
	
	return ""
end

--保存角色系统推荐加点方案
function FormAddPoint.Player_SavePointMethod(player,point1,point2,point3,point4,point5)
	if AddPoint then
		AddPoint.Player_SavePointMethod(player,point1,point2,point3,point4,point5)
	end
	
	return ""
end
--function FormAddPoint.Guard_Auto_AddPoint(player,guard_guid,point1,point2,point3,point4,flag)
--	if AddPoint then
--		AddPoint.Guard_Auto_AddPoint(player,guard_guid,point1,point2,point3,point4,flag)
--	end
--	
--	return ""
--end

function FormAddPoint.Pet_ResetPoint(player,pet_guid)
	if AddPoint then
		AddPoint.Pet_ResetPoint(player,pet_guid)
	end

	return ""
end

function FormAddPoint.Player_ResetPoint(player)
	if AddPoint then
		AddPoint.Player_ResetPoint(player)
	end

	return ""
end

-- function FormAddPoint.Guard_ResetPoint(player,Guard_guid)
-- 	if AddPoint then
-- 		AddPoint.Guard_ResetPoint(player,Guard_guid)
-- 	end

-- 	return ""
-- end

-- function FormAddPoint.Guard_AddPoint(player,guard_guid,point1,point2,point3,point4)
-- 	--sLuaApp:LuaDbg("222222222222222222222222222222")
-- 	if AddPoint then
-- 		AddPoint.Guard_AddPoint(player,guard_guid,point1,point2,point3,point4,0)
-- 	end
	
-- 	return ""
-- end

function FormAddPoint.BornSetAutoPoint(player, p1, p2, p3, p4, p5, role_type, role_guid)
	if AddPoint then
		AddPoint.BornSetAutoPoint(player, p1, p2, p3, p4, p5, role_type, role_guid)
	end
	return ""
end