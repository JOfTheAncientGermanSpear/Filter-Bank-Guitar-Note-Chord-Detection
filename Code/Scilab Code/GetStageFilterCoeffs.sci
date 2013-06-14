function [b, a] = GetStageFilterCoeffs(rangeIndex)
  //function [b, a] = GetFreqRangeCoefficients(rangeIndex)
  //designs a low pass filter where a frequency range from 0
  //to the cutoff frequency that corresponds to rangeIndex
  //possible values for rangeIndex are 0 - 2
  //rangeIndex 2 - fc is 630
  //rangeIndex 1 - fc is 315
  //rangeIndex 0 - fc is 158
  //all filters are low-pass elliptical with ripples at .08 and .1
  //for passband and stopband respectively
  //Fs assumed to be 3675
  
  select rangeIndex
    case 2 then //fc is 630
      b = [0.1346513 -0.0539332 0.1426512 0.1426512 -0.0539332 0.1346513];
      a = [1 -2.3010585 3.3686574 -2.6991839 1.3921251 -0.3138015];
    case 1 then //fc is 315
      b = [0.0668468 -0.1503192 0.0926022 0.0926022 -0.1503192 0.0668468];
      a = [1 -4.0087999 6.8624017 -6.1735136 2.9095708 -0.5713992];
    case 0 then //fc is 158
      b = [0.03565792842704717 -0.09996242515106925 0.0646364 0.0646364 -0.0999624 0.03565792842704716];
      a = [1 -4.6079808 8.6127032 -8.1517869 3.9041338 -0.7564055];
    else
      print('not a valid input');
      break;
    end
  endfunction
  