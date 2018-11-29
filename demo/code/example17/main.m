
clear, clc
%% Import data
x=[1.5, 4.5, 7.5,10.5,13.5,16.5,19.5,22.5,25.5];
y=[7.0,4.8,3.6,3.1,2.7,2.5,2.4,2.3,2.2];

%% Visualization
figure
plot(x,y,'ro') 
grid on

%% model1: log
mdl1 = @(b,x) b(1) + b(2)*log(x);
nonlinfit1 = fitnlm(x,y,mdl1,[0.01;0.01]);
b=nonlinfit1.Coefficients.Estimate;
Y1=b(1,1)+b(2,1)*log(x);

figure
hold on
plot(x,y,'ro') 
plot(x,Y1,'-b','linewidth',2)
grid on

%% model2: exp
m2 = 'y ~ b1*x^b2';
nonlinfit2 = fitnlm(x,y,m2,[1;1]);
b1=nonlinfit2.Coefficients.Estimate(1,1);
b2=nonlinfit2.Coefficients.Estimate(2,1);
Y2=b1*x.^b2;

figure
hold on
plot(x,y,'ro') 
plot(x,Y2,'-b','linewidth',2)
grid on
