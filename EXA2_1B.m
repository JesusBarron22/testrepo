close all;
clear;
clc;
A = 1/2;
B = 1/2;


% Definir el rango de n
n = 0:10;

% Definir la señal h(n) y x(n)
h = (A.^n) .* [heaviside(n) - heaviside(n-3)];
x =(B.^n) .* [heaviside(n) - heaviside(n-5)];

z = zeros(size(n));

for i = 1:length(n)
    for k = 1:length(n)
        if (i - k + 1) > 0 && (i - k + 1) <= length(n)
            z(i) = z(i) + h(k) * x(i - k + 1);
        end
    end
end

disp(z);


stem(n, z);
xlabel('n');
ylabel('z(n)');
title('Convolución');
grid on;