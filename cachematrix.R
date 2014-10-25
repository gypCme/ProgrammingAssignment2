## Cache the value of the mean so that when we need it again
## it can be looked up rather than recomputed

## Create a special matrix and cache its inverse calculation

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y)  {
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setmean<-function(mean) m<<-mean
  getmean<-function()m
  list(set=set, get=get,
       setmean=setmean,
       getmean=getmean)
}

## Computes or retrieves the inverse of special matrix

cacheSolve <- function(x, ...) {
  m<-x$getmean()
  if(!is.null(m))   {
        message("getting cached data")
        return(m)
  }
  data<-x$get()
  m<-mean(data, ...)
  x$setmean(m)
  m
}  

## Returns a matrix that is the inverse of 'x'

solve(x)

