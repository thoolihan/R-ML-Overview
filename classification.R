library(ggplot2)
library(caret)
library(ModelMetrics)

dim(iris)

trctl <- trainControl(method="cv", repeats=3, 
                      savePredictions = TRUE)

model <- train(Species ~ .,
               data = iris,
               method = "svmRadial",
               trControl = trctl,
               preprocess = c('scale'))

caret::confusionMatrix(model$pred$obs, model$pred$pred)$table

