/*
 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
 �                     (c) 1994,2000 ��牆���罔� ���������                    �
 � 蹍オ�        : ���������                                                 �
 � ��痰ガ�       : ����｀皚�� �����                                          �
 � �ム瓱�        : 5.70                                                      �
 � ��Л�腑�┘    : ��．�� 竍モ� �甎��讌������ ��｀腑�� ∇ガキ�               �
 �                 (�┓���� 筮爼� N �-13)                                    �
 � �癶モ痰▲��覃 : ��爭遞 �����┤ ����罐※�                                  �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
  modif. Kirillov E.P.
*/
//modif. Kirillov E.P.
.LinkForm 'Tabel_FK_003_7_EXCEL' Prototype is 'TABT13'
.Group '�-13'
.NameInList 'TNS ���筥罔牀������ 筮爼� ��-13 v.7 Excel � ��Л襯 �����'
.F "NUL"
.var
 wkod_podr:string
.endvar
#include FK_003_Tabel_2.frn
!====================
.create view vUo as select UOWRKTABEL.NUM 
  from UOWRKTABEL order by UOWRKTABEL.NUM;
!====================
!===================================
!== ��め祠��牀��碎 �皰��
!===================================
.Procedure SummItog(wpa:word) ;
var wsortname : string ;
    ii3 :word ;
begin
 MylogWrite('SummItog '+string(wpa))

 wsortname:=if(wpa=1,tv5.tmp_t13.sortname,'')

 if tv5.getfirst tmp_t13_print where (( wpa == tmp_t13_print.pa
  and wsortname == tmp_t13_print.sortname )) <>0
 { tv5.insert tmp_t13_print set tmp_t13_print.pa:=wpa ,tmp_t13_print.sortname:=wsortname ;
                       
 }
 tv5.tmp_t13_print.perpol_dn :=tv5.tmp_t13_print.perpol_dn+tv5.tmp_t13.perpol_dn
 tv5.tmp_t13_print.perpol_ch :=tv5.tmp_t13_print.perpol_ch+tv5.tmp_t13.perpol_ch
 tv5.tmp_t13_print.vtpol_dn :=tv5.tmp_t13_print.vtpol_dn+tv5.tmp_t13.vtpol_dn
 tv5.tmp_t13_print.vtpol_ch :=tv5.tmp_t13_print.vtpol_ch+tv5.tmp_t13.vtpol_ch
 tv5.tmp_t13_print.itogo_dn :=tv5.tmp_t13_print.itogo_dn+tv5.tmp_t13.itogo_dn
 tv5.tmp_t13_print.itogo_ch :=tv5.tmp_t13_print.itogo_ch+tv5.tmp_t13.itogo_ch
 For (ii3:=1+8*i3;ii3<=8*(i3+1);inc(ii3))
 { if SymbJav[ii3]<>''
   { For (i2:=1;i2<=80;inc(i2))
    { if SymbJav[ii3]=tv5.tmp_t13_print.jav[i2] or tv5.tmp_t13_print.jav[i2]=''
      { if tv5.tmp_t13_print.jav[i2]='' 
        { tv5.tmp_t13_print.jav[i2]:=SymbJav[ii3]
          tv5.tmp_t13_print.jav_count:=tv5.tmp_t13_print.jav_count+1 ;
        }  
        tv5.tmp_t13_print.jav_DayS[i2]:=tv5.tmp_t13_print.jav_DayS[i2]+DaysJav[ii3];
        tv5.tmp_t13_print.jav_chas[i2]:=tv5.tmp_t13_print.jav_chas[i2]+Chasjav[ii3];
        break ;
      } 
    }
  }
  
  if SymbNeJav[ii3]<>''
  { For (i2:=1;i2<=80;inc(i2))
    { if SymbNeJav[ii3]=tv5.tmp_t13_print.nejav[i2] or tv5.tmp_t13_print.nejav[i2]=''
      { if tv5.tmp_t13_print.nejav[i2]='' 
        { tv5.tmp_t13_print.nejav[i2]:=SymbNeJav[ii3]
          tv5.tmp_t13_print.nejav_count:=tv5.tmp_t13_print.nejav_count+1 ;
        }  
        tv5.tmp_t13_print.nejav_DayS[i2]:=tv5.tmp_t13_print.nejav_DayS[i2]+DaysneJav[ii3];
        tv5.tmp_t13_print.nejav_chas[i2]:=tv5.tmp_t13_print.nejav_chas[i2]+Chasnejav[ii3]; 
        break ;
      } 
    }
  }
  if SymbJav[ii3]='' and SymbNeJav[ii3]='' then break ;

 } //for ii3

 tv5.update current tmp_t13_print ;

 end.
!===================================
!== ������碎 ����襯� 〓 ∇ガキ�竡 ��゛�聶
!===================================
.Procedure Nak_tmptable ;
begin
 var ww_tabn:longint;
 ww_tabn:=longint(tabn);
 MylogWrite('Nak_tmptable')

 tv5.insert into tmp_t13 set
  tmp_t13.pa :=0  ;
 MylogWrite('Nak_tmptable 1')
 tv5.tmp_t13.sortname:=GroupArray[i3+1]
 //tv5.tmp_t13.tabnT :=longint(TabN)
 //tv5.tmp_t13.tabnS:=if(Tabn_Format=0,string(longint(TabN),10,0),Tabn);
 //tv5.tmp_t13.tabnT:=if(Tabn_Format=0,longint(Tabn),0);
 tv5.tmp_t13.tabnT:=longint(Tabn)
 tv5.tmp_t13.FioT:=FIO //GetSurnameWithInitials(FIO)
 tv5.tmp_t13.DolgT:=DolPer[i3+1]
 tv5.tmp_t13.RazrjadT:=RazrjadPer[i3+1]
 tv5.tmp_t13.OkladT :=OkladPer[i3+1]
 tv5.tmp_t13.perpol_dn :=PerPolDays[1+i3]
 tv5.tmp_t13.perpol_ch :=PerPolchas[1+i3]
 tv5.tmp_t13.vtpol_dn :=VtPolDays[1+i3]
 tv5.tmp_t13.vtpol_ch :=VtPolChas[1+i3]
 tv5.tmp_t13.itogo_dn :=AllDays[1+i3]
 tv5.tmp_t13.itogo_ch :=AllChas[1+i3]
 tv5.tmp_t13.nom_per  :=i3
