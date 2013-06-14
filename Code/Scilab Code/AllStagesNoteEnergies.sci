function noteMatrix = AllStagesNoteEnergies(signal)
  //function noteMatrix = NoteDetection(signal)
  //returns a 4x12 matrix for the values of each note
  //the first column is the lowest pitch stage
  //the first row is the e values
  //the most bottom row is the d# values
  //each note is normalized to the max note in the stage
  //assuming the input Fs is 3675
  
  
  exec('CalcNoteFiltersEnergies.sci', -1);
  exec('GetStageFilterCoeffs.sci', -1);
  
  noteMatrix = zeros(12,4);
  noteMatrix(:,4) = CalcNotesEnergy(signal);
  
  for index = 0:2
    [b, a] = GetFreqRangeCoefficients(index);
    filteredSignal = filter(b, a, signal);
    filteredSignal = filteredSignal(1:(2^(3-index)):length(filteredSignal));
    noteMatrix(:,index + 1) = CalcNotesEnergy(filteredSignal);
  end
  
endfunction
