/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                     (c) 1994,2003 ��牆���罔� ���������                    �
 � 蹍オ�        : ���������                                                 �
 � ��痰ガ�       : ��┘�� - ����                                             �
 � �ム瓱�        : 5.84                                                      �
 � ��Л�腑�┘    : �襭珮И� ���皀Ν諷 ぎ�祠キ皰� か� �� ����甅ヤ碎           �
 � �癶モ痰▲��覃 : ������皋� ���え甄�� ���皰�譽※�                           �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*/
// �砒モ 筮爼�珮モ 爛メ矗 ���皀Ε� か� ����� � ����爛皚覓� 瘍モ��� か� ���
// � ���覓� ���鍖� 甌���甅� �������� �� �� �� 3.03.2003 N 1256-�
.form 'v_OPERU_RKC'
.ARD
.Group '�襭珮И� ���皀Ε�'
!.NameInList '�襭珮И� ���皀Ε� (���). ��爼�� 1�.'
.NameInList '���鈞�襯 ���皀Ν襯 ��珮腑��� �� 礫�����竡 ��矣 か� ���'
!.F 'H:\Oragal\BANK_CLI\RKC\1c_to_kl.txt'
.F '%StartPath%_RKC\v_OPERU_RKC.txt'
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
   comp('013E000000000146h') == attrval.cattrnam      and  //��� �矗─竄� "��む�Гカキ┘ か� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ↓ヨ�ィ� ���瘁�筥��皰�� "�遒Ε皚�� ���瘁�筥��罔�"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC == EXCLASSVAL.CREC       and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31//���鈞�襯 ��＝癶キ�襯 ���皀Ν襯 ��珮腑���
