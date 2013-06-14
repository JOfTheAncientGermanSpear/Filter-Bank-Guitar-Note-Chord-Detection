function chordSample = LoadChordSample(chordName)
  chordsDirectory = GetChordsDirectory();
  chordFileName = GetChordFileName(chordName);
  chordSample = loadwave(strcat([chordsDirectory, chordFileName]));
//  chordSample = chordSample(1:length(chordSample)/4);
endfunction

function chordsDirectory = GetChordsDirectory()
  chordsDirectory = '..\..\Audio Samples\Chords\';
endfunction

function chordFileName = GetChordFileName(chordName)
    chordFileName = strcat([chordName, '.wav']);
endfunction