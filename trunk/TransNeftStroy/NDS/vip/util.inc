function To_GalNrec(nrec: string): string;
{
 to_galNrec := substr(nkau1, 2, 30)+'h' ;
}

function to_Oradate(value : string): string;
var 
 MM INTEGER;
 YY INTEGER; 
 TMP INTEGER;
{  
  YY := DATETIME / 65536; 
  TMP := MOD(DATETIME,65536); 
  MM := TMP / 256;
  TMP := MOD(TMP,256);
  to_Oradate := string(tmp) + '.' + string(mm)+ '.' + string(yy);
//    RETURN TO_DATE(TO_CHAR(TMP)||'.'||TO_CHAmR(MM)||'.'||TO_CHAR(YY),'DD.MM.YYYY');
}