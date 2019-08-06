# bbs-auto-login

## 系統需求

你需要安裝 expect 套件

	$ sudo apt-get install expect

## script 設定

你需要改這兩個變數，輸入你自己的 ptt 登入帳密。

    set bbsID "korea.fish"
    set bbsPW "show-me-the-money"


## Cron line explaination:

		* * * * * "command to be executed"
		| | | | |
		| | | | |
		| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
		| | | +------ Month of the Year (range: 1-12)
		| | +-------- Day of the Month  (range: 1-31)
		| +---------- Hour              (range: 0-23)
		+------------ Minute            (range: 0-59)

Ref: https://crontab.guru

### Example: (edit by "crontab -e" command)

	# do auto-login at 3:15AM, 3:30AM, 3:45AM

	15,30,45 3 * * * LC_ALL="zh_TW.UTF-8" LANGUAGE="zh_TW.UTF-8" LANG="zh_TW.UTF-8" /path/to/ptt.sh

ps: 需要設定 locale 語系


## 如何測試

先把讓 cron 每分鐘執行，然後使用 `while true; do ps aux | grep ptt.sh; sleep 1; done` 監看。

使用 PCMan 之類的終端軟體登入 ptt，接著監視當 ptt.sh 被 cron 喚醒的時候，已經登入的帳戶是否有被踢掉。

如果有的話，表示自動登入程序正常。可以將 cron 觸發時間改成凌晨。
