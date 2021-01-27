func = @(x) cos(x.^2);
a = 1; % start_value = 0;
b = 2; % stop_value = 1;
n = 10; % just an example
h = (b-a)/n;

x = 1:h:2;
f = func(x); % f has 11 elements

% Simpsons
Sh_part_1 = h/3 * (f(1) + f(11));
Sh_part_2 = 0;
for j = 1:n/2
    x_index = 2*j; % 2j-1 for zero index
    Sh_part_2 = Sh_part_2 + 4*h/3 * f(x_index);
end

Sh_part_3 = 0;
for j = 1:n/2-1
    x_index = 2*j+1; % 2j for zero index
    Sh_part_3 = Sh_part_3 + 2*h/3 * f(x_index);
end

Sh = Sh_part_1 + Sh_part_2 + Sh_part_3;

% Trapetsregeln
Th = 0;
for j = 1:n % 10 steps
    top = func(a + (j-1)*h);
    bot = func(a + j*h);
    height = h;
    Th = Th + (top+bot)*height/2;
end
    
