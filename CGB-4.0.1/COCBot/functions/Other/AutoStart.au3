; auto start script by Sm0kE
; edited: 2015-06 sardo - parametrized $ichkAutoStartDelay
; edited: 2015-07 sardo - insert into a function
Func AutoStart()
	If $ichkAutoStart = 1 OR $restarted = 1 Then
		SetLog($ichkAutoStartDelay & " 초 후에 자동으로 시작합니다.", $COLOR_RED)
		sleep($ichkAutoStartDelay*1000)
		ControlClick($sBotTitle, "시작", "[CLASS:Button; TEXT:시작]", "left", "1")
	EndIf
EndFunc

