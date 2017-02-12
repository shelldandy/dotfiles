--test({"10/29/2012"})

--http://www.mathcats.com/explore/elapsedtime.html

on run (argument)
	set theDate to date (item 1 of argument)
	set {year:y, month:m, day:d} to theDate
	set {year:cy, month:cm, day:cd} to current date
	
	set aYear to cy - y
	set aMonth to cm - m
	set aDay to cd - d
	
	if aDay is less than 0 then
		set aDay to aDay + daysinmonth(theDate)
		set aMonth to aMonth - 1
	end if
	
	if aMonth is less than 0 then
		set aMonth to aMonth + 12
		set aYear to aYear - 1
	end if
	
	return aYear & space & checkPlural(aYear, "year") & space & aMonth & space & checkPlural(aMonth, "month") & space & aDay & space & checkPlural(aDay, "day") as string
end run

on daysinmonth(theDate)
	copy theDate to d
	set d's day to 32
	return (d - (d's day) * days)'s day
end daysinmonth

on checkPlural(aValue, label)
	if aValue = 1 then
		return label
	else
		set label to label & "s"
	end if
end checkPlural