load carbig

tbl = table(Horsepower, Weight, Acceleration, Cylinders, MPG);

disp('Number of missing values per column:')
disp(sum(ismissing(tbl)))

tbl_clean = rmmissing(tbl);
fprintf('After removing missing values: %d rows remain\n', height(tbl_clean));
tbl_fill = fillmissing(tbl, 'linear');

X = tbl_clean{:,{'Horsepower', 'Weight', 'Acceleration'}};
X_norm = normalize(X, 'range');
X_std = zscore(X);

figure;
subplot(1,3,1); histogram(X(:,1)); title('Original Horsepower');
subplot(1,3,2); histogram(X_norm(:,1)); title('Normalised Horsepower');
subplot(1,3,3); histogram(X_std(:,1)); title('Standardised Horsepower');

tbl_clean.Cylinders = categorical(tbl_clean.Cylinders);
cyl_encoded = dummyvar(tbl_clean.Cylinders);
X_final = [X_std cyl_encoded];

corrVals =corr(tbl_clean{:,{'Horsepower','Weight','Acceleration'}},tbl_clean.MPG,'Rows','complete');
disp('Correlation of features with MPG:')
disp(array2table(corrVals, 'VariableNames',{'Correlation'},'RowNames',{'Horsepower','Weight','Acceleration'}));