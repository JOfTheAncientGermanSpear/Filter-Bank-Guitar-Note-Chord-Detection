function [chordNames, isFalseNegs] = FalseNegsForChordSamples()
    chordNames = GetChordNames();
    numOfChords = length(length(chordNames));
    isFalseNegs = zeros(1, numOfChords);

    for currChordIndx = 1:numOfChords
        currChord = chordNames(currChordIndx);
        isFalseNegs(currChordIndx) = ~AudioHasChordByName(currChord, currChord);
    end
endfunction