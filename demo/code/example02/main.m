
clear, clc
%% Before cutting down trees
clear, clc

A = [0 0 0.33;
     0.30 0 0;
     0 0.71 0.94];
x = [20;20;20];

X = [];
for k = 1:200
  X = [X, x];
  x = A*x;
end

figure
comet3(X(1,:),X(2,:),X(3,:)) 
plot3(X(1,:),X(2,:),X(3,:),'-o')
grid on
xlabel('I')
ylabel('II')
zlabel('III')

%% After cutting down trees
clear, clc

A = [0 0 0.33;
     0.18 0 0;
     0 0.71 0.94];
x = [20;20;20];

X = [];
for k = 1:200
  X = [X, x];
  x = A*x;
end

figure
comet3(X(1,:),X(2,:),X(3,:)) 
plot3(X(1,:),X(2,:),X(3,:),'-o')
grid on
xlabel('I')
ylabel('II')
zlabel('III')