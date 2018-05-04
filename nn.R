library(mlbench)
library(caret)
library(tensorflow)
library(keras)

data(DNA)

n_classes <- length(unique(DNA$Class))
batch_size = 256
epochs = 100

encoder <- dummyVars(~ Class, data = DNA)
y <- predict(encoder, newdata = DNA)
dim(y)

X <- DNA[, 1:(ncol(DNA)-1)]
X <- sapply(X, as.integer)
X <- as.matrix(X)

idx <- createDataPartition(DNA$Class,
                           p = .7,
                           list = FALSE)

x_train <- X[idx,]
x_test <- X[-idx,]

y_train <- y[idx,]
y_test <- y[-idx,]

model <- keras_model_sequential()

model %>%
  layer_dense(180, input_shape = dim(x_train)[2]) %>%
  layer_activation('relu') %>%
  layer_dropout(.4) %>%
  layer_dense(90) %>%
  layer_activation('relu') %>%
  layer_dropout(.4) %>%
  layer_dense(n_classes) %>%
  layer_activation('softmax')

model %>% compile(
  optimizer = optimizer_rmsprop(),
  loss = 'categorical_crossentropy',
  metrics = c('accuracy')
)


history <- model %>%
  fit(x = x_train,
      y = y_train,
      batch_size = batch_size,
      epochs = epochs,
      validation_split = .2)

loss_and_metrics <- evaluate(model, x_test, y_test)
str(loss_and_metrics)

y_pred <- predict_classes(model, x_test)
y_test_actual <- as.integer(DNA$Class[-idx]) - 1
confusionMatrix(y_pred, y_test_actual)
