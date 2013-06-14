function [hasNote, noteToSignalRatio] =HasNote(signal, stageIndex, noteIndex)
    //hasNote =HasNote(signal, stageIndex, noteIndex)
    //tests if the signal has note of stageIndex and noteIndex
    //stageIndex goes from 0 to 3, where 0 is lowest
    //noteIndex goes from 0 to 11, where 0 is E and 11 is Ds
    nsrValuesNearNote = Calc3NoteToSignalRatios(signal, noteIndex, stageIndex);
    noteToSignalRatio = nsrValuesNearNote(2);
    hasNote = (noteToSignalRatio>nsrValuesNearNote(1) & noteToSignalRatio>nsrValuesNearNote(3));
endfunction