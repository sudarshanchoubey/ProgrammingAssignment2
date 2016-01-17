## The file provides functions to create a vector and cache its inverse

## This provides the getter and setter functions for the matrix

makeCacheMatrix <- function(x = matrix()) {
  matrix.inverse <- NULL
  set <- function(y) {
    matrix.original <<- y
    matrix.inverse <<- NULL
  }
  get <- function() matrix.original
  setinverse <- function(inv) matrix.inverse <<- inv
  getinverse <- function() matrix.inverse
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function gets the inverse from the cache or calculates the
## inverse and puts it into the cache for the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  data.matrix <- x$get()
  inv <- solve(data.matrix, ...)
  x$setinverse(inv)
  inv
}
