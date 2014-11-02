## Caching the Inverse of a Matrix
##
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it repeatedly

# Example usage:
# > mat <- matrix(c(1,5,3,1), nrow=2)     // Create a matrix
# > x <- makeCacheMatrix(mat)             // Create the corresponding special matrix
# > x$get()                               // Return the matrix
# > cacheSolve(x)                         // Return the inverse matrix
# > cacheSolve(x)                         // Return the cached inverse matrix


## makeCacheMatrix: creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set,
       get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## cacheSolve: returns the inverse of the matrix. 
# If the inverse matrix has already been computed, 
# the function gets the result and skips the computation.
# If not, the function calculate the inverse matrix and cache it.
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  # If the inverse is already calculated, return it
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)    # Cache the inverse
  inv
}

