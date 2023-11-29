function gamma = MD_etran(coordi, coordj, webdir)

    

    small_gamma = zeros(3,3);
    small_gamma(2,:) = webdir;

    L = norm(coordj-coordi);

    for i=1:3
        small_gamma(1,i) = (coordj(i)-coordi(i))/L;
    end

    small_gamma(3,:) = cross(small_gamma(1,:),small_gamma(2,:));

    gamma_temp = repmat({small_gamma}, 1, 4);
    gamma = blkdiag(gamma_temp{:});

