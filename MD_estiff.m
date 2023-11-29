function [elk] = MD_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L)
% A = 1;Izz=1;Iyy=1;J=1;Ayy=1;Azz=1;E=1;v=1;L=1;
% syms A Izz Iyy J Ayy Azz E G L
G = E/(2+2*v);

elk_temp = zeros(12,12);

kA = E*A/L;
kJ = G*J/L;
etaz = E*Izz/(Azz*G);
etay = E*Iyy/(Ayy*G);

elk_temp(:,1) = [kA;0;0;0;0;0;-kA;0;0;0;0;0];

elk_temp(:,2) = E*Izz*[0;1;0;0;0;L/2;0;-1;0;0;0;L/2]/(L*(L^2/12+etaz));

elk_temp(:,3) = E*Iyy*[zeros(2,1);1;0;-L/2;0;0;0;-1;0;-L/2;0]/(L*(L^2/12+etay));

elk_temp(:,4) = [zeros(3,1);kJ;0;0;0;0;0;-kJ;0;0];

elk_temp(:,5) = E*Iyy*[zeros(4,1);(L^2/3 + etay);0;0;0;-L/2;0;(L^2/6-etay);0]/(L*(L^2/12+etay));

elk_temp(:,6) = E*Izz*[zeros(5,1);(L^2/3 + etaz);0;-L/2;0;0;0;(L^2/6-etaz)]/(L*(L^2/12+etaz));

elk_temp(:,7) = [zeros(6,1);kA;0;0;0;0;0];

elk_temp(:,8) = E*Izz*[zeros(7,1);1;0;0;0;-L/2]/(L*(L^2/12+etay));

elk_temp(:,9) = E*Iyy*[zeros(8,1);1;0;-L/2;0]/(L*(L^2/12+etaz));

elk_temp(:,10) = [zeros(9,1);kJ;0;0];

elk_temp(:,11) = E*Iyy*[zeros(10,1);(L^2/3 + etay);0]/(L*(L^2/12+etay));

elk_temp(:,12) = E*Izz*[zeros(11,1);(L^2/3 + etaz)]/(L*(L^2/12+etaz));

[n,m] = size(elk_temp);
elk = elk_temp'+elk_temp;
elk(1:n+1:end)=diag(elk_temp);
