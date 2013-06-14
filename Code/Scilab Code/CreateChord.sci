function signal = CreateChord(freqRangesAndNoteIndexes, Fs, N)
  //function signal = CreateChord(freqRangesAndNoteIndexes, Fs, N)
  //freqRangesAndNoteIndexes is an array of frequency ranges', and notes', indexes
  //frequency ranges go from 0 to 3 with 0 being lowest
  //note indexes go from 0 to 11 with 0 being E and 11 being D#
  //for example the array [0 2, 1 4] will make a note with F# in range 0
  //and G# in range 1
  //Fs and N are the sampling frequency and number of samples, respectively
  
 
  FRAN = freqRangesAndNoteIndexes;
  analogFreqs = [];
  for index = 1:2:(length(FRAN)-1)
    analogFreqs = [analogFreqs GetFreqAtStageAndNote(FRAN(index),FRAN(index+1))];
  end
  
  
  signal = 0;
  for index = 1:length(analogFreqs)
    signal = signal + GenWave(analogFreqs(index)/Fs, 1, 0, N);
  end
  
endfunction