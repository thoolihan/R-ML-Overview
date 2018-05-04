library(caret)
library(ModelMetrics)

houses_raw <- read.csv("data/housing/train.csv")

houses <- houses[, c('LotArea', 'Neighborhood', 'YearBuilt', 'TotRmsAbvGrd', 'FullBath', 'HalfBath',
                     'GrLivArea', 'TotalBsmtSF', 'SalePrice')]


dim(houses)
pairs(houses)

trctl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)
model <- train(SalePrice ~ .,
               data = houses,
               method = "lasso",
               trControl = trctl,
               preProcess = c('center', 'scale'))

mae(houses$SalePrice, model$pred$pred)


