--帮派表单以及功能
FormGuild = {}

--请求帮派
function FormGuild.GetGuild(player)
    if player == nil then
        return ""
    end
	local guild = player:GetGuild()
	if not guild then
		return
	end
	
	local tb = GuildConfig.DonateConfig
	tb['WeekValue'] = player:GetWeekInt("GuildDonateWeekValue")
	local GongShi = [[
		local TotalContrb = ]]..sGuildSystem:GetMemberTotalContrb(player)-sGuildSystem:GetMemberThisWeekContrb(player)..[[
		local LastWeekContrb = ]]..sGuildSystem:GetMemberLastWeekContrb(player)..[[
	]]
	local LastWeekDividend = assert(load(GongShi..GuildConfig.Dividend))() or 0
	--sLuaApp:NotifyTipsMsgEx(player, "LastWeekDividend"..LastWeekDividend)
	GongShi = [[
		local TotalContrb = ]]..sGuildSystem:GetMemberTotalContrb(player)..[[
		local LastWeekContrb = ]]..sGuildSystem:GetMemberThisWeekContrb(player)..[[
	]]
	local ThisWeekDividend = assert(load(GongShi..GuildConfig.Dividend))() or 0
	--sLuaApp:NotifyTipsMsgEx(player, "ThisWeekDividend"..ThisWeekDividend)
	local ImpeachState = guild:GetInt("ImpeachState")
	if ImpeachState == 0 then
		if sGuildSystem:EnableImpeachLeader(player) ~= 0 then
			ImpeachState = -1
		end
	end
	
	local str = [[
		if FactionUI then
			FactionUI.InitialFund = ]]..GuildConfig.InitialFund..[[
			FactionUI.ConstructData = ]]..Lua_tools.serialize(GuildConfig.BuildingsConfig)..[[
			FactionUI.DonateConfig = ]]..Lua_tools.serialize(tb)..[[
			FactionUI.LastWeekDividend = ]]..LastWeekDividend..[[
			FactionUI.ThisWeekDividend = ]]..ThisWeekDividend..[[
			FactionUI.DividendState = ]]..player:GetWeekInt("Guild_Dividend_State")..[[
			FactionUI.DailyCareFund = ]]..Lua_tools.serialize(GuildConfig.DailyCareFund)..[[
			FactionUI.ChangeNameBindGold = ]]..GuildConfig.ChangeNameBindGold..[[
			FactionUI.ChangeNameGuildFund = ]]..GuildConfig.ChangeNameGuildFund..[[
		end
	]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    sGuildSystem:NotifyGuild(player)
    return ""
end

--请求帮派成员列表
function FormGuild.GetGuildMembers(player, pos, length)
    if player == nil then
        return ""
    end

    if pos < 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数pos")
        return ""
    end

    if length < 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数length")
        return ""
    end

    sGuildSystem:NotifyGuildMembers(player, pos, length)
    return ""
end

--请求帮派申请列表
function FormGuild.GetGuildApplicants(player)
    if player == nil then
        return ""
    end
    sGuildSystem:NotifyGuildApplicants(player)
    return ""
end

--请求帮派扩展
function FormGuild.GetGuildById(player, guild_id)
    if player == nil then
        return ""
    end

    sGuildSystem:FindGuildById(player, guild_id)
    return ""
end

--请求帮派列表
function FormGuild.GetGuildList(player, pos, length)
    if player == nil then
        return ""
    end

    if pos < 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数pos")
        return ""
    end

    if length < 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数length")
        return ""
    end

    sGuildSystem:FindGuildByRange(player, pos, length)
    return ""
end

--搜索帮派列表
function FormGuild.SearchGuild(player, keyword)
    if player == nil then
        return ""
    end

    if string.len(keyword) <= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数keyword")
        return ""
    end

    sGuildSystem:FindGuildByKeyword(player, keyword)
    return ""
end

--搜索帮派列表
function FormGuild.SearchGuildMember(player, keyword)
    if player == nil then
        return ""
    end

    if string.len(keyword) <= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "无效参数keyword")
        return ""
    end

    sGuildSystem:FindGuildMemberByKeyword(player, keyword)
    return ""
end

-- 读通知
function FormGuild.ReadNotice(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派，无法操作")
        return ""
    end

    sGuildSystem:ReadNotice(player)
    return ""
end


--创建帮派
function CreateGuild(player, name, declaration)
    if player == nil then
    end

    if sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有帮派了, 无法创建帮派")
        return ""
    end

    if sGuildSystem:GetGuildByName(name) ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "名字重复, 无法创建帮派")
        return ""
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < 28 then
        sLuaApp:NotifyTipsMsgEx(player, "等级不足，无法创建帮派")
        return ""
    end
	if sLuaApp:GetUTF8Bytes(name) > 15 then
		sLuaApp:NotifyTipsMsg(player, "帮派名称长度过长")
		return ""
    end
	if sLuaApp:GetUTF8Bytes(name) < 6 then
		sLuaApp:NotifyTipsMsg(player, "帮派名称长度过短")
		return ""
    end

    local Player_Ingot = player:GetIngot()
    if Player_Ingot < 200 then
        sLuaApp:NotifyTipsMsgEx(player, "金元不足，无法创建帮派")
        return ""
    end

    local guild = sGuildSystem:CreateGuild(player, name, declaration)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "创建帮派失败")
        sLuaApp:LuaErr(player:GetName().." 创建帮派失败 "..name.." "..declaration)
        return ""
    end
    sGuildSystem:SetGuildLevel(guild,1,1)
    sLuaApp:NotifyTipsMsgEx(player, "创建帮派成功")
    player:SubIngot(200, "帮派系统", "创建帮派", "消耗金元")

    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_CREATE_GUILD, name, declaration, 0)
    return ""
