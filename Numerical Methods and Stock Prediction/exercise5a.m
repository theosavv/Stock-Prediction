function Lx = lagrange_sine(x)
    Lx = 0;
 
    points = linspace(-pi, pi, 10);  
    sin_values = sin(points);
    
    for i = 1:length(points)
        selected = points(i);
        Li = 1;
        for j = 1:length(points)
            if i ~= j
                denominator = selected - points(j);
                numerator = x - points(j);
                Li = Li * (numerator / denominator);
            end
        end
        Lx = Lx + Li * sin_values(i);
    end
end

x = pi/8 ;
Lx = lagrange_sine(x);
fprintf('Προσεγγιστική τιμή του ημιτόνου μέσω Lagrange: %.8f\n', Lx);

exact = sin(x);
fprintf('Ακριβής τιμή του ημιτόνου: %.8f\n', exact);

x_values = linspace(-pi, pi, 200);  
lagrange_values = zeros(1, length(x_values));  
actual_values = sin(x_values);  


for i = 1:length(x_values)
    lagrange_values(i) = lagrange_sine(x_values(i));
end


figure;
plot(x_values, actual_values, 'b-', 'LineWidth', 2);  
hold on;
plot(x_values, lagrange_values, 'r--', 'LineWidth', 2);  
xlabel('x');
ylabel('y');
grid on;
hold off;