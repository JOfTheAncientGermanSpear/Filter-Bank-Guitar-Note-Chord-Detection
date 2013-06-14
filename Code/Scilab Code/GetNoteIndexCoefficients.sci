function [b, a] = GetNoteIndexCoefficients(noteIndex)
  //function [b, a] = GetLetterCoefficients(noteIndex)
  //gets the bandpass filter values for the letter
  //noteIndex should go from 0 to 11, where 0 is e and 11 is d#
  //-1 will be D# as well, 12 corresponds to the higher e
  
  select noteIndex
  case -1 then //low D#
    b = [0.0000274 0 -0.0000821 0 0.0000821 0 -0.0000274];
    a = [1 -2.8500276 5.5851626 -6.3267006 5.3608366 -2.6256424 0.8842691];
  case 0 then //e
    b = [0.0000324 0 -0.0000972 0 0.0000972 0 -0.0000324];
    a = [1 -2.515927 4.9801959 -5.4059194 4.7685446 -2.3065694 0.8778257];
  case 1 then //f
    b = [0.0000384 0 -0.0001152 0 0.0001152 0 -0.0000384];
    a = [1 -2.1518661 4.4059089 -4.4772968 4.2077953 -1.9626289 0.8710458];
  case 2 then //fs
    b = [0.0000455 0 -0.0001364 0 0.0001364 0 -0.0000455];
    a = [1 -1.7566519 3.8827095 -3.5450501 3.6980177 -1.5934254 0.8639266];
  case 3 then //g
    b = [0.0000539 0 -0.0001616 0 0.0001616 0 -0.0000539];
    a = [1 -1.329448 3.4344341 -2.6104294 3.2616092 -1.1989283 0.8564305];
  case 4 then //gs
    b = [0.0000638 0 -0.0001913 0 0.0001913 0 -0.0000638];
    a = [1 -0.8700027 3.0882994 -1.6705016 2.9239431 -0.779787 0.8485827];
  case 5 then //a
    b = [0.0000755 0 -0.0002264 0 0.0002264 0 -0.0000755];
    a = [1 -0.3787673 2.8739874 -0.716262 2.7122219 -0.3372843 0.8403276];
  case 6 then //as
    b = [0.0000893 0 -0.000268 0 0.000268 0 -0.0000893];
    a = [1 0.1428782 2.8226229 0.2685793 2.6546054 0.1263546 0.8316738];
  case 7 then //b
    b = [0.0001057 0 -0.000317 0 0.000317 0 -0.0001057];
    a = [1 0.6923231 2.9647252 1.3082974 2.7780906 0.6077935 0.8226015];
  case 8 then //c
    b = [0.000125 0 -0.0003749 0 0.0003749 0 -0.000125];
    a = [1 1.2654595 3.3273876 2.4345771 3.1058595 1.102372 0.8130964];
  case 9 then //cs
    b = [0.0001477 0 -0.0004432 0 0.0004432 0 -0.0001477];
    a = [1 1.8563386 3.9304188 3.6837467 3.6536742 1.6038684 0.8031443];
  case 10 then //d
    b = [0.0001746 0 -0.0005239 0 0.0005239 0 -0.0001746];
    a = [1 2.456806 4.7814411 5.0910078 4.4254096 2.1042667 0.7927314];
  case 11 then //ds
    b = [0.0002063 0 -0.0006189 0 0.0006189 0 -0.0002063];
    a = [1 3.0561227 5.8700851 6.6809404 5.4078977 2.5935405 0.7818445];
  case 12 then //high e
    b = [0.0002437 0 -0.000731 0 0.000731 0 -0.0002437];
    a = [1 3.640598 7.1617042 8.4541698 6.5655248 3.0594793 0.7704708];
  else
    print('not an acceptable value for noteIndex')
    break;
  end
endfunction