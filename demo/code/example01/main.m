
clear, clc
%% Discrete dynamical system I
clear, clc

A = [0.95 0.03;
     0.05 0.97];
x = [0.6; 0.4];

X = [];
for k = 1:100
  X = [X, x];
  x = A*x;
end

figure
hold on
for k = 1:100
  plot([0,X(1,k)],[0,X(2,k)])
  drawnow
end
grid on
xlabel('Urban')
ylabel('Suburb')

plot([0 0.3750],[0 0.6250],'r-*','LineWidth',3)

%% Discrete dynamical system II
clear, clc

A = [0.95 0.03;
     0.05 0.97];
x = [0.2; 0.8];

X = [];
for k = 1:100
  x = A*x;
  X = [X, x];
end

figure
hold on
for k = 1:100
  plot([0,X(1,k)],[0,X(2,k)])
  drawnow
end
grid on
xlabel('Urban')
ylabel('Suburb')

plot([0 0.3750],[0 0.6250],'r-*','LineWidth',3)

%% Discrete dynamical system III
clear, clc

A = [0.95 0.03;
     0.05 0.97];
x = [0.3750; 0.6250];

X = [];
for k = 1:50
  x = A*x;
  X = [X, x];
end

figure
hold on
for k = 1:50
  plot([0,X(1,k)],[0,X(2,k)],'-*')
  drawnow
end
grid on
xlabel('Urban')
ylabel('Suburb')













