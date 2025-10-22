FormCLIOYYMsg = {}
  
  
function FormCLIOYYMsg.player_Level_Exp(player,point1)--升级执行

  --sLuaApp:NotifyTipsMsg(player,"收到客户端消息")
  
  local A = 111
  local B = 222
  local C = 333
  
	local str = [[
		if ShopYuanbaoUI then
			ShopYuanbaoUI.GetConfig(]]..A..","..B..","..C..[[)
            local ma = math.random(1,100)
  	        CL.SendNotify(NOTIFY.ShowBBMsg, "随机数="..ma)
		end
	]]  
  
  sLuaApp:ShowForm(player,"脚本表单",str)
  sLuaApp:LuaErr("FormServerLevel.get_function_switch")
  return ""
end

function FormCLIOYYMsg.player_YinBi_YuanBao(player,point1)--银币换元宝道具

  local BindGold = player:GetBindGold()--获取玩家银币
  local item_Money = {1010000,2020000,5050000,10100000,20200000,50500000}
  if BindGold < item_Money[point1] then 
    sLuaApp:NotifyTipsMsgEx(player , "没钱就别逞能了！")
    return
  end
  sLuaApp:NotifyTipsMsgEx(player , "兑换成功")

  player:SubBindGold(item_Money[point1], "兑换", "兑换银币寄售", "交易")
  
  sItemSystem:AddItemEx(player,point1,1,false,"系统","兑换","寄售兑换银币")
  return ""
end

function FormCLIOYYMsg.player_start_Level(player,int1)--升级执行
    local Level_Max = 120
    local save_exp = player:GetInt("ServerLevel_SaveExp")  --获取玩家储备变量值经验
    local max_level = player:GetInt("ServerLevel_LockLevel")  --获取玩家卡的等级
    local Max_Exp = player:GetAttr(308)--获取玩家升级所需经验

    local player_eXP = player:GetAttr(295) --获取玩家当前真实经验值
    
    local player_level = player:GetAttr(2)  -- 获取玩家当前等级

    local Min_exp = Max_Exp  - player_eXP   --获取实际所需升级经验值
 
    if save_exp < Max_Exp then 
      sLuaApp:NotifyTipsMsgEx(player , "经验不足,无法升级")
      return
    end
    
    if player_level >= Level_Max then 
      sLuaApp:NotifyTipsMsgEx(player , "已经登峰,暂时无法升级")
      return
    end    
    
    
    
    sLuaApp:NotifyTipsMsgEx(player , "卡等级="..tostring(max_level).."升级经验="..Min_exp.." 真实经验"..player_eXP.."储备="..save_exp)
    
    save_exp = save_exp - Min_exp  --扣除储备经验所需真实升级经验值
    max_level = max_level + 1   --设置新的卡等级值
    
    player:SetInt("ServerLevel_LockLevel", max_level)
    player:SetInt("ServerLevel_SaveExp", save_exp)
    player:AddExp(Min_exp, "system", "卡等级", "开始升级")
    
    --sLuaApp:NotifyTipsMsgEx(player , "开始升级"..max_level)
  return ""
end

--飞行旗逻辑 显示次数 --暂停使用
function FormCLIOYYMsg.player_FXQ_COUNT(player,point1)

  local count = player:GetInt("FXQ_Count") or 0
	local str = [[
		if ButtonTeleportFlag then
			ButtonTeleportFlag.OpenUI(]]..count..[[)
		end
	]]  
  
  sLuaApp:ShowForm(player,"脚本表单",str)
  return ""
end


