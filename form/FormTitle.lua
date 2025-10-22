--称号相关相关表单
FormTitle = {}
-- 称号索引
FormTitle.ServerData = {}
FormTitle.ServerData.TitleIndex = {
    -1,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
	11,
    0
}
-- 称号类型
FormTitle.ServerData.TitleType = {
    [-1] = "全部",
    [1] = "活动",
    [2] = "门派",
    [3] = "帮派",
    [4] = "婚姻",
    [5] = "结义",
    [6] = "师徒",
    [7] = "强化",
    [8] = "镶嵌",
    [9] = "官职",
    [10] = "变身",
	[11] = "宠物",
    [0] = "其他"
}
-- 称号子类型
FormTitle.ServerData.TitleSubtype = {
    [-1] = {},
    [0] = {},
    [1] = {
        [1] = "帮派竞技",
        [2] = "天下会武",
        [3] = "魔神降临",
        [4] = "无字真经",
        [5] = "善恶",
        [6] = "科举"
    },
    [2] = {
        [1] = "花果山",
        [2] = "西海龙宫",
        [3] = "慈恩寺",
        [4] = "流沙界",
        [5] = "净坛禅院",
        [6] = "酆都"
    },
    [3] = {},
    [4] = {},
    [5] = {},
    [6] = {},
    [7] = {},
    [8] = {},
    [9] = {
        [1] = "品阶",
        [2] = "排行榜"
    },
    [10] = {
        [1] = "神兽",
        [2] = "宠物",
        [3] = "侍从"
    },
	[11] = {}
}

function FormTitle.GetTitleData(player)
	if player == nil then
		return ""
	end
	 
	local str = [[
		if TitleUI then
			TitleUI.ServerData = ]]..Lua_tools.serialize(FormTitle.ServerData)..[[
			TitleUI.Refresh()
		end
	]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end


function FormTitle.SetCurTitle(player, title_id)
	if player == nil then
		return ""
	end
	
	local code = sTitleSystem:SetCurTitle(player, title_id)
	if code ~= 0 then
		sLuaApp:NotifyTipsMsgEx(player, "设置称号失败！")
	end
	return ""
end