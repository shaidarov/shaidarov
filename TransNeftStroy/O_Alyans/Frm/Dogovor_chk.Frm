.Form Dogovor_Recalc_Summ
.ARD
.Group '�⨫���'
.P 60
.NameInList '������� - ������ �㬬 ������஢ �� ᮣ��襭��'
.var 
 wsu,wsunds :double ;
 wsu_old,wsunds_old :double ;
.endvar
.create view vvv
as select dogovor.nrec
from dogovor,dogovor dogovor1
where (( 0 == dogovor.cdogovor
and dogovor.nrec /== dogovor1.cdogovor
)) ;
.begin
 if username='GALAXY'
 {
 }
 else
 { message('����㯭� ⮫쪮 ��� ���짮��⥫�� GALAXY')
   Dogovor_Recalc_Summ.fexit ;
 }

 end.
.{ table 'vvv.dogovor'
.[H
  �����       ���       ���� �㬬�   ���            ����� �㬬�    ���

.]H
.begin
 if username='GALAXY'
 { wsu_old:=vvv.dogovor.summa ;wsunds_old :=vvv.dogovor.sumnds ;
   wsu:=0 ;wsunds :=0 ;
   vvv._loop fullcache dogovor1
   { wsu:=wsu+vvv.dogovor1.summa;
     wsunds:=wsunds+vvv.dogovor1.sumnds;
   }
   if vvv.dogovor.summa<>wsu
   {  vvv.update current dogovor set dogovor.summa:=wsu,dogovor.sumnds :=wsunds ;
   }
 } //if username='GALAXY'
 end.
.fields
 vvv.dogovor.nodoc
 vvv.dogovor.ddoc
 wsu_old
 wsunds_old
 wsu
 wsunds
.endfields 
!  �����       ���       ���� �㬬�   ���            ����� �㬬�    ���
.{?internal;wsu_old<>vvv.dogovor.summa;
 @@@@@@@@@@@@ @@@@@@@@@@ &&&&&&&&&&&.&& &&&&&&&&&&&.&& &&&&&&&&&&&.&& &&&&&&&&&&&.&&
.} //.{?internal;wsu_old<>vvv.dogovor.summa;
.} //.{ table 'vvv.dogovor'
.endform
