*****************************************
* Chaîne de trois inverseurs CMOS
*****************************************

* Modèle NMOS
.MODEL MNmos NMOS LEVEL=3 VTO=0.7 KP=4e-05 GAMMA=1.1 PHI=0.6
+ RD=40 RS=40 CGSO=3e-10 CGDO=3e-10 CGBO=5e-10

* Modèle PMOS
.MODEL MPmos PMOS LEVEL=3 VTO=-0.8 KP=1.2e-05 GAMMA=0.6 PHI=0.6
+ RD=100 RS=100 CGSO=2.5e-10 CGDO=2.5e-10 CGBO=5e-10

* Alimentation
VDD vdd 0 DC 5

* Entrée
VIN in 0 PULSE(0 5 0 1n 1n 30n 60n)

* -------- Inverseur 1 --------
M1 vdd in out1 vdd MPmos W=20u L=2u
M2 out1 in 0 0 MNmos W=20u L=2u
Cload1 out1 0 0.3p

* -------- Inverseur 2 --------
M3 vdd out1 out2 vdd MPmos W=20u L=2u
M4 out2 out1 0 0 MNmos W=20u L=2u
Cload2 out2 0 0.3p

* -------- Inverseur 3 --------
M5 vdd out2 out3 vdd MPmos W=20u L=2u
M6 out3 out2 0 0 MNmos W=20u L=2u
Cload3 out3 0 0.3p

* Analyse temporelle
.TRAN 0.1n 300n
.END
