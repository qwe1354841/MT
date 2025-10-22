--大弟子相关表单
FormFirstDisciple = {}

function FormFirstDisciple.Modify_Declaration(player,str)
	if Act_FirstDisciple then
		Act_FirstDisciple.Modify_Declaration(player,str)
	end
	return ""
end

function FormFirstDisciple.Get_Declaration(player)
	if Act_FirstDisciple then
		Act_FirstDisciple.Get_Declaration(player)
	end
	return ""
end

function FormFirstDisciple.Vote(player,guid)
	if Act_FirstDisciple then
		Act_FirstDisciple.Vote(player,guid)
	end
	return ""
end