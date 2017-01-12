# Заблокированне сессии #
SELECT a.rowid, a.*
FROM 
  GAL."SYS#LOCKS" a
;

# Соответствие типов #
Word number(5)
LongInt number(10)
Nrec char(16)
double number(24, 8)


# Чистка журнала #
truncate table x$journal;

# Инструментарий #
Для работы с БД на Oracle существует удобный инструмент: PLSQL Developer
Уже крякнутая версия:
https://docs.google.com/open?id=0BzzBOIHYTuK3MTk3NGM5YzQtYzQwNS00NjNkLWFmYmUtYTQzYjJhMmRmMDQ2

Если наблюдаются проблемы с русской кодировкой - делаем так:
HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\oracle\KEY\_OraClient11g\_home2\_32bit\NLS\_LANG и указываем кодировку как в БД, в моём случае это AMERICAN\_AMERICA.CL8MSWIN1251

# Пример запроса на рассчитанные права пользователей на таблицы #
```
Oracle запрос на Права пользователей на Таблицы

(если у кого-нибудь есть более простой запрос, пожалуйста, выложите сюда)


select table_privilege_map.name privilege,
      decode(mod(sys.objauth$.option$,2), 1, 'YES', 'NO') grantable,
      ue.name grantee,
      ue.user#,
      gal.x$users.xu$loginname,
--       ur.name grantor,
--       u.name owner,
      decode(sys.obj$.TYPE#, 0, 'NEXT OBJECT', 1, 'INDEX', 2, 'TABLE', 3, 'CLUSTER', 4, 'VIEW', 5, 'SYNONYM', 6, 'SEQUENCE',
                      7, 'PROCEDURE', 8, 'FUNCTION', 9, 'PACKAGE', 11, 'PACKAGE BODY', 12, 'TRIGGER',
                      13, 'TYPE', 14, 'TYPE BODY', 19, 'TABLE PARTITION', 20, 'INDEX PARTITION', 21, 'LOB',
                      22, 'LIBRARY', 23, 'DIRECTORY', 24, 'QUEUE', 28, 'JAVA SOURCE', 29, 'JAVA CLASS', 30, 'JAVA RESOURCE',
                      32, 'INDEXTYPE', 33, 'OPERATOR', 34, 'TABLE SUBPARTITION', 35, 'INDEX SUBPARTITION',
                      40, 'LOB PARTITION', 41, 'LOB SUBPARTITION', 42, 'MATERIALIZED VIEW', 43, 'DIMENSION', 44, 'CONTEXT', 46, 'RULE SET', 47, 'RESOURCE PLAN',
                      48, 'CONSUMER GROUP', 51, 'SUBSCRIPTION', 52, 'LOCATION', 55, 'XML SCHEMA', 56, 'JAVA DATA', 57, 'SECURITY PROFILE', 59, 'RULE',
                      62, 'EVALUATION CONTEXT',
                      'UNDEFINED') object_type,
      sys.obj$.name object_name,
      '' column_name
       from sys.objauth$, sys.obj$, sys.user$ u, sys.user$ ur, sys.user$ ue,
            table_privilege_map, gal.x$users
       where sys.objauth$.obj#       = sys.obj$.obj#
         and sys.objauth$.grantor#   = ur.user#
         and sys.objauth$.grantee#   = ue.user#
         and sys.objauth$.col#       is null
         and sys.objauth$.privilege# = table_privilege_map.privilege
         and u.user#                 = sys.obj$.owner#
         and sys.obj$.TYPE#          in (2, 4, 6, 9, 7, 8, 42, 23, 22, 13, 33, 32)
         and ue.Name                 not in ('SYS', 'SYSTEM')
         and u.Name                  not in ('SYS', 'SYSTEM')
         and 'GAL#'||gal.x$users.atl_nrec = ue.name
         and 'KATORG'                = sys.obj$.name
--  and ue.name = 'GAL#813E000000000359'
union all -- column level grants
select table_privilege_map.name privilege,
      decode(mod(sys.objauth$.option$,2), 1, 'YES', 'NO') grantable,
      ue.name grantee,
      ue.user#,
      gal.x$users.xu$loginname,
--       ur.name grantor,
--       u.name owner,
      decode(sys.obj$.TYPE#, 0, 'NEXT OBJECT', 1, 'INDEX', 2, 'TABLE', 3, 'CLUSTER', 4, 'VIEW', 5, 'SYNONYM', 6, 'SEQUENCE',
                      7, 'PROCEDURE', 8, 'FUNCTION', 9, 'PACKAGE', 11, 'PACKAGE BODY', 12, 'TRIGGER', 13, 'TYPE', 14, 'TYPE BODY',
                      19, 'TABLE PARTITION', 20, 'INDEX PARTITION', 21, 'LOB', 22, 'LIBRARY', 23, 'DIRECTORY', 24, 'QUEUE',
                      28, 'JAVA SOURCE', 29, 'JAVA CLASS', 30, 'JAVA RESOURCE', 32, 'INDEXTYPE', 33, 'OPERATOR',
                      34, 'TABLE SUBPARTITION', 35, 'INDEX SUBPARTITION', 40, 'LOB PARTITION', 41, 'LOB SUBPARTITION', 42, 'MATERIALIZED VIEW',
                      43, 'DIMENSION', 44, 'CONTEXT', 46, 'RULE SET', 47, 'RESOURCE PLAN', 48, 'CONSUMER GROUP', 51, 'SUBSCRIPTION', 52, 'LOCATION',
                      55, 'XML SCHEMA', 56, 'JAVA DATA', 57, 'SECURITY PROFILE', 59, 'RULE', 62, 'EVALUATION CONTEXT',
                      'UNDEFINED') object_type,
      sys.obj$.name object_name,
      c.name column_name
from sys.objauth$, sys.obj$, sys.user$ u, sys.user$ ur, sys.user$ ue, sys.col$ c,
    table_privilege_map, gal.x$users
where sys.objauth$.obj#       = sys.obj$.obj#
and sys.objauth$.grantor#   = ur.user#
and sys.objauth$.grantee#   = ue.user#
and sys.objauth$.obj#       = c.obj#
and sys.objauth$.col#       = c.col#
and bitand(c.property, 32)  = 0
and sys.objauth$.col#       is not null
and sys.objauth$.privilege# = table_privilege_map.privilege
and u.user#                 = sys.obj$.owner#
and sys.obj$.TYPE#          in (2, 4)
and ue.Name                 not in ('SYS', 'SYSTEM')
and u.Name                  not in ('SYS', 'SYSTEM')
and 'GAL#'||gal.x$users.atl_nrec = ue.name
and 'KATORG'                = sys.obj$.name  
--  and ue.name                 = 'GAL#813E000000000359'
;
```

