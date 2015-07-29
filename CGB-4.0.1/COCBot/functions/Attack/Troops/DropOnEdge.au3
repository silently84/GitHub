
Func DropOnEdge($troop, $edge, $number, $slotsPerEdge = 0, $edge2 = -1, $x = -1,$FourFingers = 0)
	If $number = 0 Then Return
	If _Sleep(100) Then Return
	SelectDropTroop($troop) ;Select Troop
	
	if $FourFingers <> 5 then; if $nbSide = 5
	If _Sleep(300) Then Return
	endif
	
	If $slotsPerEdge = 0 Or $number < $slotsPerEdge Then $slotsPerEdge = $number
	If $number = 1 Or $slotsPerEdge = 1 Then ; Drop on a single point per edge => on the middle
		Click($edge[2][0], $edge[2][1], $number, 250,"#0102")
		If $edge2 <> -1 Then Click($edge2[2][0], $edge2[2][1], $number, 250,"#0103")
		If _Sleep(50) Then Return
	ElseIf $slotsPerEdge = 2 Then ; Drop on 2 points per edge
		Local $half = Ceiling($number / 2)
		Click($edge[1][0], $edge[1][1], $half,0,"#0104")
		If $edge2 <> -1 Then
			If _Sleep(SetSleep(0)) Then Return
			Click($edge2[1][0], $edge2[1][1], $half,0,"#0105")
		EndIf
		If _Sleep(SetSleep(0)) Then Return
		Click($edge[3][0], $edge[3][1], $number - $half,0,"#0106")
		If $edge2 <> -1 Then
			If _Sleep(SetSleep(0)) Then Return
			Click($edge2[3][0], $edge2[3][1], $number - $half,0,"#0107")
		EndIf
		If _Sleep(SetSleep(0)) Then Return
	Else
		Local $minX = $edge[0][0]
		Local $maxX = $edge[4][0]
		Local $minY = $edge[0][1]
		Local $maxY = $edge[4][1]
		if $FourFingers = 5 then ; if $nbSide = 5
		Local $minXTL = $TopLeft[0][0];addition
		Local $maxXTL = $TopLeft[4][0];addition
		Local $minYTL = $TopLeft[0][1];addition
		Local $maxYTL = $TopLeft[4][1];addition
		endif
		If $edge2 <> -1 Then
			Local $minX2 = $edge2[0][0]
			Local $maxX2 = $edge2[4][0]
			Local $minY2 = $edge2[0][1]
			Local $maxY2 = $edge2[4][1]
			if $FourFingers = 5 then ; if $nbSide = 5
			Local $minX2TR = $TopRight[0][0];addition
			Local $maxX2TR = $TopRight[4][0];addition
			Local $minY2TR = $TopRight[0][1];addition
			Local $maxY2TR = $TopRight[4][1];addition
			endif
		EndIf
		Local $nbTroopsLeft = $number
		For $i = 0 To $slotsPerEdge - 1
			Local $nbtroopPerSlot = Round($nbTroopsLeft / ($slotsPerEdge - $i)) ; progressively adapt the number of drops to fill at the best
			if $FourFingers = 5 then ; if $nbSide = 5
				
				Local $posX = $minX + (($maxX - $minX) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Local $posY = $minY + (($maxY - $minY) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Click($posX, $posY, $nbtroopPerSlot,0,"#0108")
				Local $posX = $minXTL + (($maxXTL - $minXTL) * $i) / ($slotsPerEdge - 1);addition
				Local $posY = $minYTL + (($maxYTL - $minYTL) * $i) / ($slotsPerEdge - 1);addition
				Click($posX, $posY, $nbtroopPerSlot,0,"#0108") ;addition
			
			Else
			
				Local $posX = $minX + (($maxX - $minX) * $i) / ($slotsPerEdge - 1)
				Local $posY = $minY + (($maxY - $minY) * $i) / ($slotsPerEdge - 1)
				Click($posX, $posY, $nbtroopPerSlot,0,"#0108")
			
			Endif
			
			If $edge2 <> -1 Then ; for 2, 3 and 4 sides attack use 2x dropping
			if $FourFingers = 5 then ; if $nbSide = 5
			
				Local $posX2 = $maxX2 - (($maxX2 - $minX2) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Local $posY2 = $maxY2 - (($maxY2 - $minY2) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Click($posX2, $posY2, $nbtroopPerSlot,0,"#0109")
				Local $posX2 = $maxX2TR - (($maxX2TR - $minX2TR) * $i) / ($slotsPerEdge - 1);addition
			    Local $posY2= $maxY2TR - (($maxY2TR - $minY2TR) * $i) / ($slotsPerEdge - 1);addition
				Click($posX2, $posY2, $nbtroopPerSlot,0,"#0109")
						
			Else
			
				Local $posX2 = $maxX2 - (($maxX2 - $minX2) * $i) / ($slotsPerEdge - 1)
				Local $posY2 = $maxY2 - (($maxY2 - $minY2) * $i) / ($slotsPerEdge - 1)
				;If $x = 0 Then
				;  If _Sleep(SetSleep(0)) Then Return ; add delay for first wave attack to prevent skip dropping troops, must add for 4 sides attack
				;EndIf
				Click($posX2, $posY2, $nbtroopPerSlot,0,"#0109")
			
			Endif
				$nbTroopsLeft -= $nbtroopPerSlot
			Else
				$nbTroopsLeft -= $nbtroopPerSlot
			EndIf
			If $FourFingers <> 5 then ; if $nbSide = 5
			If _Sleep(SetSleep(0)) Then Return
			Endif
		Next
	EndIf
EndFunc   ;==>DropOnEdge
