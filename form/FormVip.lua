--VIP表单
FormVip={}

--发送整个vip配置表
function FormVip.VipGetData(player, para)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VIP'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"VIP") then
        return ""
    end
	if VipLogic then
		VipLogic.VipGetData(player, para)
	end
	return ""
end


function FormVip.OpenVIPGift(player, mode, gift_vip_level) 	--	mode = 0 日常/周常礼包       mode = 1  升级礼包（等级）
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VIP'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"VIP") then
        return ""
    end
	if VipLogic then
		VipLogic.OpenVIPGift(player, mode, gift_vip_level)
	end
	return ""
end

function FormVip.VipGetDayIngotData(player) --VIP每日获得活动元宝
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VipIngotTrace'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"VIP") then
        return ""
    end
	if VipIngotTrace then
		VipIngotTrace.GetData(player)
	end
	return ""
end

function FormVip.GetIngotActivity(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VipIngotTrace'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"VIP") then
        return ""
    end
	if VipIngotTrace then
		VipIngotTrace.GetIngotActivity(player)
	end
	return ""
end

function FormVip.GetVipLevel(player, target_guid)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['VIP'] ~= "on" then
			return ""
		end
	end
	if not MainUISwitch.CheckOpenLevel(player,"VIP") then
        return ""
    end
	if VipLogic then
		VipLogic.GetVipLevel(player, target_guid)
	end
	return ""
end