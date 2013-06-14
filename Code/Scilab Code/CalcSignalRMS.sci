function rmsValue = CalcSignalRMS(signal)
    signalSquared = signal.^2;
    meanSquared = mean(signalSquared);
    rmsValue = sqrt(meanSquared);
endfunction