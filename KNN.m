function accuracy = KNN(data, K)

X = data(:, 1: end - 1);
Y = data(:, end);

cv = cvpartition(Y, 'HoldOut', 0.3);

xtrain = X(training(cv), :);
ytrain = Y(training(cv), :);
xtest = X(test(cv), :);
ytest = Y(test(cv), :);

Model = fitcknn(xtrain, ytrain,'NumNeighbors', K);

prediction = predict(Model, xtest);

rate = sum(prediction == ytest) / numel(prediction)

accuracy = rate * 100;
