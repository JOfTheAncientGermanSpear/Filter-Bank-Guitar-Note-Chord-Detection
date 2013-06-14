function [falsePosRates, falsePosRMS, falsePosVar] = FalsePosRateAudioSamples()
    falsePosRates = zeros(1, 95);
    [falsePosHits, falsePosRMS, falsePosVar] = TotalFalsePosHits();
    falsePosRates = falsePosHits./GetNumOfExecutions();
endfunction

function [totalFalsePosHits, falsePosRMSMean, falsePosRMSVar] = TotalFalsePosHits()
    totalFalsePosHits = zeros(1, 95);
    falsePosRMSMean = zeros(1, 95);
    falsePosRMSVar = zeros(1, 95);
    for audioStageIndex = 0:3
        [falsePosStageHits, falsePosRMSStageMean, falsePosRMSStageVar] = FalsePosForStage(audioStageIndex);
        falsePosRMSMean = WeightedAvg(falsePosRMSMean, falsePosRMSStageMean, totalFalsePosHits, falsePosStageHits);
        falsePosRMSVar = WeightedAvg(falsePosRMSVar, falsePosRMSStageVar, totalFalsePosHits, falsePosStageHits);
        totalFalsePosHits = falsePosStageHits + totalFalsePosHits;
    end
endfunction

function [falsePosStageHits, falsePosRMSStageMean, falsePosRMSStageVar] = FalsePosForStage(audioStageIndex)
    falsePosStageHits = zeros(1, 95);
    falsePosRMSStageVar = zeros(1, 95);
    falsePosRMSStageMean = zeros(1, 95);
    for audioNoteIndex = 0:11
        [falsePosCurrAudio, falsePosCurrAudioRMS] = FalsePosForAudioNote(audioStageIndex, audioNoteIndex)
        falsePosCurrAudio95 = PlaceInLength95Signal(falsePosCurrAudio, audioStageIndex, audioNoteIndex);
        falsePosCurrAudioRMS95 = PlaceInLength95Signal(falsePosCurrAudioRMS, audioStageIndex, audioNoteIndex);
        falsePosStageHits = falsePosCurrAudio95 + falsePosStageHits;
        [falsePosRMSStageMean, falsePosRMSStageVar] = UpdateAvgAndVarAtIndxs(falsePosRMSStageMean, falsePosRMSStageVar, falsePosCurrAudioRMS95, falsePosStageHits, (falsePosCurrAudio95>0));
    end
endfunction

function [runningAvg, runningVar] = UpdateAvgAndVarAtIndxs(prevAvg, prevVar, currValues, updateCounts, updateIndexes)
    prevAvgToUse = prevAvg(updateIndexes);
    prevVarToUse = prevVar(updateIndexes);
    updateCountsToUse = updateCounts(updateIndexes);
    currValuesToUse = currValues(updateIndexes);
    [runningAvgToUpdate, runningVarToUpdate] = RunningAvgAndVar(prevAvgToUse, prevVarToUse, currValuesToUse, updateCountsToUse);
    runningAvg = prevAvg;
    runningVar = prevVar;
    runningAvg(updateIndexes) = runningAvgToUpdate;
    runningVar(updateIndexes) = runningVarToUpdate;
endfunction

function [falsePositives, falsePosRMS] =FalsePosForAudioNote (audioStageIndex, audioNoteIndex)
    audioSample = LoadAudioSample(audioStageIndex, audioNoteIndex);
    audioSample = PrepAudioForProcessing(audioSample, 44100)
    [falsePositives, falsePosRMS] = FalsePosInSignal(audioSample, audioStageIndex, audioNoteIndex);
endfunction

function numOfExecutions = GetNumOfExecutions()
    numOfExecutions1to48 = [1:48];
    numOfExecutions47to1 = [47:-1:1];
    numOfExecutions = [numOfExecutions1to48 numOfExecutions47to1];
endfunction

function [falsePositives, falsePosRMS] = FalsePosInSignal(signal, signalStageIndex, signalNoteIndex)
    falsePositives = zeros(1, 48);
    falsePosRMS = zeros(1, 48);
    for stageIndex = 0:3
        for noteIndex = 0:11
//            if(stageIndex~=signalStageIndex | noteIndex~=signalNoteIndex) then
                [hasNote, noteRMS] = HasNote(signal, stageIndex, noteIndex);
                falsePositives(Convert2DIndexTo1D(stageIndex, noteIndex, 12) + 1) = hasNote;
                if(hasNote) then
                  falsePosRMS(Convert2DIndexTo1D(stageIndex, noteIndex, 12) + 1) = noteRMS;
                end
//            end
        end
    end
endfunction

function normalizedHits = PlaceInLength95Signal(falsePosHitsForNote, stageIndex, noteIndex)
    normalizedHits = zeros(1, 95);
    startIndex = -1*Convert2DIndexTo1D(stageIndex, noteIndex, 12) + 48;
    mprintf('start index is %d \n', startIndex);
    normalizedHits(startIndex:(startIndex + 47)) = falsePosHitsForNote;
endfunction