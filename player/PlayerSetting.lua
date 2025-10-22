--装备相关表单

PlayerSetting = {}

--玩家初始宠物栏位
PlayerSetting.PetBagInitial = 2

--玩家身上最大宠物栏位
PlayerSetting.PetBagMax = 20

--玩家初始宠物栏位
PlayerSetting.PetBagInitial_WareHouse = 5

--玩家仓库最大宠物栏位
PlayerSetting.PetBagMax_WareHouse = 50

--玩家初始背包栏位（必须是6的倍数）
PlayerSetting.BagInitial = 42

--玩家最大包裹栏位（必须是6的倍数）
PlayerSetting.BagMax = 300

--玩家初始仓库页数
PlayerSetting.BagInitial_WareHouse = 1

--玩家最大仓库页数
PlayerSetting.BagMax_WareHouse = 10

--战斗中可以召唤宠物数量 -1表示无限次
PlayerSetting.SummonPetMax = -1



function PlayerSetting.PlayerIntialize(player)
	local bagCon = player:GetItemContainer(1)
	bagCon:SetCapacity(PlayerSetting.BagInitial)
	local equipCon = player:GetItemContainer(5)
	equipCon:SetCapacity(10)
	local WbafCon = player:GetItemContainer(7)
	WbafCon:SetCapacity(PlayerSetting.BagInitial_WareHouse*36)
	local petCon = player:GetPetContainer(1)
	petCon:SetCapacity(PlayerSetting.PetBagInitial)
	local WpetCon = player:GetPetContainer(2)
	WpetCon:SetCapacity(PlayerSetting.PetBagInitial_WareHouse)

	--无名小吏
	sTitleSystem:AddTitle(player, 554)
	sTitleSystem:SetCurTitle(player, 554)

	player:SetInt("PetLineup_SummonPetMax", PlayerSetting.SummonPetMax or -1)
	return true
end

local ChatLimit = {
	{1, "Recharge", 0, "充值达到0元才能解锁当前频道聊天！"},	--当前
	{2, "Recharge", 0, "充值达到0元才能解锁队伍频道聊天！"},	--队伍
	{3, "Recharge", 0, "充值达到0元才能解锁帮派频道聊天！"},	--帮派
	{4, "Recharge", 0, "充值达到0元才能解锁地图频道聊天！"},	--地图
	{5, "Recharge", 0, "充值达到0元才能解锁喇叭频道聊天！"},	--喇叭
	{6, "Recharge", 0, "充值达到0元才能解锁招募频道聊天！"},	--招募
	{7, "Recharge", 0, "充值达到0元才能解锁门派频道聊天！"},	--门派
	--{8, "CustomInt", {"Recharge_System_MonthCard_2","> sLuaApp:DaySinceEpoch(0)"}, "激活至尊卡能解锁世界频道聊天！"},	--世界
	{8, "Level", 50, "激活至尊卡能解锁世界频道聊天！"},	--世界
}

function PlayerSetting.ResetChatLimit(player)
	for k,v in ipairs(ChatLimit) do
		if v[2] == "Recharge" then
			player:ForbidChannelAndShowMsg(v[1],v[4],player:GetBillInIngot() < v[3]*Lua_tools.RMBtoIngot)
			sLuaApp:LuaDbg(""..player:GetName().." "..v[1].." set " .. tostring(player:GetBillInIngot() < v[3]*Lua_tools.RMBtoIngot))
		elseif v[2] == "CustomInt" then
			if type(v[3]) == "table" then
				local Num1 = player:GetInt(v[3][1])
				player:ForbidChannelAndShowMsg(v[1],v[4],assert(load("return not (" .. Num1 .. v[3][2]..")"))())		
			end
		elseif v[2] == "Level" then
			player:ForbidChannelAndShowMsg(v[1],v[4],player:GetAttr(ROLE_ATTR_LEVEL) < v[3])
		end
	end
end