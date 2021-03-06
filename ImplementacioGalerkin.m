set(groot, 'DefaultTextInterpreter', 'default');
set(groot, 'defaultAxesTickLabelInterpreter','default'); 
set(groot, 'defaultLegendInterpreter','default');

clc ; % Clean the command window
clear all  ; % Clean the workspace 
syms x u(x) % Define symbolic variables/functions  (Escalar simb�lic)

f = -x^2 ;% Source function  ( = Force over the bar)
lambda = pi^2;
u_barra = (lambda^2-2)/lambda^2;
w_barra = 2/lambda;
b = w_barra;
g = u_barra;
N1 = [1 x];
N2 = [1 x x^2];% Basis functions (polynomials) 
N3 = [1 x x^2 x^3];
N4 = [1 x x^2 x^3 x^4];
%N es el polinomi amb el q vols aproximar
%Variant aixo (afegint termes) veus com la funcio va convergint
% ----------------------
% %%%  Exact solution  %  (ONly works in some Matlab versions)
Du = diff(u,x) ;   
uexact = dsolve(diff(u,2) + lambda*u == -f, u(0)==u_barra, Du(1)== w_barra) ;


%%%%%  Approximate solution by minimization of residual 
%Estem resolguen la eq diferencial amb la minimitzaci� del residu
% [uapprox] = Minimizationresidual(N,f,b,g) ; % NO CAL FERHO PER RESIDUS



[uapprox1] = GalerkinMethod(N1,f,b,g,lambda);
[uapprox2] = GalerkinMethod(N2,f,b,g,lambda);
[uapprox3] = GalerkinMethod(N3,f,b,g,lambda);
[uapprox4] = GalerkinMethod(N4,f,b,g,lambda);


%  Plotting the functions 
figure(1) ;
hold on;  
xlabel('x') ;
ylabel('u'); 

%%%
h1 = ezplot(uexact,0,1);
h2 = ezplot(uapprox1,[0,1]);
h3 = ezplot(uapprox2,[0,1]);
h4 = ezplot(uapprox3,[0,1]);
h5 = ezplot(uapprox4,[0,1]);

%h1 = ezplot(uapprox,[0,1]) ;
legend([h1,h2,h3,h4,h5],{['Exact Solution: ',char(vpa(uexact,3))],
               ['1st degree approach',char(vpa(uapprox1,3))],
               ['2nd degree approach',char(vpa(uapprox2,3))],
               ['3rd degree approach',char(vpa(uapprox3,3))],
               ['4th degree approach',char(vpa(uapprox4,3))]});

% -------------------------------
%  Change the limits
 %axis([0  1  -1.3 -1.2]) ; 
 
