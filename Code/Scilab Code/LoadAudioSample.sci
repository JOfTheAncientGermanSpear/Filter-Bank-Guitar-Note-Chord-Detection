function audioSample = LoadAudioSample(stageIndex, noteIndex)
    
    if(~IsStage3sDsharp(stageIndex, noteIndex)) then
            stageFolderName = GetStageFolderName(stageIndex);
            noteFileName = GetNoteFileName(noteIndex);
            fullAudioFileName = CreateFullAudioFileName(stageFolderName, noteFileName);
            audioSample = loadwave(fullAudioFileName);
        else
            audioSample = CreateStage3DsSignal();
     end
endfunction

function Stage3DsSignal =CreateStage3DsSignal()
    Stage3DsSignal = CreateChord([3 11], 44100, 22050);
endfunction

function isStage3Ds = IsStage3sDsharp(stageIndex, noteIndex)
    isStage3Ds = (stageIndex==3 & noteIndex ==11);
endfunction

function stageDirectory = GetStageFolderName(stageIndex)
    stageRankLabel = GetStageLabelFromIndex(stageIndex);
    stageDirectory = strcat([stageRankLabel, 'Stage']);
endfunction

function stageRankLabel =GetStageLabelFromIndex(stageIndex)
    select stageIndex
    case 0, stageRankLabel = 'Lowest';
    case 1, stageRankLabel = 'SecondLowest';
    case 2, stageRankLabel = 'SecondHighest';
    case 3, stageRankLabel = 'Highest';
    end
endfunction

function noteFileName = GetNoteFileName(noteIndex)
    select noteIndex
    case 0, noteFileName = 'E';
    case 1, noteFileName = 'F';
    case 2, noteFileName = 'Fs';
    case 3, noteFileName = 'G';
    case 4, noteFileName = 'Gs';
    case 5, noteFileName = 'A';
    case 6, noteFileName = 'As';
    case 7, noteFileName = 'B';
    case 8, noteFileName = 'C';
    case 9, noteFileName = 'Cs';
    case 10, noteFileName = 'D';
    case 11, noteFileName = 'Ds';
    end
    noteFileName = strcat([noteFileName,'.wav']);
endfunction

function fullAudioFileName = CreateFullAudioFileName(stageFolderName, noteFileName)
    fullAudioFileName = strcat(['..\..\Audio Samples\',stageFolderName,'\',noteFileName]);
endfunction