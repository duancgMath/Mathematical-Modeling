
clear, clc
%% Import data
x=[23.80,27.60,31.60,32.40,33.70,34.90,43.20,52.80,63.80,73.40];
y=[41.4,51.8,61.70,67.90,68.70,77.50,95.90,137.40,155.0,175.0];

%% Visualization
figure
plot(x,y,'r*') 
grid on

%% Linear Model
mdl = LinearModel.fit(x,y);

%% Visualization
yy = mdl.predict(x');

figure
hold on
plot(x,y,'r*') 
plot(x,yy,'b-')
grid on
