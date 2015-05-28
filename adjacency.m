function [F, p] = adjacency()

% F -> matriz de pesos
% G -> matriz de numero de jogos
% L -> matriz de derrotas
% W -> matriz de vitorias
% C -> matriz de gols sofridos
% S -> matriz de gols marcados
% D -> matriz de empates
% g -> maximo numero de jogos entre qualquer match-up pair
% p -> vetor de jogadores
% m -> numero total de jogos
% n -> numero de jogadores

%find(ismember(p, 'Paulo'))

[c1, c2, c3, c4] = textread("data_example.csv", '%s %s %d %d', 'delimiter', ',');

p = {"\"Paulo\""; "\"Sakuma\""; "\"Hugo\""; "\"Nakamashi\""; "\"Chagas\""};
m = size(c1,1);
n = size(p,1);
G = zeros(n);
L = zeros(n);

for i = 1:m
  p1 = find(ismember(p, c1{i}(1:end)));
  p2 = find(ismember(p, c2{i}(1:end)));

  % Preenchendo matriz de numero de jogos
  G(p1,p2) = G(p1,p2) + 1;
  G(p2,p1) = G(p2,p1) + 1;

  % Preenchendo matriz de derrotas
  if c4(i) < c3(i)
    L(p1,p2) = L(p1,p2) = 1;
  elseif c3(i) < c4(i)
    L(p2,p1) = L(p2,p1) = 1;
  endif

endfor

F = L ./ G;

% Substituindo erros nas divisoes por zero
F(isnan(F)) = 0;

end


% Esperado para os resultados abiaxo

% "Paulo", "Sakuma", 3, 0
% "Sakuma", "Hugo", 2, 1
% "Hugo", "Nakamashi", 3, 1
% "Nakamashi", "Paulo", 0, 4

% G = [0,1,0,1;
%      1,0,1,0;
%      0,1,0,1;
%      1,0,1,0];

% L = [0,1,0,1;
%      0,0,1,0;
%      0,0,0,1;
%      0,0,0,0];

% cuidado com nan
%F = L ./ G;
