makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
##set x as y and m as null in environment containing function        
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

cacheinverse <- function(x, ...) {
        m <- x$getinverse()
## check to see if inverse has been calculated        
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }        
        data <- x$get()
#Calculate the inverse           
        m <- solve(data, ...)
## Cache the inverse        
        x$setinverse(m)        
        m
}