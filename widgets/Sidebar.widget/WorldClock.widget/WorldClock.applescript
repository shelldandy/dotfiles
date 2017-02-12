--test({"US/Pacific,Europe/Warsaw,Europe/London", "Cupertino,Wroclaw,UK", "12"})
--test({"US/Pacific,Europe/Warsaw,Europe/London", "", "12"})

on run (arguments)
	
	set locations to item 1 of arguments as string
	set AppleScript's text item delimiters to ","
	set locations to text items of locations as list
	set AppleScript's text item delimiters to ""
	--return locations
	
	if (item 2 of arguments as string) is "" then
		set AppleScript's text item delimiters to "/"
		set cityNames to {}
		repeat with aLocation in locations
			copy text item 2 of aLocation to the end of cityNames
		end repeat
		set AppleScript's text item delimiters to ""
	else
		set cityNames to item 2 of arguments as string
		set AppleScript's text item delimiters to ","
		set cityNames to text items of cityNames as list
		set AppleScript's text item delimiters to ""
	end if
	--return cityNames
	
	try
		set timeFormat to item -1 of arguments as number
	on error
		set timeFormat to 12
	end try
	
	if timeFormat = 12 then
		set format to "\"+%-l:%M %p\""
	else
		set format to "\"+%H:%M\""
	end if
	
	set outTimes to {}
	
	repeat with aLocation in locations
		set aTime to do shell script "export TZ='" & aLocation & "'; date " & format & "; unset TZ"
		set outTimes to outTimes & aTime
	end repeat
	
	set finalList to {"", "", ""}
	
	repeat with i from 1 to the count of cityNames
		set item i of finalList to item i of cityNames & "~" & item i of outTimes & ";"
	end repeat
	
	return items 1 thru -2 of (finalList as string) as string
end run