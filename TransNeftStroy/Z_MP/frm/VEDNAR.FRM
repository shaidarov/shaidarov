/*
 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
 º                     (c) 1994,97 ª®à¯®à æ¨ï ƒ€‹€Š’ˆŠ€                      º
 º à®¥ªâ        : ƒ€‹€Š’ˆŠ€                                                 º
 º ‘¨áâ¥¬        : ‡ à ¡®â­ ï ¯« â                                           º
 º ‚¥àá¨ï        : 5.50                                                      º
 º â¢¥âáâ¢¥­­ë© : ‹¨á¨æ   â «ìï Œ¨å ©«®¢­                                  º
 º  §­ ç¥­¨¥    : ‚¥¤®¬®áâ¨ ¯® ­ àï¤ ¬                                      º
 º                                                                           º
 º ˆ§¬¥­¥­¨ï                                                                 º
 º     €¢â®à: Š®à§îª ‚.”.         „ â : 13.10.98                             º
 º     –¥«ì : „®¡ ¢«¥­  (  ª®¥ £¤¥ ¨ ¨á¯®«ì§®¢ ­ ) ¢®§¬®¦­®áâì à §àë¢        º
 º            áâà ­¨æë ¬¥¦¤ã ¯¥ç â ¥¬ë¬¨ ¤®ªã¬¥­â ¬¨ (á®¡ëâ¨¥ PageBreak).    º
 º                                                                           º
 º     €¢â®à: ___________________ „ â : __________________                   º
 º     –¥«ì : ____________________________________________                   º
 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
*/

#doc
‚¥¤®¬®áâ¨ ¯® ­ àï¤ ¬
#end
.form VedNar
.uniqueconsts
.hide
.p 60
.fields
  Npred
  dat1
  DepartmentName
  BrigadeName
  JobSheetName
  SYS_NAR_NREC
  SalaryAlgorithm
  PremiumAlgorithm

!‹¨æ¥¢ ï áâ®à®­ 
  KodVidOplNar
  NaimVidOplNar
  ProcDopNar
  SummaDopNar
  SchetDebDopNar
  SubSchdebDopNar
  NamKAUDDopNar

  LshKodWork
  NmWork
  LshKodOper
  NmOper
  KolVoEdin
  LshRascen
  LshNormaTime
  StoimWork
  SummaTime
!¤®¯« âë
  KodVidOpl
  NaimVidOpl
  ProcDop
  SummaDop
  SchetDebDop
  SubSchdebDop
  NamKAUDDop
  JobListAddPayHours
  JobListAddPayDays
!¨â®£¨ ¯® «¨æ¥¢®© áâ®à®­¥
  SummaStoimLsh: double
  SummamTimeLsh: double
  SummaDopLsh: double
  SummaDopLshN: double

!‘âà®ª¨
  NP
  TABN
  FIO
  PersonalAccountDepartmentName

  PRNARYAD_NREC
  prof
  razr
  tarif
  tarkof
  KTY
  CostsAssignmentDepartmentName
  cPodr
  cPodrOZ
  VIDOPL
  Vidprem
  MES
  Datan
  DatOk
  KOLDN: double
  CHASF: double
  KOLDNGR: double
  CHASGR: double
  SISOPL
  tartime: double
  SUMMATR: double
  SUMMA: double
  SUMMAPR: double
  proc
  SUMMPREM: double
  KODWork
  NOPER
  RASCEN: double
  KolVo
  NRMTIME
  SchetDeb
  SubSchdeb
  NamKAUD

!¤®¯« âë ­  à ¡®âã
  NarDopName: string
  NarDopVidOpl: word
  NarDopHours: double
  NarDopDays: double
  NarDopProc: double
  NarDopSum: double
  NarDopSchet: string
  NarDopSubSch: string
  NarDopNamKau: string
