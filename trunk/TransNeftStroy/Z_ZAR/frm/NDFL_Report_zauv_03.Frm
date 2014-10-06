.LinkForm 'NDFL_REESTR_Zauv_03' prototype is 'NDFL_REESTR_Zauv'
.NameInList 'Контрольный рееестр(НЕ ЗАПУСКАТЬ с SLK отчетами!)'
.F "NUL"
#include Excel_fun.frn
#include tmp_sbor.frn
.var
 max_col :word;
 wsortkey:string;
 wname2:string;
 wsu1,wsu2:double;
.endvar
.create view vvv
as select spplved.nrec
from 
   spplved 
 , spplban 
 , SbBan 
 ,platved
 , plpor 
 , DOCPODOT 
where ((
    w_cspplban == spplban.nrec
and spplban.cSbBan == SbBan.nrec    
and w_cSPPLVED == spplved.nrec
and spplved.cplatved == platved.nrec  
//==============
// найти привызку к платежке
//==============
and  cgLink_ReesPlDoc == DOCPODOT.TIPDOC 
and  sbban.nrec       == DOCPODOT.CVTDOC 
and  DOCPODOT.CPRDOC == PLPOR.NREC  
)) ;
.begin
 MyXlInit('UFPS_NDFL_Chk.xls')
 Shap_init(1) ;
 Shap_init(2) ;
 Sbor_init(1) ;
 Sbor_init(2) ;
 
 end.
.fields
 type_report 
 org_name
 org_ruk
 org_unn
 org_kpp
 dtb dte
 mes_ 
 year_

 Org_child
 Org_child_nrec
 su_all 
 prim
.endfields 
.begin
 
 end.
 type_report ^
 org_name ^
 org_ruk  ^
 org_unn  ^
 org_kpp  ^
 dtb:date ^ dte:date ^
 mes_ ^
 year_  ^
