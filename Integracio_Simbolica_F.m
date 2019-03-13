syms K h x1 x2;


N = 1/2*[1-K; 1+K];
X = 1/2*[1-K; 1+K]*[x1 x2];

R = -h/2*int(N.'*X^2,K,-1,1)

%%%QUINES DIMENSIONS ENS HAURIA DE DONAR LA INTEGRAL DE F????

