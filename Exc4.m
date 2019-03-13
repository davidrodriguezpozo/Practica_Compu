%% Apartat 4

clc 
clear all

%Dades inicials
lambda = pi^2;
g = (lambda^2-2)/(lambda^2);
b = 2/lambda;

%Numero de nodes
nnode = 100;
nelements = nnode-1;

%Nodes restringits i lliures
r = 1; %Nodes restringits
l = 2:nnode; %Resta de nodes
he = 1/nelements;

%Definim la matriu de coordenades COOR
COOR = linspace(0,1,nnode);

%Definim la matriu de connectivitats
CN = zeros(nelements,2);
for i=1:nelements
    CN(i,1) = i;
    CN(i,2) = i+1;
end

%Ensamblem la matriu K
K = AssemblyK(COOR,CN,lambda);
F = AssemblyF(COOR,CN,lambda);


d = zeros(nnode,1);
d(r) = g;
d(l) = K(l,l)\(F(l)-K(l,r)*d(r));

plot(COOR,d);