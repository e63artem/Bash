#!/bin/bash

if [ ! -w "/etc/grub.d/07_password" ]
then
echo "не хватает прав для изменения 07_password"
exit 1
fi

echo -n "введите имя админа системы: "; read grub_user
echo -n "введите новый пароль GRUB: "; read grub_pass1
echo -n "повторно введите пароль: "; read grub_pass2

if [ $grub_pass1 != $grub_pass2 ] #сравнение введенных паролей
then
echo "пароли не совпадают"
exit 2
fi

#создание хэша пароля, DOC позволяет передать команде несколько строк ввода, - после << означает игнорирование всех начальных символов табуляции
#<<- DOC - разделитель HereDoc

grub_hash=$( grub-mkpasswd-pbkdf2 <<- DOC   
$grub_pass1
$grub_pass2
DOC
)

#помещаем в файл /07_password то, что внутри DOC

grub_hash=$( echo $grub_hash | awk '{print $NF}')
cat > /etc/grub.d/07_password << DOC
cat << EOF
set superusers="$grub_user"
password_pbkdf2 $grub_user $grub_hash
EOF
DOC

#update-grub сканирует все ОС и создает новый grub.cfg в /boot/grub
#далее сравнивает код выполнения update-grub с 0

update-grub &>/dev/null

if [ "$?" -eq "0" ];
then
	echo "новый пароля для GRUB установлен"
else
	echo "не удалось обновить конфиг файл GRUB"
	exit 3
fi
exit 0
