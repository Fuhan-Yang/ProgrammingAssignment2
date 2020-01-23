## Overview

## makeCacheMatrix and cacheSolve functions work together to calculate and store
## the inverse of the input matrix.makeCacheMatrix creates new matrix and store
## previous inverse.When a new matrix is assigned, previous inverse will be reset. 
## By transfering the list of functions into cacheSolve, cacheSolve can decide 
## whether to show previous inverse or calculate the inverse from a new matrix.


## makeCacheMatrix

## This function receives input of new matrix, and the inverse variable i will 
## be reset. The nested functions, get, getinv will be transferred 
## into global environment as a list in order to be called by cacheSolve.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        get <- function() x
        getinv <- function() i
        list(get = get,getinv = getinv)
}



## cacheSolve

## The use of cacheSolve requires the execution of makeCacheMatrix and the return
## value of makeCacheMatrix because functions defined in makeCacheMatrix, like 
## getinv and get,will be called in cacheSolve. By calling these functions, 
## cacheSolve can define if there is a new matrix(by telling if i is null) thus 
## calculate the new inverse, or just return the previous inverse.

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if (!is.null(i)){
                return(i)
        }
        temp <- x$get()
        i <- solve(temp)
        i
        ## Return a matrix that is the inverse of 'x'
}


