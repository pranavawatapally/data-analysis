#2(b) Finding the optimal profit and optimal values of the decision variables

library(lpSolveAPI)

lprec <- make.lp(0, 9)

lp.control(lprec, sense= "maximize")

set.objfn(lprec, c(25,10,5,21,6,1,25,10,5))

add.constraint(lprec, c(1, 1, 1, 0,0,0,0,0,0), "<=", 4500)

add.constraint(lprec, c(0,0,0,1,1,1,0,0,0), "<=", 4000)

add.constraint(lprec, c(0,0,0,0,0,0,1,1,1), "<=", 4000)

add.constraint(lprec, c(0.50,-0.50,-0.50,0,0,0,0,0,0), ">=", 0)
add.constraint(lprec, c(0,0,0,0.40,-0.60,-0.60,0,0,0), ">=", 0)
add.constraint(lprec, c(0,0,0,0,0,0,0.60,-0.40,-0.40), ">=", 0)
add.constraint(lprec, c(-0.30,0.70,-0.30,0,0,0,0,0,0), ">=", 0)

add.constraint(lprec, c(0,0,0,-0.40,0.60,-0.40,0,0,0), ">=", 0)
add.constraint(lprec, c(0,0,0,0,0,0,-0.50,0.50,-0.50), ">=", 0)


RowNames <- c("Constraint 1", "Constraint 2", "Constraint 3",  "Constraint 4", "Constraint 5", "Constraint 6", "Constraint 7", "Constraint 8", "Constraint 9")

ColNames <- c("xc1", "xw1", "xs1", "xc2","xw2","xs2","xc3","xw3","xs3")

dimnames(lprec) <- list(RowNames, ColNames)

solve(lprec) 

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec) 

lprec



#3 Question

#HELEN

library(lpSolveAPI)
matrix1 <- make.lp(0,8)
lp.control(matrix1, sense= "maximize")
set.objfn(matrix1,c(0,0,0,0,0,0,0,1))

add.constraint(matrix1,c(-1,-1,0,-1,0,0,-1,-1), "<=", 0)
add.constraint(matrix1,c(0,-1,-1,0,-1,-1,0,1), "<=", 0)
add.constraint(matrix1,c(0,0,-1,-2,-1,0,0,1), "<=", 0)
add.constraint(matrix1,c(-1,-1,0,-1,0,0,-1,-1), "<=", 0)
add.constraint(matrix1,c(0,-1,-1,0,-1,-1,0,-1), "<=", 0)
add.constraint(matrix1,c(-1,-1,0,0,0,-1,-1,-1), "<=", 0)

add.constraint(matrix1,c(1,1,1,1,1,1,1,0), "<=", 0)

solve(matrix1)
get.objective(matrix1)
get.variables(matrix1)

matrix1

#DAVID
matrix1<-make.lp(0,7)
lp.control(matrix1,sense="maximize")
set.objfn(matrix1, c(0,0,0,0,0,0,1))

add.constraint(matrix1,c(-1,0,0,0,0,-1,1), ">=", 0)
add.constraint(matrix1,c(-1,-1,0,0,-1,-1,1), ">=", 0)
add.constraint(matrix1,c(0,-1,-1,-1,-1,0,1), ">=", 0)
add.constraint(matrix1,c(0,0,-2,-2,0,0,1), ">=", 0)
add.constraint(matrix1,c(-1,-1,0,0,-1,-1,1), ">=", 0)
add.constraint(matrix1,c(-1,0,0,0,0,-1,1), ">=", 0)

add.constraint(matrix1,c(1,1,1,1,1,1,0), "=",1)


solve(matrix1)
get.objective(matrix1)
get.variables(matrix1)
get.constraints(matrix1)

matrix1