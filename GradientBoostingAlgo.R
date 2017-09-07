install.packages('xgboost')
library('xgboost')
data(agaricus.train, package='xgboost')
data(agaricus.test,package='xgboost')
train <- agaricus.train
test <- agaricus.test

#numbers <- c(1,2,3,4,5,6)
#name <- c("Ashutosh","Sauvik","Kumar")
#matrix <- matrix(c(10,20,30,40), nrow = 2, ncol = 2)
#create_list <- list(numbers,name,matrix)
str(train)
#create_list[[1]]
class(train$data)
dim(train$data)
nrow(train$data)
ncol(train$data)

bstSparse <-  xgboost(data = train$data, label = train$label, max_depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")

prediction <- predict(bstSparse,test$data)
predicted_value<- ifelse(prediction>0.5,1,0)
table_values <- table(predicted_value,test$label)
sum(diag(table_values))/sum(table_values)
