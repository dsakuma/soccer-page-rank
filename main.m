fprintf('Inicio script\n')

A = [0, 0, 1/1, 0;
       1/2, 0, 0, 0;
       1/2, 1/1, 0, 1/1;
       0, 0, 0, 0];


p = page_rank(A);
p


fprintf('Fim script\n')