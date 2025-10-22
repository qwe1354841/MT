--七日庆典相关表单
FormSevenDay = {}

--获取表单
function FormSevenDay.GetData(player)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.GetData(player)
		end
		return ""
	end
end

--登录奖励领取
function FormSevenDay.GetSignInAward(player,index)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.GetSignInAward(player,index)
		end
		return ""
	end
end

--任务奖励领取
function FormSevenDay.GetTaskAward(player,day,index)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.GetTaskAward(player,day,index)
		end
		return ""
	end
end


--积分奖励领取
function FormSevenDay.ScoreAwardData(player,score)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.GetScoreAward(player,score)
		end
		return ""
	end
end

--帮派任务寻路
function FormSevenDay.GuildTaskGoTo(player)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.GuildTaskGoTo(player)
		end
		return ""
	end
end

--师门任务寻路
function FormSevenDay.ShiMenTaskGoTo(player)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.ShiMenTaskGoTo(player)
		end
		return ""
	end
end

--红点刷新
function FormSevenDay.RedPointRefresh(player)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.RedPointRefresh(player)
		end
		return ""
	end
end

--师门任务寻路
function FormSevenDay.ShiMenQuest(player)
	if FunctionSwitch.AllFuncitonConfig['SevenDay'] == 'on' then
		if SevenDay then
			SevenDay.ShiMenQuest(player)
		end
		return ""
	end
end