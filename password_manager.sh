#!/bin/bash

echo "パスワードマネージャーへようこそ!"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"

while true; do
	read options

	case $options in
		"Add Password")
			echo "GPGで設定したパスワードを入力してください。"
			read gpg_email

			echo "サービス名を入力してください:"
			read service_name

			echo "ユーザー名を入力してください:"
			read user_name

			echo "パスワードを入力してください"
			read -s password

			echo "サービス名:$service_name/ユーザー名:$user_name/パスワード:$password" >> pass_list.txt

			gpg --encrypt --recipient "$gpg_email" pass_list.txt 2> /dev/null
			encryption=$?
			
			if [ $encryption -eq 0 ]; then
				echo "パスワードの追加は成功しました。"
			else
				echo "パスワードの追加に失敗しました。もう一度、やり直してください。"
			fi
			rm pass_list.txt
			echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
			;;
		"Get Password")
			echo "サービス名を入力してください:"
			read service_name

			gpg pass_list.txt.gpg 2> /dev/null

			password=$(grep "$service_name" pass_list.txt | awk -F '[:/]' -v 'OFS=:' '{print $5,$6}')

			if [ -z $password ]; then
				echo "そのサービス名は登録されていません。"
			else
				echo "$(grep $service_name pass_list.txt | awk -F '[:/]' -v 'OFS=:' '{print $1,$2}')"
				echo "$(grep $service_name pass_list.txt | awk -F '[:/]' -v 'OFS=:' '{print $3,$4}')"
				echo "$password"
			fi
			rm pass_list.txt
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
