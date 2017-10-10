 % find the str exist in vocabulary list or not
    for i = 1:length(vocabList)
      if strcmp( vocabList{i} , str ) == 1
        word_indices = [word_indices ; i];
        break;
      end
    end
    % if str not exist in vocabulary list, this str will be skip.