.endfields
^ ^
.{ DepartmentLoop checkenter
^
.{ BrigadeLoop checkenter
^
.{ JobSheetLoop checkenter
^ ^ ^ ^
.{ JobSheetAdditionalPaymentLoop checkenter
^ ^ ^ ^ ^ ^ ^
.}
! «¨æ¥¢ ï áâ®à®­  ­ àï¤ 
.{ JobListLoop  checkenter
 ^ ^ ^ ^ ^ ^ ^ ^ ^
.{ JobListItemAdditionalPaymentLoop  checkenter
 ^ ^ ^ ^ ^ ^ ^ ^ ^
.}
.}
^ ^ ^ ^
! á¯¥æ¨ä¨ª æ¨ï ­ àï¤ 
.{ JobLoop checkenter
^ ^ ^ ^
.{ PersonalAccountLoop checkenter
^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
^ ^ ^ ^ ^ ^ ^ ^
^ ^ ^ ^ ^ ^ ^ ^
.{ JobAdditionalPaymentLoop checkenter
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
.}
.}
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'VedNar_01' prototype is 'vednar'
.NameInList  '’ ¡¥«ì - à áç¥â '
.group '‡ à¯« â  á ãç¥â®¬ Š’“'
!.p 10
.var
  PersonalAccountCount: longint;
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMATR : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;

.endvar
.fields
  CommonFormHeader
  Npred
  dat1
  JobSheetName

  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  prof razr tarif  tarkof KTY
  KOLDN CHASF tartime   SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM

  KOLDN:'sum:Vednar_PersonalAccountLoop'
  CHASF:'sum:Vednar_PersonalAccountLoop'
  SUMMATR:'sum:Vednar_PersonalAccountLoop'
  SUMMA:'sum:Vednar_PersonalAccountLoop'
  SUMMPREM:'sum:Vednar_PersonalAccountLoop'
  (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
 'true':'s'
.endfields
ÿˆ^
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³                           @~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                               ³
³                                           ’€…‹œ - €‘—…’                                                                                                                      ³
³                                        @~@@@@@@@@@@@@@@@@@@@@                                                                                                                  ³
.{ Vednar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³                                                                                                                                                                                ³
³                                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                       ³
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop checkenter
.}
.}
ÃÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ³
³ ’€…‹œ›‰³      ”€Œˆ‹ˆŸ ˆŒŸ         ³    ”…‘‘ˆŸ       ³€‡-³   ’€ˆ”   ³’€ˆ”›‰³  Š’“   ³    ’€’€      ³€‘—…’.³ ‡/‹.     ³  ‘„…‹œ€Ÿ  ³ …ŒˆŸ     ³ˆ’ƒ       ³
³   Œ…  ³       ’—…‘’‚           ³                    ³Ÿ„ ³           ³ Š”-’ ³        ³  „…‰    ³  —€COB  ³ Š”-’ ³’€ˆ”“ ‘ Š’“ ³  ‡/‹.     ³            ³            ³
ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ
.{ Vednar_JobLoop checkenter
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
³@@@@@@@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@@@@@@@@@@@³&'&&³&'&&&&&.&&&³&'&&&.&&³&'&&&.&&³&'&&&&.&& ³&'&&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM+ NARDOPSUM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ³          ³                          ³                    ³    ³           ³        ³   ˆ’ƒ³&'&&&&.&& ³&'&&&&.&&³        ³&'&&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&ÿ
.}
ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
ÿ   ˆ’ƒ  €Ÿ„“                                         ³    ³           ³        ³        ³&'&&&&.&& ³&'&&&&.&&³        ³&'&&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&³&'&&&&&&&.&&ÿ
ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÿˆ
.}
 ^
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'VedNar_02' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName

  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  KOLDN CHASF SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM

  KOLDN:'sum:Vednar_PersonalAccountLoop'
  CHASF:'sum:Vednar_PersonalAccountLoop'
  SUMMA:'sum:Vednar_PersonalAccountLoop'
  SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ Vednar_JobSheetLoop checkenter


                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}
.{ Vednar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥      ³’ ¡¥«ì­ë© ³  ” ¬¨«¨ï ˆ..  ³   ’ à¨ä    ³ Š’“ ³Š®«-¢®³Š®«-¢®  ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³                     ³  ­®¬¥à   ³                ³  (®ª« ¤)   ³     ³ ¤­¥© ³ç á®¢   ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@³&'&&&&&&.&&&³&&.&&³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                     ³          ³                ³            ³ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                      &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‘
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_03' prototype is 'vednar'
.NameInList  '®«­ ï á¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å '
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMATR : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;
.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
!‹¨æ¥¢ ï áâ®à®­ 
 KodVidOplNar  NaimVidOplNar ProcDopNar SummaDopNar
 LshKodWork NmWork LshKodOper NmOper KolVoEdin LshRascen LshNormaTime
 StoimWork SummaTime
!¤®¯« âë
 KodVidOpl NaimVidOpl ProcDop SummaDop

 SummaStoimLsh SummamTimeLsh SummaDopLsh SummaDopLshN
 'true':'s'
!‘âà®ª¨
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  Datan DatOk KOLDN CHASF
 SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM

 KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
 SUMMATR:'sum:Vednar_PersonalAccountLoop' SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop' (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
.endfields
^
.{ Vednar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.[h
         „®¯« âë ­  ­ àï¤
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h

 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}

.{ Vednar_JobListLoop  checkenter
ÿ
 &'&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&& @@@@@@@@@@@@@@@@@@@@@@ÿ

Š®«-¢® &'&&.&&   ¥¤¨­. áâ®¨¬. &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
               ¡é ï áâ®¨¬®áâì &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.[h
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
.}
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                 ¡é ï ¨­ä®à¬ æ¨ï ¯® ­ àï¤ã
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
‘ã¬¬ à­ ï áâ®¨¬®áâì &'&&&&&&&&.&&           ¢à¥¬ï  &'&&&&&&&&.&&
„®¯« âë ¯® à ¡®â ¬  &'&&&&&&&&.&&   ¢ æ¥«®¬ ­ àï¤  &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
! ¯à®£®­ «¨áâ 
 ^
.{ VedNar_JobLoop checkenter
.[h OverWrite
ÿˆÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥    ³’ ¡¥«ì­ë©³    ” ¬¨«¨ï ˆ..   ³    ’ à¨ä     ³ Š’“ ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³  ‘ã¬¬  ¯®   ³ ¯« â  ¯®   ³   à¥¬¨ï    ³   ˆâ®£®
 ¯/¯ ³                   ³  ­®¬¥à  ³                   ³   (®ª« ¤)    ³     ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³   â à¨äã    ³   ­ àï¤ã    ³             ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ Vednar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&&³&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                   ³         ³                   ³              ³     ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                                              &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.FIELDS
  'true':'s'
.ENDFIELDS
^
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_04' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ®¡ ¨­¤¨¢¨¤ã «ì­ëå ­ àï¤ å  '
.group 'ˆ­¤¨¢¨¤ã «ì­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint;
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName

  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  KOLDN CHASF RASCEN  KolVo SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM

 KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
 SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ Vednar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥       ³’ ¡¥«ì­ë© ³   ” ¬¨«¨ï ˆ..  ³Š®«-¢®³Š®«-¢®  ³   áæ¥­ª   ³Š®«-¢® ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³                      ³  ­®¬¥à   ³                 ³ ¤­¥© ³ç á®¢   ³            ³       ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&.&&&³&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                      ³          ³            ˆ’ƒ³&&&.&&³&'&&&.&&³            ³       ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                        ˆ’ƒ  €Ÿ„“  &&&&&&& &'&&&&&&                     &'&&&&&&&&&&&& &'&&&&&&&&&&&ÿ‘
.}
.}
.}
.endform

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
.linkform 'VedNar_02OZ' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å (‡)'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName

  if (PersonalAccountCount > 0, '', NP)
  CostsAssignmentDepartmentName
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  KOLDN CHASF SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM

KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥      ³’ ¡¥«ì­ë© ³  ” ¬¨«¨ï ˆ..  ³   ’ à¨ä    ³ Š’“ ³Š®«-¢®³Š®«-¢®  ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³ ®â­¥á¥­¨ï § âà â    ³  ­®¬¥à   ³                ³  (®ª« ¤)   ³     ³ ¤­¥© ³ç á®¢   ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@³&'&&&&&&.&&&³&&.&&³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                     ³          ³                ³            ³ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                      &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‘
.}
.}
.}
.endform

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
.linkform 'Vednar_03OZ' prototype is 'vednar'
.NameInList  '®«­ ï á¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å (‡)'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMATR : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
!‹¨æ¥¢ ï áâ®à®­ 
 KodVidOplNar  NaimVidOplNar ProcDopNar SummaDopNar
 LshKodWork NmWork LshKodOper NmOper KolVoEdin LshRascen LshNormaTime
 StoimWork SummaTime
!¤®¯« âë
 KodVidOpl NaimVidOpl ProcDop SummaDop

 SummaStoimLsh SummamTimeLsh SummaDopLsh SummaDopLshN
 'true':'s'
!‘âà®ª¨
  if (PersonalAccountCount > 0, '', NP)
  CostsAssignmentDepartmentName
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  Datan DatOk KOLDN CHASF
 SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM
 KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
 SUMMATR:'sum:Vednar_PersonalAccountLoop' SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop' (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
.endfields
^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.[h
         „®¯« âë ­  ­ àï¤
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}

.{ Vednar_JobListLoop  checkenter
ÿ
 &'&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&& @@@@@@@@@@@@@@@@@@@@@@ÿ

Š®«-¢® &'&&.&&   ¥¤¨­. áâ®¨¬. &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
               ¡é ï áâ®¨¬®áâì &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.[h
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ

.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
.}

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                 ¡é ï ¨­ä®à¬ æ¨ï ¯® ­ àï¤ã
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
‘ã¬¬ à­ ï áâ®¨¬®áâì &'&&&&&&&&.&&           ¢à¥¬ï  &'&&&&&&&&.&&
„®¯« âë ¯® à ¡®â ¬  &'&&&&&&&&.&&   ¢ æ¥«®¬ ­ àï¤  &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
! ¯à®£®­ «¨áâ 
 ^
.{ VedNar_JobLoop checkenter
.[h OverWrite
ÿˆÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥    ³’ ¡¥«ì­ë©³    ” ¬¨«¨ï ˆ..   ³    ’ à¨ä     ³ Š’“ ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³  ‘ã¬¬  ¯®   ³ ¯« â  ¯®   ³   à¥¬¨ï    ³  ˆâ®£®
 ¯/¯ ³ ®â­¥á¥­¨ï § âà â  ³  ­®¬¥à  ³                   ³   (®ª« ¤)    ³     ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³   â à¨äã    ³   ­ àï¤ã    ³             ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&&³&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                   ³         ³                   ³              ³     ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                                              &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.FIELDS
  'true':'s'
.ENDFIELDS
^
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_04' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ®¡ ¨­¤¨¢¨¤ã «ì­ëå ­ àï¤ å  '
.group 'ˆ­¤¨¢¨¤ã «ì­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName

  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  KOLDN CHASF RASCEN  KolVo SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM

 KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
 SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥       ³’ ¡¥«ì­ë© ³   ” ¬¨«¨ï ˆ..  ³Š®«-¢®³Š®«-¢®  ³   áæ¥­ª   ³Š®«-¢® ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³                      ³  ­®¬¥à   ³                 ³ ¤­¥© ³ç á®¢   ³            ³       ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&.&&&³&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                      ³          ³            ˆ’ƒ³&&&.&&³&'&&&.&&³            ³       ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                        ˆ’ƒ  €Ÿ„“  &&&&&&& &'&&&&&&                     &'&&&&&&&&&&&& &'&&&&&&&&&&&ÿ‘
.}
.}
.}
.endform
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

!-------------------------------------------------------------------------------
.linkform 'VedNar_05' prototype is 'vednar'
.NameInList  '®«­ ï c¯à ¢ª  ®¡ ¨­¤¨¢¨¤ã «ì­ëå ­ àï¤ å  '
.group 'ˆ­¤¨¢¨¤ã «ì­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  Datan DatOk KOLDN CHASF KODWork NOPER RASCEN  KolVo SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM

KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop' (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
.endfields
ÿˆ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥     ³’ ¡¥«ì­ë© ³  ” ¬¨«¨ï ˆ..   ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³ Š®¤   ³ Š®¤   ³   áæ¥­ª   ³Š®«-¢® ³  ¯« â  ¯®  ³   à¥¬¨ï    ³  ˆâ®£®
 ¯/¯ ³                    ³  ­®¬¥à   ³                 ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³à ¡®âë ³®¯¥à æ.³            ³       ³   ­ àï¤ã    ³             ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&&&&&&&³&&&&&&&³&'&&&&&&.&&&³&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM+ NARDOPSUM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                    ³          ³                 ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³       ³       ³            ³       ³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                         &&&&&& &'&&&&&&                                      &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_06' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ®¡ ¨­¤¨¢¨¤ã «ì­ëå ­ àï¤ å c ãç¥â®¬ Š’“  '
.group 'ˆ­¤¨¢¨¤ã «ì­ë¥ ­ àï¤ë c Š’“'
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;

.endvar
.p 60
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  KTY KOLDN CHASF RASCEN  KolVo SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM
  KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
  SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥    ³’ ¡¥«ì­ë© ³    ” ¬¨«¨ï ˆ..  ³ Š’“  ³Š®«-¢®  ³Š®«-¢®  ³   áæ¥­ª   ³Š®«-¢® ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³                   ³  ­®¬¥à   ³                  ³      ³¤­¥©    ³ç á®¢   ³            ³       ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&.&&³&'&&&&&&.&&&³&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                   ³          ³                  ³ ˆ’ƒ³&'&&&.&&³&'&&&.&&³            ³       ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“          &'&&&.&& &'&&&.&&                      &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‘
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_07' prototype is 'vednar'
.NameInList  '®«­ ï c¯à ¢ª  ®¡ ¨­¤¨¢¨¤ã «ì­ëå ­ àï¤ å á ãç¥â®¬ Š’“ '
.group 'ˆ­¤¨¢¨¤ã «ì­ë¥ ­ àï¤ë c Š’“'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;
.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  KTY Datan Datok KOLDN CHASF
KODWork NOPER RASCEN  KolVo SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM
KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop' (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
.endfields
ÿˆ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥   ³’ ¡¥«ì­ë© ³    ” ¬¨«¨ï ˆ..   ³ Š’“  ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³ Š®¤   ³ Š®¤   ³   áæ¥­ª   ³Š®«-¢® ³  ¯« â  ¯®  ³   à¥¬¨ï    ³  ˆâ®£®
 ¯/¯ ³                  ³  ­®¬¥à   ³                   ³      ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³à ¡®âë ³®¯¥à æ.³            ³       ³   ­ àï¤ã    ³             ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@@@@³&&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&&&&&&&³&&&&&&&³&'&&&&&&.&&&³&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM+ NARDOPSUM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                  ³          ³                   ³      ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³       ³       ³            ³       ³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                                &&&.&& &'&&&.&&                                      &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.}
