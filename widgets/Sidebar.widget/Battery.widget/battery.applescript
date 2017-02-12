set allText to do shell script "pmset -g batt"

try
	set AppleScript's text item delimiters to "%"
	set chargeLevel to last word of text item 1 of allText
	set AppleScript's text item delimiters to ""
	set chargeLevel to chargeLevel as text
	
	set AppleScript's text item delimiters to ";"
	set status to text item 2 of allText
	
	set AppleScript's text item delimiters to ":"
	set theTime1 to last word of text item 1 of allText
	try
		set theTime1 to theTime1 as number
	on error
		set theTime1 to theTime1 as text
	end try
	set theTime2 to characters 1 thru 2 of text item 2 of allText
	set AppleScript's text item delimiters to ""
	if class of theTime1 is not integer then
		set theTime to ""
	else
		set theTime to theTime1 & ":" & (theTime2 as string) as string
	end if
	
	if theTime is "" then set {theTime, status} to {"Estimating…", ""}
	if theTime is "0:00" then set theTime to "✔︎"
	
	return chargeLevel & "%" & " " & theTime & status
	--return "9% 8:45 charging"
on error
	return "NA"
end try