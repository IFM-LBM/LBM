
subroutine allocate

  use parameters
  use variables

  implicit none

  allocate(x(0:Nx_total),T(0:Nx_total),w(1:vel))
  allocate(f(1:vel,0:Nx_total),f_new(1:vel,0:Nx_total))
  allocate(feq(1:vel,0:Nx_total))
  
end subroutine allocate
