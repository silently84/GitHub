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
; Upgrades Tab
;~ -------------------------------------------------------------

$tabUpgrades = GUICtrlCreateTabItem("업그레이드")
Local $x = 30, $y = 150
	$Laboratory = GUICtrlCreateGroup("연구소", $x - 20, $y - 20, 450, 65)
		GUICtrlCreateIcon($pIconLib, $eIcnLaboratory, $x, $y, 32, 32)
		$chkLab = GUICtrlCreateCheckbox("자동 업그레이드", $x + 40, $y + 8, -1, -1)
			$txtTip = "연구소를 통하여 자동으로 업그레이드를 시작합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkLab")
		Local $sNames = "없음|바바리안|아처|자이언트|고블린|해골돌격병|해골비행선|마법사|치유사|드래곤|페카|번개마법|회복마법|분노마법|이동마법|얼음마법|독마법|지진마법|신속마법|미니언|호그라이더|발키리|골램|마녀|라바하운드"
		$lblNextUpgrade = GUICtrlCreateLabel("다음순서 :", $x + 190, $y + 12, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbLaboratory = GUICtrlCreateCombo("", $x + 250, $y + 8, 125, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, $sNames,"없음")
			$txtTip = "업드레이드할 유닛을 선택하세요" & @CRLF & "선택한 유닛이 오른쪽에 나타납니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbLab")
		$icnLabUpgrade = GUICtrlCreateIcon($pIconLib, $eIcnLaboratory, $x + 380, $y, 32, 32)
			GUICtrlSetState(-1, $GUI_HIDE)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	Local $x = 260, $y = 150

	Local $x = 30, $y = 215
	$grpUpgrade = GUICtrlCreateGroup("건물 및 영웅", $x - 20, $y - 15, 450, 180)
		$picUpgradeStatus[0]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x - 15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		 $chkbxUpgrade[0] = GUICtrlCreateCheckbox(" Upgrade #1:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		 $lblUpgrade0PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[0] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade0PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[0] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[0]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[0] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$btnLocateUpgrade = GUICtrlCreateButton("위치설정", $x+330, $y-1, 95, 60, BitOR($BS_MULTILINE, $BS_VCENTER))
			$txtTip = "버튼을 눌러 나오는 지시에 따라 업그레이드 할 건물 및 영웅의 정보를 얻습니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnLocateUpgrades")
		$btnResetUpgrade = GUICtrlCreateButton("설정초기화", $x+330, $y+65, 95, 60, BitOR($BS_MULTILINE, $BS_VCENTER))
			$txtTip = "설정을 초기화 합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnResetUpgrade")

		$y+=22
		$picUpgradeStatus[1]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		$chkbxUpgrade[1] = GUICtrlCreateCheckbox(" Upgrade #2:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade1PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[1] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade1PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[1] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[1]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[1] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[2]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight, $x - 15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		$chkbxUpgrade[2] = GUICtrlCreateCheckbox(" Upgrade #3:", $x + 5, $y + 1,90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade2PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			$txtUpgradeX[2] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade2PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			$txtUpgradeY[2] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[2]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[2] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[3]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		$chkbxUpgrade[3] = GUICtrlCreateCheckbox(" Upgrade #4:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade3PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[3] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade3PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[3] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[3]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[3] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[4]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		$chkbxUpgrade[4] = GUICtrlCreateCheckbox(" Upgrade #5:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade4PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[4] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade4PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[4] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[4]= GUICtrlCreateIcon($pIconLib, $eIcnBlank,$x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[4] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=22
		$picUpgradeStatus[5]= GUICtrlCreateIcon($pIconLib, $eIcnRedLight,$x-15, $y + 1, 16, 16)
			GUICtrlSetTip(-1, "빨강 = 설정되지 않음" & @CRLF & "노랑 = 설정완료, 진행 전" & @CRLF &"초록 = 진행완료","확인방법 :")
		$chkbxUpgrade[5] = GUICtrlCreateCheckbox(" Upgrade #6:", $x + 5, $y + 1, 90, 17)
			$txtTip = "'위치설정'버튼을 눌러 업그레이드 정보를 얻은 후 체크하여 활성화 하세요."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnchkbxUpgrade")
		$lblUpgrade5PosX = GUICtrlCreateLabel("X. ", $x+100, $y+3, 15, 18)
			 $txtUpgradeX[5] = GUICtrlCreateInput("", $x+115, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$lblUpgrade5PosY = GUICtrlCreateLabel("Y. ", $x+150, $y+3, 15, 18)
			 $txtUpgradeY[5] = GUICtrlCreateInput("", $x+165, $y-1, 31, 20, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))
		$picUpgradeType[5]= GUICtrlCreateIcon($pIconLib, $eIcnBlank, $x+230, $y, 16, 16)
			$txtTip = "업그레이드에 필요한 자원"
			GUICtrlSetTip(-1, $txtTip)
		$txtUpgradeValue[5] = GUICtrlCreateInput("", $x+248, $y-1, 65, 18, BitOR($ES_CENTER, $GUI_SS_DEFAULT_INPUT, $ES_READONLY, $ES_NUMBER))

		$y+=27
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x - 15, $y, 16, 16)
		$UpgrMinGold = GUICtrlCreateLabel("최소보관 :", $x + 5, $y + 3, -1, -1)
		$txtUpgrMinGold = GUICtrlCreateInput("250000", $x + 65, $y - 2, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "저장소에 보관할 '골드'양을 설정하세요." & @CRLF & "설정된 양만큼은 사용하지 않습니다. 마을검색이나 성벽업그레이드를 위한 보관양을 설정하세요.")
			GUICtrlSetLimit(-1, 7)
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 135, $y, 16, 16)
		$UpgrMinElixir = GUICtrlCreateLabel("최소보관 :", $x + 155, $y + 3, -1, -1)
		$txtUpgrMinElixir = GUICtrlCreateInput("250000", $x + 215, $y - 2, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "저장소에 보관할 '엘릭서'양을 설정하세요." & @CRLF & "설정된 양만큼은 사용하지 않습니다. 유닛 훈련이나 성벽업그레이드를 위한 보관양을 설정하세요.")
			GUICtrlSetLimit(-1, 7)
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 285, $y, 16, 16)
		$UpgrMinDark = GUICtrlCreateLabel("최소보관 :", $x + 305, $y + 3, -1, -1)
		$txtUpgrMinDark= GUICtrlCreateInput("3000", $x + 365, $y - 2, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "저장소에 보관할 '다크엘릭서'양을 설정하세요." & @CRLF & "설정된 양만큼은 사용하지 않습니다. 유닛 훈련을 위한 보관양을 설정하세요.")
			GUICtrlSetLimit(-1, 6)
		GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 405
		$grpWalls = GUICtrlCreateGroup("성벽", $x - 20, $y - 20, 450, 120)
		GUICtrlCreateIcon ($pIconLib, $eIcnWall, $x - 12, $y - 6, 24, 24)
		$chkWalls = GUICtrlCreateCheckbox("성벽업그레이드", $x + 18, $y-2, -1, -1)
			GUICtrlSetTip(-1, "자원이 충분하다면 성벽을 업그레이드 합니다.")
			GUICtrlSetState(-1, $GUI_ENABLE)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkWalls")
			_ArrayConcatenate($G, $B)
		$UseGold = GUICtrlCreateRadio("골드 사용", $x + 35, $y + 16, -1, -1)
			GUICtrlSetTip(-1, "골드를 사용하여 성벽을 업그레이드 합니다." & @CRLF & "레벨에 상관없이 업그레이드가 가능합니다.")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$UseElixir = GUICtrlCreateRadio("엘릭서 사용", $x + 35, $y + 34, -1, -1)
			GUICtrlSetTip(-1, "엘릭서를 사용하여 성벽을 업그레이드 합니다." & @CRLF & "엘릭서로 업그레이드가 가능한 레벨부터 지원됩니다.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$UseElixirGold = GUICtrlCreateRadio("1.엘릭서 2.골드 사용", $x + 35, $y + 52, -1, -1)
			GUICtrlSetTip(-1, "엘릭서를 사용하여 업그레이드를 시도하고, 엘릭서가 충분하지 않은 경우 골드로 업그레이드를 합니다." & @CRLF & "엘릭서로 업그레이드가 가능한 레벨부터 지원됩니다.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon ($pIconLib, $eIcnBuilder, $x - 12, $y + 72, 20, 20)
		$chkSaveWallBldr = GUICtrlCreateCheckbox("쉬는 장인(1명) 유지", $x+18, $y + 72, -1, -1)
			$TxtTip = "성벽업그레이드 혹은 기타 다른 작업을 위하여 장인 한명을 업그레이드에 사용하지 않습니다."
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "chkSaveWallBldr")
		$x += 220
		$lblWalls = GUICtrlCreateLabel("검색할 성벽레벨 :", $x, $y+2, -1, -1)
		$cmbWalls = GUICtrlCreateCombo("", $x + 110, $y - 2, 61, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL), $WS_EX_RIGHT)
			GUICtrlSetTip(-1, "설정된 레벨에 맞는 성벽을 검색하고 하나씩 업그레이드를 진행합니다.")
			GUICtrlSetData(-1, "4   |5   |6   |7   |8   |9   |10   ", "4   ")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbWalls")
			_ArrayConcatenate($G, $C)
		$lblTxtWallCost = GUICtrlCreateLabel("업그레이드 비용 :", $x,  $y + 25, -1, -1)
			GUICtrlSetTip(-1, "업그레이드에 필요한 비용을 나타냅니다." &@CRLF & "비용이 다르다면 성벽레벨을 다시 설정하세요.")
		$lblWallCost = GUICtrlCreateLabel("30 000", $x + 110, $y + 25, 50, -1, $SS_RIGHT)
			GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x, $y + 47, 16, 16)
		$WallMinGold = GUICtrlCreateLabel("골드 보관 :", $x + 20, $y + 47, -1, -1)
		$txtWallMinGold = GUICtrlCreateInput("250000", $x + 110, $y + 45, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Save this much Gold after the wall upgrade completes," & @CRLF & "Set this value to save Gold for other upgrades, or searching.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y +=2
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x, $y + 67, 16, 16)
		$WallMinElixir = GUICtrlCreateLabel("엘릭서 보관 :", $x + 20, $y + 70, -1, -1)
		$txtWallMinElixir = GUICtrlCreateInput("250000", $x + 110, $y + 65, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Save this much Elixir after the wall upgrade completes," & @CRLF & "Set this value to save Elixir for other upgrades or troop making.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateTabItem("")
