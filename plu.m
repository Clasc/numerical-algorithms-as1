function [A, P] = plu(A, n)
    validateattributes(A, {"numeric"}, {'square'});
    validateattributes(n, {"numeric"}, {'square'});
    [am, an] = size(A);

    if (am != n || an != n)
        error("Matrix size is not the same as n!");
    endif

    for k = 1:(n - 1)

        %search p where%

        if (k <= i && i <= n)
            %|apk| >= |aik|
        endif

        if p != k then
            %interchange rows k and p
        endif

        if (akk = 0)
            continue; %with next k
        endif

        for i = k + 1:n
            %mik = aik/akk
        endfor

        for j = k + 1:n

            for i = k + 1:n
                aij = aij − mik * akj
            end for

        end for

    end for

    endfunction^
