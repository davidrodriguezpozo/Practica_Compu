function Fe = computeF(CN,COOR,b,he)
nelements = length(CN);
Fe = zeros(nelements,2);
for i=1:nelements
    Fe(i,1) = -(he*COOR(i)*(COOR(i) + COOR(i+1)))/3;
    Fe(i,2) = -(he*COOR(i+1)*(COOR(i) + COOR(i+1)))/3;
end
Fe(nelements) = Fe(nelements)+b;
end

