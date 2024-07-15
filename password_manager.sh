#!/bin/bash

echo "パスワードマネージャーへようこそ!"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"

while true; do
	read options

	case $options in
		"Add Password")
			echo "サービス名を入力してください:"
			read sarvice_name

			echo "ユーザー名を入力してください:"
			read user_name

			echo "パスワードを入力してください"
			read -s password

			echo "サービス名:$sarvice_name/ユーザー名:$user_name/パスワード:$password" >> pass_list.txt

			echo "パスワードの追加は成功しました。"
			echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
			;;
		"Get Password")
			echo "サービス名を入力してください:"
			read sarvice_name

			password=$(grep "$sarvice_name" pass_list.txt | cut -d / -f 3)

			if [ -z $password ]; then
				echo "そのサービス名は登録されていません。"
			else
				echo "$(grep $sarvice_name pass_list.txt | cut -d / -f 1)"
				echo "$(grep $sarvice_name pass_list.txt | cut -d / -f 2)"
				echo "$password"
			fi 
			echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
			;;
		"Exit")
			echo "Thank you!"
			exit
			;;
		*)
			echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
			;;
	esac
done
