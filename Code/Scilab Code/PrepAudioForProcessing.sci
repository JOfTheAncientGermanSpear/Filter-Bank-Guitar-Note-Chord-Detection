function signal =PrepAudioForProcessing(signal, SamplingFreq)
    signal = DownSampleTo3675(signal, SamplingFreq);
endfunction

function signalat3675 = DownSampleTo3675(signal, SamplingFreq)
    select SamplingFreq
    case 44100, signalat3675 = DownSample(signal, 12);
    case 22100, signalat3675 = DownSample(signal, 6);
    case 11050, signalat3675 = DownSample(signal, 3);
    end
endfunction