.}
.}
.endform

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
.linkform 'VedNar_02KAU' prototype is 'vednar'
.NameInList  '‘¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å (áç¥â-áã¡áç¥â-Š€“)'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName

  if (PersonalAccountCount > 0, '', NP)
  CostsAssignmentDepartmentName SchetDeb SubSchdeb NamKAUD
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO) tarif KTY  KOLDN CHASF SUMMA  SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMA
  sum_SUMMPREM

KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop'
.endfields
ÿ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.}
.{ Vednar_JobListLoop  checkenter
.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}

.{ VedNar_JobLoop checkenter
.[h OverWrite
ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥      ³‘ç¥â³‘ã¡ ³  Š€“                        ³’ ¡¥«ì­ë© ³  ” ¬¨«¨ï ˆ..  ³   ’ à¨ä    ³ Š’“ ³Š®«-¢®³Š®«-¢®  ³  ¯« â  ¯®  ³ à¥¬¨ï
 ¯/¯ ³ ®â­¥á¥­¨ï § âà â    ³    ³áç¥â³                             ³  ­®¬¥à   ³                ³  (®ª« ¤)   ³     ³ ¤­¥© ³ç á®¢   ³   ­ àï¤ã    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@@@³@@@@³@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@³@@@@@@@@@@@@@@@@³&'&&&&&&.&&&³&&.&&³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                     ³    ³    ³                             ³          ³                ³            ³ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                                                              ˆ’ƒ  €Ÿ„“                      &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‘
.}
.}
.}
.endform

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
.linkform 'Vednar_03KAU' prototype is 'vednar'
.NameInList  '®«­ ï á¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å (áç¥â-áã¡áç¥â-Š€“)'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  PersonalAccountCount: longint
  sum_KOLDN   : double;
  sum_CHASF   : double;
  sum_SUMMATR : double;
  sum_SUMMA   : double;
  sum_SUMMPREM: double;
  sum_AGRSUM  : double;
