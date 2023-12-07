function load_dof = MD_load_dof(concen, nnodes)
% Code developed by Mrunmayi Mungekar and Devasmit Dutta
%
% MD_member_id.m computes the id's associated to each degree of freedom for every element
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Functions Called
%              none
% Dictionary of variables 
% Input information
                % concen = gives the applied load information along each DOF at every node
                % nnodes = total number of nodes
% 
% Output information
                % load_dof = final load_dof vector 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Taking the transpose of concen matrix for getting the loads associated with each DOF at every node along the rows

load_dof = concen';

% Stacking vertically the load data at each node along the rows for obtaining the final applied load vector

load_dof = reshape(load_dof,nnodes*6,1);