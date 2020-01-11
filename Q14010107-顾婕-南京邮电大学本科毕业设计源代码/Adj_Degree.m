%Adj(i,:)是节点i的邻接节点的序号
%Degree(i)是节点i的度�?
%Del中存放的是要删除的节点的序号

function [Adj,Degree]=Adj_Degree(G)
	G(G==inf)=0;
	[num_node,~]=size(G);
    Adj=zeros(num_node,num_node);
    Degree=sum(G~=0,2);
	for i=1:num_node
        Adj(i,1:Degree(i))=find(G(i,:));
    end
end