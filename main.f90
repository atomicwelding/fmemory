program fmemory
  implicit none
  real, dimension(10,10) :: mem
  integer :: i, j, fdseq = 20, fdstr = 21, frame, fdframe = 22, stat
  character(len=512) :: iomsg

  mem = 0.
  do i=1,10
     do j=1,10
       mem(i,j) = i + j*0.1
     end do
  end do

  open(fdseq, file="memseq.dat", status="replace", form="unformatted", iostat=stat, iomsg=iomsg)
  if(stat /=0) then
     print *, "could not open file memseq.dat"
     stop 1
  end if

  write(fdseq) mem

  
  open(fdstr, file="memstr.dat", status="replace", form="unformatted", access="stream",  iostat=stat, iomsg=iomsg)
  if(stat /=0) then
     print *, "could not open file memstr.dat"
     stop 1
  end if

  write(fdstr) mem

  
  open(fdframe, file="memframe.dat", status="replace", form="unformatted", access="stream",  iostat=stat, iomsg=iomsg)
  if(stat /=0) then
     print *, "could not open file memframe.dat"
     stop 1
  end if

  do frame=1,3
     write(fdframe) mem
  end do



  close(fdseq)
  close(fdstr)
  close(fdframe)

end program fmemory
