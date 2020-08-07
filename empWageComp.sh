#!/bin/bash -x
#echo "Welcome to Employee Wage Computation program"

IS_PART_TIME=1;
IS_FULL_TIME=2;
MAX_HRS_IN_MONTH=100;
EMP_RATE_PER_HR=20;
NUM_WORKING_DAYS=20;

totalEmpHr=0;
totalWorkingDays=0;

function getWorkHrs() {
        case $1 in
                $IS_FULL_TIME)
                        empHrs=8
                        ;;
                $IS_PART_TIME)
                        empHrs=4
                        ;;
                *)
                        empHrs=0
                        ;;
        esac
}

function day() {
	case $1 in
		$IS_FULL_TIME)
                        echo "fullday"
                        ;;
                $IS_PART_TIME)
                        echo "halfday"
                        ;;
                *)
                        echo "absent"
                        ;;
        esac
}


function getEmpWage () {
        echo $(($1*$EMP_RATE_PER_HR))
}

while [[  $totalEmpHr -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	abc=$((RANDOM%3))
        ((totalWorkingDays++))
        getWorkHrs $abc
        totalEmpHr=$(($totalEmpHr + $empHrs))
        dailyWages[$totalWorkingDays]=$(($empHrs*$EMP_RATE_PER_HR))
	days[$totalWorkingDays]="$( day $abc )"
done

totalSalary="$( getEmpWage $totalEmpHr )"


echo "daily wages ------> " ${dailyWages[@]}
echo "working days are as follows ----> " ${days[@]}

echo "total salary = -----> " $totalSalary




