--VIP经验
VipExp={}

VipExp.ExpMode = 1		--1.消费金元宝增加exp  2.充值增加exp（充值增加会有诸多基于公司账号模式造成的无法解决的BUG，慎用）

--VIP经验增加 system用
function VipExp.on_sub_ingot(player, ingot, sender, reason, detail)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VIP'] ~= "on" then
			return
		end
	end
	if VipExp.ExpMode ~= 1 then return end
	if not VipConfig then return end
	if Lua_tools then
		if Lua_tools.IngotDescStati(reason) == false then
			return
		end
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return
	end
	local Now_VipExp = player:GetAttr(ROLE_ATTR_VIP_EXP)
	local Now_Viplevel = player:GetAttr(ROLE_ATTR_VIP)
	
	VipExp.If_VIPLevelUp(player,Now_VipExp,Now_Viplevel,ingot)
	VipLogic.VipButtonRefresh(player)
end

function VipExp.on_recharge(player, rmb, sender, reason, detail)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VIP'] ~= "on" then
			return
		end
	end
	if VipExp.ExpMode ~= 2 then return end
	if not VipConfig then return end
	if Lua_tools then
		if Lua_tools.IngotDescStati(reason) == false then
			return
		end
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return
	end
	local Now_VipExp = player:GetAttr(ROLE_ATTR_VIP_EXP)
	local Now_Viplevel = player:GetAttr(ROLE_ATTR_VIP)
	
	VipExp.If_VIPLevelUp(player,Now_VipExp,Now_Viplevel,rmb)
	VipLogic.VipButtonRefresh(player)
end

--升级判断
function VipExp.If_VIPLevelUp(player,Now_VipExp,Now_Viplevel,AddExp)
	local Max_Viplevel = Lua_tools.tablecount(VipConfig.main) - 1
	AddExp = tonumber(AddExp)
	player:AddVipExp(AddExp, "system", "", "")
	Now_VipExp = Now_VipExp + AddExp
	if Now_Viplevel <  Max_Viplevel then
		VipExp.VIPLevelUp(player,Now_VipExp,Now_Viplevel)
		sLuaApp:LuaDbg(""..Now_VipExp)
	else
		sLuaApp:LuaDbg( player:GetName().."vip已达最大等级")
	end
end 

--升级效果 
function VipExp.VIPLevelUp(player,Now_VipExp,Now_Viplevel)
	if VipConfig.main["vip"..Now_Viplevel+1] then
		local Next_LevelExp = VipConfig.main["vip"..Now_Viplevel]['lvup_exp']
		if  Now_VipExp >=  Next_LevelExp then
		
			Now_VipExp = Now_VipExp - Next_LevelExp
			player:SubVipExp(Next_LevelExp, "system", "vip升级", "")--扣掉升级经验
			
			Now_Viplevel = Now_Viplevel + 1 
			player:SetVip(Now_Viplevel)
			sLogServerSystem:LogToServer(0, player, "VIP等级", Now_Viplevel - 1, Now_Viplevel, "VIP升级", "")
			sDBVarSystem:SetInt("VIP_SYSTEM_OFFLINEVIPLEVEL_"..player:GetGUID(), Now_Viplevel , 6)
			
			--player:SetInt("VIPGift_LastTime", 1)--升级重置每日礼包领取时间
			
			-- --升级但是没领礼包 邮件发
			-- local GiftSign = player:GetInt("VIPGift_lvup"..(Now_Viplevel-1))
			-- if GiftSign == 0 then
				-- sMailSystem:SendMail( 0, "VIP", player:GetGUID(), 1, "VIP礼包", "您有未领取的VIP"..(Now_Viplevel-1).."等级礼包",{}, VipExp.lvup_item_list["vip"..(Now_Viplevel-1)])
			-- end
			-- local GiftSign_day = player:GetInt("VIPGift_Periodic"..(Now_Viplevel-1))
			-- if GiftSign_day == 0 then
				-- sMailSystem:SendMail( 0, "VIP", player:GetGUID(), 1, "VIP礼包", "您有未领取的VIP"..(Now_Viplevel-1).."日常礼包",{}, VipExp.Periodic_item_list["vip"..(Now_Viplevel-1)])
			-- end

			sLuaApp:NotifyTipsMsg(player, "恭喜您VIP等级升到"..Now_Viplevel.."级！")	
			VipExp.AddBuff(player,Now_Viplevel)
			if VipIngotTrace then
				VipIngotTrace.GetData(player) --刷新VIP活动元宝追踪
			end
			VipExp.VIPLevelUp(player,Now_VipExp,Now_Viplevel)
			--lualib:AddTimerEx(player, lualib:GenTimerId(player), 1000, 1, "金元宝奖励:GoldIngot_IsShow","")
			--数据统计
			if player:GetInt("SYSTEM_DATAPLUS_"..player:GetGUID().."_VIPLevel_"..Now_Viplevel) == 0 then
				sLuaApp:LuaDbg("数据统计--".."SYSTEM_DATAPLUS_"..player:GetGUID().."_VIPLevel--"..Now_Viplevel)
				if sDBVarSystem:GetInt("SYSTEM_DATAPLUS_"..player:GetGUID().."_VIPLevel") < Now_Viplevel then
					sDBVarSystem:SetInt("SYSTEM_DATAPLUS_"..player:GetGUID().."_VIPLevel", Now_Viplevel ,6)
					player:SetInt("SYSTEM_DATAPLUS_"..player:GetGUID().."_VIPLevel_"..Now_Viplevel,1)
				end
			end
		end
	end
