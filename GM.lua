local MemroyLeak = require("MemoryLeak")

-- 截断字符串
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- 分割字符串
function split(str,delim)
    local i,j,k
    local t = {}
    k = 1
    while true do
        i,j = string.find(str,delim,k)
        if i == nil then
            table.insert(t,string.sub(str,k))
            return t
        end
        table.insert(t,string.sub(str,k,i - 1))
        k = j + 1
    end
end

function GM.test(player, args)
    sLuaApp:LuaDbg("test: " .. args)
end

-- 指定背包容量
function GM.bcap(player, args)
    sLuaApp:LuaDbg("bcap: " .. args)
    if player == nil or args == nil then
        return
    end
    local params = split(trim(args), " ")
    if #params ~= 2 then
        return
    end

    local container_type = tonumber(params[1])
    local cap = tonumber(params[2])

    local container = GetContainerByType(player, container_type)
    if container == nil then
        return
    end

    container:SetCapacity(cap)
end

-- 添加物品
function GM.i(player, args)
    sLuaApp:LuaDbg("i: " .. args)
    if player == nil or args == nil then
        return
    end

    local params = split(trim(args), " ")
    if #params < 2 then
        sLuaApp:NotifyTipsMsgEx(player, "无效的参数: " .. args)
        return
    end

    local item_id = tonumber(params[1])
    local count = tonumber(params[2])
    local ret = sItemSystem:AddItemEx(player, item_id, count, true, "GM指令", "添加物品", "")
    if ret ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "添加物品失败失败: " .. args)
        return
    end
    sLuaApp:NotifyTipsMsgEx(player, "添加物品成功!")
end

function GM.StartFight(player)
    sLuaApp:StartFight(player)
end

-- 添加宠物
function GM.pet(player, args)
    sLuaApp:LuaDbg("i: " .. args)
    if player == nil or args == nil then
        return
    end

    local params = split(trim(args), " ")
    if #params < 2 then
        sLuaApp:NotifyTipsMsgEx(player, "无效的参数: " .. args)
        return
    end

    local pet_id = tonumber(params[1])
    local level = tonumber(params[2])
    local pet = sPetSystem:AddPetEx(player, pet_id, level, true, "GM指令", "添加宠物", "")
    if pet == nil then
        sLuaApp:NotifyTipsMsgEx(player, "添加宠物失败: " .. args)
        return
    end
    sLuaApp:NotifyTipsMsgEx(player, "添加宠物成功!")
end

--运行服务器脚本
function GM.newinter(player, args)
	local answer = assert(load("local player = sPlayerSystem:GetPlayerByGUID('"..player:GetGUID().."') return "..args))()
	if type(answer) == "table" then
		answer = Lua_tools.serialize(answer)
		sLuaApp:NotifyTipsMsgEx(player, answer)
		print(""..answer)
	elseif type(answer) == "number" then
		sLuaApp:NotifyTipsMsgEx(player, ""..answer)
	elseif type(answer) == "string" then
		sLuaApp:NotifyTipsMsgEx(player, ""..answer)
	elseif type(answer) == "nil" then
		sLuaApp:NotifyTipsMsgEx(player, "nil")
	elseif answer == true then
		sLuaApp:NotifyTipsMsgEx(player, "true")
	elseif answer == false then
		sLuaApp:NotifyTipsMsgEx(player, "false")
	end
end

function GM.arp(player, args)
	local point = tonumber(args)
    if player == nil or args == nil then
        return
    end
	sLuaApp:LuaDbg("addpoint: " .. args)
    
    local ret = player:AddRemainPoint(point)
    if ret ~= 0 then
        return
    end

end

function GM.addpetremainpoint(player,args)
	local point = tonumber(args)
    if player == nil or args == nil then
        return
    end
	sLuaApp:LuaDbg("addpetpoint: " .. args)
	
	local pet = sPetSystem:GetLineupPet(player)
	if not pet then
		return
	end
    local ret = pet:AddRemainPoint(point)
    if ret ~= 0 then
        return
    end
end

