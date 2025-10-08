function [test, train] = scaleData(train, test)

[m, n] = size(train);

normalMin = -1;
normalMax = 1;

for i=1:n-1
    realMin = min(train(:, i));
    realMax = max(train(:, i));
    ratio = (normalMax - normalMin) / (realMax - realMin);
    train(:, i) = (ratio * (train(:, i) - realMin)) + normalMin;
    test(:, i) = (ratio * (test(:, i) - realMin)) + normalMin;
end
