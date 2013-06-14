function frequency = GetFreqAtStageAndNote(stage, note)
  //function frequency = GetFreqAtStageAndNote(stage, note)
  //returns the frequency of a note at the given stage and note
  //stage corresponds to the four stages (0, 1, 2, 3)
  //stage 0 is the lowest frequency, 3 is the highest
  //note is an index for the note desired
  //note goes from 0 to 11, where 0 is E and 11 is D#
  //for example (1,0) returns 164.81 hz
  //lowest possible note available is (0,0) which corresponds to 82.41
  baseFreq = 82.406889; //110*2^(-5/12) (A's are integers)
  frequency = baseFreq * 2^(stage + note/12);
  endfunction