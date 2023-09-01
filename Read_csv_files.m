% Define the folder where your CSV files are located
clc
clear all
clearvars

folder = uigetdir();

% List all the CSV files in the folder
csvFiles = dir(fullfile(folder, '*.csv'))


% Initialize a cell array to store the data from each CSV file
data = cell(1, numel(csvFiles));

no_of_files = size(data);
no_of_files = no_of_files(1,2);
no_of_rows = size(data{1});
no_of_rows = no_of_rows(1,1);

y = zeros(no_of_rows,no_of_files);
x = zeros(no_of_rows,1);
% Loop through each CSV file and read its contents
for i = 1:numel(csvFiles)
    % Get the file name
    fileName = fullfile(folder, csvFiles(i).name);
    
    % Read the CSV file into a table
    data{i} = readtable(fileName);
    a = table2array(data{i});
    x = a(:,1);
    y(:,i) = a(:,2);
end
