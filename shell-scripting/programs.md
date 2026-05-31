# Shell Scripting Programs

This file contains corrected versions of the shell scripts from the provided list.

## 1. `sample.sh`
```bash
#!/bin/bash

echo "devops-basics-shellscripting"
pwd
ls -la
date
df -h
uname -a
```

## 2. `arguments.sh`
```bash
#!/bin/bash

echo "hi, I am $1"
echo "I stay at $3"
```

## 3. `variables.sh`
```bash
#!/bin/bash

a=$(pwd)
b=$(ls -lrt)
c="This is Mahesh"
echo "$a"
echo "$b"
echo "$c"
```

## 4. `readinput.sh`
```bash
#!/bin/bash

read -p "Enter your name: " name
echo "hi $name"
read -p "Enter your place: " place
echo "I am from $place"
```

## 5. `special.sh`
```bash
#!/bin/bash

echo "name of the script is $0"
echo "1st argument passed is $1"
echo "second argument passed is $2"
echo "No of arguments passed is $#"
echo "The arguments are $*"
echo "arguments in array format $@"
echo "process id of current process is $$"
echo "PID of process went into background $!"
echo "status of last command executed was $?"
```

## 6. `math.sh`
```bash
#!/bin/bash

sum=$(expr "$1" + "$2")
echo "sum = $sum"
```

## 7. `math_without_arg.sh`
```bash
#!/bin/bash

read -p "Enter first number: " a
read -p "Enter second number: " b
sum=$(expr "$a" + "$b")
echo "sum = $sum"
```

## 8. `maths.sh`
```bash
#!/bin/bash

a=$(expr "$1" + "$2")
b=$(expr "$1" - "$2")
c=$(expr "$1" \* "$2")
d=$(expr "$1" / "$2")
echo "add = $a"
echo "sub = $b"
echo "mul = $c"
echo "div = $d"
```

## 9. `math_withoutarg.sh`
```bash
#!/bin/bash

read -p "first number: " a
read -p "second number: " b
echo "addition of a and b = $(expr "$a" + "$b")"
echo "subtraction of a and b = $(expr "$a" - "$b")"
echo "multiplication of a and b = $(expr "$a" \* "$b")"
echo "division of a and b = $(expr "$a" / "$b")"
```

## 10. `if_bigger_num.sh`
```bash
#!/bin/bash

read -p "first number: " a
read -p "second number: " b

if [ "$a" -gt "$b" ]; then
  echo "$a is big"
fi

if [ "$a" -lt "$b" ]; then
  echo "$b is big"
fi
```

## 11. `ifelse_checknum.sh`
```bash
#!/bin/bash

a="$1"

if [ "$a" -eq 5 ]; then
  echo "$a is five"
else
  echo "$a is not five"
fi
```

## 12. `elif_big_num.sh`
```bash
#!/bin/bash

if [ "$1" -gt "$2" ]; then
  echo "$1 is big"
else
  echo "$2 is big"
fi
```

## 13. `restrict_bignum.sh`
```bash
#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "pass only 2 arguments"
  exit 1
fi

if [ "$1" -gt "$2" ]; then
  echo "$1 is big"
else
  echo "$2 is big"
fi
```

## 14. `rstrict.sh`
```bash
#!/bin/bash

if [ "$#" -gt 3 ]; then
  echo "entered more than 3 args"
elif [ "$#" -lt 3 ]; then
  echo "enter less than 3 args"
else
  echo "entered args are 3"
fi
```

## 15. `big_3nums.sh`
```bash
#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 num1 num2 num3"
  exit 1
fi

if [ "$1" -gt "$2" ] && [ "$1" -gt "$3" ]; then
  echo "$1 is biggest among given 3 numbers"
elif [ "$2" -gt "$3" ]; then
  echo "$2 is bigger among the 3 given numbers"
else
  echo "$3 is bigger among $1, $2 and $3"
fi
```

## 16. `fdl.sh`
```bash
#!/bin/bash

read -p "Enter name to check whether it is file or directory or link: " name

if [ -L "$name" ]; then
  echo "$name is a symbolic link"
elif [ -d "$name" ]; then
  echo "$name is a directory"
elif [ -f "$name" ]; then
  echo "$name is a file"
else
  echo "$name does not exist"
fi
```

## 17. `username_password_ifelse.sh`
```bash
#!/bin/bash

read -p "enter username: " username
read -s -p "enter password: " password
echo

if [ "$username" == "admin" ] && [ "$password" == "secret" ]; then
  echo "entered credentials are correct"
else
  echo "wrong credentials"
fi
```

## 18. `execute_path_if_file.sh`
```bash
#!/bin/bash

path="$1"

if [ -f "$path" ]; then
  . "$path"
else
  echo "file not found: $path"
fi
```

