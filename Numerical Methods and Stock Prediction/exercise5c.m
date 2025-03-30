function a = least_squares_sine()
    points = [-pi, -pi/2, -pi/3, -pi/4, -pi/6, 0, pi/6, pi/3, pi/2, pi];  
    sin_values = sin(points); 
    n = length(points);  
    
    A = zeros(n, 4); 
    for i = 1:n
        A(i, :) = [1, points(i), points(i)^2, points(i)^3];  
    end
    
    b = sin_values(:);  
    a = (A'* A) \(A' * b);  
end

a = least_squares_sine();  

x_test = 0.5;  
p_x = a(1) + a(2)*x_test + a(3)*x_test^2 + a(4)*x_test^3; 
fprintf('Approximated value of sine for x = %.2f: %.8f\n', x_test, p_x);

exact_sin = sin(x_test);
fprintf('Exact sine value for x = %.2f: %.8f\n', x_test, exact_sin);

precision = abs(exact_sin - p_x);
fprintf('Precision (absolute error) = %.8f\n', precision);
x_vals = linspace(-pi, pi, 200);
y_approximation = a(1) + a(2) * x_vals + a(3) * x_vals.^2 + a(4) * x_vals.^3;
y_exact = sin(x_vals);

figure;
plot(x_vals, y_exact, 'b', 'LineWidth', 2); 
hold on;
plot(x_vals, y_approximation, 'r--', 'LineWidth', 2); 

xlabel('x');
ylabel('sin(x)');
grid on;
hold off;

% 1 digit of percision
