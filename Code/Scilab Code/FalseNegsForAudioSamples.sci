function falseNegs = FalseNegsForAudioSamples()
    //tests each audio sample with the associated filter
    //falsenegs is the array for which the samples does
    //not pass it's associated note filter
    
    falseNegs = zeros(1,48);
    for stageIndex = 0:3
        for noteIndex = 0:11
            audioSample = LoadAudioSample(stageIndex, noteIndex);
            audioSample = PrepAudioForProcessing(audioSample, 44100)
            passesFilter = HasNote(audioSample, stageIndex, noteIndex);
            falseNegs(Convert2DIndexTo1D(stageIndex, noteIndex, 12) + 1) = ~passesFilter;
        end
    end
endfunction