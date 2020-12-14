function [M1,M2] = get_precondition(n, precon_type)  switch precon_type    case 'jacobi'         M1 = create_jacobi(n);        M2 = [];    case 'none'        M1 = [];        M2 = [];    otherwise        warning('Unexpected precondition type.')        M1 = [];        M2 = [];    end
endfunction