end

--通过帮派ID加入帮派
function ApplyJoinById(player, guild_id)
    if player == nil then
        return ""
    end

    if sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有帮派了, 无法申请")
        return ""
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < 11 then
        sLuaApp:NotifyTipsMsgEx(player, "等级不足，无法加入帮派")
        return ""
    end

    local guild = sGuildSystem:GetGuildById(guild_id)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "找不到指定帮派:" .. guild_id)
        return ""
    end

    if guild:IsFull() then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法申请")
        return ""
    end

    local code = sGuildSystem:ApplyJoin(player, guild)
    local result = "0"
    if code == 0 then
        sLuaApp:NotifyTipsMsgEx(player, "入帮申请发送成功")
        result  = sGuildSystem:HasGuild(player) and "1" or "0"
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPLY_JOIN_BY_ID, "" .. guild_id, result, code)
    return ""
end

--通过玩家GUID加入帮派
function ApplyJoinByPlayer(player, target_guid)
    if player == nil then
        return ""
    end

    if sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有帮派了，无法申请")
        return ""
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < 11 then
        sLuaApp:NotifyTipsMsgEx(player, "等级不足，无法加入帮派")
        return ""
    end

    local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if target == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线, 无法加入帮派")
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(target)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方没有帮派, 无法加入帮派")
        return ""
    end

    if guild:IsFull() then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法申请")
        return ""
    end

    local code = sGuildSystem:ApplyJoin(player, guild)
    local result = "0"
    if code == 0 then
        sLuaApp:NotifyTipsMsgEx(player, "入帮申请发送成功")
        result  = sGuildSystem:HasGuild(player) and "1" or "0"
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPLY_JOIN_BY_PLAYER, "" .. target_guid, result, code)
    return ""
end

--通过一键申请加入帮派
function ApplyJoinByOneKey(player)
    if player == nil then
        return ""
    end

    if sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有帮派了, 无法申请")
        return ""
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < 11 then
        sLuaApp:NotifyTipsMsgEx(player, "等级不足，无法加入帮派")
        return ""
    end

    local now = sLuaApp:GetTimes()
    local last_time = player:GetInt("LAST_GUILD_ONE_KEY")
    if now - last_time < 30 * 60 then
        sLuaApp:NotifyTipsMsgEx(player, "距上次申请不超过30分钟，无法操作")
        return ""
    end

    local guild = sGuildSystem:GetGuildByOneKey()
    if guild ~= nil then
        if guild:IsFull() then
            sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法申请")
            return ""
        end
        local code = sGuildSystem:ApplyJoin(player, guild)
        local result = "0"
        if code == 0 then
            result  = sGuildSystem:HasGuild(player) and "1" or "0"
        end
        local guild_id = guild:GetId()
        sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPLY_JOIN_BY_ONE_KEY, guild_id.."", result, code)
    else
        local ids = ""
        local count = 10
        local guilds = sGuildSystem:GetBackupsByOneKey(count)
        if #guilds == 0 then
            sLuaApp:NotifyTipsMsgEx(player, "没有找到可申请的帮派，操作失败")
            return ""
        end
        for _, guild in ipairs(guilds) do
            local code = sGuildSystem:ApplyJoin(player, guild)
            if code == 0 then
                if string.len(ids) > 0 then
                    ids = ids .. ","
                end
                ids = ids .. guild:GetId()
            end
        end
        if string.len(ids) > 0 then
            sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPLY_JOIN_BY_ONE_KEY, ids, "0", 0)
        else
            sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPLY_JOIN_BY_ONE_KEY, ids, "0", 1)
        end
    end

    sLuaApp:NotifyTipsMsgEx(player, "一键申请入帮发送成功")
    player:SetInt("LAST_GUILD_ONE_KEY", now)
    return ""
end

-- 应答邀请
function FormGuild.OnReplyInviteJoin(player, inviter, agreed)
    if player == nil or inviter == nil or agreed == nil then
        return ""
    end

    if agreed ~= 1 then
        sLuaApp:NotifyTipsMsgEx(inviter, "对方拒绝了您的邀请")
        return ""
    end

    if sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有帮派了, 无法加入")
        return ""
    end

    guild = sGuildSystem:GetGuildByPlayer(inviter)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方没有帮派，无法接受邀请")
        return ""
    end

    if guild:IsFull() then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法申请")
        return ""
    end

    local level = player:GetAttr(ROLE_ATTR_LEVEL)
    if level < 11 then
        sLuaApp:NotifyTipsMsgEx(player, "您等级不足，无法接受邀请")
        return ""
    end

    sGuildSystem:AddGuildMember(guild, player)
    return ""
