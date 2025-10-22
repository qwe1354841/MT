--功能开启奖励
SwitchOnAward = {}
--功能名称, 介绍, 开启奖励
--Id 领取奖励标识,不可重复
--Title 功能名称
--Desc 介绍
--ItemList 奖励的道具列表
--15， 19， 23
--LevelParam[1] 转生等级
--LevelParam[2] 人物等级 
--PetList：1宠物keyname 2绑定 3等级   等级不传默认为0

SwitchOnAward.Config={
	{Id=1, Title="技能", Icon="1800202090", Desc="达到12级开启门派心法和技能成长的功能!", LevelParam={0,12}, ItemList={"血池1", 1, "魔池1", 1}},
	{Id=2, Title="商会", Icon="1800202440", Desc="达到30级开启商会购买和出售功能!", LevelParam={0,30}, ItemList={"小银币袋", 1}},
	{Id=3, Title="挂机", Icon="1800202410", Desc="达到25级开启挂机功能!", LevelParam={0,25}, ItemList={"双倍经验点", 1}},
	{Id=4, Title="组队", Icon="1800202070", Desc="开启组队后，就可以和好友共同冒险了！", LevelParam={0,25}, ItemList={"血池1", 1, "魔池1", 1}},
	{Id=5, Title="阵法", Icon="1800202070", Desc="达到25级开启阵法功能!", LevelParam={0,25}, ItemList={"阵法书残卷", 5}},
	{Id=6, Title="侍从", Icon="1800202050", Desc="达到13级开启侍从功能!", LevelParam={0,13}, ItemList={"N礼包", 2}},
	{Id=7, Title="活动", Icon="1800202040", Desc="达到25级开启活动!", LevelParam={0,25}, ItemList={"双倍经验点", 1}},
	{Id=8, Title="帮派", Icon="1800202120", Desc="达到28级开启帮派功能!", LevelParam={0,28}, ItemList={"祈福卷轴1", 1}},
	{Id=9, Title="辅助", Icon="1800202490", Desc="达到34级开启辅助功能!", LevelParam={0,34}, ItemList={"活动辅助丹2", 1}},
	{Id=10, Title="大雁塔", Icon="1800202040", Desc="达到35级开启秘境:大雁塔！", LevelParam={0,35}, ItemList={"100奇遇值", 1}},
	{Id=11, Title="天赋", Icon="1800202090", Desc="达到30级开启天赋功能!", LevelParam={0,30}, ItemList={"小银币袋", 1}},
	{Id=12, Title="宠物洗炼", Icon="1800202070", Desc="达到46级开启宠物洗炼！", LevelParam={0,46}, ItemList={"普通洗练符", 2}},
	{Id=13, Title="宠物合成", Icon="1800202420", Desc="达到48级开启宠物合成！", LevelParam={0,48}, ItemList={"合成幸运符", 1}},
	{Id=14, Title="装备打造", Icon="1800202100", Desc="达到41级开启装备打造！", LevelParam={0,41}, ItemList={"40级护甲打造礼包", 1}},
	{Id=17, Title="装备强化", Icon="1800202100", Desc="达到32级开启装备强化！", LevelParam={0,32}, ItemList={"装备强化石", 8}},
	{Id=15, Title="宝石", Icon="1800202100", Desc="达到32级开启宝石相关功能！", LevelParam={0,32}, ItemList={"1级宝石包", 3}},
	{Id=16, Title="装备炼化", Icon="1800202100", Desc="达到40级开启装备炼化和提取！", LevelParam={0,40}, ItemList={"特技卷轴礼盒1", 1, "摘特效特技1", 1}},
	{Id=18, Title="烹饪", Icon="1800202110", Desc="达到41级开启烹饪功能！", LevelParam={0,41}, ItemList={"活力药1", 1, "烹饪材料1", 2, "烹饪佐料2", 1}},
	{Id=19, Title="炼药", Icon="1800202110", Desc="达到41级开启炼药功能！", LevelParam={0,41}, ItemList={"活力药2", 1, "制药材料1", 1, "制药材料2", 2}},
	{Id=20, Title="天梯挑战", Icon="1800202030", Desc="达到35级开启活动:天梯挑战！", LevelParam={0,35}, ItemList={"挑战卷轴", 5}},
	{Id=21, Title="魔神降临", Icon="1800202170", Desc="达到30级开启活动:魔神降临！", LevelParam={0,30}, ItemList={"祈福卷轴2", 1}},
	{Id=22, Title="天下会武", Icon="1800202050", Desc="达到42级开启活动:天下会武！", LevelParam={0,42}, ItemList={"战功牌", 5}},
	
	{Id=24, Title="排行榜", Icon="1800202030", Desc="达到40级开启排行榜功能！", LevelParam={0,40}, ItemList={"祈福卷轴2", 1}},
	{Id=25, Title="修炼技能", Icon="1800202090", Desc="达到45级开启修炼技能！", LevelParam={0,45}, ItemList={"修炼丹", 1}},
	{Id=26, Title="沙城遗址", Icon="1800202040", Desc="达到40级开启秘境:沙城遗址！", LevelParam={0,40}, ItemList={"祈福卷轴2", 2}},
	{Id=27, Title="帮派竞技", Icon="1800202040", Desc="达到40级开启活动:帮派竞技！", LevelParam={0,40}, ItemList={"祈福卷轴2", 1}},
	{Id=28, Title="傲来秘宝", Icon="1800202170", Desc="达到50级开启副本:傲来秘宝！", LevelParam={0,50}, ItemList={"祈福卷轴2", 2}},
	{Id=29, Title="水帘洞", Icon="1800202040", Desc="达到60级开启秘境:水帘洞！", LevelParam={0,60}, ItemList={"祈福卷轴2", 3}},
	{Id=30, Title="梦回千古", Icon="1800202170", Desc="达到60级开启副本:梦回千古！", LevelParam={0,60}, ItemList={"祈福卷轴2", 3}},
	{Id=31, Title="洞窟伏魔", Icon="1800202170", Desc="达到70级开启副本:洞窟伏魔！", LevelParam={0,70}, ItemList={"祈福卷轴2", 4}},
	{Id=32, Title="人鬼绝恋", Icon="1800202040", Desc="达到80级开启秘境:人鬼绝恋！", LevelParam={0,80}, ItemList={"祈福卷轴3", 1}},
	{Id=33, Title="巅峰试炼", Icon="1800202040", Desc="达到80级开启秘境:巅峰试炼！", LevelParam={0,80}, ItemList={"祈福卷轴3", 1}},
	{Id=34, Title="羽翼", Icon="1800202050", Desc="达到58级开启羽翼系统！", LevelParam={0,58}, ItemList={"翅膀升级1", 1, "翅膀升级2", 1}},
	{Id=35, Title="组队平台", Icon="1800202070", Desc="达到25级开启组队平台！", LevelParam={0,25}, ItemList={"小银币袋", 1, "血池2", 1}},
	{Id=36, Title="宠物养成", Icon="1800202070", Desc="达到30级开启宠物养成！", LevelParam={0,30}, ItemList={"宠物经验丹", 1, "还原丹", 1}},
	{Id=37, Title="捐献", Icon="1800202070", Desc="达到55级开启捐献！", LevelParam={0,55}, ItemList={"小银币袋", 1}},
	{Id=38, Title="大弟子", Icon="1800202070", Desc="达到50级开启大弟子挑战！", LevelParam={0,50}, ItemList={"阵法书残卷", 5}},
	{Id=39, Title="结婚", Icon="1800202110", Desc="达到30级开启结婚！", LevelParam={0,30}, ItemList={"小银币袋", 1, "血池3", 1}},
	{Id=40, Title="拜师", Icon="1800202010", Desc="达到25级开启拜师！", LevelParam={0,25}, ItemList={"小银币袋", 1, "血池1", 1}},
	{Id=41, Title="收徒", Icon="1800202010", Desc="达到50级开启收徒！", LevelParam={0,50}, ItemList={"阵法书残卷", 5, "血池1", 1}},
	{Id=42, Title="PK", Icon="1800202040", Desc="达到20级可以前往长安城开启PK开关！", LevelParam={0,20}, ItemList={"小银币袋", 1, "血池3", 1}},
	{Id=43, Title="人物加点", Icon="1800202090", Desc="人物达到51级可以自由加点！", LevelParam={0,51}, ItemList={"增加耐力", 1}},
	{Id=44, Title="宠物加点", Icon="1800202090", Desc="宠物达到51级可以自由加点！", LevelParam={0,51}, ItemList={"重洗髓丹", 1}},
	{Id=45, Title="天下第一", Icon="1800202050", Desc="达到42级开启活动:天下第一！", LevelParam={0,42}, ItemList={"战功牌", 5}},
	{Id=46, Title="交易行", Icon="1801202110", Desc="达到50级开启交易行！", LevelParam={0,50}, ItemList={"小银币袋", 1}},
	{Id=47, Title="官职", Icon="1800202460", Desc="达到42级开启官职！", LevelParam={0,42}, ItemList={"小银币袋", 1}},
	{Id=48, Title="侍宠出战", Icon="1800202420", Desc="达到35级开启侍宠出战！", LevelParam={0,35}, ItemList={"小银币袋", 1}, PetList={"指引-小虎妖宝宝", 1}},
	{Id=49, Title="天河牧场", Icon="1800202040", Desc="达到35级开启天河牧场！", LevelParam={0,35}, ItemList={"宠物经验丹", 5}},
	{Id=50, Title="无尽的试炼", Icon="1800202170", Desc="达到30级开启无尽的试炼！", LevelParam={0,30}, ItemList={"血药-5", 2, "蓝药-5", 2}},
	{Id=51, Title="祈福", Icon="1800202520", Desc="达到13级开启祈福！", LevelParam={0,13}, ItemList={"祈福卷轴1", 10}},
	{Id=52, Title="宠物突破", Icon="1800202070", Desc="达到46级开启宠物突破！", LevelParam={0,46}, ItemList={"宝宝吞噬宠物1", 1, "宠物经验丹", 5}},
	{Id=53, Title="门派转换", Icon="1800202400", Desc="达到70级开启门派转换！", LevelParam={0,70}, ItemList={"菩提子", 1}},
	{Id=54, Title="成就", Icon="1800202170", Desc="达到25级开启成就！", LevelParam={0,25}, ItemList={"装备强化石", 2}},
}