// tv5.tmp_t13.rejim :=RejimPer[i3+1]
// tv5.tmp_t13.plan_dn:=PlanDays[i3+1]
// tv5.tmp_t13.plan_chas:=PlanChas[i3+1]
 MylogWrite('Nak_tmptable 2')
 for(i2:=1;i2<=8;i2:=i2+1)
 { tv5.tmp_t13.jav[i2]:=Symbjav[i2+8*i3]
   tv5.tmp_t13.jav_DayS[i2]:=Daysjav[i2+8*i3]
   tv5.tmp_t13.jav_chas[i2]:=Chasjav[i2+8*i3]
   tv5.tmp_t13.nejav[i2]:=SymbNejav[i2+8*i3]
   tv5.tmp_t13.nejav_days[i2]:=DaysNejav[i2+8*i3]
   tv5.tmp_t13.nejav_chas[i2]:=ChasNejav[i2+8*i3]
 }
 MylogWrite('Nak_tmptable 3')
 tv5.tmp_t13.days[01]:= If(D1='X',D1,Codetable[1+31*i3])  
 tv5.tmp_t13.days[02]:=If(D2='X',D2,Codetable[2+31*i3])  
 tv5.tmp_t13.days[03]:=If(D3='X',D3,Codetable[3+31*i3])
 tv5.tmp_t13.days[04]:=If(D4='X',D4,Codetable[4+31*i3])  
 tv5.tmp_t13.days[05]:=If(D5='X',D5,Codetable[5+31*i3])  
 tv5.tmp_t13.days[06]:=If(D6='X',D6,Codetable[6+31*i3])  
 tv5.tmp_t13.days[07]:=If(D7='X',D7,Codetable[7+31*i3])  
 tv5.tmp_t13.days[08]:=If(D8='X',D8,Codetable[8+31*i3])   
 tv5.tmp_t13.days[09]:=If(D9='X',D9,Codetable[9+31*i3])  
 tv5.tmp_t13.days[10]:=If(D10='X',D10,Codetable[10+31*i3])  
 tv5.tmp_t13.days[11]:=If(D11='X',D11,Codetable[11+31*i3])  
 tv5.tmp_t13.days[12]:=If(D12='X',D12,Codetable[12+31*i3])  
 tv5.tmp_t13.days[13]:=If(D13='X',D13,Codetable[13+31*i3]) 
 tv5.tmp_t13.days[14]:=If(D14='X',D14,Codetable[14+31*i3]) 
 tv5.tmp_t13.days[15]:=If(D15='X',D15,Codetable[15+31*i3]) 
 tv5.tmp_t13.days[16]:=If(D16='X',D16,Codetable[16+31*i3]) 
 tv5.tmp_t13.days[17]:=If(D17='X',D17,Codetable[17+31*i3]) 
 tv5.tmp_t13.days[18]:=If(D18='X',D18,Codetable[18+31*i3]) 
 tv5.tmp_t13.days[19]:=If(D19='X',D19,Codetable[19+31*i3]) 
 tv5.tmp_t13.days[20]:=If(D20='X',D20,Codetable[20+31*i3]) 
 tv5.tmp_t13.days[21]:=If(D21='X',D21,Codetable[21+31*i3]) 
 tv5.tmp_t13.days[22]:=If(D22='X',D22,Codetable[22+31*i3]) 
 tv5.tmp_t13.days[23]:=If(D23='X',D23,Codetable[23+31*i3]) 
 tv5.tmp_t13.days[24]:=If(D24='X',D24,Codetable[24+31*i3]) 
 tv5.tmp_t13.days[25]:=If(D25='X',D25,Codetable[25+31*i3]) 
 tv5.tmp_t13.days[26]:=If(D26='X',D26,Codetable[26+31*i3]) 
 tv5.tmp_t13.days[27]:=If(D27='X',D27,Codetable[27+31*i3]) 
 tv5.tmp_t13.days[28]:=If(D28='X',D28,Codetable[28+31*i3]) 
 tv5.tmp_t13.days[29]:=If(D29='X',D29,Codetable[29+31*i3]) 
 tv5.tmp_t13.days[30]:=If(D30='X',D30,Codetable[30+31*i3]) 
 tv5.tmp_t13.days[31]:=If(D31='X',D31,Codetable[31+31*i3]) 
 MylogWrite('Nak_tmptable 4')

 tv5.tmp_t13.chasf[01]:=If(D1='X','',ChasTable[1+31*i3])
 tv5.tmp_t13.chasf[02]:=If(D2='X','',ChasTable[2+31*i3])
 tv5.tmp_t13.chasf[03]:=If(D3='X','',ChasTable[3+31*i3])
 tv5.tmp_t13.chasf[04]:=If(D4='X','',ChasTable[4+31*i3])
 tv5.tmp_t13.chasf[05]:=If(D5='X','',ChasTable[5+31*i3])
 tv5.tmp_t13.chasf[06]:=If(D6='X','',ChasTable[6+31*i3])
 tv5.tmp_t13.chasf[07]:=If(D7='X','',ChasTable[7+31*i3])
 tv5.tmp_t13.chasf[08]:=If(D8='X','',ChasTable[8+31*i3])
 tv5.tmp_t13.chasf[09]:=If(D8='X','',ChasTable[9+31*i3])
 tv5.tmp_t13.chasf[10]:=If(D10='X','',ChasTable[10+31*i3])
 tv5.tmp_t13.chasf[11]:=If(D11='X','',ChasTable[11+31*i3])
 tv5.tmp_t13.chasf[12]:=If(D12='X','',ChasTable[12+31*i3])
 tv5.tmp_t13.chasf[13]:=If(D13='X','',ChasTable[13+31*i3])
 tv5.tmp_t13.chasf[14]:=If(D14='X','',ChasTable[14+31*i3]) 
 tv5.tmp_t13.chasf[15]:=If(D15='X','',ChasTable[15+31*i3]) 
 tv5.tmp_t13.chasf[16]:=If(D16='X','',ChasTable[16+31*i3])
 tv5.tmp_t13.chasf[17]:=If(D17='X','',ChasTable[17+31*i3])
 tv5.tmp_t13.chasf[18]:=If(D18='X','',ChasTable[18+31*i3])
 tv5.tmp_t13.chasf[19]:=If(D19='X','',ChasTable[19+31*i3])
 tv5.tmp_t13.chasf[20]:=If(D20='X','',ChasTable[20+31*i3])
 tv5.tmp_t13.chasf[21]:=If(D21='X','',ChasTable[21+31*i3])
 tv5.tmp_t13.chasf[22]:=If(D22='X','',ChasTable[22+31*i3])
 tv5.tmp_t13.chasf[23]:=If(D23='X','',ChasTable[23+31*i3])
 tv5.tmp_t13.chasf[24]:=If(D24='X','',ChasTable[24+31*i3])
 tv5.tmp_t13.chasf[25]:=If(D25='X','',ChasTable[25+31*i3])
 tv5.tmp_t13.chasf[26]:=If(D26='X','',ChasTable[26+31*i3])
 tv5.tmp_t13.chasf[27]:=If(D27='X','',ChasTable[27+31*i3])
 tv5.tmp_t13.chasf[28]:=If(D28='X','',ChasTable[28+31*i3])
 tv5.tmp_t13.chasf[29]:=If(D29='X','',ChasTable[29+31*i3])
 tv5.tmp_t13.chasf[30]:=If(D30='X','',ChasTable[30+31*i3])
 tv5.tmp_t13.chasf[31]:=If(D31='X','',ChasTable[31+31*i3])
 tv5.tmp_t13.clsch:=comp(lschnum)
 tv5.update current tmp_t13 ;
 MylogWrite('Nak_tmptable 5')
 // メ�� ≡� x - 皰 ����� �� �ョ���ガ
 flObjStroyOk:=True;
 for(j:=1;J<=31;j++)
 { if tv5.tmp_t13.days[j]<>'X' then 
   { flObjStroyOk:=False
     break
   }
 }
 if flObjStroyOk
 {  tv5.delete current tmp_t13;
    Exit;
 }   
 SummItog(1)
 SummItog(2)
end.
!===================================
!== �襤メ皋 � Excel
!===================================
.Procedure PrintJav(wi:word) ;
begin
   if tv5.tmp_t13_print.jav[wi]<>''
   { MyxlWrite(tv5.tmp_t13_print.jav[wi] ,rowcur,colcur,3)
     MyxlWrite('' ,rowcur,colcur,3)
//     MyxlWrite(string(tv5.tmp_t13_print.jav_DayS[wi],0,0)
//       +'('+WriteTimeD(tv5.tmp_t13_print.jav_chas[wi])+')' ,rowcur,colcur,3)
     MyxlWrite(string(tv5.tmp_t13_print.jav_DayS[wi],0,0)
        +if(tv5.tmp_t13_print.jav_chas[wi]<>0,'('+string(tv5.tmp_t13_print.jav_chas[wi],0,1)+')','') ,rowcur,colcur,3)

   }
   else
   { MyxlWrite('' ,rowcur,colcur,3)
     MyxlWrite('' ,rowcur,colcur,3)
     MyxlWrite('' ,rowcur,colcur,3)
   }
 end.
.Procedure PrintNeJav(wi:word) ;
begin
   if tv5.tmp_t13_print.Nejav[wi]<>''
   {
     MyxlWrite(tv5.tmp_t13_print.Nejav[wi] ,rowcur,colcur,3)
//     MyxlWrite(string(tv5.tmp_t13_print.Nejav_DayS[wi],0,0)
//     +'('+WriteTimeD(tv5.tmp_t13_print.nejav_chas[wi])+')' ,rowcur,colcur,3)
     MyxlWrite(string(tv5.tmp_t13_print.Nejav_DayS[wi],0,0)+
       if(tv5.tmp_t13_print.nejav_chas[wi]<>0,'('+string(tv5.tmp_t13_print.nejav_chas[wi],0,1)+')','') ,rowcur,colcur,3)
   }
   else
   {  MyxlWrite('' ,rowcur,colcur,3)
      MyxlWrite('' ,rowcur,colcur,3)
   }
 end.
