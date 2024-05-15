!  crout_LU.f90 
!
!  FUNCTIONS:
!  crout_LU - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: crout_LU
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

! Main program and subroutine for Crout decomposition in Fortran90

PROGRAM crout_LU
  IMPLICIT NONE
  INTEGER, PARAMETER :: n = 3
  INTEGER :: i,j
  REAL :: A(n, n), L(n, n), U(n, n)

  ! Initialize matrix A
  ! A = RESHAPE([1.0,0.0,0.0,1.0,1.0,0.0,1.0,1.0,1.0], SHAPE(A)) !checked
  A = RESHAPE([7,-6,-11,3,7,2,-11,10,2], SHAPE(A)) !checked

  ! Perform Crout decomposition
  CALL crout_decomposition(A, n, L, U)

  ! Print L and U
  WRITE (*, *) 'L ='
  DO i = 1, n
    WRITE (*, *) L(i, :)
  END DO
  WRITE (*, *) 'U ='
  DO i = 1, n
    WRITE (*, *) U(i, :)
  END DO
END PROGRAM crout_LU

SUBROUTINE crout_decomposition(A, n, L, U)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n
  REAL, INTENT(IN) :: A(n, n)
  REAL, INTENT(OUT) :: L(n, n), U(n, n)

  INTEGER :: i, j, k
  REAL :: sum

  ! Initialize L and U to zero
  L = 0.0
  U = 0.0

  ! Initialize diagonal elements of L to 1
  DO i = 1, n
    L(i, i) = 1.0
  END DO

  ! Perform Crout decomposition
  DO k = 1, n
    DO j = k, n
      sum = 0.0
      DO i = 1, k - 1
        sum = sum + L(k, i) * U(i, j)
      END DO
      U(k, j) = A(k, j) - sum
    END DO
    DO i = k + 1, n
      sum = 0.0
      DO j = 1, k - 1
        sum = sum + L(i, j) * U(j, k)
      END DO
      L(i, k) = (A(i, k) - sum) / U(k, k)
    END DO
  END DO
END SUBROUTINE crout_decomposition
