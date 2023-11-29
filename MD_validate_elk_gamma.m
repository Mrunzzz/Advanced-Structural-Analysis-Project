A = 10;
Izz = 100;
Iyy = 20;
J = 1;
Ayy = 8;
Azz = 2;
v = 0.3;
L = 120*sqrt(2);
E = 29e3;

% Print element stiffness matrix

elk = MD_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L)

coordi = [0;0;0];
coordj = [120;120;0];
webdir = [-1/sqrt(2); 1/sqrt(2); 0];

% Print element transformation matrix

gamma = MD_etran(coordi, coordj, webdir)

% Print global transformation matrix

globalk = gamma'*elk*gamma
