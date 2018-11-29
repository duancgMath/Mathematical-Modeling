
clear, clc
%% 
for N = 2:5
x0 = rand((N-2)*3+1,1);
opts = optimoptions(@fmincon,'Algorithm','sqp');
problem = createOptimProblem('fmincon','objective',...
    @fun_energy,'x0',rand((N-2)*3+1,1),'lb',-5*ones((N-2)*3+1,1),...
    'ub',5*ones((N-2)*3+1,1),'options',opts);
ms = MultiStart;
[x,f] = run(ms,problem,20)
plotDemo(x)
end
%% ------------ Functions -------------

function [f,positions] = fun_energy(x)
n = (length(x)-1)/3;
positions = zeros(3,n+2);
positions(:,1) = [0;0;0];
positions(:,2) = [0;0;x(1)];
pos = zeros(3,n);
for index = 1:length(x)-1
  pos(index) = x(index+1);
end
positions(:,3:end) = pos;

f = 0;
for k = 1:n+1
  for j = k+1:n+2
    delta = positions(:,k)-positions(:,j);
    rsqu = delta'*delta;
    energy = 1/(rsqu^6)-2/(rsqu^3);
    f = f+energy;
  end
end
end

function plotDemo(x)
n = (length(x)-1)/3;
positions = zeros(3,n+2);
positions(:,1) = [0;0;0];
positions(:,2) = [0;0;x(1)];
pos = zeros(3,n);
for index = 1:length(x)-1
  pos(index) = x(index);
end
positions(:,3:end) = pos;

figure
plot3(positions(1,:),positions(2,:),positions(3,:),'o','MarkerSize',20)
grid on
end


