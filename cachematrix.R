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