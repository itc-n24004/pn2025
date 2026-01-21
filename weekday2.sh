#!/usr/bin/bash

#ツェラーの公式を利用
# $1 -> 年 $2 -> 月 $3 -> 日 ※ 年は西暦で指定すること
# 引数のチェック
if (( $# < 3 )) #引数のかず（$#）が１より少ない場合
then
	echo 'ERROR：引数が３つ必要です'
        echo '例：.weekday.sh 2026 01 21'
	exit 0
fi

year=$((10#$1))
month=$((10#$2))
day=$((10#$3))


#月の範囲チェック
if (( month < 1 || month > 12 ))
then
	echo 'ERROR：月は１〜１２で指定してください'
	exit 0
fi

#日付のチェック
max_day=31
case $month in
	4|6|9|11)
		max_day=30
		;;
	2)
		# 閏年判定
		if (( (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) ))
		then
			max_day=29
		else
			max_day=28
		fi
		;;
esac
if (( day <1 || day > max_day ))
then
	echo 'ERROR：存在しない日付です'
	exit 1
fi

# １月と２月の特別ルール（前年の１３月、１４月とみなす）
if (( month <3 ))
then
	month=$((month + 12))
	year=$((year -1))
fi

# 通日の算出
day2day=$((year + (year/4) - ( year / 100 ) + ( year / 400 ) + ( month *13 + 8 ) / 5 + day ))
# 曜日の算出
week=$((day2day % 7))

case $week in
	0) w='日曜日' ;;
        1) w='月曜日' ;;
        2) w='火曜日' ;;
        3) w='水曜日' ;;
        4) w='木曜日' ;;
        5) w='金曜日' ;;
        6) w='土曜日' ;;
esac
echo "あなたが入力した$1年$2月$3日は$wです"

#通日の取得方法を応用して、コマンドの実行経過日数やログの記録の比較ができたりする
