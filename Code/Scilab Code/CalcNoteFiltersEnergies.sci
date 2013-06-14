function noteValues = CalcNoteFiltersEnergies(signal)
  //function noteVector = CalculateNotesEnergy(signal)
  //returns a 1x12 array with values equal to the 
  //energy for each note in the signal
  //the energy is defined as the sum(abs(filteredSignalForNote)
  
  noteValues = zeros(12,1);
  for i = 0:11
    [b, a] = GetNoteIndexCoefficients(i);
    filteredSignal = filter(b,a,signal);
    noteValues(i+1)=sum(abs(filteredSignal));
  end
endfunction
