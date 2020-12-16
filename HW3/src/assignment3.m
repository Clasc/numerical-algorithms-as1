%plot_cg_v_pcg("nos6.mtx", 'jacobi');
% plot_cg_tol_relres("nos6.mtx", 'jacobi');
plot_process_time("nos6.mtx", 'jacobi');

%plot_cg_v_pcg("nos6.mtx", 'ichol');
% plot_cg_tol_relres("nos6.mtx",  'ichol');
plot_process_time("nos6.mtx", 'ichol');

%plot_cg_v_pcg("nos6.mtx", 'ichol.ict');
%plot_cg_tol_relres("nos6.mtx",  'ichol.ict');
plot_process_time("nos6.mtx", 'ichol.ict');


plot_all("nos6.mtx");
plot_all("nos5.mtx");
p_s3();


