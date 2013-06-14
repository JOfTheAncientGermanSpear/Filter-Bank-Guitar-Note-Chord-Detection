function [chordNames, falsePosRates]= FalsePosRateChordSamples()
    chordNames = GetChordNames();
    numOfChords = length(length(chordNames));
    falsePosRates = zeros(1, numOfChords);
    
    for currChordIndx = 1:numOfChords
        [falsePosChords, falsePosCount] = GetFalsePosForChord(currChordIndx)
        falsePosRates(currChordIndx) = falsePosCount/(numOfChords - 1);
    end
endfunction

function [falsePosChords, falsePosCount]=GetFalsePosForChord(chordIndx)
    chords = GetChordNames();
    chordToTest = chords(chordIndx);
    numOfChords = length(length(chords));
    falsePosCount = 0;
    for possFalsePosChordIndx = 1:numOfChords
        if(possFalsePosChordIndx~=chordIndx) then
            mprintf('%d', possFalsePosChordIndx);
            possFalsePosChord = chordNames(possFalsePosChordIndx);
            if(AudioHasChordByName(chordToTest, possFalsePosChord)) then
                falsePosCount = falsePosCount + 1;
                falsePosChords(falsePosCount) = possFalsePosChord
            end
        end
    end
    if (falsePosCount<1) then falsePosChords = ""; end;
endfunction