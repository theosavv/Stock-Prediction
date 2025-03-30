%KPI-KPI με πολυώνυμο τετάρτου βαθμού
function a = least_squares_fourth()
    points = [1,2,3,4,5,6,7,8,9,10];  
    values = [10.6500,10.9500,10.9000,11.0500,11.3500,11.4500,11.2500,11.4500,11.4500,11.6000]; 
    n = length(points);  
    
    A = zeros(n, 5); 
    for i = 1:n
        A(i, :) = [1, points(i), points(i)^2,points(i)^3,points(i)^4];  
    end
    
    b = values(:);  
    a = (A'* A) \(A' * b);  
end
a = least_squares_fourth();  


for x_test=11:15
    p_x = a(1) + a(2)*x_test + a(3)*x_test^2 + a(4)*x_test^3 +a(5)*x_test^4 ; 
    fprintf('Approximated value of ΚΡΙs stock for %d/7/2024 %.4f\n',x_test-3, p_x);
end
x_test = x_test +1;
p_x = a(1) + a(2)*x_test + a(3)*x_test^2 + a(4)*x_test^3 +a(5)*x_test^4 ; 
fprintf('Approximated value of ΚΡΙs stock for %d/7/2024 %.4f\n',x_test-1, p_x);

%Για την ποιοτική σύγκριση
values = [10.6500,10.9500,10.9000,11.0500,11.3500,11.4500,11.2500,11.4500,11.4500,11.6000];
for x_test = 1:10
    p_x = a(1) + a(2) * x_test + a(3) * x_test^2 + a(4)*x_test^3 +a(5)*x_test^4; 
    fprintf('Day %d: Approximated value %.4f vs Real value %.4f\n', x_test, p_x, values(x_test));
end








