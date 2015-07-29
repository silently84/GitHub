; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Notify Tab
;~ -------------------------------------------------------------
$tabNotify = GUICtrlCreateTabItem("알림설정")
	Local $x = 30, $y = 150
	$grpPushBullet = GUICtrlCreateGroup("PushBullet 알림", $x - 20, $y - 20, 450, 375)
	$picPushBullet = GUICtrlCreateIcon ($pIconLib, $eIcnPushBullet, $x, $y, 32, 32)
	$chkPBenabled = GUICtrlCreateCheckbox("사용함", $x + 40, $y)
		GUICtrlSetOnEvent(-1, "chkPBenabled")
		GUICtrlSetTip(-1, "PushBullet 공지알림을 사용합니다.")
	$y += 22
	$chkPBRemote = GUICtrlCreateCheckbox("원격조종", $x + 40, $y)
		GUICtrlSetTip(-1, "Enables PushBullet Remote function")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y = 150
	$chkDeleteAllPushes = GUICtrlCreateCheckbox("시작시 메세지삭제", $x + 160, $y)
		GUICtrlSetTip(-1, "프로그램 실행시 전에 받았던 공지 알림을 모두 삭제합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$btnDeletePBmessages = GUICtrlCreateButton("지금 삭제", $x + 300, $y, 100, 20)
		GUICtrlSetTip(-1, "Pushbullet을 통하여 받은 모든 메세지를 지금 삭제합니다.")
		GUICtrlSetOnEvent(-1, "btnDeletePBMessages")
		IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 22
	$chkDeleteOldPushes = GUICtrlCreateCheckbox("오래된 메세지삭제", $x + 160, $y)
		GUICtrlSetTip(-1, "일정시간 이전에 받은 메세지를 모두 삭제합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetOnEvent(-1, "chkDeleteOldPushes")
	$cmbHoursPushBullet = GUICtrlCreateCombo("", $x + 300, $y, 100, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		GUICtrlSetTip(-1, "시간이 지난 메세지를 삭제합니다.")
		GUICtrlSetData(-1, "1 Hour|2 Hours|3 Hours|4 Hours|5 Hours|6 Hours|7 Hours|8 Hours|9 Hours|10 Hours|11 Hours|12 Hours|13 Hours|14 Hours|15 Hours|16 Hours|17 Hours|18 Hours|19 Hours|20 Hours|21 Hours|22 Hours|23 Hours|24 Hours", "-")
		GUICtrlSetState (-1, $GUI_DISABLE)
	$y += 30
	$lblPushBTokenValue = GUICtrlCreateLabel("Access Token:", $x, $y, -1, -1, $SS_RIGHT)
	$PushBTokenValue = GUICtrlCreateInput("", $x + 120, $y - 3, 280, 19)
		GUICtrlSetTip(-1, "'PushBullet.com'로그인후 Setting>Account 페이지에 있는 토큰을 입력하세요.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 25
	$lblOrigPush = GUICtrlCreateLabel("마을이름 :", $x, $y, -1, -1, $SS_RIGHT)
		$txtTip = "마을 이름을 설정하세요 - '기타설정'탭의 '프로필' 항목에서 할 수 있습니다."
		GUICtrlSetTip(-1, $txtTip)
	$OrigPushB = GUICtrlCreateLabel("", $x + 120, $y - 1, 280, 20, $SS_SUNKEN)
		GUICtrlSetBkColor(-1, 0xF0F0F0)
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 25
	$lblNotifyWhen = GUICtrlCreateLabel("전송할 PushBullet알림 :", $x, $y, -1, -1, $SS_RIGHT)
	$y += 15
	$chkAlertPBVMFound = GUICtrlCreateCheckbox("검색성공", $x + 10, $y)
		GUICtrlSetTip(-1, "공격할 마을을 발견하면 약탈가능정보와 함께 메세지를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastRaid = GUICtrlCreateCheckbox("약탈현황(사진)", $x + 100, $y)
		GUICtrlSetTip(-1, "약탈현황을 저장하여 사진과 함께 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastRaidTxt = GUICtrlCreateCheckbox("약탈현황(문자)", $x + 210, $y, -1, -1)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetTip(-1, "약탈현황을 글로 나타내 전송합니다.")
	$chkAlertPBCampFull = GUICtrlCreateCheckbox("집합소가득", $x + 315, $y, -1, -1)
		GUICtrlSetTip(-1, "집합소가 가득 찼을 때 메세지를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 20
	$chkAlertPBWallUpgrade = GUICtrlCreateCheckbox("성벽렙업", $x + 10, $y, -1, -1)
		 GUICtrlSetTip(-1, "성벽을 업그레이드 했을 경우 메세지를 전송합니다.")
		 GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBOOS = GUICtrlCreateCheckbox("동기화에러", $x + 100, $y, -1, -1)
		GUICtrlSetTip(-1, "서버와 동기화 오류를 발견했을 경우 메세지를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBVBreak = GUICtrlCreateCheckbox("휴식", $x + 210, $y, -1, -1)
		GUICtrlSetTip(-1, "오랜시간 접속을 유지하여 휴식을 하게 되면 메세지를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 20
	$chkAlertPBVillage = GUICtrlCreateCheckbox("마을정보", $x + 10, $y, -1, -1)
		GUICtrlSetTip(-1, "마을정보를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBLastAttack = GUICtrlCreateCheckbox("최근약탈정보", $x + 100, $y, -1, -1)
		GUICtrlSetTip(-1, "최근약탈현황을 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$chkAlertPBOtherDevice = GUICtrlCreateCheckbox("다른기기접속", $x + 210, $y, -1, -1)
		GUICtrlSetTip(-1, "다른 기기에서 접속했을 경우 메세지를 전송합니다.")
		GUICtrlSetState(-1, $GUI_DISABLE)
	$y = 350
	$lblgrppushbullet = GUICtrlCreateGroup("'PushBullet' 원격조종 옵션", $x - 10, $y - 20, 430, 170)
		$lblPBtext = "BOT HELP - 현재 이 도움말을 보냅니다." & @CRLF & "" & @CRLF & "BOT DELETE  - 전에 받은 모든 메세지를 삭제합니다." & @CRLF & "" & @CRLF & _
			"BOT <마을이름> RESTART" & @CRLF & "  <마을이름>을 사용중인 'Bot'과 블루스택을 재시작합니다." & @CRLF & "" & @CRLF & "BOT <마을이름> STOP" & @CRLF & "  <마을이름>을 사용중인 'Bot'을 작업종료합니다." & @CRLF & "" & @CRLF & _
			"BOT <마을이름> PAUSE" & @CRLF & "  <마을이름>을 사용중인 'Bot'을 정지시킵니다." & @CRLF & "" & @CRLF & "BOT <마을이름> RESUME" & @CRLF & "  <마을이름>을 사용중인 'Bot'을 재개합니다." & @CRLF & "" & @CRLF & _
			"BOT <마을이름> STATS" & @CRLF & "  <마을이름>의 마을정보를 전송합니다." & @CRLF & "" & @CRLF & "BOT <마을이름> LOG" & @CRLF & "  <마을이름>을 사용중인 'Bot'의 최근 로그를 전송합니다." & @CRLF & "" & @CRLF & _
			"BOT <마을이름> LASTRAID" & @CRLF & "  <마을이름>을 사용중인 'Bot'의 최근약탈사진을 전송합니다." & @CRLF & "" & @CRLF & "BOT <마을이름> LASTRAIDTXT" & @CRLF & "   <마을이름>을 사용중인 'Bot'의 최근약탈현황을 전송합니다." & @CRLF & "" & @CRLF & _
			"BOT <마을이름> SCREENSHOT" & @CRLF & "  <마을이름>의 현재 마을을 사진으로 저장하여 전송합니다."
		$lblPBdesc = GUICtrlCreateEdit( $lblPBtext, $x, $y,410, 140, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL))
			GUICtrlSetFont(-1,8.5)
			GUICtrlSetBkColor ( -1, $COLOR_WHITE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
