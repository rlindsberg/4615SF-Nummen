V = 30;
R = 3;
h_old = 3;
for i = 1:1000
    disp(i)
    nom = h_old^3 + 3*V/pi;
    den = 3*R;
    h = sqrt(nom/den);
    
    if (h_old-h < 0.001)
        disp(h)
        break
    else
        h_old = h;
    end
end