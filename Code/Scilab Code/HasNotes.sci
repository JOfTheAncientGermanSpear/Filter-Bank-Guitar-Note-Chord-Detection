function [hasNotes, noteToSignalRatios] = HasNotes (signal, stageIndexes, noteIndexes)

    if (~IsStagesAndNotesSameLen()) then
        mprintf('noteIndexes and stage indexes need to be the same length');
    end
    
    numberOfNotes = length(noteIndexes);
    hasNotes = zeros(1, numberOfNotes);
    noteToSignalRatios = zeros(1, numberOfNotes);
    for currentNoteIndx = 1:numberOfNotes
        [hasNotes(currentNoteIndx), noteToSignalRatios(currentNoteIndx)] = HasNote(signal, stageIndexes(currentNoteIndx), noteIndexes(currentNoteIndx));
    end
endfunction

function isStagesAndNotesSameLen = IsStagesAndNotesSameLen(noteIndexes, stageIndexes)
    isStagesAndNotesSameLen = (length(noteIndexes) == length(stageIndexes));
endfunction