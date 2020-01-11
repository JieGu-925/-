
function [ansx]=lp_ans(x,x2,x3,a_id)
m=size(x,1);
ub=1./zeros(m);
n=size(x3,1);
lb=zeros(n);

%[m,n]=size(x);
A=[];

for i=1:1:m
	tmp=x(i,:);
	if sum(tmp)~=0
		ub(i)=tmp(find(tmp>0));
	end
end
for i=1:1:n
    tmp=x3(i,:);
    lb(i)=max(tmp); 
    if ub(i)<lb(i)
		lb(i)=0;
    end
end


%for i=1:1:length(x2)
%   A(i,i)=-1;
%   A(i,i+1)=1;
%   b(i)=x2(i);
%end
g=max(max(a_id));
f=ones(g,1);


[ansx,fval,exitflag,output,lambda]=linprog(f,[],[],[],[],lb,ub);
end

