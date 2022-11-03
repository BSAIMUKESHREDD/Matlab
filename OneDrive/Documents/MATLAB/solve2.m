
function f = solve2(X,XFCO2,XFCH4,XFN2,PP,PF,TP)

PSTP =1e5;
TSTP=273.15;
GPUN2 = 23*10e-6;
GPUCH4 = 73*10e-6;
GPUCO2 = 230*10e-6;

                        f(1) = X(1) - X(4)/(X(6)+X(4)+X(5));
                          f(2)=  X(3) - X(6)/(X(6)+X(4)+X(5));
                           f(3)= X(2) - X(5)/(X(6)+X(4)+X(5));

                           f(4)= X(4) - (PSTP*TP/PP*TSTP)*GPUCO2*(PF*XFCO2-PP*X(1));
                           f(5)=  X(5) - (PSTP*TP/PP*TSTP)*GPUCH4*(PF*XFCH4-PP*X(2));
                           f(6)= X(6)  - (PSTP*TP/PP*TSTP)*GPUN2*(PF*XFN2-PP*X(3));


end




