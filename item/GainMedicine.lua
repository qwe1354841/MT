--require "item/PetItem"
GainMedicine = {}
--INCR_Method = 'HpPer'


GainMedicine.List = {
    --['增益药'] = {HpPer = 50, MpPer = 50,Hp_MpPer = 50}
    ['夜叉石'] = {Attr = "MpPer", Val = 70, Desc = "增加70%法力"},
    ['玫瑰仙叶'] = {Attr = "MpPer", Val = 60, Desc = "增加60%法力"},
    ['海蓝石'] = {Attr = "HpPer", Val = 70, Desc = "增加70%血量"},
    ['千年熊胆'] = {Attr = "HpPer", Val = 60, Desc = "增加60%血量"},
    ['仙鹿茸'] = {Attr = "HpPer", Val = 65, Desc = "增加65%血量"},
    ['修罗玉'] = {Attr = "MpPer", Val = 65, Desc = "增加65%法力"}
    
}

function GainMedicine.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function GainMedicine.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function GainMedicine.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
    if GainMedicine.List[item:GetKeyName()] then
        local item_Key = item:GetKeyName()
        local attr = GainMedicine.List[item_Key]
        if attr.Attr == "MpPer" then 
            local PlayerMp = player:GetAttr(ROLE_ATTR_MP)      --当前法力值
            sLuaApp:LuaDbg("当前法力值为："..PlayerMp)
            local PlayerMpMax = player:GetAttr(ROLE_ATTR_MP_LIMIT)   --最大法力值
            if PlayerMp == PlayerMpMax then
                sLuaApp:NotifyTipsMsg(player, "当前不需要使用该道具")
                return false
            end
			return true
        elseif attr.Attr == "HpPer" then
            local PlayerHp = player:GetAttr(ROLE_ATTR_HP)      --当前法力值
            local PlayerHpMax = player:GetAttr(ROLE_ATTR_HP_LIMIT)   --最大法力值
            if PlayerHp == PlayerHpMax then
                sLuaApp:NotifyTipsMsg(player, "当前不需要使用该道具")
                return false
            end
			return true
        end
    else
        return false
    end
    return false
end

-- 使用物品
function GainMedicine.on_use_item(player, item, count)
	--sLuaApp:LuaDbg("GainMedicine.on_use_item")
    local item_Key = item:GetKeyName()
    local attr = GainMedicine.List[item_Key]
    if attr.Attr == "MpPer" then                      --法力恢复
        sLuaApp:LuaDbg("正在使用蓝瓶")
        local PlayerMp = player:GetAttr(ROLE_ATTR_MP)      --当前法力值
        local PlayerMpMax = player:GetAttr(ROLE_ATTR_MP_LIMIT)   --最大法力值
        local proportion = GainMedicine.List[item_Key].Val/100
        local Mp = PlayerMpMax*proportion + PlayerMp 
        if Mp >= PlayerMpMax then
            player:AddMp(math.ceil(PlayerMpMax-PlayerMp),item:GetKeyName(),"道具增益","增益药")
        else
            player:AddMp(math.ceil(Mp-PlayerMp),item:GetKeyName(),"道具增益","增益药")
        end
    elseif attr.Attr == "HpPer" then                 --血量回复
        local PlayerHp = player:GetAttr(ROLE_ATTR_HP)      --当前血量
        local PlayerHpMax = player:GetAttr(ROLE_ATTR_HP_LIMIT)   --最大血量
        local proportion1 = GainMedicine.List[item_Key].Val/100
        local Hp = PlayerHpMax*proportion1 + PlayerHp
        if Hp >= PlayerHpMax then
            player:AddHp(math.ceil(PlayerHpMax-PlayerHp),item:GetKeyName(),"道具增益","增益药")
        else
            player:AddHp(math.ceil(Hp-PlayerHp),item:GetKeyName(),"道具增益","增益药")
        end 
    end
    
end


