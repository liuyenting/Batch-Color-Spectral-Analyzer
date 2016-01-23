clear all, close all, clc %#ok<CLALL,DUALC>

figure(1);
delta = 1; % Shift the text away from the data point.

%
% CHANNEL: RED
%

dir_name = './red/';
files = dir(fullfile(dir_name, '*.ppm'));
files = {files.name}';

% Store the file contents here.
red_data = cell(numel(files), 1);
tic
parfor i = 1:numel(files)
    file_name = fullfile(dir_name, files{i});
    red_data{i}.image = imread(file_name);
    [~, file_name, ~] = fileparts(file_name);
    red_data{i}.abs_value = str2num(file_name);
    red_data{i}.mean_hist = color_hist_mean(red_data{i}.image);
end
toc

for i = 1:length(red_data)
    val = red_data{i};
    scatter3(val.mean_hist(1), val.mean_hist(2), val.mean_hist(3), ...
             'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'none');
    text(val.mean_hist(1) + delta, val.mean_hist(2) + delta, val.mean_hist(3) + delta, ...
         cellstr(num2str(val.abs_value)));
    hold on
end

%
% CHANNEL: GREEN
%

dir_name = './green/';
files = dir(fullfile(dir_name, '*.ppm'));
files = {files.name}';

% Store the file contents here.
green_data = cell(numel(files), 1);
tic
parfor i = 1:numel(files)
    file_name = fullfile(dir_name, files{i});
    green_data{i}.image = imread(file_name);
    [~, file_name, ~] = fileparts(file_name);
    green_data{i}.abs_value = str2num(file_name);
    green_data{i}.mean_hist = color_hist_mean(green_data{i}.image);
end
toc

for i = 1:length(green_data)
    val = green_data{i};
    scatter3(val.mean_hist(1), val.mean_hist(2), val.mean_hist(3), ...
             'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'none');
    text(val.mean_hist(1) + delta, val.mean_hist(2) + delta, val.mean_hist(3) + delta, ...
         cellstr(num2str(val.abs_value)));
    hold on
end

%
% CHANNEL: BLUE
%

dir_name = './blue/';
files = dir(fullfile(dir_name, '*.ppm'));
files = {files.name}';

% Store the file contents here.
blue_data = cell(numel(files), 1);
tic
parfor i = 1:numel(files)
    file_name = fullfile(dir_name, files{i});
    blue_data{i}.image = imread(file_name);
    [~, file_name, ~] = fileparts(file_name);
    blue_data{i}.abs_value = str2num(file_name);
    blue_data{i}.mean_hist = color_hist_mean(blue_data{i}.image);
end
toc

for i = 1:length(blue_data)
    val = blue_data{i};
    scatter3(val.mean_hist(1), val.mean_hist(2), val.mean_hist(3), ...
             'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'none');
    text(val.mean_hist(1) + delta, val.mean_hist(2) + delta, val.mean_hist(3) + delta, ...
         cellstr(num2str(val.abs_value)));
    hold on
end

axis equal
xlabel('R mean');
ylabel('G mean');
zlabel('B mean');


clear dir_name files;