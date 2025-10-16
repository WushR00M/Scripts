Dim Notice
Dim Message
Dim Message1
Dim Message2

'  Error Handling
On Error Resume Next

'  Standard Inputbox
Notice = "  My Date Counter "
Message = "What would you like to do ?" & vbcr & vbcr &_
"1 - Date from Today by Number of Days " & vbcr &_
"2 - Number of Days to Future Date " & vbcr &_
"3 - Number of Days between 2 Dates" & vbcr & vbcr &_
"Enter the number of your choice."

'  InputBox results
Question = InputBox(message,Notice)
'  Check for Null or empty inputbox then cancels
IF IsEmpty(Question) THEN
WScript.quit()

ELSEIF Len(Question) = 0 THEN
WScript.quit()

ELSEIF Question = 0 THEN
WScript.quit()

ELSE
  SELECT Case Question
   Case 1 Run(1)
   Case 2 Run(2)
   Case 3 Run(3)
  END SELECT

END IF

'  Case Statements for result from Inputbox
Sub Run(var)
Set WS = CreateObject("WScript.shell")
    Select Case var
Case 1 Message=inputbox("How many days do you want to count? " &  vbCrLf &  vbCrLf & "Either positive or negative number.", "  Enter the # of Days ")
    Message2=weekdayname(weekday(DateAdd("d", message, Date))) & ", " & DateAdd("d", Message, Date)
    Message = Message & " days from today will be " &  vbCrLf & "    " &  Message2
     
Case 2 Message1=inputbox("How many days until ?" &  vbCrLf &  vbCrLf & "Enter the Date as m/d/yy or mm/dd/yyyy", "  Enter Future Date ")
    Message2=DateDiff("d", Date , Message1)
    Message="There are " & Message2 & " days until " &  vbCrLf & "      " & Message1
     
Case 3 Message1=inputbox("Start Date ? " &  vbCrLf &  vbCrLf & "Enter the Date as m/d/yy or mm/dd/yyyy", "  Date From")
    Message=inputbox("End Date ?  " &  vbCrLf &  vbCrLf & "Enter the Date as m/d/yy or mm/dd/yyyy", "  Date To")
    Message2=DateDiff("d", Message1 , Message)
    Message="There are " & Message2 & " Days " &  vbCrLf & " From " & Message1 & vbCrLf & " To " & Message

    END SELECT
End Sub

'  Error handling message
IF Err.Number <> 0 THEN
msgbox "You entered something incorrectly.  Try again.  ",0+16," Ooopps...."
WScript.quit()
END IF

'  Final results
Msgbox Message, vbInformation, Notice