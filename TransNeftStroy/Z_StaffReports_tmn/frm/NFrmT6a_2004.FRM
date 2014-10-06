/*
  ╔══════════════════════════════════════════════════════════════════════╗
  ║      Н Т О  "T O P   S O F T"                                        ║
  ║      Проект "КАДРЫ"                                                  ║
  ║      Версия : 5.8                                                    ║
  ║      Разработал:  Мохова Ж.И.                                        ║
  ║      Назначение:  Форма Т-6a  Сводный приказ о предоставлении отпуска║
  ║      Параметры:                                                      ║
  ║      Изменения: май 2001 - новая форма!!!                            ║
  ╚══════════════════════════════════════════════════════════════════════╝
*/
#doc
Форма Т-6a  Сводный приказ о предоставлении отпуска
#end
.form FormT6A_04
.Hide
.Fields
Организация
ОКПО
TitleDocNrec        : comp
номер_документа
дата_составления
!.{ myPsnCycle6 CheckEnter
ContDocNrec         : comp
PersNrec            : comp
AppointNrec         : comp
FIO
FIO_VP
TabN
подразделение
должность
OtpTypeOS
OtpTypeDOP
dPeriod1
dPeriod2
iDays
iDays_rab
myType
dat1
dat2
sFoundation
!.{ myDopOtpCycle CheckEnter
FIO_
FIO_VP_
TabN_
подразделение_
должность_
OtpType_OS
OtpType_DOP
dPeriod1_
dPeriod2_
iDays_
iDays_rab_
myType_
dat1_
dat2_
sFoundation_
!.}
!.}
ДолжнРук
ФиоРук


.EndFields

Организация               ^
ОКПО                      ^
TitleDocNrec              ^
номер_документа           ^
дата_составления          ^

.{ myPsnCycle6A_04 CheckEnter
ContDocNrec               ^
PersNrec                  ^
AppointNrec               ^
FIO                       ^
FIO_VP                    ^
TabN                      ^
подразделение             ^
должность                 ^
OtpTypeOS                 ^
OtpTypeDOP                ^
dPeriod1                  ^
dPeriod2                  ^
iDays                     ^
iDays_Rab                 ^
myType                    ^
dat1                      ^
dat2                      ^
sFoundation               ^
.{ myDopOtpCycleA_04 CheckEnter
FIO_                      ^
FIO_VP_                   ^
TabN_                     ^
подразделение_            ^
должность_                ^
OtpType_OS                ^
OtpType_DOP               ^
dPeriod1_                 ^
dPeriod2_                 ^
iDays_                    ^
iDays_Rab_                ^
myType_                   ^
dat1_                     ^
dat2_                     ^
sFoundation_              ^
.}
.}
ДолжнРук                  ^
ФиоРук                    ^

.endform
