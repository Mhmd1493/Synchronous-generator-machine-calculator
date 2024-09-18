مطلوبdisp('Please Input The Following');
%%
%DC test for main winding
disp('Please Input The Following for DC test (Main)');
Vdcm=input('Vdc=');
Idcm=input('Idc=');
R1m=Vdcm/Idcm;%%
%%
%DC test for auxilary winding
disp('Please Input The Following for DC test (Auxilary)');
Vdca=input('Vdc=');
Idca=input('Idc=');
R1a=Vdca/Idca;%%
%%
%SS test (Main)
disp('Please Input The Following for SS test (Main)');
Vssm=input('Vstandtill for main winding=');
Issm=input('Istandtill for main winding=');
Pssm=input('Pstandtill for main winding=');
Zssm=Vssm/Issm;
Rssm=Pssm/Issm^2;
Xssm=sqrt(Zssm^2-Rssm^2);
R2m_=Rssm-R1m;
X1m=0.5*Xssm;
X2m_=X1m;
%%
%SS test (Auxilary)
disp('Please Input The Following for SS test (Auxilary)');
Vssa=input('Vstandtill for auxilary winding=');
Issa=input('Istandtill for auxilary winding=');
Pssa=input('Pstandtill for auxilary winding=');
Zssa=Vssa/Issa;
Rssa=Pssa/Issa^2;
Xssa=sqrt(Zssa^2-Rssa^2);
R2a_=Rssa-R1a;
X1a=0.5*Xssa;
X2a_=X1a;
%%
%No load test
disp('Please Input The Following for No load test');
Vnl=input('Vnl=');
Inl=input('Inl=');
Pnl=input('Pnl=');
Prot=Pnl-Inl^2*(R1m+0.25*R2m_); %assume constant
Znl=Vnl/Inl;
Rnl=Pnl/Inl^2;
Xnl=sqrt(Znl^2-Rnl^2);
Xm=Xnl-X1m-0.5*X2m_;%%
%%
%Case 1
Radd=2*Rssa;
Istm1=220/(sqrt((R1m+R2m_)^2+(2*X1m)^2));
Ista1=220/(sqrt((R1a+R2a_+Rcadd)^2+(2*X1a)^2));
Tst1=;%%
%%
%Case 2
Xcadd=4*X1a;%multiply by 4 because Xa=2*X1a & Xcadd=2*Xa
Istm2=220/(sqrt((R1m+R2m_)^2+(2*X1m)^2));
Ista2=220/(sqrt((R1a+R2a_)^2+(2*X1a-Xcadd)^2));
Tst2=;%%
%%
%Running
%Ia=0
n=input('Required speed=');
s=
Im=;
PCu1=;
PCu2=;
Ploss=PCu1+PCu2+Prot;%%
%%
disp(['1-Equivalent circuit parameters:' newline
    'For main winding:R1='       num2str(R1m)  'Ω   R2''='     num2str(R2m_) 'Ω'   newline
    '                 X1='       num2str(X1m)  'Ω   X2''='     num2str(X2m_) 'Ω'   newline
      %'Effective turns ratio='   num2str(XX)                  newline         newline
      '2-Standstill impeadance for main winding:'     newline
                     'Zss main='                      num2str(Zssm) 'Ω       Rss main='     num2str(Rssm)   'Ω       Xss main=' num2str(Xssm) 'Ω'            newline
      'Standstill impeadance for auxialry winding:'   newline
                     'Zss auxialry='                  num2str(Zssa) 'Ω   Rss auxilary='     num2str(Rssa)   'Ω   Xss auxilary='  num2str(Xssa) 'Ω'            newline newline
      '3-i-Resistance start motor'                    newline
                     'Ist='                           num2str(Ist)  'A   Tst='              num2str(Tst)    'Nm'                 newline
      '3-ii-Capacitor start motor'                    newline 
                     'Ist='                           num2str(Ist)  'A   Tst='              num2str(Tst)    'Nm'                 newline newline
      '4-Running conditions'                          newline
                     'Im='                            num2str(Ist)  'A   Ploss='            num2str(Tst)    'W   Po='            num2str(Po) 'W   Ploss='     num2str(Tst) 'W' newline newline])