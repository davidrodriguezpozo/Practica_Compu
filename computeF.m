function Fe = computeF(CN,COOR,b,he)
nelements = length(CN);
Fe = zeros(nelements,2);
for i=1:nelements
    Fe(i,1) = 2-he/2*(2/3*COOR(i) + 2/3*COOR(i+1)*COOR(i));
    Fe(i,2) = 2-he/2*(2/3*COOR(i)*COOR(i+1) + 2/3*COOR(i+1));
end

Fe(nelements) = Fe(nelements)+b;
end

