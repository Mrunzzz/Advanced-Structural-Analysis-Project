function [elk] = MD_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L)

G = E/(2+2*v);

elk_temp = zeros(12,12);

kA = E*A/L;
kJ = G*J/L;
etaz = E*Iyy/(Azz*G);
etay = E*Izz/(Ayy*G);

elk_temp(:,1) = [kA;0;0;0;0;0;-kA;0;0;0;0;0];

elk_temp(:,2) = E*[0;
                Izz/(L*((L^2/12) + etay));
                0;
                0;
                0;
                (L/2)*(Izz/(L*((L^2/12) + etay)));
                0;
                -Izz/(L*((L^2/12) + etay));
                0;
                0;
                0;
                (L/2)*(Izz/(L*((L^2/12) + etay)))];

elk_temp(:,3) = E*[0;
                0;
                Iyy/(L*((L^2/12) + etaz));
                0;
                -(L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0;
                0;
                0;
                -Iyy/(L*((L^2/12) + etaz));
                0;
                -(L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0];

elk_temp(:,4) = [zeros(3,1);kJ;0;0;0;0;0;-kJ;0;0];

elk_temp(:,5) = E*[zeros(2,1);
                -(L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0;
                (L^2/3 + etaz)*(Iyy/(L*((L^2/12) + etaz))); 
                0;
                0;
                0;
                (L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0;
                ((L^2/6) - etaz)*(Iyy/(L*((L^2/12) + etaz)));
                0;]

elk_temp(:,6) = E*[zeros(1,1);
                (L/2)*(Izz/(L*((L^2/12) + etay)));
                0;
                0;
                0;
                (L^2/3 + etay)*(Izz/(L*((L^2/12) + etay))); 
                0;
                -(L/2)*(Izz/(L*((L^2/12) + etay)));
                0;
                0;
                0;
                ((L^2/6) - etay)*(Izz/(L*((L^2/12) + etay)));
                ]

elk_temp(7:12,7) = [kA;0;0;0;0;0];

elk_temp(7:12,8) = E*[0;
                Izz/(L*((L^2/12) + etay));
                0;
                0;
                0;
                -(L/2)*(Izz/(L*((L^2/12) + etay)))]

elk_temp(7:12,9) = E*[0;
                0;
                Iyy/(L*((L^2/12) + etaz));
                0;
                (L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0]

elk_temp(7:12,10) = [zeros(3,1);kJ;0;0];

elk_temp(7:12,11) = E*[zeros(2,1);
                (L/2)*(Iyy/(L*((L^2/12) + etaz)));
                0;
                (L^2/3 + etaz)*(Iyy/(L*((L^2/12) + etaz))); 
                0]

elk_temp(7:12,12) = E*[zeros(1,1);
                -(L/2)*(Izz/(L*((L^2/12) + etay)));
                0;
                0;
                0;
                (L^2/3 + etay)*(Izz/(L*((L^2/12) + etay)))]

for i = 1:6
    for j = 7:12
        elk_temp(i,j) = elk_temp(j,i)
    end
end

elk = elk_temp;
