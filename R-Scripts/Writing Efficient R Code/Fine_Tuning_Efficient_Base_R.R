
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












