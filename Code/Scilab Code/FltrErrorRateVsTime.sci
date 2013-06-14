function FltrErrorRateVsTime(beginTimeMs, endTimeMs, msRes, Fs, testNoteIndex, freqRangeIndex)
    
  exec('GetNoteIndexCoefficients.sce', -1);
  exec('GetFreqRangeCoefficients.sce', -1);
  exec('GetNoteFrequency.sce', -1);
  exec('GenWave.sce', -1);
  exec('NoteDetection.sci', -1);
    
    samplF = 3675;
    
    numberOfTests = floor((endTimeMs - beginTimeMs)/msRes);
    falsePositivesHigh = zeros(1, numberOfTests);
    falsePositivesLow = zeros(1, numberOfTests);
    correctPositives = zeros(1, numberOfTests);
    
    vsHighNoteEnergies = zeros(1, numberOfTests);
    vsLowNoteEnergies = zeros(1, numberOfTests);
    lowNoteIndex = testNoteIndex - 1;
    if lowNoteIndex<0 then
        lowNoteIndex = 0;
    end
    highNoteIndex = testNoteIndex + 1;
    if highNoteIndex > 11 then
        highNoteIndex = 11;
    end
    lowFreq = GetNoteFrequency(freqRangeIndex, lowNoteIndex);
    testFreq = GetNoteFrequency(freqRangeIndex, testNoteIndex);
    highFreq = GetNoteFrequency(freqRangeIndex, highNoteIndex);
    
    index = 0;
    for msLength =beginTimeMs:msRes:endTimeMs
        sigLength = floor(msLength * samplF/1000);
        testSignal = GenWave(testFreq/samplF, 1, 0, sigLength);
        lowSignal = GenWave(lowFreq/samplF, 1, 0, sigLength);
        highSignal = GenWave(highFreq/samplF, 1, 0, sigLength);
        noteMatrix = NoteDetection(testSignal, testNoteIndex, freqRangeIndex);
        if noteMatrix(2) > noteMatrix(1) & noteMatrix(2)>noteMatrix(3) then
            correctPositives(index+1) = 1;
        else
            correctPositives(index+1) = -1;
        end
        index = index + 1;
    end
    msLengths = [beginTimeMs:msRes:endTimeMs];
    plot2d3('gnn',msLengths, correctPositives);
    v = gca();
    v.data_bounds = [beginTimeMs, endTimeMs, -2, 2];
    xtitle('Correct Detection Vs Time','Milliseconds', 'Correct/Incorrect');
endfunction