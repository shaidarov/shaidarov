Есть вариант для отбора данных, входящих в множественный фильтр использовать вложенные запросы DSQL, но есть и такой вот пример:

> Create View
...
> > ,Synonym Pick PickPodrMC
...
> > Where
> > ((
...
> > > TNF008\_wListPodr            == PickPodrMC.wList      and
> > > TmpSaldo1.cPodr             == PickPodrMC.cRec       and

> > ))

> ;




...

> Function CheckValidMC : Boolean;
> {
> > if((wFltInfo and 4) = 4 and (not isValid(#PickPodrMC)))
> > {
> > > CheckValidMC := False;

> > }
> > else if((wFltInfo and 2) = 2 and (not isValid(#PickMOLMC)))
> > {
> > > CheckValidMC := False;

> > }
> > else if((wFltInfo and 1) = 1 and (not isValid(#PickMCMC)))
> > {
> > > CheckValidMC := False;

> > }
> > else
> > {
> > > CheckValidMC := True;

> > }

> }

...
> _Loop TmpSaldo1
> {
> > if(not NextVisual)
> > {
> > > boResult := False;
> > > Break;

> > }
> > else if(not CheckValidMC) // ВОТ ЗДЕСЬ АНАЛИЗ ПОПАДАНИЯ ДАННЫХ ПОД ФИЛЬТРАЦИЮ
> > {
> > > Continue;

> > }_

