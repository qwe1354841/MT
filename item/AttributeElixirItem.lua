--属性丹药的使用
local AttributeElixirItem={}

_G.AttributeElixirItem=AttributeElixirItem
--属性丹配置
local attributeElixirConfig={
    ["增加力量"]={Attr1=17,Attr1Num=1,Str="力量"},
    ["增加法力"]={Attr1=16,Attr1Num=1,Str="法力"},
    ["增加体质"]={Attr1=15,Attr1Num=1,Str="体质"},
    ["增加耐力"]={Attr1=19,Attr1Num=1,Str="耐力"},
    ["增加敏捷"]={Attr1=18,Attr1Num=1,Str="敏捷"},
}

--创建物品
function AttributeElixirItem.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function AttributeElixirItem.on_item_destroy(item)
    if item==nil then
        return false
    end

end
--使用道具前
function AttributeElixirItem.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    local itemKeyName=item:GetKeyName()
    if attributeElixirConfig[itemKeyName] then
        return true
    end

    --属性丹使用最大限制   2021.8.9日未配置 (依旧为0) 先不管
    --TODO 属性丹使用最大限制判断
    --local itemKeyName=item:GetKeyName()
    --local itemData=ItemConfig.GetByKeyName(itemKeyName)
    --local itemNumberMax=itemData.NumberMax
    return false
end
--使用道具
function AttributeElixirItem.on_use_item(player,item,count)
    if item==nil then
        return false
    end

    local itemId=item:GetId()
    local itemKeyName=item:GetKeyName()
    local itemName=item:GetName()
    local str=attributeElixirConfig[itemKeyName].Str
    local oldValue=0
    if player:GetDynAttrsByMark(itemId)[1]~=nil and player:GetDynAttrsByMark(itemId)[1]["value"]~=nil then
        oldValue=player:GetDynAttrsByMark(itemId)[1]["value"]
    end

    local addValue=attributeElixirConfig[itemKeyName].Attr1Num * count
    local newValue=addValue+oldValue
    if player:SetDynAttr(itemId,attributeElixirConfig[itemKeyName].Attr1,newValue) then
        sLuaApp:NotifyTipsMsg(player, itemName.."使用成功，"..str.."增加了"..addValue.."点")
        player:RecalcAttr()
        local newData=player:GetDynAttrsByMark(itemId)

        --sLuaApp:LuaDbg("使用成功")
    else
        sLuaApp:NotifyTipsMsg(player, "使用失败")
        --sLuaApp:LuaDbg("使用失败")
    end

end