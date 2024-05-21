function [ mz ,FMmin] = MagneticMismatch( A, Bm, Bi , Lambda, accuracy, KM,f)
%function that takes the chi_m^-1, coupling constant lambda between
%magnetic and charge order parameter, A,B for magnetism, and gives the Free
%energy vs m and N, as well as their minimum values on this 2D grid.
%alpha=0.01;
m=2.0;
diff=100;
diff2=100;
V=[];

mzm=[];
for k=1:(Lambda/2)
    mzm=[mzm ; m];
end
mzi=[];
for k=1:(Lambda/2)
    mzi=[mzi ; m];
end


onez=[];
for k=1:(Lambda/2)
    onez=[onez; 1];
end

zeroez=[];
for k=1:(Lambda/2)
    zeroez=[zeroez; 0];
end




V=[mzm; mzi]; 


%for i=1:10
while abs(diff)>accuracy 
dF= [A*mzm.^3+Bm*mzm; f*(A*mzi.^3+Bi*mzi)] ;
dF=dF+ [ KM*(2*[mzm; mzi]-((circshift([mzm; mzi],1)+circshift([mzm ; mzi],-1)))) ];

ddF=[  diag(3*A*mzm.^2+Bm)  diag(zeroez) ;
       diag(zeroez) f*diag(3*A*mzi.^2+Bi)] ;

ddF=ddF+[KM*(2*diag([onez; onez])-(circshift(diag([onez; onez]),1)+circshift(diag([onez; onez]),-1)))] ;
      
steps=inv(ddF)*dF;
V=V-steps;
mzm=V((1):(1/2*Lambda));
mzi=V((1/2*Lambda+1):(Lambda));
diff=sum(abs(steps).^2);
end
Nz=V(1:Lambda);
mz=V((1):(1*Lambda));
%FMmin=sum((A/4)*mzm.^4+(A/4)*mzi.^4+(Bm/2)*mzm.^2+(Bi/2)*mzi.^2);
%FMmin=FMmin+(KM/2)*sum(([mzm ; mzi]-circshift([mzm ; mzi],1)).^2);

end


