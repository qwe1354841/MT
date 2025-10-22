--丹炉残渣
DanLuCanZhaNPC = {}

function DanLuCanZhaNPC.main(npc, player)
	local npc_keyname = npc:GetKeyName()
	if DanLuConfig.DropReward and DanLuConfig.DropReward[npc_keyname] then
		local npc_config = DanLuConfig.DropReward[npc_keyname]
		local consume_item = npc_config['ConsumeItem']--精金小锤子
		local item_data = ItemConfig.GetByKeyName(consume_item)
		for _,v in ipairs(npc_config['Open']) do
			local show_rand = v['Rand']/100
			local t1,t2 = math.modf(show_rand)
			if t2 == 0 then
				show_rand = t1
			end
			
			player:AddNpcOption(npc, 0, "消耗"..v['Consume'].."个"..item_data.Name..show_rand.."%几率打开", "option1", consume_item..","..v['Consume']..","..v['RealRand'])
		end
	else
		sLuaApp:LuaErr("DanLuConfig.DropReward缺少配置")
	end

	return "身体里有宝藏这种事情，是不会让人知道的！"
end

function DanLuCanZhaNPC.option1(npc, player, content)
	if DanLu then
		return DanLu.CanZha(npc, player, content)
	else
		sLuaApp:LuaErr("缺少DanLu")
	end
    return ""
end
