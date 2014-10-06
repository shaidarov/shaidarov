/*
 ╔═══════════════════════════════════════════════════════════════════════════╗
 ║                     (c) 1994,2003 корпорация ГАЛАКТИКА                    ║
 ║ Проект        : ГАЛАКТИКА                                                 ║
 ║ Система       : Клиент - банк                                             ║
 ║ Версия        : 5.84                                                      ║
 ║ Назначение    : Выгрузка платежных документов для АК Транснефть           ║
 ║ Ответственный : Соломатин Владислав Анатольевич                           ║
 ╚═══════════════════════════════════════════════════════════════════════════╝
*/
// отчет формирует реестр платежек для банка с конкретными счетами для РЦК
// с новыми полями согласно УКАЗАНИЮ ЦБ РФ от 3.03.2003 N 1256-У
.form 'v_OPERU_RKC'
.ARD
.Group 'Выгрузка платежей'
!.NameInList 'Выгрузка платежек (РКЦ). Формат 1С.'
.NameInList 'Валютные платежные поручения за указанную дату для РЦК'
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
   comp('013E000000000146h') == attrval.cattrnam      and  //код атрибута "Подразделение для РЦК"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //код внешнего классификатора "Бюджетная классификация"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC == EXCLASSVAL.CREC       and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31//Валютные Собственные платежные поручения
