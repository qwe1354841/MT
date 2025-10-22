--帮派宝箱NPC
GuildBoxNPC = {}

function GuildBoxNPC.main(npc, player)
	if BaoGeDaKai then
		BaoGeDaKai.OpenBox(player, npc)
	end
	return ""
end

