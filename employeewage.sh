#!/bin/bash -x

#constants for the program
isPartTime=1
isFullTime=2
maxHrsInMonth=4
empRatePerHr=20
numWorkingDays=20

#VARIABLES
totalEmpHrs=0
totalWorkingDays=0

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

while [[ $totalWorkHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
		((totalWorkingDays++))
		workHrs="$( getWorkingHours $((RANDOM%3)) )"
		totalWorkHrs=$(($totalWorkHrs+$workHrs))
done

totalSalary=$(($totalWorkHrs*$empRatePerHr))
