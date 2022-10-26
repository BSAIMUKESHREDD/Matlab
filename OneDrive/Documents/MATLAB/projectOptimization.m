GPUN2 = 0.4;
GPUCH4 = 0.6;
GPUCO2 = 0.3;

R=8.314;

MWN2=44;
MWCH4=16;
MWCO2=44;

AM =0:0.1:1;

TF =25 ;PF=1;
TR=TF;
PR=PF;

for XFN2 =0:0.01:1
    for XFCO2 =0:0.01:1
        for XFCH4 =0:0.01:1
               for QCO2=0:100
                   for QCH4=0:100
                        for QN2=0:100
                                
                            JFCO2 = NF*XFCO2*R*TP/PP*AM;
                            JFN2 = NF*XFN2*R*TP/PP*AM;
                            JFCH4 = NF*XFCH4*R*TP/PP*AM;

                                        
                            XPCO2 = JCO2/(JN2+JCO2+JCH4);
                            XPN2 = JN2/(JN2+JCO2+JCH4);
                            XPCH4 = JCH4/(JN2+JCO2+JCH4);


                            JCO2 = (PSTP*TP/PP*TSTP)*GPUCO2*(PF*XFCO2-PP*XPCO2);
                            JCH4 = (PSTP*TP/PP*TSTP)*GPUCH4*(PF*XFCH4-PP*XPCH4);
                            JN2  = (PSTP*TP/PP*TSTP)*GPUN2*(PF*XFN2-PP*XPN2);

                            QCO2 = AM*JCO2;
                            QCH4 = AM*JCH4;
                            QN2 = AM*JN2;

                            QP = AM*(JCO2);

                            NF= PF*QF/R*TF;
                            NP= PP*QP/R*TP;
                            NR= PR*QR/R*TR;
                            
                            
                            XFN2 = (NR*XRN2 + NP*XPN2)/NF;
                            XFCO2 = (NR*XRCO2 + NP*XPCO2)/NF;
                            XFCH4 = (NR*XRCH4 + NP*XPCH4)/NF;

                        end
                    end
               end
        end
    end
end




%{
NF= PF*QF/R*TF;
NP= PP*QP/R*TP;
NR= PR*QR/R*TR;


XFN2 = (NR*XRN2 + NP*XPN2)/NF;
XFCO2 = (NR*XRCO2 + NP*XPCO2)/NF;
XFCH4 = (NR*XRCH4 + NP*XPCH4)/NF;

QP = AM*(JCO2);

QCO2 = AM*JCO2;
QCH4 = AM*JCH4;
QN2 = AM*JN2;

JCO2 = (PSTP*TP/PP*TSTP)*GPUCO2*(PF*XFCO2-PP*XPCO2);
JCH4 = (PSTP*TP/PP*TSTP)*GPUCH4*(PF*XFCH4-PP*XPCH4);
JN2 = (PSTP*TP/PP*TSTP)*GPUN2*(PF*XFN2-PP*XPN2);


XPCO2 = JCO2/(JN2+JCO2+JCH4);
XPN2 = JN2/(JN2+JCO2+JCH4);
XPCH4 = JCH4/(JN2+JCO2+JCH4);

JFCO2 = NF*XFCO2*R*TP/PP*AM;
JFN2 = NF*XFN2*R*TP/PP*AM;
JFCH4 = NF*XFCH4*R*TP/PP*AM;
%}


