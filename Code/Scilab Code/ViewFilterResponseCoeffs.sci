function [xm, fr] = ViewFilterResponseCoeffs(num, den, Fs, numSamples)
    exec('CoeffsToHz.sci', -1);
    exec('ViewFilterResponseMag.sce', -1);
    hz = CoeffsToHz(num, den);
    [xm, fr] = ViewFilterResponseMag(hz, Fs, numSamples);
endfunction