local award_list = {}
local last_list = {}

function SwitchOnAward.player_level_up(player)
	--sLuaApp:LuaDbg("================领取奖励 玩家升级了================")
	SwitchOnAward.GetData(player)
end

--CanTake 能否领取 1为能 2为否 3等级不够不能领
--IsTake  是否领取 1为是 2为否

--设置传递给客户端的表
function SwitchOnAward.taketable(player)
	--sLuaApp:LuaErr("taketable获取传递的表")
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local rein = player:GetAttr(ROLE_ATTR_REINCARNATION)
	--sLuaApp:LuaErr("玩家等级："..level.."  玩家转生等级"..rein)
    award_list = {}
	for k, v in pairs(Data.award_final) do		--领过的从表中剔除
		if player:GetInt("IsTake_"..v["Title"]) == 2 then
			award_list[v["Title"]] = v
			award_list[v["Title"]]["CanTake"] = 2
		else
			if rein > v["LevelParam"][1] then
				award_list[v["Title"]] = v 
				award_list[v["Title"]]["CanTake"] = 1
			elseif rein == v["LevelParam"][1] then
				if level >= v["LevelParam"][2] then
					award_list[v["Title"]] = v
					award_list[v["Title"]]["CanTake"] = 1
					if Data.award_final[k+1] then
						if rein < Data.award_final[k+1]["LevelParam"][1] then
							award_list[Data.award_final[k+1]["Title"]] = Data.award_final[k+1]
							award_list[Data.award_final[k+1]["Title"]]["CanTake"] = 3
							break
						end
					end
				elseif level < v["LevelParam"][2] then 
					award_list[v["Title"]] = v
					award_list[v["Title"]]["CanTake"] = 3
					if Data.award_final[k+1] then
						if Data.award_final[k+1]["LevelParam"][2] == v["LevelParam"][2] then
							award_list[Data.award_final[k+1]["Title"]] = Data.award_final[k+1]
							award_list[Data.award_final[k+1]["Title"]]["CanTake"] = 3
						else
							break
						end
					end
				end
       		elseif rein < v["LevelParam"][1] then
				award_list[v["Title"]] = v
				award_list[v["Title"]]["CanTake"] = 3
				break
			end
		end
	end
	--sLuaApp:LuaDbg(Lua_tools.serialize(award_list))
	--sLuaApp:LuaDbg(Lua_tools.serialize(Data.award_final))
