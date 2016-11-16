%% Load Datafiles
clear all;
close all;
% load all txt files in certain map
dirName = 'C:\Users\Jelmer\Documents\biometrics\datasets\';                 %# folder path
files = dir( fullfile(dirName,'*.txt') );                                   %# list all *.xyz files
files = {files.name}';                                                      %# file names
file_number = numel(files);                                                 %amount of data sets available
data = cell(file_number,1);                                                 %# store file contents
for i=1:file_number
    fname = fullfile(dirName,files{i});     %# full path to file
    data{i} = importdata(fname);        %# load file
end

%% Delete false pin entries
for i=1:file_number                                                        %for all persons
    number_of_presses = size(data{i,1},1);
    for j = 1:4:number_of_presses
        if (data{i,1}(j,1) == 2) & (data{i,1}(j+1,1) == 3) & ...
            (data{i,1}(j+2,1) == 7) & (data{i,1}(j+3,1) == 5)
            corrected_data{i,1}(j, :) = data{i,1}(j, :);
            corrected_data{i,1}(j+1, :) = data{i,1}(j+1, :);
            corrected_data{i,1}(j+2, :) = data{i,1}(j+2, :);
            corrected_data{i,1}(j+3, :) = data{i,1}(j+3, :);
        end;
    end;                                      %for each 4 presses of the person
end;
for k=1:file_number
corrected_data{k,1}( all(~corrected_data{k,1},2), : ) = [];                % removes all rows with all zero
end;     

%% Define variables
    

%% Calculations

%% Plot options

%% Plots

