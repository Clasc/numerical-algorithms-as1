function [M1,M2] = get_precondition(A, precon_type, n)  switch precon_type    case 'jacobi'         M1 = create_jacobi(n);        M2 = [];    case 'ichol'        M1 = ichol(A);        M2 = M1';    case 'none'        M1 = [];        M2 = [];    otherwise        warning('Unexpected precondition type.')        M1 = [];        M2 = [];    end
endfunction
