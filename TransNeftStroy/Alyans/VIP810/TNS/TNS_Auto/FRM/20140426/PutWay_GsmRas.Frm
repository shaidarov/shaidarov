/********************************
PUTIV.FRM
ê†·Á•‚ Éëå ØÆ Ø„‚•¢Î¨ ´®·‚†¨
ç• ¨•≠Ô‚Ï ¨†Ë‚†° ¢ Ë†°´Æ≠•!!!
Ä´£Æ‡®‚¨Î ·¨Æ‚‡•‚Ï ¢ Ë†°´Æ≠•
Æ‚´®Á®‚Ï ™Æ¨Ø´•™‚„ÓÈ„Ó Æ‚ ¨†Ë®≠Î
*if(coTXOGetField('PUTGSM','cAgregat',GSM_Nrec)=0,1,0)

********************************/
.linkform 'putway_prm_gsmras' prototype is 'putway'
.NameInList  'PRM  ê†·Á•‚ Éëå'
.group 'è„‚•¢Æ© ´®·‚ °•ß ß†™†ßÆ¢'
.group 'ëØ®·Æ™ è/ã'
.group 'ê••·‚‡ è/ã'
.group 'èÆ´≠Î©'
.group 'ã®Ê•¢†Ô'
.group 'îÆ‡¨† 3-ë (1997)'
.group 'èÆ´≠Î© îÆ‡¨† 3-ë (1997)'
.group 'ã®Ê•¢†Ô îÆ‡¨† 3-ë (1997)'
.group ' îÆ‡¨† 6(·Ø•Ê.) (êÆ··®Ô)'
.group 'èÆ´≠Î©  îÆ‡¨† 6(·Ø•Ê.) (êÆ··®Ô)'
.group 'îÆ‡¨† 4-è (1997)' 
.group 'èÆ´≠Î© îÆ‡¨† 4-è (1997)'
.group 'è„‚•¢Æ© ´®·‚ ‰Æ‡¨† 3 (1997)' 
.group 'èÆ´≠Î© è„‚•¢Æ© ´®·‚ ‰Æ‡¨† 3 (1997)'
.group 'è„‚•¢Æ© ´®·‚ †¢‚Æ°„·† ‰Æ‡¨† 6 (1997)'
.group 'èÆ´≠Î© è„‚•¢Æ© ´®·‚ †¢‚Æ°„·† ‰Æ‡¨† 6 (1997)'
.F "NUL"
!.p 60
!=====================================  
#include excel_fun.frn
!=====================================  
.var
  iGsm_CalcNorm: Gsm_CalcNorm;
  kl_first :boolean;
  dtb :date;
  DatSummer, DatWinter :date;
  kl_norma :boolean;
  ww_str,ww_str1,ww_str2,ww_str3,ww_str4,ww_stralg :string;
  w_kodgsm :string;
  w_koef1:double;
  w_itgsm:double;
  ww_i,ww_k:integer;
  ww_rasx_it:double;//®‚Æ£Æ ‡†·Á®‚†≠Æ
  ww_vidt,ww_rasx,WW_NORM:double;
  wkod_alg :word;
  ww_column:integer;
  wkl_baz:boolean;
  w_Gsm_baz:double;
  
.endvar
!=====================================  
.create view vvv
as select putlst.nrec
from 
  putlst,My_Toplivo,transp,katos 
, toplivo, normgsm 
,putgsm ,GSMALG
,Compon   Compon_Spec
,MarComp  MarComp_Spec

where ((
  Nrec_Pl == PutLst.Nrec
and PutLst.ctransp == transp.nrec  
and transp.CKATOS == katos.nrec
//and normgsm.ctoplivo == toplivo.nrec
And PutGsm.cToplivo       == Toplivo.nrec
and 0 == Systran.WHATIS 
and cogettune('MYORG') == Systran.NRECMYORG(noindex)
and putlst.nrec == putgsm.cputlst
and putgsm.CGSMALG == GSMALG.Nrec
And PutGsm.cAgregat       == Compon_Spec.nrec
And Compon_Spec.cMarComp  == MarComp_Spec.nrec

 )) ;  
