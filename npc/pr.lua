--住店
pr = {}


function pr.main(npc, player)
	player:AddNpcOption(npc, 0, "休息一晚(恢复所有状态)", "Answer1", "")
  	player:AddNpcOption(npc, 0, "离开", "Answer2", "")


	return "客官远道而来辛苦啦！瞧您这一身风尘仆仆的。只需休息一晚，便可精力充沛哦"
end





function pr.Answer1(npc,player)

	local Min_Hp = player:GetAttr(35)
	local Max_Hp = player:GetAttr(36)
	local Min_Mp = player:GetAttr(37)
	local Max_Mp = player:GetAttr(38)	
	local return_Hp = Max_Hp - Min_Hp 
	local return_Mp = Max_Mp - Min_Mp	
	if Min_Hp == Max_Hp and Min_Mp == Max_Mp then 
		return "客官精力充沛,不需要住店休息哦"
	end
	
	if player:GetBindGold() < 5000 then 
		
		return	"住店需要5000两银币,客官好像钱不太够哦"
	end

	local bol = player:SubBindGold(result_money,"系统","医治宠物","医治宠物1扣钱")
	if bol == false then 
		return_Msg = "客房已经满了,客官下次再来吧,本次并未收取你任何费用"
		return	return_Msg		
	end	
	
	player:AddHp(return_Hp,"系统","住店","住店休息")
	player:AddMp(return_Mp,"系统","住店","住店休息")


	return "客官休息一晚后,精力充沛,状态恢复到极致,本次住店消费5000银币。"
	
end

