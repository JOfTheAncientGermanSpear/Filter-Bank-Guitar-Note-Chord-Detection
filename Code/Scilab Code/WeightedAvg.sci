function weightedAvg = WeightedAvg(x1, x2, weights1, weights2)
    weightedAvgNum = (x1.*weights1 + x2.*weights2);
    weightedAvgDen = (weights1 + weights2);
    weightedAvg(weightedAvgDen ~= 0) = weightedAvgNum(weightedAvgDen ~= 0)./weightedAvgDen(weightedAvgDen ~= 0);
    weightedAvg(weightedAvgDen == 0) = 0;
endfunction