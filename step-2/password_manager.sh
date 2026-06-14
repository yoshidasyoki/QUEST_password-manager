#!/bin/bash
echo "パスワードマネージャーへようこそ！"

while : ;do
  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  case "$choice" in
    "Add Password")
      echo -n "サービス名を入力してください："
      read service
      echo -n "ユーザー名を入力してください："
      read username
      echo -n "パスワードを入力してください："
      read password
      echo $'\n'

      input_array=("$service" "$username" "$password")
      echo "${input_array[@]}" >> passwords_file.txt

      echo "パスワードの追加は成功しました。"
      ;;
    "Get Password")
      echo -n "サービス名を入力してください："
      read input_service

      has_service=0
      while read line
      do
        read_array=($line)
        if [[ "$input_service" == "${read_array[0]}" ]]; then
          echo "サービス名: ${read_array[0]}"
          echo "ユーザー名: ${read_array[1]}"
          echo "パスワード: ${read_array[2]}"
          echo $'\n'
          has_service=1
          break
        fi
      done < passwords_file.txt

      if [[ "$has_service" -eq 0 ]]; then
        echo "そのサービスは登録されていません。"
      fi
      ;;
    "Exit")
      exit 0
      ;;

    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done