--飞行旗逻辑增加次数
function FormCLIOYYMsg.player_FXQ_AddCount(player,point1)

  local Add_count = 3  --定义飞行旗补充次数
  
  local Money = 1000
  
  local count = player:GetInt("FXQ_Count") or 0

  local BindGold = player:GetBindGold()--获取玩家银币
  
    
  if BindGold < Add_count * Money then 
    sLuaApp:NotifyTipsMsgEx(player , "没钱可不行,50点灵气需要"..tostring(Add_count * Money).."银币")
    return
  end
  
  
  player:SubBindGold(Add_count * Money, "飞行旗", "灵气", "补充灵气")
  
  local return_count = count + Add_count
  player:SetInt("FXQ_Count", return_count)
  
  --不下发次数显示到客户端，改成次数为0直接提示是否补充
  sLuaApp:NotifyTipsMsgEx(player , "成功给飞行旗补充了"..tostring(Add_count * Money).."点灵气")
  
  
  return ""
end



function FormCLIOYYMsg.player_FXQ_AddPostCount(player)

  local Add_count = 300  --定义飞行旗补充次数
  local Money = 500000
  local count = player:GetInt("FXQ_Count") or 0
  local BindGold = player:GetBindGold()--获取玩家银币
  
  if count > 10 then 
    sLuaApp:NotifyTipsMsgEx(player , "飞行旗灵气低于10点才可补充")
    return
  end
  
  if BindGold < Money then 
    sLuaApp:NotifyTipsMsgEx(player , "没钱可不行,300点灵气需要"..tostring(Money).."银币")
    return
  end

  player:SubBindGold(Money, "飞行旗", "灵气", "补充灵气")

  local return_count = count + Add_count
  player:SetInt("FXQ_Count", return_count)
  
  sLuaApp:NotifyTipsMsgEx(player , "成功给飞行旗补充了"..tostring(Add_count).."点灵气")


  FormCLIOYYMsg.player_FlightUI(player,map_id)


end



function FormCLIOYYMsg.player_FXQ_Jumap(player,Map_id,X,Y)--开始飞行

    local count = player:GetInt("FXQ_Count") or 0
    if count == 0 then 
      --sLuaApp:NotifyTipsMsgEx(player , "飞行旗已经没有灵气,黯然失色")
   
      local str = [[
        if TeleportFlag then
          TeleportFlag.AddLQ()
        end
      ]]  

      sLuaApp:ShowForm(player,"脚本表单",str)

      return
    end
    
    
    player:SetInt("FXQ_Count",count - 1)
    
    local Map_obj = sMapSystem:GetMapById(Map_id)
    sMapSystem:Jump(player,Map_obj,X,Y,1)
  return ""
end




--删除全部记录点
function FormCLIOYYMsg.player_FXQ_Remove(player,Map_Name)
    player:SetString(Map_Name,"")
    sLuaApp:NotifyTipsMsgEx(player , "当前"..Map_Name.."记录点已被全部删除")
  return ""
end


--记录坐标
function FormCLIOYYMsg.player_FXQ_PostXY(player,point1,Map_name)
    --获取记录总数据
    local post_xy = player:GetString(Map_name)
    
    --分割总数据
    local post_table = sLuaApp:StrSplit(post_xy,"|")
    
    if #post_table >= 10 then 
      sLuaApp:NotifyTipsMsgEx(player , "当前地图已经记录10个坐标了")
      return
    end
    
    for i = 1, #post_table do 
      if point1 == post_table[i] then 
        sLuaApp:NotifyTipsMsgEx(player , "记录坐标不可重复！")
        return
      end
    end
    
    
    
    
    
    --分割新坐标点
   
   -- local client_table = sLuaApp:StrSplit(point1,"-")    --格式是   100,100  x,y
   -- local OKXY = client_table[1]..","..client_table[2]
   
   
    post_xy = point1.."|"..post_xy
    
    
   player:SetString(Map_name,post_xy)
    
   sLuaApp:NotifyTipsMsgEx(player , "记录成功")
   
   
   
    if Map_name == "长安城" then 
      map_id = 210
    elseif Map_name == "西梁女国" then 
      map_id = 217
    elseif Map_name == "傲来村" then 
      map_id = 201
    end
    FormCLIOYYMsg.player_FlightUI(player,map_id)
   
   
   
  return ""
end






