
# multi-label classification

library(keras)

reuters <- dataset_reuters(num_words = 10000)
c(c(train_data, train_labels), c(test_data, test_labels) ) %<-% reuters


# a number seq to a matrix
vec_seq <- function(alist, ncol=10000) {
    res <- matrix(0, nrow=length(alist), ncol=ncol)
    for (i in 1:length(alist)) {
        res[i, alist[[i]] ] <- 1
    }
    res    
}

x_train <- vec_seq(train_data)
x_test <- vec_seq(test_data)

y_train <- to_categorical(train_labels)
y_test <- to_categorical(test_labels)

model <- keras_model_sequential() %>% 
    layer_dense(units=64, activation = "relu", input_shape = c(10000)) %>% 
    layer_dense(units = 64, activation = "relu") %>% 
    layer_dense(units=46, activation = "softmax")

model %>%  compile(optimizer="rmsprop", loss="categorical_crossentropy", metrics=c("accuracy") )

res1 <- model %>% fit(x_train, y_train, epochs=20, batch_size=512, validation_split=0.2)

plot(res1)

#############################################################################################################
# remodel for last

model <- keras_model_sequential() %>% 
    layer_dense(units=64, activation = "relu", input_shape = c(10000)) %>% 
    layer_dense(units = 64, activation = "relu") %>% 
    layer_dense(units=46, activation = "softmax")

model %>%  compile(optimizer="rmsprop", loss="categorical_crossentropy", metrics=c("accuracy") )

res1 <- model %>% fit(x_train, y_train, epochs=9, batch_size=512, validation_split=0.2)

plot(res1)

res2 <- model %>% evaluate(x_test, y_test)


###########################################################################################################
# random performance (baseline)
test_labels_copy <- test_labels
test_labels_copy <- sample(test_labels_copy)
length(which(test_labels == test_labels_copy) ) / length(test_labels)


