-- 神兽兑换表单

FormPetFraEx = {}

-- 兑换碎片是否绑定跟随兑换的物品,（当开启后，兑换的碎片是否全都绑定失效)
FormPetFraEx.is_bind_follow_item = true

-- 兑换的碎片是否全都绑定
FormPetFraEx.get_fragment_is_bind = false

FormPetFraEx.Pet_Fragment_player = {			-- Fragment:分段
{keyname = "神兽鸡碎片"},
{keyname = "神兽牛碎片"},
{keyname = "神兽狗碎片"},
{keyname = "神兽猪碎片"},
{keyname = "神兽虎碎片"},
{keyname = "神兽兔碎片"},
{keyname = "神兽马碎片"},
{keyname = "神兽羊碎片"}, 
{keyname = "随机神兽碎片", price = 2},  -- price:价格
}

FormPetFraEx.Pet_Fragment_system = {
{keyname = "神兽鸡碎片" , price = 2},
{keyname = "神兽牛碎片" , price = 2},
{keyname = "神兽狗碎片" , price = 2},
{keyname = "神兽猪碎片" , price = 2},
{keyname = "神兽虎碎片" , price = 2},
{keyname = "神兽兔碎片" , price = 2},
{keyname = "神兽马碎片" , price = 2},
{keyname = "神兽羊碎片" , price = 2},
}

function FormPetFraEx.GetData(player)

    if Lua_tools then

        local str = [[
		if PetFragmentConvert then 
			PetFragmentConvert.Pet_Fragment_player = ]] .. Lua_tools.serialize(FormPetFraEx.Pet_Fragment_player) .. [[
			PetFragmentConvert.Pet_Fragment_system = ]] .. Lua_tools.serialize(FormPetFraEx.Pet_Fragment_system) .. [[
			
			PetFragmentConvert.Refresh()
		end	]]-- fragment:分段 convert:转化 test("请求成功")   

        sLuaApp:ShowForm(player, "脚本表单", str)
        return ""
    end
end

