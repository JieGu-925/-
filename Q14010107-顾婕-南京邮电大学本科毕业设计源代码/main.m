clc;
clear;
data=importdata('C:\Èí¼þ\eclipseMars\workspace\protect\src\main\resources\static\result\data.txt');
D=Adj_Matrix(data);
G=D;
global c
c = max(G(1:end,1))-min(G(1:end,1));
[x,a_id,x2,x3]=Dijkstra(G);
[ansx]=lp_ans(x,x2,x3,a_id);
epsilon1=importdata('C:\Èí¼þ\eclipseMars\workspace\protect\src\main\resources\static\result\epsilon1.txt');
ansx1=ansx+laplace_noise(ansx,epsilon1);
[max_no,max_no]=size(G);

for i=1:1:max_no
    for j=i:1:max_no
        if a_id(i,j)~=0&&G(i,j)~=0
			a_id(i,j)=ansx1(a_id(i,j));
            G(i,j)=abs(a_id(i,j));
            G(j,i)=G(i,j);
		else
            if G(i,j)>0
                G(i,j)=abs(G(i,j)+laplace_noise(G(i,j),1));
                G(j,i)=G(i,j);
            end
        end
    end
end
Edge_add(G);
[Adj,Degree]=Adj_Degree(G);

epsilon2=importdata('C:\Èí¼þ\eclipseMars\workspace\protect\src\main\resources\static\result\epsilon2.txt');

Node_Add(G,Adj,Degree,epsilon2);
Node_del(G,Adj,Degree,epsilon2);
LONG=max(max(G))-min(min(G));
G=G./LONG;
DATA_out(G);