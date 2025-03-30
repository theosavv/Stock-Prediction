%Μέθοδος Τραπεζίου
syms x;
f = sin(x);
first_derivative = diff(f,x);
second_derivative = diff(first_derivative, x);
a = 0;
b = pi/2;
n = 11;
points = linspace(a, b, n);
f_numeric = matlabFunction(f);
fvalues(1)=f_numeric(points(1));
fvalues(n)=f_numeric(points(n));

sum = 0;
for i=2:n-1
    sum = sum + f_numeric(points(i));
    fvalues(i) = f_numeric(points(i));
end
result = (b-a) / (2*(n-1))* (f_numeric(points(1)) + f_numeric(points(n)) +2*sum);

second_derivative_numeric = matlabFunction(second_derivative);
M = fminbnd(@(x) -abs(second_derivative_numeric(x)), a, b);
error = ((b - a)^3 / (12 * (n - 1)^2)) * M;
fprintf('Result: %f\n', result);
fprintf('Error: %f\n', error);