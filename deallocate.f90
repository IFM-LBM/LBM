subroutine deallocate

  use parameters
  use variables

  implicit none
  
  deallocate(x,T,w)
  deallocate(f,f_new)
  deallocate(feq)
  
end subroutine deallocate