function FormPetFraEx.conversion(player, param) -- param：参数
    local conver_tb = split(param, ",") -- 将param传入的字符串进行切割
    local player_index = tonumber(conver_tb[1]) -- 将切割的字符串转换为数值类型，为被兑换的物品id
    local system_index = tonumber(conver_tb[2]) -- 对换物品id
    local conver_num = tonumber(conver_tb[3]) -- 兑换的数量

    if not FormPetFraEx.Pet_Fragment_player[player_index] then -- 如果未接收到合规的被兑换的神兽拼图
        sLuaApp:NotifyTipsMsg(player, "请选择自身拥有的神兽拼图！")
        return ""
    end

    if not FormPetFraEx.Pet_Fragment_system[system_index] then -- 检查兑换的神兽拼图名称是否正确
        sLuaApp:NotifyTipsMsg(player, "请选择需要兑换的神兽拼图！")
        return ""
    end

    if not conver_num or conver_num == 0 or conver_num < 0 or math.floor(conver_num) ~= conver_num then -- 判断兑换的数量是否正确    不存在 为0  负数 小数
		sLuaApp:NotifyTipsMsg(player, "请重新选择兑换数量！")
        return ""
    end

    if FormPetFraEx.Pet_Fragment_player[player_index]["keyname"] == FormPetFraEx.Pet_Fragment_system[system_index]["keyname"] then -- 如果兑换与被兑换的拼图相同
        sLuaApp:NotifyTipsMsg(player, "相同的神兽拼图无法进行兑换！")
        return ""
    end

    if Lua_tools.GetBagFree(player) <= 0 then
        sLuaApp:NotifyTipsMsg(player,"背包已满，请清理后再试")
        return ''
    end

    local item_id = sItemSystem:GetItemIdByKeyname(FormPetFraEx.Pet_Fragment_player[player_index]["keyname"]) -- 通过物品名称找到其gid
    local bang_item_num = sItemSystem:GetItemAmount(player, item_id, 2) -- 通过物品gid，得到其角色身上有多少这个绑定物品
    local Item_num = sItemSystem:GetItemAmount(player, item_id, 1)
    Item_num = Item_num + bang_item_num -- 绑定和非绑定 一共有多少个

    local exchange_bind_item_num = nil
    local exchange_item_num = nil
    
    local system_item_id = sItemSystem:GetItemIdByKeyname(FormPetFraEx.Pet_Fragment_system[system_index]["keyname"])

    if FormPetFraEx.Pet_Fragment_player[player_index]["price"] then -- 如果选择兑换随机神兽碎片
        --if FormPetFraEx.Pet_Fragment_player[player_index]["price"] == FormPetFraEx.Pet_Fragment_system[system_index]['price'] then
            if Item_num * FormPetFraEx.Pet_Fragment_player[player_index]["price"] >= conver_num * FormPetFraEx.Pet_Fragment_system[system_index]['price'] then -- 玩家拥有的碎片大于兑换的碎片
                if conver_num * FormPetFraEx.Pet_Fragment_system[system_index]['price'] > bang_item_num * FormPetFraEx.Pet_Fragment_player[player_index]["price"] then -- 兑换碎片大于绑定碎片
                    if bang_item_num > 0 then -- 先用绑定的碎片兑换
                        if sItemSystem:ConsumeItemWithId(player, item_id, bang_item_num, 2, "system",
                            "事务操作：神兽碎片兑换系统", "随机神兽碎片-绑定碎片兑换") ~= 0 then -- 先消耗绑定碎片
                            return
                        end
                        --sLuaApp:LuaDbg("Use_bang_item_num..........."..bang_item_num)
                        exchange_bind_item_num = math.ceil(bang_item_num * FormPetFraEx.Pet_Fragment_player[player_index]["price"] / FormPetFraEx.Pet_Fragment_system[system_index]['price'])
                        local final_item_num = (conver_num * FormPetFraEx.Pet_Fragment_system[system_index]['price'] - bang_item_num * FormPetFraEx.Pet_Fragment_player[player_index]["price"]) / FormPetFraEx.Pet_Fragment_player[player_index]["price"]
                        if sItemSystem:ConsumeItemWithId(player, item_id, final_item_num, 1, "system",
                            "事务操作：神兽碎片兑换系统", "随机神兽碎片-碎片兑换") ~= 0 then -- 再消耗非绑定的碎片
                            return
                        end
                        --sLuaApp:LuaDbg("final_item_num......."..final_item_num)
                        exchange_item_num = (conver_num - exchange_bind_item_num)

                    else
                        local Use_item_num = conver_num * FormPetFraEx.Pet_Fragment_system[system_index]['price'] / FormPetFraEx.Pet_Fragment_player[player_index]["price"]
                        if sItemSystem:ConsumeItemWithId(player, item_id, Use_item_num, 1, "system",
                            "事务操作：神兽碎片兑换系统", "随机神兽碎片-碎片兑换") ~= 0 then -- 全部消耗非绑定的碎片
                            return
                        end
                        exchange_item_num = conver_num

                    end
                else -- 如果兑换碎片数量小于绑定碎片
                    local Use_bang_item_num = conver_num * FormPetFraEx.Pet_Fragment_system[system_index]['price'] / FormPetFraEx.Pet_Fragment_player[player_index]["price"]
                    --sLuaApp:LuaDbg("Use_bang_item_num2........."..Use_bang_item_num)
                    if sItemSystem:ConsumeItemWithId(player, item_id, Use_bang_item_num, 2, "system",
                        "事务操作：神兽碎片兑换系统", "随机神兽碎片-绑定碎片兑换") ~= 0 then -- 全部用绑定碎片兑换
                        return
                    end
                    exchange_bind_item_num = conver_num

                end

                if FormPetFraEx.is_bind_follow_item == false then
                    sItemSystem:AddItemEx(player, system_item_id, conver_num,
                            FormPetFraEx.get_fragment_is_bind, "system", "碎片兑换成功",
                            "随机神兽碎片兑换成其他碎片成功") -- 将兑换的碎片添加到角色背包
                elseif FormPetFraEx.is_bind_follow_item == true then

                    if exchange_bind_item_num and exchange_bind_item_num > 0 then
                        sItemSystem:AddItemEx(player,system_item_id,exchange_bind_item_num,
                        true,'system','神兽碎片兑换成功','随机神兽碎片兑换成其他绑定碎片成功')
                    end

                    if exchange_item_num and exchange_item_num > 0 then
                        sItemSystem:AddItemEx(player,system_item_id,exchange_item_num,
                        false,'system','神兽碎片兑换成功','随机神兽碎片兑换成其他非绑定碎片成功')
                    end

                end

                local str = [[
				if PetFragmentConvert then
					PetFragmentConvert.item_sum(]] .. player_index .. [[)
				end	]]
                sLuaApp:ShowForm(player, "脚本表单", str); -- 发送表单数据给客户端

                return ""
            else
                sLuaApp:NotifyTipsMsg(player, "您的神兽拼图不足，无法兑换！")
                return ""
            end
        --end

    else -- 非随机神兽碎片兑换
        if Item_num >= FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num then -- 检查玩家是否有足够的碎片，2：1兑换
            if FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num > bang_item_num then
                if bang_item_num > 0 then -- 先消耗绑定碎片，再消耗非绑定碎片

                    if sItemSystem:ConsumeItemWithId(player, item_id, bang_item_num, 2, "system",
                        "事务操作：神兽碎片兑换系统", "神兽碎片-绑定碎片兑换") ~= 0 then
                        return
                    end
                    exchange_bind_item_num = bang_item_num

                    if sItemSystem:ConsumeItemWithId(player, item_id, (FormPetFraEx.Pet_Fragment_system[system_index]['price'] *
                        conver_num - bang_item_num), 1, "system", "事务操作：神兽碎片兑换系统",
                        "神兽碎片-碎片兑换") ~= 0 then
                        return
                    end
                    exchange_item_num = (FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num - bang_item_num)

                else

                    if sItemSystem:ConsumeItemWithId(player, item_id,
                        (FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num), 1, "system",
                        "事务操作：神兽碎片兑换系统", "神兽碎片-碎片兑换") ~= 0 then
                        return
                    end
                    exchange_item_num = (FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num)

                end

            else

                if sItemSystem:ConsumeItemWithId(player, item_id,
                    (FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num), 2, "system",
                    "事务操作：神兽碎片兑换系统", "神兽碎片-绑定碎片兑换") ~= 0 then
                    return
                end
                exchange_bind_item_num = (FormPetFraEx.Pet_Fragment_system[system_index]['price'] * conver_num)

            end

            if FormPetFraEx.is_bind_follow_item == false then

                sItemSystem:AddItemEx(player, system_item_id, conver_num,
                        FormPetFraEx.get_fragment_is_bind, "system", "碎片兑换成功",
                        "神兽碎片兑换成其他碎片成功")

            elseif FormPetFraEx.is_bind_follow_item == true then

                if exchange_bind_item_num and exchange_bind_item_num % FormPetFraEx.Pet_Fragment_system[system_index]["price"] ~= 0
                        and exchange_item_num and exchange_item_num % FormPetFraEx.Pet_Fragment_system[system_index]["price"] ~= 0
                then
                    sItemSystem:AddItemEx(player,system_item_id,math.floor(exchange_bind_item_num/FormPetFraEx.Pet_Fragment_system[system_index]["price"]),
                            true,'system','神兽碎片兑换成功','神兽碎片兑换成其他碎片成功')

                    sItemSystem:AddItemEx(player,system_item_id,math.floor(exchange_item_num/FormPetFraEx.Pet_Fragment_system[system_index]["price"]),
                            false,'system','神兽碎片兑换成功','神兽碎片兑换成其他碎片成功')

                    sItemSystem:AddItemEx(player,system_item_id,
                            math.floor((exchange_bind_item_num % FormPetFraEx.Pet_Fragment_system[system_index]["price"] + exchange_item_num % FormPetFraEx.Pet_Fragment_system[system_index]["price"])/FormPetFraEx.Pet_Fragment_system[system_index]["price"]),
                            true,'system','神兽碎片兑换成功','神兽碎片兑换成其他碎片成功')

                else
                    if exchange_bind_item_num and exchange_bind_item_num > 0 then
                        sItemSystem:AddItemEx(player,system_item_id,exchange_bind_item_num/FormPetFraEx.Pet_Fragment_system[system_index]["price"],
                                true,'system','神兽碎片兑换成功','神兽碎片兑换成其他碎片成功')
                    end

                    if exchange_item_num and exchange_item_num > 0 then
                        sItemSystem:AddItemEx(player,system_item_id,exchange_item_num/FormPetFraEx.Pet_Fragment_system[system_index]["price"],
                                false,'system','神兽碎片兑换成功','神兽碎片兑换成其他碎片成功')
                    end

                end
            end


            local str = [[
			if PetFragmentConvert then
				PetFragmentConvert.item_sum(]] .. player_index .. [[)
			end	]]
            sLuaApp:ShowForm(player, "脚本表单", str);

            return ""
        else
            sLuaApp:NotifyTipsMsg(player, "您的神兽拼图不足，无法兑换！")
            return ""
        end
    end
    return ""
end

function FormPetFraEx.OpenWnd(player)
    local str = [[
			GlobalProcessing.OpenWnd('PetFragmentConvert')
		]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

-- npc 英国公李绩的模板id50009
function FormPetFraEx.Bag_Pet_Fragment(player)
    local str = [[
		if GlobalProcessing then 
			GlobalProcessing.PetFragment(]] .. "[[" .. serialize(FormPetFraEx.Pet_Fragment_player) .. "]]" .. [[,50009)
		end
		]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end
