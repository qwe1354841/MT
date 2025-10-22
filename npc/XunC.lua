--超级巫医
XunC = {}

local Pet_Table = {}
local BJ = 0

function XunC.main(npc, player)
	player:AddNpcOption(npc, 0, "我的宠物伤痕累累,请帮我救治一下", "Answer1", "")
  	player:AddNpcOption(npc, 0, "我的宠物不听话了,请帮我驯养一下吧", "Answer2", "")
 	player:AddNpcOption(npc, 0, "请帮我同时救治、驯养宠物", "Answer3", "")


	return "温柔的对待宠物，宠物才会对你百分百忠心哦,我可以帮你医治驯养宠物,不过会收取一定的费用,有什么需要我帮助的？"
end



function XunC.Answer3(npc,player)
	BJ = 3 
	local pet_name = ""
	local Money = 0
    -- 获取玩家的宠物
    local healedCount = 0
    local totalCost = 0    
    for containerType = 1, 3 do  
      local petContainer = player:GetPetContainer(containerType)
      if petContainer then
        local petList = petContainer:GetPetList()
        for _, pet in ipairs(petList) do
				if pet then
				  table.insert(Pet_Table,pet)
				end
          end
        end
    end	
	
    pet_Name = XunC.Pet_Add_Hp_loyalty(npc, player)    
    return tostring(pet_Name)	
	
end






function XunC.Answer1(npc,player)
    BJ = 1
    local pet_Name  = ""
    local Money = 0
    -- 获取玩家的宠物
    local healedCount = 0
    local totalCost = 0    
    for containerType = 1, 3 do  
      local petContainer = player:GetPetContainer(containerType)
      if petContainer then
        local petList = petContainer:GetPetList()
          for _, pet in ipairs(petList) do
            if pet then
              table.insert(Pet_Table,pet)
            end
          end
        end
      end
    pet_Name = XunC.Pet_AddHp_Mp(npc, player)    
    return pet_Name
   
end
  

function XunC.Pet_Add_Hp_loyalty(npc,player)
	
	local return_Msg = ""
	local result_money = XunC.Need_Money(npc, player)
	


	if result_money == 0 then 
		return_Msg = "你的宠物很健康,不需要医治哦"
		return	return_Msg
	end		
	if player:GetBindGold() < result_money then 
		return_Msg = "医治宠物是很累的,你的钱不够哦"
		return	return_Msg
	end
	
	local bol = player:SubBindGold(result_money,"系统","医治宠物","医治宠物2扣钱")
	if bol == false then 
		return_Msg = "宠物太强大了,我训练不了,本次并未扣除金钱"
		return	return_Msg		
	end
	
	XunC.heal_hp_mp(BJ)
	return_Msg = "经过一番医治,你的宠物已经生龙活虎,本次消耗"..tostring(result_money).."银币！"

	
	return return_Msg	
		
end








function XunC.Answer2(npc,player)
    BJ = 2
    local pet_Name  = ""
    local Money = 0
    -- 获取玩家的宠物
    local healedCount = 0
    local totalCost = 0    
    for containerType = 1, 3 do  
      local petContainer = player:GetPetContainer(containerType)
      if petContainer then
        local petList = petContainer:GetPetList()
          for _, pet in ipairs(petList) do
            if pet then
              table.insert(Pet_Table,pet)
            end
          end
        end
      end
	
    pet_Name = XunC.Pet_Add_loyalty(npc, player)    
    return pet_Name	
	
end


function XunC.Pet_Add_loyalty(npc, player)

	local return_Msg = ""
	local result_money = XunC.Need_Money(npc, player)

	if result_money == 0 then 
		return_Msg = "你的宠物很健康,不需要医治哦"
		return	return_Msg
	end	

	if player:GetBindGold() < result_money then 
		return_Msg = "医治宠物是很累的,你的钱不够哦"
		return	return_Msg
	end
	
	local bol = player:SubBindGold(result_money,"系统","医治宠物","医治宠物2扣钱")
	if bol == false then 
		return_Msg = "宠物太强大了,我训练不了,本次并未扣除金钱"
		return	return_Msg		
	end
	
	
	XunC.heal_hp_mp(BJ)
	return_Msg = "经过一番医治,你的宠物已经生龙活虎,本次消耗"..tostring(result_money).."银币！"
	
	
	return return_Msg

end




  
  
function XunC.Pet_AddHp_Mp(npc, player)
	local return_Msg = ""
	local result_money = XunC.Need_Money(npc, player)

	if result_money == 0 then 
		return_Msg = "你的宠物很健康,不需要医治哦"
		return	return_Msg
	end	

	if player:GetBindGold() < result_money then 
		return_Msg = "医治宠物是很累的,你的钱不够哦"
		return	return_Msg
	end
	
	local bol = player:SubBindGold(result_money,"系统","医治宠物","医治宠物1扣钱")
	if bol == false then 
		return_Msg = "宠物太强大了,我训练不了,本次并未扣除金钱"
		return	return_Msg		
	end
	
	XunC.heal_hp_mp(BJ)
	return_Msg = "经过一番医治,你的宠物已经生龙活虎,本次消耗"..tostring(result_money).."银币！"
	
	
	return return_Msg