end

--加vipbuff
function VipExp.AddBuff(player,vip_level)
	local buff_list = VipConfig.main["vip"..vip_level]['add_buff']
	if not buff_list then
		sLuaApp:LuaErr("缺少VipConfig.main[vip"..vip_level.."][add_buff]")
		return
	end
	if not PlayerAttrClassify['VIPBuff'] then
		sLuaApp:LuaErr("缺少PlayerAttrClassify[VIPBuff]")
		return
	end
	if next(buff_list) then
		for _,v in ipairs(buff_list) do
			if type(v['attr_name']) == "string" and type(v['attr_val']) == "number" and AttrConfig.GetByKeyName(v['attr_name']) then
				player:SetDynAttr(PlayerAttrClassify['VIPBuff'],AttrConfig.GetByKeyName(v['attr_name']).Id,v['attr_val'])
			else
				sLuaApp:LuaDbg("VipConfig.main[vip"..vip_level.."][add_buff]配置错误")
			end
		end
	end
end

--发邮件用
VipExp.lvup_item_list={}
VipExp.Periodic_item_list={}
function VipExp.Initialization()
	if not VipConfig then
		require("player/VipConfig")
	end
	for k,v in pairs( VipConfig.main) do
		VipExp.lvup_item_list[k] = {}
		VipExp.Periodic_item_list[k] = {}
		
		for a,b in ipairs( v['gift_lvup']['Item_list']) do
			if type(b) == "string" then
				local itemData = ItemConfig.GetByKeyName(b)
				table.insert(VipExp.lvup_item_list[k], itemData.Id)
				local num = v['gift_lvup']['Item_list'][a+1]
				local bind = v['gift_lvup']['Item_list'][a+2]
				if type(num) == "number" and type(bind) == "number" then
					table.insert(VipExp.lvup_item_list[k], num)
					table.insert(VipExp.lvup_item_list[k], bind)
				end
			end
 		end
		
		for a,b in ipairs( v['gift_Periodic']['Item_list']) do
			if type(b) == "string" then
				local itemData = ItemConfig.GetByKeyName(b)
				table.insert(VipExp.Periodic_item_list[k], itemData.Id)
				local num = v['gift_Periodic']['Item_list'][a+1]
				local bind = v['gift_Periodic']['Item_list'][a+2]
				if type(num) == "number" and type(bind) == "number" then
					table.insert(VipExp.Periodic_item_list[k], num)
					table.insert(VipExp.Periodic_item_list[k], bind)
				end
			end
 		end
	end
end
--VipExp.Initialization()