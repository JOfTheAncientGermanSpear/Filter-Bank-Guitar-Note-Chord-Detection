function [signal] = GenWave(f, a, phase, N)
  numwaves=length(f);
  t=[0:1:N-1];
  signal=0;
  for index=1:numwaves
    omega=2*%pi*f(index);
    phaseWPI = 2*%pi*phase(index);
    signal_comp=a(index) * cos(omega*t + phaseWPI);
    signal=signal_comp+signal;
  end
endfunction