end

--修改帮派名称
function ModifyGuildName(player, name)
    if player == nill then
        return ""
    end

    if string.len(name) <= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "帮派名不能为空, 无法修改")
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法修改名称")
        return ""
    end

    local job = sGuildSystem:GetGuildJob(player)
    if job ~= GUILD_JOB_LEADER then
        sLuaApp:NotifyTipsMsgEx(player, "您不是帮主，无法操作")
        return false
    end

    if sGuildSystem:GetGuildByName(name) ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "名字重复, 无法修改名称")
        return ""
    end

    local bind_gold = player:GetBindGold()
    if bind_gold < GuildConfig.ChangeNameBindGold then
        sLuaApp:NotifyTipsMsgEx(player, "银币不足，无法修改帮派名称")
        return ""
    end

    local guild_fund = guild:GetFund()
    if guild_fund < GuildConfig.ChangeNameGuildFund then
        sLuaApp:NotifyTipsMsgEx(player, "帮派资金不足，无法修改帮派名称")
        return ""
    end

    local code = sGuildSystem:ModifyName(player, name)
    if code == 0 then
        sLuaApp:NotifyTipsMsgEx(player, "修改帮派名称成功")
        player:SubBindGold(GuildConfig.ChangeNameBindGold, "帮派系统", "帮派名称修改", "消耗银币")
        sGuildSystem:SubFund(guild, GuildConfig.ChangeNameGuildFund )
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_MODIFY_NAME, name, "", code)
    return ""
end

--修改帮派宣言
function ModifyGuildDeclaration(player, declaration)
    if player == nill then
        return ""
    end

    if string.len(declaration) <= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "帮派宣言不能为空, 无法修改")
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法修改宣言")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_DECLARATION) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    local code = sGuildSystem:ModifyDeclaration(player, declaration)
    if code == 0 then
		local member_guid_list = sGuildSystem:GetGuildMembers(player:GetGuild()) 
		for k,v in ipairs(member_guid_list) do
			local member = sPlayerSystem:GetPlayerByGUID(v) 
			if member then
				if v == player:GetGUID() then
					sLuaApp:NotifyTipsMsgEx(member, "帮派宣言有更新，快去看看吧")
				else
					sLuaApp:NotifyTipsMsgEx(member, "修改帮派宣言成功")
				end
			end
		end
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_MODIFY_DECLARATION, declaration, "", code)
    return ""
end

--领取分红
function GetDividend(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法领取分红")
        return ""
    end
	if player:GetWeekInt("Guild_Dividend_State") == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "您已经领取过本周分红，请下周再来。")
		return""
	end
	local GongShi = [[
		local TotalContrb = ]]..sGuildSystem:GetMemberTotalContrb(player)-sGuildSystem:GetMemberThisWeekContrb(player)..[[
		local LastWeekContrb = ]]..sGuildSystem:GetMemberLastWeekContrb(player)..[[
	]]
	local Dividend = assert(load(GongShi..GuildConfig.Dividend))() or 0
	if Dividend > 0 then
		player:AddBindGold(Dividend, "帮派", "分红", "num = "..Dividend.." player = "..player:GetName())
		sLuaApp:NotifyTipsMsg(player, "本周帮派分红获得了"..Dividend.."银币")
		player:SetWeekInt("Guild_Dividend_State",1)
		FormGuild.GetGuild(player)
	end
	
    --sGuildSystem:GetDividend(player)
    return ""
end

