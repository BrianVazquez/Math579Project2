function [ A ] = backProj( S, theta, t )
M = length(t);
N = length(theta);
A=zeros(M,M);
dt=t(2)-t(1);

for i=1:M
    for j=1:M
        sum=0;
        for k=1:N
            t_k = t(i)*sin(theta(k))+t(j)*cos(theta(k));
            ind=find(t==t_k);
            if isempty(ind)==0
                Svalue = S(ind,k);
            elseif t_k <=t(1)

                 Svalue= 0;
            elseif t_k>t(M)
                Svalue=0;

            else
                lower=find(t <=t_k);
                k1=lower(end);
                
                upper=find(t>=t_k);
                k2=upper(1);
                
                alpha=(t_k - t(k1))/(t(k2)-t(k1));
                Svalue = alpha*S(k2,k)+(1-alpha)*S(k1,k);
                
            end
          
            sum=sum+Svalue;
        end

        A(i,j)=sum/N;
    end
end

end