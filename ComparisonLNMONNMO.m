clear all
t = cputime;


accuracy=10^(-14);

A=1.0;


clear all
t = cputime;


accuracy=10^(-14);

A=1.0;


x=0
%KM=0.1;
KM=2.0
%KM=0.0
for HalfLambda=1:30
    Lambda=HalfLambda*2;
   x=x+1;
for T=1:300
T;
    %this is the right B to use
%LNMO
 Bm=(T-190)/40; %% Note this is different from bulk
% Bm=(T-200)/40;
  Bi=(T-264)/40;
 f=0.4;
[ mz ] = MagneticMismatch( A, Bm, Bi , Lambda, accuracy, KM,f);
%Fmin=min(FImin,FMmin);
MT(x,T)=mean(mz);
MT1(x,T)=mean(mz(1:HalfLambda));
MT2(x,T)=mean(mz((HalfLambda+1):(Lambda)));
xy(x,T)=Lambda;
YX(x,T)=T;

if HalfLambda==1
    if T==225
    storeM1=mz;
    end
end

if HalfLambda==3
    if T==225
    storeM3=mz;
    end
end


if HalfLambda==5
    if T==225
    storeM5=mz;
    end
end

if HalfLambda==8
    if T==225
    storeM8=mz;
    end
end

if HalfLambda==10
    if T==225
    storeM10=mz;
    end
end

if HalfLambda==15
    if T==225
    storeM15=mz;
    end
end


end
end

for T=1:299
for HalfLambda=1:30
    Lambda=HalfLambda*2;    
MTd(HalfLambda,T)=MT(HalfLambda,T+1)-MT(HalfLambda,T);
xyd(HalfLambda,T)=Lambda;
YXd(HalfLambda,T)=T;
end
end

for T=1:299
for HalfLambda=1:30
    Lambda=HalfLambda*2;    
MTd1(HalfLambda,T)=MT1(HalfLambda,T+1)-MT1(HalfLambda,T);
MTd2(HalfLambda,T)=MT2(HalfLambda,T+1)-MT2(HalfLambda,T);
xyd(HalfLambda,T)=Lambda;
YXd(HalfLambda,T)=T;
end
end

%plot((1:300),MT(10,:),'-o')
%set(gca,'FontSize',30)
HL=5
plot(YXd(HL,:),MTd(HL,:),'-o','LineWidth',10)
hold on
plot(YXd(HL,:),MTd1(HL,:),'-o','LineWidth',4)
grid on
plot(YXd(HL,:),MTd2(HL,:),'-o','LineWidth',4)
set(gca,'FontSize',40)
legend('Mean','Material 1','Material 2')
%axis([100 300 0 min(MTd(4,:))])


