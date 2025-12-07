for var in $(ls $1)
do
   for file_info in $(cat $1$var)
   do
      name=$(echo $file_info | cut -d ":" -f1)
      age=$(echo $file_info | cut -d ":" -f2)
      email=$(echo $file_info | cut -d ":" -f3)
      if [[ $email =~ spbstu.ru$ ]]
         then
         echo -e "Меня зовут ${name}, мой возраст ${age}, моя почта ${email}"
         fi
    done
done
