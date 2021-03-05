library(microbenchmark)


n <- 30000

# Slow code
growing <- function(n) {
  x <- NULL
  for(i in 1:n)
    x <- c(x, rnorm(1))
  x
}

# Use <- with system.time() to store the result as res_grow
system.time(res_grow <- growing(n))


# Fast code
pre_allocate <- function(n) {
  x <- numeric(n) # Pre-allocate
  for(i in 1:n) 
    x[i] <- rnorm(1)
  x
}

# Use <- with system.time() to store the result as res_allocate
system.time(res_allocate <- pre_allocate(n))


x <- rnorm(10)
#x2 <- numeric(length(x))
#for(i in 1:10)
#  x2[i] <- x[i] * x[i]

# Use vectorization approach for above code:
# Store your answer as x2_imp
x2_imp <- x * x
x2_imp

# Initial code
n <- 100
total <- 0
x <- runif(n)
for(i in 1:n) 
  total <- total + log(x[i])

# Rewrite in a single line. Store the result in log_sum
log_sum <- sum(log(x))

microbenchmark(log_sum <- sum(log(x)), for(i in 1:n) {total <- total + log(x[i])}, times = 30)

mat <- matrix(1:10000, byrow = TRUE, nrow = 100, ncol = 100)
df <- as.data.frame(mat)

# Which is faster, mat[, 1] or df[, 1]? 
microbenchmark(mat[, 1], df[, 1])

class(df[1, ])

# Which is faster, mat[1, ] or df[1, ]? 
microbenchmark(mat[1, ], df[1, ])

# Accessing a row of a data frame is much slower than accessing that of a matrix, more so than 
#when accessing a column from each data type. This is because the values of a column of a data frame 
#must be the same data type, whereas that of a row doesn't have to be.