## 19. `print_n21.sh`
```bash
#!/bin/bash

num="$1"
while [ "$num" -gt 0 ]; do
  echo "$num"
  num=$(expr "$num" - 1)
done
```

## 20. `print_n20.sh`
```bash
#!/bin/bash

num="$1"
while [ "$num" -ge 0 ]; do
  echo "$num"
  num=$(expr "$num" - 1)
done
```

## 21. `print_1to10_for.sh`
```bash
#!/bin/bash

for num in {1..10}; do
  echo "$num"
done
```

## 22. `factorial_while.sh`
```bash
#!/bin/bash

num="$1"
fact=1

while [ "$num" -gt 0 ]; do
  fact=$(expr "$fact" \* "$num")
  num=$(expr "$num" - 1)
done

echo "factorial of $1 is $fact"
```

## 23. `fibonacci.sh`
```bash
#!/bin/bash

read -p "Enter n: " n
a=0
b=1

if [ "$n" -ge 1 ]; then
  echo "$a"
fi
if [ "$n" -ge 2 ]; then
  echo "$b"
fi

i=3
while [ "$i" -le "$n" ]; do
  c=$(expr "$a" + "$b")
  echo "$c"
  a="$b"
  b="$c"
  i=$(expr "$i" + 1)
done
```

## 24. `fibonacci_range.sh`
```bash
#!/bin/bash

read -p "Enter the range for fibonacci series: " n
a=0
b=1

echo "$a"
echo "$b"

while [ "$n" -gt 2 ]; do
  c=$(expr "$a" + "$b")
  echo "$c"
  a="$b"
  b="$c"
  n=$(expr "$n" - 1)
done
```

## 25. `count_word_read.sh`
```bash
#!/bin/bash

file="$1"
count=1
while IFS= read -r line; do
  words=$(echo "$line" | wc -w)
  echo "$count: $words"
  count=$(expr "$count" + 1)
done < "$file"
```

## 26. `employee_details_prog.sh`
```bash
#!/bin/bash

file="${1:-employee_details}"
sed '1d' "$file" | while IFS= read -r line; do
  age=$(echo "$line" | awk '{print $NF}')
  if [ "$age" -gt 50 ]; then
    echo "$line" | awk '{print $1}'
  fi
done
```

## 27. `file_existence.sh`
```bash
#!/bin/bash

path="$1"
if [ -e "$path" ]; then
  echo "file exists"
else
  echo "file does not exist"
fi
```

## 28. `user_group_existence.sh`
```bash
#!/bin/bash

user="$1"
if id "$user" >/dev/null 2>&1; then
  echo "user exists"
else
  echo "user does not exist"
fi
```

## 29. `retain_30files.sh`
```bash
#!/bin/bash

total=$(ls -1 | wc -l)
remaining=$(expr "$total" - 30)

if [ "$remaining" -gt 0 ]; then
  ls -rt | head -n "$remaining" | xargs -r rm -rf
  echo "recent 30 files retained and other files deleted"
else
  echo "not more than 30 files"
fi
```

## 30. `palindrome.sh`
```bash
#!/bin/bash

read -p "enter the number: " n
rev=0
num="$n"

while [ "$n" -gt 0 ]; do
  mod=$(expr "$n" % 10)
  rev=$(expr "$rev" \* 10 + "$mod")
  n=$(expr "$n" / 10)
done

if [ "$rev" -eq "$num" ]; then
  echo "$num is palindrome"
else
  echo "$num is not a palindrome"
fi
```

## 31. `string_reverse.sh`
```bash
#!/bin/bash

str="Hello world"
strlen=${#str}
revstr=""
for (( i = strlen - 1; i >= 0; i-- )); do
  revstr+="${str:i:1}"
done

echo "original string: $str"
echo "reversed string: $revstr"
```

## 32. `reverse_string.sh`
```bash
#!/bin/bash

s="Hello world"
revstr=$(echo "$s" | rev)
echo "original string: $s"
echo "reversed string: $revstr"
```

## 33. `print_1to10_for.sh`
```bash
#!/bin/bash

for num in {1..10}; do
  echo "$num"
done
```

## 34. `ascending_descending_order.sh`
```bash
#!/bin/bash

read -p "enter the number: " num
echo "Asc Desc"
count=1
x="$num"

while [ "$count" -le "$num" ] && [ "$x" -ne 0 ]; do
  echo "$count $x"
  count=$(expr "$count" + 1)
  x=$(expr "$x" - 1)
done
```

## 35. `fruit_names.sh`
```bash
#!/bin/bash

for fruit in apple banana orange mango; do
  echo "$fruit"
done
```

## 36. `second_biggest_num.sh`
```bash
#!/bin/bash

numbers=(10 45 23 67 34 89 12)
second_biggest=$(printf "%s\n" "${numbers[@]}" | sort -rn | sed -n '2p')
echo "Second biggest: $second_biggest"
```

