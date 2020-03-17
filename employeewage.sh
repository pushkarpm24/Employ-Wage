#!/bin/bash -x

#constants for the program
isPartTime=1
isFullTime=2
maxHrsInMonth=4
empRatePerHr=20
numWorkingDays=20

#VARIABLES
totalWorkHrs=0
totalWorkingDays=0

declare -A empDailyWage


function getWorkingHours() {
      case $1 in
         $isFullTime)
            workHrs=8
               ;;
         $isPartTime)
            workHrs=4
               ;;
         *)
            workHrs=0
               ;;
      esac
		echo $workHrs
}

function calcDailyWage() {
	local workHrs=$1
	wage=$(($workHrs*$empRatePerHr))
	echo $wage

}

while [[ $totalWorkHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
		((totalWorkingDays++))
		workHrs="$( getWorkingHours $((RANDOM%3)) )"
		totalWorkHrs=$(($totalWorkHrs+$workHrs))
		empDailyWage["Day" "$totalWorkingDays"]="$( calcDailyWage $workHrs )"
done

totalSalary="$( calcDailyWage $totalWorkHrs )"
echo "Daily wage " ${empDailyWage[@]}
echo "All Keys " ${!empDailyWage[@]}
