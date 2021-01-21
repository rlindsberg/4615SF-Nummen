f = @(x) (2*pi/3*x^3 + 10*pi*x^2 -400);
f_derivative = @(x) (2*pi*x^2 + 20*pi*x);
x_old = 5;
for i = 1:100
    disp(i)
    x = x_old - f(x_old)/f_derivative(x_old);
    
    if (x_old-x < 0.001)
        disp(x)
        break
    else
        x_old = x;
    end
end
