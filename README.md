## パスワードマネージャー
### 利用方法
#### 1.GnuPGのインストール
```bash
sudo apt install gnupg
```
#### 2.設定方法
* 参照:<https://wiki.archlinux.jp/index.php/GnuPG>

#### 3.実行方法
```bash
chmod +x password.manager # 実行権限の付与
./password.manager.sh # 実行コマンド
```
#### 4.動作内容
* **Add Password**
    1. サービス名の入力
    2. ユーザー名の入力
    3. パスワードの入力
    4. GnuPGで設定したメールアドレスの入力
* **Get Password**
    1. サービス名の入力
    2. GnuPGで設置したパスフレーズの入力
* **Exit**
    1. 終了したい場合は`Exit`と入力
