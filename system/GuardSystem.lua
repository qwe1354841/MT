--新侍从展示
GuardSystem = {}

function GuardSystem.on_add_guard(guard)
	--模型展示
	local player = guard:GetMaster()
	local str = [[
	GUI.OpenWnd("GetPetOrGuardUI")
	GetPetOrGuardUI.SetGuardId(]]..guard:GetId()..[[)
	    if GuardUI then
        if GuardUI.SelectGuardID then
            GuardUI.autoScrollPosition(GuardUI.SelectGuardID)
        end
    end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	for i = 1, 2 do
		local Attr_id = Guard_Add.Attr_Add_Config[guard:GetId()]["S1Attr"..i]
		guard:SetInt("Attr_Add_AttrId",Attr_id)
	end

	--新侍从上阵
	local lineupContainer = player:GetLineupContainer()
	local UseArrayIndex = lineupContainer:GetCurrentLineup()
	local line_list = lineupContainer:GetLineup(UseArrayIndex)
	if #line_list < 4 then
		if not lineupContainer:PushLineup(UseArrayIndex, guard:GetGUID()) then
			sLuaApp:LuaErr("侍从上阵失败")
		end
	end

	if FormGuard then
		--侍从小红点
		FormGuard.get_guard_red_point_data(player)
	end
end
