##makeCacheMatrix: returns a list of functions to:
##set the value of the vector
##get the value of the vector
##set the value of the mean
##get the value of the mean
makeCacheMatrix <- function(x = matrix()) {
  #m will store the cached inverse matrix
m <- NULL
##Used to set the matrix
set <- function(matrix) {
  x <<- matrix
  m <<- NULL
  }
##Used to get the matrix
get <- function()x
##Getter for the inverse
setmatrix <- function(solve) m<<- solve
getmatrix <- function()m
##Newly defined functions are returned
list(set = set, get = get, setmatrix = setmatrix, getmatrix = getmatrix)
}
## Calculation of inverse of matrix and if inverse is already there in the cache
##then that is returned
cacheSolve <- function(x = matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getmatrix()
##If inverse is already calculated then return it
if(!is.null(m)){
  message("getting csached data")
  return(m)
  }
##If the inverse is not present in cache then calculate it
data <- x$get()
m <- solve(data) %*%data
##Cache the inverse
x$setmatrix(m)
#Return it
m
}
