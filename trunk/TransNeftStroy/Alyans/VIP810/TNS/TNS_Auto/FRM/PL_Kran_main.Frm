.linkform 'PL_Kran_main_TNS' prototype is 'putway'
.NameInList  'TNS Форма для автокрана (Excel)'
.F "NUL"
.group 'Кран'
.group 'Список П/Л'
.group 'Реестр П/Л'
.group 'Полный Кран'
.group 'Полный'
.group 'Кран TNS'
.group 'Полный Кран TNS'
.group 'Формы TNS'
.var
 sZakOrg :string;
.endvar
.Create view vZakName //as select putlst.npl, katzak.EXITCH, katzak.EXITDN, katorg.name //получить имя заказчиков в заказах ПЛ
var
 PutLst_Nrec :comp;
from
        katorg,
        katzak
where
        ((
                  PutLst_Nrec    == katzak.cputlst
           and katzak.corg     == katorg.nrec
        ))
order by katzak.EXITDN,katzak.EXITCH;

#include excel_fun.frn
#include MyGetInitial.Frn
.fields
MyxlWrite(GarNom,2,9,3)
MyxlWrite(Npl,2,16,3)
MyxlWrite(NameOrg ,3,2,3)
MyxlWrite(Marka ,5,8,3)
MyxlWrite(SpeedExi,5,31,3)
MyxlWrite(Gnom,7,9,3)
MyxlWrite(Addr ,9,3,3)
MyxlWrite(NameOrg + if(instr('Спецморнефтепорт Приморск',Zak_name1)>0,' ', ' / '+Zak_name1), 9,12,3)
MyxlWrite(Fio1,14,12,3)
MyxlWrite(MyGetInitial(Fio1,False),11,30,3)
//MyxlWrite(ExitCh ,13,32,3)
MyxlWrite('"'+DayDatPl+'" '+MesDatPl+' '+YearDatpl+' г.' ,11,13,3)
//MyxlWrite(MyGetInitial(Fio1,False) ,2,9,3)
MyxlWrite(Tabn1,16,15,3)
MyxlWrite(Nudov1,15,15,3)
MyxlWrite(IF (TworkGsm = 1 or OctatExiDvi1<>0, word(OctatExiDvi1),' ') ,20,30,3)
MyxlWrite(ToplDvi1,21,30,3)
!MyxlWrite(If((NameOrg= sZakOrg) AND (NameOrg<> Zak_name1) AND (Zak_name1<>''),NameOrg + ' / ' + Zak_name1, Zak_name1), 21,2,3)
!MyxlWrite(If((NameOrg= sZakOrg) AND (NameOrg<> Zak_name2) AND (Zak_name2<>''),NameOrg + ' / ' + Zak_name2, Zak_name2), 22,2,3)
!MyxlWrite(If((NameOrg= sZakOrg) AND (NameOrg<> Zak_name3) AND (Zak_name3<>''),NameOrg + ' / ' + Zak_name3, Zak_name3), 23,2,3)
!MyxlWrite(If((NameOrg= sZakOrg) AND (NameOrg<> Zak_name4) AND (Zak_name4<>''),NameOrg + ' / ' + Zak_name4, Zak_name4), 24,2,3)
!MyxlWrite(If((NameOrg= sZakOrg) AND (NameOrg<> Zak_name5) AND (Zak_name5<>''),NameOrg + ' / ' + Zak_name5, Zak_name5), 25,2,3)
MyxlWrite(Zak_march1,21,15,3)
MyxlWrite(Zak_march2,22,15,3)
MyxlWrite(Zak_march3,23,15,3)
MyxlWrite(Zak_march4,24,15,3)
MyxlWrite(Zak_march5,25,15,3)
MyxlWrite(MyGetInitial(Fio1,False) ,29,30,3)
MyxlWrite(MyGetInitial(Sgettune('USER.FIO'),False), 14,31,3)
MyxlWrite(MyGetInitial(Fio1,False),39,4,3)
.endfields
.{
.begin
 sZakOrg:='';
 vZakName.PutLst_Nrec:= Nrec_Pl;
 if vZakName.getfirst katzak = 0 {};
 if vZakName.getfirst katorg = 0 {};
 sZakOrg := vZakName.KatOrg.Name;
 MyXlInit('AVTO_PutLstCrane.xls')
 end.
Гаражный номер ^
Путевой лист №	^
Организация	   ^
Марка крана	автомобильного (стрелового самоходного крана)	^
Гос. номер ^
Адрес	^	Заявка № _______
От цеха (отдела),предприятия ^
Шофёр-крановщик	^
Выезд из гаража	@@@@@		Дата с  ^
Шофер-крановщик	^
Таб.N ^
удостоверение  	^
Замер остатка  при  выезде	^
выдано	^
Zak_name1 Zak_name2 Zak_name3 Zak_name4 Zak_name5
^
^
^
^
^
Fio1 ^
Диспетчер ^
Шофер-крановщик	^
.{
.}
.{
.}
.{
.}
.{
.}
.{
.{
.}
.{
.{
.}
.{
.}
.{
.}
.}
.{
.{
.}
.}
.{
.}
.}
.if BrPutWay
.end
.begin
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  fbasname:='PL_Crane_'+NPL ;
  fbasname:=replace(fbasname,'\','')
  fbasname:=replace(fbasname,'/','')
  fbasname:=replace(fbasname,'_','')
  fbasname:=replace(fbasname,'.','')
  fbasname:=replace(fbasname,':','')
  fbasname:=MyExDirectoryOut+fbasname+'.xls'

 if fileexist(fbasname) deletefile(fbasname)
 if fileexist(fbasname) deletefile(fbasname)
 if xlSaveAsWorkBookByName(wPictbook, fbasname)
 { // xlCloseWorkBookByName(wPictBook) ;
 }
 If (not xlKillExcel) then message ('xlKillExcel=false');
 end.
.}
.endform