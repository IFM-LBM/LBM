program main

  !use mpi
  use parameters
  use variables
  
  implicit none

  !integer :: error
  !integer :: p
  !integer :: id
  
  !Initialize MPI
  !call MPI_Init(error)

  !Get the number of processes.
  !call MPI_Comm_size ( MPI_COMM_WORLD, p, error )

  !Get the individual process ID.
  !call MPI_Comm_rank ( MPI_COMM_WORLD, id, error )

  !if (id==0) then
   !  write(*,*) "Starting LBM"
    ! call allocate
  !end if

  !if (id==0) then
   !  call deallocate
    ! write(*,*) "Finishing LBM"
  !end if
  
  !Finalize MPI
  !call MPI_Finalize(error)
  
  !inicializando malla
  do i=0,n
     x(i)=i
  end do
  
  !condiciones iniciales
  T=0.0d0
  T(0)=1.0d0
  w(1)=0.5d0
  w(2)=0.5d0
  
  !calculando la funcion de equilibrio
  do i=0,n
     feq(1,i)=w(1)*T(i)
     feq(2,i)=w(2)*T(i)
  end do

  !guardando datos iniciales
  open(11,file='lbmD1Q2.dat')
  write(11,*) '#tiempo=',0
     write(11,*) '#       nodo', &
                 '                        f1', &
                 '                        f2', &
                 '                      feq1',&
                 '                      feq2',&
                 '               Temperatura'
  do i=0,n 
     write(11,*)x(i),f(1,i),f(2,i),feq(1,i),feq(2,i),T(i)
  end do
  write(11,*)
  write(11,*)
  
  !EVOLUCION
  do j=1,200
     !colision
     do i=0,n
        f_new(1,i)=f(1,i)*(1.0d0 - womega) + womega*feq(1,i)
        f_new(2,i)=f(2,i)*(1.0d0 - womega) + womega*feq(1,i)
     end do
    
     
     
     !streaming
     do i=0,n-1
        f(1,i+1)=f_new(1,i)
        f(2,i)=f_new(2,i+1)
     end do

     !condicion de frontera tipo dirichlet
     f(1,0)=T(0) - f(2,0)
     !condicion adiabatica
     f(1,n)=f(1,n-1)
     f(1,n)=f(1,n-1)
     
     !calculando las cantidades macroscopicas
     do i=1,n
        T(i)=f(1,i) + f(2,i)
     end do
     
     !calculando la funcion de equilibrio
     do i=0,n
        feq(1,i)=w(1)*T(i)
        feq(2,i)=w(2)*T(i)
     end do

     !guardando datos
     write(11,*) '#tiempo=',j
     write(11,*) '#       nodo', &
                 '                        f1', &
                 '                        f2', &
                 '                      feq1',&
                 '                      feq2',&
                 '               Temperatura'
     do i=0,n 
        write(11,*)x(i),f(1,i),f(2,i),feq(1,i),feq(2,i),T(i)
     end do
     write(11,*)
     write(11,*)
     
  end do

  close(11)

end program main
