#!/usr/bin/expect

# Cron line explaination:
# -------------------------------------------------------------------
# * * * * * "command to be executed"
# | | | | |
# | | | | |
# | | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
# | | | +------ Month of the Year (range: 1-12)
# | | +-------- Day of the Month  (range: 1-31)
# | +---------- Hour              (range: 0-23)
# +------------ Minute            (range: 0-59)
#
# Ref: https://crontab.guru
#
# Example: (edit by "crontab -e" command)
#
#    # do auto-login at 3:00AM
#
#    0 3 * * * /path/to/ptt.sh

exec sh -c { export LANG="zh_TW.UTF-8" }

set bbsID		"korea.fish"
set bbsPW		"show-me-the-money"

set delayLong	"60"
set delayShort	"2"

spawn ssh -oBatchMode=no -oStrictHostKeyChecking=no bbsu@ptt.cc

expect {
	"請輸入代號"						{ sleep $delayShort; send "$bbsID\r";	exp_continue }
	"請輸入您的密碼"					{ sleep $delayShort; send "$bbsPW\r";	exp_continue }
	"您想刪除其他重複登入的連線嗎"		{ sleep $delayShort; send "y\r"; exp_continue }
#	"歡迎您再度拜訪"					{ sleep $delayShort; send "\r";  exp_continue }
	"您要刪除以上錯誤嘗試的記錄嗎"		{ sleep $delayShort; send "y\r"; exp_continue }
	"密碼不對或無此帳號"				{ sleep $delayShort; exit }
	"請勿頻繁登入以免造成系統過度負荷"	{ sleep $delayShort; send "\r";  exp_continue }
	"請按任意鍵繼續"					{ sleep $delayShort; send "\r";  exp_continue }
	"按任意鍵繼續"						{ sleep $delayShort; send "\r";  exp_continue }
#	"oodbye"							{ sleep $delayShort; interact }
	"oodbye"							{ sleep $delayLong;  send "g\r"; exp_continue }
	"您確定要離開"						{ sleep $delayShort; send "y\r"; exp_continue }
	"此次停留時間"						{ sleep $delayShort; send "\r";  exp_continue }
}
exit
