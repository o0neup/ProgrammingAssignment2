## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  slv <- NULL
  set <- function(y) {
    x <<- y
    slv <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) slv <<- solve
  getsolve <- function() slv
  list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  slv <- x$getsolve()
  if (!is.null(slv)) {
    message('getting matrix from cache')
    return(slv)
  }
  slv <- solve(x$get())
  x$setsolve(slv)
  return(slv)
}
