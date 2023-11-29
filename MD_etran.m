function [gamma] = MD_etran (coordi, coordj, webdir)


global_x = [1 ;0 ;0];
global_y = [0 ;1 ;0];
global_z = [0 ;0 ;1];

local_x = coordj - coordi
local_y = webdir
local_z = cross(local_x,local_y)

phixx = acos(dot(local_x,global_x)/(norm(local_x)*norm(global_x)))
phixy = acos(dot(local_x,global_y)/(norm(local_x)*norm(global_y)))
phixz = acos(dot(local_x,global_z)/(norm(local_x)*norm(global_z)))
phiyx = acos(dot(local_y,global_x)/(norm(local_y)*norm(global_x)))
phiyy = acos(dot(local_y,global_y)/(norm(local_y)*norm(global_y)))
phiyz = acos(dot(local_y,global_z)/(norm(local_y)*norm(global_z)))

thetaxx = phixx
thetaxy = phixy
thetaxz = phixz
thetayx = phiyx
thetayy = phiyy
thetayz = phiyz
	
mat = [cos(thetaxx) cos(thetaxy) cos(thetaxz);
	   cos(thetayx) cos(thetayy) cos(thetayz);
       zeros(1,3)]

mat(3,:) = cross(mat(1,:),mat(2,:));
G = mat;
	
gamma = [   G                  zeros(3,9);
	     zeros(3,3)      G     zeros(3,6);
	     zeros(3,6)      G     zeros(3,3);
		 zeros(3,9)            G]
