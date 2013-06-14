function [stageIndexes, noteIndexes]=GetChordStagesAndNotes(chordName)
    select chordName
    case 'Amx02210', [stageIndexes, noteIndexes] = Amx02210StageNoteIndexes();
    case 'C9x32033', [stageIndexes, noteIndexes] = C9x32033StageNoteIndexes();
    case 'Cx32010', [stageIndexes, noteIndexes] = Cx32010StageNoteIndexes();
    case 'Dmxx0231', [stageIndexes, noteIndexes] = Dmxx0231StageNoteIndexes();
    case 'Dxx0232', [stageIndexes, noteIndexes] = Dxx0232StageNoteIndexes();
    case 'Em022000', [stageIndexes, noteIndexes] = Em022000StageNoteIndexes();
    case 'G320033', [stageIndexes, noteIndexes] = G320033StageNoteIndexes();
    end
endfunction

function [stageIndexes, noteIndexes] = Amx02210StageNoteIndexes()
    //Stage 0 A,  Stage 1 E, Stage 1 A, Stage 1 C, Stage 2 E
    stageIndexes = [0 1 1 1 2];
    noteIndexes = [5 0 5 8 0];
endfunction

function [stageIndexes, noteIndexes] = C9x32033StageNoteIndexes()
    //Stage 0 C, Stage 1 E, Stage 1 G, Stage 1 D, Stage 2 G
    stageIndexes = [0 1 1 1 2];
    noteIndexes = [8 0 3 10 3];
endfunction

function [stageIndexes, noteIndexes] = Cx32010StageNoteIndexes()
    //Stag 0 C, Stage 1 E, stage 1 G, Stage 1 C, Stage 2 E
    stageIndexes = [0 1 1 1 2];
    noteIndexes = [8 0 3 8 0];
endfunction

function [stageIndexes, noteIndexes] = Dmxx0231StageNoteIndexes()
    //Stage 0 D, Stage 1 A, Stage 1 D, Stage 2 F
    stageIndexes = [0 1 1 2];
    noteIndexes = [10 5 10 1];
endfunction

function [stageIndexes, noteIndexes] = Dxx0232StageNoteIndexes()
    //Stage 0 D, Stage 1 A, Stage 1 D, Stage 2 Fs
    stageIndexes = [0 1 1 2];
    noteIndexes = [10 5 10 2];
endfunction

function [stageIndexes, noteIndexes] = Em022000StageNoteIndexes()
    //Stage 0 E, Stage 0 B, Stage 1 E, Stage 1 G, Stage 1 B, Stage 2 E
    stageIndexes = [0 0 1 1 1 2];
    noteIndexes = [0 7 0 3 7 0];
endfunction

function [stageIndexes, noteIndexes] = G320033StageNoteIndexes()
    //G0 B0 D1 G1 D2 G2
    stageIndexes = [0 0 1 1 2 2];
    noteIndexes = [3 7 10 3 10 3];
endfunction