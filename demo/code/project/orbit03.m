
clear, clc
%%  ------ Orbit: two-body problem --------

%%
orbitTrap([0 200],...
          [2 0.2 2 -0.2 ...
           0   0 0    0 ...
           -2 -0.2 -2 0.2],...
          1000)

%%
orbitTrap([0 200],...
          [2 0.20001 2 -0.2 ...
           0   0 0    0 ...
           -2 -0.2 -2 0.2],...
          1000)

%% ------------ Functions ----------------------

function z=orbitTrap(inter,ic,n)
h=(inter(2)-inter(1))/n;        
x10=ic(1);vx10=ic(2);y10=ic(3);vy10=ic(4); 
x20=ic(5);vx20=ic(6);y20=ic(7);vy20=ic(8); 
x30=ic(9);vx30=ic(10);y30=ic(11);vy30=ic(12);
y(1,:)=[x10 vx10 y10 vy10 x20 vx20 y20 vy20 x30 vx30 y30 vy30];
t(1)=inter(1);    
% ------ Solver -----------  
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h);
end
% ------------ Visualization 01 -----------------
figure
grid on
set(gca,'XLim',[-5 5],'YLim',[-5 5],'Visible','on');
cla;
head1=line('color','r','Marker','*','markersize',10,...
  'xdata',[],'ydata',[]);
head2=line('color','b','Marker','o','markersize',10,...
  'xdata',[],'ydata',[]);
head3=line('color','b','Marker','^','markersize',10,...
  'xdata',[],'ydata',[]);
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h);
  set(head1,'xdata',y(k+1,1),'ydata',y(k+1,3))
  set(head2,'xdata',y(k+1,5),'ydata',y(k+1,7))
  set(head3,'xdata',y(k+1,9),'ydata',y(k+1,11))
  drawnow;
end

% ------------ Visualization 02 -----------------
figure
hold on
set(gca,'XLim',[-5 5],'YLim',[-5 5],'Visible','on');
cla;
drawnow;
comet(y(:,1),y(:,3))
comet(y(:,5),y(:,7))
comet(y(:,9),y(:,11))
plot(y(:,1),y(:,3),'-','LineWidth',2)
plot(y(:,5),y(:,7),'-','LineWidth',2)
plot(y(:,9),y(:,11),'-','LineWidth',2)
hold off
grid on

end

function y = trapstep(t,x,h)
%one step of the Trapezoid Method
z1=ydot(t,x);
g=x+h*z1;
z2=ydot(t+h,g);
y=x+h*(z1+z2)/2;
end

function z = ydot(t,x)
m1 = 0.03; m2 = 0.3; m3 = 0.03;
g=1;
mg1 = m1*g; mg2 = m2*g; mg3 = m3*g;

px1 = x(1); py1 = x(3);
px2 = x(5); py2 = x(7);
px3 = x(9); py3 = x(11);

vx1 = x(2); vy1 = x(4);
vx2 = x(6); vy2 = x(8);
vx3 = x(10); vy3 = x(12);

dist12=sqrt((px2-px1)^2+(py2-py1)^2);
dist23=sqrt((px3-px2)^2+(py3-py2)^2);
dist31=sqrt((px1-px3)^2+(py1-py3)^2);

z(1) = vx1;
z(2) = (mg2*(px2-px1))/(dist12^3)+(mg3*(px3-px1))/(dist31^3);
z(3) = vy1;
z(4) = (mg2*(py2-py1))/(dist12^3)+(mg3*(py3-py1))/(dist31^3);
z(5) = vx2;
z(6) = (mg1*(px1-px2))/(dist12^3)+(mg3*(px3-px2))/(dist23^3);
z(7) = vy2;
z(8) = (mg1*(py1-py2))/(dist12^3)+(mg3*(py3-py2))/(dist23^3);
z(9) = vx3;
z(10) = (mg1*(px1-px3))/(dist31^3)+(mg2*(px2-px3))/(dist23^3);
z(11) = vy3;
z(12) = (mg1*(py1-py3))/(dist31^3)+(mg2*(py2-py3))/(dist23^3);

end








