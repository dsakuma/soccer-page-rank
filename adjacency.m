function F = adjacency()

% F -> pesos
% G -> numero de jogos
% L -> numero de derrotas
% W -> numero de vitorias
% C -> numero de gols sofridos
% S -> numero de gols marcados
% D -> numero de empates
% g -> maximo numero de jogos entre qualquer match-up pair

G = [0,1,0,1;
     1,0,1,0;
     0,1,0,1;
     1,0,1,0];

L = [0,1,0,1;
     0,0,1,0;
     0,0,0,1;
     0,0,0,0];

% cuidado com nan
F = L ./ G;


%tmp
F = [0, 0, 1/1, 0;
       1/2, 0, 0, 0;
       1/2, 1/1, 0, 1/1;
       0, 0, 0, 0];


end