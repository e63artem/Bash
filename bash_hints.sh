#!/bin/bash

#ПЕРЕМЕННЫЕ

#получить длину переменной

var="some string"
echo ${#var}
# 11


#получить первый символ переменной

var=string
echo "${var:0:1}"
#s

# or
echo ${var%%"${var#?}"}


#удалить первый идущий 0

var="0050"
echo ${var[@]#0}
#050


#замена "а" на ","
{var/a/,}


#замена все "а" на ","
{var//a/,}


#замена регистра строки, хранящейся в переменной
var=HelloWorld
echo ${var,,}
helloworld


#МАТЕМАТИКА

echo $(( 10 + 5 ))  #15
x=1
echo $(( x++ )) #1 , notice that it is still 1, since it's post-increment
echo $(( x++ )) #2
echo $(( ++x )) #4 , notice that it is not 3 since it's pre-increment
echo $(( x-- )) #4
echo $(( x-- )) #3
echo $(( --x )) #1
x=2
y=3
echo $(( x ** y )) #8


#распечатка простых множителей числа

factor 50
# 50: 2 5 5
