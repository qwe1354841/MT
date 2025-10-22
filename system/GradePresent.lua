--狂送大礼
GradePresent = {}
GradePresent.PresentConfig = {
	['2'] = {
		['GradeGift'] = {                                                                                                        
			['ItemList_31'] =  {"新手橙重剑#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--谪剑仙，男，重剑
			['ItemList_32'] =  {"新手橙弓箭#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--飞翼姬，女，弓箭
			['ItemList_33'] =  {"新手橙扇子#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--烟云客，男，扇子
			['ItemList_34'] =  {"新手橙笛子#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--冥河使，男，笛子
			['ItemList_35'] =  {"新手橙爪刺#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--阎魔令，男，爪刺
			['ItemList_36'] =  {"新手橙毛笔#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--雨师君，男，毛笔
			['ItemList_37'] =  {"新手橙阔刀#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--神霄卫，男，阔刀
			['ItemList_38'] =  {"新手橙长枪#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--傲红莲，女，长枪
			['ItemList_39'] =  {"新手橙双剑#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--花弄影，女，双剑
			['ItemList_40'] =  {"新手橙长鞭#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--青丘狐，女，长鞭
			['ItemList_41'] =  {"新手橙短杖#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--海鲛灵，女，短杖
			['ItemList_42'] =  {"新手橙绣伞#4",1,"增加耐力",1,"血药-5",5,"蓝药-5",5,"高级死亡替身",1},--凤凰仙，女，绣伞
		},
		['GradeGiftFontArtConfig'] = {
			{FontValue = "神器光武", FontName = "103"},		--美术字体，右侧
			{FontValue = "上线即送", FontName = "101"},		--美术字体，左侧第二列
			{FontValue = "神器光武", FontName = "105"},		--美术字体，左侧
			{FontValue = "神器光武", FontName = "103"},		--美术字体，下方
		},
	},
	['5'] = {
		['GradeGift'] = {
			['ItemList'] = {"更名卡",1,"15级护符物攻紫",1,"15级项圈紫",1,"宠物经验丹3",2},
			['PetList'] = {"神兽猪"},
		},
		['GradeGiftFontArtConfig'] = {
			{FontValue = "神兽飞天猪", FontName = "103"},
			{FontValue = "强势助阵", FontName = "101"},
			{FontValue = "强力秒三神兽", FontName = "105"},
			{FontValue = "强力神兽", FontName = "103"},
		},
	},
	['27'] = {
		['GradeGift'] = {
			['ItemList'] = {"宠物经验丹3",10,"喇叭",3,"高级人物染料",1,"高级宠物染料",1},
			['GuardList'] = {"观音菩萨"},
		},
		['GradeGiftFontArtConfig'] = {
			{FontValue = "观音", FontName = "103"},
			{FontValue = "助您一路称霸", FontName = "101"},
			{FontValue = "顶级侍从", FontName = "105"},
			{FontValue = "SSR侍从", FontName = "103"},
		},
	},

}

--等级礼包配置，不发奖励不要填
-- GradePresent.ShowPresentConfig = {
	-- ['2'] = {                                                                                   
		-- ['Items_31'] =  {"新手橙重剑", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_32'] =  {"新手橙弓箭", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_33'] =  {"新手橙扇子", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_34'] =  {"新手橙笛子", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_35'] =  {"新手橙爪刺", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_36'] =  {"新手橙毛笔", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_37'] =  {"新手橙阔刀", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_38'] =  {"新手橙长枪", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_39'] =  {"新手橙双剑", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_40'] =  {"新手橙长鞭", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_41'] =  {"新手橙短杖", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
		-- ['Items_42'] =  {"新手橙绣伞", 1, "增加耐力", 1, "血药-5", 5, "蓝药-5", 5, "高级死亡替身", 1},
	-- },
	-- ['5'] = {
		-- ['item_list'] = {"神兽展示猪", 1, "更名卡", 1, "15级护符物攻紫", 1, "15级项圈紫", 1, "宠物经验丹3", 2},
		-- ['show_mod'] = "神兽猪",
	-- },
	-- ['27'] = {
		-- ['item_list'] = {"侍从展示-观音菩萨", 1, "宠物经验丹3", 10, "喇叭", 3, "高级人物染料", 1, "高级宠物染料", 1},
		-- ['show_mod'] = "观音菩萨",
	-- },
-- }

GradePresent.LevelConfig = {2,5,27}

function GradePresent.InitLevelConfig()
	GPLevelConfigMapping = {}
	for k,v in ipairs(GradePresent.LevelConfig) do
		GPLevelConfigMapping[v] = k
	end
end
GradePresent.InitLevelConfig()

--玩家升级回调
function GradePresent.on_player_levelup(player)
	GradePresent.FirstCreatPet(player)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local isOpenUI = false
	for k, v in ipairs(GradePresent.LevelConfig) do
		if level >= tonumber(v) then
			if player:GetInt("GradePresentIsHave_"..v) ~= 1 then
				isOpenUI = true
			end
		end
	end
	if isOpenUI then
		GradePresent.GetPresetnData(player)
	end
end

--玩家登录回调
function GradePresent.on_player_login(player)
	--sLuaApp:LuaDbg("登录发送等级大礼显示数据")
	--等级礼包未领取完毕, 打开界面
	--if player:IsFightState() then
	--		sLuaApp:LuaDbg("角色在战斗中，不回调")
	--	return ""
	--end
	if Lua_tools then
		local dataTb = {}
		if EquipIntensify then
			dataTb = EquipIntensify.initializeEx()
		end
		local str = [[
			if UIDefine then
				UIDefine.EquipEnhanceAttrData = ]]..Lua_tools.serialize(dataTb)..[[
				UIDefine.GradeGift_ItemList_For_Show = ]]..Lua_tools.serialize(GradePresent.PresentConfig)..[[
				UIDefine.GradeGift_RewardLevel = ]]..Lua_tools.serialize(GradePresent.LevelConfig)..[[
			end
		]]
		--sLuaApp:LuaDbg(str)
		sLuaApp:ShowForm(player, "脚本表单", str)
		local level = player:GetAttr(ROLE_ATTR_LEVEL)
		local isOpenbtn = false
		local isOpenUI = false
		GradePresent.FirstCreatPet(player)

		for k, v in ipairs(GradePresent.LevelConfig) do
			if player:GetInt("GradePresentIsHave_"..v) ~= 1 then
				isOpenbtn = true
				if level >= tonumber(v) then
					isOpenUI = true
					break
				end
			end
		end
		
		if isOpenbtn then
			--sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('GradeGiftBtn')")
			local fight = tostring(player:IsFightState())
			local str = [[
				GUI.OpenWnd('GradeGiftBtn')
				if GradeGiftBtn then
					GradeGiftBtn.OnEnterFight(]]..fight..[[)
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			if isOpenUI then
				sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('GradeGiftUI','"..fight.."')")
				local IsHaveList = {}
				for k, v in pairs(GradePresent.PresentConfig) do
					IsHaveList[k] = player:GetInt("GradePresentIsHave_"..k)
				end
				local str = [[
					if GradeGiftUI then
						GradeGiftUI.IsHaveList = ]]..Lua_tools.serialize(IsHaveList)..[[
					end
					if GradeGiftBtn then
						GradeGiftBtn.IsHaveList = ]]..Lua_tools.serialize(IsHaveList)..[[
						GradeGiftBtn.OnRefresh()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
				return 
			end
		end

		if not isOpenbtn then
			local str = [[
				if GradeGiftBtn then
					GradeGiftBtn.OnExit()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
		return ""
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return ""
	end	
end

--创建宠物
function GradePresent.FirstCreatPet(player)
	local pets = {}
	for k, v in pairs(GradePresent.PresentConfig) do
		for a, b in pairs(GradePresent.PresentConfig[k]["GradeGift"]) do
			if a == "PetList" then
				for m, n in pairs(b) do
					local petData = PetConfig.GetByKeyName(n)
					table.insert(pets, petData.KeyName)
					player:SetString("GradePresentPet_"..m, petData.KeyName)
				end
			end
		end
	end
	Lua_tools.RegisterPets(pets)
end


--获取宠物GUID
--@newinter GradePresent:GetGradePresentPetGUID(player, index)
function GradePresent:GetGradePresentPetGUID(player, index)
	sLuaApp:LuaDbg("获取宠物GUID")
	--sLuaApp:LuaDbg("index:"..index)
	if index ~= 0 then
		local petKeyName = player:GetString("GradePresentPet_"..index)
		local petData = PetConfig.GetByKeyName(petKeyName)
		--sLuaApp:LuaDbg(petKeyName)
		FormPet.QueryPetByKeyName(player, petKeyName)
	end
end

--获取数据
function GradePresent.GetPresetnData(player)
	if Lua_tools then
		GradePresent.GiveDataIsHaveList(player)
		return ""
	else
		sLuaApp:LuaErr("缺少Lua_tools")
		return ""
	end
end

function GradePresent.GiveDataIsHaveList(player)
	local IsHaveList = {}
	for k, v in pairs(GradePresent.PresentConfig) do
		IsHaveList[k] = player:GetInt("GradePresentIsHave_"..k)
	end
	local IsHaveList_serialize = Lua_tools.serialize(IsHaveList)
	local str = [[
		if GradeGiftBtn then 
			if not GUI.GetVisible(GUI.GetWnd("GradeGiftUI")) or not GradeGiftUI then
				GradeGiftBtn.IsHaveList = ]]..IsHaveList_serialize..[[
				GUI.OpenWnd("GradeGiftUI")
				if GradeGiftUI then
					if GradeGiftUI.IsHaveList ~= ]]..IsHaveList_serialize..[[ then
						GradeGiftUI.IsHaveList = ]]..IsHaveList_serialize..[[
					end
				end
				GradeGiftBtn.OnRefresh()
			end
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return IsHaveList
end

--@newinter GradePresent.GiveGradePresent(player, 2)
--领取道具
function GradePresent.GiveGradePresent(player, reward_level)
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local reward_level = tonumber(reward_level)
	local number_correct = false
	for k, v in pairs(GradePresent.LevelConfig) do
		if reward_level == v then
			number_correct = true
		end
	end
	if not number_correct then
		sLuaApp:LuaErr("数据不合法")
		return ""
	end
	if level < reward_level then
		sLuaApp:NotifyTipsMsg(player, "您的等级不足，无法领取")
		return ""
	end
	if player:GetInt("GradePresentIsHave_"..reward_level) == 1 then
		sLuaApp:NotifyTipsMsg(player, "您已经领取过该阶段的奖励了，无法重复领取")
		return ""
	end
	if not Lua_tools then
		sLuaApp:LuaErr("缺少Lua_tools")
		return ""
	end
	player:SetInt("GradePresentIsHave_"..reward_level, 1)
	
	for k, v in pairs(GradePresent.PresentConfig[tostring(reward_level)]['GradeGift']) do
		sLuaApp:LuaDbg("k:"..k)
		if k == "PetList" then
			--sLuaApp:LuaDbg("PetList:"..v[1])
			for m, n in pairs(v) do
				local petKeyName = player:GetString("GradePresentPet_"..m)
				local petData = PetConfig.GetByKeyName(petKeyName)
				if petData then
					if Lua_tools.GetPetBagFree(player) > 0 then
						local pet = sPetSystem:AddPetEx(player,petData.Id,0,true, "狂送大礼", "狂送大礼领取奖励", "狂送大礼领取奖励给予宠物")
						if pet then
							local pet_guid = pet:GetGUID()
							if PetLineup then
								local lineup_list = PetLineup.GetNowLineup(player)
								--sLuaApp:LuaDbg(lineup_list[0])
								--sLuaApp:LuaDbg("type:"..type(lineup_list[0]))
								local isPrimaryPet = true
								if lineup_list[0] == "-1" then
									--sLuaApp:LuaDbg("宠物参战")
									isPrimaryPet = false
									PetLineup.UpLineup(player, pet_guid, 0)
									sPetSystem:ShowPet(pet)
								end
								if isPrimaryPet then
									for i = 1,4 do 
										if lineup_list[i] == "-1" then
											if level >=  PetLineup.UnlockConfig[i] then
												--sLuaApp:LuaDbg("加入侍宠")
												PetLineup.UpLineup(player, pet_guid, i)
												sPetSystem:ShowPet(pet)
												break
											else
												sLuaApp:LuaDbg("等级不足")
											end
										end									
									end
								end
							end
						end
					else
						sLuaApp:NotifyTipsMsg(player, "您的宠物包裹已满，宠物奖励将以邮件形式发送")
						sMailSystem:SendMailEx(0, "大唐驿站", player:GetGUID(), 1, "遗失宠物查收","我们在驿站发现了一只无人认领的宠物，经长安府追查，发现该宠物是少侠遗失的，现寄送给少侠，请少侠查收。",{},{},{petData.Id,0,1})
					end
				else
					sLuaApp:LuaErr("没有petData")
					return ""
				end
			end
		elseif k == "GuardList" then
			--sLuaApp:LuaDbg("GuardList:"..v[1])
			local GuardData = GuardConfig.GetByKeyName(v[1])
			local GuardCon = player:GetGuardContainer()
			if GuardCon:HasGuard(GuardData.Id) then
				if not GuardUpStar.Config then
					sLuaApp:LuaErr("缺少GuardUpStar.Config")
					return ""
				end
				if not Lua_tools.AddItem(player, {GuardUpStar.Config[GuardData.Id]["item"], 40}) then
					sLuaApp:LuaErr("道具发放失败")
					return ""
				end
			else
				local guard = sGuardSystem:AddGuard(player, GuardData.Id, level,"狂送大礼系统", "狂送大礼领取奖励", "狂送大礼领取奖励给予侍从")
				if guard == nil then
					sLuaApp:LuaErr("给予侍从失败")
					return ""
				end
				local LineupContainer = player:GetLineupContainer()			--获取阵容容器
				local now_line_id = LineupContainer:GetCurrentLineup()		--获取当前阵容id
				local line_list = LineupContainer:GetLineup(now_line_id)	--取得指定阵容id侍从列表
				local count = 0 
				for k, v in pairs(line_list) do
					count = count + 1
				end	
				if count < 4 then
					if not LineupContainer:PushLineup(now_line_id, guard:GetGUID()) then
						sLuaApp:LuaErr("侍从上阵失败")
					end
				else
					sLuaApp:LuaDbg("侍从阵容已满，无需上阵")
				end
			end
		elseif k == "ItemList" then
			--sLuaApp:LuaDbg("ItemList:"..v[1])
			if not Lua_tools.AddItem(player, v, "狂送大礼系统", "狂送大礼领取奖励", "狂送大礼领取奖励发放道具") then
				sLuaApp:LuaErr("道具发放失败")
				return ""
			end
		else
			--sLuaApp:LuaDbg("player_role:"..player:GetAttr(ROLE_ATTR_ROLE))
			local Role = tonumber(sLuaApp:StrSplit(k, "_")[2])
			--sLuaApp:LuaDbg("Role:"..Role)
			if Role == player:GetAttr(ROLE_ATTR_ROLE) then
				if not Lua_tools.AddItem(player, v, "狂送大礼系统", "狂送大礼领取奖励", "狂送大礼领取奖励发放道具") then
					sLuaApp:LuaErr("道具发放失败")
					return ""
				end
				--sLuaApp:LuaDbg("=========role对应")
			end
		end
	end
	
	--sLuaApp:LuaDbg("GradePresentIsHave_"..reward_level..":"..player:GetInt("GradePresentIsHave_"..reward_level))
	local IsHaveList = {}
	for k, v in pairs(GradePresent.PresentConfig) do
		IsHaveList[k] = player:GetInt("GradePresentIsHave_"..k)
	end
	local isOpenbtn = false
	for k, v in pairs(IsHaveList) do
		if v ~= 1 then
			isOpenbtn = true
		end
	end
	--sLuaApp:LuaDbg("关闭页面")
	sLuaApp:ShowForm(player, "脚本表单", "GradeGiftUI.OnExit()")
	if not isOpenbtn then
		sLuaApp:LuaDbg("关闭btn")
		sLuaApp:ShowForm(player, "脚本表单", "GradeGiftBtn.OnExit()")
	end
	return ""
end