.Procedure PrintRec(wpa : word ) ;
begin
 colcur:=1 ;
 MylogWrite('PrintRec '+string(wpa))
 case wpa of
 0 : // tabn
 { if tv5.getfirst tmp_t13_print where (( 0== tmp_t13_print.pa and tmp_t13_tabn.sortname == tmp_t13_print.sortname 
                     and tmp_t13_tabn.sort_d == tmp_t13_print.sort_d 
                     and tmp_t13_tabn.tabnT == tmp_t13_print.tabnT 
                     and tmp_t13_tabn.nom_per == tmp_t13_print.nom_per
                     //and tmp_t13_tabn.tabnS == tmp_t13_print.tabnS 
                     ))=0 {}
   /*                  
   tv2.Rejim2:=word(tv5.tmp_t13_print.rejim);
   if tv2.getfirst klndr=0
   { For (i1:=1;i1<=31;inc(i1))
     { if tv2.KLNDR.DAYCHAS[i1]>0 or tv2.KLNDR.DAYMIN[i1]>0
       { //tv5.tmp_t13_print.plan_dn:=tv5.tmp_t13_print.plan_dn+1
         //tv5.tmp_t13_print.plan_chas:=tv5.tmp_t13_print.plan_chas+tv2.KLNDR.DAYCHAS[i1]+tv2.KLNDR.DAYMIN[i1]/60
       }  
     }               
   } 
   */ 
   w_num:=w_num+1 ;
   xlMergecells(rowcur, 1, rowcur+3,1)
   xlMergecells(rowcur, 2, rowcur+2,2)
   xlMergecells(rowcur, 3, rowcur+3,3)
   xlMergecells(rowcur,21, rowcur+1,21)
   xlMergecells(rowcur+2,21, rowcur+3,21)

//1 痰牀��
   MyxlWrite(string(w_num) ,rowcur,colcur,3)
   MyxlWrite(tv5.tmp_t13_print.FioT
// 〓�♂� 皰 ��ぎ 瓩カ�碎 �� ��痰牀���   
      +chr(10)+tv5.tmp_t13_print.DolgT
      +chr(10)+tv5.tmp_t13_print.RazrjadT
//1.1348 - 磧��碎 �����     +chr(10)+tv5.tmp_t13_print.OkladT
              ,rowcur,colcur,3)
   MyxlWrite(chr(39)+string(tv5.tmp_t13_print.tabnT) ,rowcur,colcur,3)
   for(i2:=1;i2<=15;i2:=i2+1)
     MyxlWrite(tv5.tmp_t13_print.days[i2] ,rowcur,colcur,3)
   MyxlWrite('X',rowcur,colcur,3)

   var PRINT_FORMULA:boolean;
   Print_Formula:=False

   if Print_Formula
   { MyxlWrite('=COUNTIFS(D'+string(rowcur)+':S'+string(rowcur)+')', rowcur,colcur,3) //����������
     MyxlWrite('=S'+string(rowcur)+'+S'+string(rowcur+1), rowcur,colcur,3)
   }
   else
   { MyxlWrite(string(tv5.tmp_t13_print.perpol_dn,0,0) ,rowcur,colcur,3)
     MyxlWrite(string(tv5.tmp_t13_print.itogo_dn,0,0) ,rowcur,colcur,3)
   }  
   PrintJav(1)
   PrintJav(2)
   PrintNeJav(1)
   PrintNeJav(2)
//2 痰牀��
   rowcur:=rowcur+1
   colcur:=4
   for(i2:=1;i2<=15;i2:=i2+1)
//     MyxlWrite(chr(39)+WriteTimeS(tv5.tmp_t13_print.chasf[i2]) ,rowcur,colcur,3)
     MyxlWrite(if(tv5.tmp_t13_print.chasf[i2]<>'0.00',tv5.tmp_t13_print.chasf[i2],'') ,rowcur,colcur,3)

   MyxlWrite('X',rowcur,colcur,3)
   //MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.perpol_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.perpol_ch,0,0) ,rowcur,colcur,3)
   colcur:=colcur+1
   //MyxlWrite(string(tv5.tmp_t13_print.plan_dn,0,0) ,rowcur,colcur,3)
   PrintJav(3)
   PrintJav(4)
   PrintNeJav(3)
   PrintNeJav(4)

//3 痰牀��
   rowcur:=rowcur+1
   colcur:=4
   for(i2:=16;i2<=31;i2:=i2+1)
     MyxlWrite(tv5.tmp_t13_print.days[i2] ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.vtpol_dn,0,0) ,rowcur,colcur,3)
//   MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.itogo_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.itogo_ch,0,0) ,rowcur,colcur,3)

   PrintJav(5)
   PrintJav(6)
   PrintNeJav(5)
   PrintNeJav(6)
//4 痰牀��
   rowcur:=rowcur+1
   colcur:=2
//   MyxlWrite('�ウ━:'+string(tv5.tmp_t13_print.rejim,0,0)
//     +' き�='+string(tv5.tmp_t13_print.plan_dn,0,0)
//     +', �='+WriteTimeD(tv5.tmp_t13_print.plan_chas) ,rowcur,colcur,3)   
   MyxlWrite('' ,rowcur,colcur,3)   

   colcur:=4
   for(i2:=16;i2<=31;i2:=i2+1)
//   MyxlWrite(chr(39)+WriteTimeS(tv5.tmp_t13_print.chasf[i2]) ,rowcur,colcur,3)
     MyxlWrite(if(tv5.tmp_t13_print.chasf[i2]<>'0.00',tv5.tmp_t13_print.chasf[i2],'') ,rowcur,colcur,3)
// MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.vtpol_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.vtpol_ch,0,0) ,rowcur,colcur,3)
   colcur:=colcur+1
   //MyxlWrite(string(tv5.tmp_t13_print.plan_chas,0,1) ,rowcur,colcur,3)
   PrintJav(7)
   PrintJav(8)
   PrintNeJav(7)
   PrintNeJav(8)
 }
 1,2:
 { 
//   rowcur:=rowcur+1 ; 
   xlMergecells(rowcur,21, rowcur+1,21)
   xlMergecells(rowcur+2,21, rowcur+3,21)

   colcur:=2 ;
   case wpa of
   1:
   { if tv5.getfirst tmp_t13_print where (( 1== tmp_t13_print.pa and tmp_t13.sortname == tmp_t13_print.sortname ))=0 {} ;
     MyxlWrite('�皰�� '+tv5.tmp_t13_print.sortname ,rowcur,colcur,3)
   }
   2:
   { if tv5.getfirst tmp_t13_print where (( 2== tmp_t13_print.pa  ))=0 {}
     MyxlWrite('�皰�� '+tv5.tmp_t13_print.sortname ,rowcur,colcur,3)
   }
   end ;
   xlSetFontStyle(xlBold, rowcur, 1, rowcur, 19)
   xlMergecells(rowcur, 2, rowcur, 19)
// 痰牀�� 1
   colcur:=20 ;
   MyxlWrite(string(tv5.tmp_t13_print.perpol_dn,0,0) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.itogo_dn,0,0) ,rowcur,colcur,3)

   PrintJav(1)
   PrintJav(2)
   PrintNeJav(1)
   PrintNeJav(2)
// 痰牀�� 2
   rowcur:=rowcur+1 ; 
   colcur:=20 ;
//   MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.perpol_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.perpol_ch,0,0) ,rowcur,colcur,3)
   MyxlWrite('',rowcur,colcur,3)
   PrintJav(3)
   PrintJav(4)
   PrintNeJav(3)
   PrintNeJav(4)
