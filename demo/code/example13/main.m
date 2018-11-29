
clear, clc
%% 
theta=60;                              
th=theta*pi/180;                       
tm=40;                                
dt=0.005;                             
t=0:dt:tm;                             
%----------------------------------------------------------
u=t*sqrt(cos(th)/2);                  
fsin=inline('sin(x.^2)');             
fcos=inline('cos(x.^2)');             
x=sin(th)*cumsum(fcos(u))*dt;      
y=-sin(th)*cumsum(fsin(u))*dt;         
z=cos(th)*t;                                        
%-------------------------------------------------------
r={x,y,z};                           
fs=16;                               
figure                                
for i=1:3                              
    subplot(3,1,i)                     
    plot(t,r{i},'LineWidth',2)         
    grid on                            
    if i==1, title('Motion','FontSize',fs),end
    xlabel('\it\omegat','FontSize',fs) 
    ylabel(['\it',char(double('x')+i-1),'/R'],'FontSize',fs)
end                                    
zm=max(z);                             
text(0,zm,['\it\theta\rm=',num2str(theta),'\circ'],'FontSize',fs)
text(tm/2,zm/2,'\it\omega\rm=(\itKqv\rm_0/\itm\rm)^{1/2}','FontSize',fs)
text(0,zm/2,'\itR\rm=\itv\rm_0/\it\omega','FontSize',fs)
axis tight
%% -----------------------------------------------------
figure                                
comet3(x,y,z)                         
plot3(x,y,z)                          
title('Motion trace','FontSize',fs)
xlabel('\itx/R','FontSize',fs)         
ylabel('\ity/R','FontSize',fs)       
zlabel('\itz/R','FontSize',fs)         
grid on                              
box on                                
xm=sin(th)/2*sqrt(pi/cos(th));       
hold on                                
plot3([1,1]*xm,[-1,-1]*xm,[0,zm*1.1],'r--','LineWidth',3)
txt=[num2str(xm),',',num2str(-xm),',0'];
text(xm,-xm,0,txt,'FontSize',fs)       
