# Crout_LU

This is a simple implementation of LU decomposition using the Crout routine in f90.

## General goal
To solve linear problems 'Ax=b' for multiples 'b' in an efficient way, we can perform an LU decomposition.

As the main purpose of the LU decomposition we can store a factorization of a matrix:
A(NxN) = L(NxN)U(NxN) 
into lower and upper triangular matrices in O(N3) and then perform multiple RHS - Right Hand Solutions in O(N2). 

This is a significant improvement over Gaussian elimitation, which itself is O(N3) to achive solution for each 'b' in linear solution of 'Ax = b'.

For further theoretical explanation, please refer to the lectures at:
https://ocw.mit.edu/courses/2-29-numerical-fluid-mechanics-spring-2015/resources/mit2_29s15_lecture5/
