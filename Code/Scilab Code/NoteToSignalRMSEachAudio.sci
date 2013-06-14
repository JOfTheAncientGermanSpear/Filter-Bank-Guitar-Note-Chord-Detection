function noteToSignalRMSVals = NoteToSignalRMSEachAudio()
    noteToSignalRMSVals = zeros(4,12);
    for stageIndex = 0:3
        for noteIndex = 0:11
            audioSample = LoadAudioSample(stageIndex, noteIndex);
            audioSample = PrepAudioForProcessing(audioSample, 44100);
            [passesFilter, noteToSignalRMS] = HasNote(audioSample, stageIndex, noteIndex);
            noteToSignalRMSVals(stageIndex + 1, noteIndex + 1) = noteToSignalRMS;
            //noteToSignalRMSVals(Convert2DIndexTo1D(stageIndex, noteIndex, 12) + 1) = noteToSignalRMS;
        end
    end
endfunction