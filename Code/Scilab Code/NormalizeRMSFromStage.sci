function normalizedRMS = NormalizeRMSFromStage(unNormalizedRMS, stageIndex)
    //stageIndex goes from 0 to 3, where 0 is lowest
    normalizedRMS = unNormalizedRMS * 2^(3-stageIndex);
endfunction