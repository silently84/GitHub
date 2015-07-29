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
; Attack Basics Tab
;~ -------------------------------------------------------------

$tabAttack = GUICtrlCreateTabItem("공격설정")
	Local $x = 30, $y = 150
	$grpDeadBaseDeploy = GUICtrlCreateGroup("DeadBase 설정", $x - 20, $y - 20, 225, 245);95)
		$lblDBDeploy = GUICtrlCreateLabel("공격방향 :", $x - 5, $y + 5, -1, -1)
		$cmbDBDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "한 방향으로 공격 : 마을 안쪽까지 뚫을 수 있습니다." & @CRLF & "두 방향으로 공격 :  마을 안쪽까지 뚫을 수 있습니다." & @CRLF & _
			"세 방향으로 공격 : 외곽 건물을 공격하고 일부는 마을 안쪽을 향합니다." & @CRLF & _
			"모든 방향으로 공격 : 대부분의 외곽 건물을 무너뜨릴 수 있습니다." & @CRLF & _
			"네손가락모드 : 모든방향으로 선택한 유닛을 한번에 투입합니다.", "공격할 방향을 선택하세요.")
			GUICtrlSetData(-1, "한 방향|두 방향|세 방향|모든 방향|네손가락모드", "모든 방향")
		$y += 25
		$lblDBSelectTroop = GUICtrlCreateLabel("사용유닛 :",$x - 5, $y + 5, -1 , -1)
		$cmbDBSelectTroop = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "전부사용|훈련소유닛만|바바리안만|아처만|바바,아처|바바,고블린|아처,고블린|바바,아처,자이|바바,아처,고블,자이|바바,아처,호그|바바,아처,미니언", "전부사용")
		$y += 25
		$lblDBUnitDelay = GUICtrlCreateLabel("Delay(Unit/Wave):", $x - 5, $y + 5, -1, -1)
			$txtTip = "투입하는 유닛사이의 간격을 설정합니다." & @CRLF & "1 (빠름) = 기계처럼 보임, 10 (느림) = 사람처럼 보임" & @CRLF & "Random : 보다 사람처럼 보일 수 있도록 스스로 조절합니다."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBUnitDelay = GUICtrlCreateCombo("", $x + 105, $y, 36, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		;$lblDBWaveDelay = GUICtrlCreateLabel("회차 :", $x + 100, $y + 5, -1, -1)
		;	GUICtrlSetTip(-1, $txtTip)
		$cmbDBWaveDelay = GUICtrlCreateCombo("", $x + 145, $y, 36, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		$y += 22
		$chkDBRandomSpeedAtk = GUICtrlCreateCheckbox("Random", $x - 5, $y, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDBRandomSpeedAtk")
	$y = 245
		$chkDBSmartAttackRedArea = GUICtrlCreateCheckbox("Smart Attack", $x - 5, $y, -1, -1)
			$txtTip = "이 기능을 사용하면 공격시 외곽의 빨간선을 찾아 그 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkDBSmartAttackRedArea")
		$y += 22
		$lblDBSmartDeploy = GUICtrlCreateLabel("투입유형 :", $x, $y + 5, -1, -1)
			$txtTip = "유닛을 투입하기 위한 방법을 선택하세요." & @CRLF & _
				"Type 1: 한가지 유닛을 설정된 공격방향으로 투입하고, 다른 유닛으로 교체합니다. " & @CRLF & _
				"Type 2: 여러 유닛을 하나의 방향에 투입하고, 다른 방향으로 변경합니다."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBSmartDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "유닛교체공격|방향변경공격", "유닛교체공격")
			GUICtrlSetTip(-1, $txtTip)
		$y += 26
		$chkDbAttackNearGoldMine = GUICtrlCreateCheckbox("Mine", $x + 20, $y, 17, 17)
			$txtTip = "금광 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearGoldMine = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$x += 75
		$chkDBAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "엘릭서 정제소 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearElixirCollector = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
 		$x += 55
  		$chkDBAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "다크엘릭서 정제소 근처로 유닛을 투입합니다."
 			GUICtrlSetTip(-1, $txtTip)
		$picDBAttackNearDarkElixirDrill = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 20 , $y - 3, 24, 24)
 			GUICtrlSetTip(-1, $txtTip)
	Local $x = 25, $y = 320
		GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 20, 20)
		$chkDBKingAttack = GUICtrlCreateCheckbox("킹 사용", $x + 25, $y, -1, -1)
			$txtTip = "바바리안킹을 사용합니다."
			GUICtrlSetTip(-1, $txtTip)
		$x += 100
		GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 20, 20)
		$chkDBQueenAttack = GUICtrlCreateCheckbox("퀸 사용", $x + 25, $y, -1, -1)
			$txtTip = "아처퀸을 사용합니다."
			GUICtrlSetTip(-1, $txtTip)
		$x -=100
		$y += 27
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y, 20, 20)
		$chkDBDropCC = GUICtrlCreateCheckbox("클랜성 사용", $x +  25, $y, -1, -1)
			GUICtrlSetTip(-1, "클랜성을 사용합니다.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 150
	$grpLiveBaseDeploy = GUICtrlCreateGroup("LiveBase 설정", $x - 20, $y - 20, 220, 245);95)
		$lblABDeploy = GUICtrlCreateLabel("공격방향 :", $x -5, $y + 5, -1, -1)
		$cmbABDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "한 방향으로 공격 : 마을 안쪽까지 뚫을 수 있습니다." & @CRLF & "두 방향으로 공격 :  마을 안쪽까지 뚫을 수 있습니다." & @CRLF & _
			"세 방향으로 공격 : 외곽 건물을 공격하고 일부는 마을 안쪽을 향합니다." & @CRLF & _
			"모든 방향으로 공격 : 대부분의 외곽 건물을 무너뜨릴 수 있습니다." & @CRLF & _
			"네손가락모드 : 모든방향으로 선택한 유닛을 한번에 투입합니다.", "공격할 방향을 선택하세요.")
			GUICtrlSetData(-1, "한 방향|두 방향|세 방향|모든 방향|네손가락모드", "모든 방향")
		$y += 25
		$lblABSelectTroop = GUICtrlCreateLabel("사용유닛 :",$x - 5, $y + 5, -1 , -1)
		$cmbABSelectTroop = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "전부사용|훈련소유닛만|바바리안만|아처만|바바,아처|바바,고블린|아처,고블린|바바,아처,자이|바바,아처,고블,자이|바바,아처,호그|바바,아처,미니언", "전부사용")
		$y += 25
		$lblABUnitDelay = GUICtrlCreateLabel("Delay(Unit/Wave):", $x - 5, $y + 5, -1, -1)
			$txtTip = "투입하는 유닛사이의 간격을 설정합니다." & @CRLF & "1 (빠름) = 기계처럼 보임, 10 (느림) = 사람처럼 보임" & @CRLF & "Random : 보다 사람처럼 보일 수 있도록 스스로 조절합니다."
			GUICtrlSetTip(-1, $txtTip)
		$cmbABUnitDelay = GUICtrlCreateCombo("", $x + 105, $y, 36, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		;$lblABWaveDelay = GUICtrlCreateLabel("Wave:", $x + 105, $y + 5, -1, -1)
		;	GUICtrlSetTip(-1, $txtTip)
		$cmbABWaveDelay = GUICtrlCreateCombo("", $x + 145, $y, 36, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
		$y += 22
		$chkABRandomSpeedAtk = GUICtrlCreateCheckbox("Random", $x - 5, $y, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABRandomSpeedAtk")
	$y = 245
		$chkABSmartAttackRedArea = GUICtrlCreateCheckbox("Smart Attack", $x - 5, $y, -1, -1)
			$txtTip = "이 기능을 사용하면 공격시 외곽의 빨간선을 찾아 그 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkABSmartAttackRedArea")
		$y += 22
		$lblABSmartDeploy = GUICtrlCreateLabel("투입유형 :", $x, $y + 5, -1, -1)
			$txtTip = "유닛을 투입하기 위한 방법을 선택하세요." & @CRLF & _
				"Type 1: 한가지 유닛을 설정된 공격방향으로 투입하고, 다른 유닛으로 교체합니다. " & @CRLF & _
				"Type 2: 여러 유닛을 하나의 방향에 투입하고, 다른 방향으로 변경합니다."
			GUICtrlSetTip(-1, $txtTip)
		$cmbABSmartDeploy = GUICtrlCreateCombo("", $x + 60, $y, 120, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "유닛교체공격|방향변경공격", "유닛교체공격")
			GUICtrlSetTip(-1, $txtTip)
		$y += 26
		$chkABAttackNearGoldMine = GUICtrlCreateCheckbox("", $x + 20, $y, 17, 17)
			$txtTip = "금광 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearGoldMine = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$x += 75
		$chkABAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "엘릭서 정제소 근처로 유닛을 투입합니다."
			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearElixirCollector = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
 		$x += 55
  		$chkABAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x, $y, 17, 17)
			$txtTip = "다크엘릭서 정제소 근처로 유닛을 투입합니다."
 			GUICtrlSetTip(-1, $txtTip)
		$picABAttackNearDarkElixirDrill = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 20 , $y - 3, 24, 24)
 			GUICtrlSetTip(-1, $txtTip)
	Local $x = 255, $y = 320
		GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 20, 20)
		$chkABKingAttack = GUICtrlCreateCheckbox("킹 사용", $x + 25, $y, -1, -1)
			$txtTip = "바바리안킹을 사용합니다."
			GUICtrlSetTip(-1, $txtTip)
		$x += 100
		GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 20, 20)
		$chkABQueenAttack = GUICtrlCreateCheckbox("퀸 사용", $x + 25, $y, -1, -1)
			$txtTip = "아처퀸을 사용합니다."
			GUICtrlSetTip(-1, $txtTip)
		$x -= 100
		$y += 27
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y, 20, 20)
		$chkABDropCC = GUICtrlCreateCheckbox("클랜성 사용", $x + 25, $y, -1, -1)
			GUICtrlSetTip(-1, "클랜성을 사용합니다.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 400
	$grpClanCastleBal = GUICtrlCreateGroup("클랜 지원/요청비율 유지", $x - 20, $y - 20, 450, 45)
		;GUICtrlCreateLabel("", $x - 18, $y - 7, 106, 85) ; fake label to hide group border from DB and LB setting groups
		;GUICtrlSetBkColor (-1, $COLOR_WHITE)
		;GUICtrlSetState (-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x, $y - 5, 24, 24)
		$x += 40
		$chkUseCCBalanced = GUICtrlCreateCheckbox("지원/요청비", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetTip(-1, "클랜성을 사용할때 당신의 지원/요청 비율을 확인합니다.")
			GUICtrlSetOnEvent(-1, "chkBalanceDR")
		$x += 100
		$cmbCCDonated = GUICtrlCreateCombo("",  $x - 5, $y - 3, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "지원한 비율")
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
		$lblDRRatio = GUICtrlCreateLabel("/", $x + 31, $y + 2, -1, -1)
			$txtTip = "지원/요청 비율" & @CRLF & "1/1 : 지원한 유닛수 = 지원받은 유닛수" & @CRLF & "1/2 : 지원한 유닛수 = 지원받은 유닛수의 반절"
			GUICtrlSetTip(-1, $txtTip)
		$cmbCCReceived = GUICtrlCreateCombo("", $x + 44, $y - 3, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, "지원받은 비율")
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 450
	$grpRoyalAbilities = GUICtrlCreateGroup("영웅스킬", $x - 20, $y - 20, 450, 75)
		GUICtrlCreatePic (@ScriptDir & "\Icons\KingAbility.jpg", $x, $y - 3, 30, 47)
		GUICtrlCreatePic (@ScriptDir & "\Icons\QueenAbility.jpg", $x + 30, $y - 3, 30, 47)
		$x += 75
		$radManAbilities = GUICtrlCreateRadio("설정된 시간이 지난 후에 사용합니다.", $x, $y + 3, -1, -1)
			$txtTip = "시간이 지난 후 영웅스킬을 활성화 합니다." & @CRLF & "두 영웅이 동시에 스킬을 사용하게 됩니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
		$radAutoAbilities = GUICtrlCreateRadio("영웅이 약해졌을 때 사용합니다.", $x, $y + 25, -1, -1)
		$txtTip = "영웅이 약해졌을 때 사용합니다." & @CRLF & "영웅 각각의 체력을 확인하고 스킬도 각자 다른 시기에 사용하게 됩니다."
		GUICtrlSetTip(-1, $txtTip)
		$txtManAbilities = GUICtrlCreateInput("9", $x + 240, $y + 2, 30, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "영웅스킬을 활성화시킬 시간을 입력하세요. 투입한 시점을 기준으로 계산합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblRoyalAbilitiesSec = GUICtrlCreateLabel("초", $x + 275, $y + 7, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
