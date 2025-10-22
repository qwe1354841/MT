--fei生脚本 by shodow_yong
FlyUpNPC = {}

function FlyUpNPC.main(npc, player)
	player:AddNpcOption(npc, 0 , "我要飞升！", "Option1", "");
	player:AddNpcOption(npc, 0 , "飞升效果查看", "Option2", "");
	return ""
end

function FlyUpNPC.Option1(npc, player, str)
	if FlyUp then
		FlyUp.main(player)
	end
    return ""
end

function FlyUpNPC.Option2(npc, player, str)
    return FlyUp.Desc
end