# Пример UpDate с использованием Переменных в PL\SQL #
```
declare 
SterrOld varchar(100);SterrNew varchar(100);beginSterrOld := '80640000001771A9';SterrNew := '80640000000033B3';  
update gal.oborot obrO set obrO."FKAUOS4"=SterrNew 
  where (obrO.fscheto     = 'T69'       and (obrO.fsubossch  = '03'        or obrO.fsubossch   = '04'        or obrO.fsubossch   = '05'        or obrO.fsubossch   = '06'        or obrO.fsubossch   = '08'        or obrO.fsubossch   = '09'           )     and obrO."FKAUOS[4]" = SterrOld        );  
update gal.oborot obrK set obrK."FKAUKS4"=SterrNew 
  where (obrK.fSCHETK     = 'T69'     and (  obrK.fSUBSCHK    = '03'         or obrK.fSUBSCHK    = '04'         or obrK.fSUBSCHK    = '05'         or obrK.fSUBSCHK    = '06'         or obrK.fSUBSCHK    = '08'         or obrK.fSUBSCHK    = '09'         )     and obrK."FKAUKS[4]" = SterrOld        );  
update gal.saldmoun sld set sld."FKAUOS4"=SterrNew 
  where (sld.fscheto      = 'T69'         and (sld.fsubossch  = '03'          or sld.fsubossch   = '04'          or sld.fsubossch   = '05'          or sld.fsubossch   = '06'          or sld.fsubossch   = '08'          or sld.fsubossch   = '09'             )     and sld."FKAUOS[4]"  = SterrOld        ); dbms_output.put_line('Изменено записей:'||sql%rowcount); commit;  
end;
```