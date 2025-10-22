--捐献NPC
FiLi = {}

function FiLi.main(npc, player)
	player:AddNpcOption(npc, 0, "领取1万经验", "option1", "")
  	player:AddNpcOption(npc, 0, "查询经验变量", "option2", "")
 	 player:AddNpcOption(npc, 0, "设置等级", "option3", "")

	return "望天下英雄不记劳苦，踊跃筹集军备，朝廷必有重谢"
end

function FiLi.option2(npc,player)
    
    player:AddIngot(1000000,"1","1","1")
    return "ww"
end
  

function FiLi.option1(npc,player)

    player:AddExp(200000000,'system','使用经验丹',"去问问确认")


	return "tb="
end

function FiLi.option3(npc,player)
    local keyName = "测试坐骑1"
	sLuaApp:Player_AddPet(player, keyName, 0, bind, 0)
  
    return "OKOKOOK"
end




