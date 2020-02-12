## Week3 assignment by gdq
## the purpose of this assignment is write 2 cooperative functions 
## (makeCacheMatrix & CacheSolve) that calculate the inverse of a matrix, 
## stores the value in the parent environment, and can be cached if already 
## calculated using lexical scoping 
## (minimize time-consuming computations)

## makeCache matrix defines the variable, incorporated them to respective setter/getter 
## functions, and assigns names to these functions so they can be recalled via $
 
makeCacheMatrix <- function(x = matrix()) {
	nMatx=NULL
	set <- function(y){
		x <<- y
		nMatx <<- NULL
	}
	get <- function() x
	setInverse <- function(solve) nMatx <<- solve
	getInverse <- function() nMatx
	list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}
## cacheSolve retrieves the calculates inverse matrix (nMatx) from the parent environment,
## determines if it's equal to NULL or not. If not, then it's cahced and reprinted in parent
## environment. If yes, then calculates its inverse, inserts the new value into the set function,
## and reprints it into the parent environment

cacheSolve <- function(x, ...) {
       nMatx <- x$getInverse()
       if(!is.null(nMatx)){
       		message("getting cahced data")
       		return (nMatx)
       }
       data <- x$get()
       nMatx <- solve(data, ...)
       x$setInverse(nMatx)
       nMatx
}
