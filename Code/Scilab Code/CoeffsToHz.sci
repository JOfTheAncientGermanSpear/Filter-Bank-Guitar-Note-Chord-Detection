function hz = CoeffsToHz(b, a)
    bRev = b(length(b):-1:1);
    aRev = a(length(a):-1:1);
    bPoly = poly(bRev, 'z', 'coeff');
    aPoly = poly(aRev, 'z', 'coeff');
    hz = syslin('d', bPoly, aPoly);
endfunction