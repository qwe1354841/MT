-- 科举表单
FormKeJu = {}
-- 乡试 打开窗口
--function FormKeJu.XiangShiOpen(player)
--    Act_XiangShi.OpenForm(player)
--end

-- 乡试  接收答案
function FormKeJu.XiangShiReceiveAnswer(player, content)
    return Act_XiangShi.receiveAnswer(player, content)
end

-- 乡试 关闭窗口
function FormKeJu.XiangShiCloseWin(player)
    return Act_XiangShi.closeXiangShiWin(player)
end

-- 会试 打开窗口
--function FormKeJu.HuiShiOpen(player)
--    return Act_HuiShi.OpenForm(player)
--end

-- 会试 接收答案
function FormKeJu.HuiShiReceiveAnswer(player, content)
    return Act_HuiShi.ReceiveAnswer(player, content)
end

-- 会试 找出正确的题 返回正确答案的索引
function FormKeJu.HuiShiFindRightAnswer(player)
    return Act_HuiShi.FindRightAnswer(player)
end

-- 会试 去掉一个错误答案 返回一个错误答案的索引
function FormKeJu.HuiShiDeleteErrorAnswer(player)
    return Act_HuiShi.DeleteErrorAnswer(player)
end

-- 会试 换一道题
function FormKeJu.HuiShiChangeQuestion(player)
   return Act_HuiShi.ChangeQuestion(player)
end

-- 会试 倒计时已到关闭窗口
function FormKeJu.HuiShiCloseWin(player)
    return Act_HuiShi.HuiShiCloseWin(player)
end

-- 会试 玩家点击关闭按钮
function FormKeJu.HuiShiClickClose(player, content)
    return Act_HuiShi.HuiShiClickClose(player,content)
end





-- 殿试 打开界面
--function FormKeJu.DianShiOpen(player)
--    return Act_DianShi.OpenForm(player)
--end

-- 殿试 接收答案
function FormKeJu.DianShiReceiveAnswer(player, content)
    return Act_DianShi.ReceiveAnswer(player, content)
end

-- 殿试 玩家点击关闭按钮
function FormKeJu.DianShiClickClose(player, content)
    return Act_DianShi.DianShiClickClose(player, content)
end
-- 殿试 倒计时关闭通知
function FormKeJu.DianShiCloseWin(player)
    return Act_DianShi.DianShiCloseWin(player)
end

-- 殿试 找出正确的答案
function FormKeJu.DianShiFindRightAnswer(player)
    return Act_DianShi.FindRightAnswer(player)
end

-- 殿试 去掉错误答案
function FormKeJu.DianShiDeleteErrorAnswer(player)
    return Act_DianShi.DeleteErrorAnswer(player)
end

-- 殿试 换一道题
function FormKeJu.DianShiChangeQuestion(player)
    return Act_DianShi.ChangeQuestion(player)
end