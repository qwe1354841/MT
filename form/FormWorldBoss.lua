--世界boss表单
FormWorldBoss = {}

function FormWorldBoss.onjoin_worldboss_fight(player,act_id)
	if tonumber(act_id) == Act_WorldBoss.ID then
		if Act_WorldBoss then
			if sLuaApp:IsActivityRunning(Act_WorldBoss.ID) then 
				Act_WorldBoss.onjoin_worldboss_fight(player)
			end
		end
	elseif tonumber(act_id) == Act_GuildBoss.ID then
		if Act_GuildBoss then
			if sLuaApp:IsActivityRunning(Act_GuildBoss.ID) then 
				Act_GuildBoss.onjoin_guildboss_fight(player)
			end
		end
	end
	
	return ""
end

function FormWorldBoss.get_server_data(player,act_id)
	if tonumber(act_id) == Act_WorldBoss.ID then
		if WorldBossNPC then
			WorldBossNPC.get_server_data(player)
		end
	elseif tonumber(act_id) == Act_GuildBoss.ID then
		if GuildBossNPC then
			GuildBossNPC.get_server_data(player)
		end
	end
	
	return ""
end