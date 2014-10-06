/*
 ���������������������������������������������������������������������������ͻ
 �                     (c) 1994,2003 ��௮��� ���������                    �
 � �஥��        : ���������                                                 �
 � ���⥬�       : ������ - ����                                             �
 � �����        : 5.84                                                      �
 � �����祭��    : ���㧪� ���⥦��� ���㬥�⮢ ��� �� �࠭᭥���           �
 � �⢥��⢥��� : ������⨭ �����᫠� ���⮫쥢��                           �
 ���������������������������������������������������������������������������ͼ
*/
// ���� �ନ��� ॥��� ���⥦�� ��� ����� � ������묨 ��⠬� ��� ���
// � ���묨 ���ﬨ ᮣ��᭮ �������� �� �� �� 3.03.2003 N 1256-�
.form 'OPERU_RKC'
.ARD
.Group '���㧪� ���⥦��'
.NameInList '���⥦�� ����祭�� �� 㪠������ ���� ��� ���'
.F '%StartPath%_RKC\OPERU_RKC.txt'
.var
  DataDBF  : Date;
  liHandle : LongInt;
  co1      : Double;
  RaschSchet : comp;
 wRaschSchet : word;
.endVar
.Create view TN1
as select *
   from
       plpor p,
       katorg o1,
       katorg o2,
       katbank b1,
       katbank b2,
       EXCLASSNAME,
       EXCLASSval,
       EXCLASSSEG,
       attrval,
       spkau
     , CashBank
     , UsersDoc
   where ((           p.cpol == o1.nrec               and
                     p.cplat == o2.nrec               and
                  p.cbankpol == b1.nrec               and
                 p.cbankplat == b2.nrec               and
                      P.NREC == attrval.crec          and
                        9015 == attrval.wtable        and
   comp('013E000000000146h') == attrval.cattrnam      and  //��� ��ਡ�� "���ࠧ������� ��� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ���譥�� �����䨪��� "��⭠� �����䨪���"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC == EXCLASSVAL.CREC       and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip  = DataDBF
           and  p.tidkgal = 1//�����s����� ���⥦�� ����祭��
!           and b2.schet1 = '' //���� ���
;
.begin
  co1 :=0;     // ���稪 ���㦥���� ���㬥�⮢
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���⥦���� ���㬥��
if (p.tidk=1,DocBasFn866To1251('�����㬥��=���⥦��� ����祭��'),DocBasFn866To1251('�����㬥��=���⥦��� �ॡ������'))
DocBasFn866To1251('�����='+p.nodok)
DocBasFn866To1251('���='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�㬬�='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//४������ ���⥫�騪�
DocBasFn866To1251('���⥫�騪���='+b2.schet1)
DocBasFn866To1251('���⥫�騪���='+o2.UNN)
DocBasFn866To1251('���⥫�騪���='+o2.KODPLATNDS)
DocBasFn866To1251('���⥫�騪=��� "�࠭᭥��� ������"')
DocBasFn866To1251('���⥫�騪���='+b2.mfo1)
//४������ �����⥫�
DocBasFn866To1251('�����⥫���='+b1.schet1)
DocBasFn866To1251('�����⥫숍�='+o1.unn)
DocBasFn866To1251('�����⥫슏�='+o1.KODPLATNDS)
DocBasFn866To1251('�����⥫�='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('�����⥫쁈�='+b1.mfo1)
//४������ ���⥦�
DocBasFn866To1251('������⥦�='+'')
DocBasFn866To1251('���������='+p.vidoper)
DocBasFn866To1251('��।�����='+p.kodnew)
//��� ���
DocBasFn866To1251('�������᪨������䨪���=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('�����䨪���1=')+spkau.code

DocBasFn866To1251('�����祭�����⥦�='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������⥫�� ४������ ��� ���⥦�� � ����� ��⥬� ��
DocBasFn866To1251('����ᑮ�⠢�⥫�='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������⥫슁�='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������⥫�᭮�����='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������⥫쏥ਮ��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������⥫썮���='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������⥫선��='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������⥫쒨��='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('������਩=')
//����� ���⥦���� ���㬥��
DocBasFn866To1251('����愮�㬥��')
//����� ॥��� ���⥦��� ���㬥�⮢
DocBasFn866To1251('����攠���')
.endfields
1CClientBankExchange
.{table 'tn1'
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
.}
^
.endform
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

.form 'OPERU_RCK_KBK_STATUS'
.ARD
.Group '���㧪� ���⥦��'
.NameInList '���⥦�� ����祭�� �� 㪠������ ���� ��� ��� (⮫쪮 �ᯮ��塞� � ���������묨 ����ﬨ)'
!.F '\\as02-tnf.tnf.transneft.ru\BANK_CLI\SBERBANK\DON\operu_from_gal.txt'
!.F '\\Gal01-tns\GalSrv\RKC\operu_from_gal.txt'
.F '%StartPath%_RKC\OPERU_RCK_KBK_STATUS.txt'
.var
  DataDBF  : Date;
  liHandle : LongInt;
  co1      : Double;
.endVar
.Create view TN1
as select *
   from
       plpor p,
       katorg o1,
       katorg o2,
       katbank b1,
       katbank b2,
       EXCLASSNAME,
       EXCLASSval,
       EXCLASSSEG,
       attrval,
       spkau
   where ((           p.cpol == o1.nrec               and
                     p.cplat == o2.nrec               and
                  p.cbankpol == b1.nrec               and
                 p.cbankplat == b2.nrec               and
                  comp('16') == p.CCLASSBUH (noindex) and  //� ����ᮬ "�ᯮ��塞�"
                      P.NREC == attrval.crec          and
                        9015 == attrval.wtable        and
   comp('013E000000000146h') == attrval.cattrnam      and  //��� ��ਡ�� "���ࠧ������� ��� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ���譥�� �����䨪��� "��⭠� �����䨪���"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 1 //����⢥��� ���⥦�� ����祭��
!           and b2.schet1 = '' //���� ���
;
.begin
  co1 :=0;     // ���稪 ���㦥���� ���㬥�⮢
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���⥦���� ���㬥��
if (p.tidk=1,DocBasFn866To1251('�����㬥��=���⥦��� ����祭��'),DocBasFn866To1251('�����㬥��=���⥦��� �ॡ������'))
DocBasFn866To1251('�����='+p.nodok)
DocBasFn866To1251('���='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�㬬�='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//४������ ���⥫�騪�
DocBasFn866To1251('���⥫�騪���='+b2.schet1)
DocBasFn866To1251('���⥫�騪���='+o2.UNN)
DocBasFn866To1251('���⥫�騪���='+o2.KODPLATNDS)
DocBasFn866To1251('���⥫�騪=��� "�࠭᭥��� ������"')
DocBasFn866To1251('���⥫�騪���='+b2.mfo1)
//४������ �����⥫�
DocBasFn866To1251('�����⥫���='+b1.schet1)
DocBasFn866To1251('�����⥫숍�='+o1.unn)
DocBasFn866To1251('�����⥫슏�='+o1.KODPLATNDS)
DocBasFn866To1251('�����⥫�='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('�����⥫쁈�='+b1.mfo1)
//४������ ���⥦�
DocBasFn866To1251('������⥦�='+'')
DocBasFn866To1251('���������='+p.vidoper)
DocBasFn866To1251('��।�����='+p.kodnew)
//��� ���
DocBasFn866To1251('�������᪨������䨪���=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('�����䨪���1=')+spkau.code

DocBasFn866To1251('�����祭�����⥦�='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������⥫�� ४������ ��� ���⥦�� � ����� ��⥬� ��
DocBasFn866To1251('����ᑮ�⠢�⥫�='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������⥫슁�='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������⥫�᭮�����='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������⥫쏥ਮ��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������⥫썮���='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������⥫선��='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������⥫쒨��='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('������਩=')
//����� ���⥦���� ���㬥��
DocBasFn866To1251('����愮�㬥��')
//����� ॥��� ���⥦��� ���㬥�⮢
DocBasFn866To1251('����攠���')
.endfields
1CClientBankExchange
.{table 'tn1'
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
.}
^
.endform
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
.form 'OPERU_RCK_KBK'
.ARD
.Group '���㧪� ���⥦��'
.NameInList '���⥦�� ����祭�� �� 㪠������ ���� ��� ��� (⮫쪮 � ���������묨 ����ﬨ)'
!.F '\\as02-tnf.tnf.transneft.ru\BANK_CLI\SBERBANK\DON\operu_from_gal.txt'
.F '%StartPath%_RKC\OPERU_RCK_KBK.txt'
.var
  DataDBF  : Date;
  liHandle : LongInt;
  co1      : Double;
.endVar
.Create view TN1
as select *
   from
       plpor p,
       katorg o1,
       katorg o2,
       katbank b1,
       katbank b2,
       EXCLASSNAME,
       EXCLASSval,
       EXCLASSSEG,
       attrval,
       spkau
   where ((           p.cpol == o1.nrec               and
                     p.cplat == o2.nrec               and
                  p.cbankpol == b1.nrec               and
                 p.cbankplat == b2.nrec               and
                      P.NREC == attrval.crec          and
                        9015 == attrval.wtable        and
   comp('013E000000000146h') == attrval.cattrnam      and  //��� ��ਡ�� "���ࠧ������� ��� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ���譥�� �����䨪��� "��⭠� �����䨪���"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 1 //����⢥��� ���⥦�� ����祭��
;
.begin
  co1 :=0;     // ���稪 ���㦥���� ���㬥�⮢
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���⥦���� ���㬥��
if (p.tidk=1,DocBasFn866To1251('�����㬥��=���⥦��� ����祭��'),DocBasFn866To1251('�����㬥��=���⥦��� �ॡ������'))
DocBasFn866To1251('�����='+p.nodok)
DocBasFn866To1251('���='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�㬬�='+DoubleToStr(round(p.sumplat),'666666666666666666666.88'))
//४������ ���⥫�騪�
DocBasFn866To1251('���⥫�騪���='+b2.schet1)
DocBasFn866To1251('���⥫�騪���='+o2.UNN)
DocBasFn866To1251('���⥫�騪���='+o2.KODPLATNDS)
DocBasFn866To1251('���⥫�騪=��� "�࠭᭥��� ������"')
DocBasFn866To1251('���⥫�騪���='+b2.mfo1)
//४������ �����⥫�
DocBasFn866To1251('�����⥫���='+b1.schet1)
DocBasFn866To1251('�����⥫숍�='+o1.unn)
DocBasFn866To1251('�����⥫슏�='+o1.KODPLATNDS)
DocBasFn866To1251('�����⥫�='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('�����⥫쁈�='+b1.mfo1)
//४������ ���⥦�
DocBasFn866To1251('������⥦�='+'')
DocBasFn866To1251('���������='+p.vidoper)
DocBasFn866To1251('��।�����='+p.kodnew)
//��� ���
DocBasFn866To1251('�������᪨������䨪���=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('�����䨪���1=')+spkau.code

DocBasFn866To1251('�����祭�����⥦�='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������⥫�� ४������ ��� ���⥦�� � ����� ��⥬� ��
DocBasFn866To1251('����ᑮ�⠢�⥫�='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������⥫슁�='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������⥫�᭮�����='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������⥫쏥ਮ��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������⥫썮���='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������⥫선��='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������⥫쒨��='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('������਩=')
//����� ���⥦���� ���㬥��
DocBasFn866To1251('����愮�㬥��')
//����� ॥��� ���⥦��� ���㬥�⮢
DocBasFn866To1251('����攠���')
.endfields
1CClientBankExchange
.{table 'tn1'
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
^
.}
^
.endform