function GM.getint(player, args)
    if player == nil or args == nil then
        return
    end
	sLuaApp:LuaDbg("getint: " .. args)
    local value = player:GetInt(args)
    sLuaApp:NotifyTipsMsgEx(player, "GetInt("..args..") = " .. value)
end

function GM.setint(player, args)
    if player == nil or args == nil then
        return
    end
    sLuaApp:LuaDbg("setint: " .. args)
    local params = split(trim(args), " ")
    if #params < 2 then
        sLuaApp:NotifyTipsMsgEx(player, "无效的参数: " .. args)
        return
    end

    local key = params[1]
    local value = tonumber(params[2])
    player:SetInt(key, value)
end

function GM.guild(player, args)
    if player == nil or args == nil then
        return
    end

    sLuaApp:LuaDbg("guild: " .. args)

    local op = tonumber(args)
    if op == 1 then
        sGuildSystem:CreateGuild(player, "测试帮派" .. player:GetName(), "帮派宣言")
    elseif op == 2 then
        sGuildSystem:LeaveGuild(player)
    end
end

function GM.mail(player, args)
    if player == nil then
        return
    end

    sLuaApp:LuaDbg("mail: ")
    local count = 1
    if #args > 0 then
        count = tonumber(args)
    end

    local name = player:GetName()
    local guid = player:GetGUID()
    for i =1,count do
        sMailSystem:SendMailEx(guid, name, guid, 0, "title-" .. i, "测试邮件内容", {344, 1000, 340, 1000}, {50343, 1, 1}, {10035, 90, 0})
    end
end

function GM.mail2(player, args)
    if player == nil then
        return
    end

    sLuaApp:LuaDbg("mail2: ")
    local count = 1
    if #args > 0 then
        count = tonumber(args)
    end

    local name = player:GetName()
    local guid = player:GetGUID()
    for i =1,count do
        sMailSystem:SendMail(guid, name, guid, 0, "测试邮件", "测试邮件内容:没有附件", {344, 1000, 340, 1000}, {50343, 1, 1})
    end
end

function GM.getdbvar(player, args)
    if player == nil or args == nil then
        return
    end

	sLuaApp:LuaDbg("getdbvar: " .. args)
    local ivalue = sDBVarSystem:GetInt(args)
    local svalue = sDBVarSystem:GetString(args)
    sLuaApp:NotifyTipsMsgEx(player, "sDBVarSystem:GetInt("..args..") = " .. ivalue)
    sLuaApp:NotifyTipsMsgEx(player, "sDBVarSystem:GetString("..args..") = " .. svalue)
end

function GM.setdbvar(player, args)
    if player == nil or args == nil then
        return
    end

    sLuaApp:LuaDbg("setdbvar: " .. args)
    local params = split(trim(args), " ")
    if #params < 2 then
        sLuaApp:NotifyTipsMsgEx(player, "无效的参数: " .. args)
        return
    end

    local key = params[1]
    local ivalue = tonumber(params[2])
    local svalue = params[2]
    sDBVarSystem:SetInt(key, ivalue, 0)
    sDBVarSystem:SetString(key, svalue, 0)
end

function GM.cnpc(player, args)
    if player == nil or args == nil then
          return
      end
    sLuaApp:LuaDbg("GM.cnpc")
    local map = sMapSystem:GetMapById(208)
    sNpcSystem:CreateNpc(1002, map, 135, 80,1,2)
  end

-- 在当前地图和位置创建一个NPC
-- 使用：@shownpc NPCID
function GM.shownpc(player, args)
    local params = split(trim(args), " ")
    if player == nil or args == nil then
        return
    end
    local map = player:GetMap()
    local x = sMapSystem:GetPosX(player)
    local y = sMapSystem:GetPosY(player)
    sNpcSystem:CreateNpc(params[1], map, x, y,1,2)
end

local talkTypes = {
	[1] = "当前",
	[2] = "队伍",
	[3] = "帮派",
	[4] = "地图",
	[5] = "p2p",
	[6] = "私聊",
	[7] = "喇叭",
	[8] = "招募",
	[9] = "门派",
	[10] = "世界",
}

