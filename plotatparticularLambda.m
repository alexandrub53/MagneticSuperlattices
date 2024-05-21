clear all
t = cputime;


accuracy=10^(-14);

A=1.0;


x=0
%KM=0.1;
KM=2.0
%KM=2.5
%KM=0.0
for HalfLambda=[1 3 5 8 10 15]
    Lambda=HalfLambda*2;
   x=x+1;
for T=1:300
T
    %this is the right B to use
%LNMO
 Bm=(T-180)/40; %% Note this is different from bulk
% Bm=(T-200)/40;
  Bi=(T-264)/40;
 f=0.4
[ mz ] = MagneticMismatch( A, Bm, Bi , Lambda, accuracy, KM,f);
%Fmin=min(FImin,FMmin);
MT(T)=mean(mz)
MT1(T)=mean(mz(1:HalfLambda));
MT2(T)=mean(mz((HalfLambda+1):Lambda));

%MT1(x,T)=mz(floor(((HalfLambda+1)/2)));
%MT2(x,T)=mz(floor((3*HalfLambda+1)/2));
xy(x,T)=Lambda;
YX(x,T)=T;

if Lambda==2 
    if T==202
    mz11202=mz;
    end
end


if Lambda==6 
    if T==208
    mz33208=mz;
    end
    
end

if Lambda==10 
    if T==220
    mz55220=mz;
    end
end

if Lambda==16 
    if T==234
    mz88234=mz;
    end
end

if Lambda==20 
    if T==239
    mz1010239=mz;
    end
end

if Lambda==30 
    if T==246
    mz1515246=mz;
    end
end




end
end


plot(mz,'-o')

stop

for T=1:199
for HalfLambda=1:20
    Lambda=HalfLambda*2;    
MTd(HalfLambda,T)=MT(HalfLambda,T+1+99)-MT(HalfLambda,T+99);
xyd(HalfLambda,T)=Lambda;
YXd(HalfLambda,T)=T+100;
end
end

%plot((1:300),MT(10,:),'-o')
%set(gca,'FontSize',30)
plot(YXd(4,:),MTd(4,:),'LineWidth',10)
hold on
plot(YXd(5,:),MTd(5,:),'LineWidth',10)
hold on
plot(YXd(6,:),MTd(6,:),'LineWidth',10)
hold on
plot(YXd(7,:),MTd(7,:),'LineWidth',10)
hold on
plot(YXd(8,:),MTd(8,:),'LineWidth',10)
legend('4/4','5/5','6/6','7/7','8/8')
grid on
set(gca,'FontSize',40)
axis([100 300 0 min(MTd(4,:))])
%figure
%contourf(xy,YX,MT)
%set(gca,'FontSize',40)
%colormap('jet');
%xlabel('Lambda')
%ylabel('T')
%axis([0 30 150 300])
%figure

%contourf(xyd,YXd,-MTd,'levels',50)
%set(gca,'FontSize',40)
%colormap('jet');
%xlabel('Lambda')
%ylabel('T')
%axis([0 30 150 250])
%figure
%plot(1:300,MT,'-bo','MarkerSize',30)
%grid on

% % contourf(N,m,Fm)
% % hold on
% % plot(Nm,mm,'mo','MarkerSize',10,'LineWidth',10)
% % xlabel('N')
% % ylabel('m')
% % set(gca,'FontSize',20)
% % 
% % figure
% % contourf(N,m,Fi)
% % hold on
% % plot(Ni,mi,'mo','MarkerSize',10,'LineWidth',10)
% % xlabel('N')
% % ylabel('m')
% % figure
