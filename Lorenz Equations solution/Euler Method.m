
close all
clear all
sigma=10; rho=28; beta=8/3;

fun = @(t,y)[-sigma*y(1)+sigma*y(2); -y(1)*y(3)+rho*y(1)-y(2); y(1)*y(2)-beta*y(3)];

x = [10 10 10 ]  ;
t= [0 100 25000] ;

t_init=t(1);
t_final=t(2);
n_interval=t(3);
h =(t_final-t_init)/n_interval;

t=t_init; % initialisng the time value
x=x(:); % initialise the values of x,y,z 
sol=[]; % array to store the values of t,x,y,z

while t<t_final

k(:,1)=h*feval(fun,t,x);

 
x=x+k(:,1) ;
t=t+h;
y=[x;t];
sol=cat(1,sol,y');
end
 
t2=sol(:,4);
x2=sol(:,1);
y2=sol(:,2);
z2=sol(:,3);



h=figure(1) ;

subplot(3,1,1)

plot(t2,x2)
title('The approximation of X,Y,Z using the Fourth order Ranga Kutta Gill')
ylabel('X','fontsize',16,'fontweight','bold')
subplot(3,1,2)
plot(t2,y2)
ylabel('Y','fontsize',16,'fontweight','bold')
subplot(3,1,3)
plot(t2,z2)
xlabel('Time','fontsize',16,'fontweight','bold')
ylabel('Z','fontsize',16,'fontweight','bold')
h=figure(2)

%draw

plot3(y2,x2,z2)
hold on
title('The approximation of X,Y,Z using the Fourth order Ranga Kutta')
xlabel('Y','fontsize',14,'fontweight','bold')
ylabel('X','fontsize',14,'fontweight','bold')
zlabel('Z','fontsize',14,'fontweight','bold')
title('3-D trace path','fontsize',20,'fontweight','bold')



