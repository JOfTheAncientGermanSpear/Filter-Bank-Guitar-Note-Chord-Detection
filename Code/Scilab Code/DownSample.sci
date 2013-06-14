function downSampledSignal = DownSample(signal, downSampleAmount)
    downSampledSignal = signal(1:downSampleAmount:length(signal));
endfunction