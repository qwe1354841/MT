MenPaiRuQinNPC = {}

function MenPaiRuQinNPC.option1(npc, player, content)
    if MenPaiRuQin then
        if not MenPaiRuQin.StartFight(player, npc) then
            local msg_fight = "有个不知死活的小子正在挑战大爷，等我解决了他，再来收拾你！"
            return msg_fight
        end
    else
        sLuaApp:LuaDbg("缺少MenPaiRuQin")
    end
    return ""
end

function MenPaiRuQinNPC.main(npc, player)
    if MenPaiRuQin then
        --{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
        local id = npc:GetInt("MenPaiRuQinActID")
        local talk_msg_tb = MenPaiRuQin.CheckFight(player, id)
        if talk_msg_tb and next(talk_msg_tb) then
            if talk_msg_tb[1] == 1 then
                local msg_yes= "搞事搞事搞事！"
                player:AddNpcOption(npc, 4, "妖怪，看招！", "option1", "")
                return msg_yes
            elseif talk_msg_tb[2] == 1 then
                local msg_one_no = "走开走开！只有等级达到"..talk_msg_tb[3].."级才有资格挑战我！！！"
                return msg_one_no
            else
                local msg_no = "走开走开！只有至少"..talk_msg_tb[2].."人组队并且全员等级达到"..talk_msg_tb[3].."级的队伍才有资格挑战我！！！"
                return msg_no
            end
        else
            sLuaApp:LuaDbg("MenPaiRuQin.CheckFight返回错误")
            return ""
        end
    else
        sLuaApp:LuaDbg("缺少MenPaiRuQin")
    end
end