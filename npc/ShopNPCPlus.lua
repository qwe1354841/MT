ShopNPCPlus = {}

ShopNPCPlus.Function_Config = {
	['长安城-宠物商店'] = {"仙兽商店"},--,"宠物技能遗忘"
	["宠物秘笈商店"] = {"终极技能书分解","终极技能书残卷合成"}


}

function ShopNPCPlus.CustomFunc(npc, player, param)
	local item_KeyName = "终极技能书残卷"
	local isband = 0
	if param == "仙兽商店" then
		sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('ShopStoreUI',1)")
		return ""
	elseif param == "宠物技能遗忘" then
		local skills = PetBase.GetLinePetSkillName(player, 1)
		if #skills > 0 then
			for k,v in ipairs(skills) do
				if v ~= "" then
					player:AddNpcOption(npc, 0, v, "Custom", "宠物技能遗忘_"..k);
				end
			end
			return "您想让您的宠物【"..sPetSystem:GetLineupPet(player):GetName().."】忘记哪个技能呢？"
		else
			return "你的出战宠物没学会任何技能，啥也忘不了。"
		end
	elseif string.find(param, "宠物技能遗忘") then
		local index = sLuaApp:StrSplit(param, "_")[2]
		if index then
			PetBase.ForgetLinePetSkill(player, index)
			return ""
		end
	end
	if param == "终极技能书分解" then
		local str = [[
			GUI.OpenWnd("DecomposeUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	elseif param == "终极技能书残卷合成" then 
		player:AddNpcOption(npc, 0, "确认合成", "Custom", "确定")
		return "只需要20000银币，我就可以帮你把50个终极技能书残卷合成为随机的一本终极技能书哦~（优先使用绑定终极技能书残卷）"
	elseif param == "确定" then
		local itemData = ItemConfig.GetByKeyName(item_KeyName)
		local notbindNum = sItemSystem:GetItemAmount(player, itemData.Id,1)
		local bindNum = sItemSystem:GetItemAmount(player, itemData.Id,2)
		local ItemContainer = player:GetItemContainer(1)
		local conNum = ItemContainer:GetFreeSiteCount()
		if conNum > 0 then
			if bindNum >= 50 then
				isband = 2  --绑定
				FormItemDisinOrCompo.Composite(player,item_KeyName,isband)
			elseif bindNum < 50 and notbindNum >= 50 then
				isband = 1 --非绑定
				FormItemDisinOrCompo.Composite(player,item_KeyName,isband)
			elseif notbindNum < 50 and bindNum < 50 and notbindNum + bindNum >= 50 then 
				player:AddNpcOption(npc, 0, "继续合成", "Custom", "继续合成")
				return "您的绑定终极技能书残卷和非绑定终极技能书残卷分别不足50个哦，是否用非绑定终极技能书残卷补足继续合成？"
			elseif notbindNum < 50 and bindNum < 50 and notbindNum + bindNum < 50 then
				sLuaApp:NotifyTipsMsg(player, "您没有足够的"..item_KeyName)
			end
		else
			return "您需要有空余的包裹才能进行合成"
		end
	elseif param == "继续合成" then
		isband = 4 --绑定和非绑定
		FormItemDisinOrCompo.Composite(player,item_KeyName,isband)
	end
    return ""
end

function ShopNPCPlus.main(npc, player)
	
	player:AddNpcOption(npc, 0, "领取每日福利", "option1", "1");
	player:AddNpcOption(npc, 0, "领取每日经验丹", "option2", "1");
    --player:AddNpcOption(npc, 1, "传送到展示地图1", "option1", "1");
    --player:AddNpcOption(npc, 2, "传送到展示地图2", "option2", "2");
    --player:AddNpcOption(npc, 3, "传送到展示地图3", "option3", "3");
    --player:AddNpcOption(npc, 4, "传送到展示地图4", "option4", "4");
    return "我是战斗测试员，多多关照";
end