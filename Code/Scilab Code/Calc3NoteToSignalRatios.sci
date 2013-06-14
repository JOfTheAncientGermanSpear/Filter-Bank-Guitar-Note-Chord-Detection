function NoteToSignalRatios = Calc3NoteToSignalRatios(signal, noteIndex, stageIndex)
    //returns a 1x3 matrix of the rmv values near note with
    //index 1 the lower note NSR, index 2 the tested note NSR,
    //and index 3 the higher note NSR
    //set freqRangeIndex can be 0, 1, 2, 3
    //where 0 is the lowest frequency stage
       
    signalRMS = CalcSignalRMS(signal); 
    signalStageFltrd = StageFilter(signal, stageIndex);
    
    NoteToSignalRatios = zeros(1,3);
    lowNoteIndex = noteIndex - 1;
    highNoteIndex = noteIndex + 1;
    for i = lowNoteIndex:1:highNoteIndex
        [bNote, aNote] = GetNoteIndexCoefficients(i);
        noteComponent = filter(bNote,aNote,signalStageFltrd);
        noteRMS=CalcSignalRMS(noteComponent);
        currentIndex = i - lowNoteIndex + 1;
        ShowIfNoteRmsGTSignalRMS(noteRMS, signalRMS, currentIndex, stageIndex)
        NoteToSignalRatios(currentIndex) = (noteRMS/signalRMS);
    end
    
endfunction

function ShowIfNoteRmsGTSignalRMS(noteRMS, signalRMS, noteIndex, stageIndex)
        if (noteRMS>signalRMS) then
            mprintf('note and stage are %d and %d \n', noteIndex, stageIndex);
            mprintf('noteRMS is %3.5f \n', noteRMS);
            mprintf('signalRMS is %3.5f \n', signalRMS);
        end
endfunction