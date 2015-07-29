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
; Misc Tab
;~ -------------------------------------------------------------
$tabMisc = GUICtrlCreateTabItem("기타설정")
Local $x = 30, $y = 150
	$grpControls = GUICtrlCreateGroup("공격중지", $x - 20, $y - 20, 450, 50)
		$chkBotStop = GUICtrlCreateCheckbox("", $x - 5, $y, 16, 16)
			$txtTip = "공격을 중지하고 싶을 때 이 옵션을 사용하세요" & @CRLF & "&(그리고)" & @CRLF & "/(또는)" & @CRLF & "F.(가득참)" & @CRLF & "M.(최대치)"
			GUICtrlSetTip(-1, $txtTip)
		$cmbBotCommand = GUICtrlCreateCombo("", $x + 20, $y - 3, 90, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "공격중지|PC종료|절전모드", "공격중지")
			$lblBotCond = GUICtrlCreateLabel("When...", $x + 125, $y, 45, 17)
		$cmbBotCond = GUICtrlCreateCombo("", $x + 175, $y - 3, 160, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "F.골드 & F.엘릭 & M.트로피|F.골드 & F.엘릭 / M.트로피|(F.골드 / F.엘릭) & M.트로피|F.골드 / F.엘릭 / M.트로피|F.골드 & F.엘릭|F.골드 / F.엘릭|F.골드 & M.트로피|F.엘릭 & M.트로피|F.골드 / M.트로피|F.엘릭 / M.트로피|F.골드|F.엘릭|M.트로피|일정시간후|유닛훈련/클랜지원만|클랜지원만|온라인유지", "유닛훈련/클랜지원만")
			GUICtrlSetOnEvent(-1, "cmbBotCond")
		$cmbHoursStop = GUICtrlCreateCombo("", $x + 335, $y - 3, 80, 35, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|1 Hour|2 Hours|3 Hours|4 Hours|5 Hours|6 Hours|7 Hours|8 Hours|9 Hours|10 Hours|11 Hours|12 Hours|13 Hours|14 Hours|15 Hours|16 Hours|17 Hours|18 Hours|19 Hours|20 Hours|21 Hours|22 Hours|23 Hours|24 Hours", "-")
			GUICtrlSetState (-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 205
	$grpControls = GUICtrlCreateGroup("프로필", $x - 20, $y - 20, 450, 65)
		$lblProfile = GUICtrlCreateLabel("현재프로필 :", $x, $y, -1, -1)
		$cmbProfile = GUICtrlCreateCombo("01", $x + 75, $y - 5, 40, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		$txtTip = "서로 다른 설정값을 지닌 프로필을 전환하여 사용할 수 있습니다. 기본설정: 01" & @CRLF & "프로필/설정파일 디렉토리 :" & @CRLF &  $sProfilePath
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetData(-1, "02|03|04|05|06", "01")
		GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput("MyVillage", $x + 120, $y - 4, 90, 18, BitOR($SS_CENTER, $ES_AUTOHSCROLL))
		GUICtrlSetLimit (-1, 20, 0)
		GUICtrlSetFont(-1, 9, 800, 1)
		GUICtrlSetTip(-1, "마을이름을 입력하세요.")
		GUICtrlSetOnEvent(-1, "txtVillageName")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 275
	$grpMisc = GUICtrlCreateGroup("재설치/자원수집/비석제거", $x -20, $y - 20 , 225, 100)
	;$grpTraps = GUICtrlCreateGroup("Traps, X-bows && Infernos", $x -20, $y - 20 , 225, 55)
		GUICtrlCreateIcon($pIconLib, $eIcnTrap, $x - 5, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnXbow, $x + 20, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnInferno, $x + 45, $y, 24, 24)
		$chkTrap = GUICtrlCreateCheckbox("재설치/재장전", $x + 75, $y + 2, -1, -1)
			GUICtrlSetTip(-1, "마을에 있는 모든 함정을 재설치하고, 만약 대형석궁이나 인페르노 타워가 있다면 재장전합니다.")
			GUICtrlSetOnEvent(-1, "chkTrap")
			_ArrayConcatenate($G, $D)
	;GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 25
	;Local $x = 30, $y = 335
	;$grpCollect = GUICtrlCreateGroup("Collecting Resources", $x - 20, $y - 20 , 225, 60)
		GUICtrlCreateIcon($pIconLib, $eIcnMine, $x - 5, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 20, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 45, $y, 24, 24)
		$chkCollect = GUICtrlCreateCheckbox("자원수집", $x + 75, $y + 2, -1, -1)
			$txtTip = "금광, 엘릭서정제소, 다크엘릭서정제소에서 자원을 수집합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	;GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 25
	;Local $x = 30, $y = 400
	;$grpTombstones = GUICtrlCreateGroup("Clear Tombstones", $x - 20, $y - 20 , 225, 55)
		GUICtrlCreateIcon($pIconLib, $eIcnTombstone, $x + 20, $y, 24, 24)
		$chkTombstones = GUICtrlCreateCheckbox("비석제거", $x + 75, $y + 2, -1, -1)
			$txtTip = "상대방의 공격으로 생성된 비석을 제거합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 380
	$grpRestartMins = GUICtrlCreateGroup("자동재시작", $x - 20, $y - 20 , 225, 75)
		$lblRestartMins = GUICtrlCreateLabel("자원부족으로 정지시, 재시작을위한 자원최소값설정", $x, $y, 100, 50, $BS_MULTILINE)
		$y -= 4
		$x +=105
		;$lblRestartGold = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x, $y - 5, 16, 16)
		$txtRestartGold = GUICtrlCreateInput("10000", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'골드'가 부족하여 중단된 경우 다시 실행하기 위한 '골드' 최소값"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$y += 20
		;$lblRestartElixir = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x, $y - 5, 16, 16)
		$txtRestartElixir = GUICtrlCreateInput("25000", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'엘릭서'가 부족하여 중단된 경우 다시 실행하기 위한 '엘릭서' 최소값"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$y += 20
		;$lblRestartDark = GUICtrlCreateLabel(">", $x + 112, $y, -1, -1)
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x, $y - 5, 16, 16)
		$txtRestartDark = GUICtrlCreateInput("500", $x + 20, $y - 5, 75, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "'다크엘릭서'가 부족하여 중단된 경우 다시 실행하기 위한 '다크엘릭서' 최소값"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 275
	$grpTrophy = GUICtrlCreateGroup("트로피 범위 설정", $x - 20, $y - 20, 220, 65)
		GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x - 10, $y + 5, 24, 24)
		$lblTrophyRange = GUICtrlCreateLabel("트로피 범위 :", $x + 20, $y, -1, -1)
		$txtdropTrophy = GUICtrlCreateInput("3000", $x + 110, $y - 5, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "최소값 : 이 값보다 작은 값을 얻을때까지 트로피를 낮춥니다."
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, $txtTip)
		$lblDash = GUICtrlCreateLabel(" - ", $x + 146, $y, -1, -1)
		$txtMaxTrophy = GUICtrlCreateInput("3000", $x + 160, $y - 5, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "최대값: 이 값보다 큰 값을 얻게 되면 자동으로 트로피를 낮추기 시작합니다."
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetTip(-1, $txtTip)
		$chkTrophyHeroes = GUICtrlCreateCheckbox("영웅 사용", $x + 20, $y + 20, -1, -1)
			$txtTip = "사용가능한 영웅이 있다면 영웅을 사용하여 트로피를 낮춥니다."
			GUICtrlSetTip(-1, $txtTip)
		$chkTrophyAtkDead = GUICtrlCreateCheckbox("Atk DB", $x + 100, $y + 20, -1, -1)
			$txtTip = "트로피를 낮추고 있을때(최초검색시) Dead base가 나오면 공격합니다."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 345
	$grpTimeWakeUp = GUICtrlCreateGroup("재접속 설정", $x - 20, $y - 20 , 220, 50)
		$lblTimeWakeUp = GUICtrlCreateLabel("다른기기접속시 재접속 :", $x - 10, $y + 2, -1, -1)
		$txtTip = "다른기기에서 접속했을 경우 설정된 시간(초) 후에 재접속을 합니다."
			GUICtrlSetTip(-1, $txtTip)
		$txtTimeWakeUp = GUICtrlCreateInput("120", $x + 128, $y - 1, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$lblTimeWakeUpSec = GUICtrlCreateLabel("초 후", $x + 165, $y + 2, -1, -1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 400
	$grpVSDelay = GUICtrlCreateGroup("검색간격", $x - 20, $y - 20, 220, 55)
		$txtTip = "공격마을을 검색할때 다음 버튼을 누르기 전까지 잠깐의 시간을 정합니다." & @CRLF & "동기화오류가 많다면 시간을 늘려주세요." & @CRLF & "이 옵션이 모든 상황을 해결해주진 않습니다."
		$lblVSDelay = GUICtrlCreateLabel("0", $x, $y, 12, 15, $SS_RIGHT)
			GUICtrlSetTip(-1, $txtTip)
		$lbltxtVSDelay = GUICtrlCreateLabel("초", $x + 15, $y, 45, -1)
		$sldVSDelay = GUICtrlCreateSlider($x + 55, $y - 2, 130, 25, BITOR($TBS_TOOLTIPS, $TBS_AUTOTICKS)) ;,
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetBkColor(-1, $COLOR_WHITE)
			_GUICtrlSlider_SetTipSide(-1, $TBTS_BOTTOM)
			_GUICtrlSlider_SetTicFreq(-1, 1)
			GUICtrlSetLimit(-1, 10, 0) ; change max/min value
			GUICtrlSetData(-1, 0) ; default value
			GUICtrlSetOnEvent(-1, "sldVSDelay")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 460
	$grpLocateBuildings = GUICtrlCreateGroup("건물위치수동설정", $x - 20, $y - 20, 450, 65)
		$btnLocateTownHall = GUICtrlCreateButton("Townhall", $x - 10, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, $pIconLib, $eIcnTH10, 1)
			$txtTip = "마을회관의 위치를 재설정 합니다,"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetOnEvent(-1, "btnLocateTownHall")
		$btnLocateClanCastle = GUICtrlCreateButton("Clan Castle", $x + 30, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
			GUICtrlSetImage(-1, $pIconLib, $eIcnCC, 1)
			$txtTip = "클랜성의 위치를 재설정 합니다."
			GUICtrlSetTip(-1, $txtTip)
		$btnLocateArmyCamp = GUICtrlCreateButton("A.C.", $x + 70, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateArmyCamp")
			GUICtrlSetImage(-1, $pIconLib, $eIcnCamp, 1)
			$txtTip = "집합소의 위치를 재설정 합니다."
			GUICtrlSetTip(-1, $txtTip)
		$btnLocateBarracks = GUICtrlCreateButton("Bar.", $x + 110, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateBarracks")
			GUICtrlSetImage(-1, $pIconLib, $eIcnBarrack, 1)
			$txtTip = "훈련소의 위치를 재설정 합니다."
			GUICtrlSetTip(-1, $txtTip)
	    $btnLocateSpellFactory = GUICtrlCreateButton("S.F.", $x + 150, $y, 40, 40, $BS_ICON)
			GUICtrlSetOnEvent(-1, "btnLocateSpellfactory")
			GUICtrlSetImage(-1, $pIconLib, $eIcnSpellFactory, 1)
			$txtTip = "마법제작소의 위치를 재설정 합니다."
			GUICtrlSetTip(-1, $txtTip)
			_ArrayConcatenate($G, $T)
		$btnLocateLaboratory = GUICtrlCreateButton("Lab.", $x + 190, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, $pIconLib, $eIcnLaboratory)
			$txtTip = "연구소의 위치를 재설정 합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "btnLab")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
