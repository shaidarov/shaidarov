.LinkForm 'SFO_DsdfsdfOLG_01A' Prototype is 'SFO_DOLGPROT'
.Group ' áç¥â § ¤®«¦¥­­®áâ¨ ¯® ­ ç¨á«¥­­®¬ã ¯à®æ¥­âã ¨§­®á '
.NameInList '‘¯à ¢ª  ® § ¤®«¦¥­­®áâ¨ ¯® ‘” (ƒ‘‘)'
.var
  frmSum,dolgok:Double
  spcSum,sr_n,ost_pr,sum_nds,p_nds:Double
  Sum_frm_Spec:Double
  wRound:Word
  perssfo_nrec:comp
  zb:boolean
.endvar

.Create view t1
as select
perssfo.nrec
from
     perssfo,
     mbpin,
     attrnam,
     attrval
where ((
             perssfo_nrec      == perssfo.nrec
        and  perssfo.CCURMBPIN == mbpin.nrec

        and  word(2001)       == AttrNam.wTable
        and  'à¨§­ ª áç¥â '  == AttrNam.Name
        and  word(2001)       == AttrVal.wTable
        and  mbpin.nrec       == AttrVal.cRec
        and  AttrNam.Nrec     == AttrVal.cAttrNam
        and  attrval.vcomp    == spkau.nrec
      ))
;

.fields
  CommonFormHeader
  OrgName
  DateToStr( sprDate, 'DD')
  DateToStr( sprDate, 'Mon')
  DateToStr( sprDate, 'YYYY')
  FIO
  TabN
  Podr
  frName
  frKod
  frEd
  DateToStr( frGiveDate, 'DD/MM/YYYY')
  frKol
  frPrice
  if ( Longint( frEndDate) > 0, DateToStr( frEndDate, 'DD/MM/YYYY'), '')
  //if ( Word( frSrok) > 0, frPrice/Word( frSrok), 0)
  trim(string(ost_pr,100,2))
  trim(string(dolgok,100,2))
  frmSum
  spName
  spKod
  spEd
  DateToStr( spGiveDate, 'DD/MM/YYYY')
  spKol
  spPrice
  if ( Longint( spEndDate) > 0, DateToStr( spEndDate, 'DD/MM/YYYY'), '')
  //if ( Word( spSrok) > 0, spPrice/Word( spSrok), 0)
  trim(string(ost_pr,100,2))
  trim(string(dolgok,100,2))
  spcSum
.endfields
.function MY_ROUND(value: Double; tochn: Double; tip: Word): Double; // ”ã­ªæ¨ï ®ªàã£«¥­¨ï ¤«ï á¯à ¢ª¨ ® § ¤®«¦¥­­®áâ¨;
var i: Integer;    // tip : 0 - ®ªàã£«ïâì à« ¯à ¢¨« ¬, 1 - ¢ ¡®«ìèãî áâ®à®­ã
var tmp: Double;  // value - çâ® ®ªàã£«ïâì, tochn - â®ç­®áâì
begin

  if (tochn <> 0)
  {
    i := 0;
    my_Round := Value;
    tmp := tochn;

    Case tip Of
    //------------------
      0: if (tochn > 1)
         {
           do
           {
             i := i + 1;
             tochn := tochn / 10;
           }
           While tochn > 1

           my_Round := Round(Value, -i);
         }
         else
         {
           While tochn < 1
           do
           {
             i := i + 1;
             tochn := tochn * 10;
           }

           my_Round := Round(Value, i);
         }
    //------------------
      1: if (tochn > 1)
         {
           do
           {
             i := i + 1;
             tochn := tochn / 10;
           }
           While tochn > 1

           my_Round := Trunc(Value, -i);

           if ((Value - Trunc(Value, -i)) > 0)
             my_Round := my_Round + Tmp;
         }
         else
         {
           While tochn < 1
           do
           {
             i := i + 1;
             tochn := tochn * 10;
           }

           my_Round := Trunc(Value, i);

           if ((Value - Trunc(Value, i)) > 0)
             my_Round := my_Round + Tmp;
         }
    //------------------
      End; // case
  }
  else
    my_Round := Value;
