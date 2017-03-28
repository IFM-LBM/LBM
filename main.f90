program main

  use mpi
  use parameters
  use variables
  
  implicit none

  integer :: error
  integer :: p
  integer :: id

  !Initialize MPI
  call MPI_Init(error)

  !Get the number of processes.
  call MPI_Comm_size ( MPI_COMM_WORLD, p, error )

  !Get the individual process ID.
  call MPI_Comm_rank ( MPI_COMM_WORLD, id, error )

  womega =1.0d0/(alfa +.5d0)

  if (id==0) then
     write(*,*) "Starting LBM"
     call allocate
  endif

  if (id==0) then
     call deallocate
     write(*,*) "Finishing LBM"
  endif
  
  !Finalize MPI
  call MPI_Finalize(error)

end program main
