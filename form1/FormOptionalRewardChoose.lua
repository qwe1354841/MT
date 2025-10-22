FormOptionalRewardChoose = {}
--自选礼包脚本

--选择道具
function FormOptionalRewardChoose.choose_item(player, index, num, counts)
	if OptionalGift then
		OptionalGift.ChooseItem(player, index, num, counts)
	end
	return ""
end
