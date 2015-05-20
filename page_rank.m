function r = page_rank(A)

%temp
A = eye(3);

N = size(A,1);
d = 0.85;

arbitrary_side = ones(N, 1);
arbitrary_side = arbitrary_side * ((1-d) / N);

navigation_side = 0;


r = [0;0;0;0];


end