function dacsd=multiPhase(CH)
datatemp=[CH];
data=1000*detrend(datatemp)/1.2;
N=size(data,2);
dacsd=zeros(1,N);
for k=1:N
    xx=hilbert(data(:,k));
    xr=real(xx);xi=imag(xx);
    th=atan2(xi,xr);
    th_1=th;th_2=th;
    th_1(length(th_1))=[];th_2(1)=[];
    %% 自相关散点图的散度
    for kk=1:length(th_1)
        p=[th_1(kk),th_2(kk)];
        dacsd(1,k)=dacsd(1,k)+distance(p);
    end
end