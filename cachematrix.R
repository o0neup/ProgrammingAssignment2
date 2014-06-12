## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix function provides interface for cacheSolve function, that compute and cache an inverse of a given new matrix
# and uses cached data if necessary computing was performed already


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


## Performs caching/retrieving inverse from cache

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