// 痰牀�� 3
   rowcur:=rowcur+1 ; 
   colcur:=20 ;
   MyxlWrite(string(tv5.tmp_t13_print.vtpol_dn,0,0) ,rowcur,colcur,3)
//   MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.itogo_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.itogo_ch,0,0) ,rowcur,colcur,3)
   PrintJav(5)
   PrintJav(6)
   PrintNeJav(5)
   PrintNeJav(6)
// 痰牀�� 4
   rowcur:=rowcur+1 ; 
   colcur:=20 ;
//   MyxlWrite(chr(39)+WriteTimeD(tv5.tmp_t13_print.vtpol_ch) ,rowcur,colcur,3)
   MyxlWrite(string(tv5.tmp_t13_print.vtpol_ch,0,0) ,rowcur,colcur,3)
   MyxlWrite('' ,rowcur,colcur,3)
   PrintJav(7)
   PrintJav(8)
   PrintNeJav(7)
   PrintNeJav(8)



   wjav_col:=9 ;
   MylogWrite('PrintRec wjav_col='+string(wjav_col))
   while wjav_col<79
   { 
     MylogWrite('PrintRec wjav_col='+string(wjav_col))
     if wjav_col>tv5.tmp_t13_print.jav_count or wjav_col>tv5.tmp_t13_print.nejav_count then break ;
     rowcur:=rowcur+1 ; 
     colcur:=22 ;


     PrintJav(wjav_col+1)
     PrintJav(wjav_col+2)
     PrintNeJav(wjav_col+1)
     PrintNeJav(wjav_col+2)
     wjav_col:=wjav_col+2 ;
   }
 }
 
 end ;
 end.
!=========================
! ���罔��├�罔� �ョ�皋 ��．��
!=========================
.Procedure xls_tabel_init;
begin
//  logfilekl:=true ;
 // message('1')
  InitDop;
  MyXLInit('TNS_TABT13.xls') ; 
  logfilekl:=true ;
  XlSetActiveSheetByName('�甄�↓襯 �｀Л�腑���')
  rowcur:=2
  MyXlCreaMatrix(100,4) ;
  rowcur:=rowcur-1;
  
  vUO._Loop UOWRKTABEL
  {  rowcur++;colcur:=1;
    MyxlWrite(vUO.UOWRKTABEL.NUM,rowcur,colcur,3) 
    MyxlWrite(vUO.UOWRKTABEL.NAME,rowcur,colcur,3)
    // 瘍���碎 錢���
    MyxlWrite(if( (vUO.UOWRKTABEL.PRIZ and 2) >0,'1',''),rowcur,colcur,3)

  }
  MyxlWriteMatrix(rowcur);
  xlFreeMatrix;
  // FK_003_Tabel_Buh.Frn
  //PrintAnalitik;
  Sbor_init(11) // か� �ムュ�ぎ�

  XlSetActiveSheetByName('��．�� �-13')
  matrixkl:=False
 // message('2')
  MylogWrite('========Start===========')
  MyxlWrite(Pred1,8,1,3)
//  MyxlWrite(if((tp_option and 2)>0,Podr,Podr1),12,1,3)
  MyxlWrite(Podr1,12,1,3)
  MyxlWrite(chr(13)+PeriodBeginning,15,28,3) 
  MyxlWrite(chr(13)+PeriodEnding,15,30,3)
  if False
  { wkod_podr:=substr(Podr,pos(',',Podr)+1,100)
  }
  else
  { wkod_podr:=substr(Podr,length('��む�Гカキ┘ � ')+1,100)
    wkod_podr:=trim(substr(wkod_Podr,1,pos(',',wkod_podr)-1))
  }
  //message('wkod_podr='+wkod_podr
  //  +chr(13)+Podr) 
  If (not flHalf)
    Cntd:=last_Day(StrToDate(PeriodBeginning,'DD/MM/YYYY'))
  MylogWrite('========Start===========')
 end. 
