function [runningAvg, runningVar] = RunningAvgAndVar(prevAvg, prevVar, currValue, currValue1BasedIndx)
    runningAvg = RunningAvg(prevAvg, currValue, currValue1BasedIndx);
    runningVar = RunningVar(prevVar, prevAvg, runningAvg, currValue, currValue1BasedIndx)
endfunction