--参加活动
function JoinActivity(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法参与帮派活动")
        return ""
    end

    return ""
end

-- 捐献
function Donate(player, type)
    if player == nil then
        return ""
    end
	if not GuildConfig.DonateConfig['Config'][type] then
		return ""
	end
	local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法捐献")
        return ""
    end
	local week_val = player:GetWeekInt("GuildDonateWeekValue")
	if week_val >= GuildConfig.DonateConfig['WeekMax'] then
		sLuaApp:NotifyTipsMsgEx(player, "已经达到本周捐献上限，请下周再来。")
		return ""
	end
    local money_val = GuildConfig.DonateConfig['Config'][type]['MoneyValue']
	local money_type = GuildConfig.DonateConfig['MoneyType']
	if not Lua_tools.IsMoneyEnough(player, money_type, money_val) then
		sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(money_type).."不足，无法捐献")
		return ""
	end
	if money_val + week_val > GuildConfig.DonateConfig['WeekMax'] then
		sLuaApp:NotifyTipsMsgEx(player, "超出捐献上限，无法捐献。")
		return ""
	end
	if not Lua_tools.SubMoney(player, money_type, money_val, "Donate", ""..player:GetName(), ""..type) then
		sLuaApp:LuaErr("Donate Lua_tools.SubMoney err ,name = "..player:GetName().."  type = "..type)
		return ""
	end
	
	player:SetWeekInt("GuildDonateWeekValue",money_val + week_val)
	if player:AddGuildContribute(GuildConfig.DonateConfig['Config'][type]['Contribute'],"Donate", ""..player:GetName(), ""..type) then
		sLuaApp:NotifyTipsMsg(player, "您获得了"..GuildConfig.DonateConfig['Config'][type]['Contribute'].."帮贡！")
	end
	Lua_tools.AddGuildFund(player,GuildConfig.DonateConfig['Config'][type]['Fund'])
	local str = ""..player:GetName().."为帮派贡献了"..GuildConfig.DonateConfig['Config'][type]['MoneyValue']..""..Lua_tools.GetMoneyName(money_type).."，获得了"..GuildConfig.DonateConfig['Config'][type]['Contribute'].."帮贡"
	
	local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
	for k,v in pairs(member_guid_list) do
		local member = sPlayerSystem:GetPlayerByGUID(v)
		if member then
			local form_str = [[
				ChatUI.ShowMsgInChannel(3, "]]..str..[[")
			]]
			sLuaApp:ShowForm(member, "脚本表单", form_str)
		end
	end
	

	local tb = GuildConfig.DonateConfig
	tb['WeekValue'] = player:GetWeekInt("GuildDonateWeekValue")
	local GongShi = [[
		local TotalContrb = ]]..sGuildSystem:GetMemberTotalContrb(player)-sGuildSystem:GetMemberThisWeekContrb(player)..[[
		local LastWeekContrb = ]]..sGuildSystem:GetMemberLastWeekContrb(player)..[[
	]]
	local LastWeekDividend = assert(load(GongShi..GuildConfig.Dividend))() or 0
	GongShi = [[
		local TotalContrb = ]]..sGuildSystem:GetMemberTotalContrb(player)..[[
		local LastWeekContrb = ]]..sGuildSystem:GetMemberThisWeekContrb(player)..[[
	]]
	local ThisWeekDividend = assert(load(GongShi..GuildConfig.Dividend))() or 0

	local form_str = [[
		if FactionUI then
			FactionUI.DonateConfig = ]]..Lua_tools.serialize(tb)..[[
			FactionUI.LastWeekDividend = ]]..LastWeekDividend..[[
			FactionUI.ThisWeekDividend = ]]..ThisWeekDividend..[[
			FactionUI.DividendState = ]]..player:GetWeekInt("Guild_Dividend_State")..[[
			FactionUI.RefreshContribute()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
		
	sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_DONATE, type.."", money_val.."", 0)
    --if type == 0 then
    --    num = 10000
    --elseif type == 1 then
    --    num = 50000
    --elseif type == 2 then
    --    num = 100000
    --elseif type == 3 then
    --    num = 1000000
    --end
	--
    --if num <= 0 then
    --    sLuaApp:NotifyTipsMsgEx(player, "捐献数量不能少于1, 无法捐献")
    --    return ""
    --end
	--
    --local guild = sGuildSystem:GetGuildByPlayer(player)
    --if guild == nil then
    --    sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法捐献")
    --    return ""
    --end
	--
    --local code = sGuildSystem:Donate(player, num)
    --if code == 0 then
    --    player:AddGuildContribute(num, "帮派系统", "帮派捐献", "获得帮贡")
    --    Lua_tools.AddGuildFund(player,num)
    --end
    --sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_DONATE, type.."", num.."", code)
    return ""
end

function SendNotice(player, notice)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法发送")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_SEND_NOTICE) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end
	player:SubVp(10,"帮派","发通知",""..player:GetName())
    local Job = GuildConfig.Job2Name[sGuildSystem:GetMemberJob(player:GetGUID())]
    notice = "("..Job..")"..player:GetName().."："..notice
    local code = sGuildSystem:SendNotice(player, notice)
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_SEND_NOTICE, notice, "", code)
    return ""
end

function GoBack(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法返回帮派")
        return ""
    end
	local team = player:GetTeam()
	if team then
		if player:IsTeamLeader() then
			for k,v in pairs(team:GetTeamMembers(true)) do
				if not sGuildSystem:HasGuild(v) then
					sLuaApp:NotifyTipsMsgEx(player, "队伍中有不是本帮派的成员。")
					return ""
				end
				if player:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
					sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
					return ""
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player, "不是队长无法进行此操作。")
			return ""
		end		
	end
	
    local code = sGuildSystem:GoBack(player)
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_GO_BACK, "", "", code)
    return ""
end

function LeaveGuild(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法退出")
        return ""
    end

    local code = sGuildSystem:LeaveGuild(player)
    if code == 0 then
		local guild = sGuildSystem:GetGuildByPlayer(player)
		if guild then
			local member_guid_list = sGuildSystem:GetGuildMembers(guild)
			for k,v in pairs(member_guid_list) do
				local member = sPlayerSystem:GetPlayerByGUID(v)
				if member then
					local form_str = [[
						ChatUI.ShowMsgInChannel(3, "玩家]]..player:GetName().."离开了帮派"..[[")
					]]
					sLuaApp:ShowForm(member, "脚本表单", form_str)
				end
			end
		end
    else
        sLuaApp:LuaErr(player:GetName().. " 退出帮派失败 "..code)
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_QUIT_GUILD, "", "", code)
    return ""
