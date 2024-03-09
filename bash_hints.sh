#!/bin/bash

VARIABLE
MATH
GREP
SED
AWK
XARGS
FIND


#VARIABLE

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





#MATH

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


#выводит арифметическую сумму например до числа 12
seq 12|paste -sd+|bc





#GREP

grep = grep -G # Basic Regular Expression (BRE)
fgrep = grep -F # fixed text, ignoring meta-characters
egrep = grep -E # Extended Regular Expression (ERE)
rgrep = grep -r # recursive
grep -P # Perl Compatible Regular Expressions (PCRE)

#грепнуть ip адрес
grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
# or
grep -Po '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'


#вывести только одно/первое совпадение
grep -m 1 bbo filename


#не чувствительный к регистру
grep -i "bbo" filename


#grep OR
grep 'A\|B\|C\|D'


#grep AND
grep 'A.*B'

#передает найденную (если найденную) переменную в новую переменную $long_str, не совсем понимаю $ перед echo
$echo "$long_str"|grep -q "$short_str"
if [ $? -eq 0 ]; then echo 'found'; fi
#grep -q will output 0 if match found
#remember to add space between []!



#SED

#удалить 1-ю строку
sed 1d filename

#удалить первые 100 строк
sed 1,100d filename

#удалить строки со строкой (bbo)
sed "/bbo/d" filename
#игнор регистра
sed "/bbo/Id" filename

#отредактировать и сохранить файл
sed -i "/bbo/d" filename

#удалить пустые строки
sed '/^\s*$/d'
# or
sed '/^$/d'

#удалить последнюю строку
sed '$d'

#удалить последний символ из конца файла
sed -i '$ s/.$//' filename

#добавить что-то в строку 1 и 3
sed -e '1isomething' -e '3isomething'

#добавить строку в конец файла
sed '$s/$/]/' filename

#добавить (bbo) в начало каждой строки
sed -e 's/^/bbo/' filename

#добавить ("}") в конец каждой строки
sed -e 's/$/\}\]/' filename

#заменить А на В
sed 's/A/B/g' filename

#удалить ведущие пробелы и табуляции
sed -e 's/^[ \t]*//'
# Notice a whitespace before '\t'!!

#удалить только ведущие пробелы
sed 's/ *//'

#вывести определенную строку (123)
sed -n -e '123p'




#AWK

#установить табуляцию в качестве разделителя полей
awk -F $'\t'

#вывод с разделителем табуляцией
awk -v OFS='\t'

#найти кол-во столбцов
awk '{print NF}'

#и т.д.



#XARGS

#превратить вывод в одну строку
ls -l| xargs

#посчитать все файлы
ls |xargs -n1 wc -l

#установить табуляцию в качестве разделителя
xargs -d\t

#выводить по 3 элемента в строке
echo 1 2 3 4 5 6| xargs -n 3
# 1 2 3
# 4 5 6

#переместить файлы в папку
find . -name "*.bak" -print 0|xargs -0 -I {} mv {} ~/old
# or
find . -name "*.bak" -print 0|xargs -0 -I file mv file ~/old

#копировать все файлы из А в Б
find /dir/to/A -type f -name "*.py" -print 0| xargs -0 -r -I file cp -v -p file --target-directory=/path/to/B
# v: verbose|
# p: keep detail (e.g. owner)




