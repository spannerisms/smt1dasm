;===================================================================================================
; Just cuts a number in half for VRAM addressing
;===================================================================================================
function VRAMaddr(a) = (a)>>1

; Y = destination
; X = source
macro MVN(src, dest) ; why asar
	MVN <dest>, <src>
endmacro

macro MVP(src, dest)
	MVP <dest>, <src>
endmacro