end

-- 获取job等级
function GetJobLevel(job)
    if job == GUILD_JOB_LEFT_DEACON or job == GUILD_JOB_RIGHT_DEACON then
        return GUILD_JOB_LEFT_DEACON
    elseif job == GUILD_JOB_DRAGON_LEADER or job == GUILD_JOB_TIGER_LEADER then
        return GUILD_JOB_DRAGON_LEADER
    elseif job == GUILD_JOB_DRAGON_NORMAL or job == GUILD_JOB_TIGER_NORMAL then
        return GUILD_JOB_DRAGON_NORMAL
    else
        return job
    end
end

function ExpelMember(player, target_guid)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法开除成员")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_EXPEL_MEMBER) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    local job = sGuildSystem:GetGuildJob(player)
    local member_job = sGuildSystem:GetMemberJob(target_guid)
    if GetJobLevel(member_job) >= GetJobLevel(job) then
        sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
        return ""
    end

    local code = sGuildSystem:DelGuildMember(guild, target_guid)
    if code == 0 then
        sLuaApp:NotifyTipsMsgEx(player, "开除帮派成员成功")
		local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
		for k,v in pairs(member_guid_list) do
			local member = sPlayerSystem:GetPlayerByGUID(v)
			if member then
				local form_str = [[
					ChatUI.ShowMsgInChannel(3, "玩家]]..sContactSystem:GetContactName(target_guid).."离开了帮派"..[[")
				]]
				sLuaApp:ShowForm(member, "脚本表单", form_str)
			end
		end
		
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_EXPEL_MEMBER, target_guid.."", "", code)
    return ""
end

function ForbidTalk(player, set, target_guid)
    if player == nil then
        return ""
    end
    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end
    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_FORBID_TALK) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end
    local job = sGuildSystem:GetGuildJob(player)
    local member_job = sGuildSystem:GetMemberJob(target_guid)
    if GetJobLevel(member_job) >= GetJobLevel(job) then
        sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
        return ""
    end
    local code = sGuildSystem:ForbidTalk(player, set, target_guid)
    if code == 0 then
        if set ~= 0 then
            sLuaApp:NotifyTipsMsgEx(player, "帮派成员禁言成功")
        else
            sLuaApp:NotifyTipsMsgEx(player, "帮派成员解除禁言成功")
        end
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_FORBID_TALK, set.."", target_guid.."", code)
    return ""
end

function IsGuildJobFull(guild, target_job)
    if guild == nil then
        return true
    end

    local count = guild:GetMemberCountByJob(target_job)
    if target_job >= 3 and count >= 1 then
        return true
    elseif target_job == GUILD_JOB_DRAGON_NORMAL or target_job == GUILD_JOB_TIGER_NORMAL then
        local level = guild:GetBaseLevel()
        local buildings = GuildConfig.BuildingsConfig[2]
        local building_level = buildings.BuildingLevels[level]
        if count >= building_level.Param1 then
            return true
        end
    end

    return false
end

function AppointJob(player, target_job, target_guid)
    if player == nil then
        return ""
    end
	
    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派，无法操作")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_APPOINT_JOB) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return ""
    end

    local job = sGuildSystem:GetGuildJob(player)
    local member_job = sGuildSystem:GetMemberJob(target_guid)
	
	if GetJobLevel(member_job) >= GetJobLevel(job) then
        sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
        return ""
    end

    if target_job == GUILD_JOB_LEADER then
        if job ~= GUILD_JOB_LEADER then
            sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
            return ""
        end
    end

    if target_job == GUILD_JOB_DEPUTY then
        if job < GUILD_JOB_LEADER then
            sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
            return ""
        end
        local count = guild:GetMemberCountByJob(target_job)
        if count > 0 then
            sLuaApp:NotifyTipsMsgEx(player, "该职位成员已满，无法操作")
            return ""
        end
    end

    if target_job == GUILD_JOB_LEFT_DEACON or target_job == GUILD_JOB_RIGHT_DEACON or target_job == GUILD_JOB_DRAGON_LEADER or target_job == GUILD_JOB_TIGER_LEADER then
        if job < GUILD_JOB_DEPUTY then
            sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
            return ""
        end
        local count = guild:GetMemberCountByJob(target_job)
        if count > 0 then
            sLuaApp:NotifyTipsMsgEx(player, "该职位成员已满，无法操作")
            return ""
        end
    end

    if target_job == GUILD_JOB_DRAGON_NORMAL then
        if job < GUILD_JOB_DRAGON_LEADER then
            sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
            return ""
        end
		local count = guild:GetMemberCountByJob(target_job)
        if count > 20 then
            sLuaApp:NotifyTipsMsgEx(player, "该职位成员已满，无法操作")
            return ""
        end
    end

    if target_job == GUILD_JOB_NORMAL then
        if job < GUILD_JOB_TIGER_NORMAL then
            sLuaApp:NotifyTipsMsgEx(player, "您的权限不足，无法操作")
            return ""
        end
    end

    local code = sGuildSystem:UpdateMemberJob(guild, target_guid, target_job)
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, target_job.."", target_guid.."", code)
    if code == 0 then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员职位修改成功")
        local player_guid = player:GetGUID()
        local job_id = sGuildSystem:GetGuildJob(player)
		
		local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
		for k,v in pairs(member_guid_list) do
			local member = sPlayerSystem:GetPlayerByGUID(v)
			if member then
				local form_str = [[
					ChatUI.ShowMsgInChannel(3, "]]..sContactSystem:GetContactName(target_guid).."被"..player:GetName().."调整为"..GuildConfig.Job2Name[target_job].."职位"..[[")
				]]
				sLuaApp:ShowForm(member, "脚本表单", form_str)
				if target_job == GUILD_JOB_LEADER then
					form_str = [[
						ChatUI.ShowMsgInChannel(3, "帮主已将帮派转移给]]..sContactSystem:GetContactName(target_guid)..[[")
					]]
					sLuaApp:ShowForm(member, "脚本表单", form_str)
				end
			end
		end
		
        sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, job_id.."", player_guid.."", code)
    end
    return ""
