figuresemilogy(1:s3_iter, s3_res_vec, 1:nos5_iter, nos5_res_vec, 1:nos6_iter, nos6_res_vec);title("Conjugate Gradient method");xlabel("Iteration");ylabel("Relative residual");grid("on");legend("s3 Matrix", "nos5 Matrix", "nos6 Matrix" );