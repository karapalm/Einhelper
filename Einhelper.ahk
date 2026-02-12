#Requires AutoHotkey v2.0
#SingleInstance Force

; ---- CONFIG ----
imageFile := A_ScriptDir "\ein2.png"
soundFile := A_ScriptDir "\Einhar.mp3"
searchDelay := 100       ; ms between searches
soundCooldown := 2000    ; ms between sound plays
; ----------------

lastSoundTime := 0

`::
{
    global lastSoundTime

    while GetKeyState("``", "P")
    {
        ; Full screen search
        found := ImageSearch(&x, &y
            , 0, 0
            , A_ScreenWidth, A_ScreenHeight
            , "*25 " imageFile
        )

        if found
        {
            now := A_TickCount
            if (now - lastSoundTime > soundCooldown)
            {
                SoundPlay soundFile
                lastSoundTime := now
            }
        }

        Sleep searchDelay
    }
}