!           and b2.schet1 = '' //СЧЕТ РКЦ
;
.begin
  co1 :=0;     // счетчик выгруженных документов
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//Шапка платежного документа
if (p.tidk=1,DocBasFn866To1251('СекцияДокумент=Платежное поручение'),DocBasFn866To1251('СекцияДокумент=Платежное требование'))
DocBasFn866To1251('Номер='+p.nodok)
DocBasFn866To1251('Дата='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('Сумма='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//реквизиты плательщика
DocBasFn866To1251('ПлательщикСчет='+b2.schet1)
DocBasFn866To1251('ПлательщикИНН='+o2.UNN)
DocBasFn866To1251('ПлательщикКПП='+o2.KODPLATNDS)
DocBasFn866To1251('Плательщик=ООО "Транснефть Финанс"')
DocBasFn866To1251('ПлательщикБИК='+b2.mfo1)
//реквизиты получателя
DocBasFn866To1251('ПолучательСчет='+b1.schet1)
DocBasFn866To1251('ПолучательИНН='+o1.unn)
DocBasFn866To1251('ПолучательКПП='+o1.KODPLATNDS)
DocBasFn866To1251('Получатель='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('ПолучательБИК='+b1.mfo1)
//реквизиты платежа
DocBasFn866To1251('ВидПлатежа='+'')
DocBasFn866To1251('ВидОплаты='+p.vidoper)
DocBasFn866To1251('Очередность='+p.kodnew)
//для РЦК
DocBasFn866To1251('АналитическийКлассификатор=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('Классификатор1=')+spkau.code

DocBasFn866To1251('НазначениеПлатежа='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//Дополнительные реквизиты для платежей в бюджетную систему РФ
DocBasFn866To1251('СтатусСоставителя='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('ПоказательКБК='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('ОКАТО='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('ПоказательОснования='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('ПоказательПериода='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('ПоказательНомера='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('ПоказательДаты='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('ПоказательТипа='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('Коментарий=')
//Конец платежного документа
DocBasFn866To1251('КонецДокумента')
//Конец реестра платежных документов
DocBasFn866To1251('КонецФайла')
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
.Group 'Выгрузка платежей'
.NameInList 'Валютные платежные поручения за указанную дату для РЦК (только исполняемые с заполненными статьями)'
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
                  comp('16') == p.CCLASSBUH (noindex) and  //со статусом "исполняемый"
                      P.NREC == attrval.crec          and
                        9015 == attrval.wtable        and
   comp('013E000000000146h') == attrval.cattrnam      and  //код атрибута "Подразделение для РЦК"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //код внешнего классификатора "Бюджетная классификация"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31 //Собственные платежные поручения
!           and b2.schet1 = '' //СЧЕТ РКЦ
;
.begin
  co1 :=0;     // счетчик выгруженных документов
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//Шапка платежного документа
if (p.tidk=1,DocBasFn866To1251('СекцияДокумент=Платежное поручение'),DocBasFn866To1251('СекцияДокумент=Платежное требование'))
DocBasFn866To1251('Номер='+p.nodok)
DocBasFn866To1251('Дата='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('Сумма='+DoubleToStr(round(p.sumplat,2),'666666666666666666666.88'))
//реквизиты плательщика
DocBasFn866To1251('ПлательщикСчет='+b2.schet1)
DocBasFn866To1251('ПлательщикИНН='+o2.UNN)
DocBasFn866To1251('ПлательщикКПП='+o2.KODPLATNDS)
DocBasFn866To1251('Плательщик=ООО "Транснефть Финанс"')
DocBasFn866To1251('ПлательщикБИК='+b2.mfo1)
//реквизиты получателя
DocBasFn866To1251('ПолучательСчет='+b1.schet1)
DocBasFn866To1251('ПолучательИНН='+o1.unn)
DocBasFn866To1251('ПолучательКПП='+o1.KODPLATNDS)
DocBasFn866To1251('Получатель='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('ПолучательБИК='+b1.mfo1)
//реквизиты платежа
DocBasFn866To1251('ВидПлатежа='+'')
DocBasFn866To1251('ВидОплаты='+p.vidoper)
DocBasFn866To1251('Очередность='+p.kodnew)
//для РЦК
DocBasFn866To1251('АналитическийКлассификатор=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('Классификатор1=')+spkau.code

DocBasFn866To1251('НазначениеПлатежа='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//Дополнительные реквизиты для платежей в бюджетную систему РФ
DocBasFn866To1251('СтатусСоставителя='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('ПоказательКБК='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('ОКАТО='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('ПоказательОснования='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('ПоказательПериода='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('ПоказательНомера='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('ПоказательДаты='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('ПоказательТипа='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('Коментарий=')
//Конец платежного документа
DocBasFn866To1251('КонецДокумента')
//Конец реестра платежных документов
DocBasFn866To1251('КонецФайла')
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
.Group 'Выгрузка платежей'
.NameInList 'Валютные платежные поручения за указанную дату для РЦК (только с заполненными статьями)'
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
   comp('013E000000000146h') == attrval.cattrnam      and  //код атрибута "Подразделение для РЦК"
               attrval.VCOMP == SpKAU.nrec            and
                   word(100) == EXCLASSNAME.CLASSCODE and  //код внешнего классификатора "Бюджетная классификация"
                        9015 == EXCLASSNAME.wtable    and
       EXCLASSNAME.CLASSCODE == EXCLASSval.CLASSCODE  and
                        9015 == EXCLASSval.wtable     and
                      P.NREC /== EXCLASSVAL.CREC      and
        EXCLASSval.CCLASSSEG == EXCLASSSEG.NREC
             ))
           and  p.datvip = DataDBF
           and  p.tidkgal = 31 //Собственные платежные поручения
;
.begin
  co1 :=0;     // счетчик выгруженных документов
  set DataDBF := Cur_date
  RunDialog('D_DAT',DataDBF);
end.
.fields
//Шапка платежного документа
if (p.tidk=1,DocBasFn866To1251('СекцияДокумент=Платежное поручение'),DocBasFn866To1251('СекцияДокумент=Платежное требование'))
DocBasFn866To1251('Номер='+p.nodok)
DocBasFn866To1251('Дата='+Replace(String(p.datvip),'/','.'))
DocBasFn866To1251('Сумма='+DoubleToStr(round(p.sumplat),'666666666666666666666.88'))
//реквизиты плательщика
DocBasFn866To1251('ПлательщикСчет='+b2.schet1)
DocBasFn866To1251('ПлательщикИНН='+o2.UNN)
DocBasFn866To1251('ПлательщикКПП='+o2.KODPLATNDS)
DocBasFn866To1251('Плательщик=ООО "Транснефть Финанс"')
DocBasFn866To1251('ПлательщикБИК='+b2.mfo1)
//реквизиты получателя
DocBasFn866To1251('ПолучательСчет='+b1.schet1)
DocBasFn866To1251('ПолучательИНН='+o1.unn)
DocBasFn866To1251('ПолучательКПП='+o1.KODPLATNDS)
DocBasFn866To1251('Получатель='+o1.tiporg+' '+o1.name+' '+b1.remark)
DocBasFn866To1251('ПолучательБИК='+b1.mfo1)
//реквизиты платежа
DocBasFn866To1251('ВидПлатежа='+'')
DocBasFn866To1251('ВидОплаты='+p.vidoper)
DocBasFn866To1251('Очередность='+p.kodnew)
//для РЦК
DocBasFn866To1251('АналитическийКлассификатор=')+Replace(exclassseg.value,'-','')
DocBasFn866To1251('Классификатор1=')+spkau.code

DocBasFn866To1251('НазначениеПлатежа='+Replace(substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,1,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,76,75)+substr(p.namepl1+p.namepl2+p.namepl3+p.namepl4,151,75),'"',''''))

//Дополнительные реквизиты для платежей в бюджетную систему РФ
DocBasFn866To1251('СтатусСоставителя='+ExtractDelimitedWord(p.tax,1,';'))    //tax_status
DocBasFn866To1251('ПоказательКБК='+ExtractDelimitedWord(p.tax,2,';'))        //tax_kbk
DocBasFn866To1251('ОКАТО='+ExtractDelimitedWord(p.tax,3,';'))                //okato
DocBasFn866To1251('ПоказательОснования='+ExtractDelimitedWord(p.tax,4,';'))  //tax_reason
DocBasFn866To1251('ПоказательПериода='+ExtractDelimitedWord(p.tax,5,';'))    //tax_period
DocBasFn866To1251('ПоказательНомера='+ExtractDelimitedWord(p.tax,6,';'))     //tax_number
DocBasFn866To1251('ПоказательДаты='+ExtractDelimitedWord(p.tax,7,';'))       //tax_date
DocBasFn866To1251('ПоказательТипа='+ExtractDelimitedWord(p.tax,8,';'))       //tax_type
DocBasFn866To1251('Коментарий=')
//Конец платежного документа
DocBasFn866To1251('КонецДокумента')
//Конец реестра платежных документов
DocBasFn866To1251('КонецФайла')
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
