# Print the R version details using version
version

# Assign the variable major to the major component
major <- version$major
major

# Assign the variable minor to the minor component
minor <- version$minor
minor


#To determine if it is worth changing your code, you need to compare your existing solution
#with one or more alternatives. This is what we mean by benchmarking. 
#The concept is straightforward. You simply time how long each solution takes, and all things being 
#equal, select the fastest.


#Running this code produces three numbers: user, system and elapsed time. Roughly the user time
#is the CPU time charged for the execution of user instructions. The system time is the CPU time 
#charged for execution by the system on behalf of the calling process. The elapsed time is approximately 
#the sum of user and elapsed; this is the number we typically care about.


# How long does it take to read movies from CSV?
system.time(read.csv("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/movies.csv", header = FALSE))

# How long does it take to read movies from RDS?
system.time(readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/movies.rds"))


# Load the microbenchmark package
library(microbenchmark)

# Compare the two functions
compare <- microbenchmark(read.csv("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/movies.csv", header = FALSE), 
                          readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/movies.rds"), 
                          times = 10)

# Print compare
print(compare)


# Load the benchmarkme package
library(benchmarkme)

# Assign the variable ram to the amount of RAM on this machine
ram <- get_ram() #couldnot determined the RAM
ram <- system("wmic MemoryChip get Capacity", intern=TRUE)
ram

# Assign the variable cpu to the cpu specs
cpu <- get_cpu()
cpu

#The function call benchmark_io records the length of time it takes to read and write a 5MB file.

# Run the io benchmark
res <- benchmark_io(runs = 1, size = 50)

# Plot the results
plot(res)











