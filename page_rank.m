function r = page_rank(A)


n = size(A,1);
d = 0.85;

r = rand(n,1);

first_part = ones(n, 1);
first_part = first_part * (1-d);
% dividir por n??
%first_part = first_part * ((1-d)/ n); 

for i = 1:52
  second_part = d * (A * r);
  r = first_part + second_part;
end


end