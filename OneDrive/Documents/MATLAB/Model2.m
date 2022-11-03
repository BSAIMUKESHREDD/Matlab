clear all
clc

% FEED 
 TF=303.15;

 PSTP =1e5;
TP=273;
PP=689476;
TSTP=273.15;
PF=3447380.00;
XFCO2=0.24;
XFN2=0.44;
XFCH4=0.32;

 
  [XR1CH4,XR1CO2,XR1N2,XP1CH4,XP1CO2,XP1N2,QP1,NP1,NR1,TR1,TP1,PR1,PP1] = calculate2(XFN2,XFCO2,XFCH4,TF,PF,PP);

  [XR2CH4,XR2CO2,XR2N2,XP2CH4,XP2CO2,XP2N2,QP2,NP2,NR2,TR2,TP2,PR2,PP2] = calculate2(XR1N2,XR1CO2,XR1CH4,TR1,PR1,PP1);
  
  [XR3CH4,XR3CO2,XR3N2,XP3CH4,XP3CO2,XP3N2,QP3,NP3,NR3,TR3,TP3,PR3,PP3] = calculate2(XP1N2,XP1CO2,XP1CH4,TP1,PP1,PP);
  
  [XR4CH4,XR4CO2,XR4N2,XP4CH4,XP4CO2,XP4N2,QP4,NP4,NR4,TR4,TP4,PR4,PP4] = calculate2(XR3N2,XR3CO2,XR3CH4,TR3,PR3,PP);
 
  
  