end

function AddFriend(player, param1)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派，无法操作")
        return ""
    end

    return ""
end

function FormGuild.GetImpeach(player)
	local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        return ""
    end
	
	local ImpeachState = guild:GetInt("ImpeachState")
	if ImpeachState == 0 then
		if sGuildSystem:EnableImpeachLeader(player) ~= 0 then
			ImpeachState = -1
		end
	end
	
	local form_str = [[
		if FactionUI then
			FactionUI.ImpeachState = ]]..ImpeachState..[[
			FactionUI.ImpeachInitiator = ']]..guild:GetString("ImpeachInitiator")..[['
			FactionUI.ImpeachEndTime = ]]..guild:GetInt("ImpeachEndTime")..[[
			FactionUI.refreshImpeachment()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
	 
	return ""
end

function ImpeachLeader(player)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法弹劾帮主")
        return ""
    end

    if sGuildSystem:GetGuildJob(player) < GUILD_JOB_DRAGON_LEADER then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return ""
    end

	if sGuildSystem:GetGuildJob(player) == GUILD_JOB_LEADER then
        sLuaApp:NotifyTipsMsgEx(player, "你不能弹劾你自己")
        return ""
    end
	
	local ImpeachState = guild:GetInt("ImpeachState")
	if ImpeachState ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "已经在弹劾状态了")
        return ""
	end
	if sGuildSystem:EnableImpeachLeader(player) ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "帮主当前状态不可以被弹劾")
        return ""
	end
	guild:SetInt("ImpeachState",1)
	guild:SetString("ImpeachInitiator",player:GetName())
	guild:SetInt("ImpeachEndTime",sLuaApp:GetTimes()+GuildConfig.ImpeachTime)
	local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
	for k,v in pairs(member_guid_list) do
		sMailSystem:SendMail(0, "帮派", v, 2, "帮派弹劾通知", "由于帮主不上线已经超过7天，玩家"..player:GetName().."发起了弹劾。", {}, {})
	end
	guild:SetInt("ImpeachTimer",sLuaTimerSystem:AddTimerEx(sSystem, GuildConfig.ImpeachTime, 1, "Guild.ImpeachLeader", ""..guild:GetGUID()))
	local form_str = [[
		FactionUI.ImpeachState = ]]..guild:GetInt("ImpeachState")..[[
		FactionUI.ImpeachInitiator = ']]..guild:GetString("ImpeachInitiator")..[['
		FactionUI.ImpeachEndTime = ]]..guild:GetInt("ImpeachEndTime")..[[
		FactionUI.refreshImpeachment()
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
	
	
    --local code = sGuildSystem:ImpeachLeader(player)
    --sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_IMPEACH_LEADER, "", "", code)
    return ""
end

function ImpeachAgree(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派，无法操作")
        return ""
    end
	
	sGuildSystem:ImpeachAgree(player)
    return ""
end

function ImpeachDisagree(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派，无法操作")
        return ""
    end
	
	sGuildSystem:ImpeachDisagree(player)
    return ""
end

function VerifySet(player, set)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法设置")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_VERIFY_SET) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    if set ~= 0 then
        sGuildSystem:SetConfig(player, true, GUILD_CONFIG_VERIFY)
    else
        sGuildSystem:SetConfig(player, false, GUILD_CONFIG_VERIFY)
    end
    sLuaApp:NotifyTipsMsgEx(player, "设置成功")
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_VERIFY_SET, set.."", "", 0)
    return ""
end

function CleanApplicant(player)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_APPLY_CLEAN) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    local guids = sGuildSystem:GetGuildApplicants(guild)
    local code = sGuildSystem:RefuseApply(player, true, 0)
    if code == 0 then
        for  i = 1, #guids do
            sMailSystem:SendMail(0, "系统", guids[i], 1, "拒绝入帮申请", "【" .. guild:GetName() .. "】帮派的管理员拒绝了你的入帮申请", {}, {})
        end
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_CLEAN_APPLICANT, "", "", code)
    return ""
