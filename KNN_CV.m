function accuracy = KNN_CV(data, N, K)

X = data(:, 1:end-1);
Y = data(:, end);

cv = cvpartition(Y, 'KFold', N);
accuracy =  zeros(N, 1);

for i=1:N
    trainIdx = training(cv, i);
    testIdx = test(cv, i);
    
    Model = fitcknn(X(trainIdx, :), Y(trainIdx), 'NumNeighbors', K);
    
    predictions = predict(Model, X(testIdx, :));
    
    accuracy(i) = sum(predictions == Y(testIdx)) / numel(predictions);
end

accuracy = mean(accuracy);