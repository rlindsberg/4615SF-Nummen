% Raderna 2-7 ritar upp de 3 sfärerna
[XX,YY,ZZ]=sphere(100);
R=5;
h = surfl(R*XX+1,R*YY-2,R*ZZ); hold on, set(h, 'FaceAlpha', 0.3); shading interp
h = surfl(R*XX-2,R*YY+2,R*ZZ-1); set(h, 'FaceAlpha', 0.3); shading interp
h = surfl(R*XX+4,R*YY-2,R*ZZ+3); set(h, 'FaceAlpha', 0.3); shading interp
xlabel('x'), ylabel('y'), zlabel('z')

f = @(x,y,z) [(x-1)^2+(y+2)^2+(z)^2-25; (x+2)^2+(y-2)^2+(z+1)^2-25; (x-4)^2+(y+2)^2+(z-3)^2-25];

J = @(x,y,z) [ 2*x - 2, 2*y + 4, 2*z ; 2*x + 4, 2*y - 4, 2*z + 2; 2*x - 8, 2*y + 4, 2*z - 6 ];

fkoll=f(10,10,10);
Jkoll=J(10,10,10);

xstart=[-0.2,-3.5];  % fyll i startgissning för x (ett värde för varje skärningspunkt)
ystart=[3,0.06];  % fyll i startgissning för y (ett värde för varje skärningspunkt)
zstart=[-3,2.4];  % fyll i startgissning för z (ett värde för varje skärningspunkt)

tol=1e-11;
for i=1:2   % loopa över de två skärningspunkterna
x=xstart(i);
y=ystart(i);
z=zstart(i);

% RK: x = (x1, x2, x3) should be a vector
sol = [x; y; z];

% Här ska Newtons metod implementeras
for j = 1:100

    % RK: b = Ah + Ef
    b = -f(x, y, z);
    A = J(x, y, z);
    h = A\b;

    error = norm(h);

    if error < tol
        sol = [x, y, z];
        break
    else
        %RK: take a step
        x = x + h(1);
        y = y + h(2);
        z = z + h(3);
    end
end
% När Newton är klar, lagra resultatet i radvektorerna
% xrot, yrot, zrot (ett värde för varje skärningspunkt)
xrot(i) = sol(1);
yrot(i) = sol(2);
zrot(i) = sol(3);
end

rot1 = [xrot(1), yrot(1), zrot(1)];
rot2 = [xrot(2), yrot(2), zrot(2)];
