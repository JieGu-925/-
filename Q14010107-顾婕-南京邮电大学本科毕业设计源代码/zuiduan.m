function [distance]=zuiduan(D,start,endp)
a=D;
[max_row, max_col] = size(D);
for i=1:1:max_row
    for j=1:1:max_col
        if a(i,j)==0
            a(i,j)=inf;
            a(j,i)=inf;
        end
    end
end
a_id=a;
a_id(:,:)=0;
n=size(a,1); u=start;
parent(1:n)=0; visited(1:n)=0;
distance(1:n)=inf;
distance(start)=0;
visited(start)=1;
count=0;
for i=1:n-1
    id=find(visited==0);
    for v = id
        if distance(u)+a(u,v)<distance(v)
            distance(v) = distance(u)+a(u,v);
            a_id(u,v)=count;
            count=count+1;
            parent(v)=u;
        end
    end
    temp=distance;
    temp(visited==1)=inf;
    [t,u]=min(temp);
    visited(u)=1;
end

path = [];
if parent(endp)~=0
    path = [endp];
    t =endp;
    while t~=start
        p=parent(t);
        path = [p path];
        t=p;
    end
end
distance=distance(endp);
end