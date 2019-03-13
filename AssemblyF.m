function F = AssemblyF(COOR,CN,b)
nelem = size(CN,1) ; % Number of rows and columns SIZE
nnode = nelem+1 ;
nnodeE = size(CN,2) ;
F = zeros(nnode, 1) ;
for e=1:nelem  % Loop over number of elements 
    % Element matrix
    NODOSe = CN(e,:);    % Global numbering of nodes of element "e"
    COOR_e = COOR(NODOSe) ;
    he = COOR_e(2)-COOR_e(1) ; % Size finite element
    % Elemental matrix     
    Fe = computeF(CN,COOR,b,he);
    % Assembly
    for a = 1:nnodeE 
            A = CN(e,a);
            F(A) = F(A) + Fe(a) ;
       
    end
end

