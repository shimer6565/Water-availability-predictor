# Water-availability-predictor
Predicting water availability is one of the most significant applications of Multiple linear regression models. In this project we will be predicting the Southern California's water supply in future years by using the past data.

The dataset which we used contains 43 years worth of precipitation measurements (in inches) taken at six sights in the Owens Valley, using these data we will predict the stream runoff volume at a sight near Bishop, California. We have divided the 43 years precipitation data and used 70% of them to train the model and 30% of the data to test the model. The predicted data from the models will be stored in a separate CSV file called TEST DATA. Using the pairs function the positively correlated variables are found and used in creating different models for prediction.

We will be creating five different regression models with different variables and calculating the Adjusted R-squared value and using these values we will plot a bar graph by which we can infer which model is highly accurate while predicting the BSAAM value. Similarly we will also be printing a line plot which has data of actual value and the predicted values found using the five models which is also used to conclude the accuracy of the models.

