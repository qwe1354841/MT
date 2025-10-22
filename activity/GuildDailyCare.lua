--帮派维护
GuildDailyCare = {}
function GuildDailyCare.OnDeclare(id, seconds)
    
end

function GuildDailyCare.OnStart(id, is_normal)
	if sDBVarSystem:GetInt("GuildDailyCare_Day") == sLuaApp:DaySinceEpoch(0) then
		return
	end
	for k,v in pairs(sGuildSystem:GetAllGuilds()) do
		local guild = v
		local guild_fund = guild:GetFund()
		local guild_level = guild:GetBaseLevel()
		if GuildConfig.DailyCareFund[guild_level] then
			if guild_fund >= GuildConfig.DailyCareFund[guild_level] then
				sGuildSystem:SubFund(guild, GuildConfig.DailyCareFund[guild_level])
				guild:SetInt("Daily_Care_Sub_Fund_False",0)
			else
				local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
				if guild:GetInt("Daily_Care_Sub_Fund_False") >= 3 then
					for a,b in ipairs(member_guid_list) do
						sMailSystem:SendMail(0, "帮派", b, 2, "帮派解散通知", "您所在的帮派"..guild:GetName().."由于长期缺乏维护，已自动解散。", {}, {})
					end
					sGuildSystem:DestroyGuild(guild)
					return
				else
					for a,b in ipairs(member_guid_list) do
						sMailSystem:SendMail(0, "帮派", b, 2, "帮派资金不足通知", "您所在的帮派"..guild:GetName().."由于维护费用不足，即将在".. 3 - guild:GetInt("Daily_Care_Sub_Fund_False").."天后自动解散，请尽快通过帮派捐献补充帮派资金。", {}, {})
					end
					guild:SetInt("Daily_Care_Sub_Fund_False",guild:GetInt("Daily_Care_Sub_Fund_False")+1)
				end
			end
		end
	end
	sDBVarSystem:SetInt("GuildDailyCare_Day",sLuaApp:DaySinceEpoch(0),0)
end

function GuildDailyCare.OnStop(id)
    
end

function GuildDailyCare.OnJoin(id, player)
	
end

function GuildDailyCare.OnQuery(id, player)
	return ""
end