--进入捕捉宠物战斗 by shodow_yong
PetFightQuest = {}
local monster_group = 1

function PetFightQuest.Option(npc, player, str)
	
	if not sFightSystem:StartPVE(player,monster_group) then
		sLuaApp:LuaDbg("StartPVE is err , monster_group = "..monster_group)
	end
    return ""
end

function PetFightQuest.main(npc, player)
	if sQuestSystem:GetQuestState(player,3) == 3 then
		--player:AddNpcOption(npc, 0 , "进入战斗", "Option", "");
		local pet = sPetSystem:GetLineupPet(player)
		if not pet then
			local str = [[
				GUI.OpenWnd("PetUI")
				GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.Guidance_Config['Guidance_PetUI'])..[[
				GUI.OpenWnd('GuideUI')
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end
		
		if not sFightSystem:StartTagPVE(player,monster_group,1000,"","","") then
			sLuaApp:LuaDbg("StartPVE is err , monster_group = "..monster_group)
		else
			return ""
		end
	end
    return "0";
end