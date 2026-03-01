Option Explicit
Dim a,b,c,d,e,f,g,h,i,n,o,r
Dim net, pc, tz, timezone, region
Dim alone, aware
Dim createLore ' New variable to track whether to make the document

Set a = CreateObject("WScript.Shell")
Set b = CreateObject("Scripting.FileSystemObject")
Set r = CreateObject("VBScript.RegExp")
r.Pattern = "^[A-Za-z ]{2,}$"
r.IgnoreCase = True

c = WScript.ScriptFullName

' ===== START CONFIRMATION =====
Dim startConfirm
startConfirm = MsgBox("This is not malware, it's just a fun project. Would you like to continue?", vbYesNo + 48, "Confirmation")
If startConfirm = vbNo Then WScript.Quit

' ===== LORE DOCUMENT CONFIRMATION =====
Dim loreConfirm
loreConfirm = MsgBox("Would you like this 'fake virus' to make the lore document?", vbYesNo + 48, "Lore Document")
If loreConfirm = vbYes Then
    createLore = True
Else
    createLore = False
End If

MsgBox "An error occured while trying to run this file.",16+4096,"thanks for the permission."
MsgBox "There's nothing you can do now",16+4096,"thanks for the permission."
MsgBox "Actually... there is something you can do.",48+4096,"Wait."
MsgBox "PLAY MY GAME",48+4096,"Option"

d = Trim(InputBox("what is your name?","tell me now"))
If d="" Or Not r.Test(d) Then
    MsgBox "you have no idea how to type do you? ill just name you idiot",48+4096,"..."
    d="idiot"
End If

MsgBox "hello " & d & "! Let me ask you some questions",64+4096,"Hello"

' ===== QUESTIONS =====
Do
    e = InputBox("What's your favorite color?","TELL ME")
Loop Until Len(Trim(e))>1
MsgBox "ok. I also like " & e & " too.",64+4096,"Cool"

Do
    alone = InputBox("Are you alone?","YOU SURE? im INSIDE")
Loop Until Len(Trim(alone))>0
MsgBox "ARE YOU SURE",64+4096,"ARE YOU SURE"

Do
    f = InputBox("What's your favorite game?","ok")
Loop Until Len(Trim(f))>1
MsgBox "Wow! I like " & f & " too!",64+4096,"Fun"

Do
    aware = InputBox("Are you aware of your surroundings?","12321")
Loop Until Len(Trim(aware))>0
MsgBox "YOU SURE?",64+4096,"CHECK AGAIN"

Do
    g = InputBox("What's your favorite food?","...")
Loop Until Len(Trim(g))>1
MsgBox "Sometimes i like " & g & " also",64+4096,"Delicious"

Do
    h = InputBox("Did you hear a window break near you?","R U SURE?")
Loop Until Len(Trim(h))>0
MsgBox "LOOK AROUND.",64+4096,"YES OR NO."

' ===== 3 SECOND PAUSE =====
WScript.Sleep 3000

MsgBox "Oooh looks like I need this!",64+4096,"I found something back here"

' ===== RUN EXISTING NOTIFICATION SCRIPT =====
Dim scriptDir, notifPath
scriptDir = Left(c, InStrRev(c, "\") - 1)
notifPath = scriptDir & "\Notification.vbs"

If b.FileExists(notifPath) Then
    a.Run """" & notifPath & """", 0, False
    WScript.Sleep 2000
Else
    MsgBox "Dang it. Notification.vbs not found. I'll let you go.", 16+4096, "FOR NOW"
End If

MsgBox "YES! now i can show you something!",64+4096,"A trick i found.."
MsgBox "Copy this link for me to show you something cool!" & vbCrLf & "https://pastebin.com/sgKBZYQa",64+4096,"Important"
a.Run "https://pastebin.com/sgKBZYQa"

' ===== TERMINAL CODE INPUT (FIXED VBScript VERSION) =====
Dim codeInput
Do
    codeInput = Trim(InputBox("AUTH TERMINAL" & vbCrLf & "===============================" & vbCrLf & "ENTER AUTHORIZATION CODE:"))
    If codeInput <> "K1LLC0DE" Then
        MsgBox "ACCESS DENIED.",16+4096,"TERMINAL"
    End If
Loop Until codeInput = "K1LLC0DE"

' ===== CONTINUE SCRIPT =====
MsgBox "ARE YOU DELETING ME??",16+4096,"STOP"
MsgBox "NO DONT PLEASE NOO!",16+4096,"NOOO"

For i=0 To 100 Step 10
    a.Popup "Deleting system files..." & vbCrLf & "Progress: " & i & "%",1,"Processing",48
Next

MsgBox "WAIT.",48+4096,"..."
MsgBox "BEFORE I CORRUPT I NEED TO LOOK FOR SOMETHING.",48+4096,"Scanning..."

Set net = CreateObject("WScript.Network")
pc = net.ComputerName

Set tz = GetObject("winmgmts:\\.\root\cimv2")
For Each timezone In tz.ExecQuery("Select * from Win32_TimeZone")
    region = timezone.Caption
Next

MsgBox "Computer name found: " & pc,48+4096,"FOUND"
MsgBox "Time zone detected:",48+4096,"FOUND"
MsgBox region,16+4096,"LOCATION"
MsgBox "That tells me enough.",16+4096,"..."

' ===== FINAL LOG FILE (ONLY IF USER WANTED IT) =====
If createLore Then
    n = a.SpecialFolders("Desktop") & "\K1LLC0DE LOG.txt"
    Set o = b.CreateTextFile(n,True)

    o.WriteLine "lock your doors."
    o.WriteLine "You don't know if he will find you or not."
    o.WriteLine "I had to move because of this virus thing."
    o.WriteLine "Some people have been found."
    o.WriteLine "Some haven't."
    o.WriteLine "Hopefully your one of those people that don't get found."
    o.Close

    a.Run "notepad """ & n & """",1,False
End If

' ===== AUTOMATIC SHUTDOWN =====
Dim shutdownCmd
shutdownCmd = "shut" & "down -s -t " & 30 & " -f -c " & Chr(34) & "GO TO COMMAND PROMPT AND TYPE SHUTDOWN /A TO CANCEL" & Chr(34)
a.Run shutdownCmd, 0, True

' ===== SELF DELETE =====
a.Run "cmd /c timeout /t 2 /nobreak > nul & del """ & c & """", 0, False
WScript.Quit