; =====================================================================
; Smooth Red Active Window Border - No flicker, top moved slightly higher
; =====================================================================

#NoEnv
#SingleInstance, Force
SetBatchLines, -1
SetTitleMatchMode, 2

borderColor := 0xFF0000  ; pure red
borderPX := 2             ; thickness of border
offsetPX := -7             ; extra outward expansion to cover window shadow
topOffset := 4              ; move top border up by this many pixels
pollMS := 120

; Create border GUIs once (no destroy/recreate flicker)
CreateBorderGui("BorderTop")
CreateBorderGui("BorderLeft")
CreateBorderGui("BorderRight")
CreateBorderGui("BorderBottom")

SetTimer, TrackActiveWindow, %pollMS%
OnExit, Cleanup
return

TrackActiveWindow:
    WinGet, active_id, ID, A
    if (!active_id) {
        HideBorders()
        return
    }

    WinGetClass, cls, ahk_id %active_id%
    if (cls = "AutoHotkeyGUI")
        return

    WinGet, minmax, MinMax, ahk_id %active_id%
    if (minmax = 1) {
        HideBorders()
        return
    }

    WinGetPos, X, Y, W, H, ahk_id %active_id%
    if (W <= 0 or H <= 0) {
        HideBorders()
        return
    }

    ; Expand border outward to hide shadow gap
    X := X - offsetPX
    Y := Y - offsetPX
    W := W + (offsetPX * 2)
    H := H + (offsetPX * 2)

    bx := borderPX

; Move existing GUIs to new position
Gui, BorderTop:Show,    % "x" X " y" (Y - topOffset) " w" W " h" bx " NA"
Gui, BorderLeft:Show,   % "x" X " y" (Y - topOffset) " w" bx " h" (H + topOffset) " NA"
Gui, BorderRight:Show,  % "x" (X+W-bx) " y" (Y - topOffset) " w" bx " h" (H + topOffset) " NA"
Gui, BorderBottom:Show, % "x" X " y" (Y+H-bx) " w" W " h" bx " NA"

return

CreateBorderGui(name) {
    global borderColor
    Gui, %name%:Destroy
    Gui, %name%:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, %name%:Color, %borderColor%
    Gui, %name%:Show, Hide, %name%
}

HideBorders() {
    Gui, BorderTop:Hide
    Gui, BorderLeft:Hide
    Gui, BorderRight:Hide
    Gui, BorderBottom:Hide
}

Cleanup:
    Gui, BorderTop:Destroy
    Gui, BorderLeft:Destroy
    Gui, BorderRight:Destroy
    Gui, BorderBottom:Destroy
    ExitApp