!=====================================  
.Procedure My_Toplivo_ADD;
begin
      if vvv.getfirst My_Toplivo where (( string(ww_column,3,0)+ww_str1 == My_Toplivo.PUTLST_NOMER
       and string(PutGsm.Nrec) ==  MY_TOPLIVO.TRANSP_MARKA
       )) <>0
      { vvv.Insert into My_Toplivo set 
          My_Toplivo.PUTLST_NOMER:=string(ww_column,3,0)+ww_str1
         ,MY_TOPLIVO.TRANSP_MARKA:= string(PutGsm.Nrec) //ww_str3
         ,My_Toplivo.Toplivo_Name:=ww_str4 //My_WorkTable.Toplivo_Name
         ,My_Toplivo.Column:=ww_column
         ,My_Toplivo.Vid :=ww_vidt
      //   ,My_Toplivo.TOPLIVO_KOD:=ww_str1
         ,My_Toplivo.rasx:=ww_rasx
         
      }         
      else
      { vvv.update current My_Toplivo set My_Toplivo.rasx:=My_Toplivo.rasx+ww_rasx, My_Toplivo.Vid:=My_Toplivo.Vid+ww_vidt;
      }
      if My_Toplivo.Vid>0
      { vvv.update current My_Toplivo set My_Toplivo.NORMA:=round((My_Toplivo.rasx/My_Toplivo.Vid)*if(pos('(äå)',ww_str2)>0,100,1),2)
      }

 end.
!=====================================  
.Function PrintNormKoef :boolean;
begin
  rowcur:=rowcur+1;
  ww_str:='' ;
  PrintNormKoef:=false;
  if xlGetCellValue(rowcur,1,ww_str) {}
  ww_str:=trim(ww_str)
  if ww_str<>'' then exit; //™Æ≠Á®´†·Ï £‡„ØØ†
  //if xlGetCellValue(rowcur,2,ww_str) {}
  //ww_str:=trim(ww_str)
  //if ww_str='' then exit; //™Æ≠Á®´†·Ï £‡„ØØ†
  ww_str:='';
  if xlGetCellValue(rowcur,7,ww_str) {}
  MyLogWrite('·‚‡='+string(rowcur)+', '+ww_str)
  w_koef1:=round(iGsm_CalcNorm.Gsm_Calc_Norm(word(ww_str),vvv.PutGsm.Nrec),4);
  if abs(w_koef1)>0.001
  { xlSetRowHeight(if(abs(w_koef1)<0.01,0,12),rowcur,1,rowcur,255)
    MyXlWrite(string(w_koef1,0,3) ,rowcur,7,2)
  }  
  else
  { xlSetRowHeight(0,rowcur,1,rowcur,255)
  }
  PrintNormKoef:=true;
 end. 
!=====================================  
.Procedure PrintShap;
begin
 if kl_first
 { MyLogWrite('========Æ‚™‡Î´® Excel==========')
   MyXlInit('Avto_putway_GSM_R.xls')
   rowcur:=0;
 }
 else
 { rowcur:=rowcur+3
   MyLogWrite('==========≠Æ¢Î© ´®·‚===========')
   xlRunMacro('Copy_Shap'+chr(40)+string(rowcur)+chr(41)) ;
   rowcur:=rowcur-1
   //message(rowcur)
 }
 kl_first:=false;

 rowcur:=rowcur+3
//çéåÖê íë:
 MyXlWrite(vvv.transp.nomer ,rowcur,3,3)
//ÑÄíÄ Çõèàëäà èã:
 MyXlWrite(DateToStr(vvv.PUTLST.DATPL,'`DD/MM/YYYY') ,rowcur,7,3)
 rowcur:=rowcur+1
// ÑÄíÄ èéëíìèãÖçàü:
 MyXlWrite(DateToStr(if(vvv.getfirst katos=0,vvv.katos.datok,vvv.TRANSP.DATOK ),'`DD/MM/YYYY') ,rowcur,3,3)
//ÑÄíÄ éÅêÄÅéíäà èã:
 MyXlWrite(DateToStr(vvv.putlst.datobr,'`DD/MM/YYYY') ,rowcur,7,3)
 rowcur:=rowcur+1
//åÄêäÄ:
 MyXlWrite(Marka ,rowcur,3,3)
