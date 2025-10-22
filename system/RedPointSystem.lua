-- 小红点系统
RedPointSystem = {}

RedPointSystem.FuncConfig = {
	"DailySign.Login_Data",			--每日签到
	"FormEquip.Login_Data",			-- 装备
	"RechargeSystem.Login_Data",	-- 充值活动
	"FormGuard.get_guard_red_point_data", -- 侍从
	"SevenDay.RedPointRefresh_Main", --七日
	"FormPlayerSkill.get_role_skill_red_data", -- 技能
	"FormContact.Login_Data", -- 好友
	"DiscountSystem.on_login",
	"ProduceFoodSystem.get_all_data", -- 生产
	"FormSeat.IsAllSeatMaxLevel", --阵法
	"BinGoBigPrize.OnLogin",--福利界面五星连珠
}

function RedPointSystem.OnLogin(player)
	for k,v in ipairs(RedPointSystem.FuncConfig) do
		sLuaTimerSystem:AddTimerEx(player, 10+k, 1, v, "")
	end
end


-- 等级提升刷新小红点
function RedPointSystem.level_up_refresh_red(player, now_level)
	-- 技能小红点
	if FormPlayerSkill then
		FormPlayerSkill.get_role_skill_red_data(player)
	end
	-- 侍从
	if GuardRedPoint then
		GuardRedPoint.role_level_up(player)
	end
    -- 生产
	if ProduceFoodSystem then
		ProduceFoodSystem.when_level_up_update(player, now_level)
	end
end