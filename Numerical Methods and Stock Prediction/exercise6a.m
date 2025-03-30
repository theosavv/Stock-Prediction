%Μέθοδος Simpson
syms x;
f = sin(x);
first_derivative = diff(f,x);
second_derivative = diff(first_derivative, x);
a = 0;
b = pi/2;
n = 11;
points = linspace(a, b, n);
f_numeric = matlabFunction(f);

sum_odd =0;
sum_even =0;
for i=2:n-1
    if mod(i, 2) == 1
        sum_even = sum_even + f_numeric(points(i));
    else
        sum_odd = sum_odd + f_numeric(points(i));
    end
end
result = (b-a) / (3*(n-1))* (f_numeric(points(1)) + f_numeric(points(n)) +2*sum_even +4*sum_odd);
fprintf('Result: %f\n', result);

second_derivative_numeric = matlabFunction(second_derivative);
M = fminbnd(@(x) -abs(second_derivative_numeric(x)), a, b);
error_simpson = ((b - a)^5 / (180 * (n - 1)^4)) * M;
fprintf('Result: %f\n', result);
fprintf('Error %f\n', error_simpson);

