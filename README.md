# bbs-auto-login

你需要改這兩個變數

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

		# do auto-login at 3:00AM

		0 3 * * * /path/to/ptt.sh
