function m = magnitude(x, y)  if(!isscalar(x) || !isscalar(y))    error("x or y isn't a scalar");  endif    m = max([x,y]) / min([x,y]);
endfunction
