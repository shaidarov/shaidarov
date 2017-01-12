Для автоматического формирования PersSFO по записям MBPin (например, если ранее велась Спецоснатска, но не велась Спецодежда) существует Интерфейс запускаемый через "Запуск внешнего интерфейса": F\_SFO::CHKPRSSFO (F\_SFO.res)

# Реализация спецодежды #

> В Актах на списание СФО существует функционал "Реализация" , что бы по nRec складского ордера узнать MBPmove.nRec необходимо выполнить запрос:
```
Select RefTable.nRec, MBPmove.nRec
where ((   89509042594307684 == SklOrder.nRec
        and 4                                        == RefTable.wAccount
        and 21                                      == RefTable.wMain
        and 0                                        == RefTable.wSub
        and 2003                                 == RefTable.wtable1

        and 1                                        == RefTable.wTable2     (noIndex)
        and SklOrder.nRec                == RefTable.cRecord2   (noIndex)

        and RefTable.cRecord1       == MBPmove.nRec
));
```