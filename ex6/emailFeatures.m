word_indice_vec = word_indices(:);
for i = 1:length(word_indice_vec)
  x(word_indice_vec(i)) = 1;
end