end

function RefreshApplicant(player)
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end
    
    sGuildSystem:NotifyGuildApplicants(player)
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_REFRESH_APPLICANT, "", "", 0)
    return ""
end

function Invite(player, target_guid)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法邀请")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_INVITE) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if target == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法邀请")
        return ""
    end

    local level = target:GetAttr(ROLE_ATTR_LEVEL)
    if level < 11 then
        sLuaApp:NotifyTipsMsgEx(player, "对方等级不足，无法邀请加入帮派")
        return ""
    end

    if sGuildSystem:HasGuild(target) then
        sLuaApp:NotifyTipsMsgEx(player, "对方已有帮派，无法邀请")
        return ""
    end
	
	if guild:IsFull() then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法邀请")
        return ""
    end 
	
    sLuaApp:NotifyTipsMsgEx(player, "邀请已发送")
    sInviteSystem:SendInvite(player, target, INVITE_GUILD_INVITE_JOIN, 60, player:GetName() .. "邀请您加入帮派[" .. guild:GetName() .. "]!", "FormGuild.OnReplyInviteJoin")
    return ""
end

function RefuseApplicant(player, target_guid)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_APPLY_ADUIT) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end

    local code = sGuildSystem:RefuseApply(player, false, target_guid)
    if code == 0 then
        sMailSystem:SendMail(0, "系统", target_guid, 1, "拒绝入帮申请", "【" .. guild:GetName() .. "】帮派的管理员拒绝了你的入帮申请", {}, {})
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_REFUSE_APPLICANT, target_guid .. "", "", code)
    return ""
end

function AgreeApplicant(player, target_guid)
	sLuaApp:LuaDbg("AgreeApplicant     player = "..player:GetName())
    if player == nil then
        return ""
    end

    if not sGuildSystem:HasGuild(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end

    if not sGuildSystem:HasPermission(player, GUILD_PERMISSION_APPLY_ADUIT) then
        sLuaApp:NotifyTipsMsgEx(player, "您没有权限，无法操作")
        return false
    end
	local guild = sGuildSystem:GetGuildByPlayer(player)
	if guild:IsFull() then
        sLuaApp:NotifyTipsMsgEx(player, "帮派成员已满，无法加入")
        return ""
    end 

    local code = sGuildSystem:AgreeApply(player, target_guid)
	if sPlayerSystem:GetPlayerByGUID(target_guid) then
		 sLuaApp:NotifyTipsMsgEx(sPlayerSystem:GetPlayerByGUID(target_guid), "恭喜您，加入了"..sGuildSystem:GetGuildByPlayer(player):GetName())
	end
	local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
	for k,v in pairs(member_guid_list) do
		local member = sPlayerSystem:GetPlayerByGUID(v)
		if member then
			local form_str = [[
					ChatUI.ShowMsgInChannel(3, "]].."玩家"..sContactSystem:GetContactName(target_guid).."加入了帮派"..[[")
				]]
				sLuaApp:ShowForm(member, "脚本表单", form_str)
		end
	end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_AGREE_APPLICANT, target_guid .. "", "", code)
    return ""
end

function GetBuildingLevel(guild, building_id)
    if guild == nil then
        return 0
    end

    if building_id < 1 or building_id > 5 then
        return 0
    end

    local levels = {
        guild:GetBaseLevel(),
        guild:GetAcademyLevel(),
        guild:GetWingRoomLevel(),
        guild:GetValutLevel(),
        guild:GetPharmacyLevel(),
    }
    return levels[building_id]
end

