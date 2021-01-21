% Raderna 2-7 ritar upp de 3 sfärerna
[XX,YY,ZZ]=sphere(100);
R=5;
h = surfl(R*XX+1,R*YY-2,R*ZZ); hold on, set(h, 'FaceAlpha', 0.8); shading interp
h = surfl(R*XX-2,R*YY+2,R*ZZ-1); set(h, 'FaceAlpha', 0.8); shading interp
h = surfl(R*XX+4,R*YY-2,R*ZZ+3); set(h, 'FaceAlpha', 0.8); shading interp
xlabel('x'), ylabel('y'), zlabel('z')


% syms x y z
% J_f = jacobian([((x-1)^2 + (y+2)^2 + z^2 - 25); ((x+2)^2 + (y-2)^2 + (z+1)^2 - 25); ((x-4)^2 + (y+2)^2 + (z-3)^2 - 25) ]);
% J = @(x,y,z) [[2*x - 2, 2*y + 4,     2*z]; [2*x + 4, 2*y - 4, 2*z + 2]; [2*x - 8, 2*y + 4, 2*z - 6]];


% fkoll=f(10,10,10);
% Jkoll=J(10,10,10);

xstart=[10, 10];  % fyll i startgissning för x (ett värde för varje skärningspunkt)
ystart=[10, 10];  % fyll i startgissning för y (ett värde för varje skärningspunkt)
zstart=[10, 10];  % fyll i startgissning för z (ett värde för varje skärningspunkt)

tol=1e-11;
%for i=1:2   % loopa över de två skärningspunkterna
% x=xstart(i);
% y=ystart(i);
% z=zstart(i);

x0 = [xstart(1) ystart(1) zstart(1)];
x = x0;
h = tol + 1;
while norm(h)>tol
   b = z(x)
   A = jacobian(z);      % evaluate the Jacobian A=Df(x)
   b = z(x);            % evaluate the residual b=-f(x)
   h = A\b;              % solve the linearized equation
   x = x + h;            % update 
   disp(x)
end

% Här ska Newtons metod implementeras
%h = J\(-f(x, y, z))

%-f(x, y, z) == J*h

% När Newton är klar, lagra resultatet i radvektorerna 
% xrot, yrot, zrot (ett värde för varje skärningspunkt)
%xrot(i) = 
%yrot(i) =
%zrot(i) = 
%end
%rot1 = [?, ?, ?];
%rot2 = [?, ?, ?];


function [f]=z(v)                         % Define & Code Function ‘f’
f = [((v(1)-1)^2 + (v(2)+2)^2 + v(3)^2 - 25); ((v(1)+2)^2 + (v(2)-2)^2 + (v(3)+1)^2 - 25); ((v(1)-4)^2 + (v(2)+2)^2 + (v(3)-3)^2 - 25) ];
end
