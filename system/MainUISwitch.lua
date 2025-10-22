--各系统开启等级配置
MainUISwitch = {}

MainUISwitch.Config = {
    --主界面上方系统
    ["限时购"] = {OpenLevel = 20,Subtab_OpenLevel = {}},
    ["活动"] = {OpenLevel = 25,Subtab_OpenLevel = {}},
    ["超值"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["福利"] = {OpenLevel = 10,Subtab_OpenLevel = {}},
    ["排行"] = {OpenLevel = 40,Subtab_OpenLevel = {}},
    ["VIP"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["提升"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["首充"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["祈福"] = {OpenLevel = 13,Subtab_OpenLevel = {}},
    ["商城"] = {OpenLevel = 1,Subtab_OpenLevel = {["金元"] = 1,["银元"] = 1,["充值"] = 1}},
    ["兑换"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    --["七日"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["交易行"] = {OpenLevel = 30,Subtab_OpenLevel = {["商会"] = 30,["交易"] = 50}},
    --["异兽"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    --["双倍"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["挂机"] = {OpenLevel = 25,Subtab_OpenLevel = {}},

    --右下角各系统
    ["变强"] = {OpenLevel = 25,Subtab_OpenLevel = {}},
    ["系统"] = {OpenLevel = 1,Subtab_OpenLevel = {}},
    ["包裹"] = {OpenLevel = 1,Subtab_OpenLevel = {["包裹"] = 1,["仓库"] = 1,["时装"] = 1,["羽翼"] = 58,["坐骑"] = 60}},
    ["侍从"] = {OpenLevel = 13,Subtab_OpenLevel = {["属性"] = 13,["升星"] = 13,["情缘"] = 13,["加成"] = 24,["阵容"] = 13}},
    ["队伍"] = {OpenLevel = 25,Subtab_OpenLevel = {["队伍"] = 25,["申请"] = 25}},
    ["生产"] = {OpenLevel = 41,Subtab_OpenLevel = {["烹饪"] = 41,["炼药"] = 41}},
    ["帮派"] = {OpenLevel = 28,Subtab_OpenLevel = {}},
    ["技能"] = {OpenLevel = 12,Subtab_OpenLevel = {["门派"] = 12,["天赋"] = 30,["修炼"] = 45,["帮派"] = 28}},
    ["装备"] = {OpenLevel = 32,Subtab_OpenLevel = {["装备"] = 32,["宝石"] = 32,["炼化"] = 40,["符印"] = 32,["器灵"] = 45,},Subtab_OpenLevel_2 = {["打造"] = 41,["强化"] = 32,["修理"] = 32,["镶嵌"] = 32,["合成"] = 32,["特效"] = 40,["特技"] = 40,["提取"] = 40,["符印"] = 32,["洗灵"] = 45,["附灵"] = 50,["升灵"] = 55,}},
    ["辅助"] = {OpenLevel = 34,Subtab_OpenLevel = {}},

    --角色宠物等系统
    ["宠物"] = {OpenLevel = 1,Subtab_OpenLevel = {["属性"] = 1,["养成"] = 30,["洗炼"] = 46,["合成"] = 48,["阵容"] = 1},Subtab_OpenLevel_2 = {["加点"] = 1,["装备培养"] = 1,["突破"] = 46}},
    ["角色"] = {OpenLevel = 1,Subtab_OpenLevel = {["属性"] = 1,["详情"] = 42},Subtab_OpenLevel_2 = {["加点"] = 1}},
    ["好友"] = {OpenLevel = 1,Subtab_OpenLevel = {["推荐好友"] = 1},Subtab_OpenLevel_2 = {["好友"] = 1,["相亲"] = 30,["师徒"] = 25}},

    --其它系统
    ["PK"] = {OpenLevel = 20,Subtab_OpenLevel = {}},
}

function MainUISwitch.GetMainUISwitchData(player)
    if not player then
        return
    end

    local str = [[
        if MainUI then
            MainUI.MainUISwitchConfig = ]]..Lua_tools.serialize(MainUISwitch.Config)..[[
            MainUI.RefreshBtnOpenDef()
        end
    ]]

    sLuaApp:ShowForm(player, "脚本表单", str)
end

--判断等级并飘字提示
function MainUISwitch.CheckOpenLevel(player,Tab_Name,Subtab_1,Subtab_2)
    if player == nil or Tab_Name == nil then
        return
    end
    if Subtab_1 == nil and Subtab_2 == nil then
        local open_level = MainUISwitch.Config[Tab_Name]["OpenLevel"]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		sLuaApp:NotifyTipsMsg(player, "您需要达到"..open_level.."级才能开启"..Tab_Name.."功能")
	    		return false
	    	end
	    end
    elseif Subtab_1 and Subtab_2 == nil then
        local open_level = MainUISwitch.Config[Tab_Name]["Subtab_OpenLevel"][Subtab_1]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		sLuaApp:NotifyTipsMsg(player, "您需要达到"..open_level.."级才能开启"..Subtab_1.."功能")
	    		return false
	    	end
	    end
    elseif Subtab_1 and Subtab_2 then
        local open_level = MainUISwitch.Config[Tab_Name]["Subtab_OpenLevel_2"][Subtab_2]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		sLuaApp:NotifyTipsMsg(player, "您需要达到"..open_level.."级才能开启"..Subtab_2.."功能")
	    		return false
	    	end
	    end
    end
	return true
end

--判断等级直接return
function MainUISwitch.CheckOpenLevel_0(player,Tab_Name,Subtab_1,Subtab_2)
    if player == nil or Tab_Name == nil then
        return
    end
    if Subtab_1 == nil and Subtab_2 == nil then
        local open_level = MainUISwitch.Config[Tab_Name]["OpenLevel"]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		return false
	    	end
	    end
    elseif Subtab_1 and Subtab_2 == nil then
        local open_level = MainUISwitch.Config[Tab_Name]["Subtab_OpenLevel"][Subtab_1]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		return false
	    	end
	    end
    elseif Subtab_1 and Subtab_2 then
        local open_level = MainUISwitch.Config[Tab_Name]["Subtab_OpenLevel_2"][Subtab_2]
	    if open_level then
	    	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	    	if player_level < open_level then
	    		return false
	    	end
	    end
    end
	return true
end