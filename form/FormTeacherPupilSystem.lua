--师徒系统表单
FormTeacherPupilSystem = {}

--拜师
function FormTeacherPupilSystem.BaiShi(player,TeacherUNID,PupilUNID,IsAgree)
    if TeacherPupilSystem then
        TeacherPupilSystem.BaiShi(player,TeacherUNID,PupilUNID,IsAgree)
    end
    return ""
end

--解除师徒关系
function FormTeacherPupilSystem.RelieveRelation(player,TeacherUNID,PupilUNID,IsAgree)
    if TeacherPupilSystem then
        TeacherPupilSystem.RelieveRelation(player,TeacherUNID,PupilUNID,IsAgree)
    end
    return ""
end

--得到师父登记信息
function FormTeacherPupilSystem.GetRegisterData_Teacher(player)
    if TeacherPupilSystem then
        TeacherPupilSystem.GetRegisterData_Teacher(player)
    end
    return ""
end

--得到徒弟登记信息
function FormTeacherPupilSystem.GetRegisterData_Pupil(player)
    if TeacherPupilSystem then
        TeacherPupilSystem.GetRegisterData_Pupil(player)
    end
    return ""
end

--消耗物品
function FormTeacherPupilSystem.ConsumeItem(player,TeacherUNID,PupilUNID,Type)
    if TeacherPupilSystem then
        TeacherPupilSystem.ConsumeItem(player,TeacherUNID,PupilUNID,Type)
    end
    return ""
end

--换一批
function FormTeacherPupilSystem.RefreshData(player,Type)
    if not player or not Type then
        return
    end
    if TeacherPupilSystem then
        if tonumber(Type) == 1 then
            TeacherPupilSystem.GetRegisterData_Teacher(player)
        elseif tonumber(Type) == 2 then
            TeacherPupilSystem.GetRegisterData_Pupil(player)
        end
    end
    return ""
end