.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
!‹¨æ¥¢ ï áâ®à®­ 
 KodVidOplNar  NaimVidOplNar ProcDopNar SummaDopNar SchetDebDopNar SubSchdebDopNar NamKAUDDopNar
 LshKodWork NmWork LshKodOper NmOper KolVoEdin LshRascen LshNormaTime
 StoimWork SummaTime
!¤®¯« âë
 KodVidOpl NaimVidOpl ProcDop SummaDop SchetDebDop SubSchdebDop NamKAUDDop

 SummaStoimLsh SummamTimeLsh SummaDopLsh SummaDopLshN
 'true':'s'
!‘âà®ª¨
  if (PersonalAccountCount > 0, '', NP)
  CostsAssignmentDepartmentName SchetDeb SubSchdeb NamKAUD
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  Datan DatOk KOLDN CHASF
 SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_AGRSUM
 KOLDN:'sum:Vednar_PersonalAccountLoop' CHASF:'sum:Vednar_PersonalAccountLoop'
 SUMMATR:'sum:Vednar_PersonalAccountLoop' SUMMA:'sum:Vednar_PersonalAccountLoop' SUMMPREM:'sum:Vednar_PersonalAccountLoop' (SUMMA + SUMMPREM):'sum:Vednar_PersonalAccountLoop'
