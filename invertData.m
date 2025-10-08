function data = invertData(data, class)

indices = (data(:, end) == class);
data(indices, end) = 1;

ind = ~indices;
data(ind, end) = -1;