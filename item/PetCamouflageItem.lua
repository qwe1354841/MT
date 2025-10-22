
--宠物伪装药
PetCamouflageItem={}
--配置信息
PetCamouflageItem.Config={
    ["无根草伪装药"]=201,
    ["小绵羊伪装药"]=202,
    ["野猪妖伪装药"]=203,
    ["山贼斥候伪装药"]=204 ,
    ["山贼首领伪装药"]=0,
    ["混世魔王伪装药"]=0,
    ["水判官伪装药"]=207,
    ["财气蛙伪装药"]=208,
    ["蟹将军伪装药"]=209,
    ["毒人伪装药"]=210,
    ["旋龟伪装药"]=211,
    ["洞花妖伪装药"]=212,
    ["浣灵熊伪装药"]=213,
    ["道观假人伪装药"]=214,
    ["裂天兕伪装药"]=215,
    ["魅音狐伪装药"]=216,
    ["戍边府逃兵伪装药"]=217,
    ["小虎妖伪装药"]=218,
    ["牛魔伪装药"]=219,
    ["叛军副将伪装药"]=220,
    ["九黎妖伪装药"]=221,
    ["赤炎狼伪装药"]=222,
    ["土灵熊伪装药"]=223,
    ["素尾白狐伪装药"]=224,
    ["幻灵鹿伪装药"]=225,
    ["白骨夫人伪装药"]=0,
    ["雪坊主伪装药"]=0,
    ["玄阴蝎伪装药"]=228,
    ["玄阴霜豹伪装药"]=229,
    ["冰魄剑灵伪装药"]=230,
    ["共工之魂伪装药"]=0,
    ["碧水金睛兽伪装药"]=0,
    ["踏火神犀伪装药"]=233,
    ["千年毒尸伪装药"]=234,
    ["婴灵伪装药"]=235,
    ["如意真仙伪装药"]=0,
    ["女娲幻身伪装药"]=0,
    ["青冥灯伪装药"]=238,
    ["天神石像伪装药"]=239,
    ["灵木怪伪装药"]=240,
    ["行者游魂伪装药"]=241,
    ["野鬼伪装药"]=242,
    ["寻宝者伪装药"]=243,
    ["剧毒蜘蛛伪装药"]=244,
    ["醉猴伪装药"]=245,
    ["瑞兽幼崽伪装药"]=246,
    ["岩穴鳄伪装药"]=247,
    ["水帘妖伪装药"]=248,
}
--创建物品
function PetCamouflageItem.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function PetCamouflageItem.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function PetCamouflageItem.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    local item_keyName=item:GetKeyName()
    sLuaApp:LuaDbg(" player"..player:GetKeyName())
    if PetCamouflageItem.Config[item_keyName] then
        local show_pet=sPetSystem:GetShowedPet(player)
        if  show_pet then
            local container = show_pet:GetBuffContainer()
            if container then
               -- Lua_tools.SubItem(player, Tb_consume.itemList, "system", "装备洗练", "装备洗练")
                if not Lua_tools.SubItem(player,{item_keyName,1}, "system", "宠物伪装药", "宠物伪装药的使用") then
                    sLuaApp:NotifyTipsMsg(player, item_keyName.."出错，扣除道具失败")
                    return false
                end
                sLuaApp:LuaDbg("container存在")
                container:CreateBuff(PetCamouflageItem.Config[item_keyName],0)
            end
        else
            sLuaApp:NotifyTipsMsg(player,"你没有宠物正在进行展示！")
        end
    else
        sLuaApp:LuaDbg("配置错误")
    end
    return false
end
--使用道具
function PetCamouflageItem.on_use_item(player,item,count)
    if item==nil then
        return false
    end

end