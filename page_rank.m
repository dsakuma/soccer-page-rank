function r = page_rank(F)


n = size(F,1);
d = 0.85;

r = rand(n,1);

first_part = ones(n, 1);
first_part = first_part * (1-d);
% dividir por n??
%first_part = first_part * ((1-d)/ n); 

for i = 1:100
  second_part = d * (F * r);
  r = first_part + second_part;
end


end