/*
  ╔═════════════════════════════════════════════════════════════════════╗
  ║      Н Т О  "T O P   S O F T",  А О   "Н О В Ы Й   А Т Л А Н Т"     ║
  ║      Проект    : ГАЛАКТИКА  (с) 2000                                ║
  ║      Система   : Управление персоналом                              ║
  ║      Версия    : 5.8                                                ║
  ║      Разработал: Антонович А.К.     31/05/2001                      ║
  ║      Назначение: Личная карточка по форме Т-2 приказ № 136          ║
  ║      Изменения :                                                    ║
  ╚═════════════════════════════════════════════════════════════════════╝
*/

#doc
Личная карточка по форме Т-2 приказ № 136
#end
.form t_2_2004
.Hide
.Fields
KatOrg_Name
KatOrg_Okpo
Date_Create
TabNum
INN
NumStrachDoc
FIO_ABC
JobNature
JobVid
Sex
NumDog
DateDog
FIO_1
FIO_2
FIO_3
BornDate
BornDateCode
BornAddr
BornAddrCode
Gragd
GragdCode
// иностранные языки
Lang1
Lang_Level1
Lang1Code
Lang2
Lang_Level2
Lang2Code
// образование
Education
EducationCode
Name_VUZ1
Diplom1Name
Diplom1Ser
Diplom1Num
DiplomDateEnd1
DiplomKval1
Napravl1
Napravl1Code
Name_VUZ2
Diplom2Name
Diplom2Ser
Diplom2Num
DiplomDateEnd2
DiplomKval2
Napravl2
Napravl2Code
// послевузовское образование
Type_Education
Type_EducationCode
Name_Education
NumDoc
DateEnd
DocDateEnd
Spez
SpezCode
// профессия
PostMain
PostMainCode
PostDop
PostDopCode
// стаж работы
StajDateDay
StajDateMonth
StajDateYear
Staj1Day
Staj1Month
Staj1Year
Staj2Day
Staj2Month
Staj2Year
Staj3Day
Staj3Month
Staj3Year
// состояние в браке
FamilyState
FamilyStateCode
// состав семьи
PsnLinksTypeCat
Psn_FIO
Psn_BornDate
// паспорт
Passp_Ser
Passp_Nmb
Passp1
Passp2
Passp3
Passp4
// адрес места жительства
Adr1
Adr2
Adr3
Adr4
Reg1
Reg2
Reg3
Reg4
// воинский учет
vus1
vus2
vus3
vus4
vus5
vus6
vus7
vus8
vus9
vus10
vus11
vus12
vus13
// прием на работу и переводы
app1
app2
app3
app4
app5
// аттестации
att1
att2
att3
att4
att5
// повышение квалификации
Educ1_1
Educ1_2
Educ1_3
Educ1_4
Educ1_5
Educ1_6
Educ1_7
Educ1_8
// переподготовка
Educ2_1
Educ2_2
Educ2_3
Educ2_4
Educ2_5
Educ2_6
Educ2_7
// награды
Feat1
Feat2
Feat3
Feat4
// отпуска
Otpusk1
Otpusk2
Otpusk3
Otpusk4
Otpusk5
Otpusk6
Otpusk7
// соц. льготы
SocLgot1
SocLgot2
SocLgot3
SocLgot4
//доп.сведения
Dop1
// увольнение
End1
End2
End3
End4
End5
End6
End7
End8

.endFields

