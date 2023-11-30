% Code developed by Mrunmayi Mungekar and Devasmit Dutta
% MD_validate_elk_gamma validates the results from the two functions MD_estiff and MD_etran
%  Functions Called
%              none
%
%  Dictionary of Variables
                % A = cross-sectional area
                % Izz = moment of inertia about local z-axis
                % Iyy = moment of inertia about local y-axis
                % J = torsional constant
                % Ayy = shear area along local y-axis
                % Azz = shear area along local z-axis
                % v = Poisson's ratio
                % L = length of element
                % E = Young's modulus
                % coordi = coordinates of 1st-node
                % coordj = coordinates of 2nd-node
                % webdir = element's unit web vector
                % gamma = local-to-global transformation matrix
                % elk = element stiffness matrix
                % globalk = global stiffness matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define material and geometric variables

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

elk = MD_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L);
disp('Element Stiffness Matrix')
disp(elk)

coordi = [0;0;0];
coordj = [120;120;0];
webdir = [-1/sqrt(2); 1/sqrt(2); 0];

% Print element transformation matrix

gamma = MD_etran(coordi, coordj, webdir);
disp('Element Transformation Matrix')
disp(gamma)

% Print global transformation matrix

globalk = gamma'*elk*gamma;
disp('Global Stiffness Matrix')
disp(globalk)
