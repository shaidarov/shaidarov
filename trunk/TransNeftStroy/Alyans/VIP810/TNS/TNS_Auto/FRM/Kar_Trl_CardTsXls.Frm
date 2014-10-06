.LinkForm 'Kar_Trl_CardTsXls' Prototype is 'KAR_TRL'
.Group 'Kar_TrlGr1'
.NameInList '’‘  ΰβ®ηª  γη¥β  ’‘ (XLS)'
.Var
 iC:CardTsXls;
 boInitRep: boolean;
.EndVar
.Begin
 boInitRep:=iC.InitRep;
 if(boInitRep) iC.GetWinParam;
End.
.{
.Begin
 if(boInitRep)
  iC.PrintOneTS(Comp(TranspNrec));
End.
.{
.{
.{
!!!
.}
.}
.}
.}
.Begin
 if(boInitRep) iC.DoneRep;

  Kar_Trl_CardTsXls.fExit();
End.
.endform