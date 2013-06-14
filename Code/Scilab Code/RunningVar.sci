//found on the website: http://www.johndcook.com/standard_deviation.html
function runningVar = RunningVar(prevVar, prevMean, currMean, currValue, iterNum)
    s = prevVar + (currValue - prevMean).*(currValue - currMean)
    runningVar = CalcRunningVarFromS(s, iterNum)
endfunction

function runningVar = CalcRunningVarFromS(s, iterNum)
    runningVar = zeros(1, length(s));
    runningVar(iterNum > 1) = s(iterNum > 1)./(iterNum(iterNum > 1) -ones(1, length(iterNum(iterNum > 1))));
    runningVar(iterNum == 1) = 0;
endfunction