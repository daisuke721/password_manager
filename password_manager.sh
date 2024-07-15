#!/bin/bash

echo "パスワードマネージャーへようこそ！"

echo "サービス名を入力してください:"
read sarvice_name

echo "ユーザー名を入力してください:"
read user_name

echo "パスワードを入力してください:"
read -s password

echo "サービス名:$sarvice_name/ユーザー名:$user_name/パスワード:$password" >> pass_list.txt

echo "Thank you!"
