


the.data <- as.matrix(read.table("Energy19.txt "))
my.data <- the.data[sample(1:671,300),c(1:6)]


colnames(my.data) =c ("a","b","c","d","e","y")
View(my.data)
plot.default(my.data[,1],my.data[,2])
plot.default(my.data[,2],my.data[,6])
plot.default(my.data[,2],my.data[,6])
plot.default(my.data[,3],my.data[,2])
plot.default(my.data[,4],my.data[,6])
plot.default(my.data[,5],my.data[,6])
plot.default(my.data[,5],my.data[,6])
hist.default(my.data[,1])
hist.default(my.data[,6])
hist.default(my.data[,5])
hist.default(my.data[,5])
hist.default(my.data[,4])
hist.default(my.data[,2])
