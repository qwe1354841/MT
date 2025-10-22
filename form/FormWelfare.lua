--福利表单
FormWelfare={}


function FormWelfare.GetDailyOnlineData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DailyOnline then
		DailyOnline.GetData(player)
	end
	return ""
end

function FormWelfare.ReceiveDailyOnlineReward(player, index)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DailyOnline then
		DailyOnline.GetReward(player,index)
	end
	return ""
end

function FormWelfare.GetLevelPackageData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if LevelPackage then
		LevelPackage.GetData(player)
	end
	return ""
end

function FormWelfare.ReceiveLevelPackageReward(player,index)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if LevelPackage then
		LevelPackage.GetReward(player,index)
	end
	return ""
end

function FormWelfare.GetDailySignData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DailySign then
		DailySign.GetData(player)
	end
	return ""
end

function FormWelfare.ReceiveDailySignReward(player,index)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DailySign then
		DailySign.GetReward(player,index)
	end
	return ""
end

function FormWelfare.GetDiscountData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DiscountSystem then
		DiscountSystem.GetData(player)
	end
	return ""
end

function FormWelfare.DiscountPurchase(player, index)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if DiscountSystem then
		DiscountSystem.Purchase(player, index)
	end
	return ""
end

function FormWelfare.GetFriendInvitationData(player)
if not MainUISwitch.CheckOpenLevel(player,"福利") then
	return ""
end
	if FriendInvitation then
		FriendInvitation.GetData(player)
	end
	return ""
end

function FormWelfare.ReceiveFriendInvitationReward(player,index)
if not MainUISwitch.CheckOpenLevel(player,"福利") then
	return ""
end
	if FriendInvitation then
		FriendInvitation.GetReward(player,index)
	end
	return ""
end

function FormWelfare.BeInvited_code(player,code)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FriendInvitation then
		FriendInvitation.BeInvited_code(player,code)
	end
	return ""
end

function FormWelfare.On_log(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FriendInvitation then
		FriendInvitation.On_log(player)
	end
	return ""
end

function FormWelfare.invitation_code(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FriendInvitation then
		FriendInvitation.invitation_code(player)
	end
	return ""
end

--五星连珠相关
function FormWelfare.BinGo_GetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.GetData(player)
	end
	return ""
end

--刷新指定索引的格子
function FormWelfare.BinGo_RefreshAwardList(player,index)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.RefreshAwardList(player,index)
	end
	return ""
end

--点亮格子
function FormWelfare.BinGo_Lighten(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.Lighten(player)
	end
	return ""
end

--领取奖励
function FormWelfare.BinGo_GetAward(player,hang,lie)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.GetAward(player,hang,lie)
	end
	return ""
end

--刷新点亮次数
function FormWelfare.BinGo_RefreshLightNum(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.RefreshLightNum(player)
	end
	return ""
end

--刷新任务数据
function FormWelfare.BinGo_RefreshQuestData(player)
	if not MainUISwitch.CheckOpenLevel(player,"福利") then
        return ""
    end
	if FunctionSwitch.AllFuncitonConfig['BinGo'] ~= "on" then
		return ""
	end
	if BinGoBigPrize then
		BinGoBigPrize.RefreshQuestData(player)
	end
	return ""
end

