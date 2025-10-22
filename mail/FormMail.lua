FormMail = {}

--请求邮件列表
function FormMail.GetMailList(player)
    if player == nil then
        return ""
    end

    sMailSystem:NotifyMailList(player)
    return ""
end

--打开邮件
function FormMail.OpenMail(player, mail_guid)
    if player == nil then
        return ""
    end

    sMailSystem:OpenMail(player, mail_guid)
    return ""
end

--领取邮件附件
function FormMail.GetMailAttachment(player, mail_guid)
    if player == nil then
        return ""
    end

    sMailSystem:GetMailAttachment(player, mail_guid)
    return ""
end

-- 一键领取所有邮件附件
function FormMail.GetAllAttachment(player)
    if player == nil then
        return ""
    end

    sMailSystem:GetAllAttachment(player)
    return ""
end

--删除邮件
function FormMail.DeleteMail(player, mail_guid)
    if player == nil then
        return ""
    end

    sMailSystem:DeleteMail(player, mail_guid)
    return ""
end

--删除所有邮件
function FormMail.DeleteAllMails(player)
    if player == nil then
        return ""
    end

    sMailSystem:DeleteAllMails(player)
    return ""
end

function FormMail.SuperMailInfo(player, mailGUID)
	local mailStr = player:GetString("MailIntensify_".. mailGUID)
	if mailStr ~= "" then
		sLuaApp:ShowForm(player, "脚本表单", "MailUI.GetItemData('"..mailGUID.."','"..mailStr.."')")
	end
	return ""
end



