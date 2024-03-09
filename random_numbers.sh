#!/bin/bash

echo "Введите нужное кол-во рандомных чисел: "
read N
MAXCOUNT=$N
count=1
 
echo "-----------------"
while [ "$count" -le $MAXCOUNT ]      # Генерация ($MAXCOUNT) случайных чисел.
do
  number=$RANDOM
  echo $number
  let "count += 1"  # Нарастить счетчик.
done
echo "-----------------"




