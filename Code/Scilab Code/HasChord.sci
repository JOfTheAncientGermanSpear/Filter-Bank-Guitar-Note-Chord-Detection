function [hasChord, hasNotes, noteToSignalRatios] = HasChord(signal, stageIndexes, noteIndexes)
    [hasNotes, noteToSignalRatios] = HasNotes(signal, stageIndexes, noteIndexes);
    
    hasChord = IsEveryValueInVectorTrue(hasNotes);
endfunction

function isEveryValueInVectorTrue = IsEveryValueInVectorTrue(vector)
    isEveryValueInVectorTrue = (1>0);
    for vecIndex = 1:length(vector)
        isEveryValueInVectorTrue = vector(vecIndex) & isEveryValueInVectorTrue;
    end
endfunction