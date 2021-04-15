; FOLLOWLIGHT

;/////////////////////////////////////////////////////////
;Define inputs & outputs
;/////////////////////////////////////////////////////////	

Symbol LDR_Left		= C.4
Symbol PressButton	= C.3
Symbol LED_Blue		= C.2
Symbol LED_Red		= C.1
Symbol LED_Green	= C.0

Symbol Piezo		= B.1
Symbol PWMMotorL	= B.2
Symbol MotorControl	= B.3
Symbol PWMMotorR	= B.4
Symbol LDR_Right	= B.5


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

; Initialising parameter values
Symbol LDR_Left_Value = w4
Symbol LDR_Right_Value = w5
Symbol CorrectieFactor = w6
CorrectieFactor = 1

;/////////////////////////////////////////////////////////
;Main Loop
;/////////////////////////////////////////////////////////

main:
readadc LDR_Left, LDR_Left_Value
LDR_Left_Value = LDR_Left_Value * CorrectieFactor
readadc LDR_Right, LDR_Right_Value
LDR_Right_Value = LDR_Right_Value * CorrectieFactor


pwmduty PWMMotorL, LDR_Left_Value
pwmduty PWMMotorR, LDR_Right_Value


goto main
