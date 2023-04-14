## The first function creates a special "matrix" object and caches its inverse 
## Then the second function computes the inverse of the "special" matrix,
## if the inverse has already been computed it is retrieved from the cache

## creates a matrix that sets the value of the matrix,
## gets the value of the matrix
## sets the value of the inverse
## gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function()x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse matrix, it first checks to see if
## the inverse matrix was already made, if so it skips the calculations
## and gets the inverse from the cache, otherwise it computes the inverse
## matrix and sets the inverse matrix in the cache via the setinverse function

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
       data <- x$get()
       i <- solve(data, ...)
       x$setinverse(i)
       i
}