## 37. `function_example.sh`
```bash
#!/bin/bash

greet() {
  local name="$1"
  echo "Hello, $name"
}

greet "Mahesh"
```

## 38. `arrays_example.sh`
```bash
#!/bin/bash

arr=(alpha beta gamma)
echo "First: ${arr[0]}"
for i in "${arr[@]}"; do
  echo "item: $i"
done

declare -A users
users[alice]=1001
users[bob]=1002
echo "alice uid: ${users[alice]}"
```

## 39. `case_example.sh`
```bash
#!/bin/bash

case "$1" in
  start) echo "starting" ;;
  stop) echo "stopping" ;;
  *) echo "usage: $0 start|stop" ;;
esac
```

## 40. `param_expansion.sh`
# → Remove shortest match
## → Remove longest matching pattern from the beginning (left side) of the string.
##*/ -->match everything upto last /
```bash
#!/bin/bash

name=""
echo "${name:-Guest}"
path="/home/user/docs/file.txt"
echo "${path##*/}"   # file.txt
```

## 41. `heredoc_example.sh`
Read all lines until another EOF is found. Pass those lines as standard input to cat.
```bash
#!/bin/bash

cat <<EOF > /tmp/greeting.txt
Hello from heredoc
Generated at $(date)
EOF
```

## 42. `redirection_example.sh`
```bash
#!/bin/bash

echo "stdout" > /tmp/out.txt
echo "stderr" 1>&2
ls /nonexistent 2> /tmp/err.txt || true
```

## 43. `getopts_example.sh`
```bash
#!/bin/bash

while getopts ":f:n:" opt; do
  case $opt in
    f) file="$OPTARG" ;;
    n) name="$OPTARG" ;;
    \?) echo "Invalid option -$OPTARG" ;;
  esac
done

echo "file=$file name=$name"
```

## 44. `trap_example.sh`
trap 'commands' SIGNAL
ex:trap 'docker rm -f test-container' EXIT
ex:kubectl port-forward svc/myapp 8080:80 & PID=$! &
trap 'kill $PID' EXIT
```bash
#!/bin/bash

trap 'echo "Cleanup..."; rm -f /tmp/mytmpfile' EXIT INT TERM
touch /tmp/mytmpfile
echo "Doing work..."
sleep 1
```

## 45. `arithmetic_example.sh`
```bash
#!/bin/bash

a=5
((a+=10))
echo "$a"
sum=$(( 3 + 4 * 2 ))
echo "$sum"
```

## 46. `regex_example.sh`
```bash
#!/bin/bash

str="$1"
if [[ $str =~ ^[0-9]+$ ]]; then
  echo "numeric"
else
  echo "not numeric"
fi
```

## 47. `subshell_vs_source.sh`
```bash
#!/bin/bash

echo "PWD before: $(pwd)"
( cd /tmp; echo "in subshell: $(pwd)" )
echo "PWD after subshell: $(pwd)"

# source example (changes current shell)
# . ./change_dir.sh
```

## 48. `export_example.sh`
```bash
#!/bin/bash

export MYVAR="hello"
bash -c 'echo "$MYVAR"'   # inherited by child process
```

## 37. `digit_num.sh`
```bash
#!/bin/bash

a="$1"
if [ "$a" -le 9 ]; then
  echo "$a is one digit number"
elif [ "$a" -le 99 ]; then
  echo "$a is two digit number"
elif [ "$a" -le 999 ]; then
  echo "$a is three digit number"
else
  echo "$a has more than three digits"
fi
```

## 38. `create5files.sh`
```bash
#!/bin/bash

for i in {1..5}; do
  touch "f$i"
done
```

## 39. `create_multiple_dirs.sh`
```bash
#!/bin/bash

for i in {1..100}; do
  mkdir -p "dir$i"
done
```

## 40. `find_size_of_file.sh`
```bash
#!/bin/bash

printf "Hello world" >> myfile.txt
ls -al myfile.txt | awk '{print $5}'
```

## 41. `check_folder_existence_and_counts.sh`
```bash
#!/bin/bash

read -p "enter the dir name to check for its existence: " dir_name

if [ -d "$dir_name" ]; then
  echo "given dir exists"
  echo "no of files in the dir $(find "$dir_name" -type f | wc -l)"
  echo "no of dirs in the dir $(find "$dir_name" -type d | wc -l)"
else
  echo "given dir doesn’t exist"
  echo "press 1 to create the dir"
  echo "press 2 to exit"
  read test
  if [ "$test" -eq 1 ]; then
    mkdir -p "$dir_name"
  else
    exit 0
  fi
fi
```

## 42. Common file test examples
```bash
if [ -e file.txt ]; then
  echo "file exists"
elif [ -d dir ]; then
  echo "dir exists"
elif [ -r file.txt ]; then
  echo "file is readable"
elif [ -w file.txt ]; then
  echo "file is writable"
fi
```
