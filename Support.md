# Исходники для Support 5.4.38 #

https://docs.google.com/file/d/0BzzBOIHYTuK3dE9tZEd6ckJsdVE/edit?usp=sharing

# Запрос на права к Таблице в Саппорте #

Select Grps.Name as GroupName, Files.Xf$name as TableName, Usr.Xu$loginname as UserGroupRight, UsrPers.Xu$loginname as UserPersRight
 from 
      GAL.X$files     Files
         
-- групповые права
      left join GAL.TableRights TableRights on     TableRights.TableCode = Files.XF$Code
                                               and TableRights.Right     > 1                     --  Вставка или модификация или удаление                          
      
      left join GAL.Groups      Grps        on     TableRights.ObjType   = 1 
                                               and TableRights.ObjCode   = Grps.Atl_Nrec
      
      left join GAL.GroupUsers  GroupUsers  on     Grps.Atl_Nrec         = GroupUsers.GroupCode 
 
      left join GAL.X$users     Usr         on     Usr.Atl_Nrec          = GroupUsers.Usercode


-- личные права
      left join GAL.X$users     UsrPers     on     TableRights.ObjType   = 0 
                                               and TableRights.ObjCode   = UsrPers.Atl_Nrec
  where 
        Files.Xf$name          = 'SALDMOUN'
    and Files.XF$Code          > 0
