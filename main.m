%========== Inicializacao
clear ; close all; clc


fprintf('Inicio script\n')

[F, p] = adjacency();

pr = page_rank(F);

[pr_sort, pr_index] = sort(pr, "descend");


sorted_p = p(pr_index);

i = 1;
for i = 1:size(sorted_p)
  result.(sorted_p{i}(1:end)) = pr_sort(i);
end

% for i = 1:size(p)
%   result.(p{i}(1:end)) = pr(i);
% endfor

result

fprintf('Fim script\n')