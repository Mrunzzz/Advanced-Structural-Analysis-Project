function memb_id = MD_member_id(nnodes, nele, ends)
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
                % nnodes  = total number of nodes
                % nele    = total number of elements
                % ends    = gives the information about the start node id and
%                           end node id of every element
% 
% Output information
                % member_id = final matrix that contains the id's associated to each degree of freedom for every element
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
nnodesDOF = zeros(nnodes,6);
memb_id = zeros(nele,12);

% Calculating the nodes DOF id's for each node

for i =1:nnodes
    for j =1:6
        nnodesDOF(i,j) = (i - 1)*6 + j;
    end
end

% Calculating the memd_id for each element by stacking the nnodesDOF id's for the start node and end node along the rows

for i=1:nele
    member_node = ends(i,:);
    start_node = member_node(1);
    end_node = member_node(2);
    memb_id(i,:) = cat(2, nnodesDOF(start_node,:), nnodesDOF(end_node,:));
end
