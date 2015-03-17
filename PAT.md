# Получение значений ПАТ-идентификаторов в Vip #

## Вариант Стаса ##
HandleEvent // interface
> cmInit:  {
> FormExInit;
> }

> cmDone : {
> > FormExDone;

> }
end;

function calc\_TXO(Str\_Formula : string): double ;
{
> FormExClearFormula;
> FormExAddKey('&1', trim(Str\_Formula), '', '', '');
> if(FormExStartCount(0))
> > FormExGetKeyValues('&1', calc\_TXO, 0, 0)

> else
> {
> > calc\_TXO := 0;

> }
}

PatStr := 'æ[Æ¿»:é][ÅÑα¿«ñ:î' + month(RepParams.EndDate) + '.â' + year(RepParams.EndDate) + ']';

Dt\_KGN       := calc\_TXO(PatStr +'ä78\_01+' + PatStr + 'ä78\_02');


## Вариант Базылева Жени ##

function TxoExecPat(hTxo : longint; PatIdent : string; var vNde, vVal, vKol : double) : boolean