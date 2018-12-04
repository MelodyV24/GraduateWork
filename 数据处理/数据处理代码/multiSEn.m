function se=multiSEn(X,R,m)
[~,fbg]=size(X);
for cl=1:fbg
       X_cl=X(:,cl);
  % this function is referenced by original code in physionet.org
        nlin=length(X_cl);
        % m=2;
        nl=nlin-m;
        r=R*std(X_cl);
        cont=zeros(m+1);
        for i=1:nl
            for l=(i+1):nl
                k=0;
                while k<m && abs(X_cl(i+k)-X_cl(l+k))<=r
                    k=k+1;
                    cont(k)=cont(k)+1;
                end
                if k==m && abs(X_cl(i+m)-X_cl(l+m))<=r
                    cont(m+1)=cont(m+1)+1;
                end
            end
        end
        if cont(m+1)==0||cont(m)==0
            se(cl)=-log(double(1/(nl*(nl-1))));
        else
            se(cl)=-log(double(cont(3)/cont(2)));
        end
end