.endfields
^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter

                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.[h
         „®¯« âë ­  ­ àï¤
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬      ³‘ç¥â³‘ã¡ ³  Š€“
 ®¯« âë³      ¤®¯« âë                       ³       ³             ³    ³áç¥â³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&³@@@@³@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}

.{ Vednar_JobListLoop  checkenter
ÿ
 &'&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&& @@@@@@@@@@@@@@@@@@@@@@ÿ

Š®«-¢® &'&&.&&   ¥¤¨­. áâ®¨¬. &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
               ¡é ï áâ®¨¬®áâì &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.[h
         „®¯« âë ­  à ¡®âã (®¯¥à æ¨î)
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬      ³‘ç¥â³‘ã¡ ³  Š€“
 ®¯« âë³      ¤®¯« âë                       ³       ³             ³    ³áç¥â³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&³&&&&³&&&&³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
.}
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                 ¡é ï ¨­ä®à¬ æ¨ï ¯® ­ àï¤ã
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
‘ã¬¬ à­ ï áâ®¨¬®áâì &'&&&&&&&&.&&           ¢à¥¬ï  &'&&&&&&&&.&&
„®¯« âë ¯® à ¡®â ¬  &'&&&&&&&&.&&   ¢ æ¥«®¬ ­ àï¤  &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
! ¯à®£®­ «¨áâ 
 ^
.{ VedNar_JobLoop checkenter
.[h OverWrite
ÿˆÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥    ³‘ç¥â³‘ã¡ ³  Š€“                        ³’ ¡¥«ì­ë©³    ” ¬¨«¨ï ˆ..   ³    ’ à¨ä     ³ Š’“ ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³  ‘ã¬¬  ¯®   ³ ¯« â  ¯®   ³   à¥¬¨ï    ³  ˆâ®£®
 ¯/¯ ³ ®â­¥á¥­¨ï § âà â  ³    ³áç¥â³                             ³  ­®¬¥à  ³                   ³   (®ª« ¤)    ³     ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³   â à¨äã    ³   ­ àï¤ã    ³             ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
 &&&&³@@@@@@@@@@@@@@@@@@@³@@@@³@@@@³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&&³&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&
.begin Inc(PersonalAccountCount)
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                   ³    ³    ³                             ³         ³                   ³              ³     ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.[f OverWrite
ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
ÿ                                      ˆ’ƒ  €Ÿ„“                                                                                      &&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.FIELDS
  'true':'s'
.ENDFIELDS
^
.}
.}
.}
.endform

!-------------------------------------------------------------------------------
.linkform 'Vednar_03_dopl' prototype is 'vednar'
.NameInList  '®«­ ï á¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å á ¤®¯« â ¬¨'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  APCount:              longint;
  PersonalAccountCount: longint;
  sum_KOLDN:            double;
  sum_CHASF:            double;
  sum_SUMMATR:          double;
  sum_SUMMA:            double;
  sum_SUMMPREM:         double;
  sum_NARDOPSUM:        double;
  // ¯®«­ë© § à ¡®â®ª = á¤¥«ª  + ¯à¥¬¨ï + ¤®¯« âë
  WorkerEarnings:       double;
  total_NARDOPSUM:      double;
  total_SUMMA:          double;
  total_SUMMPREM:       double;
  sum_AGRSUM:           double;

.endvar
.fields
 CommonFormHeader
 Npred dat1
 JobSheetName
!‹¨æ¥¢ ï áâ®à®­ 
 KodVidOplNar  NaimVidOplNar ProcDopNar SummaDopNar
 LshKodWork NmWork LshKodOper NmOper KolVoEdin LshRascen LshNormaTime
 StoimWork SummaTime
!¤®¯« âë
 KodVidOpl NaimVidOpl ProcDop SummaDop

 SummaStoimLsh SummamTimeLsh SummaDopLsh SummaDopLshN
 'true':'s'
!‘âà®ª¨
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  Datan DatOk KOLDN CHASF
  SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  NarDopName NarDopSum
  NarDopSum:'sum:Vednar_JobAdditionalPaymentLoop'
  WorkerEarnings

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_NARDOPSUM
  sum_AGRSUM+ sum_NARDOPSUM


  KOLDN:'sum:Vednar_PersonalAccountLoop'
  CHASF:'sum:Vednar_PersonalAccountLoop'
  SUMMATR:'sum:Vednar_PersonalAccountLoop'
  SUMMA:'sum:Vednar_PersonalAccountLoop'
  SUMMPREM:'sum:Vednar_PersonalAccountLoop'
  total_NARDOPSUM
  total_SUMMA + total_SUMMPREM + total_NARDOPSUM
.endfields
^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter
.begin total_NARDOPSUM:= 0; total_SUMMA:= 0; total_SUMMPREM:= 0; end.
                          ‘   € ‚ Š €     €  Ÿ „ € •
  à¥¤¯à¨ïâ¨¥ : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  @~@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.{ Vednar_JobSheetAdditionalPaymentLoop  checkenter
.[h
         „®¯« âë ­  ­ àï¤
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}

.{ Vednar_JobListLoop  checkenter
ÿ
 &'&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&& @@@@@@@@@@@@@@@@@@@@@@ÿ

Š®«-¢® &'&&.&&   ¥¤¨­. áâ®¨¬. &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
               ¡é ï áâ®¨¬®áâì &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.[h
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]f
.}
.}
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                 ¡é ï ¨­ä®à¬ æ¨ï ¯® ­ àï¤ã
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
‘ã¬¬ à­ ï áâ®¨¬®áâì &'&&&&&&&&.&&           ¢à¥¬ï  &'&&&&&&&&.&&
„®¯« âë ¯® à ¡®â ¬  &'&&&&&&&&.&&   ¢ æ¥«®¬ ­ àï¤  &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 ^
.{ VedNar_JobLoop checkenter
.[h OverWrite
ÿ‰ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N - ³  ®¤à §¤¥«¥­¨¥    ³’ ¡¥«ì­ë©³    ” ¬¨«¨ï ˆ..   ³    ’ à¨ä     ³ Š’“ ³   „ â    ³   „ â    ³Š®«-¢®³Š®«-¢®  ³  ‘ã¬¬  ¯®   ³ ¯« â  ¯®   ³   à¥¬¨ï    ³      ¨¬¥­®¢ ­¨¥ ¤®¯« âë     ³    ‘ã¬¬     ³  ˆâ®£®
 ¯/¯ ³                   ³  ­®¬¥à  ³                   ³   (®ª« ¤)    ³     ³  ­ ç «   ³  § ¢¥àè. ³ ¤­¥© ³ç á®¢   ³   â à¨äã    ³   ­ àï¤ã    ³             ³                              ³  ¤®¯« âë    ³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÿ‰
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_NARDOPSUM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
ÿˆ &&&&³@@@@@@@@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&&³&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³                              ³             ³&'&&&&&&&&.&&ÿˆ
.begin
  Inc(PersonalAccountCount);
  APCount := 0 ;
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
  total_SUMMA := total_SUMMA+ SUMMA;
  total_SUMMPREM:= total_SUMMPREM+ SUMMPREM;

  WorkerEarnings := SUMMA + SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.begin
  Inc(APCount);
  WorkerEarnings := WorkerEarnings + NARDOPSUM;
  sum_NARDOPSUM:= sum_NARDOPSUM+ NARDOPSUM;
  total_NARDOPSUM:= total_NARDOPSUM+ NARDOPSUM;
end.
ÿˆ     ³                   ³         ³                   ³              ³     ³          ³          ³      ³        ³             ³             ³             ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&³ÿˆ
.}
.{?internal;(APCount > 0);
ÿˆ     ³                   ³         ³                   ³              ³     ³          ³          ³      ³        ³             ³             ³             ³ÿˆ’ƒ ¯® ¤®¯« â ¬             ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ‰
.}
.}
.{?internal;PersonalAccountCount > 1
ÿˆ     ³                   ³         ³                   ³              ³     ³          ³     ÿˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³                              ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ‰
.}
.[f OverWrite
ÿˆÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÿˆ
.]f
.}
ÿˆ                                        ÿˆ’ƒ  €Ÿ„“                                          &'&&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&                                &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.FIELDS
  'true':'s'
