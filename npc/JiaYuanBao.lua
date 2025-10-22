--捐献NPC
JiaYuanBao = {}

function JiaYuanBao.main(npc, player)
	player:AddNpcOption(npc, 0, "领取500万经验", "option1", "")
	player:AddNpcOption(npc, 0, "领取100万金币", "option2", "")
	player:AddNpcOption(npc, 0, "领取100万金元宝", "option3", "")
    player:AddNpcOption(npc,0,"扣除500万Exp","option4","")
	    player:AddNpcOption(npc,0,"提升等级","option5","")
	return "望天下英雄不记劳苦，踊跃筹集军备，朝廷必有重谢"
end
function JiaYuanBao.option1(npc,player)

  --player:AddExp(5000000,'system','使用经验丹',"去问问确认")

  
  local tb = player:GetAllStringKeys()
  
  sLuaApp:LuaErr("当前的类型是="..type(tb))
  
  for key,value in pairs(tb) do 
    sLuaApp:LuaErr("开始循环输出    ".."  key="..tostring(key).."value="..tostring(value).."\n")
  end
  
  
  
  
  
  
  --sLuaApp:NotifyTipsMsg(player,"收到客户端消息="..#tb)

	return "tb="..type(tb)
end

function JiaYuanBao.option2(npc,player)



  player:AddGold(1000000,"system","面对面交易","面对面交易扣除货币")
	return "领取成功100万金币"
end

function JiaYuanBao.option3(npc,player)
	
	
	
	player:AddIngot(1000000,"system","面对面交易","面对面交易扣除货币")
	
	return "领取成功100万金元宝"
end

function JiaYuanBao.option4(npc,player)
 
  player:SubExp(5000000,'system','使用经验丹',"去问问确认")
  return "扣除成功"
end

function JiaYuanBao.option5(npc,player)
 
  player:SetAttr(2,50,true)
  return "提升成功"
end


