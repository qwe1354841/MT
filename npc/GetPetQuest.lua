--进入捕捉宠物战斗 by shodow_yong
GetPetQuest = {}
local monster_group = 1
function GetPetQuest.Option(npc, player, str)
	if not sFightSystem:StartPVE(player,monster_group) then
		sLuaApp:LuaDbg("StartPVE is err , monster_group = "..monster_group)
	end
    return ""
end

function GetPetQuest.main(npc, player)
	if sQuestSystem:GetQuestState(player,2) == 3 then
		--player:AddNpcOption(npc, 0 , "进入战斗", "Option", "");
		player:SetAutoFight(false)
		if not sFightSystem:StartTagPVE(player,monster_group,1000,"","","") then
			sLuaApp:LuaDbg("StartPVE is err , monster_group = "..monster_group)
		else
			if Guidance.Guidance_Config['Guidance_GetPetQuestFight'] then
				local str1 = [[
						GuideData.ServerData = ]]..Lua_tools.serialize(Guidance.Guidance_Config['Guidance_GetPetQuestFight'])..[[
						GUI.OpenWnd('GuideUI')
					]]
				sLuaApp:ShowForm(player, "脚本表单", str1)
				
				return ""
			end
		end
	end
    return "0";
end