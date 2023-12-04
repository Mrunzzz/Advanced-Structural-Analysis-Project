function load_dof = MD_load_dof(concen, nnodes)

load_dof = concen';

load_dof = reshape(load_dof,nnodes*6,1);