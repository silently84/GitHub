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
;~ Attack Advanced Tab
;~ -------------------------------------------------------------
 $tabAttackAdv = GUICtrlCreateTabItem("고급설정")
	Local $x = 30, $y = 150
	$grpAtkOptions = GUICtrlCreateGroup("공격 옵션", $x - 20, $y - 20, 450, 100)
		$chkAttackNow = GUICtrlCreateCheckbox("Attack Now!", $x, $y, -1, -1)
			$txtTip = "이 옵션을 사용하면 마을정보 옆으로 ""Attack Now!""버튼이 활성화됩니다." & @CRLF & _
				"현재 마을을  해당 공격설정값('DeadBase' 또는 'LiveBase' 또는 'TH snipe')으로 공격합니다" & @CRLF & _
				"""Attack Now!"" 버튼은 공격할 마을검색시에만 활성화됩니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAttackNow")
		$y +=20
		$lblAttackNow = GUICtrlCreateLabel("추가 :", $x + 20, $y + 6, -1, -1, $SS_RIGHT)
			$txtTip = "이 반응시간을 추가하여 검색속도를 지연시킵니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbAttackNowDelay = GUICtrlCreateCombo("", $x + 65, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "5|4|3|2|1","3") ; default value 3
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblAttackNowSec = GUICtrlCreateLabel("초의 반응시간", $x + 100, $y + 6, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y +=22
		$chkAttackTH = GUICtrlCreateCheckbox("외곽에 위치한 마을회관 공격", $x, $y, -1, -1)
			GUICtrlSetTip(-1, "이 옵션을 사용하면 노출된 마을회관을 우선적으로 공격하도록 설정합니다. (성벽 바깥쪽에 있는 마을회관)" & @CRLF & _
			"TIP: 만약 마을회관이 노출된 마을만을 찾고 싶다면 '마을검색'탭의 ""외곽에 위치한 마을회관"" 조건을 활성화 하세요.")
;		$y +=22
;		$chkLightSpell = GUICtrlCreateCheckbox("Hit Dark Elixir storage with Lightning Spell", $x, $y, -1, -1)
;			GUICtrlSetTip(-1, "Check this if you want to use lightning spells to steal Dark Elixir when bot meet Minimum Dark Elixir.")
;			GUICtrlSetOnEvent(-1, "GUILightSpell")
;		$y +=22
;  		$lbliLSpellQ = GUICtrlCreateLabel("Have:", $x + 20, $y + 4, -1, -1)
;			$txtTip = "Set the minimum amount of spells needed. Never attack with less."
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$cmbiLSpellQ = GUICtrlCreateCombo("", $x + 50, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			GUICtrlSetData(-1, "1|2|3|4|5", "3")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$lbliLSpellQ2 = GUICtrlCreateLabel("Lightning Spells ready before using this type of Attack.", $x + 90, $y + 4, -1, -1)
;			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 25, $y = 260
	$grpAtkCombos = GUICtrlCreateGroup("추가 설정", $x - 15, $y - 20, 225, 165)
		$chkBullyMode = GUICtrlCreateCheckbox("TH Bully. : ", $x, $y, -1, -1)
			$txtTip = "현재의 검색설정조건에 ""TH Bully""모드를 추가합니다. (예시 : 'Deadbase' 또는 'TH Bully')" & @CRLF & _
				"TH Bully: 설정된 검색횟수 이후부터 마을회관레벨이 낮은 마을을 찾아 공격합니다." & @CRLF & _
				"'Bully'의 뜻은 ""약자를 괴롭히다""입니다. 즉, 낮은레벨의 마을회관을 찾아 쉽게 약탈할 수 있습니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkBullyMode")
		$txtATBullyMode = GUICtrlCreateInput("150", $x + 85, $y, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "TH Bully : 활성화를 위한 검색횟수를 입력하세요."
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblATBullyMode = GUICtrlCreateLabel("번 검색이후", $x + 125, $y + 5, -1, -1)
		$y +=25
		$lblATBullyMode = GUICtrlCreateLabel("마을회관최대레벨 :", $x + 5, $y + 3, -1, -1, $SS_RIGHT)
		$cmbYourTH = GUICtrlCreateCombo("", $x + 125, $y - 3, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "TH Bully : 공격할 마을의 마을회관 최대 레벨"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 24
		GUICtrlCreateLabel("적용할 공격설정 :", $x + 5, $y, -1, -1, $SS_RIGHT)
		$txtTip = "TH Bully : 공격할 마을 발견시 적용할 Base설정값"
			GUICtrlSetTip(-1, $txtTip)
		$y += 14
		$radUseDBAttack = GUICtrlCreateRadio("DeadBase", $x + 20, $y, -1, -1)
			GUICtrlSetTip(-1, "TH Bully : 'DeadBase' 공격설정값을 사용하여 공격합니다.")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$radUseLBAttack = GUICtrlCreateRadio("LiveBase", $x + 115, $y, -1, -1)
			GUICtrlSetTip(-1, "TH Bully : 'LiveBase' 공격설정값을 사용하여 공격합니다.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 27
		$chkTrophyMode = GUICtrlCreateCheckbox("TH Snipe. :", $x, $y, -1, -1)
			$txtTip = "현재의 검색설정조건에 ""TH Snipe""모드를 추가합니다.( 예시 : Deadbase 또는 TH Snipe)" & @CRLF & _
							"TH snipe : 일명 '홀치기'가 가능한 마을 발견시 전투를 시작합니다."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSnipeMode")
		$lblTHaddtiles = GUICtrlCreateLabel( "칸 이격", $x + 125, $y + 5, -1, 17)
		$txtTip = "TH Snipe : 외벽으로부터 설정된 값만큼 떨어저 있는 마을회관을 검색합니다."
			GUICtrlSetTip(-1, $txtTip)
		$txtTHaddtiles = GUICtrlCreateInput("1", $x + 85, $y, 35, - 1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y+=25
		$lblAttackTHType = GUICtrlCreateLabel("공격유형 :", $x + 5, $y + 5, -1, 17, $SS_RIGHT)
		$cmbAttackTHType = GUICtrlCreateCombo("",  $x + 75, $y, 120, - 1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "Barch|Attack1:Normal|Attack2:eXtreme|Attack3:GBarch", "Attack1:Normal")
			GUICtrlSetState(-1, $GUI_DISABLE)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 260
	$grpDefenseFarming = GUICtrlCreateGroup("방어약탈모드", $x - 20, $y - 20, 220, 165)
		$chkUnbreakable = GUICtrlCreateCheckbox("'무적'모드 사용", $x, $y, -1, -1)
			$TxtTip = "도전과제 중 '무적'업적을 위하여 상대방이 공격하도록 유도합니다." ;& @CRLF & "TIP: Set your trophy range on the Misc Tab to '600 - 800' for best results. WARNING: Doing so will DROP you Trophies!"
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetOnEvent(-1, "chkUnbreakable")
		$y += 23
		$lblUnbreakable1 = GUICtrlCreateLabel("대기시간 :", $x + 10 , $y + 3, -1, -1, $SS_RIGHT)
		$txtUnbreakable = GUICtrlCreateInput("5", $x + 80, $y, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$TxtTip = "설정된 시간동안 CoC를 종료하고 상대방의 공격에서 승리하도록 대기합니다. (1-99 분)"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblUnbreakable2 = GUICtrlCreateLabel("분", $x + 113, $y+3, -1, -1)
		$y += 28
		$lblUnBreakableFarm = GUICtrlCreateLabel("모드정지", $x + 25 , $y, -1, -1)
		$lblUnBreakableSave = GUICtrlCreateLabel("모드활성", $x + 115 , $y, -1, -1)
		$y += 16
		$txtUnBrkMinGold = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드를 중지하기 위한 '골드' 최소값, 이 이하로 내려가면 기본약탈모드로 전환됩니다." & @CRLF & "검색 또는 업그레이드를 위해 필요한 '골드'양을 설정하세요.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 80, $y + 2, 16, 16)
		$txtUnBrkMaxGold = GUICtrlCreateInput("600000", $x + 110, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드로 전환하기 위한 '골드' 요구값 " & @CRLF & "업그레이드 또는 공격을 유도하도록 '골드'값을 입력하세요.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 170, $y + 2, 16, 16)
		$y += 26
		$txtUnBrkMinElixir = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드를 중지하기 위한 '엘릭서' 최소값, 이 이하로 내려가면 기본약탈모드로 전환됩니다." & @CRLF & "검색 또는 업그레이드를 위해 필요한 '엘릭서'양을 설정하세요.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 80, $y, 16, 16)
		$txtUnBrkMaxElixir = GUICtrlCreateInput("600000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드로 전환하기 위한 '엘릭서' 요구값 " & @CRLF & "업그레이드 또는 공격을 유도하도록 '엘릭서'값을 입력하세요.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 170, $y, 16, 16)
		$y += 24
		$txtUnBrkMinDark = GUICtrlCreateInput("10000", $x + 20, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드를 중지하기 위한 '다크엘릭서' 최소값, 이 이하로 내려가면 기본약탈모드로 전환됩니다." & @CRLF & "검색 또는 업그레이드를 위해 필요한 '다크엘릭서'양을 설정하세요.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 80, $y, 16, 16)
		$txtUnBrkMaxDark = GUICtrlCreateInput("5000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "방어약탈모드로 전환하기 위한 '다크엘릭서' 요구값 " & @CRLF & "업그레이드 또는 공격을 유도하도록 '다크엘릭서'값을 입력하세요.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 170, $y, 16, 16)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
