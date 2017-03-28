module variables

  implicit none

  real(8),allocatable,dimension(:)::x,T,w
  real(8),allocatable,dimension(:,:)::f,feq,omega,f_new
  integer n,time,vel,i,j 
  real(8) alfa, womega, tiempo
  
end module variables
