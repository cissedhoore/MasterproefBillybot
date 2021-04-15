; COMMUNICATION

;/////////////////////////////////////////////////////////
;Define inputs & outputs
;/////////////////////////////////////////////////////////	

Symbol LDR_Left		= C.4
Symbol LDR_Right		= C.3
Symbol LED_Blue		= C.2
Symbol LED_Red		= C.1
Symbol LED_Green		= C.0

Symbol Piezo		= B.1
Symbol PWMMotorL		= B.2
Symbol MotorControl	= B.3
Symbol PWMMotorR		= B.4
Symbol PressButton	= B.5


;/////////////////////////////////////////////////////////
;Setup
;/////////////////////////////////////////////////////////
setup:

; Initialising motors
pwmout PWMMotorL, 100, 0
pwmout PWMMotorR, 100, 0	
low MotorControl

; Light up LEDS to indicate the start of the program
high LED_Red
high LED_Red
pause 200
low LED_Red
pause 200
high LED_Red
pause 200
low LED_Red

; Robot staat in de beginfase in "zend-modus"
Symbol mode = w4
mode = 0
high LED_Blue


;/////////////////////////////////////////////////////////
;Main Loop
;/////////////////////////////////////////////////////////

main:
; Check indien de knop is ingedrukt (om van modus te wisselen)
button PressButton, 1, 200, 100, b2, 1, changeMode	

IF mode = 0 THEN
   	; zend-modus
   	high LED_Red
	pause 200
	low LED_Red
	pause 200
	high LED_Red
	pause 200
	low LED_Red
   
ELSEIF mode = 1 THEN
   	; ontvangst-modus
   	IF LDR_Left = 1 or LDR_Right = 1 THEN
		high LDR_RED
  	ENDIF
   
ELSE
   goto setup
ENDIF
goto main


changeMode:
IF mode = 0 THEN
   mode = 1
   low LED_Blue
   high LED_Green
ELSEIF mode = 1 THEN
   mode = 1
   low LED_Green
   high LED_Blue
ELSE
   goto setup
ENDIF

return


goto main
