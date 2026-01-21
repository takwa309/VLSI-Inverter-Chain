***************************************
* Chaîne de trois inverseurs pseudo-NMOS
***************************************

* Modèle NMOS
.model MN nmos (VTO=1.0 KP=25u GAMMA=0.4)

* Alimentation
VDD vdd 0 DC 5

* Signal d'entrée
VIN in 0 PULSE(0 5 0 1n 1n 30n 60n)

* -------- Inverseur 1 --------
Mpullup1 out1 vdd vdd 0 MN W=20u L=2u
Mpulldown1 out1 in  0   0 MN W=20u L=2u
Cload1 out1 0 1p

* -------- Inverseur 2 --------
Mpullup2 out2 vdd vdd 0 MN W=20u L=2u
Mpulldown2 out2 out1 0  0 MN W=20u L=2u
Cload2 out2 0 1p

* -------- Inverseur 3 --------
Mpullup3 out3 vdd vdd 0 MN W=20u L=2u
Mpulldown3 out3 out2 0  0 MN W=20u L=2u
Cload3 out3 0 1p

* Analyse temporelle
.TRAN 0.1n 200n
.END
