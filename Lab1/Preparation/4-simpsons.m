f = @(x) cos(x.^2);
a = 0; % start_value = 0;
b = 1; % stop_value = 1;
n = 8; % just an example
h = (b-a)/n;
Sh_part_1 = h/3 * (f(0) + f(1));
Sh_part_2 = 0;
for j = 1:n/2
    x_index = 2*j-1;
    Sh_part_2 = Sh_part_2 + 4*h/3 * f(x_index);
end

Sh_part_3 = 0;
for j = 1:n/2-1
    x_index = 2*j;
    Sh_part_3 = Sh_part_3 + 2*h/3 * f(x_index);
end

Sh = Sh_part_1 + Sh_part_2 + Sh_part_3;
disp(Sh)