function UpgradeBuilding(player, building_id)
    if player == nil then
        return ""
    end

    local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有帮派, 无法操作")
        return ""
    end

    local job = sGuildSystem:GetGuildJob(player)
    if job ~= GUILD_JOB_LEADER and job ~= GUILD_JOB_DEPUTY then
        sLuaApp:NotifyTipsMsgEx(player, "必须是副帮主以上才能进行此操作")
        return ""
    end

    if building_id < 0 or building_id > 5 then
        sLuaApp:NotifyTipsMsgEx(player, "无效帮派建筑编号：" .. building_id)
        return ""
    end

    local buildings = GuildConfig.BuildingsConfig[building_id]
    local level = GetBuildingLevel(guild, building_id)
    if level >= 5 then
        sLuaApp:NotifyTipsMsgEx(player, buildings.BuildingName .. "已到最高等级，无法升级")
        return ""
    end 
    local building_level = buildings.BuildingLevels[level + 1]
    if building_level.BuildDegreeRequired ~= 0 and guild:GetBuildDegree() < building_level.BuildDegreeRequired then
        sLuaApp:NotifyTipsMsgEx(player, "帮派建设度不足，无法升级")
        return ""
    end

    if building_level.FundRequired ~= 0 and guild:GetFund() < building_level.FundRequired then
        sLuaApp:NotifyTipsMsgEx(player, "帮派资金不足，无法升级")
        return ""
    end

    if building_level.BuildingIdRequired ~= 0 and GetBuildingLevel(guild, building_level.BuildingIdRequired) < building_level.BuildingLevelRequired then
        sLuaApp:NotifyTipsMsgEx(player, "需求建筑等级不足，无法升级")
        return ""
    end

    sGuildSystem:SubFund(guild, building_level.FundRequired)
    local code = sGuildSystem:SetGuildLevel(guild, building_id, level + 1)
    if code == 0 then
        level = level + 1
		local str = GuildConfig.BuildingsConfig[building_id]['str']
		if building_id == 1 then
			str = str..GetBuildingLevel(guild, building_id)
		end

		local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
		for k,v in pairs(member_guid_list) do
			local member = sPlayerSystem:GetPlayerByGUID(v)
			if member then
				local form_str = [[
					ChatUI.ShowMsgInChannel(3, "]]..str..[[")
				]]
				sLuaApp:ShowForm(member, "脚本表单", form_str)
			end
		end
		
    end
    sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_UPGRADE_BUILDING, building_id .. "", level .. "", code)
    return ""
end

function FormGuild.OnLogin_FactionRedPoint(player)
	local guild = sGuildSystem:GetGuildByPlayer(player)
    if guild == nil then
        return
    end
	local week_val = player:GetWeekInt("GuildDonateWeekValue")
	if week_val >= GuildConfig.DonateConfig['WeekMax'] then
		return 
	end
	if player:GetDayInt("OnLogin_FactionRedPoint") ~= 0 then
		return
	end
	local form_str = [[
		if GlobalProcessing then
			GlobalProcessing.FactionRedPoint()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
	player:SetDayInt("OnLogin_FactionRedPoint",1)
end

--设置帮派相关信息
function FormGuild.ExecuteOperation(player, type, param1, param2)
    if player == nil then
        return ""
    end

    if type == GUILD_OPERATE_MODIFY_NAME then
        ModifyGuildName(player, param1)
    elseif  type == GUILD_OPERATE_MODIFY_DECLARATION then
        ModifyGuildDeclaration(player, param1)
    elseif  type == GUILD_OPERATE_GET_DIVIDEND then
        GetDividend(player)
    elseif  type == GUILD_OPERATE_JOIN_ACTIVITY then
        JoinActivity(player, param1)
    elseif  type == GUILD_OPERATE_DONATE then
        Donate(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_SEND_NOTICE then
        SendNotice(player, param1)
    elseif  type == GUILD_OPERATE_GO_BACK then
        GoBack(player)
    elseif  type == GUILD_OPERATE_QUIT_GUILD then
        LeaveGuild(player)
    elseif  type == GUILD_OPERATE_IMPEACH_LEADER then
        ImpeachLeader(player)
    elseif  type == GUILD_OPERATE_EXPEL_MEMBER then
        ExpelMember(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_FORBID_TALK then
        ForbidTalk(player, tonumber(param1), tonumber(param2))
    elseif  type == GUILD_OPERATE_APPOINT_JOB then
        AppointJob(player, tonumber(param1), tonumber(param2))
    elseif  type == GUILD_OPERATE_ADD_FRIEND then
        AddFriend(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_IMPEACH_AGREE then
        ImpeachAgree(player)
    elseif  type == GUILD_OPERATE_IMPEACH_DISAGREE then
        ImpeachDisagree(player)
    elseif  type == GUILD_OPERATE_VERIFY_SET then
        VerifySet(player, tonumber(param1), tonumber(param2))
    elseif  type == GUILD_OPERATE_CLEAN_APPLICANT then
        CleanApplicant(player)
    elseif  type == GUILD_OPERATE_REFRESH_APPLICANT then
        RefreshApplicant(player)
    elseif  type == GUILD_OPERATE_INVITE_JOIN then
        Invite(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_REFUSE_APPLICANT then
        RefuseApplicant(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_AGREE_APPLICANT then
        AgreeApplicant(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_UPGRADE_BUILDING then
        UpgradeBuilding(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_CREATE_GUILD then
        CreateGuild(player, param1, param2)
    elseif  type == GUILD_OPERATE_APPLY_JOIN_BY_ID then
        ApplyJoinById(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_APPLY_JOIN_BY_PLAYER then
        ApplyJoinByPlayer(player, tonumber(param1))
    elseif  type == GUILD_OPERATE_APPLY_JOIN_BY_ONE_KEY then
        ApplyJoinByOneKey(player)
    end

    return ""
end

function FormGuild.GetData(player)
	local str = [[
		if FactionUI then
			FactionUI.ConstructData = ]]..Lua_tools.serialize(GuildConfig.BuildingsConfig)..[[
            FactionUI.RefreshConstructData()
		end
	
	]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end