//åÄêäÄ Éëå
 kl_norma:=true
 w_koef1:=0;
 
 if (vvv.getfirst NormGSM where (( 
   0 == NormGSM.WHATIS
  and 0 == NormGSM.CMARAVT 
  and Transp.Nrec == NORMGSM.CTRANSP 
   ))
  and ( NORMGSM.DATBEG=Date(0,0,0) or NORMGSM.DATBEG<=Putlst.Exitdn) 
  and ( NORMGSM.DATEND=Date(0,0,0) or NORMGSM.DATEND>=Putlst.Exitdn) 
  )  <>0
 { if (vvv.getfirst NormGSM where ((    0 == NormGSM.WHATIS
  and 0 == NormGSM.CMARAVT 
  and 0 == NormGSM.cTransp
  and  Transp.cMarka == NORMGSM.CMARKA(noindex)
   ))
    and ( NORMGSM.DATBEG=Date(0,0,0) or NORMGSM.DATBEG<=Putlst.Exitdn) 
    and ( NORMGSM.DATEND=Date(0,0,0) or NORMGSM.DATEND>=Putlst.Exitdn) 
   )  <>0
   { kl_norma:=false
   }
 }
 rowcur:=rowcur+1
 if kl_norma
 { if vvv.getfirst toplivo=0
   { MyXlWrite(vvv.toplivo.name ,rowcur,3,3)
   }
 }
 else
 { MyXlWrite('ç•‚ §•©·‚¢„ÓÈ•© ≠Æ‡¨Î!!' ,rowcur,3,3)
 }
 rowcur:=rowcur+1;
 if vvv.Putgsm.cAgregat>0
 { if vvv.getfirst Compon_Spec=0 {}
   if vvv.getfirst MarComp_Spec=0 {}
   MyXlWrite('ç†®¨•≠Æ¢†≠®• †£‡•£†‚† : ' + vvv.MarComp_spec.name +' '+ vvv.Compon_Spec.NomComp,rowcur,1,3)
 }
 //çÆ‡¨Î ‡†·ÂÆ§† ØÆ ‚‡†≠·ØÆ‡‚≠Æ¨„ ·‡•§·‚¢„:
 rowcur:=rowcur+1
 ww_k:=0
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //çÆ‡¨Î ‡†·ÂÆ§† ØÆ ·Ø•Ê®†´Ï≠Æ¨„ Æ°Æ‡„§Æ¢†≠®Ó:
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //äÆÌ‰‰®Ê®•≠‚Î, ®ß¨•≠ÔÓÈ®• °†ßÆ¢„Ó ≠Æ‡¨„ ‡†·ÂÆ§† ‚‡†≠·ØÆ‡‚≠Æ£Æ ·‡•§·‚¢† ¢ Ø„‚•¢Æ¨ ´®·‚• :
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 //äÆÌ‰‰®Ê®•≠‚Î ≠† Ø‡Æ°•£ ® ·Ø•Ê‡†°Æ‚„:
 do {
  ww_k:=ww_k+1
  if ww_k>100 then break;
  if not PrintNormKoef then break;
 } while true
 rowcur:=rowcur+4
 vvv.delete all My_Toplivo;
 w_itgsm:=0;ww_rasx_it:=0;

 end. 
!=====================================  
.fields
!é·≠Æ¢≠Æ© ´®·‚
 CommonFormHeader
 NameOrg
 Npl Seria
 DatPl datObr
 Gnom GarNom Marka Nmper
 Tabn1 FIO1 SummaOpl1 Tabn2 FIO2  SummaOpl2
 Tabn_St FIO_St SummaOpl_St
 ExitCh ExitDn SpeedExi
 ReturnCh ReturnDn SpeedRet
!¢‡•¨Ô, Ø‡Æ°•£
 TimeAll TimeMove TimeStop TimeRep TimeLoad KolEz
 ProbegAll ProbegV ProbegGr Gruztn GruzTnKm
!‚ÆØ´®¢Æ
 KodToplDvi ToplDvi OctatExiDvi  OctatRetDvi  VidanToplDvi  SdanToplDvi
 KofnIzmDvi NormaTopDvi  FaktTopDvi
 ZaprOrgDvi ZaprTimeDvi ZaprDateDvi  ZaprPriceDvi
 KodToplAvt ToplAvt OctatExiAvt  OctatRetAvt  VidanToplAvt  SdanToplAvt
 KofnIzmAvt NormaTopAvt  FaktTopAvt
 ZaprOrgAvt ZaprTimeAvt ZaprDateAvt  ZaprPriceAvt
 KodToplSp ToplSp OctatExiSp  OctatRetSp  VidanToplSp  SdanToplSp
 KofnIzmSp NormaTopSp  FaktTopSp
 ZaprOrgSp ZaprTimeSp ZaprDateSp  ZaprPriceSp
!Ø‡®Ê•ØÎ
 TrlGnom1 TrlGnom2 ProbegGrPri GruzTnPri  GruzTnKmPri
.endfields
.begin
 kl_first:=true;
 InitServTxo(0);
