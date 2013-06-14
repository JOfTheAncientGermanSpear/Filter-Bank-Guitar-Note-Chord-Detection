function [hasChord, hasNotes, noteToSignalRatios] = AudioHasChord(audioChordName, stageIndexes, noteIndexes)
    audioChordSignal = LoadChordSample(audioChordName);
    audioChordSignal = PrepAudioForProcessing(audioChordSignal, 44100);
    [hasChord, hasNotes, noteToSignalRatios] = HasChord(audioChordSignal, stageIndexes, noteIndexes);
endfunction