function [hasChord, hasNotes, noteToSignalRatios] = AudioHasChordByName(audioChordName, testChordName)
    [stageIndexes, noteIndexes] = GetChordStagesAndNotes(testChordName);
    [hasChord, hasNotes, noteToSignalRatios] = AudioHasChord(audioChordName, stageIndexes, noteIndexes);
endfunction