--妖王
YaoWang = {}

YaoWang.Config = {
	['Is_TeamAct'] = "",
	['Level_Min'] = 35,
	['Join_MinNum'] = 1,
	['Monster_Num'] = 5,
	['Map_KeyName'] = {"傲来村野","大唐国境","江南野外","东海海湾"},
	['Monster_Config'] = {
		['DestroyTime'] = 3000,
		['NPC_ID']= {1033},
		['Monster_Group'] = {
			['1033'] = 6221,
		},	
	},
	['FightTag'] = 98765,
	['Reward_Count'] = -1,
	['Reward'] = {
		['Exp'] = "return level * 1000",
		['BindGold'] = "return level * 100",
		['ItemList'] = {"中级炼妖礼包",1,0},
	},
}

function YaoWang.main(player)
	if not YaoWang.Config then
		sLuaApp:LuaDbg( "YaoWang.main is nil")
		return
	end
	
	local Map_KeyName = YaoWang.Config['Map_KeyName'][tonumber(math.random(1,#YaoWang.Config['Map_KeyName']))]
	if not Map_KeyName then
		sLuaApp:LuaDbg( "YaoWang.main Map_KeyName is nil")
		return
	end
	
	local Map = sMapSystem:GetMapByKey(Map_KeyName)
	if not Map then
		sLuaApp:LuaDbg( "YaoWang.main Map is nil")
		return 
	end
	
	local Monster_Num = YaoWang.Config['Monster_Num']
	if not Monster_Num then
		sLuaApp:LuaDbg( "YaoWang.main Monster_Num is nil")
		return
	end
	
	for i = 1 , Monster_Num , 1 do
		local NPC_ID = YaoWang.Config['Monster_Config']['NPC_ID'][tonumber(#YaoWang.Config['Monster_Config']['NPC_ID'])]
		if not NPC_ID then
			sLuaApp:LuaDbg( "YaoWang.main NPC_ID is nil")
			return
		end
		
		local Monster_Group = YaoWang.Config['Monster_Config']['Monster_Group'][''..NPC_ID]
		if not Monster_Group then
			sLuaApp:LuaDbg( "YaoWang.main Monster_Group is nil")
			return 
		end
		
		local x = math.floor(Map:GetWidth()/2)
		local y = math.floor(Map:GetHeight()/2)
		local range = math.min(x,y) - 10
		if x and y then
			local npc = sNpcSystem:CreateMoveNpc(NPC_ID, Map, x, y, range, 4)--5是方向
			if npc then
				npc:SetInt("YaoWang_Monster_Group", Monster_Group)
				sLuaTimerSystem:AddTimerEx(npc, YaoWang.Config['Monster_Config']['DestroyTime']*1000,1,"YaoWang.DestroyNPC", "")
			else
				sLuaApp:LuaDbg( "YaoWang.main npc is nil")
				return 
			end
		else
			sLuaApp:LuaDbg( "YaoWang.main x or y is nil")
			return 
		end
	end
	sLuaApp:NotifyTipsMsg(player, "你不小心挖塌了妖怪巢穴，妖王出现！")
	sLuaApp:NotifyTopMsgToAll(1, "<color=#FFFFFFFF>玩家"..player:GetName().."不小心挖塌了妖怪的巢穴，大量妖王出现在<color=#FFD700FF>"..Map:GetName().."</color>!!!</color>")
end

function YaoWang.DestroyNPC(npc, timer, p)
	if npc then
		sNpcSystem:DestroyNpc(npc)
	end
end

function YaoWang.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= YaoWang.Config['FightTag'] then
		sLuaApp:LuaErr("NaoShi.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("YaoWangNPCisFight", 0)
	end
end

function YaoWang.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "YaoWang", "OnResult")
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("YaoWang_NPC_GUID"))
	if npc and npc:GetInt("YaoWangNPCisFight") > 0 then
		npc:SetInt("YaoWangNPCisFight", npc:GetInt("YaoWangNPCisFight")-1)
	end
	if victory == 2 then
		if npc then
			sNpcSystem:DestroyNpc(npc)
		end
		local YaoWang_Reward_Count = player:GetDayInt("YaoWang_Reward_Count")
		if YaoWang.Config['Reward_Count'] ~= -1 then
			if YaoWang_Reward_Count >= YaoWang.Config['Reward_Count'] then
				sLuaApp:NotifyTipsMsg(player, "你当天的妖王奖励已经达到上限")
				return
			end
		end
		if YaoWang.GiveReward(player) then
			YaoWang_Reward_Count = YaoWang_Reward_Count + 1
			player:SetDayInt("YaoWang_Reward_Count",YaoWang_Reward_Count)
		end
	end
end
function YaoWang.GiveReward(player)
	local GongShi = [[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		]]
	local exp = assert(load(GongShi..YaoWang.Config['Reward']['Exp']))()
	local bindgold = assert(load(GongShi..YaoWang.Config['Reward']['BindGold']))()
	
	if not player:AddBindGold(bindgold, "YaoWang", "YaoWang", "nil") then
		sLuaApp:LuaDbg( "YaoWang.GiveReward player:AddBindGold is err")
		return false
	else
		sLuaApp:NotifyTipsMsg(player, "您获得了"..bindgold.."银币")
	end
	if not player:AddExp (exp, "YaoWang", "YaoWang", "nil") then
		sLuaApp:LuaDbg( "YaoWang.GiveReward player:AddExp is err")
		return false
	end
	local pet_List = Lua_tools.GetFightPets(player)
	for k,v in pairs(pet_List) do
		if not v:AddExp(exp, "YaoWang", "YaoWang", "nil") then
			sLuaApp:LuaDbg( "YaoWang.GiveReward pet:AddExp is err   "..player:GetName().."  "..v:GetName())
		end
	end
	if not Lua_tools.AddItem(player, YaoWang.Config['Reward']['ItemList'], "yaowang", "AddItem", "") then
		sLuaApp:LuaDbg( "YaoWang.GiveReward AddItem is err")
		return false
	end
	return true
end