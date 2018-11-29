
clear, clc
%%  ------ Orbit: one-body problem --------

%% Euler: Step = 0.01
orbitEuler([0 100],[0 1 2 0],10000)

%% Euler: Step = 0.005
orbitEuler([0 100],[0 1 2 0],50000)

%% Trap: Step = 0.01
orbitTrap([0 100],[0 1 2 0],10000)

%% ------------ Functions ----------------------
% Inputs: time interval inter, initial conditions
% ic = [x0 vx0 y0 vy0], x position, x velocity, y pos, y vel,
% number of steps n
% Example usage: orbit([0 100],[0 1 2 0],10000,5)
function z=orbitEuler(inter,ic,n)
h=(inter(2)-inter(1))/n;      
x0=ic(1);vx0=ic(2);y0=ic(3);vy0=ic(4);  
y(1,:)=[x0 vx0 y0 vy0];t(1)=inter(1);    
% ------ Solver -----------
h=(inter(2)-inter(1))/n;      
x0=ic(1);vx0=ic(2);y0=ic(3);vy0=ic(4);   
y(1,:)=[x0 vx0 y0 vy0];t(1)=inter(1);    
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=eulerstep(t(k),y(k,:),h);
end
% ------------ Visualization -----------------
figure
hold on
set(gca,'XLim',[-5 5],'YLim',[-5 5],'XTick',[-5 0 5],'YTick',...
  [-5 0 5],'Visible','on');
cla;
sun=line('color','y','Marker','.','markersize',25,...
  'xdata',0,'ydata',0);
drawnow;
comet(y(:,1),y(:,3))
plot(y(:,1),y(:,3),'-','LineWidth',2)
hold off
grid on

end



function z=orbitTrap(inter,ic,n)
h=(inter(2)-inter(1))/n;        % plot n points 
x0=ic(1);vx0=ic(2);y0=ic(3);vy0=ic(4);   % grab initial conds
y(1,:)=[x0 vx0 y0 vy0];t(1)=inter(1);    % build y vector
% ------ Solver -----------  
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h);
end
% ------------ Visualization -----------------
figure
hold on
set(gca,'XLim',[-5 5],'YLim',[-5 5],'XTick',[-5 0 5],'YTick',...
  [-5 0 5],'Visible','on');
cla;
sun=line('color','y','Marker','.','markersize',25,...
  'xdata',0,'ydata',0);
drawnow;
comet(y(:,1),y(:,3))
plot(y(:,1),y(:,3),'-','LineWidth',2)
hold off
grid on

end

function y=eulerstep(t,x,h)
%one step of the Euler method
y=x+h*ydot(t,x);
end

function y = trapstep(t,x,h)
%one step of the Trapezoid Method
z1=ydot(t,x);
g=x+h*z1;
z2=ydot(t+h,g);
y=x+h*(z1+z2)/2;
end

function z = ydot(t,x)
m2=3;g=1;mg2=m2*g;px2=0;py2=0;
px1=x(1);py1=x(3);vx1=x(2);vy1=x(4);
dist=sqrt((px2-px1)^2+(py2-py1)^2);
z=zeros(1,4);
z(1)=vx1;
z(2)=(mg2*(px2-px1))/(dist^3);
z(3)=vy1;
z(4)=(mg2*(py2-py1))/(dist^3);
end