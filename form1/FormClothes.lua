--时装和羽翼表单
FormClothes = {}

--获取玩家时装信息
function FormClothes.GetClothesData(player)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","时装") then
		return ""
	end
	if ClothesSystem then
		ClothesSystem.GetData(player)
	end
	return ""
end

--玩家穿脱时装
function FormClothes.WearClothes(player,Clothes_Id)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","时装") then
		return ""
	end
	if ClothesSystem then
		ClothesSystem.WearClothes(player,Clothes_Id)
	end
	return ""
end

--使用Item
function FormClothes.UseClothesItem(player,Item_Id)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","时装") then
		return ""
	end
	if ClothesSystem then
		ClothesSystem.UseClothesItem(player,Item_Id)
	end
	return ""
end

--获取玩家羽翼信息
function FormClothes.GetWingData(player)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","羽翼") then
		return ""
	end
	if WingSystem then
		WingSystem.GetData(player)
	end
	return ""
end

--获取羽翼开启等级
function FormClothes.GetOpenLevel(player)
	if not MainUISwitch.CheckOpenLevel(player,"包裹") then
		return ""
	end
	if WingSystem then
		WingSystem.GetOpenLevel(player)
	end
	return ""
end

--玩家穿脱羽翼
function FormClothes.WearWing(player,Wing_Id)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","羽翼") then
		return ""
	end
	if WingSystem then
		WingSystem.WearWing(player,Wing_Id)
	end
	return ""
end

--羽翼成长升级
function FormClothes.WingGrowLevelUp(player,itemStr)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","羽翼") then
		return ""
	end
	if WingSystem then
		WingSystem.WingGrowLevelUp(player,itemStr)
	end
	return ""
end

--羽翼成长升阶
function FormClothes.WingGrowAddStage(player)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","羽翼") then
		return ""
	end
	if WingSystem then
		WingSystem.WingGrowAddStage(player)
	end
	return ""
end

--客户端获取当前升阶物品
function FormClothes.GetNowStageItem(player)
	if not MainUISwitch.CheckOpenLevel(player,"包裹","羽翼") then
		return ""
	end
	if WingSystem then
		WingSystem.GetNowStageItem(player)
	end
	return ""
end