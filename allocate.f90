
subroutine allocate

  use parameters
  use variables

  implicit none

  allocate(x(0:n),T(0:n),w(1:vel))
  allocate(f(1:vel,0:n),f_new(1:vel,0:n))
  allocate(feq(1:vel,0:n))
  
end subroutine allocate
