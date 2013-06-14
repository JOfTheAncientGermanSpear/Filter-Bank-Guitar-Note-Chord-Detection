function PlotNoteIdentifVsTimeRes(beginTimeMs, endTimeMs, msRes, stageIndex, noteIndex)
    
    samplF = 3675;
    
    numberOfTests = floor((endTimeMs - beginTimeMs)/msRes);
    noteIdentifiedTests = zeros(1, numberOfTests);
    
    testFreq = GetFreqAtStageAndNote(stageIndex, noteIndex);
    testFreqDig = testFreq/samplF;
    
    index = 0;
    for msLength =beginTimeMs:msRes:endTimeMs
        index = index + 1;
        sigLength = floor(msLength * samplF/1000);
        testSignal = GenWave(testFreq/samplF, 1, 0, sigLength);
        if (HasNote(testSignal, stageIndex, noteIndex)) then
            noteIdentifiedTests(index) = 1;
        else
            noteIdentifiedTests(index) = -1;
        end
    end
    possibleMS = beginTimeMs:msRes:endTimeMs;
    plot(possibleMS, noteIdentifiedTests);
    a = get("current_axes");
    a.data_bounds = [possibleMS(1), -1.5; possibleMS(length(possibleMS)), 1.5];
endfunction