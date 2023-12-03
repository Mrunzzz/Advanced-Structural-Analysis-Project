function memb_id = MD_member_id(nnodes, nele, ends)
nnodesDOF = zeros(nnodes,6);
memb_id = zeros(nele,12);

for i =1:nnodes
    for j =1:6
        nnodesDOF(i,j) = (i - 1)*6 + j;
    end
end

for i=1:nele
    member_node = ends(i,:);
    start_node = member_node(1);
    end_node = member_node(2);
    memb_id(i,:) = cat(2, nnodesDOF(start_node,:), nnodesDOF(end_node,:));
end
