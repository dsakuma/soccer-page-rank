fprintf('Inicio script\n')

[F, p] = adjacency();

pr = page_rank(F);

for i = 1:size(p)
  result.(p{i}(1:end)) = pr(i);
endfor

result

fprintf('Fim script\n')