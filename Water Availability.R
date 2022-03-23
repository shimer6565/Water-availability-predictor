# PREDICTING WATER AVAILABILITY USING
# MULTIPLE LINEAR REGRESSION MODELS

# Loading the data
data_in = read.csv("data.csv")
data_in
# Short summary about the data in the CSV file
summary(data_in)

# Plotting the line graph between Year and BSAAM
# using the inbuilt plot function
plot(data_in$Year,data_in$BSAAM,type = 'o',xlab = "Year", ylab = "Runoff Volume",col = "red", main = "RELATIONSHIP BETWEEN YEAR AND RUNOFF VOLUME")

# Scatter plot which shows the correlation between data
pairs(data_in[,2:8])
# Printing the correlation values between the data using cor() function 
cor(data_in)


# Shuffling the data in a random order and indexing them
p1 = runif(nrow(data_in))
p2 = order(p1)

# Partitioning the data for both training and test set
# 70% data for training
training_ds = data_in[p2[0:30],]
# 30% data for testing
test_ds = data_in[p2[31:43],]

# Building regression model using the precipitation 
# measurements taken from six sights in Owens Valley 
model_1= lm(BSAAM ~ APMAM+APSAB+APSLAKE+OPBPC+OPRC+OPSLAKE , data = training_ds)
summary(model_1)

# Prediction using model 1:
predict_values=predict(model_1,newdata = test_ds)
test_ds$PREDICTED_1 = predict_values
write.csv(test_ds, file = 'TEST DATA.csv',row.names = FALSE,na = '-9999')

# Coefficients of the regression equation
a <- coef(model_1)[1]
b0 <- coef(model_1)[2]
b1 <- coef(model_1)[3]
b2 <- coef(model_1)[4]
b3 <- coef(model_1)[5]
b4 <- coef(model_1)[6]
b5 <- coef(model_1)[7]

# Regression equation
# y = a + b0*x1 + b1*x2 + b2*x3 + b3*x4 + b4*x5 + b5*x6
sprintf("y = %f + %f x1 + %f x2 + %f x3 + %f x4 + %f x5 + %f x6",a,b0,b1,b2,b3,b4,b5)

# Building regression model using the precipitation 
# measurements taken from OPBPC, OPRC, OPSLAKE in Owens Valley 
model_2= lm(BSAAM ~OPBPC+OPRC+OPSLAKE , data = training_ds)
summary(model_2)

# Prediction using model 2:
predict_values=predict(model_2,newdata = test_ds)
test_ds$PREDICTED_2 = predict_values
write.csv(test_ds, file = 'TEST DATA.csv',row.names = FALSE,na = '-9999')

# Coefficients of the regression equation
a <- coef(model_2)[1]
b0 <- coef(model_2)[2]
b1 <- coef(model_2)[3]
b2 <- coef(model_2)[4]

# Regression equation
# y = a + b0*x1 + b1*x2 + b2*x3 
sprintf("y = %f + %f x1 + %f x2 + %f x3",a,b0,b1,b2)

# Building regression model using the precipitation 
# measurements taken from OPRC and OPSLAKE in Owens Valley 
model_3= lm(BSAAM ~OPRC+OPSLAKE , data = training_ds)
summary(model_3)

# Prediction using model 3:
predict_values=predict(model_3,newdata = test_ds)
test_ds$PREDICTED_3 = predict_values
write.csv(test_ds, file = 'TEST DATA.csv',row.names = FALSE,na = '-9999')

# Coefficients of the regression equation
a <- coef(model_3)[1]
b0 <- coef(model_3)[2]
b1 <- coef(model_3)[3]

# Regression equation
# y = a + b0*x1 + b1*x2
sprintf("y = %f + %f x1 + %f x2",a,b0,b1)           
     
# Building regression model using the precipitation 
# measurements taken from OPSLAKE in Owens Valley 
model_4= lm(BSAAM ~OPSLAKE , data = training_ds)
summary(model_4)

# Prediction using model 4:
predict_values=predict(model_4,newdata = test_ds)
test_ds$PREDICTED_4 = predict_values
write.csv(test_ds, file = 'TEST DATA.csv',row.names = FALSE,na = '-9999')

# Coefficients of the regression equation
a <- coef(model_4)[1]
b0 <- coef(model_4)[2]

# Regression equation
# y = a + b0*x1
sprintf("y = %f + %f x1",a,b0)

# Building regression model using the precipitation 
# measurements taken from OPBPC and OPSLAKE in Owens Valley 
model_5= lm(BSAAM ~OPBPC+OPSLAKE , data = training_ds)
summary(model_5)

# Prediction using model 5:
predict_values=predict(model_5,newdata = test_ds)
test_ds$PREDICTED_5 = predict_values
write.csv(test_ds, file = 'TEST DATA.csv',row.names = FALSE,na = '-9999')

# Coefficients of the regression equation
a <- coef(model_5)[1]
b0 <- coef(model_5)[2]
b1 <- coef(model_5)[3]

# Regression equation
# y = a + b0*x1 + b1*x2
sprintf("y = %f + %f x1 + %f x2",a,b0,b1)  

# Plotting the predicted values of BSAAM which was found using 5 
# different regression models and comparing them with the actual 
# value of the BSAAM to find the best model to predict the water
# availability in the future.
m1 <- c(test_ds$PREDICTED_1)
m2 <- c(test_ds$PREDICTED_2)
m3 <- c(test_ds$PREDICTED_3)
m4 <- c(test_ds$PREDICTED_4)
m5 <- c(test_ds$PREDICTED_5)

# Plotting line graph for actual value and 5 of the predicted values
plot(test_ds$Year, test_ds$BSAAM, type = "o", col = "black", xlab = "TEST DATAS", ylab = "BSAAM", main = "COMPARING PREDICTED VALUS WITH ACTUAL VALUE OF BSAAM")
lines(test_ds$Year, m1, type = "o", col = "red")
lines(test_ds$Year, m2, type = "o", col = "pink")
lines(test_ds$Year, m3, type = "o", col = "dark green")
lines(test_ds$Year, m4, type = "o", col = "blue")
lines(test_ds$Year, m5, type = "o", col = "purple")
legend("topleft",
       legend = c("Actual Data", "Model 1", "Model 2", "Model 3", "Model 4", "Model 5"), 
       fill = c("black", "red", "pink", "dark green", "blue", "purple"))

# Plotting the accuracy of the models 
v1 <- summary(model_1)$adj.r.squared*100
v2 <- summary(model_2)$adj.r.squared*100
v3 <- summary(model_3)$adj.r.squared*100
v4 <- summary(model_4)$adj.r.squared*100
v5 <- summary(model_5)$adj.r.squared*100

values <- c(v1,v2,v3,v4,v5)

barplot(values,
        main = "Accuracy percentages",
        xlab = "MODELS",
        ylab = "PERCENTAGES",
        names.arg = c("MODEL 1", "MODEL 2", "MODEL 3", "MODEL 4", "MODEL 5"),
        col = c("darkred","green","blue","yellow","violet"),
       ylim=c(70,100),yaxs = "i")
