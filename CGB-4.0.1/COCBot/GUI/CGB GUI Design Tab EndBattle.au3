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
;~ End Battle
;~ -------------------------------------------------------------
$tabEndBattle = GUICtrlCreateTabItem("전투종료")
   Local $x = 30, $y = 150
	$grpBattleOptions = GUICtrlCreateGroup("전투종료", $x - 20, $y - 20, 450, 170)
		$chkTimeStopAtk = GUICtrlCreateCheckbox("약탈할 자원이 감소되지 않을때 :",$x, $y, -1, -1)
			$txtTip = "설정된 시간동안 약탈할 자원이 더이상 감소되지 않을때 전투를 종료합니다." & @CRLF & "모든 유닛이 투입되고나서 카운트를 시작하고, 변화가 감지되면 다시 카운트 합니다. "
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTimeStopAtk")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$txtTimeStopAtk = GUICtrlCreateInput("20", $x + 197, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			;GUICtrlSetData(-1, 10) ; default value
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblTimeStopAtk = GUICtrlCreateLabel("초 후 종료", $x + 230, $y + 3, -1, -1)
   $y += 25
		$chkTimeStopAtk2 = GUICtrlCreateCheckbox("약탈할 자원이 설정값 이하일때 :",$x, $y, -1, -1)
			$txtTip = "설정된 시간동안 약탈할 자원이 더이상 감소되지 않을때 전투를 종료합니다." & @CRLF & "모든 유닛이 투입되고나서 카운트를 시작하고, 변화가 감지되면 다시 카운트 합니다. "
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTimeStopAtk2")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
		$txtTimeStopAtk2 = GUICtrlCreateInput("5", $x + 197, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblTimeStopAtk2 = GUICtrlCreateLabel("초 후 종료", $x + 230, $y + 3, -1, -1)
	$y += 23
		$lblMinRerourcesAtk2 = GUICtrlCreateLabel("약탈가능자원 :", $x + 40 , $y + 4, -1, -1)
		$lblMinGoldStopAtk2 = GUICtrlCreateLabel("", $x + 150 , $y + 2, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinGoldStopAtk2 = GUICtrlCreateInput("2000", $x + 130, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'골드'가 이 이하일때 설정된 시간 이후 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinGoldStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 182, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)

		$lblMinElixirStopAtk2 = GUICtrlCreateLabel(", ", $x + 205, $y + 2, -1, -1)
			$txtTip = "'엘릭서'가 이 이하일때 설정된 시간 이후 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinElixirStopAtk2 = GUICtrlCreateInput("2000", $x + 215, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinElixirStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 267, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)

		$lblMinDarkElixirStopAtk2 = GUICtrlCreateLabel("그리고", $x +290 , $y +4, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtMinDarkElixirStopAtk2 = GUICtrlCreateInput("50", $x + 330, $y , 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'다크엘릭서'가 이 이하일때 설정된 시간 이후 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picMinDarkElixirStopAtk2 = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 372, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	$y += 20
		$chkEndNoResources = GUICtrlCreateCheckbox("약탈할 자원이 없음", $x , $y , -1, -1)
			$txtTip = "약탈 가능한 자원을 모두 획득하여 더이상 약탈할 자원이 없을때 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
	$y += 30
		$chkEndOneStar = GUICtrlCreateCheckbox("별 하나를 얻었을때 :", $x, $y , -1, -1)
			$txtTip = "전투에서 '별' 하나를 얻어 승리가 확실해 지면 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
		$picEndOneStar = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 135, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	$y += 20
		$chkEndTwoStars = GUICtrlCreateCheckbox("별 두개를 얻었을때 :", $x, $y, -1, -1)
			$txtTip = "전투에서 '별' 두개를 얻게되면 전투를 종료합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
		$picEndTwoStar = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 135, $y, 16, 16)
		$picEndTwoStar2 = GUICtrlCreateIcon($pIconLib, $eIcnSilverStar, $x + 152, $y, 16, 16)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 325
	$grpLootSnapshot = GUICtrlCreateGroup("약탈현황저장", $x - 20, $y - 20, 450, 50)
		$chkTakeLootSS = GUICtrlCreateCheckbox("약탈현황저장", $x, $y, -1, -1)
			GUICtrlSetTip(-1, "약탈현황을 캡춰하여 저장합니다.")
			GUICtrlSetState(-1, $GUI_CHECKED)
		$chkScreenshotLootInfo = GUICtrlCreateCheckbox("약탈정보추가", $x + 200 , $y , -1, -1)
			GUICtrlSetTip(-1, "파일명에 약탈정보를 추가합니다.")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 380
	$grpResources = GUICtrlCreateGroup("전투영상공유", $x - 20, $y - 20, 450, 145)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkShareAttack = GUICtrlCreateCheckbox("영상 공유 사용", $x, $y, -1, -1)
			$TxtTip = "클랜채팅창을 통하여 전투 영상을 공유합니다."
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetOnEvent(-1, "chkShareAttack")
		$x = 120
		$y += 30
		$lblShareMinGold = GUICtrlCreateLabel("약탈한 자원 : ", $x - 80 , $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinGold = GUICtrlCreateInput("300000", $x + 5 , $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "획득한 '골드'양이 이 이상일 때 영상을 공유합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 67, $y, 16, 16)
		$y += 22
		$lblShareMinElixir = GUICtrlCreateLabel("", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinElixir = GUICtrlCreateInput("300000", $x + 5, $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "획득한 '엘릭서'양이 이 이상일 때 영상을 공유합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 67, $y, 16, 16)
		$y += 22
		$lblShareMinDark = GUICtrlCreateLabel("", $x, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$txtShareMinDark = GUICtrlCreateInput("0", $x + 5, $y - 2, 60, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "획득한 '다크엘릭서'양이 이 이상일 때 영상을 공유합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picShareLootDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 67, $y, 16, 16)
	Local $x = 240, $y = 380
		$lblShareMessage = GUICtrlCreateLabel("랜덤 메세지 전송 :", $x , $y -2 , -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
	    $y += 27
		$txtShareMessage = GUICtrlCreateEdit("", $x, $y - 10 , 205, 80, BitOR($ES_WANTRETURN, $ES_CENTER, $ES_AUTOVSCROLL))
			GUICtrlSetData(-1, StringFormat("Nice\r\nGood\r\nThanks\r\nWowwww"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetTip(-1, "영상을 공유할때 이 메세지를 사용하여 전송합니다.")
	    $y += 73
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
