--活动测试

Activity_Test = {}

-- 活动开始前回调
function Activity_Test.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Activity_Test.OnStart(id, is_normal)
   
end

-- 活动结束回调
function Activity_Test.OnStop(id)
    
end

-- 玩家点击参与活动回调
function Activity_Test.OnJoin(id, player)

end

-- 玩家客户端查询数据回调
function Activity_Test.OnQuery(id, player)
	local str = "1:2:1:10:61024,61025,21112:1:2,3,5"
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end