end.
.function GETKOP( pSum : double) : String;
begin
  getKop := DoubleToStr( pSum, '\2p88');
end.

.fields
//  sum_nds
//  DoubleToStr( sum_nds, '\2p\m4') +
//   if ( Pos( '­®«ì', DoubleToStr( Sum_nds, '\2p5')) <> 0, '',
//      DoubleToStr( Sum_nds, 'æ¥«ëå \2p5'))
//  Sum_frm_Spec+sum_nds
//  DoubleToStr( Sum_frm_Spec+sum_nds, '\2p\m4') +
//   if ( Pos( '­®«ì', DoubleToStr( Sum_frm_Spec+sum_nds, '\2p5')) <> 0, '',
//      DoubleToStr( Sum_frm_Spec+sum_nds, 'æ¥«ëå \2p5'))

  Round(sum_nds, 2)
  DoubleToStr( Round(sum_nds, 2), '\2p\m4')
  GetKop(Round(sum_nds, 2))
  Round(Sum_frm_Spec, 2)+Round(sum_nds, 2)
  DoubleToStr( Round(Sum_frm_Spec, 2)+Round(sum_nds,2), '\2p\m4')
  GetKop(Round(Sum_frm_Spec, 2)+Round(sum_nds, 2))

.endfields
.begin
  frmSum := 0;
  spcSum := 0;
  wRound := wGetTune ( 'Fin.ReportRound');
end.
 ^
 ^

                                 ‘€‚Š€
                        ® § ¤®«¦¥­­®áâ¨ à ¡®â­¨ª 
                    ¯® á¯¥æ¨ «ì­®© (ä®à¬¥­­®©) ®¤¥¦¤¥
                             "^" ^ ^ £.

