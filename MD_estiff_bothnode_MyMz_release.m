function [elk] = MD_estiff_bothnode_MyMz_release (A, E, L)

kA = E * A / L;
elk = zeros(12,12);
elk(1,1) = kA;
elk(7,7) = kA;
elk(7,1) = -kA;
elk(1,7) = -kA;