--打开飞行旗界面
function FormCLIOYYMsg.player_FXQ_OpenUI(player,point1)

  local Mapid = 0
  if point1 == "长安城" then 
    Mapid = 210
  elseif point1 == "西梁女国" then 
    Mapid = 217
  elseif point1 == "傲来村" then 
    Mapid = 201
  end
  
  local count = player:GetInt("FXQ_Count") or 0
  if count == 0 then 
    
      --sLuaApp:NotifyTipsMsgEx(player , "飞行旗已经没有灵气,黯然失色")
    
      local str = [[
        if FlightChessMainUI then
          FlightChessMainUI.AddLQ()
        end
      ]]  

      sLuaApp:ShowForm(player,"脚本表单",str)
    
    return
  end
  --获取飞行旗坐标数据
  local post_xy = player:GetString(point1) 
  
  if post_xy == "" then 
    post_xy = "0"
  end


	local str = [[
		if TeleportFlag then
			TeleportFlag.OpenUI(]]..Mapid..",".."'"..post_xy.."'"..[[)
		end
	]]  
	
  sLuaApp:ShowForm(player,"脚本表单",str)
  
  
  
  
  return ""
end

--删除特定坐标
function FormCLIOYYMsg.player_FlightUI_Removexy(player,map_id,map_info)


  local map_name 


  if map_info == "" or map_info == "记录" then
    sLuaApp:NotifyTipsMsgEx(player , "无法删除当前坐标")
    return
  end
  if map_id == 210 then 
    map_name = "长安城"
  elseif map_id == 217 then 
    map_name = "西梁女国"
  elseif map_id == 201 then 
    map_name = "傲来村"
  end
  local post_xy = player:GetString(map_name) 
 -- sLuaApp:LuaErr("####@@@="..post_xy.."map_info="..map_info.."map_id="..map_id.."map_name="..map_name)
  
  local result = removeItemFromPipeString(post_xy, map_info)
  
  player:SetString(map_name,result)
  local count = player:GetInt("FXQ_Count")  
  sLuaApp:NotifyTipsMsgEx(player , "坐标记录已更新")
  local post_xy = player:GetString(map_name) 
	local str = [[
		if FlightUI then
			FlightUI.OnShow1(]].."'"..count.."'"..",".."'"..post_xy.."'"..[[)
		end
	]]  
	
  sLuaApp:ShowForm(player,"脚本表单",str)
  
  
  return ""
end


--打开飞行旗管理界面
function FormCLIOYYMsg.player_FlightUI(player,map_id)
  local map_name 
  local count = player:GetInt("FXQ_Count")  
  if map_id == 210 then 
    map_name = "长安城"
  elseif map_id == 217 then 
    map_name = "西梁女国"
  elseif map_id == 201 then 
    map_name = "傲来村"
  else
    map_name = "未知"
  end


  if map_name ~= "长安城" and map_name ~= "西梁女国" and map_name ~= "傲来村" then 
    sLuaApp:NotifyTipsMsgEx(player,"当前地图不支持飞行旗")
    
    local str = [[
      if FlightUI then
        FlightUI.OnClosePanel(]].."'".."123".."'"..[[)
      end
    ]]  
    
    sLuaApp:ShowForm(player,"脚本表单",str)
    
    
    
    return
  end
  
  


  local post_xy = player:GetString(map_name) 

	local str = [[
		if FlightUI then
			FlightUI.OnShow1(]].."'"..count.."'"..",".."'"..post_xy.."'"..[[)
		end
	]]  
	
  sLuaApp:ShowForm(player,"脚本表单",str)
  return ""
end


function removeItemFromPipeString(pipeString, itemToRemove)
    local items = {}
    
    -- 分割字符串
    for item in string.gmatch(pipeString, "([^|]+)") do
        if item ~= itemToRemove then
            table.insert(items, item)
        end
    end
    
    -- 重新组合
    return table.concat(items, "|")
end

function Sprsplit(str, sep)
    -- 转义特殊模式字符
    sep = sep:gsub("[%.%*%+%?%[%]%(%)%^%$]", "%%%1")
    local result = {}
    for part in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(result, part)
    end
    return result
end


















