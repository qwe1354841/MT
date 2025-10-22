--秘境开启NPC挂载脚本
DungeonSystemNPC = {}

function DungeonSystemNPC.main(npc, player)
	local npc_keyname = npc:GetKeyName()
	local dg_name_list = DungeonSystem.NPCToDgName[npc_keyname]
	if dg_name_list then
		for k,v in ipairs(dg_name_list) do
			if player:GetAttr(ROLE_ATTR_LEVEL) >= DungeonSystem.Config[v]['LevelMin'] then
				player:AddNpcOption(npc, 0, ""..v, "option1", ""..v)
			end
		end
	end
    return "0"
end

function DungeonSystemNPC.option1(npc, player, dg_name)
	local a = ""..DungeonSystem.Config[''..dg_name]['Type'].."/"..dg_name
	local str = [[
		GUI.OpenWnd("InstanceUI",']]..a..[[')
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end