function GM.settalklevel(player, args)
	local tb_param = split(trim(args), " ")
	local types = 0
	local level = 0
	if #tb_param == 1 then
		level = tb_param[1]
	else
		types = tb_param[1]
		level = tb_param[2]
	end
	if not types then
		return ""
	end
	if not level then
		return ""
	end
	
	if types ~= 0 then
		if talkTypes[types] then
			sLuaApp:SetChannelLevel(types, level)
			sLuaApp:NotifyTipsMsg(player, "" .. talkTypes[types] .. " 频道已设置聊天等级："..level)
			return
		end
	else
		for k,v in pairs(talkTypes) do
			sLuaApp:SetChannelLevel(k, level)
		end
		sLuaApp:NotifyTipsMsg(player, "全频道已设置聊天等级："..level)
			return
	end
end

function GM.settalklevel(player, args)
	local tb_param = split(trim(args), " ")
	local types = 0
	local sec = 0
	if #tb_param == 1 then
		sec = tb_param[1]
	else
		types = tb_param[1]
		sec = tb_param[2]
	end
	if not types then
		return ""
	end
	if not sec then
		return ""
	end
	
	if types ~= 0 then
		if talkTypes[types] then
			sLuaApp:SetChannelLevel(types, sec)
			sLuaApp:NotifyTipsMsg(player, "" .. talkTypes[types] .. " 频道已设置聊天间隔秒数："..sec)
			return
		end
	else
		for k,v in pairs(talkTypes) do
			sLuaApp:SetChannelLevel(k, sec)
		end
		sLuaApp:NotifyTipsMsg(player, "频道已设置聊天间隔秒数："..sec)
			return
	end
end

--清空天梯假人
function GM.clearladders(player)
    if player == nil then
        return
    end
    sLadderSystem:ClearLadders()
    sRanklistSystem:ClearRanklist(RankingListSystem.Config["天梯榜"])
end

function GM.offline(player, args)
    local guid = player:GetGUID()
	sContactSystem:LoadOfflinePlayer(player, guid)
	return ""
end

-- 在当前地图和位置创建一个NPC
-- 使用：@testnpc NPCID
function GM.on_create_npc_async(npc, params)
    if npc == nil then
        return
    end

    sLuaApp:LuaDbg("npc name:" .. npc:GetName())
    sLuaApp:LuaDbg("params: " .. params)
end

function GM.testnpc(player, args)
    local npc_id = tonumber(args)
    if player == nil or args == nil then
        return
    end
    local map = player:GetMap()
    local x = sMapSystem:GetPosX(player)
    local y = sMapSystem:GetPosY(player)
    local player_guid = player:GetGUID()
    local callback = "GM:on_create_npc_async"
    local params = "test"
    sNpcSystem:CreatePlayerNpcAsync(npc_id, map, x, y,1,2, 0, player_guid, callback, params)
end

function GM.recharge(player, args)
	local tb_param = split(trim(args), " ")
	local str = RechargeSystem.GMAdd(player, tb_param[1], tb_param[2], tonumber(tb_param[3]))
	if type(str) == "string" then
		sLuaApp:NotifyTipsMsg(player, str)
	end
	return 
end

function GM.resume_lua(player, args)
    MemroyLeak.m_cConfig.m_bAllMemoryRefFileAddTime = false
    collectgarbage("collect")
    MemroyLeak.m_cMethods.DumpMemorySnapshot("./", "1", -1)

    if player then
        sLuaApp:NotifyTipsMsg(player, "重新开始lua内存监测")
    end
end

function GM.dump_lua(player, args)
    collectgarbage("collect")
    MemroyLeak.m_cMethods.DumpMemorySnapshot("./", "2", -1)
    MemroyLeak.m_cMethods.DumpMemorySnapshotComparedFile("./", "Compared", -1, "./lua_memory_leak_all_1.txt", "./lua_memory_leak_all_2.txt")

    if player then
        sLuaApp:NotifyTipsMsg(player, "已输出lua内存监测数据,请查看日志")
    end
end

--大月卡测试
function GM.SeasonPass(player)
	if player then
		if FormSeasonPass then
			FormSeasonPass.Test(player)
		end
    end
	return ""
end