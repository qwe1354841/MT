--技能书礼盒
SKillBookGifts = {}
--配置
SKillBookGifts.Config={
    ["31"] = {
        {ItemKey = "花果山50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "花果山50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "花果山50天赋3", Num = 1, Bind = 0, Rand =160},
    },
    ["32"]={
        {ItemKey = "西海龙宫50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "西海龙宫50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "西海龙宫50天赋3", Num = 1, Bind = 0, Rand =160},
    },
    ["33"]={
        {ItemKey = "慈恩寺50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "慈恩寺50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "慈恩寺50天赋3", Num = 1, Bind = 0, Rand =160},
    },
    ["34"]={
        {ItemKey = "流沙界50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "流沙界50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "流沙界50天赋3", Num = 1, Bind = 0, Rand =160},
    },
    ["35"]={
        {ItemKey = "净坛禅院50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "净坛禅院50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "净坛禅院50天赋3", Num = 1, Bind = 0, Rand =160},
    },
    ["36"]={
        {ItemKey = "酆都50天赋1", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "酆都50天赋2", Num = 1, Bind = 0, Rand =160},
        {ItemKey = "酆都50天赋3", Num = 1, Bind = 0, Rand =160},
    },
}


--创建物品
function SKillBookGifts.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function SKillBookGifts.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function SKillBookGifts.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    return true
end
--使用道具
function SKillBookGifts.on_use_item(player,item,count)
    if item==nil then
        return false
    end
    --为什么不用ROLE_ATTR_JOB1
    --因为  ROLE_ATTR_JOB1  是nil 可能枚举没加
    local job1=3
    local roleSchool=player:GetAttr(job1)

    local item_name = item:GetKeyName()
    local item_id = item:GetId()
    local gifts_config = SKillBookGifts.Config[tostring(roleSchool)]
    --local inspect = require("inspect")
    --sLuaApp:LuaDbg(Lua_tools.serialize(gifts_config))
    --以下方法直接从RandomGifts搬运过来
    if gifts_config and Lua_tools then
        local get_item_list = {}
        for i = 1, count do
            --记录物品
            if gifts_config['RandItemList'] then
                if gifts_config['Item'] then
                    for _,v in ipairs(gifts_config['Item']) do
                        table.insert(get_item_list, v)
                    end
                    --Lua_tools.AddItem(player, gifts_config['Item'], "system", "随机礼包", item_name)
                end
                for k,v in ipairs(gifts_config['RandItemList']) do
                    local reward = Lua_tools.PlayerStartRandom(v['ItemRand'], "Gifts"..item_id..k, v['RandTime'])
                    if reward[1] ~= "Nil" then
                        for _,v in ipairs(reward) do
                            table.insert(get_item_list, v)
                        end
                        --Lua_tools.AddItem(player, reward, "system", "随机礼包", item_name)
                    end
                end
            else
                local reward = Lua_tools.PlayerStartRandom(gifts_config, "Gifts"..item_id, RandomGifts.times)
                if reward[1] ~= "Nil" then
                    for _,v in ipairs(reward) do
                        table.insert(get_item_list, v)
                    end
                    --Lua_tools.AddItem(player, reward, "system", "随机礼包", item_name)
                else
                    sLuaApp:NotifyTipsMsg(player,"礼包空空如也")
                end
            end

        end

        -- + item
        if get_item_list and next(get_item_list) then
            Lua_tools.AddItem(player, get_item_list, "system", "技能书礼包", item_name)
        end
    else
        sLuaApp:LuaDbg("RandomGiftsConfig 或 Lua_tools 配置缺少")
        return
    end
end