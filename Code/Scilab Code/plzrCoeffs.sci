function plotHndl = plzrCoeffs (num, den)
    exec('CoeffsToHz.sci', -1);
    hz = CoeffsToHz(num, den);
    plotHndl = plzr(hz);
endfunction