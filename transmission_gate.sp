*********************************
* Porte de transmission CMOS
*********************************

* Transistors
M1 OUT A B 0 NMOS
M2 OUT ABARRE B vdd PMOS

* Alimentation
VDD vdd 0 DC 5

* Signaux de commande
VIN  A 0 PULSE(4 0 0n 1n 1n 200n 400n)
VIN1 B 0 PULSE(4 0 100n 1n 1n 200n 500n)
VIN2 ABARRE 0 PULSE(0 5 0n 1n 1n 200n 400n)

* Charge
C1 OUT 0 0.1p

* Modèles
.MODEL NMOS NMOS (VTO=0.7 KP=120u)
.MODEL PMOS PMOS (VTO=-0.7 KP=60u)

.TRAN 0.1n 600n
.END
