#!/bin/bash
# set -x

function isArtikel  {
	return $( [[ $1 == "der" ]] || [[ $1 == "die" ]] || [[ $1 == "das" ]] )
}

LINECOUNT=$(wc -l nouns.txt | grep -E '\d+' -o)

QUESTIONS=${1:-10}
ANSWERS=0
CORRECT_ANSWERS=0

while [ $ANSWERS -lt $QUESTIONS ]; do

	RANDLINE=$((1 + RANDOM % $LINECOUNT))
	WORD=$(head -n $RANDLINE nouns.txt | tail -n 1)
	ARTIKEL=$(echo $WORD | cut -c 1-3)
	isArtikel $ARTIKEL || continue
	
	while true 
	do
		read -p "___ $(echo $WORD | cut -c 5-100)$(printf '\r')" answer
		isArtikel $answer && break
	done
	if [[ $answer == $ARTIKEL ]]; then 
		echo 👍🏼
		((CORRECT_ANSWERS++))
		echo $(date +%s),1,\"$WORD\",\"$answer\" >> .history
	else 
		echo 👎🏼 $WORD
		echo $(date +%s),0,\"$WORD\",\"$answer\" >> .history
	fi

	((ANSWERS++))
done
echo  $CORRECT_ANSWERS x 👍🏼 / $((QUESTIONS - CORRECT_ANSWERS)) x 👎🏼
echo =============
echo Wrong aswers:
echo =============
tail -n $QUESTIONS .history | grep -o -E ',0,(.+)' | cut -c 4-
