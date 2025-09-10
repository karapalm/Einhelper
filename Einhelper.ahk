#Requires AutoHotkey v2
#include OCR.ahk
Persistent
CoordMode "Mouse", "Screen"
SetDefaultMouseSpeed 5
SendMode "Event"
$`::{
;Send "z"

;Send "test"
;return
sleep 10

While GetKeyState("``", "p")
 {
notFound := 0
result := OCR.FromWindow("A", {scale:2, X:900, Y: 1000, W: 450, H: 140})
    try found := result.FindString("Einhar")
    catch {
        ;MsgBox 'Phrase "' "Einhar" '" not found!'
		;Exit
		notFound := 1
    }
    ; MouseMove is set to CoordMode Window, so no coordinate conversion necessary
    if notFound = 0{
	SoundSetVolume 25
		SoundPlay "Einhar.mp3"
		;MouseMove found.x, found.y
		found.Highlight()
		;
		}
		sleep 30
}

; Send "test"
; Sleep 10
 }
Return
;



