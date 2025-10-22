--首充
FirstRecharge={}

---首充金额
FirstRecharge.RMBNum = 6

--奖励物品表 建议公用物品表+种族物品表=8个种类 ItemList_role_id
FirstRecharge.Reward = {
	ItemList = {"高级宠物秘籍包", 1,0,"装备强化石", 20,0,"宝石福袋", 10,0,"侠义金丹", 1,0,"1000银元宝", 2,1}, 
	ItemList_31 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--谪剑仙，男，重剑
	ItemList_32 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--飞翼姬，女，弓箭
	ItemList_33 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--烟云客，男，扇子
	ItemList_34 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--冥河使，男，笛子
	ItemList_35 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--阎魔令，男，爪刺
	ItemList_36 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--雨师君，男，毛笔
	ItemList_37 = {"新手橙男头盔#4",1,0,"新手橙男护甲#4",1,0},--神霄卫，男，阔刀
	ItemList_38 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--傲红莲，女，长枪
	ItemList_39 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--花弄影，女，双剑
	ItemList_40 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--青丘狐，女，长鞭
	ItemList_41 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--海鲛灵，女，短杖
	ItemList_42 = {"新手橙女头盔#4",1,0,"新手橙女护甲#4",1,0},--凤凰仙，女，绣伞
	GuardList = {"金角大王", 1}
--[[	ItemList = {"一阶仙器防具礼包",1,0, "通用项链根骨向",1,0, "通用靴子根骨向",1,0, "通用戒指根骨向",1,0, "通用护腕根骨向",1,0, "天龙珠礼包",10,0, "变身卡礼包",3,0}, 
	ItemList_1= {"男人仙器根骨向",1,0},
	ItemList_2= {"女人仙器根骨向",1,0},
	ItemList_3= {"男仙仙器灵性向",1,0},
	ItemList_4= {"女仙仙器灵性向",1,0},
	ItemList_5= {"男魔仙器根骨向",1,0},
	ItemList_6= {"女魔仙器根骨向",1,0},
	ItemList_7= {"男鬼仙器根骨向",1,0},
	ItemList_8= {"女鬼仙器根骨向",1,0},
	ItemList_9= {"男龙仙器根骨向",1,0},
	ItemList_10= {"女龙仙器根骨向",1,0},--]]--
}

--登录显示首充
function FirstRecharge.GetData(player)
	--是否获得过首充奖励 0 没获得过且没资格 1 没获得过但有资格 2 获得过
	local is_first_recharge = player:GetInt("GotFirstRecharge")
	if is_first_recharge == 2 then return end

	local send_guard_list = FirstRecharge.Reward['GuardList'] or {}
	
	local role_id = player:GetAttr(ROLE_ATTR_ROLE)
	local send_item_list = {}
	local cur_list = FirstRecharge.Reward['ItemList']
	if cur_list then
		for _,v in ipairs(cur_list) do
			table.insert(send_item_list, v)
		end
	end
	local role_list = FirstRecharge.Reward['ItemList_'..role_id]
	if role_list then
		for _,v in ipairs(role_list) do
			table.insert(send_item_list, v)
		end
	end
	local str = [[
		if FirstRechargeUI then
			FirstRechargeUI.GetConfig(]]..FirstRecharge.RMBNum..","..Lua_tools.serialize(send_item_list)..","..Lua_tools.serialize(send_guard_list)..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--充值回调
function FirstRecharge.GetReward(player, recharge_num)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['FirstRecharge'] ~= "on" then
			return
		end
	end
	local is_first_recharge = player:GetInt("GotFirstRecharge")
	if is_first_recharge == 1 or is_first_recharge == 2 then return end
	if recharge_num >= FirstRecharge.RMBNum then
		--获得领取资格
		player:SetInt("GotFirstRecharge", 1)
		sLogServerSystem:LogToServer(0, player, "首充状态", 0, 1, "获得首充奖励领取资格", "")
	end
end
--领取礼包
function FirstRecharge.GiveReward(player)
	local is_first_recharge = player:GetInt("GotFirstRecharge")
	if is_first_recharge ~= 1 then
		sLuaApp:LuaErr("FirstRecharge.GiveReward错误 GotFirstRecharge为"..is_first_recharge)
		return
	end
	player:SetInt("GotFirstRecharge", 2)
	if Lua_tools.GiveGoods(player,FirstRecharge.Reward) then
		sLuaApp:NotifyTipsMsg(player, "恭喜获得首充奖励")
		sLogServerSystem:LogToServer(0, player, "首充状态", 1, 2, "已获得首充奖励", "")
	else
		sLuaApp:LuaErr(player:GetName().."FirstRecharge.GiveReward物品发放失败")
	end
end