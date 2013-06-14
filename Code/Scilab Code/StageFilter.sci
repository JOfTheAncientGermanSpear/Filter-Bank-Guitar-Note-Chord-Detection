function signal = StageFilter(signal, stageIndex)
    //stageIndex can be 0, 1, 2, 3
    //where 0 is the lowest frequency stage
    
    
    if stageIndex > 2 then
        return signal;
    end
    [b, a] = GetStageFilterCoeffs(stageIndex);
    signal = filter(b, a, signal);
    signal = signal(1:(2^(3-stageIndex)):length(signal));
endfunction