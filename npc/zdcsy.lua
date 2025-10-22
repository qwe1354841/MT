zdcsy = {}
function zdcsy.option1(npc, player, content)
    local shop_id = tonumber(content);
    sNpcSystem:OpenShop(npc, player, shop_id);
    return ""
end

function zdcsy.option2(npc, player, content)
    local msg = player:GetKeyName().."select npc".. npc:GetKeyName().."option2"..content;
    sLuaApp:LuaWrn(msg);
    return msg;
end

function zdcsy.option3(npc, player, content)
    local msg = player:GetKeyName().."select npc".. npc:GetKeyName().."option3"..content;
    sLuaApp:LuaWrn(msg);
    return msg;
end

function zdcsy.main(npc, player)

    player:AddNpcOption(npc, 1, "傲来村武器店", "option1", "802");
    player:AddNpcOption(npc, 2, "测试选项2", "option2", "22222");
    player:AddNpcOption(npc, 3, "测试选项3", "option3", "33333");
    
    return "我是战斗测试员，多多关照";
end