; #FUNCTION# ====================================================================================================================
; Name ..........: ReplayShare
; Description ...: This function will publish replay if mimimun loot reach
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Sardo (2015-06)
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


Func ReplayShare($last = 1)

	; remark: In sharing message "<n>" was replaced by numbers of searches
	;         Use this option  with caution or risk being reported

	Local $txtMessage, $tNew
	If $last = 1 Then
		;--  open page of attacks -------------------------------------------------------------
		ClickP($aTopLeftClient,1,0,"#0235") ;Click Away
		If _Sleep(500) Then Return ;
		SetLog("Share Replay: Opening Messages Page...", $COLOR_BLUE)
		ClickP($aMessageButton, 1, 0, "#0236") ;Click Messages Button
		If _Sleep(1000) Then Return
		Click(380, 94,1,0,"#0237") ; Click Attack Log Tab
		If _Sleep(1000) Then Return

		; publish last replay ----------------------------------------------------------------
		_CaptureRegion()

		; check if exist replay queue ----------------------------------------------------
		Local $FileListQueueName = _FileListToArray($dirTemp, "Village*.png", 1); list files to an array.

		If _ColorCheck(_GetPixelColor(500, 156), Hex(0x78D4E8, 6), 6) = True And Not (IsArray($FileListQueueName)) Then
			;button replay blue
			Setlog("Ok, sharing!")
			Click(500, 156,1,0,"#0238") ; Click Share Button
			If _Sleep(250) Then Return
			Click(300, 120,1,0,"#0239") ;Select text for write comment
			If _Sleep(250) Then Return

			;compose message txt
			Local $smessage = $sShareMessage
			$smessage = StringReplace($smessage, @LF, "")
			$smessage = StringReplace($smessage, @CR, "|")
			While StringInStr($smessage, "||")
				$smessage = StringReplace($smessage, "||", "|")
			WEnd
			Local $smessagearray = StringSplit($smessage, "|")
			If @error Then
				$txtMessage = $smessagearray[1]
			Else
				$txtMessage = $smessagearray[Random(1, $smessagearray[0], 1)]
			EndIf
			$txtMessage = StringReplace($txtMessage, "<n>", StringFormat("%s", $SearchCount))

			ControlSend($Title, "", "", $txtMessage, 0)
			If _Sleep(250) Then Return
			Click(530, 210,1,0,"#0240") ;Click Send Button
			$tNew = _Date_Time_GetLocalTime()
			$dLastShareDate = _Date_Time_SystemTimeToDateTimeStr($tNew, 1)
		Else
			If _ColorCheck(_GetPixelColor(500, 156), Hex(0xbbbbbb, 6), 6) = True Or IsArray($FileListQueueName) Then
				;button replay gray.. insert village in queue
				If IsArray($FileListQueueName) Then
					SetLog("Others replay in queue, Share Later Last Replay")
				Else
					Setlog("Cannot Share Now... retry later.")
				EndIf
				_CaptureRegion(87, 149, 87 + 100, 149 + 20)
				Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
				Local $Time = @HOUR & "." & @MIN
				Local $iSaveFile = _GDIPlus_ImageSaveToFile($hBitmap, $dirTemp & "Village_" & $Date & "_" & $Time & "^" & StringFormat("%s", $SearchCount) & ".png")
				If Not ($iSaveFile) Then SetLog("An error occurred putting screenshot in queue", $COLOR_RED)
				Click(763, 86,1,0,"#0241") ; Close  page
				If _Sleep(500) Then Return ;
			Else
				;button not found, abort
				Setlog("Cannot Share Now... retry later.", $COLOR_RED)
			EndIf
		EndIf
		$iShareAttackNow = 0 ;reset variable

	Else
		$tNew = _Date_Time_GetLocalTime()
		If _DateDiff("n", $dLastShareDate, _Date_Time_SystemTimeToDateTimeStr($tNew, 1)) > 30 Then ; latest replay share >30 minutes
			; check if exist replay to publish ----------------------------------------------------
			Local $FileListName = _FileListToArray($dirTemp, "Village*.png", 1); list files to an array.
			Local $x, $t, $tmin = 0
			If Not ((Not IsArray($FileListName)) Or (@error = 1)) Then

				; get oldest filename -----------------------------------------------------------------
				Local $FileListDate
				For $x = 1 To $FileListName[0] ;array position 0 number of files found
					$t = FileGetTime($dirTemp & $FileListName[$x], 1, 1)
					If $tmin = 0 Then
						$tmin = $t
						$FileListDate = $x
					Else
						If $t < $tmin Then
							$t = $tmin
							$FileListDate = $x
						EndIf
					EndIf
					;SetLog("Debug " & $FileListname[$x] & " t:" & $t & "tmin:  " & $tmin & " x:" & $x )
				Next
				; oldest filename: $FileListName[$FileListDate]
				;SetLog("Debug oldest filename: " & $FileListName[$FileListDate] )

				;--  open page of attacks -------------------------------------------------------------
				ClickP($aTopLeftClient,1,0,"#0242") ;Click Away
				If _Sleep(500) Then Return ;
				SetLog("Share Replay: Opening Messages Page...", $COLOR_BLUE)
				ClickP($aMessageButton, 1, 0, "#0243") ; Click Messages Button

				If _Sleep(1000) Then Return
				Click(380, 94,1,0,"#0244") ; Click Attack Log Tab
				If _Sleep(1000) Then Return

				_CaptureRegion()
				If _ColorCheck(_GetPixelColor(500, 156), Hex(0x78D4E8, 6), 6) = True Then
					;button replay blue
					Setlog("Ok, sharing!")
					Local $VilLoc, $VilX, $VilY, $VilTol
					For $VilTol = 0 To 20
						If $VilLoc = 0 Then
							$VilLoc = _ImageSearch($dirTemp & $FileListName[$FileListDate], 1, $VilX, $VilY, $VilTol) ;
							;SetLog( "Debug: Searching " & $FileListName[$FileListDate] & " tollerance" & $VilTol   & " - Found=" & $VilLoc)
							If $VilLoc = 1 And $VilX > 35 And $VilY < 610 Then
								;SetLog("Debug: Found!, position: (" & $VilX & "," & $VilY &")", $COLOR_GREEN)
								Click(500, $VilY,1,0,"#0245") ;Click Share Button
								If _Sleep(250) Then Return
								Click(300, 120,1,0,"#0246") ;Select text for write comment
								If _Sleep(250) Then Return
								; read searchcount
								Local $a = StringInStr($FileListName[$FileListDate], "^")
								Local $b = StringInStr($FileListName[$FileListDate], ".png")
								Local $stry = "0"
								If $a > 0 And $b > 0 Then $stry = StringMid($FileListName[$FileListDate], $a + 1, $b - $a - 1)
								$SearchCount = $stry

								;compose message txt
								Local $smessage = $sShareMessage
								$smessage = StringReplace($smessage, @LF, "")
								$smessage = StringReplace($smessage, @CR, "|")
								While StringInStr($smessage, "||")
									$smessage = StringReplace($smessage, "||", "|")
								WEnd
								Local $smessagearray = StringSplit($smessage, "|")
								If @error Then
									$txtMessage = $smessagearray[1]
								Else
									$txtMessage = $smessagearray[Random(1, $smessagearray[0], 1)]
								EndIf
								$txtMessage = StringReplace($txtMessage, "<n>", StringFormat("%s", $SearchCount))

								ControlSend($Title, "", "", $txtMessage, 0)
								If _Sleep(250) Then Return
								Click(500, 210,1,0,"#0247") ;Click Send Button
								$tNew = _Date_Time_GetLocalTime()
								$dLastShareDate = _Date_Time_SystemTimeToDateTimeStr($tNew, 1)

								;only for test copy..
								Local $iCopy = FileCopy($dirTemp & $FileListName[$FileListDate], $dirTemp & "shared_" & $FileListName[$FileListDate])
								If Not ($iCopy) Then Setlog("An error occurred copying a temporary file", $COLOR_RED)
								;delete
								Local $iDelete = FileDelete($dirTemp & $FileListName[$FileListDate])
								If Not ($iDelete) Then Setlog("An error occurred deleting a temporary file", $COLOR_RED)
								If _Sleep(2000) Then Return
								Return True
							EndIf
						EndIf
					Next
					If $VilLoc = 0 Then
						;delete file not found
						;only for test copy..
						Local $iCopy = FileCopy($dirTemp & $FileListName[$FileListDate], $dirTemp & "discard_" & $FileListName[$FileListDate])
						If Not ($iCopy) Then Setlog("An error occurred copying a temporary file", $COLOR_RED)
						;delete
						Local $iDelete = FileDelete($dirTemp & $FileListName[$FileListDate])
						If Not ($iDelete) Then Setlog("An error occurred deleting a temporary file", $COLOR_RED)
					EndIf

				Else
					If _ColorCheck(_GetPixelColor(500, 156), Hex(0xbbbbbb, 6), 6) = True Then
						;button replay gray.. insert village in queue
						Setlog("Cannot Share Now... retry later.")
						Click(763, 86,1,0,"#0248") ; Close  page
						$tNew = _Date_Time_GetLocalTime()
						$dLastShareDate = _DateAdd("n", -20, _Date_Time_SystemTimeToDateTimeStr($tNew, 1))
						If _Sleep(500) Then Return ;
					Else
						;button not found, abort
						Setlog("Button Share not found, abort.", $COLOR_RED)
						Click(763, 86,1,0,"#0249") ; Close  page
						If _Sleep(500) Then Return ;
					EndIf
				EndIf

				Return True
			EndIf
		EndIf ; >30 min
	EndIf ;last=1
	If _Sleep(500) Then Return

EndFunc   ;==>ReplayShare