!           and b2.schet1 = '' //���� ���
;
.begin
  co1 :=0;     // 瘍モ腮� �襭珮Ε��諷 ぎ�祠キ皰�
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���皀Ν��� ぎ�祠キ��
if (p.tidk=1,DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� ��珮腑�┘'),DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� 矗ァ����┘'))
DocBasFn866To1251('���ム='+p.nodok)
DocBasFn866To1251('����='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�祠��='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//爛�※Ж硅 ���皀�跚┴�
DocBasFn866To1251('���皀�跚┴�腑�='+b2.schet1)
DocBasFn866To1251('���皀�跚┴���='+o2.UNN)
DocBasFn866To1251('���皀�跚┴���='+o2.KODPLATNDS)
DocBasFn866To1251('���皀�跚┴=��� "����甅ヤ碎 �┃���"')
DocBasFn866To1251('���皀�跚┴���='+b2.mfo1)
//爛�※Ж硅 ���竍�皀��
DocBasFn866To1251('���竍�皀���腑�='+b1.schet1)
DocBasFn866To1251('���竍�皀�����='+o1.unn)
DocBasFn866To1251('���竍�皀�����='+o1.KODPLATNDS)
DocBasFn866To1251('���竍�皀��='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('���竍�皀�����='+b1.mfo1)
//爛�※Ж硅 ���皀��
DocBasFn866To1251('�┐���皀��='+'')
DocBasFn866To1251('�┐ｯ��硅='+p.vidoper)
DocBasFn866To1251('�腑爛き�痰�='+p.kodnew)
//か� ���
DocBasFn866To1251('�����皋腑瓷┤���瘁�筥��皰�=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('���瘁�筥��皰�1=')+spkau.code

DocBasFn866To1251('��Л�腑�┘���皀��='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������皀�讚襯 爛�※Ж硅 か� ���皀Ε� � ℃うモ�竡 瓱痰ガ� ��
DocBasFn866To1251('���矣���痰�※皀��='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������皀�����='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������皀���甅������='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������皀���ム┏��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������皀�����ム�='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������皀����硅='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������皀���┓�='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('���キ��爬�=')
//���ユ ���皀Ν��� ぎ�祠キ��
DocBasFn866To1251('���ユ���祠キ��')
//���ユ 爛メ矗� ���皀Ν諷 ぎ�祠キ皰�
DocBasFn866To1251('���ユ�����')
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

.form 'v_OPERU_RCK_KBK_STATUS'
.ARD
.Group '�襭珮И� ���皀Ε�'
.NameInList '���鈞�襯 ���皀Ν襯 ��珮腑��� �� 礫�����竡 ��矣 か� ��� (皰�讓� �甎���錺�襯 � ������キ�覓� 痰�碎鍖�)'
.F '%StartPath%_RKC\v_OPERU_RCK_KBK_STATUS.txt'
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
                  comp('16') == p.CCLASSBUH (noindex) and  //甌 痰�矣甌� "�甎���錺�覃"
                      P.NREC == attrval.crec          and
                        9015 == attrval.wtable        and
   comp('013E000000000146h') == attrval.cattrnam      and  //��� �矗─竄� "��む�Гカキ┘ か� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ↓ヨ�ィ� ���瘁�筥��皰�� "�遒Ε皚�� ���瘁�筥��罔�"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31 //��＝癶キ�襯 ���皀Ν襯 ��珮腑���
!           and b2.schet1 = '' //���� ���
;
.begin
  co1 :=0;     // 瘍モ腮� �襭珮Ε��諷 ぎ�祠キ皰�
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���皀Ν��� ぎ�祠キ��
if (p.tidk=1,DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� ��珮腑�┘'),DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� 矗ァ����┘'))
DocBasFn866To1251('���ム='+p.nodok)
DocBasFn866To1251('����='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�祠��='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//爛�※Ж硅 ���皀�跚┴�
DocBasFn866To1251('���皀�跚┴�腑�='+b2.schet1)
DocBasFn866To1251('���皀�跚┴���='+o2.UNN)
DocBasFn866To1251('���皀�跚┴���='+o2.KODPLATNDS)
DocBasFn866To1251('���皀�跚┴=��� "����甅ヤ碎 �┃���"')
DocBasFn866To1251('���皀�跚┴���='+b2.mfo1)
//爛�※Ж硅 ���竍�皀��
DocBasFn866To1251('���竍�皀���腑�='+b1.schet1)
DocBasFn866To1251('���竍�皀�����='+o1.unn)
DocBasFn866To1251('���竍�皀�����='+o1.KODPLATNDS)
DocBasFn866To1251('���竍�皀��='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('���竍�皀�����='+b1.mfo1)
//爛�※Ж硅 ���皀��
DocBasFn866To1251('�┐���皀��='+'')
DocBasFn866To1251('�┐ｯ��硅='+p.vidoper)
DocBasFn866To1251('�腑爛き�痰�='+p.kodnew)
//か� ���
DocBasFn866To1251('�����皋腑瓷┤���瘁�筥��皰�=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('���瘁�筥��皰�1=')+spkau.code

DocBasFn866To1251('��Л�腑�┘���皀��='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������皀�讚襯 爛�※Ж硅 か� ���皀Ε� � ℃うモ�竡 瓱痰ガ� ��
DocBasFn866To1251('���矣���痰�※皀��='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������皀�����='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������皀���甅������='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������皀���ム┏��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������皀�����ム�='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������皀����硅='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������皀���┓�='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('���キ��爬�=')
//���ユ ���皀Ν��� ぎ�祠キ��
DocBasFn866To1251('���ユ���祠キ��')
//���ユ 爛メ矗� ���皀Ν諷 ぎ�祠キ皰�
DocBasFn866To1251('���ユ�����')
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
.form 'v_OPERU_RCK_KBK'
.ARD
.Group '�襭珮И� ���皀Ε�'
.NameInList '���鈞�襯 ���皀Ν襯 ��珮腑��� �� 礫�����竡 ��矣 か� ��� (皰�讓� � ������キ�覓� 痰�碎鍖�)'
.F '%StartPath%_RKC\v_OPERU_RCK_KBK.txt'
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
   comp('013E000000000146h') == attrval.cattrnam      and  //��� �矗─竄� "��む�Гカキ┘ か� ���"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //��� ↓ヨ�ィ� ���瘁�筥��皰�� "�遒Ε皚�� ���瘁�筥��罔�"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31 //��＝癶キ�襯 ���皀Ν襯 ��珮腑���
;
.begin
  co1 :=0;     // 瘍モ腮� �襭珮Ε��諷 ぎ�祠キ皰�
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//����� ���皀Ν��� ぎ�祠キ��
if (p.tidk=1,DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� ��珮腑�┘'),DocBasFn866To1251('�オ罔����祠キ�=���皀Ν�� 矗ァ����┘'))
DocBasFn866To1251('���ム='+p.nodok)
DocBasFn866To1251('����='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('�祠��='+DoubleToStr(round(p.sumplat),'666666666666666666666.88'))
//爛�※Ж硅 ���皀�跚┴�
DocBasFn866To1251('���皀�跚┴�腑�='+b2.schet1)
DocBasFn866To1251('���皀�跚┴���='+o2.UNN)
DocBasFn866To1251('���皀�跚┴���='+o2.KODPLATNDS)
DocBasFn866To1251('���皀�跚┴=��� "����甅ヤ碎 �┃���"')
DocBasFn866To1251('���皀�跚┴���='+b2.mfo1)
//爛�※Ж硅 ���竍�皀��
DocBasFn866To1251('���竍�皀���腑�='+b1.schet1)
DocBasFn866To1251('���竍�皀�����='+o1.unn)
DocBasFn866To1251('���竍�皀�����='+o1.KODPLATNDS)
DocBasFn866To1251('���竍�皀��='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('���竍�皀�����='+b1.mfo1)
//爛�※Ж硅 ���皀��
DocBasFn866To1251('�┐���皀��='+'')
DocBasFn866To1251('�┐ｯ��硅='+p.vidoper)
DocBasFn866To1251('�腑爛き�痰�='+p.kodnew)
//か� ���
DocBasFn866To1251('�����皋腑瓷┤���瘁�筥��皰�=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('���瘁�筥��皰�1=')+spkau.code

DocBasFn866To1251('��Л�腑�┘���皀��='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//�������皀�讚襯 爛�※Ж硅 か� ���皀Ε� � ℃うモ�竡 瓱痰ガ� ��
DocBasFn866To1251('���矣���痰�※皀��='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('������皀�����='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('�����='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('������皀���甅������='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('������皀���ム┏��='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('������皀�����ム�='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('������皀����硅='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('������皀���┓�='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('���キ��爬�=')
//���ユ ���皀Ν��� ぎ�祠キ��
DocBasFn866To1251('���ユ���祠キ��')
//���ユ 爛メ矗� ���皀Ν諷 ぎ�祠キ皰�
DocBasFn866To1251('���ユ�����')
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
