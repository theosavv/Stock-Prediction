function spline_value = splines_sine(x)
    points = linspace(-pi, pi, 10);  
    sin_values = sin(points);
    
    h = diff(points);
    n = length(points);          
    r = zeros(1, n-2);           
    for i = 2:n-1                
       r(i-1) = 3 * ((sin_values(i+1) - sin_values(i)) / h(i) - (sin_values(i) - sin_values(i-1)) / h(i-1));
    end
    
    A = zeros(n-2, n-2);  
    for i = 1:n-2
       if i == 1
            A(i, i) = 2 * (h(i) + h(i+1));    
            A(i, i+1) = h(i+1);                
     elseif i == n-2
            A(i, i-1) = h(i);                  
            A(i, i) = 2 * (h(i) + h(i+1));   
     else
            A(i, i-1) = h(i);                  
            A(i, i) = 2 * (h(i) + h(i+1));    
            A(i, i+1) = h(i+1);                
        end
    end
    
    c = A \ r';
    c = [0; c; 0];  

    a = sin_values; 
    b = zeros(1, n-1);  
    for i = 1:n-1
        if i < n-1
            b(i) = (sin_values(i+1) - sin_values(i)) / h(i) - (h(i) / 3) * (2 * c(i) + c(i+1));
        else
            b(i) = (sin_values(i) - sin_values(i-1)) / h(i-1) - (h(i-1) / 3) * (2 * c(i-1) + c(i));
        end
    end 
    
    d = zeros(1, n-1);  
    for i = 1:n-1
        if i < n-1
            d(i) = (c(i+1) - c(i)) / (3 * h(i));
        else
            d(i) = (c(i) - c(i-1)) / (3 * h(i-1));
        end
    end
    
    spline_value = NaN; 
    for i = 1:n-1
        if x >= points(i) && x <= points(i+1)
            dx = x - points(i);
            spline_value = a(i) + b(i) * dx + c(i) * dx^2 + d(i) * dx^3;
            return;
        end
    end
end




x_values = linspace(-pi, pi, 200);  
spline_values = zeros(1, length(x_values));  
actual_values = sin(x_values);  

for i = 1:length(x_values)
    spline_values(i) = splines_sine(x_values(i));
end
figure;
plot(x_values, actual_values, 'b-', 'LineWidth', 2);  
hold on;
plot(x_values, spline_values, 'r--', 'LineWidth', 2); 
xlabel('x');
ylabel('y');
grid on;
hold off;




% Test the value at x = pi/8
x_test = pi / 8;
spline_result = splines_sine(x_test);

% Exact sine value
exact_sin = sin(x_test);

% Display the results
fprintf('Approximated value of sine at x = %.4f: %.8f\n', x_test, spline_result);
fprintf('Exact sine value at x = %.4f: %.8f\n', x_test, exact_sin);

% Calculate the absolute error (precision)
precision = abs(spline_result - exact_sin);
fprintf('Absolute error (precision) = %.8f\n', precision);
