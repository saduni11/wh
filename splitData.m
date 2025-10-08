function [test, train] = splitData(data)

[m, n] = size(data);

indices = randperm(m);
data = data(indices, :);

test = [];
train = [];

nTr = round(m * 0.7);
test = data(1:nTr, :);
train = data(nTr+1:m , :);