end

  

  
  
--pet:GetGUID

function XunC.Need_Money(npc, player)
    local money_coefficient = 10
	local Loyalty_money_coefficient = 50
    local result_money = 0
    if BJ == 1 then -- 第一个选项：医治宠物
        for i = 1, #Pet_Table do 
            local Hp = Pet_Table[i]:GetHp() or 0  -- 当前气血
            local Max_Hp = Pet_Table[i]:GetAttr(36) or 1  -- 气血上限
            local Mp = Pet_Table[i]:GetMp() or 0  -- 当前法力
            local Max_Mp = Pet_Table[i]:GetAttr(38) or 1  -- 法力上限
            -- 计算缺失的血量和法力百分比
            local hp_missing = math.max(0, Max_Hp - Hp)
            local mp_missing = math.max(0, Max_Mp - Mp)
            
            -- 计算费用：缺失量 * 系数
            local hp_cost = hp_missing * money_coefficient / 100
            local mp_cost = mp_missing * money_coefficient / 100
            
            result_money = result_money + hp_cost + mp_cost
        end
    elseif BJ == 2 then -- 第二个选项：恢复忠诚
        for i = 1, #Pet_Table do 
            local Loyalty = Pet_Table[i]:GetPetLoyalty() or 0  -- 当前忠诚度
            
			local Loyalty_missing_Money = (150 - Loyalty) * Loyalty_money_coefficient

            result_money = result_money + Loyalty_missing_Money
        end	
		
		
	elseif BJ == 3 then 
	
        for i = 1, #Pet_Table do 
            local Hp = Pet_Table[i]:GetHp() or 0  -- 当前气血
            local Max_Hp = Pet_Table[i]:GetAttr(36) or 1  -- 气血上限
            local Mp = Pet_Table[i]:GetMp() or 0  -- 当前法力
            local Max_Mp = Pet_Table[i]:GetAttr(38) or 1  -- 法力上限
            -- 计算缺失的血量和法力百分比
            local hp_missing = math.max(0, Max_Hp - Hp)
            local mp_missing = math.max(0, Max_Mp - Mp)
            
            -- 计算费用：缺失量 * 系数
            local hp_cost = hp_missing * money_coefficient / 100
            local mp_cost = mp_missing * money_coefficient / 100
            
            result_money = result_money + hp_cost + mp_cost
			
            local Loyalty = Pet_Table[i]:GetPetLoyalty() or 0  -- 当前忠诚度
            
			local Loyalty_missing_Money = (150 - Loyalty) * Loyalty_money_coefficient			
			
			result_money = result_money + Loyalty_missing_Money
			
        end	
		
	
		
		
		
	end
	

    result_money = math.floor(result_money)
    return result_money
end

function XunC.heal_hp_mp(answer)



	for i = 1, #Pet_Table do 
		
		if answer == 1 then 
		
			local Max_Hp = Pet_Table[i]:GetAttr(36) or 1  -- 气血上限
			local Max_Mp = Pet_Table[i]:GetAttr(38) or 1  -- 法力上限
			
			local Min_Hp = Pet_Table[i]:GetAttr(35) or 1  -- 气血上限
			local Min_Mp = Pet_Table[i]:GetAttr(37) or 1  -- 气血上限
			
			
			local return_Hp = Max_Hp - Min_Hp
			local return_Mp = Max_Mp - Min_Mp
			
			
			Pet_Table[i]:AddHp(return_Hp)
			Pet_Table[i]:AddMp(return_Mp)
			
		elseif answer == 2 then 
			local Loyalty_min = Pet_Table[i]:GetPetLoyalty() or 0  -- 当前忠诚度
			
			local Loyalty_result = 150 - Loyalty_min
			
			
			Pet_Table[i]:AddPetLoyalty(Loyalty_result)
			
		elseif answer == 3 then 
			local Max_Hp = Pet_Table[i]:GetAttr(36) or 1  -- 气血上限
			local Max_Mp = Pet_Table[i]:GetAttr(38) or 1  -- 法力上限
			
			local Min_Hp = Pet_Table[i]:GetAttr(35) or 1  -- 气血上限
			local Min_Mp = Pet_Table[i]:GetAttr(37) or 1  -- 气血上限
			
			
			local return_Hp = Max_Hp - Min_Hp
			local return_Mp = Max_Mp - Min_Mp
			
			
			Pet_Table[i]:AddHp(return_Hp)
			Pet_Table[i]:AddMp(return_Mp)
			
			
			
			local Loyalty_min = Pet_Table[i]:GetPetLoyalty() or 0  -- 当前忠诚度
			
			local Loyalty_result = 150 - Loyalty_min
		
			Pet_Table[i]:AddPetLoyalty(Loyalty_result)

		end			
		
		
		
	end

	
end



