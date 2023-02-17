dim fn
dim sn
dim fm
dim output
dim mode
dim tn
dim ftn
dim fmt

mode = inputbox("Mode?")

if mode = "numbers" then

fn = inputbox("First Number")
fm = inputbox("Equation Formula")

if fm = "-" then
sn = inputbox("Second Number")
msgbox(fn - sn)
end if

if fm = "*" then
sn = inputbox("Second Number")
msgbox(fn * sn)
end if

if fm = "/" then
if fn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
sn = inputbox("Second Number")
if sn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
msgbox(fn / sn)
end if

if fm = "^" then
sn = inputbox("Second Number")
msgbox(fn ^ sn)
end if

if fm = "mod" then
sn = inputbox("Second Number")
msgbox(fn mod sn)
end if

if fm = "()" then
sn = inputbox("Second Number")
fmt = inputbox("Formula inside ()")
tn = inputbox("Third Number")

if fmt = "-" then
msgbox(fn * sn - tn)
end if

if fmt = "*" then
msgbox(fn * sn * tn)
end if

if fmt = "/" then
sn = inputbox("Second Number")
if sn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
if tn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
msgbox(fn * sn / tn)
end if

if fmt = "^" then
msgbox(fn * sn ^ tn)
end if

if fm = "mod" then
msgbox(fn * sn mod tn)
end if
end if

end if

if mode = "integers" then
fn = inputbox("First Number")
fm = inputbox("Equation Formula")

if fm = "-" then
sn = inputbox("Second Number")
msgbox(fn - sn)
end if

if fm = "*" then
sn = inputbox("Second Number")
msgbox(fn * sn)
end if

if fm = "/" then
if fn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
sn = inputbox("Second Number")
if sn = "0" then
msgbox("Cannot divide by zero")
wscript.quit
end if
msgbox(fn \ sn)
end if

if fm = "^" then
sn = inputbox("Second Number")
msgbox(fn ^ sn)
end if
end if