!=========================
.Procedure xls_tabel_end;
begin
  tv5._loop tmp_t13
  { MylogWrite('�珮��� '+tv5.tmp_t13.sortname)
    rowcur:=rowcur+1 ; colcur:=1 ;
    xlMergecells(rowcur, 2, rowcur, 21)
    MyxlWrite(tv5.tmp_t13.sortname,rowcur,2,3)
    xlSetFontStyle(xlBold, rowcur, 1, rowcur, 21)
    xlSetFontSize(9, rowcur, 1, rowcur, 21)
    w_num:=0 ;

    tv5._loop tmp_t13_tabn
    {
       Sbor_Add(11,tv5.tmp_t13_tabn.clsch,'','',0,0,0)
      rowcur:=rowcur+1
      PrintRec(0)
      MylogWrite('��´ '+string(tv5.tmp_t13_tabn.tabnT))
    } //.{table 'tv5.tmp_t13_tabn'
    if true // GROUP_TBL>0
    { rowcur:=rowcur+1
      PrintRec(1)
    } 
  } //.{table 'tv5.tmp_t13'
  if GROUP_TBL>0 //and (tp_option and 32)=0
  {  
    if tv5.getfirst tmp_t13_it=0
    { rowcur:=rowcur+1
      PrintRec(2)
    }
  }

  xlWrapText(headerstrcount+1,1,rowcur,31)
  MyxlFrameCells(headerstrcount,1,rowcur,31,1 or 2 or 4 or 8 or 16 or 32);
  rowcur:=rowcur+3
  xlSetFontStyle(xlBold, rowcur, 1, rowcur, 31)
  MyxlWrite('�癶モ痰▲���� ��罧',rowcur,1,3)
  MyxlWrite('��｀皚┴ ��',rowcur,16,3)

  MyxlWrite(dolRuk1 ,rowcur,20,3)
  MyxlWrite(FioRuk1 ,rowcur,26,3)
  rowcur:=rowcur+1
  MyxlWrite('ぎ�Ν�痰�',rowcur,3,3)   
  MyxlWrite('��く�瘡',rowcur,5,3)   
  MyxlWrite('��瘉�籥�→� ��く�瓱',rowcur,7,3)

  MyxlWrite('ぎ�Ν�痰�',rowcur,20,3)   
  MyxlWrite('��く�瘡',rowcur,23,3)   
  MyxlWrite('��瘉�籥�→� ��く�瓱',rowcur,26,3)

  rowcur:=rowcur+2
  xlSetFontStyle(xlBold, rowcur, 1, rowcur, 31)
  MyxlWrite('�礫�〓え皀�� 痰珮�矣爿��� ��む�Гカキ��',rowcur,1,3)


  if true
  {  MyxlWrite('"_____"__________________20__�.',rowcur,16,3)
  }
  else  
  {
    MyxlWrite('��｀皚┴ �����',rowcur,16,3)
    MyxlWrite(dolRuk2 ,rowcur,20,3)
    MyxlWrite(FioRuk2 ,rowcur,26,3)

    rowcur:=rowcur+1
    MyxlWrite('ぎ�Ν�痰�',rowcur,3,3)   
    MyxlWrite('��く�瘡',rowcur,5,3)   
    MyxlWrite('��瘉�籥�→� ��く�瓱',rowcur,7,3)
   
    MyxlWrite('ぎ�Ν�痰�',rowcur,20,3)   
    MyxlWrite('��く�瘡',rowcur,23,3)   
    MyxlWrite('��瘉�籥�→� ��く�瓱',rowcur,26,3)
  }


  xlRunMacro('AfterForm') ;
  if matrixkl then
  { MyxlWriteMatrix(rowcur) ;
    xlFreeMatrix ;
  }
  xlFreeMatrix ;
  matrixkl:=False


  // �ムュ�る
  if XlSetActiveSheetByName('�ムュ�る')
  { //'�ムュ�る'
    vtmp_rep1.wwpa:=11;
    rowcur:=2;
    MyXlCreaMatrix(100,20) ;
    rowcur:=rowcur-1;
    
    vtmp_rep1._loop tmp_sbor
    { lschnum:=vtmp_rep1.tmp_sbor.sortname
      if tv1.getfirst lschet=0 {}
      if tv1.getfirst Persons=0 {}
      mylogwrite(' �ムュ�� '+string(tv1.lschet.tabn)+'/'+tv1.lschet.strtabn)
      tv1._Loop perexod where ((
          lschet.nrec== perexod.clsch
      and StrToDate(PeriodBeginning,'DD/MM/YYYY') <<=perexod.datizm
      and StrToDate(PeriodEnding   ,'DD/MM/YYYY') >>=perexod.datizm
      ))
      { rowcur++; colcur:=1;
        mylogwrite(' --- '+string(rowcur))
        //���	��� �	���� ������	���� ���������
        MyxlWrite(tv1.Persons.fio,rowcur,colcur,3) 
        MyxlWrite(string(tv1.lschet.tabn),rowcur,colcur,3) 
        MyxlWrite(DateToStr(tv1.perexod.datizm,'DD/MM/YYYY'),rowcur,colcur,3) 
        MyxlWrite(DateToStr(tv1.perexod.DATOK ,'DD/MM/YYYY'),rowcur,colcur,3) 
        tv1.wc_katpodr:=tv1.perexod.cexp
        if tv1.getfirst katpodr  =0 {}
        //��� ��む�Гカキ��	��む�Гカキ┘	
        MyxlWrite(tv1.katpodr.kod,rowcur,colcur,3) 
        MyxlWrite(tv1.katpodr.name,rowcur,colcur,3) 
        //�┐ ぅ閧カ讚�痰�	
        flObjStroyOk:=False
        if tv1.getfirst katkau=0
        {
          for(i3:=1;i3<=6;i3++)
            if tv1.perexod.tbld[i3]=tv1.katkau.kodgroup and tv1.perexod.CKAUD[i3]>0
             { flObjStroyOk:=True;
               GetAnyKau(cgAkSimple, tv1.perexod.tbld[i3], tv1.perexod.CKAUD[i3])               
               MyxlWrite(GivenAnName(1),rowcur,colcur,3) 
               break;
             }
          if not flObjStroyOk
          { if tv1.getfirst otpdop=0
             for(i3:=1;i3<=6;i3++)
               if tv1.otpdop.tbld[i3]=tv1.katkau.kodgroup and tv1.OtpDop.CKAUD[i3]>0
               { flObjStroyOk:=True;
                 GetAnyKau(cgAkSimple, tv1.OtpDop.TBLD[i3], tv1.OtpDop.CKAUD[i3])               
                 MyxlWrite(GivenAnName(1),rowcur,colcur,3) 
                 break;
             }
          }
        } //if tv1.getfirst katkau=0
        if not flObjStroyOk
        { colcur:=colcur+1;
        }            
        /*  
         cgAnName   = 1; // ��━キ����┘ ���
         cgAnStrKod = 2; // 瓱痰ガ�襯 String(NRec), 珮膈襯 SpKau.Code
         cgAnStrKey = 3; // ��鈑 か� 甌珥�牀→� � �砒モ��, ��爛ぅ�錺矚� �� ��痰牀���� (StrName+StrKod) (StrKod+StrName)
         cgAnNode   = 4; // 痰牀��〓� �爛め��←キ┘ cNode (�謌メ皰濶ィ� 蹕ガキ��)
         cgAnAbbr   = 5; // 祗┴��讚覃 痰牀���覃 ID か� �甎��讌������ � 筮爼祀�� (!!!�� ├�キ錺矚�!!!)
         cgAnCode   = 6; // ���, ��� ���※�� か� 甌珥�牀→� � ���������; ��Ε� �キ閧赱�, ��Ε� °碎 �ャ�┴��讚覓
         cgAnSort   = 7; // 痰牀�� か� 甌珥�牀→�, �� �� か� �珮���牀→�
        */
        
        //��� �♀オ�� 痰�-��	��━キ����┘ �♀オ��
        flObjStroyOk:=False
        for(i3:=1;i3<=6;i3++)
          if tv1.perexod.tbld[i3]=40 and tv1.perexod.CKAUD[i3]>0
             { flObjStroyOk:=True;
               GetAnyKau(cgAkSimple, tv1.perexod.TBLD[i3], tv1.perexod.CKAUD[i3])
               MyxlWrite(GivenAnName(cgAnCode),rowcur,colcur,3) 
               MyxlWrite(GivenAnName(1),rowcur,colcur,3) 
               break;
             }
        
        if not flObjStroyOk
        { if tv1.getfirst otpdop=0
           for(i3:=1;i3<=6;i3++)
             if tv1.otpdop.tbld[i3]=40 and tv1.OtpDop.CKAUD[i3]>0
             { flObjStroyOk:=True;
               GetAnyKau(cgAkSimple, tv1.OtpDop.TBLD[i3], tv1.OtpDop.CKAUD[i3])               
               MyxlWrite(GivenAnName(cgAnCode),rowcur,colcur,3) 
               MyxlWrite(GivenAnName(1),rowcur,colcur,3) 
               break;
             }
        }        
        if not flObjStroyOk
        { colcur:=colcur+2;
        }
      }
    } //vtmp_rep1._loop tmp_sbor
    MyxlWriteMatrix(rowcur) ;
    xlFreeMatrix ;
    matrixkl:=False
  } // if XlSetActiveSheetByName('�ムュ�る')
  
  // 甌縲��キ┘ �����
  wkod_podr:=replace(wkod_podr,'\','')
  wkod_podr:=replace(wkod_podr,'/','')
  wkod_podr:=replace(wkod_podr,'_','')
  wkod_podr:=replace(wkod_podr,'.','')
  wkod_podr:=replace(wkod_podr,':','')
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  //fbasname:=MyExDirectoryOut+ wPictbook+'_'+wkod_podr+'.xls' ;
  fbasname:=MyExDirectoryOut+'T13_'+DateToStr(date(1,rep_month,rep_year),'YYYY_MM_')+wkod_podr+'.xls' ;
  
  if fileexist(fbasname) deletefile(fbasname) 
  
  xlSaveAsWorkBookByName(wPictbook, fbasname)
  XLGETACTIVEWORKBOOKNAME(wPictBook) ;
  xlSaveWorkBookByName(wPictBook)
  if False //(tp_option and 4)>0
  {  xlCloseWorkBookByName(wPictBook)
  }
  
  XLKILLEXCEL ;
   end. 
!=========================
.p 56
.var
  FirstLine:Boolean
  LineCount:Integer
  LinesPerPage:Integer
  TimePrec:Word
.endvar
.fields
Pred1
Podr1
ObjStroyCode ObjStroyName
PeriodBeginning PeriodEnding
// ������ �襤���

Npp
GetSurnameWithInitials(FIO)

TabN

If(D1='X',D1,Codetable[1+31*i3])  
If(D2='X',D2,Codetable[2+31*i3])  
If(D3='X',D3,Codetable[3+31*i3])
If(D4='X',D4,Codetable[4+31*i3])  
If(D5='X',D5,Codetable[5+31*i3])  
If(D6='X',D6,Codetable[6+31*i3])  
If(D7='X',D7,Codetable[7+31*i3])  
If(D8='X',D8,Codetable[8+31*i3])   
If(D9='X',D9,Codetable[9+31*i3])  
If(D10='X',D10,Codetable[10+31*i3])  
If(D11='X',D11,Codetable[11+31*i3])  
If(D12='X',D12,Codetable[12+31*i3])  
If(D13='X',D13,Codetable[13+31*i3]) 
If(D14='X',D14,Codetable[14+31*i3]) 
If(D15='X',D15,Codetable[15+31*i3]) 

PerPolDays[1+i3] 

Symbjav[1+8*i3] 
If(Daysjav[1+8*i3]>0,string(Daysjav[1+8*i3]),'')
If(Chasjav[1+8*i3]>0,'('+string(Chasjav[1+8*i3])+')','')
Symbjav[2+8*i3] 
If(Daysjav[2+8*i3]>0,string(Daysjav[2+8*i3]),'')
If(Chasjav[2+8*i3]>0,'('+string(Chasjav[2+8*i3])+')','')
SymbNejav[1+8*i3] 
If(DaysNejav[1+8*i3]>0,string(DaysNejav[1+8*i3]),'')
If(ChasNejav[1+8*i3]>0,'('+string(ChasNejav[1+8*i3])+')','')
SymbNejav[2+8*i3] 
If(DaysNejav[2+8*i3]>0,string(DaysNejav[2+8*i3]),'')
If(ChasNejav[2+8*i3]>0,'('+string(ChasNejav[2+8*i3])+')','')

if(flHalf, string(PerPolDays[1+i3]), string(AllDays[1+i3])) 



If(D1='X','',ChasTable[1+31*i3])
If(D2='X','',ChasTable[2+31*i3])
If(D3='X','',ChasTable[3+31*i3])
If(D4='X','',ChasTable[4+31*i3])
If(D5='X','',ChasTable[5+31*i3])
If(D6='X','',ChasTable[6+31*i3])
If(D7='X','',ChasTable[7+31*i3])
If(D8='X','',ChasTable[8+31*i3])
If(D8='X','',ChasTable[8+31*i3])
If(D10='X','',ChasTable[10+31*i3])
If(D11='X','',ChasTable[11+31*i3])
If(D12='X','',ChasTable[12+31*i3])
If(D13='X','',ChasTable[13+31*i3])
If(D14='X','',ChasTable[14+31*i3]) 
If(D15='X','',ChasTable[15+31*i3]) 

string(PerPolchas[1+i3])

Symbjav[3+8*i3] 
If(Daysjav[3+8*i3]>0,string(Daysjav[3+8*i3]),'')
If(Chasjav[3+8*i3]>0,'('+string(Chasjav[3+8*i3])+')','')
Symbjav[4+8*i3]
If(Daysjav[4+8*i3]>0,string(Daysjav[4+8*i3]),'')
If(Chasjav[4+8*i3]>0,'('+string(Chasjav[4+8*i3])+')','')
SymbNejav[3+8*i3] 
If(DaysNejav[3+8*i3]>0,string(DaysNejav[3+8*i3]),'')
If(ChasNejav[3+8*i3]>0,'('+string(ChasNejav[3+8*i3])+')','')
SymbNejav[4+8*i3]
If(DaysNejav[4+8*i3]>0,string(DaysNejav[4+8*i3]),'')
If(ChasNejav[4+8*i3]>0,'('+string(ChasNejav[4+8*i3])+')','')



'' //DolPer[i3+1]
'' //RazrjadPer[i3+1]

If(D16='X',D16,Codetable[16+31*i3]) 
If(D17='X',D17,Codetable[17+31*i3]) 
If(D18='X',D18,Codetable[18+31*i3]) 
If(D19='X',D19,Codetable[19+31*i3]) 
If(D20='X',D20,Codetable[20+31*i3]) 
If(D21='X',D21,Codetable[21+31*i3]) 
If(D22='X',D22,Codetable[22+31*i3]) 
If(D23='X',D23,Codetable[23+31*i3]) 
If(D24='X',D24,Codetable[24+31*i3]) 
If(D25='X',D25,Codetable[25+31*i3]) 
If(D26='X',D26,Codetable[26+31*i3]) 
If(D27='X',D27,Codetable[27+31*i3]) 
If(D28='X',D28,Codetable[28+31*i3]) 
If(D29='X',D29,Codetable[29+31*i3]) 
If(D30='X',D30,Codetable[30+31*i3]) 
If(D31='X',D31,Codetable[31+31*i3]) 

if(flHalf,'',VtPolDays[1+i3]) 

Symbjav[5+8*i3] 
If(Daysjav[5+8*i3]>0,string(Daysjav[5+8*i3]),'')
If(Chasjav[5+8*i3]>0,'('+string(Chasjav[5+8*i3])+')','')
Symbjav[6+8*i3] 
If(Daysjav[6+8*i3]>0,string(Daysjav[6+8*i3]),'')
If(Chasjav[6+8*i3]>0,'('+string(Chasjav[6+8*i3])+')','')
SymbNejav[5+8*i3] 
If(DaysNejav[5+8*i3]>0,string(DaysNejav[5+8*i3]),'')
If(ChasNejav[5+8*i3]>0,'('+string(ChasNejav[5+8*i3])+')','')
SymbNejav[6+8*i3] 
If(DaysNejav[6+8*i3]>0,string(DaysNejav[6+8*i3]),'')
If(ChasNejav[6+8*i3]>0,'('+string(ChasNejav[6+8*i3])+')','')



'' //OkladPer[i3+1]
if(flHalf, string(PerPolChas[1+i3]), string(AllChas[1+i3]))


If(D16='X','',ChasTable[16+31*i3])
If(D17='X','',ChasTable[17+31*i3])
If(D18='X','',ChasTable[18+31*i3])
If(D19='X','',ChasTable[19+31*i3])
If(D20='X','',ChasTable[20+31*i3])
If(D21='X','',ChasTable[21+31*i3])
If(D22='X','',ChasTable[22+31*i3])
If(D23='X','',ChasTable[23+31*i3])
If(D24='X','',ChasTable[24+31*i3])
If(D25='X','',ChasTable[25+31*i3])
If(D26='X','',ChasTable[26+31*i3])
If(D27='X','',ChasTable[27+31*i3])
If(D28='X','',ChasTable[28+31*i3])
If(D29='X','',ChasTable[29+31*i3])
If(D30='X','',ChasTable[30+31*i3])
If(D31='X','',ChasTable[31+31*i3])


if(flHalf,'',string(VtPolChas[1+i3]))


Symbjav[7+8*i3] 
If(Daysjav[7+8*i3]>0,string(Daysjav[7+8*i3]),'')
If(Chasjav[7+8*i3]>0,'('+string(Chasjav[7+8*i3])+')','')
Symbjav[8+8*i3]
If(Daysjav[8+8*i3]>0,string(Daysjav[8+8*i3]),'')
If(Chasjav[8+8*i3]>0,'('+string(Chasjav[8+8*i3])+')','')


SymbNejav[7+8*i3] 
If(DaysNejav[7+8*i3]>0,string(DaysNejav[7+8*i3]),'')
If(ChasNejav[7+8*i3]>0,'('+string(ChasNejav[7+8*i3])+')','')
SymbNejav[8+8*i3]
If(DaysNejav[8+8*i3]>0,string(DaysNejav[8+8*i3]),'')
If(ChasNejav[8+8*i3]>0,'('+string(ChasNejav[8+8*i3])+')','')
.endfields
.begin
  logfilenm:='FK_003.log'
  if fileexist(MyExDirectoryOut+'\'+logfilenm) deletefile(MyExDirectoryOut+'\'+logfilenm)

  Type_tabel:=1 ;
  InitRep
  logfilekl:=true ;
  // ぅ�━ ≡ィ��
  if false //(tp_option and 2)=0
  {  xls_tabel_init
  }  
End.
!20081215
.if Show_Analitik
.else
.end
.{ checkenter
.begin
  //if (tp_option and 2)>0 
  if True
    xls_tabel_init
 end.
!20081215
��                                                                                                                                                                                                     ���筥罔牀������ 筮爼� � �-13
                                                                                                                                                                                                     �癶ムΔキ� ��痰���←キ┘� ��瓷��痰���
                                                                                                                                                                                                     ��瘁┬ �� 05.01.2004 � 1

                                                                                                                                                                                                                                  敖陳陳陳�
                                                                                                                                                                                                                                  �  ���  �
                                                                                                                                                                                                                                  団陳陳陳�
                                                                                                                                                                                                                    ��爼� �� ���� �0301008�
                                                                                                                                                                                                                                  団陳陳陳�
 ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��        �� ���� �       �
                                                                                              ��━キ����┘ �爍��├�罔�                                                                                                            団陳陳陳�
                                                                                                                                                                                                                                  �       �
 ��@~@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@��                青陳陳陳�
                                                                                      ��━キ����┘ 痰珮�矣爿��� ��む�Гカキ��

.{?internal; (ObjStr1<>comp(0))
.begin
  ObjStroyName:='';
  /*
  Case Ancode of
  #myCodeKauObjStroy:
  {
    If (tv4.getfirst katstroy where ((ObjStr1==katstroy.nrec))=tsOk )
    { ObjStroyName:=tv4.katstroy.name;
      ObjStroyCode:=tv4.katstroy.code
    }
  }
  else
  {
    If (tv4.getfirst spkau where ((ObjStr1==spkau.nrec))=tsOk )
    { 
      ObjStroyName:=tv4.spkau.name;
      ObjStroyCode:=tv4.spkau.code;
    }
  }
  End;
  */
  MyxlWrite(ObjStroyCode+', '+ObjStroyName,14,1,3) 
  MyxlWrite('�┼赳� �� �♀オ矣 �����皋腑瓷��� 竍モ�',15,1,3)
  
End.
^, ^
｡螢�� 痰牀�皀�赱癶�

.}
                                                                                                                                                                                            敖陳陳陳陳堕陳陳陳陳陳� 敖陳陳陳陳陳陳陳陳陳陳�
                                                                                                                                                                                            �  ���ム  �   ����    � �   �砒モ�覃 �ム┏�   �
                                                                                                                                                                                            海��祠キ��梶�痰�←キ�鏗 団陳陳陳陳賃陳陳陳陳陳�
                                                                                                                                                                                            �         �           � �    �     �    ��    �
                                                                                                                                                                                            団陳陳陳陳田陳陳陳陳陳� 団陳陳陳陳津陳陳陳陳陳�
                                                                                                                                                                                            �         �           � �@@@@@@@@@@�@@@@@@@@@@�
                                                                                                      ������                                                                               青陳陳陳陳祖陳陳陳陳陳� 青陳陳陳陳珍陳陳陳陳陳�
                                                                                                ����� �������� �������
! か� 皀痰�
!^
.begin
  HeaderStrCount:=25
  rowcur:=HeaderStrCount
  colcur:=1
  rowcur:=rowcur+1
  MylogWrite('cicle')

  matrixkl:=MyXlCreaMatrix(1000,200) ;
  rowcur:=rowcur-1
end.
浜様様僕様様様様様様様様様様曜様様様様様僕様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様僕様様様様様様僕様様様様様様様様様様様様様様様様様様様様様様様様様様様様僕様様様様様様様様様様様様�
����ム����┼��, ┃�罔���,    � ��．�讚覃�                   �皙モ�� � 錢��� � �ワ→�� �� ��｀矣 �� 腮甄�� �メ閹�                        ��矗�｀���� ���        ����襯 か� ��腮甄キ�� ����｀皚�� ���硅           �   �ワ→� �� �爬腮���    �
痕�   困��Ν�痰�             �    ���ム �                                                                                               �             �            �� ※��� � �����←キ�鍖 ��矗��               �                         �
痕�-  �(甎ユ���讚�痰�,       �          把陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳堕陳陳彡陳陳賃陳陳陳彡陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳彡陳陳堕陳陳賃陳陳賃陳陳陳�
材錣�禳�牀筌瘁��)            �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     痕���- 階メ閹 �                   ��� ※�� ����硅                       昏��  海��   蟹��  海��   �
�     �                      �          �  1  �  2  �  3  �  4  �  5  �  6  �  7  �  8  �  9  � 10  � 11  � 12  � 13  � 14  � 15  � �   頃┃�  �      把陳陳陳陳陳陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳陳陳陳陳�     �(��瘠)�     �(��瘠)�
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     根メ閹��      把陳陳陳陳陳陳陳陳陳陳陳陳陳珍陳陳陳陳陳陳陳陳陳陳陳陳陳陳�     �      �     �      �
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �(I,II)�      �                 ��玻メ���え珮鉗┤ 瘍モ                  �     �      �     �      �
�     �                      �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳珍陳陳陳彡陳陳陳陳陳陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳陳陳陳陳�     �      �     �      �
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     き�     把陳陳賃陳陳陳陳賃陳陳陳陳陳津陳陳陳堕陳陳陳陳堕陳陳陳陳陳�     �      �     �      �
�     �                      �          � 16  � 17  � 18  � 19  � 20  � 21  � 22  � 23  � 24  � 25  � 26  � 27  � 28  � 29  � 30  � 31  把陳陳陳陳陳陳昏��   蟹�玻メ-  海��        蟹��   蟹�玻メ-  海��        �     �      �     �      �
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �    ��瘠     頃┐�  劾��え珮�-�(��瘠)     晦┐�  劾��え珮�-�(��瘠)     �     �      �     �      �
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �             混���硅渇┤ 瘍モ �           凱���硅渇┤ 瘍モ �           �     �      �     �      �
把陳陳彡陳陳陳陳陳陳陳陳陳陳鍔陳陳陳陳陳彡陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳祖陳陳彡陳陳賃陳陳陳彡陳陳津陳陳陳陳津陳陳陳陳陳津陳陳陳田陳陳陳陳田陳陳陳陳陳彡陳陳田陳陳津陳陳津陳陳陳�
�  1  �             2        �     3    �                                            4                                                  �   5  �   6  �  7   �     8   �     9     �  7   �    8    �    9      �  10 �   11 �  10 �  11  �
麺様様陵様様様様様様様様様様洋様様様様様陵様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様冤様様陵様様謡様様様陵様様謡様様様様謡様様様様様謡様様様慷様様様様慷様様様様様陵様様慷様様謡様様謡様様様�
.begin
  FirstLine := true;
  LineCount := 39;
  LinesPerPage := 56;
  TimePrec := if(boGetTune('UP.ZAR.WT.EnhancedTimeFormat'), 0, 2);
end.
.{
.{
.begin
CalcMassiv
i3:=0 ;
End.
.{while i3<=Perehodlast
.begin
  flgNotFilled:=true;
!  Logstrtofile('c:\fk_003_2.txt',string(i3));
  For (i1:=1;i1<=cntd;inc(i1))
  {  
!     Logstrtofile('c:\fk_003_2.txt',Codetable[i1+31*i3]);
     If (Codetable[i1+31*i3]<>'X' and Codetable[i1+31*i3]<>'-')
     { flgNotFilled:=false; break; }
  }
End.
.{?internal; (flObjStroyOk2[i3+1] and (not flgNotFilled))
�&&&&&�@@@@@@@@@@@@@@@@@@@@@@�&&&&&&&&&&�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�  �  �&&&.&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     �                      �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳調&&&.&&把陳陳津陳陳陳陳調           団陳陳津陳陳陳陳調           債陳陳田陳陳津陳陳津陳陳陳�
�     �                      �          �&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�  �  �&&&&&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     �@@@@@@@@@@@@@@@@@@@@@@�          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳津陳陳陳把陳陳津陳陳陳陳津陳陳陳陳陳津陳陳陳田陳陳陳陳田陳陳陳陳陳仰陳陳田陳陳津陳陳津陳陳陳�
�     �@@@@@@@@@@@@@@@@@@@@@@�          �@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�@~@@@�&&&.&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@�&&&&  �@~@@@�&&&&  �
�     �@@@@@@@@@@@@@@@@@@@@@@�          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳調&&&.&&把陳陳津陳陳陳陳調           団陳陳津陳陳陳陳調           債陳陳田陳陳津陳陳津陳陳陳�
�     �                      �          �&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&�&&&&&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@�&&&&  �@~@@@�&&&&  �
.begin
  it_PerPolDays := it_PerPolDays+ PerPolDays[1+i3] ;
  it_PerPolchas := it_PerPolchas+ PerPolchas[1+i3] ; 
  it_VtPolDays  := it_VtPolDays + VtPolDays[1+i3];
  It_VtPolChas  := It_VtPolChas + VtPolChas[1+i3];
  IT_AllDays    := IT_AllDays + AllDays[1+i3];
  IT_AllChas    := IT_AllChas +AllChas[1+i3];
  //ItAdd_JavNeJav ;
  MylogWrite('��．�� '+fio)

  Nak_tmptable ;
  MylogWrite('1')

 End.
!?internal; (flObjStroyOk2 and (not flgNotFilled))
.}
.begin
  Inc(i3);
End.
!.{while i3<=Perehodlast
.}
.}
.}
!20081215
.{ checkenter FirstPage
.}
.begin
  //if (tp_option and 2)>0 
  xls_tabel_end
 end.
.}
!20081215
! 磴����┼ �竅�� 甃 �└� � ����キ��爬閻
.fields
dolRuk1 FioRuk1 dolRuk2 FioRuk2
.endfields


藩様様瞥様様様様様様様様様様擁様様様様様瞥様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様詫様様瞥様様溶様様様瞥様様溶様様様様溶様様様様様溶様様様詫様様様様詫様様様様様瞥様様詫様様溶様様溶様様様�

�癶モ痰▲����                                         �礫�〓え皀��               @@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@
��罧 ___________ _________ _____________________      痰珮�矣爿��� ��む�Гカキ�� ___________ _________ _____________________  "__" __________ 20__ ����
      ぎ�Ν�痰�   ��く�瘡   ��瘉�籥�→� ��く�瓱                                   ぎ�Ν�痰�   ��く�瘡   ��瘉�籥�→� ��く�瓱
                                                      ��｀皚┴                   @@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@ 
                                                      ��む�〓� 甄礒°            ___________ _________ _____________________  "__" __________ 20__ ����
                                                                                  ぎ�Ν�痰�   ��く�瘡   ��瘉�籥�→� ��く�瓱��
.begin
  DoneWorkingTable;
  DoneRep ;
  //if (tp_option and 2)=0 xls_tabel_end
 end.
 
  TABT13.Fexit ;
End.
.endform
/*===========================================
.fields
it_PerPolDays 

Symbjav_it[1] 
If(Daysjav_it[1]>0,string(Daysjav_it[1]),'')
If(Chasjav_it[1]>0,'('+string(Chasjav_it[1])+')','')
Symbjav_it[2] 
If(Daysjav_it[2]>0,string(Daysjav_it[2]),'')
If(Chasjav_it[2]>0,'('+string(Chasjav_it[2])+')','')

SymbNejav_it[1] 
If(DaysNejav_it[1]>0,string(DaysNejav_it[1]),'')
If(ChasNejav_it[1]>0,'('+string(ChasNejav_it[1])+')','')
SymbNejav_it[2] 
If(DaysNejav_it[2]>0,string(DaysNejav_it[2]),'')
If(ChasNejav_it[2]>0,'('+string(ChasNejav_it[2])+')','')

if(flHalf, string(IT_PerPolDays), string(IT_AllDays)) 


string(it_PerPolchas)

Symbjav_it[3] 
If(Daysjav_it[3]>0,string(Daysjav_it[3]),'')
If(Chasjav_it[3]>0,'('+string(Chasjav_it[3])+')','')
Symbjav_it[4]
If(Daysjav_it[4]>0,string(Daysjav_it[4]),'')
If(Chasjav_it[4]>0,'('+string(Chasjav_it[4])+')','')

SymbNejav_it[3] 
If(DaysNejav_it[3]>0,string(DaysNejav_it[3]),'')
If(ChasNejav_it[3]>0,'('+string(ChasNejav_it[3])+')','')
SymbNejav_it[4]
If(DaysNejav_it[4]>0,string(DaysNejav_it[4]),'')
If(ChasNejav_it[4]>0,'('+string(ChasNejav_it[4])+')','')

it_VtPolDays  


Symbjav_it[5] 
If(Daysjav_it[5]>0,string(Daysjav_it[5]),'')
If(Chasjav_it[5]>0,'('+string(Chasjav_it[5])+')','')
Symbjav_it[6] 
If(Daysjav_it[6]>0,string(Daysjav_it[6]),'')
If(Chasjav_it[6]>0,'('+string(Chasjav_it[6])+')','')

SymbNejav_it[5] 
If(DaysNejav_it[5]>0,string(DaysNejav_it[5]),'')
If(ChasNejav_it[5]>0,'('+string(ChasNejav_it[5])+')','')
SymbNejav_it[6] 
If(DaysNejav_it[6]>0,string(DaysNejav_it[6]),'')
If(ChasNejav_it[6]>0,'('+string(ChasNejav_it[6])+')','')

if(flHalf, string(IT_PerPolChas), string(IT_AllChas))
if(flHalf,'',string(It_VtPolChas))


Symbjav_it[7] 
If(Daysjav_it[7]>0,string(Daysjav_it[7]),'')
If(Chasjav_it[7]>0,'('+string(Chasjav_it[7])+')','')
Symbjav_it[8]
If(Daysjav_it[8]>0,string(Daysjav_it[8]),'')
If(Chasjav_it[8]>0,'('+string(Chasjav_it[8])+')','')

SymbNejav_it[7] 
If(DaysNejav_it[7]>0,string(DaysNejav_it[7]),'')
If(ChasNejav_it[7]>0,'('+string(ChasNejav_it[7])+')','')
SymbNejav_it[8]
If(DaysNejav_it[8]>0,string(DaysNejav_it[8]),'')
If(ChasNejav_it[8]>0,'('+string(ChasNejav_it[8])+')','')

.endfields
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �&&&.&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     ��皰��                 �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳調&&&.&&把陳陳津陳陳陳陳調           団陳陳津陳陳陳陳調           債陳陳田陳陳津陳陳津陳陳陳�
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �&&&&&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     �                      �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳津陳陳陳把陳陳津陳陳陳陳津陳陳陳陳陳津陳陳陳田陳陳陳陳田陳陳陳陳陳仰陳陳田陳陳津陳陳津陳陳陳�
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �&&&.&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     �                      �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳調&&&.&&把陳陳津陳陳陳陳調           団陳陳津陳陳陳陳調           債陳陳田陳陳津陳陳津陳陳陳�
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �&&&&&&�      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
.begin
   wjav_col:=8 ;
   wnejav_col :=8 ;
 end.
.fields
Symbjav_it[1+ wjav_col] 
If(Daysjav_it[1+ wjav_col]>0,string(Daysjav_it[1+ wjav_col] ,0,0),'')
If(Chasjav_it[1+ wjav_col]>0,'('+string(Chasjav_it[1+ wjav_col] ,0,0)+')','')
Symbjav_it[2+ wjav_col]
If(Daysjav_it[2+ wjav_col]>0,string(Daysjav_it[2+ wjav_col] ,0,0),'')
If(Chasjav_it[2+ wjav_col]>0,'('+string(Chasjav_it[2+ wjav_col] ,0,0)+')','')

SymbNejav_it[1+ wnejav_col] 
If(DaysNejav_it[1+wnejav_col]>0,string(DaysNejav_it[1+wnejav_col] ,0,0),'')
If(ChasNejav_it[1+ wnejav_col]>0,'('+string(ChasNejav_it[1+wnejav_col] ,0,0)+')','')
SymbNejav_it[2+ wnejav_col]
If(DaysNejav_it[2+ wnejav_col]>0,string(DaysNejav_it[2+wnejav_col] ,0,0),'')
If(ChasNejav_it[2+ wnejav_col]>0,'('+string(ChasNejav_it[2+ wnejav_col],0,0)+')','')

.endfields
.{while wjav_col<jav_col or wnejav_col<nejav_col and (wjav_col<=79 and wnejav_col<=79)
�     �                      �          �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �     �      �      �@@@@@@�@@@@@@@@@�&&.& &&&.&&�@@@@@@�@@@@@@@@@�&&.& &&&.&&�@~@@@� &&&& �@~@@@�&&&&  �
�     �                      �          把陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳田陳陳彡陳陳調      把陳陳津陳陳陳陳調           団陳陳津陳陳陳陳調           債陳陳田陳陳津陳陳津陳陳陳�
.begin
   wjav_col:= wjav_col+2 ;
   wnejav_col= wjav_col+2 ;
end.
.}
*/

