function obter_tensoes(iz, iy, area, forcas_pontuais, carregamentos_dist, torque_x, momento_z, r, R,E,G)
    if R == 0
        input("Seccao deve ser oca ou circular.");
        return;
    endif

    clc;
    dx = input("Insira o local da seccao (em m): ");
    Sy =  input("Digite Sy:\n")

    fprintf("Z maximo:\n");
    normal = tensao_normal(dx, 0, forcas_pontuais, carregamentos_dist, momento_z, area, iz, iy);
    cisalhamento = tensao_de_cisalhamento(dx, 0, R, forcas_pontuais, carregamentos_dist, torque_x, area, iz, iy, R, r);
    principais = tensoes_principais(normal, 0, cisalhamento);
    cisalhamento_maxima_absoluta = tensao_de_cisalhamento_maxima_absoluta(normal, 0, cisalhamento);
    fprintf("\tTensao normal: %f Pa\n", normal);
    fprintf("\tTensao de cisalhamento: %f Pa\n", cisalhamento);
    fprintf("\tTensoes principais: (%f Pa, %f Pa, %f Pa)\n", principais(1), principais(2), principais(3));
    fprintf("\tTensao de cisalhamento maxima absoluta: %f Pa\n", cisalhamento_maxima_absoluta);
    sx = normal;
    sy = 0;
    sz= 0;
    txy = cisalhamento;
    tyz = 0;
    tzx = 0;
    v = (E/(2*G))-1;
	ex = (1/E)*(sx - v*(sy + sz));
	ey = (1/E)*(sy - v*(sx + sz));
	ez = (1/E)*(sz - v*(sx + sy));
    ixy = (1/G)*txy;
	iyz = (1/G)*tyz;
	izx = (1/G)*tzx;
    fprintf("\tDeformacao ex: %f Pa\n", ex);
    fprintf("\tDeformacao ey: %f Pa\n", ey);
    fprintf("\tDeformacao ez: %f Pa\n", ez);
    fprintf("\tDeformacao Yxy: %f Pa\n", ixy);
    fprintf("\tDeformacao Yyz: %f Pa\n", iyz);
    fprintf("\tDeformacao Yzx: %f Pa\n", izx);
    p = principais;
    o = sqrt(max(p).^ 2 - min(p)*max(p) + min(p).^ 2);
    n_von = Sy/o;
    n_trc = Sy/(max(p)-min(p));
    fprintf("\tCoeficiente de seguranca Von Mises: %f Pa\n", n_von);
    fprintf("\tCoeficiente de seguranca Tresca: %f Pa\n", n_trc );

    fprintf("Z minimo:\n");
    normal = tensao_normal(dx, 0, forcas_pontuais, carregamentos_dist, momento_z, area, iz, iy);
    cisalhamento = tensao_de_cisalhamento(dx, 0, -R, forcas_pontuais, carregamentos_dist, torque_x, area, iz, iy, R, r);
    principais = tensoes_principais(normal, 0, cisalhamento);
    cisalhamento_maxima_absoluta = tensao_de_cisalhamento_maxima_absoluta(normal, 0, cisalhamento);
    fprintf("\tTensao normal: %f Pa\n", normal);
    fprintf("\tTensao de cisalhamento: %f Pa\n", cisalhamento);
    fprintf("\tTensoes principais: (%f Pa, %f Pa, %f Pa)\n", principais(1), principais(2), principais(3));
    fprintf("\tTensao de cisalhamento maxima absoluta: %f Pa\n", cisalhamento_maxima_absoluta);
    sx = normal;
    sy = 0;
    sz= 0;
    txy = cisalhamento;
    tyz = 0;
    tzx = 0;
    v = (E/(2*G))-1;
	ex = (1/E)*(sx - v*(sy + sz));
	ey = (1/E)*(sy - v*(sx + sz));
	ez = (1/E)*(sz - v*(sx + sy));
    ixy = (1/G)*txy;
	iyz = (1/G)*tyz;
	izx = (1/G)*tzx;
    fprintf("\tDeformacao ex: %f Pa\n", ex);
    fprintf("\tDeformacao ey: %f Pa\n", ey);
    fprintf("\tDeformacao ez: %f Pa\n", ez);
    fprintf("\tDeformacao Yxy: %f Pa\n", ixy);
    fprintf("\tDeformacao Yyz: %f Pa\n", iyz);
    fprintf("\tDeformacao Yzx: %f Pa\n", izx);
    p = principais;
    o = sqrt(max(p).^ 2 - min(p)*max(p) + min(p).^ 2);
    n_von = Sy/o;
    n_trc = Sy/(max(p)-min(p));
    fprintf("\tCoeficiente de seguranca Von Mises: %f Pa\n", n_von);
    fprintf("\tCoeficiente de seguranca Tresca: %f Pa\n", n_trc );

    fprintf("Y maximo:\n");
    normal = tensao_normal(dx, R, forcas_pontuais, carregamentos_dist, momento_z, area, iz, iy);
    cisalhamento = tensao_de_cisalhamento(dx, R, 0, forcas_pontuais, carregamentos_dist, torque_x, area, iz, iy, R, r);
    principais = tensoes_principais(normal, 0, cisalhamento);
    cisalhamento_maxima_absoluta = tensao_de_cisalhamento_maxima_absoluta(normal, 0, cisalhamento);
    fprintf("\tTensao normal: %f Pa\n", normal);
    fprintf("\tTensao de cisalhamento: %f Pa\n", cisalhamento);
    fprintf("\tTensoes principais: (%f Pa, %f Pa, %f Pa)\n", principais(1), principais(2), principais(3));
    fprintf("\tTensao de cisalhamento maxima absoluta: %f Pa\n", cisalhamento_maxima_absoluta);
    sx = normal;
    sy = 0;
    sz= 0;
    txy = cisalhamento;
    tyz = 0;
    tzx = 0;
    v = (E/(2*G))-1;
	ex = (1/E)*(sx - v*(sy + sz));
	ey = (1/E)*(sy - v*(sx + sz));
	ez = (1/E)*(sz - v*(sx + sy));
    ixy = (1/G)*txy;
	iyz = (1/G)*tyz;
	izx = (1/G)*tzx;
    fprintf("\tDeformacao ex: %f Pa\n", ex);
    fprintf("\tDeformacao ey: %f Pa\n", ey);
    fprintf("\tDeformacao ez: %f Pa\n", ez);
    fprintf("\tDeformacao Yxy: %f Pa\n", ixy);
    fprintf("\tDeformacao Yyz: %f Pa\n", iyz);
    fprintf("\tDeformacao Yzx: %f Pa\n", izx);
    p = principais;
    o = sqrt(max(p).^ 2 - min(p)*max(p) + min(p).^ 2);
    n_von = Sy/o;
    n_trc = Sy/(max(p)-min(p));
    fprintf("\tCoeficiente de seguranca Von Mises: %f Pa\n", n_von);
    fprintf("\tCoeficiente de seguranca Tresca: %f Pa\n", n_trc );

    fprintf("Y minimo:\n");
    normal = tensao_normal(dx, -R, forcas_pontuais, carregamentos_dist, momento_z, area, iz, iy);
    cisalhamento = tensao_de_cisalhamento(dx, -R, 0, forcas_pontuais, carregamentos_dist, torque_x, area, iz, iy, R, r);
    principais = tensoes_principais(normal, 0, cisalhamento);
    cisalhamento_maxima_absoluta = tensao_de_cisalhamento_maxima_absoluta(normal, 0, cisalhamento);
    fprintf("\tTensao normal: %f Pa\n", normal);
    fprintf("\tTensao de cisalhamento: %f Pa\n", cisalhamento);
    fprintf("\tTensoes principais: (%f Pa, %f Pa, %f Pa)\n", principais(1), principais(2), principais(3));
    fprintf("\tTensao de cisalhamento maxima absoluta: %f Pa\n", cisalhamento_maxima_absoluta);
    sx = normal;
    sy = 0;
    sz= 0;
    txy = cisalhamento;
    tyz = 0;
    tzx = 0;
    v = (E/(2*G))-1;
	ex = (1/E)*(sx - v*(sy + sz));
	ey = (1/E)*(sy - v*(sx + sz));
	ez = (1/E)*(sz - v*(sx + sy));
    ixy = (1/G)*txy;
	iyz = (1/G)*tyz;
	izx = (1/G)*tzx;
    fprintf("\tDeformacao ex: %f Pa\n", ex);
    fprintf("\tDeformacao ey: %f Pa\n", ey);
    fprintf("\tDeformacao ez: %f Pa\n", ez);
    fprintf("\tDeformacao Yxy: %f Pa\n", ixy);
    fprintf("\tDeformacao Yyz: %f Pa\n", iyz);
    fprintf("\tDeformacao Yzx: %f Pa\n", izx);
    p = principais;
    o = sqrt(max(p).^ 2 - min(p)*max(p) + min(p).^ 2);
    n_von = Sy/o;
    n_trc = Sy/(max(p)-min(p));
    fprintf("\tCoeficiente de seguranca Von Mises: %f Pa\n", n_von);
    fprintf("\tCoeficiente de seguranca Tresca: %f Pa\n", n_trc );      


endfunction
