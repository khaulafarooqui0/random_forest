#read the data using read.csv 

read.csv("C:\\Users\\KhaulA\\R_Practise\\MODULE7-RANDOM_FOREST\\Customer_Churn.csv")->data5

#install.packages("randomForest")
#install packages
library(caTools)
#split the data  using sapm]e.split
sample.split(data5$gender,SplitRatio=0.7)->div5
subset(data5,div5==T)->train5
View(train5)
subset(data5,div5==F)->test5

#building the random forest model
library(randomForest)
randomForest(gender~MonthlyCharges+tenure, data=train5,ntree=35)-> mod_forest1

mod_forest1
#c.	Getting the importance of independent variables
importance(mod_forest1)
varImpPlot(mod_forest1)
varImpPlot(mod_forest1, col="palegreen4")

#d.	Predicting the values on the 'test' set
predict(mod_forest1,newdata=test5,type="class")->result_forest1
head(result_forest1)     

#e.  building the confusion matrix
table(test5$gender,result_forest1)->co_ma

#f.	Calculating the accuracy
sum(diag(co_ma)/sum(co_ma))
