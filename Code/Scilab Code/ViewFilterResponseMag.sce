function [xm, fr] = ViewFilterResponseMag(hz, Fs, numSamples)
  
  [xm, fr] = frmag(hz, numSamples);
  
  fr = fr.*Fs;
  
  plot(fr, xm)
  xtitle('Frequency Response', 'Frequency', 'Magnitude')
endfunction