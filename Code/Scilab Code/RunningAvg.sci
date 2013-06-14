function runningAvg = RunningAvg(prevAvg, currValue, currValue1BasedIndx)
    runningAvg = prevAvg + (currValue-prevAvg)./currValue1BasedIndx;
endfunction