.{
 Org_child ^
 Org_child_nrec ^
 su_all :double ^
 prim :string; ^
.{ 
.fields
 pol_name
 pol_inn
 pol_kpp
 pol_bank
 pol_bik
 pol_rsch
 pol_ksch
 pol_kbk
 su_nal
 pol_prim 
.endfields
 pol_name ^
 pol_inn  ^
 pol_kpp  ^
 pol_bank ^
 pol_bik  ^
 pol_rsch ^
 pol_ksch ^
 pol_kbk ^
 su_nal:double ^
 pol_prim ^ нет пока
.{ 
.fields
 podr_name
 podr_okato
 su_podr
 plat_nom 
.endfields 
 podr_name ^
 podr_okato ^
 su_podr:double ^
 plat_nom ^ нет пока
 
.{ 
.fields
  tabn_ fio_ summa_ c_lsch   prim_tabn 
  w_cspplban
  w_cSPPLVED
.endfields
  tabn_ ^ fio_ ^ summa_ ^ c_lsch :comp ^ prim_tabn ^
  w_cspplban:comp ^
  w_cSPPLVED:comp ^
  ===============
.begin
  wsortkey:=pad(substr(Org_child,1,10),10)+string(Org_child_nrec)
      + pad(substr(pol_name,1,10),10)+pol_inn+podr_okato
  wsu1:=0; wsu2:=0;     
  wname2:='';
  if w_cspplban=0 and w_cSPPLVED=0
  { wsu1:=summa_
  }      
  else
  { wsu2:=summa_
    if string(Type_report)='1'
      wsu2:=-wsu2
    if string(Type_report)='11'
    { wsu1:=wsu2  // для 2 варианта сумму межпериода нужно добавить в общую сумму
      
    }
    
    if w_cspplban >0
    { if vvv.getfirst spplban=0
        if vvv.getfirst sbban=0
        {  wname2:=DateToSTr(vvv.sbban.dform,'DD.MM')
           if vvv.getfirst docpodot=0
             if vvv.getfirst plpor=0
                wname2:=DateToSTr(vvv.plpor.datob,'DD.MM')
           
        }
    }
    else
    { if vvv.getfirst spplved=0
        if vvv.getfirst platved=0
          wname2:=DateToSTr(vvv.platved.dform,'DD.MM')
    }
    shap_add(0,wsortkey,wname2,wsu2,0,0)
    if tabn_plat_nom<>'' 
      and pos(tabn_plat_nom,vtmp_shap.tmp_shap.name3)=0
    { vtmp_shap.update current tmp_shap set tmp_shap.name3:=tmp_shap.name3+tabn_plat_nom+';'
    }
    shap_add(1,'',wname2,wsu2,0,0)
  }
  sbor_add(0,wsortkey,Org_child,podr_okato+'/'
      +pol_name,wsu1,wsu2,0);

  // Зарплата всегда идет с 0 ссылкой
  if w_cspplban=0 and w_cSPPLVED=0
  if tabn_plat_nom<>'' //plat_nom
      and pos(tabn_plat_nom,vtmp_shap.tmp_sbor.name[3])=0
  { vtmp_shap.tmp_sbor.name[3]:=vtmp_shap.tmp_sbor.name[3]+tabn_plat_nom+';'
    vtmp_shap.update current tmp_sbor
  }
  sbor_add(1,'','','',wsu1,wsu2,0) ;
  
 end.  
.}
.}
.}
.}
.begin
  matrixkl:=false;
  wexcel_num_0:=1; // Гасим "-"
  MyXLwrite(year_,1,3,3)
  MyXLwrite(mes_ ,2,3,3)
  MyXLwrite( org_name ,1,5,3)

  vtmp_rep1.wwpa_it:=1
  vtmp_rep1.wwpa:=0
  HeaderStrCount:=4
  rowcur:=3 ; colcur:=9
  max_col:=0
  vtmp_rep1._loop tmp_shap_it
  { MyXLwrite(vtmp_rep1.tmp_shap_it.name2 ,rowcur, colcur,3)
    xlMergecells(rowcur, colcur-1, rowcur, colcur)  
    colcur:=colcur+1
  } //vtmp_rep1._loop tmp_shap_it
  max_col:=colcur-1
  rowcur:=4 ; colcur:=9
  vtmp_rep1._loop tmp_shap_it
  { MyXLwrite('№ пп' ,rowcur, colcur,3)
    MyXLwrite('Сумма' ,rowcur, colcur,3)
  } //vtmp_rep1._loop tmp_shap_it
  MyxlFrameCells(headerstrcount,1,rowcur,max_col,1 or 2 or 4 or 8 or 16 or 32);
  rowcur:=HeaderStrCount+1
  matrixkl:=MyXlCreaMatrix(1000,200) ;
  rowcur:=rowcur-1
  var wnum :longint;
  wnum:=0
  vtmp_rep1._loop tmp_sbor
  { rowcur:=rowcur+1
    colcur:=1
    wnum:=wnum+1;
    MyXLwrite(string(wnum) ,rowcur, colcur,2)
    MyXLwrite(vtmp_rep1.tmp_sbor.name[1] ,rowcur, colcur,3)
    MyXLwrite(substr(vtmp_rep1.tmp_sbor.name[2],1,pos('/',vtmp_rep1.tmp_sbor.name[2])-1) ,rowcur, colcur,3)
    MyXLwrite(substr(vtmp_rep1.tmp_sbor.name[2],pos('/',vtmp_rep1.tmp_sbor.name[2])+1,100) ,rowcur, colcur,3)
    MyXLwrite(vtmp_rep1.tmp_sbor.name[3] ,rowcur, colcur,3)
    MyXLwrite(string(vtmp_rep1.tmp_sbor.dmsum[1],0,2) ,rowcur, colcur,2)
    MyXLwrite(string(vtmp_rep1.tmp_sbor.dmsum[2],0,2) ,rowcur, colcur,2)
    MyXLwrite(string(vtmp_rep1.tmp_sbor.dmsum[1]-vtmp_rep1.tmp_sbor.dmsum[2],0,2) ,rowcur, colcur,2)
    vtmp_rep1._loop tmp_shap_it
    { if vtmp_rep1.getfirst tmp_shap=0
      { MyXLwrite(vtmp_rep1.tmp_shap.name3 ,rowcur, colcur,3)
        MyXLwrite(string(vtmp_rep1.tmp_shap.dmsum[1],0,2) ,rowcur, colcur,2)
      }
      else
      { MyXLwrite('-' ,rowcur, colcur,3)
        MyXLwrite(string(0,0,2) ,rowcur, colcur,2)
      }
    } //vtmp_rep1._loop tmp_shap_it
  } //vtmp_rep1._loop tmp_sbor
  rowcur:=rowcur+1
  colcur:=2
  MyXLwrite('Итого' ,rowcur, colcur,3)
  colcur:=6
  xlMergecells(rowcur, 1, rowcur,2)  
  if vtmp_rep1.getfirst tmp_sbor_it=0
  { MyXLwrite(string(vtmp_rep1.tmp_sbor_it.dmsum[1],0,2) ,rowcur, colcur,2)
    MyXLwrite(string(vtmp_rep1.tmp_sbor_it.dmsum[2],0,2) ,rowcur, colcur,2)
    MyXLwrite(string(vtmp_rep1.tmp_sbor_it.dmsum[1]-vtmp_rep1.tmp_sbor_it.dmsum[2],0,2) ,rowcur, colcur,2)
  }
  else colcur:=9
  vtmp_rep1._loop tmp_shap_it
  { MyXLwrite('-' ,rowcur, colcur,3)
    MyXLwrite(string(vtmp_rep1.tmp_shap_it.dmsum[1],0,2) ,rowcur, colcur,2)
  } //vtmp_rep1._loop tmp_shap_it
  MyxlFrameCells(headerstrcount,1,rowcur,max_col,1 or 2 or 4 or 8 or 16 or 32);
  rowcur:=rowcur+1
  MyXlEnd;
 end.
.endform  
    
 
 
 
 
 