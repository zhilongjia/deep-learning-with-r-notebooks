
library(keras)

imdb <- dataset_imdb(num_words = 10000)

str(imdb)
c(c(train_data, train_labels), c(test_data, test_labels) ) %<-% imdb

train_data[[1]]

vec_seq <- function(alist, ncol=10000) {
    res <- matrix(0, nrow=length(alist), ncol=ncol)
    for (i in 1:length(alist)) {
        res[i, alist[[i]] ] <- 1
    }
    res    
}

x_train <- vec_seq(train_data)
x_test <- vec_seq(test_data)

y_train <- as.numeric(train_labels)
y_test <- as.numeric(test_labels)



################################################################################
model <- keras_model_sequential() %>% 
    layer_dense(units=16, activation = "relu", input_shape =c(10000) ) %>% 
    layer_dense(units = 16, activation = "relu") %>% 
    layer_dense(units = 16, activation = "relu") %>% 
    layer_dense(units = 1, activation = "sigmoid")


model %>% compile(optimizer="rmsprop", loss="binary_crossentropy", metrics=c("accuracy") )

################################################################################
# use validation data to get the epochs
val_ind <- 1:10000

x_val <- x_train[val_ind,]
par_x_train <- x_train[-val_ind,]

y_val <- y_train[val_ind]
par_y_train <- y_train[-val_ind]


res1 <- model %>% fit(par_x_train, par_y_train, epochs=20, batch_size=512, validation_data=list(x_val, y_val) )
plot(res1)

################################################################################
# for get acc of test
model <- keras_model_sequential() %>% 
    layer_dense(units=16, activation = "relu", input_shape =c(10000) ) %>% 
    layer_dense(units = 16, activation = "relu") %>% 
    layer_dense(units = 1, activation = "sigmoid")


model %>% compile(optimizer="rmsprop", loss="binary_crossentropy", metrics=c("accuracy") )

model %>% fit(x_train, y_train, epochs=4, batch_size=512)

res2 <- model %>% evaluate(x_test, y_test)

res2


model %>% predict(x_test[1:10,])

