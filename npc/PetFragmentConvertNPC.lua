-- 神兽碎片兑换npc 英国公李绩
local PetFragmentConvertNPC = {}
_G.PetFragmentConvertNPC = PetFragmentConvertNPC

function PetFragmentConvertNPC.main(npc, player)
    player:AddNpcOption(npc, 0 , "神兽拼图兑换", "FragmentConvert", "")
    player:AddNpcOption(npc, 0 , "兑换简介", "Introduction", "")
    return ""
end

function PetFragmentConvertNPC.Introduction(npc,player,str)
    return "陛下博爱望神兽重回人间，特派老臣在此与少侠交换神兽拼图。神兽拼图的兑换比例为2:1，而神秘的百变神兽拼图兑换比例为1:1，愿大家早日拿到心仪的神兽"
end

function PetFragmentConvertNPC.FragmentConvert(npc,player,str)
    local open = [[
        GUI.OpenWnd("PetFragmentConvert")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", open)
    return ""
end