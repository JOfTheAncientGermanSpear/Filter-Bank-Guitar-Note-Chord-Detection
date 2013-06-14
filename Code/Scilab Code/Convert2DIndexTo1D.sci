function OneDIndx = Convert2DIndexTo1D(rowNum, colNum, numberOfCols)
        OneDIndx = rowNum * numberOfCols + colNum;
endfunction