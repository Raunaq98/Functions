add2 <- function(x,y){    #simple addition of two numbers
    x+y
}


above <- function(x,n){    # to print elements of a numeric vector that lie above as certain threshold number
      use <- x > n
      x[use]
}
# x<- 1:10
# above(x,5)
#[1]  6  7  8  9 10

# this wouldnt have worked if you had not given n=10
# we can set 10 as the default value which the user can still change

abovee <- function(y,m=10){  
  use1 <- y > m
  y[use1]
}
# y <- 1:12
# abovee(y)
#[1] 11 12


###### write a function to calculate mean of each column  of a dataframe

colmean<- function(data){
          col_num <- ncol(data)        # made a variable that store the number of columns
          means <- numeric(col_num)   # made an empty vector with length equal to no. columns of input
          for( p in 1:col_num){        # picking each column one by one
              means[p] <- mean(data[ ,p])      #storing in a certain index of empty vector the mean of data pertaining to that index column only
          }
          means
}

# problem with this would be it wont process NAs.
# we can remove the NAs by default :

colmean<- function(data, removeNA=TRUE){
  col_num <- ncol(data)        
  means <- numeric(col_num)   
  for( p in 1:col_num){        
    means[p] <- mean(data[ ,p],na.rm=removeNA)      
  }
  means
}
