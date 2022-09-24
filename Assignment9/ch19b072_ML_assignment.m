% Reading the csv file
dataframe = readtable('Housing_Price.csv');

% ID is just for numbering, hence, wont be useful for our analysis
df_without_id=dataframe(:,2:8);

% Normalization of dataset
df_normalized=normalize(df_without_id);

% Splitting the dataset into train, test and validation 
[nrows,nfeatures] = size(df_normalized);
train_ratio = 0.70;
validation_ratio= 0.20;
idx = randperm(nrows);

train_data= df_normalized(idx(1:round(train_ratio*nrows)),:) ;
valid_data = df_normalized(idx(round(train_ratio*nrows)+1:round((train_ratio+validation_ratio)*nrows)),:);
test_data=df_normalized(idx(round((train_ratio+validation_ratio)*nrows)+1:end),:);

x_val=valid_data(:,1:6);
y_val=valid_data(:,7);

x_test=test_data(:,1:6);
y_test=test_data(:,7);

% Finding out the best combination of features
combs=nchoosek(1:6,3);
errors=[];
for i=1:length(combs)
    train=train_data(:,combs(i,:));
    val=x_val(:,combs(i,:));
    model=fitlm(train);
    y_pred=predict(model,x_val);
    y_eval_v=table2array(y_val);
    mean_squared_err=((y_eval_v-y_pred)'*(y_eval_v-y_pred))/length(y_eval_v);
    errors(i)=mean_squared_err;
end

% Finding out the best combination :  the one produces least mean
% squared error on validation data
[min_sqe,min_index]=min(errors);
best_comb=combs(min_index,:);

%Building the model using the best combination
train=train_data(:,best_comb);
best_model=fitlm(train);

%Reporting accuracy on the test data
y_pred=predict(best_model,x_test(:,best_comb));
y_test_v=table2array(y_test);
msqe_test=((y_test_v-y_pred)'*(y_test_v-y_pred))/length(y_test_v);



