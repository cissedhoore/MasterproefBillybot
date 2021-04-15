; COMMAND_BLOCKS

;/////////////////////////////////////////////////////////
;Define inputs & outputs
;/////////////////////////////////////////////////////////	

Symbol LDR_Left		= C.4
Symbol LDR_Right	= C.3
Symbol LED_Blue		= C.2
Symbol LED_Red		= C.1
Symbol LED_Green	= C.0

Symbol Piezo		= B.1
Symbol PWMMotorL	= B.2
Symbol MotorControl	= B.3
Symbol PWMMotorR	= B.4
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
pause 200
low LED_Red
pause 200
high LED_Red
pause 200
low LED_Red

;/////////////////////////////////////////////////////////
;Main Loop
;/////////////////////////////////////////////////////////


;/////////////////////////////////////////////////////////
;Hier komen de uit te voeren commando's
;/////////////////////////////////////////////////////////

goto Vooruit
goto Achteruit
;...

;/////////////////////////////////////////////////////////
;Einde van de zelf in te voeren commando's
;/////////////////////////////////////////////////////////


goto ending


Vooruit:
high LED_Red
pwmduty PWMMotorL, 200
pwmduty PWMMotorR, 200
pause 200
low LED_Red
pwmduty PWMMotorL, 0
pwmduty PWMMotorR, 0
return


Achteruit:
high LED_Red
high MotorControl
pwmduty PWMMotorL, 200
pwmduty PWMMotorR, 200
pause 200
low LED_Red
pwmduty PWMMotorL, 0
pwmduty PWMMotorR, 0
low MotorControl
return


Links:
high LED_Red
pwmduty PWMMotorL, 0
pwmduty PWMMotorR, 200
pause 200
low LED_Red
pwmduty PWMMotorL, 0
pwmduty PWMMotorR, 0
return


Rechts:
high LED_Red
pwmduty PWMMotorL, 200
pwmduty PWMMotorR, 0
pause 200
low LED_Red
pwmduty PWMMotorL, 0
pwmduty PWMMotorR, 0
return


LED_Rood:
high LED_Red
pause 200
low LED_Red
pause 200
high LED_Red
pause 200
low LED_Red
pause 200
high LED_Red
pause 200
low LED_Red
return


LED_Groen:
high LED_Green
pause 200
low LED_Green
pause 200
high LED_Green
pause 200
low LED_Green
pause 200
high LED_Green
pause 200
low LED_Green
return


LED_Blauw:
high LED_Blue
pause 200
low LED_Blue
pause 200
high LED_Blue
pause 200
low LED_Blue
pause 200
high LED_Blue
pause 200
low LED_Blue
return


Geluid:
tune 0, 5,($22,$27,$67,$69,$67,$66,$24,$20,$24,$29,$69,$6B,$69,$67,$26,$22,$26,$2B,$6B,$40,$6B,$69,$27,$24,$62,$62,$24,$29,$26,$E7)
return


ending:
