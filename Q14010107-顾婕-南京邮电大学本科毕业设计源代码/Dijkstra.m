function [x,a_id,x2,x3]=Dijkstra(G)
[max_no,max_no]=size(G);
%endp=max_no;
a_id=zeros(max_no,max_no);
count=1;
x=[];
x2=[];
x3=[];
n=size(G,1); 
Start=randperm(max_no,1);
for start=Start
	u=start;
	parent(1:n)=0; 
	visited(1:n)=0;
	distance(1:n)=inf;
	distance(start)=0;
	visited(start)=1;
	for i=1:n-1
		id=find(visited==0);
		tmp=1;
		for v = id
			if distance(u)+G(u,v)<distance(v)
				distance(v) = distance(u)+G(u,v);
				a_id(u,v)=count;
				if parent(v)~=0
					x2(count)=distance(u)-distance(parent(v));%约束类型1
				end
				x(count,tmp)=distance(v)-distance(u);%约束类型2
				tmp=tmp+1;
				count=count+1;
				parent(v)=u;
			else
				if G(u,v)~=inf&&distance(v)~=inf
					x3(count,tmp)=distance(v)-distance(u);%约束类型3
				end
				tmp=tmp+1;
				count=count+1;
			end
		end
		
		temp=distance;
		temp(visited==1)=inf;
		[t,u]=min(temp);
		visited(u)=1;
	end
end


