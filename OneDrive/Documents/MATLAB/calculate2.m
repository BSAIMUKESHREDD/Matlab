
function [XRCH4,XRCO2,XRN2,XPCH4,XPCO2,XPN2,QP,NP,NR,TR,TP,PR,PP] = calculate2(XFN2,XFCO2,XFCH4,TF,PF,PP)


%{ 
    from literature
GPUN2 = 23*10e-6;
GPUCH4 = 73*10e-6;
GPUCO2 = 230*10e-6;

TSTP=273; %temperature at stp
PSTP=1; % 1 atm

%}

%flow rate of feed 
QF=105510.9761;      
% universal gas constant 
R=8.3144598 ;

AM=1000*100*100;

% temperatures and pressure data

TR=TF;
TP=TF;
PR=PF;

 % the pressure to be maintaind by the compressor


NF= PF*QF/R*TF;
   


 



%NR= PR*QR/R*TR;

% CALLING THE solve function which has fsolve to solve the 6 equations with
% 6 variables

fun = @solve2;
x0 = [0,0,1,1,2,2];
X = fsolve(fun,x0,[],XFCO2,XFCH4,XFN2,PP,PF,TP);   %[] is important acts as a placeholder utube video by gregory reeves

QPCO2 = AM*X(4);    
QPCH4 = AM*X(5);
QPN2 = AM*X(6);



QP = QPCO2 +QPCH4+QPN2;

XPCH4=X(2);
XPCO2=X(1);
XPN2=X(3);

NP= PP*QP/R*TP;
NR=NF-NP;
XRCH4 = (NF*XFCH4- NP*X(2))/NR;
XRCO2 =(NF*XFCO2- NP*X(1))/NR ; 
XRN2= (NF*XFN2- NP*X(3))/NR ;

end