.ENDFIELDS
^
.}
.}
.}
.endform

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
.linkform 'Vednar_03_fulldopl' prototype is 'vednar'
.NameInList  '®«­ ï á¯à ¢ª  ® ¡à¨£ ¤­ëå ­ àï¤ å á ¤®¯« â ¬¨ ¨ ç á ¬¨ ¯® ­¨¬'
.group 'à¨£ ¤­ë¥ ­ àï¤ë'
.p 60
.var
  APCount: longint
  PersonalAccountCount: longint
  sum_KOLDN:        double;
  sum_CHASF:        double;
  sum_SUMMATR:      double;
  sum_SUMMA:        double;
  sum_SUMMPREM:     double;
  sum_NARDOPSUM:    double;
  sum_AGRSUM:       double;
  // ¯®«­ë© § à ¡®â®ª = á¤¥«ª  + ¯à¥¬¨ï + ¤®¯« âë
  WorkerEarnings:   double;
  total_SUMMA:      double;
  total_SUMMPREM:   double;
  total_NARDOPSUM:  double;
.endvar
.fields
  CommonFormHeader
  Npred dat1
  JobSheetName
!‹¨æ¥¢ ï áâ®à®­ 
  KodVidOplNar  NaimVidOplNar ProcDopNar SummaDopNar
  LshKodWork NmWork LshKodOper NmOper KolVoEdin LshRascen LshNormaTime
  StoimWork SummaTime
!¤®¯« âë
  KodVidOpl NaimVidOpl ProcDop SummaDop

  SummaStoimLsh SummamTimeLsh SummaDopLsh SummaDopLshN
  'true':'s'
!‘âà®ª¨
  if (PersonalAccountCount > 0, '', NP)
  if (PersonalAccountCount > 0, '', PersonalAccountDepartmentName)
  if (PersonalAccountCount > 0, '', TABN)
  if (PersonalAccountCount > 0, '', FIO)
  tarif KTY  Datan DatOk KOLDN CHASF
  SUMMATR SUMMA  SUMMPREM SUMMA + SUMMPREM

  string(NarDopVidOpl) + ', ' +  NarDopName
  NarDopHours NarDopDays NarDopSum
  NarDopHours:'SUM'
  NarDopDays:'sum'
  NarDopSum:'sum:Vednar_JobAdditionalPaymentLoop'
  WorkerEarnings

  sum_KOLDN
  sum_CHASF
  sum_SUMMATR
  sum_SUMMA
  sum_SUMMPREM
  sum_NARDOPSUM
  sum_AGRSUM+ sum_NARDOPSUM


  KOLDN:'sum:Vednar_PersonalAccountLoop'
  CHASF:'sum:Vednar_PersonalAccountLoop'
  SUMMATR:'sum:Vednar_PersonalAccountLoop'
  SUMMA:'sum:Vednar_PersonalAccountLoop'
  SUMMPREM:'sum:Vednar_PersonalAccountLoop'
  TOTAL_NarDopSum
  TOTAL_SUMMA + TOTAL_SUMMPREM + TOTAL_NarDopSum
