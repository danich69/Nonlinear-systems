module func
    implicit none
    
    contains
    
        function f(x)
        
            real(8), dimension(:) :: x
            real(8), dimension( size(x) ) :: f
            
            f(1) = x(1)**2+sin(x(2))+x(3)
            f(2) = x(1)*3.1415926 - x(2) + x(3)
            f(3) = 1000*x(3)+x(1)*0.5 - x(1)
        
        end function f
    
end module func
