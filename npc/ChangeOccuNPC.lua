--门派和角色转换 武器转换 NPC
ChangeOccuNPC = {}
function ChangeOccuNPC.option1(npc, player, content)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if level < ChangeOccu.MinLevel then
		return "你的修为不够，且去先行修炼吧！（"..ChangeOccu.MinLevel.."级才能进行门派和角色转换）"
	end
	if ChangeOccu then
		ChangeOccu.GetData(player)
	end
    return ""
end
function ChangeOccuNPC.option2(npc, player, content)
	if EquipChange then
		EquipChange.GetData(player, "Weapon", true, false)
    end
	return ""
end

function ChangeOccuNPC.main(npc, player)
    player:AddNpcOption(npc, 0, "门派和角色转换", "option1", "")
    player:AddNpcOption(npc, 0, "武器转换", "option2", "")
    return ""
end