.endfields
ÿˆ^
.{ VedNar_DepartmentLoop checkenter
.{ VedNar_BrigadeLoop checkenter
.{ VedNar_JobSheetLoop checkenter
.begin total_SUMMA:= 0; total_SUMMPREM:= 0; total_NARDOPSUM:= 0; end.

                          ÿ‘   € ‚ Š €     €  Ÿ „ € •ÿ

à¥¤¯à¨ïâ¨¥:         ÿ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ÿ

@@@@@@@@@@@@@@@@@@@  ÿ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ÿ
ÿˆ
ÿˆ.{ Vednar_JobSheetAdditionalPaymentLoop  checkenterÿˆ
.[h
ÿ‰„®¯« âë ­  ­ àï¤ÿ
ÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ
.]h
 &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&
.[f
ÿˆÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÿˆ
.]f
ÿˆ.}

.{ Vednar_JobListLoop  checkenter
ÿˆ &'&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@ &'&&&& @@@@@@@@@@@@@@@@@@@@@@@

Š®«-¢® &'&&.&&   ¥¤¨­. áâ®¨¬. &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
               ¡é ï áâ®¨¬®áâì &'&&&&&&&&.&& ¢à¥¬ï &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÿˆ

.{ Vednar_JobListItemAdditionalPaymentLoop  checkenter
.[h
ÿˆÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
  Š®¤  ³      ¨¬¥­®¢ ­¨¥                   ³à®æ¥­â³   ‘ã¬¬ 
 ®¯« âë³      ¤®¯« âë                       ³       ³
ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÿˆ
.]h
ÿˆ &&&&  ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&.&&³&'&&&&&&&&.&&ÿˆ
.[f
ÿˆÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÿˆ
.]f
.}
.}
ÿˆÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                 ÿ¡é ï ¨­ä®à¬ æ¨ï ¯® ­ àï¤ãÿ
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
‘ã¬¬ à­ ï áâ®¨¬®áâì &'&&&&&&&&.&&           ¢à¥¬ï  &'&&&&&&&&.&&
„®¯« âë ¯® à ¡®â ¬  &'&&&&&&&&.&&   ¢ æ¥«®¬ ­ àï¤  &'&&&&&&&&.&&
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
 ^ÿˆ
.{ VedNar_JobLoop checkenter
.[h OverWrite
ÿ‰ÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ
 N   ³®¤à §¤¥«¥­¨¥      ³ ’ ¡¥«ì­ë©³    ” ¬¨«¨ï ˆ..   ³         ’ à¨ä³  Š’“³„ â       ³„ â       ³Š®«-¢®³  Š®«-¢®³     ‘ã¬¬  ¯®³    ¯« â  ¯®³       à¥¬¨ï³ ¨¬¥­®¢ ­¨¥ ¤®¯« âë          ³  — áë ¯®³   „­¨ ¯®³        ‘ã¬¬ ³        ˆâ®£®
 ¯/¯ ³                   ³     ­®¬¥à³                   ³       (®ª« ¤)³     ³­ ç «     ³®ª®­ç ­¨ï ³  ¤­¥©³   ç á®¢³       â à¨äã³       ­ àï¤ã³             ³                              ³  ¤®¯« â¥³  ¤®¯« â¥³      ¤®¯« âë³
ÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÿ‰
.]h
.begin PersonalAccountCount := 0
  sum_KOLDN   := 0;
  sum_CHASF   := 0;
  sum_SUMMATR := 0;
  sum_SUMMA   := 0;
  sum_SUMMPREM:= 0;
  sum_NARDOPSUM:= 0;
  sum_AGRSUM  := 0;
end.
.{ VedNar_PersonalAccountLoop checkenter
ÿˆ &&&&³@@@@@@@@@@@@@@@@@@@³&&&&&&&&&&³@@@@@@@@@@@@@@@@@@@³&'&&&&&&&&.&&&³&&.&&³@@@@@@@@@@³@@@@@@@@@@³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³                              ³         ³         ³             ³&'&&&&&&&&.&&ÿˆ
.begin
  Inc(PersonalAccountCount);
  APCount := 0;
  sum_KOLDN   := sum_KOLDN+ KOLDN;
  sum_CHASF   := sum_CHASF+ CHASF;
  sum_SUMMATR := sum_SUMMATR+ SUMMATR;
  sum_SUMMA   := sum_SUMMA+ SUMMA;
  sum_SUMMPREM:= sum_SUMMPREM+ SUMMPREM;
  sum_AGRSUM  := sum_AGRSUM+ SUMMA+ SUMMPREM;
  total_SUMMA := total_SUMMA+ SUMMA;
  total_SUMMPREM:= total_SUMMPREM+ SUMMPREM;

  WorkerEarnings := SUMMA + SUMMPREM;
end.
.{ Vednar_JobAdditionalPaymentLoop checkenter
.begin
  Inc(APCount);
  WorkerEarnings := WorkerEarnings + NARDOPSUM;
  sum_NARDOPSUM:= sum_NARDOPSUM+ NARDOPSUM;
  total_NARDOPSUM:= total_NARDOPSUM+ NARDOPSUM;
end.
ÿˆ     ³                   ³          ³                   ³              ³     ³          ³          ³      ³        ³             ³             ³             ³@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@³&'&&&&.&&³&'&&&&&.&³&'&&&&&&&&.&&³ÿˆ
.}
.{?internal;(APCount > 0);
ÿ‰     ³                   ³          ³                   ³              ³     ³          ³          ³      ³        ³             ³             ³             ³             ˆâ®£® ¯® ¤®¯« â ¬³&'&&&&.&&³&'&&&&&.&³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ‰
.}
.}
.{?internal;PersonalAccountCount > 1
ÿ     ³                   ³          ³                   ³              ³     ³          ³     ˆ’ƒ³&&&.&&³&'&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³&'&&&&&&&&.&&³                              ³         ³         ³&'&&&&&&&&.&&³&'&&&&&&&&.&&ÿ
.}
.}

ÿ‰                                         ˆ’ƒ  €Ÿ„“                                          &'&&&.&& &'&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&& &'&&&&&&&&.&&                                                    &'&&&&&&&&.&& &'&&&&&&&&.&&ÿ‰
.FIELDS
  'true':'s'
.ENDFIELDS
^
.}
.}
.}
.endform