end

--登录时触发
function SwitchOnAward.OnLogin(player)
	SwitchOnAward.taketable(player)
	player:SetInt("LastAwardTable",string.len(Lua_tools.serialize(award_list)))
	if Lua_tools and award_list then
		local str = [[
			if GlobalProcessing then
				if not GlobalProcessing.SwitchOnAwardData then
					GlobalProcessing.SwitchOnAwardData = {}
				end
				GlobalProcessing.SwitchOnAwardData = ]]..Lua_tools.serialize(award_list)..[[
			end
			if MainDynamicUI then
				MainDynamicUI.RefreshLeftDynamicUIVisible()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--sLuaApp:LuaErr(str)
	else
		sLuaApp:LuaErr("缺少award_list")
	end
end

--获取领取的数据
function SwitchOnAward.GetData(player)
	--sLuaApp:LuaDbg("进入GetData")
	SwitchOnAward.taketable(player)
  	player:SetInt("LastAwardTable",string.len(Lua_tools.serialize(award_list)))
	--player:SetString("lasttable", Lua_tools.serialize(award_list))
	if Lua_tools and award_list then
		--sLuaApp:LuaDbg("领取奖励发送道具表单")
		local str = [[
			if GlobalProcessing then
				if not GlobalProcessing.SwitchOnAwardData then
					GlobalProcessing.SwitchOnAwardData = {}
				end
				GlobalProcessing.SwitchOnAwardData = ]]..Lua_tools.serialize(award_list)..[[
			end
			if FunctionPreviewUI then
				FunctionPreviewUI.RefreshUI()
			end
			if MainDynamicUI then
				MainDynamicUI.RefreshForeShowTable()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		--sLuaApp:LuaErr("=================SwitchOnAward.GetData(player)")
		--sLuaApp:LuaErr(str)
	else
		sLuaApp:LuaErr("缺少award_list")
	end
end

--领取奖励
function SwitchOnAward.HaveTake(player, Title)
	SwitchOnAward.taketable(player)
	sLuaApp:LuaDbg("HaveTake   Title值:"..Title)
	sLuaApp:LuaDbg("award_list[Title]['Id'] = "..award_list[Title]["Id"])
	if Title == nil then 
		return 
	end
	if Lua_tools then
		if award_list[Title]["Title"] == Title then
		--sLuaApp:LuaErr(award_list[Title]["CanTake"])
			if award_list[Title]["CanTake"] ~= 2 then
				--sLuaApp:LuaErr("判断能否领取")
				if player:GetInt("IsTake_"..Title) ~= 2 then
					--sLuaApp:LuaErr("判断是否已领取")
					if not SwitchOnAward.BagFree(player, award_list[Title]["ItemList"]) then
						return
					end
					if award_list[Title]["PetList"] then
						if not SwitchOnAward.PetBagFree(player, award_list[Title]["PetList"]) then
							return
						end
					end
				else
					sLuaApp:NotifyTipsMsg(player, "该阶段奖励您已经领取过了")
					return
				end
			else
				sLuaApp:NotifyTipsMsg(player, "您的等级不足以领取该阶段奖励")
				return
			end
		--break
		else
			sLuaApp:LuaErr("award_list[Title]与解锁功能不匹配")
			return
		end
		award_list[Title]["CanTake"] = 2
		local str = [[
			if GlobalProcessing then
				if not GlobalProcessing.SwitchOnAwardData then
					GlobalProcessing.SwitchOnAwardData = {}
				end
				GlobalProcessing.SwitchOnAwardData = ]]..Lua_tools.serialize(award_list)..[[
			end
			if FunctionPreviewUI then
				FunctionPreviewUI.RefreshUI()
			end
			if MainDynamicUI then
				MainDynamicUI.RefreshForeShowTable()
			end
		]]
		player:SetInt("IsTake_"..Title, 2)
		sLuaApp:ShowForm(player, "脚本表单", str)
		sLuaApp:LuaDbg("HaveTake成功运行")
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return
	end
end

function SwitchOnAward.BagFree(player, ItemList)
	--sLuaApp:LuaErr("判断包裹是否足够")
	if Lua_tools then
	--sLuaApp:LuaErr(ItemList[1])
		for k, v in pairs(ItemList) do
		--sLuaApp:LuaErr("进入遍历"..type(v))
		--sLuaApp:LuaDbg("ItemList________v = "..v)
			if type(v) == "string" then
				local itemData = ItemConfig.GetByKeyName(v)
				if itemData then
					sLuaApp:LuaDbg("有itemData+++++++++++++++++++")
				else
					sLuaApp:LuaDbg("没itemData-------------------")
				end
				sLuaApp:LuaDbg("itemData.Type = "..itemData.Type.."  itemData.Subtype = "..itemData.Subtype)
				if itemData.Type == 3 and itemData.Subtype == 9 then 
					if not (Lua_tools.GetGemBagFree(player) >= ItemList[k+1]) then 
						sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足,已发放到邮件中")
						local MailGem = {itemData.Id, 1, 1}
						for i = 1 , ItemList[k+1] do
							if sMailSystem:SendMail(0, "大唐驿站", player:GetGUID(), 1, "遗失物品查收", "我们在驿站发现了一批无人认领的包裹，经长安府追查，发现该包裹是少侠遗失的，现寄送给少侠，请少侠查收。", {}, MailGem) ~= 0 then
								--sLuaApp:LuaDbg(errmsg)
							end
						end
					else
						local MailGem = {itemData.KeyName, ItemList[k+1], 1}
						if not Lua_tools.AddItem(player, MailGem, "system", "奖励领取", "") then
							sLuaApp:NotifyTipsMsg(player, "奖励发放失败")
							return
						end
					end
				else
					local stack_max = itemData.StackMax	--获取物品的堆叠上限
					sLuaApp:LuaDbg("stack_max = "..stack_max)
					sLuaApp:LuaDbg("BagFree = "..Lua_tools.GetBagFree(player))
					sLuaApp:LuaDbg(math.ceil(ItemList[k+1]/stack_max))
					if not (Lua_tools.GetBagFree(player) >= math.ceil(ItemList[k+1]/stack_max)) then 
						sLuaApp:NotifyTipsMsg(player,"您的包裹空间不足,已发放到邮件中")
						local MailItem = {itemData.Id, ItemList[k+1], 1}
						if sMailSystem:SendMail(0, "大唐驿站", player:GetGUID(), 1, "遗失物品查收", "我们在驿站发现了一批无人认领的包裹，经长安府追查，发现该包裹是少侠遗失的，现寄送给少侠，请少侠查收。", {}, MailItem) ~= 0 then
							sLuaApp:LuaDbg("SwitchOnAward SendMail err")
						end
					else
						local MailItem = {itemData.KeyName, ItemList[k+1], 1}
						sLuaApp:LuaDbg("KeyName = "..MailItem[1])
						if not Lua_tools.AddItem(player, MailItem, "system", "奖励领取", "") then
							sLuaApp:NotifyTipsMsg(player, "奖励发放失败")
							return
						end
					end
				end
			end
		end
		return true
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return false
	end
end

function SwitchOnAward.PetBagFree(player, PetList)
	if Lua_tools then
		for k, v in pairs(PetList) do
			if type(v) == "string" then
				local PetData = PetConfig.GetByKeyName(v)
				if PetData then
					local MailPet = {}
					MailPet['PetList'] = {PetData.KeyName, PetList[k+1], 1}
					if not Lua_tools.GiveGoods(player, MailPet, "system", "奖励领取", "") then
						sLuaApp:NotifyTipsMsg(player, "奖励发放失败")
						return
					end
				else
					sLuaApp:LuaDbg("没PetData-------------------")
					return
				end
			end
		end
		return true
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return false
	end
end

--排序
function SwitchOnAward.Initialization()
	if not SwitchOnAward.Config then
		sLuaApp:LuaErr("缺少Config")
	end
	if Data then
		if not Data.award_final then
			Data.award_final = {}	
		end
		Data.award_final = SwitchOnAward.Config
		table.sort(Data.award_final, function(x, y) 
			if x["LevelParam"][1] == y["LevelParam"][1] then
				if x["LevelParam"][2] == y["LevelParam"][2] then
					return x["Id"] < y["Id"]
				else
					return x["LevelParam"][2] < y["LevelParam"][2]
				end
			else
				return x["LevelParam"][1] < y["LevelParam"][1]
			end
		end)
		--for k, v in ipairs(Data.award_final) do print(k.."  "..v["Id"].."  "..v["Title"]) end
	else
		sLuaApp:LuaErr("缺少Data")
	end
end

SwitchOnAward.Initialization()

function SwitchOnAward.BeStrongInitData()
	local strong_cfg = {}
	local cfg = SwitchOnAward.Config
	for i = 1, #cfg do
		local title = cfg[i].Title
		local unlockLevel = cfg[i].LevelParam[2]
		strong_cfg[title] = { UnlockLevel = unlockLevel }
	end
	return strong_cfg
end