// logfilekl:=true;
 end.
.{
.begin
 //================================
 if vvv.getfirst putlst=0 {}
 dtb:=vvv.putlst.EXITDN
 if vvv.getfirst transp=0 {}
 if vvv.getfirst putgsm=0 {}
 if vvv.getfirst Systran=0 {}
 DatSummer := vvv.Systran.Begsummer
 DatWinter := vvv.Systran.Begwinter
 if year(dtb)<>year(DatSummer)
 { DatSummer:=date(day(DatSummer),month(DatSummer),year(dtb))
   DatWinter:=date(day(DatWinter),month(DatWinter),year(dtb))
 }
 MylogWrite(vvv.PutLst.Npl)
  vvv._loop PutGsm
  { //if vvv.PutGSM.Normt=0 then continue;
    if vvv.getfirst gsmalg<>0 then continue
    if vvv.PutGsm.DpPokaz9 <> 0 then continue; // ß†Ø‡†¢™® ≠• ®≠‚•‡•·≠Î
    MylogWrite('PutGsm.nrec = '+string(PutGsm.nrec))
    PrintShap;
    w_itgsm:=vvv.PutGsm.normt;
    ww_rasx_it:=0;
    ww_stralg:=upcase(vvv.GSMALG.STRALG)
    // „°®‡•¨ Æ™‡„£´•≠®•
    ww_stralg:=replace(ww_stralg,'ROUND(',''); 
    ww_stralg:=replace(ww_stralg,',1)',  '') //(
    ww_stralg:=replace(ww_stralg,',2)',      '') //
    ww_i:=0;
    do
    { ww_i:=ww_i+1
      ww_str:=trim(ExtractDelimitedWord(ww_stralg,ww_i,'+'))
      ww_column:=999
      ww_str1:='è‡ÆÁ®•'
      ww_vidt:=0
      ww_rasx:=0
      ww_str2:=0;
      if ww_str='' then continue;
      ww_str:=upcase(ww_str)
      if pos('SUMALGCODE',ww_str)>0
      { ww_str1:=substr(ww_str,pos('[',ww_str)+1,100)
        ww_str1:=substr(ww_str1,1,pos(']',ww_str1)-1)
        wkod_alg:=word(ww_str1)
        ww_Rasx:=round(iGsm_CalcNorm.Gsm_Calc_Norm(wkod_alg,vvv.PutGsm.Nrec),4);
        ww_str1:=iGsm_CalcNorm.GetNameAlg(wkod_alg)
        ww_str2:=upcase(iGsm_CalcNorm.GetNameAlg_2(wkod_alg))
        ww_vidt:=iGsm_CalcNorm.GetPocazatelVal(wkod_alg)
        if ww_str1='é°È®© Ø‡Æ°•£'
        { ww_column:=0
        }
        else
        if ww_str1='ëØ•Ê.Æ°Æ‡„§.'
        { ww_column:=1
        }
        else
        if ww_str1='è‡ÆÁ®•'
        { ww_column:=999
        }
        else
        { ww_column:=2;
        }
      }// if pos('SUMALGCODE',ww_str)>0
      if abs(ww_Rasx)<=0.0001 and ww_column>0 then continue;
      ww_str3:=iGsm_CalcNorm.GetFormula(wkod_alg)
      ww_str4:=iGsm_CalcNorm.GetFormulaNum(wkod_alg,vvv.putgsm.nrec)
      My_Toplivo_ADD
      ww_rasx_it:=ww_rasx_it+ww_rasx;
      wkl_baz:=true;
    } while ww_str<>''
    if abs(ww_rasx_it- vvv.PutGsm.normt)>0.1
    { ww_column:=999
      ww_str1:='è‡ÆÁ®•'
      ww_str4:=''
      ww_vidt:=0 //My_WorkTable.PutLst_ProbegAll;
      ww_rasx:=vvv.PutGsm.normt-ww_rasx_it
      My_Toplivo_ADD

    } //if abs(ww_rasx_it- w_itgsm)>0.1
    HeaderStrCount:=rowcur;
    vvv._loop My_Toplivo ordered by index My_Toplivo_Index1
    { if abs(vvv.My_Toplivo.rasx)<0.005 then continue;
      rowcur:=rowcur+1; colcur:=1;
      if rowcur=HeaderStrCount+1
      { MyXlWrite(vvv.PutLst.NPL+if(vvv.PUTLST.NSERIA<>'','-'+vvv.PUTLST.NSERIA,'') ,rowcur,colcur,3)
      } else colcur:=2
      MyXlWrite(substr(vvv.My_Toplivo.PUTLST_NOMER,4,100),rowcur,colcur,3)//Ç®§ ‡†·ÂÆ§†			
      xlMergeCells(rowcur,colcur-1,rowcur,colcur+1)
      colcur:=colcur+2
      MyXlWrite(string(My_Toplivo.Vid  ,0,3),rowcur,colcur,2)//á≠†Á•≠®• ØÆ™†ß†‚•´Ô	
      MyXlWrite(string(My_Toplivo.Norma,0,3),rowcur,colcur,2)//çÆ‡¨† ‡†·ÂÆ§†, ´/™¨	
      MyXlWrite(string(My_Toplivo.Rasx ,0,3),rowcur,colcur,2)//ê†·ÂÆ§ ØÆ ≠Æ‡¨•, ´	
      MyXlWrite(vvv.My_Toplivo.TOPLIVO_NAME,rowcur,colcur,3)//ê†·ÁÒ‚ ≠Æ‡¨Î
    } //vvv._loop My_Toplivo ordered by index My_Toplivo_Index1
    if HeaderStrCount+1<rowcur
    { xlMergeCells(HeaderStrCount+1,1,rowcur,1)
    }
    MyxlFrameCells(headerstrcount+1,1,rowcur,colcur-1,1 or 2 or 4 or 8 or 16 or 32);

    rowcur:=rowcur+1; colcur:=1;
    MyXlWrite('à‚Æ£Æ ≠Æ‡¨†‚®¢≠Î© ‡†·ÂÆ§ ‚ÆØ´®¢† ·Æ·‚†¢´Ô•‚',rowcur,colcur,3)					
    xlMergeCells(rowcur,1,rowcur,6)
    colcur:=7;
    MyXlWrite(string(w_itgsm,0,2),rowcur,colcur,2)//ê†·ÁÒ‚ ≠Æ‡¨Î
    xlSetFontStyle(1, rowcur, 1, rowcur,colcur-1)
    xlSetbackcolor(0C0C0C0h, rowcur, 1,  rowcur, colcur-1)
    MyxlFrameCells(rowcur,1,rowcur,colcur-1,1 or 2 or 4 or 8 or 16 or 32);
  }//vvv_loop PutGsm
 //================================

 end.
^
ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
é‡£†≠®ß†Ê®Ô : @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
N  @@@@@@@@ ë•‡®Ô @@@@@@@@@@@@@ Ñ†‚† ¢Î§†Á® @@@@@@@@@@@ Æ°‡†°. @@@@@@@@@@@
£Æ·.≠Æ¨•‡  @@@@@@@@@@@ £†‡. ≠Æ¨•‡ @@@@@@@@@@@
å†‡™† @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ‚®Ø @@@@@@@@@@@@@
⁄ƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒø
≥        ≥ í†°.N ≥      î.à.é.             ≥  ë„¨¨†    ≥
√ƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒ¥
≥ÇÆ§®‚. 1≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@@@≥&#&&&&&&.&&≥
≥ÇÆ§®‚. 2≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@@@≥&#&&&&&&.&&≥
≥ë‚†¶•‡  ≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@@@≥&#&&&&&&.&&≥
¿ƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒŸ
ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
   ÇÎ•ß§:    Á†·  @@@@@@@@  §•≠Ï  @@@@@@@@@@  ·Ø®§Æ¨•‚‡   &&#&&&&&&&
   ÇÆß¢‡†‚:  Á†·  @@@@@@@@  §•≠Ï  @@@@@@@@@@  ·Ø®§Æ¨•‚‡   &&#&&&&&&&
ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       ƒƒƒƒƒƒ Ç‡•¨Ô (Á†·Î)    ƒƒƒƒƒƒ
⁄ƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒø
≥ Ç·•£Æ   ≥Ñ¢®¶•≠    ≥è‡Æ·‚Æ©   ≥ê•¨Æ≠‚    ≥èÆ£/‡†ß£  ≥
√ƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ¥
≥&#&&&&.&&≥&#&&&&&.&&≥&#&&&&&.&&≥&#&&&&&.&&≥&#&&&&&.&&≥
¿ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒŸ
⁄ƒÖß§™®ƒ¬ƒè‡Æ°•£ƒƒ¬ƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒ¬ Ø•‡•¢•ßƒ¬ƒ¢ÎØÆ´≠•≠Æƒø
≥       ≥Æ°È®©    ≥ØÆ ¨†‡Ë‡ ≥· £‡„ßÆ¨ ≥‚≠/Ø†·   ≥‚/™¨(Ø†·/™¨≥
√ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒ¥
≥&#&&&&&≥&#&&&&.&&≥&#&&&&.&&≥&#&&&&.&&≥&#&&&&.&&≥&#&&&&.&&  ≥
¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒŸ
ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
                           ÉÆ‡ÓÁ•• °†™ 1
⁄ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒø
≥ äÆ§   ≥ç†®¨•≠Æ¢†≠®•  £Æ‡ÓÁ•£Æ ≥ é·‚†‚.≥ é·‚†‚.≥ ÇÎ§†≠Æ≥ ë§†≠Æ ≥äÆÌ‰.≥ çÆ‡¨† ≥ î†™‚. ≥   è„≠™‚ ß†Ø‡†¢™®      ≥ Ç‡•¨Ô≥  Ñ†‚†    ≥ë‚Æ®¨Æ·‚Ï≥
≥       ≥                       ≥ ¢Î•ß§ ≥ ¢Æß¢‡.≥       ≥       ≥     ≥       ≥       ≥                       ≥      ≥          ≥         ≥
√ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ¥
.{
≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#.&&≥&#&&.&&≥&#&&.&&≥@@@@@@@@@@@@@@@@@@@@@@@≥@@@@@@≥@@@@@@@@@@≥&&&&&#.&&≥
.}
¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒŸ

                           ÉÆ‡ÓÁ•• °†™ 2
⁄ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒø
≥ äÆ§   ≥ç†®¨•≠Æ¢†≠®•  £Æ‡ÓÁ•£Æ ≥ é·‚†‚.≥ é·‚†‚.≥ ÇÎ§†≠Æ≥ ë§†≠Æ ≥äÆÌ‰.≥ çÆ‡¨† ≥ î†™‚. ≥   è„≠™‚ ß†Ø‡†¢™®      ≥ Ç‡•¨Ô≥  Ñ†‚†    ≥ë‚Æ®¨Æ·‚Ï≥
≥       ≥                       ≥ ¢Î•ß§ ≥ ¢Æß¢‡.≥       ≥       ≥     ≥       ≥       ≥                       ≥      ≥          ≥         ≥
√ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ¥
.{
≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#.&&≥&#&&.&&≥&#&&.&&≥@@@@@@@@@@@@@@@@@@@@@@@≥@@@@@@≥@@@@@@@@@@≥&&&&&#.&&≥
.}
¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒŸ

                           ÉÆ‡ÓÁ•• °†™ 3
⁄ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒø
≥ äÆ§   ≥ç†®¨•≠Æ¢†≠®•  £Æ‡ÓÁ•£Æ ≥ é·‚†‚.≥ é·‚†‚.≥ ÇÎ§†≠Æ≥ ë§†≠Æ ≥äÆÌ‰.≥ çÆ‡¨† ≥ î†™‚. ≥   è„≠™‚ ß†Ø‡†¢™®      ≥ Ç‡•¨Ô≥  Ñ†‚†    ≥ë‚Æ®¨Æ·‚Ï≥
≥       ≥                       ≥ ¢Î•ß§ ≥ ¢Æß¢‡.≥       ≥       ≥     ≥       ≥       ≥                       ≥      ≥          ≥         ≥
√ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒ¥
.{
≥@@@@@@@≥@@@@@@@@@@@@@@@@@@@@@@@≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#&&.&&≥&#.&&≥&#&&.&&≥&#&&.&&≥@@@@@@@@@@@@@@@@@@@@@@@≥@@@@@@≥@@@@@@@@@@≥&&&&&#.&&≥
.}
¿ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒŸ
⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒø
≥   è‡®Ê•Ø 1        ≥   è‡®Ê•Ø 2        ≥è‡Æ°•£  ≥è•‡•¢•ß.≥ÇÎØÆ´≠. ≥
≥                   ≥                   ≥c £‡„ßÆ¨≥ ‚Æ≠≠   ≥ ‚/™¨   ≥
√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒ≈ƒƒƒƒƒƒƒƒ¥
≥@@@@@@@@@@@@@@@@@@ ≥@@@@@@@@@@@@@@@@@@ ≥&#&&&.&&≥&#&&&.&&≥&#&&&.&&≥
¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒŸ

ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
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
.if brPutWay
.end
.}
.begin
 MyXLEnd;
 DoneServTxo;
 end.
.endform