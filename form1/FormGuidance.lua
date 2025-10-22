--引导相关表单
FormGuidance = {}

function FormGuidance.GetGuidanceStr(player,str)
	if player and str then
		if Guidance then
			Guidance.GetGuidanceStr(player,str)
		end
	end
	return ""
end
function FormGuidance.Finish(player,str,index,is_overtime)
	if player and str and str ~= "" and str ~= "nil" then
		if Guidance then
			Guidance.FinishOrOverTime(player,str,index,is_overtime)
		end
	end
	return ""
end