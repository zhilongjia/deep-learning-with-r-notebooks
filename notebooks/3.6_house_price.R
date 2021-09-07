
library(keras)

# regression

dataset <- dataset_boston_housing()

c(c(train_data, train_targets), c(test_data, test_targets)  ) %<-% dataset

str(train_data)
str(test_data)

str(train_targets)

# normalization
meanX <- apply(train_data, 2, mean )
stdX <- apply(train_data, 2, sd)

train_data <- scale(train_data, center=meanX, scale=stdX)
test_data <- scale(test_data, center = meanX, scale=stdX)

# construct a network

build_model <- function() {
    model <- keras_model_sequential() %>% 
        layer_dense(units=64, activation = "relu", input_shape = dim(train_data)[2] ) %>% 
        layer_dense(units=64, activation = "relu") %>% 
        layer_dense(units=1)
    model %>% compile(optimizer="rmsprop", loss="mse", metrics=c("mae") )
}

#############################################################################################################
# version 1
# cross-validation
k <- 4
set.seed(301)
ind <- sample(1:nrow(train_data) )
folds <- cut(1:length(ind), breaks=k, labels=FALSE )

num_epochs <- 100
all_scores <- c()

for (i in 1:k) {
    # i <- 1
    cat ("fold # ", i, "\n")
    
    val_ind <- which(folds==i, arr.ind=TRUE)
    val_data <- train_data[val_ind,]
    val_targets <- train_targets[val_ind]
    
    partial_train_data <- train_data[-val_ind,]
    partial_train_targets <- train_targets[-val_ind]
    
    model <- build_model()
    
    model %>%  fit(partial_train_data, partial_train_targets, epochs=num_epochs, batch_size=1, verbose=0 )
    
    results <- model %>% evaluate(val_data, val_targets, verbose=0)
    # all_scores <- c(all_scores, results$mean_absolute_error )
    all_scores <- c(all_scores, results["mae"] )

}


mean(all_scores)

#############################################################################################################
# version 2
# save log

um_epochs <- 500
all_mae_scores <- c()

for (i in 1:k) {
    # i <- 1
    cat ("fold # ", i, "\n")
    
    val_ind <- which(folds==i, arr.ind=TRUE)
    val_data <- train_data[val_ind,]
    val_targets <- train_targets[val_ind]
    
    partial_train_data <- train_data[-val_ind,]
    partial_train_targets <- train_targets[-val_ind]
    
    model <- build_model()
    
    history_log <- model %>%  fit(partial_train_data, partial_train_targets, validation_data=list(val_data, val_targets), 
                   epochs=num_epochs, batch_size=1, verbose=0 )
    
    # mae_history <- history_log$metrics$val_mean_absolute_error
    mae_history <- history_log$metrics$mae
    all_mae_scores <- rbind(all_mae_scores, mae_history )
    
}


average_mae_history <- data.frame(
    epoch=seq(1:ncol(all_mae_scores)),
              validation_mae=apply(all_mae_scores, 2, mean) )


library(ggplot2)
ggplot(average_mae_history, aes(x=epoch, y=validation_mae) ) + geom_line()


ggplot(average_mae_history, aes(x=epoch, y=validation_mae) ) + geom_smooth()

#############################################################################################################
# training last model
model <- build_model()
model %>%  fit(train_data, train_targets, epochs=80, batch_size=16,  verbose=0)

result <- model %>% evaluate(test_data, test_targets)

result

