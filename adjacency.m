function [F, p] = adjacency()

% F -> matriz de pesos
% G -> matriz de numero de jogos
% L -> matriz de derrotas
% W -> matriz de vitorias
% C -> matriz de pontos sofridos
% S -> matriz de portos marcados
% D -> matriz de empates
% g -> maximo numero de jogos entre qualquer match-up pair
% p -> vetor de jogadores
% m -> numero total de jogos
% n -> numero de jogadores

%find(ismember(p, 'Paulo'))

[c1, c3, c4, c2] = textread("brasileiro1971-2013.csv", '%s %d %d %s', 'delimiter', ',');


% Gerando cell de jogadores
players = [c1;c2];
p = {};
index = 1;
for i = 1:size(players,1);
  player = players{i};
  pos = find(ismember(p, player));

  if (size(pos, 1) == 0)
    p{index, 1} = player;
    index = index + 1;
  endif
endfor

%regexptranslate ("escape", c1{1})
%p = {"\"Paulo\""; "\"Sakuma\""; "\"Hugo\""; "\"Nakamashi\""; "\"Chagas\""};


m = size(c1,1);
n = size(p,1);
G = zeros(n);
L = zeros(n);
S = zeros(n);
C = zeros(n);

for i = 1:m
  p1 = find(ismember(p, c1{i}(1:end)));
  p2 = find(ismember(p, c2{i}(1:end)));

  % Preenchendo matriz de numero de jogos
  G(p1,p2) = G(p1,p2) + 1;
  G(p2,p1) = G(p2,p1) + 1;

  % Preenchendo matriz de derrotas
  if c4(i) < c3(i)
    L(p1,p2) = L(p1,p2) + 1;
  elseif c3(i) < c4(i)
    L(p2,p1) = L(p2,p1) + 1;
  endif

  %Preenchendo matriz de pontos marcados
  %S(p1,p2) = S(p1,p2) + c3(i);
  %C(p1,p2) = C(p1,p2) + c4(i);

  % Preenchendo matirz de gols sofridos
  %C(p2,p1) = C(p2,p1) + c4(i);

endfor

g = max(max(G));

peso_derrotas =  L ./ G;
peso_saldo = S;
peso_qtd = G ./ g;

peso_derrotas(isnan(peso_derrotas)) = 0;
%peso_saldo(isnan(peso_saldo)) = 0;
peso_qtd(isnan(peso_qtd)) = 0;


% tmp
%peso_saldo = [0,3, 1; 0,0,2; 2,1,0]


F = peso_qtd .* peso_derrotas;
%F = peso_qtd .* (peso_derrotas + peso_saldo);
%F = peso_derrotas .+ peso_saldo;
%F = L ./ G;

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
