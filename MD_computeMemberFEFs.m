function memberlocalFEF = MD_computeMemberFEFs(w, L)

      wx = w(1);
      wy = w(2);
      wz = w(3);

      FEF_X = [-wx*L/2;0;0;0;0;0; -wx*L/2;0;0;0;0;0];
      FEF_Y = [0;-wy*L/2;0;0;0;-wy*L^2/12; 0;-wy*L/2;0;0;0;wy*L^2/12];
      FEF_Z = [0;0;-wz*L/2;0;wz*L^2/12;0; 0;0;-wz*L/2;0;-wz*L^2/12;0];

     FEF = FEF_X + FEF_Y + FEF_Z;
     memberlocalFEF = FEF;

end