” ¬¨«¨ï ˆ¬ï âç¥áâ¢®:  ^
’ ¡. ­®¬¥à: ^
®¤à §¤¥«¥­¨¥: ^
.{?internal;(frmFlag=True)

 ”®à¬¥­­ ï ®¤¥¦¤  ¨ ®¡ã¢ì
ÿÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³                         ³            ³         ³          ³      ³     –¥­  ­      ³   ‘à®ª   ³ áâ â ³       ‘ã¬¬        ³
³        ¨¬¥­®¢ ­¨¥      ³ ®¬¥­ª«. ü ³ …¤.¨§¬. ³„ â  ¢ë¤ ç³Š®«-¢®³      ¬®¬¥­â     ³ ®ª®­ç ­¨ï³   %   ³    ª ã¤¥à¦ ­¨î    ³
³                         ³            ³         ³          ³      ³     à áç¥â      ³   ­®áª¨  ³       ³                   ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
.{CheckEnter FRMDLGCIR
.begin
dolgok:=0;
ost_pr:=0;
perssfo_nrec:=frNrec;
if t1.getfirst perssfo = tsok
if t1.getfirst mbpin = tsok
 {
   sr_n:=0;

   if (t1.mbpin.DATEEKSP<>date(0,0,0) and t1.mbpin.DATEEND<>date(0,0,0))
    {
    sr_n:=Months_Between(t1.mbpin.DATEEKSP,t1.mbpin.DATEEND);
    }
    else
       {
        sr_n:=0;
       }

  zb := false;

  if t1.getfirst attrnam = tsok
   {
    if t1.getfirst attrval = tsok
     {
      if t1.getfirst spkau = tsok
       {
        if t1.spkau.code = '002'
         {
          zb:=true;
         }
       }
     }
   }
 }

  dolgok:=frKol*frPrice-(frKol*frPrice/sr_n)*Months_Between(frGiveDate,uvDate);
  ost_pr:=100-Months_Between(frGiveDate,uvDate)/sr_n*100;

   if dolgok<0
    {
     dolgok:=0;
    }
   if ost_pr<0
    {
      ost_pr:=0;
    }

  frmSum := frmSum + dolgok;
end.
³@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@³&#&&&&³&#'&&&&&&&&&&&.&&³@@@@@@@@@@³&#&&.&&³&#'&&&&&&&&&&&&&.&&³
.}
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÿ
ÿ‘                                                                                                    ˆâ®£®: &#'&&&&&&&&&&&.&&ÿ‘
.}
.{?internal;(spcFlag=True)

 ‘¯¥æ¨ «ì­ ï ®¤¥¦¤  ¨ ®¡ã¢ì
ÿÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³                         ³            ³         ³          ³      ³     –¥­  ­      ³   ‘à®ª   ³ áâ â ³       ‘ã¬¬        ³
³        ¨¬¥­®¢ ­¨¥      ³ ®¬¥­ª«. ü ³ …¤.¨§¬. ³„ â  ¢ë¤ ç³Š®«-¢®³      ¬®¬¥­â     ³ ®ª®­ç ­¨ï³   %   ³    ª ã¤¥à¦ ­¨î    ³
³                         ³            ³         ³          ³      ³     à áç¥â      ³   ­®áª¨  ³       ³                   ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
.{CheckEnter SPCDLGCIR
.begin
dolgok:=0;
ost_pr:=0;
perssfo_nrec:=spNrec;
if t1.getfirst perssfo = tsok
if t1.getfirst mbpin = tsok
 {
   sr_n:=0;

   if (t1.mbpin.DATEEKSP<>date(0,0,0) and t1.mbpin.DATEEND<>date(0,0,0))
    {
    sr_n:=Months_Between(t1.mbpin.DATEEKSP,t1.mbpin.DATEEND);
    }
    else
       {
        sr_n:=0;
       }

  zb:=false;

  if t1.getfirst attrnam = tsok
   {
    if t1.getfirst attrval = tsok
     {
      if t1.getfirst spkau = tsok
       {
        if t1.spkau.code = '002'
         {
          zb:=true;
         }
       }
     }
   }
 }

  dolgok:=spKol*spPrice-(spKol*spPrice/sr_n)*Months_Between(spGiveDate,uvDate);
  ost_pr:=100-Months_Between(spGiveDate,uvDate)/sr_n*100;

   if dolgok<0
    {
     dolgok:=0;
    }
   if ost_pr<0
    {
      ost_pr:=0;
    }

  spcSum := spcSum + dolgok;
end.
³@@@@@@@@@@@@@@@@@@@@@@@@@³@@@@@@@@@@@@³@@@@@@@@@³@@@@@@@@@@³&#&&&&³&#'&&&&&&&&&&&.&&³@@@@@@@@@@³&#&&.&&³&#'&&&&&&&&&&&&&.&&³
.}
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÿ
ÿ‘                                                                                                    ˆâ®£®: &#'&&&&&&&&&&&.&&ÿ‘
.}
.begin
  p_nds:=dogettune('Nalog.Stav1');
  Sum_frm_Spec := if (wRound <> 0, my_Round( frmSum + spcSum, doGetTune( 'Fin.RoundRubDouble'), wRound - 1), frmSum + spcSum);
  sum_nds      := if (wRound <> 0, my_Round( (frmSum + spcSum)/100*p_nds, doGetTune( 'Fin.RoundRubDouble'), wRound - 1),(frmSum + spcSum)/100*p_nds);
end.

ÿ‘‘ã¬¬  „‘ : &#'&&&&&&&&&&&.&& ( ^àã¡. ^ ª®¯.)ÿ‘

ÿ‘ˆâ®£® ª ã¤¥à¦ ­¨î : &#'&&&&&&&&&&&.&& ( ^àã¡. ^ ª®¯.)ÿ‘

ƒ« ¢­ë© ¡ãå£ «â¥à ______________________

.endform
