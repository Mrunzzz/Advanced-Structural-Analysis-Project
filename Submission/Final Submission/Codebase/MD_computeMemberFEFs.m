function memberlocalFEF = MD_computeMemberFEFs(w, L)
% Code developed by Mrunmayi Mungekar and Devasmit Dutta
% 
% MD_computeMemberFEFs.m computes the element stiffness matrix for a given element
%

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Functions Called
%              none
%
%  Dictionary of Variables
%  Input information
                % w = distributed load
                % L = length of the member
%                
% Output information
                % memberlocalFEF = fixed end forces in the local element directions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Take the load components along the local x', y', z' directions

      wx = w(1);
      wy = w(2);
      wz = w(3);

% Calculate the corresponding fixed end forces due to load in each local x', y', z' directions

      FEF_X = [-wx*L/2;0;0;0;0;0; -wx*L/2;0;0;0;0;0];
      FEF_Y = [0;-wy*L/2;0;0;0;-wy*L^2/12; 0;-wy*L/2;0;0;0;wy*L^2/12];
      FEF_Z = [0;0;-wz*L/2;0;wz*L^2/12;0; 0;0;-wz*L/2;0;-wz*L^2/12;0];

% Sum up to get the total fixed end forces

     FEF = FEF_X + FEF_Y + FEF_Z;
     memberlocalFEF = FEF;

end