KatOrg_Name               ^
KatOrg_Okpo               ^
Date_Create               ^
TabNum                    ^
INN                       ^
NumStrachDoc              ^
FIO_ABC                   ^
JobNature                 ^
JobVid                    ^
Sex                       ^
NumDog                    ^
DateDog                   ^
FIO_1                     ^
FIO_2                     ^
FIO_3                     ^
BornDate                  ^
BornDateCode              ^
BornAddr                  ^
BornAddrCode              ^
Gragd                     ^
GragdCode                 ^
// иностранные языки
Lang1                     ^
Lang_Level1               ^
Lang1Code                 ^
Lang2                     ^
Lang_Level2               ^
Lang2Code                 ^
// образование
Education                 ^
EducationCode             ^
Name_VUZ1                 ^
Diplom1Name               ^
Diplom1Ser                ^
Diplom1Num                ^
DiplomDateEnd1            ^
DiplomKval1               ^
Napravl1                  ^
Napravl1Code              ^
Name_VUZ2                 ^
Diplom2Name               ^
Diplom2Ser                ^
Diplom2Num                ^
DiplomDateEnd2            ^
DiplomKval2               ^
Napravl2                  ^
Napravl2Code              ^
// послевузовское образование
Type_Education            ^
Type_EducationCode        ^
Name_Education            ^
NumDoc                    ^
DateEnd                   ^
DocDateEnd                ^
Spez                      ^
SpezCode                  ^
// профессия
PostMain                  ^
PostMainCode              ^
PostDop                   ^
PostDopCode               ^
// стаж работы
StajDateDay               ^
StajDateMonth             ^
StajDateYear              ^
Staj1Day                  ^
Staj1Month                ^
Staj1Year                 ^
Staj2Day                  ^
Staj2Month                ^
Staj2Year                 ^
Staj3Day                  ^
Staj3Month                ^
Staj3Year                 ^
// состояние в браке
FamilyState               ^
FamilyStateCode           ^
// состав семьи
.{t2_2004_Cycle1  CheckEnter
PsnLinksTypeCat           ^
Psn_FIO                   ^
Psn_BornDate              ^
.}

// паспорт
Passp_Ser                 ^
Passp_Nmb                 ^
Passp1                    ^
Passp2                    ^
Passp3                    ^
Passp4                    ^
// адрес места жительства
Adr1                      ^
Adr2                      ^
Adr3                      ^
Adr4                      ^
Reg1                      ^
Reg2                      ^
Reg3                      ^
Reg4                      ^
// воинский учет
vus1                      ^
vus2                      ^
vus3                      ^
vus4                      ^
vus5                      ^
vus6                      ^
vus7                      ^
vus8                      ^
vus9                      ^
vus10                     ^
vus11                     ^
vus12                     ^
vus13                     ^
// прием на работу и переводы
.{t2_2004_Cycle2  CheckEnter
app1                      ^
app2                      ^
app3                      ^
app4                      ^
app5                      ^
.}
// аттестации
.{t2_2004_Cycle3  CheckEnter
att1                      ^
att2                      ^
att3                      ^
att4                      ^
att5                      ^
.}
// повышение квалификации
.{t2_2004_Cycle4  CheckEnter
Educ1_1                   ^
Educ1_2                   ^
Educ1_3                   ^
Educ1_4                   ^
Educ1_5                   ^
Educ1_6                   ^
Educ1_7                   ^
Educ1_8                   ^
.}
// переподготовка
.{t2_2004_Cycle5  CheckEnter
Educ2_1                   ^
Educ2_2                   ^
Educ2_3                   ^
Educ2_4                   ^
Educ2_5                   ^
Educ2_6                   ^
Educ2_7                   ^
.}
// награды
.{t2_2004_Cycle6  CheckEnter
Feat1                     ^
Feat2                     ^
Feat3                     ^
Feat4                     ^
.}
// отпуска
.{t2_2004_Cycle7  CheckEnter
Otpusk1                   ^
Otpusk2                   ^
Otpusk3                   ^
Otpusk4                   ^
Otpusk5                   ^
Otpusk6                   ^
Otpusk7                   ^
.}
// соц. льготы
.{t2_2004_Cycle8  CheckEnter
SocLgot1                  ^
SocLgot2                  ^
SocLgot3                  ^
SocLgot4                  ^
.}
//доп.сведения
.{t2_2004_Cycle9  CheckEnter
Dop1                      ^
.}
// увольнение
End1                      ^
End2                      ^
End3                      ^
End4                      ^
End5                      ^
End6                      ^
End7                      ^
End8                      ^

.begin
 t_2_2004.fExit;
end.
.endform