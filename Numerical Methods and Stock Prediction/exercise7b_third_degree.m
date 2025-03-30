%LAMDA με πολυώνυμο τρίτου βαθμού

function a = least_squares_lamda_third()
    points = [1,2,3,4,5,6,7,8,9,10];  
    values = [6.6800,6.6100,6.5800,6.5600,6.7400,6.7500,6.7400,6.9000,7.0900,7.0000]; 
    n = length(points);  
    
    A = zeros(n, 4); 
    for i = 1:n
        A(i, :) = [1, points(i), points(i)^2,points(i)^3];  
    end
    
    b = values(:);  
    a = (A'* A) \(A' * b);  
end
a = least_squares_lamda_third();  


for x_test=11:15
    p_x = a(1) + a(2)*x_test + a(3)*x_test^2 + a(4)*x_test^3 ; 
    fprintf('Approximated value of ΛΑΜΔΑs stock for %d/7/2024 %.4f\n',x_test-3, p_x);
end
x_test = x_test +1;
p_x = a(1) + a(2)*x_test + a(3)*x_test^2 + a(4)*x_test^3 ; 
fprintf('Approximated value of ΛΑΜΔΑs stock for %d/7/2024 %.4f\n',x_test-1, p_x);

%Για την ποιοτική σύγκριση
    values = [6.6800,6.6100,6.5800,6.5600,6.7400,6.7500,6.7400,6.9000,7.0900,7.0000]; 
for x_test = 1:10
    p_x = a(1) + a(2) * x_test + a(3) * x_test^2 + a(4)*x_test^3; 
    fprintf('Day %d: Approximated value %.4f vs Real value %.4f\n', x_test, p_x, values(x_test));
end