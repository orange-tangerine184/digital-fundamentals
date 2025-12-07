youngest_age=200
youngest_name=""
youngest_email=""
oldest_age=0
oldest_name=""
oldest_email=""
first=1

for var in $(ls $1)
do
   for file_info in $(cat $1$var)
   do
      name=$(echo $file_info | cut -d ":" -f1)
      age=$(echo $file_info | cut -d ":" -f2)
      email=$(echo $file_info | cut -d ":" -f3)
      if [ $first -eq 1 ]
      then
         youngest_age=$age
         youngest_name=$name
         youngest_email=$email
         oldest_age=$age
         oldest_name=$name
         oldest_email=$email
         first=0
       else
          if [ $age -lt $youngest_age ]
          then
             youngest_age=$age
             youngest_name=$name
             youngest_email=$email
          fi
          if [ $age -gt $oldest_age ]
          then
             oldest_age=$age
             oldest_name=$name
             oldest_email=$email
          fi
       fi
    done
done
echo -e "Самый молодой: имя: ${youngest_name}, возраст: ${youngest_age}, почта: ${youngest_email}"
echo -e "Самый старый: имя: ${oldest_name}, возраст: ${oldest_age}, почта: ${oldest_email}"
