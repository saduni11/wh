data = load('iris.txt');
accuracy = KNN(data, 1);

data = load('iris.txt');
disp(sum(ismissing(data)));
X_clean=rmmissing(data);
X_fill=fillmissing(data,'linear');
X_norm=normalize(X_clean,'range');
X_std=zscore(X_clean);
