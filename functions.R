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

################# lexical scoping


y<- 10

f1<- function(x){
  y<-2
  y^2 +g(x)            # y is looked up in the enivornment it is defined in ie the function itself, therefore y = 2
}                          # g is then called
g <- function(x){
  x*y                    # x is already passed from f1 to g(), y is now searched in the environment it is defined in
}                         # since there is no wwhy in the functional enivornment, it is searched in the global environment ie y=10


#######################

evaluate <-function(func,dat){
    func(dat)
}
evaluate(function(x){x+1}, 6)
#[1] 7
#The first argument is a tiny anonymous function that takes one argument `x` and returns `x+1`. 
#We passed the number 6 into this function so the entire expression evaluates to 7.

##################

paste("Programming","is","fun!")
# [1] "Programming is fun!”

telegram <- function(...){
  paste("START",...,"STOP")
}
telegram("Programming","is","fun!")
# [1] "START Programming is fun! STOP"


############### MADLIBS

# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  args<- list(...)
  place<- args[["place"]]
  adjective<- args[["adjective"]]
  noun<- args[["noun"]]
  # Do your argument unpacking here!
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, 
        "students took to the streets in protest of the new", noun, "being installed on campus.")
}
# mad_libs(place="delhi",adjective="beautiful",noun="statues")
# [1] "News from delhi today where beautiful students took to the 
#      streets in protest of the new statues being installed on campus."


############### creating own binary operators

# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!

# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.

# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:

#       "Good" %p% "job!"

# will evaluate to: "Good job!"

"%p%" <- function(char1,char2){ 
  paste(char1,char2)
}
