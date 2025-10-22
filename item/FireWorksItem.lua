--这是烟花类道具的使用
FireWorksItem={}
--烟花类道具的配置
FireWorksItem.Config={
    ["礼花"]={Duration=1000,ResKey="3000001618"},
    ["常规烟花"]={Duration=1000,ResKey="3000001618"},
    ["心形烟花"]={Duration=1000,ResKey="3000001600"},
    ["百年好合"]={Duration=1000,ResKey="3000001582"},
    ["郎才女貌"]={Duration=1000,ResKey="3000001661"},
    ["白头偕老"]={Duration=1000,ResKey="3000001671"},
    ["永结同心"]={Duration=1000,ResKey="3000001446"},
    ["拉炮1"]={Duration=1000,ResKey="3000001555"},
    ["拉炮2"]={Duration=1000,ResKey="3000001648"},
    ["单簇烟花"]={Duration=1000,ResKey="3000001769"},
}

function FireWorksItem.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function FireWorksItem.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function FireWorksItem.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    local itemKeyName=item:GetKeyName()
    sLuaApp:LuaDbg("itemKeyName"..itemKeyName)--21707
    if FireWorksItem.Config[itemKeyName] then
        return true
    else
        return false
    end
end
--使用道具
function FireWorksItem.on_use_item(player,item,count)
    if item==nil then
        return false
    end

    --sLuaApp:LuaDbg("烟花使用")
    local itemKeyName=item:GetKeyName()
    local itemData=FireWorksItem.Config[itemKeyName]
    local ResKey=itemData.ResKey
    --local Duration=itemData.Duration * count
    --持续时间无用  与特效本身是否循环相关，如果不循环直接1秒放完消失
    --local Duration=0
    --sLuaApp:LuaDbg("ResKey"..tostring(ResKey))
    --以下方法得到玩家所在的地图以及位置
    local map=player:GetMap()
    local posX = sMapSystem:GetPosX(player)
    local posY = sMapSystem:GetPosY(player)

    --local str = [[
    --	CL.ShowMapEffect(']]..ResKey..[[',']]..posX..[[, ]]..posY..[[', '0, 0, 0', '0, -59, 0', '1, 1, 1', ']]..Duration..[[')
    --]]
    local str=[[
        for i = 1, ]]..count..[[ do
             CL.ShowMapEffect("]]..ResKey..[[", "]]..posX..[[,]]..posY..[[", "0,0,0", "0,-59,0", "1,1,1", "5.5")
        end

    ]]
    sLuaApp:ShowAroundForm(map, posX, posY, "脚本表单", str)
end