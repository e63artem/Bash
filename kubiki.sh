#!/bin/bash

# Можно имитировать бросание 2-х игровых кубиков.
SPOTS=7   # остаток от деления на 7 дает диапазон 0 - 6.
ZERO=0
kub1=0
kub2=0

# Кубики "выбрасываются" раздельно.

  while [ "$kub1" -eq $ZERO ]     # Пока на "кубике" ноль.
  do
    let "kub1 = $RANDOM % $SPOTS" # Имитировать бросок первого кубика.
  done

  while [ "$kub2" -eq $ZERO ]
  do
    let "kub2 = $RANDOM % $SPOTS" # Имитировать бросок второго кубика.
  done

let "throw = $kub1 + $kub2"

echo "1-ый кубик - $kub1"
echo "2-ой кубик - $kub2"
#echo "Сумма двух - $throw"

exit 0
