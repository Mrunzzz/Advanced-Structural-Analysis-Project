function load_dof = MD_load_dof(concen, nnodes)
[d1, d2] = size(concen);
load_dof = zeros(d2,d1);

for i=1:d2
    for j=1:d1
      load_dof(i,j) = concen(j,i);
    end
end

load_dof = reshape(load_dof,nnodes*6,1);