; UNITTEST

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

main:
; Test red LED
high LED_Red
pause 1000
low LED_Red

; Test green LED
high LED_Green
pause 1000
low LED_Green

; Test blue LED
high LED_Blue
pause 1000
low LED_Blue

; Test piezo
sound Piezo,(105,100)

; Test motors forward
pwmduty PWMMotorL, 200
pwmduty PWMMotorR, 200
pause 500

; Test motors backwards
high MotorControl
pwmduty PWMMotorL, 150
pwmduty PWMMotorR, 150
pause 500

; Test turn right
low MotorControl
pwmduty PWMMotorR, 0
pwmduty PWMMotorL, 150
pause 500

; Test turn left
pwmduty PWMMotorR, 150
pwmduty PWMMotorL, 0
pause 500
pwmduty PWMMotorR, 0


goto main 
