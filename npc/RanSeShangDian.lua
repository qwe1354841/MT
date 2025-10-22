RanSeShangDian = {}
function RanSeShangDian.option1(npc, player, content)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('PetDyeingUI')")
	-- sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('PetDyeingUI_UserDefined')")
    return ""
end

function RanSeShangDian.option2(npc, player, content)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('RoleDyeingUI')")
	-- sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('RoleDyeingUI_UserDefined')")
    return ""
end

function RanSeShangDian.option3(npc, player, content)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('MountsDyeingUI')")
    return ""
end

function RanSeShangDian.main(npc, player)

    player:AddNpcOption(npc, 0, "宠物染色", "option1", "1");
    player:AddNpcOption(npc, 0, "角色染色", "option2", "2");
    player:AddNpcOption(npc, 0, "坐骑染色", "option3", "3");
    
    return "";
end