//------------------------------------------------------------------------------
.linkform VedNar_140 prototype is VedNar
.group '¡é¨¥ ®âç¥âë'
.nameinlist ' ¡®âë ¯® ­ àï¤ ¬ ®â¤¥«ì­® ®â ¡à¨£ ¤'
.p 60
.var
  JobHours: double;
  JobSheetHours: double;
  BrigadeHours: double;
  DepartmentHours: double;
.endvar
.fields
  CommonFormHeader

  DepartmentName
  BrigadeName

  JobSheetName

  TABN
  FIO
  Time2Str(JobHours, 2)
  SUMMA:'sum:VedNar_PersonalAccountLoop'
  SUMMPREM:'sum:VedNar_PersonalAccountLoop'
  NarDopSum:'sum:VedNar_JobAdditionalPaymentLoop'

  '‚á¥£® ¯® ­ àï¤ã: ' + JobSheetName
  Time2Str(JobSheetHours, 2)
  SUMMA:'sum:VedNar_PersonalAccountLoop'
  SUMMPREM:'sum:VedNar_PersonalAccountLoop'
  NarDopSum:'sum:VedNar_JobAdditionalPaymentLoop'

  '‚á¥£® ¯® ¡à¨£ ¤¥: ' + BrigadeName
  Time2Str(BrigadeHours, 2)
  SUMMA:'sum:VedNar_PersonalAccountLoop'
  SUMMPREM:'sum:VedNar_PersonalAccountLoop'
  NarDopSum:'sum:VedNar_JobAdditionalPaymentLoop'

  '‚á¥£®' + if (DepartmentName <> '', ' ¯® ¯®¤à §¤¥«¥­¨î: ' + DepartmentName, ' ¯® ­ àï¤ ¬ ¡¥§ ¯à¨¢ï§ª¨ ª ¯®¤à §¤¥«¥­¨î')
  Time2Str(DepartmentHours, 2)
  SUMMA:'sum:VedNar_PersonalAccountLoop'
  SUMMPREM:'sum:VedNar_PersonalAccountLoop'
  NarDopSum:'sum:VedNar_JobAdditionalPaymentLoop'
.endfields
ÿˆ^
                          ÿ áç¥â § à¯« âë ¯® à ¡®â ¬, ¢ë¯®«­¥­­ë¬
                              ¯® ­ àï¤ ¬ ®â¤¥«ì­® ®â ¡à¨£ ¤ÿ‰
.{ VedNar_DepartmentLoop checkenter
.begin DepartmentHours := 0 end.

.{?internal;DepartmentName <> ''
ÿˆ®¤à §¤¥«¥­¨¥:ÿ ^ÿ‰
.}
.{ VedNar_BrigadeLoop checkenter
.begin BrigadeHours := 0 end.
.{?internal;BrigadeName <> ''

ÿ‰  ÿà¨£ ¤ :ÿ ^ÿ‰
.}
.{ VedNar_JobSheetLoop checkenter
.begin JobSheetHours := 0 end.

ÿ‰    ÿ àï¤:ÿ ^ÿ‰
.{ VedNar_JobSheetAdditionalPaymentLoop checkenter
.}
.{ VedNar_JobListLoop  checkenter
.{ VedNar_JobListItemAdditionalPaymentLoop  checkenter
.}
.}
.{ VedNar_JobLoop checkenter
.[h
ÿ‰         ’ ¡.ü ” ¬¨«¨ï, ˆ..                        ‚à¥¬ï  ‘ã¬¬  § à.      à¥¬¨ï     „®¯« âë
    ---------- ----------------------------- ------------ ----------- ----------- -----------ÿ‰
.]h
.begin JobHours := 0 end.
.{ VedNar_PersonalAccountLoop checkenter
.begin JobHours := JobHours + CHASF end.
.{ VedNar_JobAdditionalPaymentLoop checkenter
.}
.}
ÿˆ    &&&&&&&&&& @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&&& &'&&&&&&.&& &'&&&&&&.&& &'&&&&&&.&&ÿˆ
.begin JobSheetHours := JobSheetHours + JobHours end.
.[f
ÿ‰    ---------- ----------------------------- ------------ ----------- ----------- -----------ÿ‰
.]f
.}
.begin BrigadeHours := BrigadeHours + JobSheetHours end.
ÿ‰    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&&& &'&&&&&&.&& &'&&&&&&.&& &'&&&&&&.&&ÿ‰
.}
.begin DepartmentHours := DepartmentHours + BrigadeHours end.
.{?internal;BrigadeName <> ''
ÿ‰  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&&& &'&&&&&&.&& &'&&&&&&.&& &'&&&&&&.&&ÿ‰
.}
.}

ÿ‰@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ &&&&&&&&&&&& &'&&&&&&.&& &'&&&&&&.&& &'&&&&&&.&&ÿ‰
.}


ÿˆˆá¯®«­¨«:                                                  ãå£ «â¥à:ÿˆ
.endform
