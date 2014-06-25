%% Figure properties

close all
figure(1);

% GET AND SET

%% Get figure properties GCF

%% Show options pointer example
         % shows pointer examples
%% Change pointer Property Name and Property Value PAIR
         % Property Name and Property Value
%% Change background color

%% Change size and location of Figure window

%% Change name of figure

%% Give handles to more than one figure
close all





%% Change set values in for loop
clear all
close all
clist=[1 1 0.5; 0.5 1 1]; % 2 RGB Vectors





%% subplots
close all
figure(1)


close all
figure(1)

%% GCA

%% Get fontWeight properties 

%% Practive subplot, gcf, gca
clear all
close all
figure(1)
% Set background figure color

% Create handles for two subplots 1 row, 2 cols, 2 plots


% Change background color of subplots, using set and subplot handles


% Change Font type, size and weight





%% Change Title and labels



% Your turn with a2

%% Change x and y limits



% Change tick mark spread 



% Change tick mark label




%%
close all
x = 0:8:100;
y = 300-3*x+4;
p = plot(x, y);
% Set gca properties of plot with Property Name and value pairs


% hold on


% Create error bar variable, create fake noise; normally calculate SD or
% SEM
err = sqrt(2*x);
% Plot error bar variable
e = errorbar(x, y, err); % errorbar(xVal,yVal,+/-Vec)
% Set gca properties of errorbar handle


