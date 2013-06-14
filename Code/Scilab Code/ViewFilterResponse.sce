function ViewFilterResponse(hz, Fs, numSamples)
  
  // We compute the frequency response of the filter
  [frq,repf]=repfreq(hz,0:.5/numSamples:0.5);
  repf(repf==0) = 10^(-16);
  [db_repf, phi_repf] = dbphi(repf);
  
  // And plot the bode like representation of the digital filter
  subplot(2,1,1);
  plot2d(Fs*frq,db_repf);
  xtitle('Obtained Frequency Response (Magnitude)');
  subplot(2,1,2);
  plot2d(Fs*frq,phi_repf);
  xtitle('Obtained Frequency Response (Phase in degree)');
  
  //or could do the below
//  [hzm,fr] = frmag(hz,numSamples);
//  plot(fr.*Fs,hzm);
//  xtitle('Obtained Frequency response);
endfunction