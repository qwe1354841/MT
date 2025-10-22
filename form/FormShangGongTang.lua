FormShangGongTang = {}

function FormShangGongTang.GetSGTData(player)
	--获取赏功堂道具列表
	if ShangGongTang then
		ShangGongTang.GetSGTData(player)
	end
	return ""
end

function FormShangGongTang.GetSGTItemData(player, item_guid)
	--获取赏功堂道具数据
	if ShangGongTang then
		ShangGongTang.GetSGTItemData(player, item_guid)
	end
	return ""
end


function FormShangGongTang.SetDrawConsume(player, val)
	--设置消耗帮派战功数量
	if ShangGongTang then
		ShangGongTang.SetDrawConsume(player, val)
	end
	return ""
end


function FormShangGongTang.SetDrawTime(player, val)
	--设置抽奖次数
	if ShangGongTang then
		ShangGongTang.SetDrawTime(player, val)
	end
	return ""
end

function FormShangGongTang.JackPot(player)
	--赏功堂抽奖
	if ShangGongTang then
		ShangGongTang.JackPot(player)
	end
	return ""
end


function FormShangGongTang.PutInAwardPool(player, item_guid, item_num)
	--将道具放入赏功堂奖池
	if ShangGongTang then
		ShangGongTang.PutInAwardPool(player, item_guid, item_num)
	end
	return ""
end

function FormShangGongTang.GetOutAwardPool(player, item_guid)
	--从赏功堂中取出道具
	if ShangGongTang then
		ShangGongTang.GetOutAwardPool(player, item_guid)
	end
	return ""
end

function FormShangGongTang.GetSGTRecordMsg(player)
	--查询赏功记录的总条数、最大最小索引值以及版本号信息
	if ShangGongTang then
		ShangGongTang.GetSGTRecordMsg(player)
	end
	return ""
end

function FormShangGongTang.GetSGTRecord(player, startPos, endPos, version)
	--查询赏功记录
	if ShangGongTang then
		ShangGongTang.GetSGTRecord(player, startPos, endPos, version)
	end
	return ""
end


