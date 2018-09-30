function text = test(word1, word2, word3, model, word_num = 100)

text = [word1, " ", word2, " ", word3];
c = 3;

for i =  1:word_num
  next_possible_words = predict_next_word(word1, word2, word3, model, c);
  num = ceil(rand(1) * c);
  word1 = word2;
  word2 = word3;
  word3 = next_possible_words{num};

  if ispunct(word1)(1) == 1 || strcmp(word3, word2) == 1
    new_num = mod(num, c) + 1;
    while(ispunct(word3)(1) == 1 && new_num != num)
      word3 = model.vocab{new_num};
      new_num = mod(new_num, c) + 1;
    endwhile
  endif

  if ispunct(word2)(1) == 1
    s = size(model.vocab, 2);
    while(ispunct(word3)(1) == 1)
      word3 = model.vocab{ceil(rand(1) * s)};
    endwhile
  endif

  if ispunct(word3)(1) == 1
    text = cstrcat(text, word3);
  else
    text = cstrcat(text, " ", word3);
  endif
end

printf('\n');