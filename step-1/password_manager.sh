#!/bin/bash
echo "パスワードマネージャーへようこそ！"

echo -n "サービス名を入力してください："
read service

echo -n "ユーザ名を入力してください："
read username

echo -n "パスワードを入力してください："
read password

echo "$service:$username:$password" >> passwords_file.txt

echo "Thank you!"
