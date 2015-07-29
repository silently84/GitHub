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
;~ This dummy is used in btnStart and btnStop to disable/enable all labels, text, buttons etc. on all tabs.
;~ -------------------------------------------------------------
Global $LastControlToHide = GUICtrlCreateDummy()
Global $iPrevState[$LastControlToHide + 1]
;~ -------------------------------------------------------------

;~ -------------------------------------------------------------
;~ Stats Tab
;~ -------------------------------------------------------------
$tabStats = GUICtrlCreateTabItem("약탈현황")
Local $x = 30, $y = 150
	$grpResourceOnStart = GUICtrlCreateGroup("초기현황", $x - 20, $y - 20, 110, 105)
		$lblResultStatsTemp = GUICtrlCreateLabel("첫 실행시" & @CRLF & "마을정보를" & @CRLF & "입력합니다.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblResultGoldStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "봇 실행시 보유한 '골드'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblResultElixirStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "봇 실행시 보유한 '엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picResultDEStart = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblResultDEStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "봇 실행시 보유한 '다크엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblResultTrophyStart = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "봇 실행시 보유한 '트로피'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 145
	$y = 150
	$grpLastAttack = GUICtrlCreateGroup("최근약탈현황", $x - 20, $y - 20, 110, 105)
		$lblLastAttackTemp = GUICtrlCreateLabel("매 공격마다" & @CRLF & "약탈현황을" & @CRLF & "최신화하여" & @CRLF & "입력합니다.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblGoldLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "마지막 공격에서 획득한 '골드'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblElixirLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "마지막 공격에서 획득한 '엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLastAttack = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblDarkLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "마지막 공격에서 획득한 '다크엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblTrophyLastAttack = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "마지막 공격에서 획득한 '트로피'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$x = 260
	$y = 150
	$grpTotalLoot = GUICtrlCreateGroup("총약탈현황", $x - 20, $y - 20, 110, 105)
		$lblTotalLootTemp = GUICtrlCreateLabel("매 공격마다" & @CRLF & "약탈현황을" & @CRLF & "최신화하여" & @CRLF & "입력합니다.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
		$lblGoldLoot =  GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "지금까지 획득한 총 '골드'양" & @CRLF & "(업그레이드에 소모된 자원도 포함되어 나타납니다.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblElixirLoot =  GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "지금까지 획득한 총 '엘릭서'양" & @CRLF & "(업그레이드에 소모된 자원도 포함되어 나타납니다.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLoot = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblDarkLoot =  GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "지금까지 획득한 총 '다크엘릭서'양" & @CRLF & "(업그레이드에 소모된 자원도 포함되어 나타납니다.)"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblTrophyLoot = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "지금까지 획득한 총 '트로피'"
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$x = 375
	$y = 150
	$grpHourlyStats = GUICtrlCreateGroup("통계(/h)", $x - 20, $y - 20, 105, 105)
		$lblHourlyStatsTemp = GUICtrlCreateLabel("매 공격마다" & @CRLF & "약탈현황을" & @CRLF & "최신화하여" & @CRLF & "입력합니다.", $x - 5, $y + 5, 100, 65, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 60, $y, 16, 16)
			$lblHourlyStatsGold = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "시간당 약탈한 '골드'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 60, $y, 16, 16)
		$lblHourlyStatsElixir = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "시간당 약탈한 '엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picHourlyStatsDark = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 60, $y, 16, 16)
		$lblHourlyStatsDark = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "시간당 약탈한 '다크엘릭서'양"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 60, $y, 16, 16)
		$lblHourlyStatsTrophy = GUICtrlCreateLabel("", $x, $y + 2, 55, 17, $SS_RIGHT)
			$txtTip = "시간당 획득한 '트로피'"
			GUICtrlSetTip(-1, $txtTip)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 340
	$y = 240
#cs $btnMoreStats = GUICtrlCreateButton ("추가현황", $x, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
	$x += 60
	$btnExportCSV = GUICtrlCreateButton (".CSV보고", $x, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
#ce
	$btnLoots = GUICtrlCreateButton ("Loots", $x, $y, 60,21)
    GUICtrlSetOnEvent(-1, "btnLoots")
	$x += 60
    $btnLogs = GUICtrlCreateButton ("Logs", $x, $y, 60,21)
        GUICtrlSetOnEvent(-1, "btnLogs")

	$x = 30
	$y = 280
	$grpStatsMisc = GUICtrlCreateGroup("기타현황", $x - 20, $y - 20, 450, 60)
		$y -=2
		GUICtrlCreateIcon ($pIconLib, $eIcnTH1, $x - 10, $y + 7, 24, 24)
		GUICtrlCreateIcon ($pIconLib, $eIcnTH10, $x + 16, $y + 7, 24, 24)
        $lblvillagesattacked = GUICtrlCreateLabel("공격 :", $x + 45, $y + 2, -1, 17)
        $lblresultvillagesattacked = GUICtrlCreateLabel("0", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "공격한 마을의 수"
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
        $lblvillagesskipped = GUICtrlCreateLabel("스킵 :", $x + 45, $y + 2, -1, 17)
        $lblresultvillagesskipped = GUICtrlCreateLabel("0", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "공격하지 않고 스킵한 마을의 수"
			GUICtrlSetTip(-1, $txtTip)
		$x = 175
		$y = 278
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x, $y, 16, 16)
        $lbltrophiesdropped = GUICtrlCreateLabel("트로피작업 :", $x + 20, $y + 2, -1, 17)
        $lblresulttrophiesdropped = GUICtrlCreateLabel("0", $x + 95, $y + 2, 30, 17, $SS_RIGHT)
			$txtTip = "'트로피범위설정'(기타설정탭)으로 인한 트로피 작업 횟수."
			GUICtrlSetTip(-1, $txtTip)
        $y += 17
        GUICtrlCreateIcon ($pIconLib, $eIcnHourGlass, $x, $y, 16, 16)
        $lblruntime = GUICtrlCreateLabel("실행시간 : ", $x + 20, $y + 2, -1, 17)
        $lblresultruntime = GUICtrlCreateLabel("00:00:00", $x + 65, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "프로그램 구동 시간"
			GUICtrlSetTip(-1, $txtTip)
		$x = 330
		$y = 278
		GUICtrlCreateIcon ($pIconLib, $eIcnWall, $x - 7, $y + 7, 24, 24)
        $lblwallbygold = GUICtrlCreateLabel("'골드'사용 :", $x + 20, $y + 2, -1, 17)
		$lblWallgoldmake =  GUICtrlCreateLabel("0", $x + 55, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "'골드'를 사용하여 업그레이드한 성벽의 수"
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$lblwallbyelixir = GUICtrlCreateLabel("'엘릭서'사용 :", $x + 20, $y + 2, -1, 17)
		$lblWallelixirmake =  GUICtrlCreateLabel("0", $x + 55, $y + 2, 60, 17, $SS_RIGHT)
			$txtTip = "'엘릭서'를 사용하여 업그레이드한 성벽의 수"
			GUICtrlSetTip(-1, $txtTip)
        ;$lbloutofsync = GUICtrlCreateLabel("Out Of Sync :", 260, 263, 100, 17) ; another stats next post
        ;$lblresultoutofsync = GUICtrlCreateLabel("0", 380, 263, 60, 17, $SS_RIGHT) ; another stats next post
	GUICtrlCreateGroup("", -99, -99, 1, 1)
