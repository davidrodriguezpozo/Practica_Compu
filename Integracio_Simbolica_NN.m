syms K h;


N = 1/2*[1-K, 1+K];

R = h/2 * int(N.'*N, K, -1, 1)


