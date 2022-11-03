
dt = 0.001; %time step
dx = 0.1; %step in x direction
dy = 0.1; %step in x direction

t = 0:dt:15; %time interval (changable due to your desighn)
x = 0:dx:1;  %x-axis interval (changable due to your desighn)
y = 0:dy:1;  %x-axis interval (changable due to your desighn)

lamda=dt/(2*dx^2);
a=(1+2*lamda)*ones(1,13);%define matrix A
A=diag(a); %make matrix a diagonal one
N = length(x)+2; %interval (changable due to your desighn)
 for i=1:N-1
     A(i+1,i)=-lamda;
     A(i,i+1)=-lamda;
 end
A(1,1)=1+2*lamda; 
A(1,2)=-lamda; 
A(13,12)=-lamda; 
A(13,13)=1+2*lamda; 
T=[]; %Dynamic size array
a2=lamda*ones(1,13);
A2=diag(a);
for j=1:N-3
     A2(j+3,j)=(1-2*lamda);
     A2(j,j+3)=(1-2*lamda);
end
T(:,:,:) = zeros(length(t),length(y)+2,length(x)+2); %define initial condition 
Tstar=zeros(length(x),length(y));
Tall=zeros(length(x),length(y));
for k=2:length(t)
    for j=2:length(x)-1
        fx=(l-2*lamda)*T(:,j,k-1)+lamda*T(:,j-1,k-1)+lamda*T(:,j+1,k-1);
        fx(1)=0;
        fx(end)=0;
        Tstar(j,:)=(A\fx)';
    end
    for i=2:length(y)-1
        fy=(1-2*lamda)*Tstar(i,:)+lamda*Tstar(i-1,:)+lamda*Tstar(i+1,:);
        fy(:,1)=0;
        fy(:,end)=100*sin(pi*x(i));
    end
    Tall(:,j)=A\fy;
    T(:,:,k)=Tall(:,:);
end